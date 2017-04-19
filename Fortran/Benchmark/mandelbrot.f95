! mandelbrot.f95
! Calculate Mandelbrot sets
!
! vim: set ft=fortran sw=2 ts=2 :

module mandelbrot
  implicit none
  save

  real, parameter :: r_max = 2.0

contains

  ! calculate loop count for a (complex) pixel
  pure integer function pixel_value (z, n_max)
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

  ! convert pixel value to RGB
  pure function to_rgb (n)
    use color_map
    implicit none

    integer, dimension(3) :: to_rgb
    integer, intent( in ) :: n

    to_rgb = cm(:,n+1)

  end function to_rgb

  ! generate mandelbrot set
  function image(width, height, x_center, y_center, pixel_size)
    use ISO_FORTRAN_ENV, only: ERROR_UNIT
    implicit none

    integer, dimension(:,:,:), allocatable :: image
    integer, intent( in ) :: width, height
    real, intent( in ) :: x_center, y_center
    real, intent( in ) :: pixel_size

    integer :: stat, x, y
    complex :: offset, coord

    allocate(image(3, width, height), stat=stat)
    if (stat /= 0) then
      write (ERROR_UNIT,*) "Error allocating data: ", stat
      stop -1
    end if

    offset = cmplx(x_center - 0.5*pixel_size*width, &
    y_center + 0.5*pixel_size*height)

    do x = 1, width
      do y = 1, height
        coord = offset + cmplx(x*pixel_size, -y*pixel_size)
        image(:,x,y) = to_rgb(pixel_value(coord, 256))
      end do
    end do

  end function image

  ! write image data as ppm-file
  subroutine write_ppm (width, height, image, file_name)
    use ISO_FORTRAN_ENV, only: ERROR_UNIT
    implicit none

    integer, intent( in ) :: width
    integer, intent( in ) :: height
    integer, dimension(:,:,:), intent( in ) :: image
    character(:), allocatable, intent( in ) :: file_name

    integer :: stat
    integer :: x, y

    ! open ppm file for write
    open(99, file=file_name, action='write', iostat=stat)
    if (stat /= 0) then
      write (ERROR_UNIT,*) "Could not open file ", file_name
      stop -1
    end if

    ! header
    write(99,111) "P3"
    write(99,222) width, height, 256

    ! pixel data
    do x = 1, width
      do y = 1, height
        write (99,333) image(:,x,y)
      end do
    end do

    ! close ppm file
    close (99)

    111 format (A)
    222 format (I4, 1X, I4, 1X, I3)
    333 format (I3, 1X, I3, 1X, I3)

  end subroutine write_ppm

end module mandelbrot
