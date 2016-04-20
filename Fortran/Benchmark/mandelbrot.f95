! mandelbrot.f95
! Calculate Mandelbrot sets
!
! vim: set ft=fortran sw=2 ts=2 :

module mandelbrot
  implicit none
  save

  real, parameter :: r_max = 2.0

contains
  ! TODO: function defs

  integer function pixel_value (z, n_max)
    implicit none

    complex, intent( in ) :: z
    integer, optional, intent( in ) :: n_max

    complex :: z1
    integer :: n, n_end

    if ( present(n_max) ) then
      n_end = n_max
    else
      n_end = 256
    end if
    z1 = 0

    do n = 0, n_end
      if (abs(z) > r_max) then
        pixel_value = n
        return
      end if
      z1 = z1**2 + z
    end do

    pixel_value = 0

  end function pixel_value


end module mandelbrot

