! Exercise 1, p. 62
!
! Calculating the temperature due to cold front passage

program ex_1

    use iso_fortran_env, only: real32, output_unit

    implicit none

    real(real32), parameter :: temp1 = 12.  ! temperature in Atlanta (°C)
    real(real32), parameter :: temp2 = 24.  ! temperature in Miami (°C)

    real(real32), parameter :: dx = 960.    ! distance between Atlanta & Miami (km)
    real(real32), parameter :: c = 20.      ! speed in km/h

    real(real32), parameter :: dt = 24.     ! time (h)

    real(real32) :: temp_result

    ! update temperature in Miami
    temp_result = temp2 - c * (temp2 - temp1) / dx * dt

    ! print result to screen
    write(output_unit, *) "Temperature after", dt, " hours is" , temp_result, "degrees."

end program ex_1
