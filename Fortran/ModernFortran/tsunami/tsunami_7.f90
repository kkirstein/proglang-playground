! vim: set ft=fortran sw=4 ts=4:

program tsunami

    ! Tsunami simulator
    !
    ! This version solves the linearized 1-d advection equation:
    !
    !   du/dt = - u du/dx - g dh/dx
    !
    !   dh/dt = -d(hu)/dx
    !

    use iso_fortran_env, only: int32, real32, output_unit
    use mod_diff, only: diff => diffc
    use mod_parallel, only: tile_neighbors, tile_indices

    implicit none

    integer(int32) :: i, n

    integer(int32), parameter :: grid_size = 100 ! grid size in x
    integer(int32), parameter :: num_time_steps = 5000 ! number of time steps

    ! initial position & shape of blob
    integer(int32), parameter :: ipos = 25
    real(real32), parameter :: decay = 0.02

    real(real32), parameter :: dt = 0.02 ! time step [s]
    real(real32), parameter :: dx = 1 ! grid spacing [m]

    real(real32), parameter :: g = 9.81 ! gravitational accelration (m/s^2)

    real(real32), allocatable :: h(:)[:], u(:)[:]
    real(real32), allocatable :: h_init(:)[:], gather(:)[:]
    real(real32), allocatable :: hmean(:)

    integer(int32) :: neighbors(2)  ! left & right neighbor indices
    integer(int32) :: left, right

    integer(int32) :: indices(2)
    integer(int32) :: is, ie    ! global tile indices
    integer(int32) :: ils, ile  ! local tile indices w/o halo
    integer(int32) :: ims, ime  ! local tile indices including halo

    ! setup local arrays
    if (mod(grid_size, num_images()) /= 0) &
        stop "grid_size must be divisible by number of images"
    neighbors = tile_neighbors()
    left = neighbors(1)
    right = neighbors(2)

    indices = tile_indices(grid_size)
    is = indices(1)
    ie = indices(2)    ! TODO: to be checked
    ils = 1
    ile = grid_size / num_images()
    ims = ils - 1
    ime = ile + 1

    allocate(h(ims:ime)[*])
    allocate(u(ims:ime)[*])
    allocate(hmean(ims:ime))

    allocate(h_init(grid_size)[*])
    allocate(gather(grid_size)[*])

    ! initialize a gaussian blob centered at i = ipos = 25
    if (this_image() == 1) then
        do i = 1, grid_size
            h_init(i) = exp(-decay * (i - ipos)**2)
        end do
    end if
    sync all

    h(ils:ile) = h_init(is:ie)[1]
    ! FIXME: update halos, too
    sync all

    ! set initial speed to zero
    u = 0

    ! set mean water height to 10 m
    hmean = 10

    ! write initial state to screen
    if (this_image() == 1) write(output_unit, *) 0, h_init


    time_loop: do n = 1, num_time_steps

        ! update halo from inital set or previous time step
        h(ime)[left] = h(ils)
        h(ims)[right] = h(ile)
        sync all

        ! update u at next time step
        u = u - (u * diff(u) + g * diff(h)) / dx * dt

        sync all

        ! update halo for velocity
        u(ime)[left] = u(ils)
        u(ims)[right] = u(ile)
        sync all

        ! update h at next time step
        h = h - diff(u * (hmean + h)) / dx * dt

        ! copy solution of current time stamp
        gather(is:ie)[1] = h(ils:ile)
        sync all

        ! write output state to screen
        if (this_image() == 1) write(output_unit, *) n, h

    end do time_loop

end program tsunami

