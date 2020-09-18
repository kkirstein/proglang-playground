! vim: set ft=fortran sw=4 ts=4 :

! image.f95
! Image struct and related methods
!

module image
    implicit none

    type :: ImageRGB
        integer :: width, height
        integer, dimension(:,:,:), allocatable :: data

    contains
        procedure, pass(self) :: set
        procedure, pass(self) :: get
        procedure, pass(self) :: write_ppm

    end type ImageRGB

    interface ImageRGB
        module procedure :: imagergb_constructor
    end interface ImageRGB

contains
    type(ImageRGB) function imagergb_constructor(width, height) result(img)
        use ISO_FORTRAN_ENV, only: ERROR_UNIT

        integer, intent( in ) :: width, height

        integer, dimension(:,:,:), allocatable :: img_data
        integer :: stat

        allocate(img_data(3, width, height), stat=stat)
        if (stat /= 0) then
            write (ERROR_UNIT,*) "Error allocating image data: ", stat
            stop -1
        end if
        img % width = width
        img % height = height
        img % data = img_data

    end function imagergb_constructor

    subroutine set(self, x, y, pix)
        ! sets the pixel values at given x/y position

        class(ImageRGB), intent( inout ) :: self
        integer, intent( in ) :: x, y
        integer, dimension(3), intent(in ) :: pix

        self % data(:, x, y) = pix

    end subroutine set


    function get(self, x, y) result(pixel)
        ! returns the pixel values from given x/y posiiton

        class(ImageRGB), intent( in ) :: self
        integer, intent( in ) :: x, y
        integer, dimension(3) :: pixel

        pixel = self % data(:, x, y)

    end function get

    subroutine write_ppm (self, file_name)
        ! write image data as ppm-file
        use ISO_FORTRAN_ENV, only: ERROR_UNIT

        class(ImageRGB), intent( in ) :: self
        character(:), allocatable, intent( in ) :: file_name

        integer :: stat
        integer :: fileunit

        ! open ppm file for write
        open(newunit=fileunit, file=file_name, action='write', iostat=stat)
        if (stat /= 0) then
            write (ERROR_UNIT,*) "Could not open file ", file_name
            stop -1
        end if

        ! header
        write (fileunit, '(a)') "P3"
        write (fileunit, '(i4, 1x, i4, 1x, i3)') self % width, self % height, 255

        ! pixel data
        write (fileunit, *) self % data

        ! close ppm file
        close (fileunit)

    end subroutine write_ppm


end module image

