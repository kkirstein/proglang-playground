module mod_parallel

    ! Module that provides convinience procedures for parallel execution

    use iso_fortran_env, only: int32

    implicit none

    private
    public :: tile_indices, tile_neighbors

    interface tile_indices
        module procedure tile_indices, tile_indices_1d, tile_indices_2d
    end interface tile_indices
contains

    pure function tile_indices(dims)
        integer, intent(in) :: dims
        integer :: tile_indices(2)
        integer :: offset, tile_size

        ! first guess if dims is divisible by num_images
        tile_size = dims / num_images()

        tile_indices(1) = (this_image() - 1) * tile_size + 1
        tile_indices(2) = tile_indices(1) + tile_size - 1

        ! deal with possible reminder
        offset = num_images() - mod(dims, num_images())
        if (this_image() > offset) then
            tile_indices(1) = tile_indices(1) + this_image()  - offset -1
            tile_indices(2) = tile_indices(2) + this_image() - offset
        end if

    end function tile_indices


    pure function tile_indices_1d(dims, i, n) result(indices)
        integer(int32), intent(in) :: dims, i, n
        integer(int32) :: indices(2)
        integer(int32) :: offset, tile_size

        ! first guess if dims is divisible by num_images
        tile_size = dims / n

        indices(1) = (i - 1) * tile_size + 1
        indices(2) = indices(1) + tile_size - 1

        ! deal with possible reminder
        offset = num_images() - mod(dims, num_images())
        if (i > offset) then
            indices(1) = indices(1) + i  - offset -1
            indices(2) = indices(2) + i - offset
        end if

    end function tile_indices_1d


    pure function tile_indices_2d(dims) result(indices)
        integer, intent(in) :: dims(2)
        integer(int32) :: indices(4)

        ! TODO: tile_indices_2d()
        indices = 0
    end function tile_indices_2d


    pure function tile_neighbors()
        integer :: tile_neighbors(2)
        integer :: left, right

        if (num_images() > 1) then
            left = this_image() -1
            right = this_image() + 1
            if (this_image() == 1) then
                left = num_images()
            else if (this_image() == num_images()) then
                right = 1
            end if
        else
            left = 1
            right = 1
        end if

        tile_neighbors(1) = left
        tile_neighbors(2) = right

    end function tile_neighbors

end module mod_parallel
