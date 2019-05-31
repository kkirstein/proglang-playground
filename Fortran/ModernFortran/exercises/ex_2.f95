! Exercise 2, p. 68
!
! Calculating the temperature due to cold front passage

program ex_2

    use iso_fortran_env, only: real32, int32, output_unit

    implicit none

    real(real32), parameter :: temp1 = 12.  ! temperature in Atlanta (°C)
    real(real32), parameter :: temp2 = 24.  ! temperature in Miami (°C)

    real(real32), parameter :: dx = 960.    ! distance between Atlanta & Miami (km)
    real(real32), parameter :: c = 20.      ! speed in km/h

    real(real32), parameter :: dt = 1.     ! time increment (h)

    integer(int32) :: i

    ! update temperature in Miami
    time_loop: do i = 6, 48, 6
        ! print result to screen
        write(output_unit, *) "Temperature after", i*dt, " hours is" , update_temp(temp1, temp2, c, dx, i*dt), "degrees."
    end do time_loop

    contains

        real(real32) function update_temp(temp1, temp2, c, dx, dt)
            real(real32), intent(in) :: temp1, temp2, c, dx, dt

            update_temp = temp2 - c * (temp2 - temp1) / dx * dt
        end function update_temp
            

end program ex_2
