! vim: set ft=fortran sw=4 ts=4:

program tsunami

    ! Tsunami simulator
    !
    ! This version solves the linearized 1-d advection equation:
    !
    !   du/dt + c du/dx = 0
    !
    ! Discretized as:
    !   u^{n+1}_i = u^n_i - c * dt * (u^n{i} - u^n_{n-1}) / dx

    use iso_fortran_env, only: int32, real32, output_unit

    implicit none

    integer(int32) :: i, n

    integer(int32), parameter :: im = 100 ! grid size in x
    integer(int32), parameter :: nm = 100 ! number of time steps

    real(real32), parameter :: dt = 1 ! time step [s]
    real(real32), parameter :: dx = 1 ! grid spacing [m]
    real(real32), parameter :: c = 1 ! phase speed [m/s]

    real(real32) :: du(im), u (im)

    ! initial position & shape of blob
    integer(int32), parameter :: ipos = 25
    real(real32), parameter :: decay = 0.02

    ! initialize a gaussian blob centered at i = ipos = 25
    do i = 1, im
        u(i) = exp(-decay * (i -ipos)**2)
    end do

    ! write initial state to screen
    write(output_unit, *) 0, u

    time_loop: do n = 1, nm

        ! apply the periodic boundary condition
        du(1) = u(1) - u(im)

        ! calculate the difference of u in space
        do concurrent (i = 2:im)
            du(i) = u(i) - u(i-1)
        end do

        ! compute u at next time step
        do concurrent (i = 1:im)
            u(i) = u(i) - c * du(i) / dx * dt
        end do

        ! write output state to screen
        write(output_unit, *) n, u

    end do time_loop

end program tsunami

