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

    real(real32), parameter :: dt = 1.      ! time increment (h)

    real(real32), dimension(8) :: timestamps = [6, 12, 18, 24, 30, 36, 42, 48]
    real(real32), dimension(8) :: result

    integer(int32) :: i

    ! update temperature in Miami
    result = update_temp(temp1, temp2, c, dx, timestamps)

    ! print result to screen
    do i = 1, 8
        write(output_unit, *) "Temperature after", timestamps(i), " hours is" , result(i), "degrees."
    end do

    contains

        real(real32) pure elemental function update_temp(temp1, temp2, c, dx, dt)
            real(real32), intent(in) :: temp1, temp2, c, dx, dt

            update_temp = temp2 - c * (temp2 - temp1) / dx * dt
        end function update_temp
            

end program ex_2
