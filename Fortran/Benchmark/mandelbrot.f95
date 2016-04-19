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

  real function pixel_value (z)

    complex, intent( in ) :: z

    pixel_value = 2.0
  end function pixel_value


end module mandelbrot

