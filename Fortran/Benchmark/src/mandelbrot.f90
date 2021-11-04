! vim: set ft=fortran sw=4 ts=4 :

! mandelbrot.f95
! Calculate Mandelbrot sets
!

module mandelbrot
    use image, only: ImageRGB, pixel_kind
    implicit none
    private

    public :: create, create_omp

    real, parameter :: r_max = 2.0

contains

    ! calculate loop count for a (complex) pixel
    integer function pixel_value (z, n_max)

        complex, intent( in ) :: z
        integer, optional, intent( in ) :: n_max

        complex :: z1
        integer :: n, n_end

        if ( present(n_max) ) then
            n_end = n_max
        else
            n_end = 255
        end if
        z1 = 0

        do n = n_end, 0, -1
            if (abs(z1) > r_max) then
                pixel_value = n
                !write (*, *) n
                return
            end if
            z1 = z1**2 + z
        end do

        pixel_value = 0

    end function pixel_value

    ! calculate RGB for pixel value
    pure function calc_rgb(n)
        integer, intent(in) :: n
        integer(kind=pixel_kind), dimension(3) :: calc_rgb

        calc_rgb = [5 * mod(n, 15), 32 * mod(n, 7), 8 * mod(n, 31)]

    end function calc_rgb

    ! generate mandelbrot set (OpenMP version)
    function create_omp(width, height, x_center, y_center, pixel_size) result(img)
        use image

        !integer, dimension(:,:,:), allocatable :: image
        type(ImageRGB) :: img
        integer, intent( in ) :: width, height
        real, intent( in ) :: x_center, y_center
        real, intent( in ) :: pixel_size

        integer :: x, y
        complex :: offset, coord

        img = ImageRGB(width, height)

        offset = cmplx(x_center - 0.5*pixel_size*width, &
            y_center + 0.5*pixel_size*height)

        !$omp parallel do private(y, x, coord)
        do y = 1, height
            do x = 1, width
                coord = offset + cmplx(x*pixel_size, -y*pixel_size)
                call img%set(x, y, calc_rgb(pixel_value(coord, 255)))
            end do
        end do
        !$omp end parallel do

    end function create_omp

    ! generate mandelbrot set
    function create(width, height, x_center, y_center, pixel_size) result(img)
        use image

        !integer, dimension(:,:,:), allocatable :: image
        type(ImageRGB) :: img
        integer, intent( in ) :: width, height
        real, intent( in ) :: x_center, y_center
        real, intent( in ) :: pixel_size

        integer :: x, y
        complex :: offset, coord

        img = ImageRGB(width, height)

        offset = cmplx(x_center - 0.5*pixel_size*width, &
            y_center + 0.5*pixel_size*height)

        do y = 1, height
            do x = 1, width
                coord = offset + cmplx(x*pixel_size, -y*pixel_size)
                call img % set(x, y, calc_rgb(pixel_value(coord, 255)))
            end do
        end do

    end function create

end module mandelbrot
