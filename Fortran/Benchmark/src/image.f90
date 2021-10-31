! vim: set ft=fortran sw=4 ts=4 :

! image.f90
! Image struct and related methods
!

module image
    use, intrinsic :: ISO_Fortran_env, only: ERROR_UNIT
    use, intrinsic :: ISO_C_Binding, only: c_ptr, c_int, c_null_char
    use stbi, only: stbi_write_png
    implicit none
    private

    public ImageRGB

    type :: ImageRGB
        integer :: width, height
        integer(kind=1), dimension(:,:,:), allocatable :: data

    contains
        procedure, pass(self) :: set
        procedure, pass(self) :: get
        procedure, pass(self) :: write_ppm
        procedure, pass(self) :: write_png

    end type ImageRGB

    interface ImageRGB
        module procedure :: imagergb_constructor
    end interface ImageRGB

contains

    type(ImageRGB) function imagergb_constructor(width, height) result(img)
        integer, intent(in) :: width, height

        integer(kind=1), dimension(:,:,:), allocatable :: img_data
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

        class(ImageRGB), intent(inout) :: self
        integer, intent(in) :: x, y
        integer(kind=1), dimension(3), intent(in) :: pix

        self%data(:, x, y) = pix

    end subroutine set


    function get(self, x, y) result(pixel)
        ! returns the pixel values from given x/y posiiton

        class(ImageRGB), intent(in) :: self
        integer, intent(in) :: x, y
        integer(kind=1), dimension(3) :: pixel

        pixel = self % data(:, x, y)

    end function get

    subroutine write_ppm (self, file_name)
        ! write image data as ppm-file
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

    !> write_png
    !> writes given image struct as PNG file
    subroutine write_png(self, file_name)
        class(ImageRGB), intent(in) :: self
        character(:), allocatable, intent(in) :: file_name

        integer(kind=c_int) :: res

        res = stbi_write_png(file_name // c_null_char, self%width, self%height, 3, self%data, 3 * self%width)
        if (res /= 0) then
            write (ERROR_UNIT,*) "Could not write PNG file: ", res
            stop -1
        end if

    end subroutine write_png

end module image

