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

        integer :: tile_start, tile_end, tile_size, offset
        integer :: this, num

        this = this_image()
        num = num_images()

        tile_size = sz / num
        tile_start = tile_size * (this - 1) + 1
        tile_end = tile_start + tile_size - 1

        ! distribute remainder equally on tiles
        offset = num - mod(sz, num)
        if (this > offset) then
            tile_start = tile_start + this - offset - 1
            tile_end = tile_end + this - offset
        end if

        res = [tile_start, tile_end]

    end function tile_indices


end module mod_parallel

