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

    implicit none

    integer(int32) :: i, n

    integer(int32), parameter :: im = 100 ! grid size in x
    integer(int32), parameter :: nm = 5000 ! number of time steps

    real(real32), parameter :: dt = 0.02 ! time step [s]
    real(real32), parameter :: dx = 1 ! grid spacing [m]

    real(real32), parameter :: g = 9.81 ! gravitational accelration (m/s^2)

    real(real32), dimension(im) :: h, hmean, u


    ! initial position & shape of blob
    integer(int32), parameter :: ipos = 25
    real(real32), parameter :: decay = 0.02

    ! initialize a gaussian blob centered at i = ipos = 25
    do i = 1, im
        h(i) = exp(-decay * (i - ipos)**2)
    end do

    ! set initial speed to zero
    u = 0

    ! set mean water height to 10 m
    hmean = 10

    ! write initial state to screen
    write(output_unit, *) 0, h


    time_loop: do n = 1, nm

        ! update u at next time step
        u = u - (u * diff(u) + g * diff(h)) / dx * dt

        ! update h at next time step
        h = h - diff(u * (hmean + h)) / dx * dt

        ! write output state to screen
        write(output_unit, *) n, h

    end do time_loop

end program tsunami

