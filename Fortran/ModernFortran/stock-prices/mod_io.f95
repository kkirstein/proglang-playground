! vim: set ft=fortran sw=4 ts=4 :

module mod_io
	
	implicit none

    private
    public :: read_stock
    public :: num_records

contains

    subroutine read_stock(filename, time, open, high, low,&
            close, adjclose, volume)
        character(len=*), intent(in) :: filename
        character(len=:), allocatable, intent(in out) :: time(:)
        real, allocatable, intent(in out) :: open(:), high(:), low(:),&
            close(:), adjclose(:), volume(:)

        integer :: fileunit
        integer :: n, nm

        nm = num_records(filename) - 1

        if (allocated(time)) deallocate(time)
        allocate(character(len=10) :: time(nm))

    end subroutine read_stock


    integer function num_records(fname)
        character(len=255), intent(in) :: fname

    end function num_records

end module

