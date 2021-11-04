! vim: set ft=fortran sw=4 ts=4 :

! stbi.f90
! Fortran wrapper for the stb_image & stb_image_write
! single source libraries
!

module stbi
    use, intrinsic :: ISO_C_Binding, only: c_ptr, c_int, c_int8_t, c_char
    implicit none
    private

    public :: stbi_write_png

    interface
        integer(kind=c_int) function stbi_write_png (filename, w, h, comp, data, stride) &
                bind(c, name = "stbi_write_png")
            import :: c_int, c_int8_t, c_ptr, c_char
            character(kind=c_char), intent(in)      :: filename(*)
            integer(kind=c_int), intent(in), value  :: w, h, comp, stride
            integer(kind=c_int8_t), intent(in)      :: data(:)
            !integer(kind=c_int) :: stbi_write_png

        endfunction stbi_write_png

    end interface

end module stbi

