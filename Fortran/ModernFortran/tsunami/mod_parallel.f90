module mod_parallel

    ! Module that provides convinience procedures for parallel execution

    use iso_fortran_env, only: int32

    implicit none

    private
    public :: tile_indices, tile_neighbors_1d

    interface tile_indices
        module procedure tile_indices, tile_indices_1d, tile_indices_2d
    end interface tile_indices
contains

    pure function denominators(n)
        ! Returns denominators of an integer number,
        ! used internally in 'num_tiles'
        integer(int32), intent(in) :: n
        integer(int32), allocatable :: denominators(:)
        integer(int32) :: i

        denominators = [integer(int32) ::]
        do i = 1, n
            if (mod(n, i) == 0) denominators = [denominators, i]
        end do
    end function denominators


    pure function num_tiles(n)
        ! Returns the optimal number of 2-D images, given the total
        ! number of images
        integer(int32), intent(in) :: n
        integer(int32) :: num_tiles(2)
        integer(int32), allocatable :: denoms(:)
        integer(int32), allocatable :: dim1(:), dim2(:)
        integer(int32) :: i, j, n1, n2

        denoms = denominators(n)

        dim1 = [integer(int32) ::]
        dim2 = [integer(int32) ::]
        do j = 1, size(denoms)
            do i = 1, size(denoms)
                if (denoms(i) * denoms(j) == n) then
                    dim1 = [dim1, denoms(i)]
                    dim2 = [dim2, denoms(j)]
                end if
            end do
        end do

        num_tiles = [dim1(1), dim2(1)]
        ! check for 'squareness'
        do i = 2, size(dim1)
            n1 = norm2([dim1(i), dim2(i)] - sqrt(real(n)))
            n2 = norm2(num_tiles - sqrt(real(n)))
            if (n1 < n2) num_tiles = [dim1(i), dim2(i)]
        end do
    end function num_tiles


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
        ! Returns the start and end indices of a parallel image, in 1-D
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
        ! Returns the start and end indices of a parallel image in 2-D
        integer, intent(in) :: dims(2)
        integer(int32) :: indices(4)
        integer(int32) :: tiles(2), tiles_ij(2)

        tiles = num_tiles(num_images())
        tiles_ij = tile_n2ij(this_image())

        indices(1:2) = tile_indices_1d(dims(1), tiles_ij(1), tiles(1))
        indices(3:4) = tile_indices_1d(dims(2), tiles_ij(2), tiles(2))
    end function tile_indices_2d


    pure function tile_neighbors_1d() result(neighbors)
        ! Returns the neighbor image indices, including wrap around
        ! for 1-D decomposition
        integer :: neighbors(2)
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

        neighbors = [left, right]
    end function tile_neighbors_1d

end module mod_parallel
