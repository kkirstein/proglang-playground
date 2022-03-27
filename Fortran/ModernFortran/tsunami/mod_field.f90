module mod_field

    ! Module to provide a derived type for a field entity

    use iso_fortran_env, only: int32, real32
    use mod_parallel, only: tile_indices

    implicit none

    private
    public :: Field

    type :: Field
        character(len=:), allocatable :: name
        integer(int32) :: dims(2), lb(2), ub(2)
        real(real32) , allocatable :: data(:,:)
    contains
        procedure, pass(self) :: gather
        procedure, pass(self) :: init_gaussian
        procedure, pass(self) :: sync_edges
        procedure, pass(self) :: write
    end type Field

    interface Field

        ! TODO: setup contructure
    end interface Field

contains

    type(Field) function field_constructor(name, dims) result(res)
        ! custom constructor for Field instance
        character(len=*), intent(in) :: name
        integer(int32), intent(in) :: dims(2)

        integer(int32) :: indices(4)

        res % name = name
        res % dims = dims

        indices = tile_indices(dims)
        res % lb = indices([1, 3])
        res % ub = indices([2, 4])

        ! allocate data including halos
        allocate(res % data(res % lb(1)-1 : res % ub(1) + 1, &
            res% lb(2) - 1 : res % ub(2) + 1))

        ! initialize to zero
        res % data = 0
    end function field_constructor

    ! TODO: define procedures

end module mod_field
