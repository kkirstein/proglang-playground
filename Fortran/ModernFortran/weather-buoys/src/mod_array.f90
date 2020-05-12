! vim: set ft=fortran sw=4 ts=4:

module mod_array

    ! Utilty functions for arrays

    implicit none

    private
    public :: denan, mean

contains

    pure function denan(x)
        ! Given input array x, returns an array
        ! of elements that exclude NaNs.
        use ieee_arithmetic, only: ieee_is_nan

        real, allocatable, intent(in) :: x(:)
        real, allocatable :: denan(:)

        denan = pack(x, .not. ieee_is_nan(x))

    end function denan


    pure real function mean(x)
        ! return mean value of array x.

        real, allocatable, intent(in) :: x(:)

        mean = sum(x) / size(x)

    end function mean

end module mod_array

