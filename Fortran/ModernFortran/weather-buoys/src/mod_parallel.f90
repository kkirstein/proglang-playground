! vim: set ft=fortran sw=4 ts=4:

module mod_parallel

    ! Utilty functions for coarrays and parallel execution

    implicit none

    private
    public :: tile_indices

contains

    function tile_indices(sz) result(res)
        integer, intent(in) :: sz
        integer :: res(2)

        integer :: start, stop, len
        integer :: this, num

        this = this_image()
        num = num_images()

        len = sz / num
        start = len * (this - 1) + 1
        stop = len * this

        if (this == num) stop = sz

        res = [start, stop]

    end function tile_indices


end module mod_parallel

