! vim: set ft=fortran sw=4 ts=4 :

module mod_arrays

    implicit none

    private
    public :: reverse

contains

    pure function reverse(x)
        real, intent(in) :: x(:)
        real :: reverse(size(x))

        reverse = x(size(x):1:-1)
    end function reverse

end module
