module mod_diff

    ! Module that provides finite difference functions.
  
    use iso_fortran_env, only: real32
  
    implicit none
  
    private
    public :: diffc, diffu
  
  contains
  
    pure function diffc(x) result(dx)
      ! Returns a centered difference of a 1-d array,
      ! with periodic boundary conditions.
      real(real32), dimension(:), intent(in) :: x
      real(real32), dimension(:), allocatable :: dx
      integer :: i, idm
  
      idm = size(x)
      allocate(dx(idm))
  
      ! periodic boundary condition
      dx(1) = 0.5*(x(2)-x(idm))
      dx(idm) = 0.5*(x(1)-x(idm-1))
  
      do concurrent(i = 2:idm-1)
        dx(i) = 0.5 * (x(i+1) - x(i-1))
      end do
  
    end function diffc

    pure function diffu(x) result(dx)
    ! Returns an upstream difference of a 1-d array,
    ! with periodic boundary condition.
    real(real32), dimension(:), intent(in) :: x
    real(real32), dimension(:), allocatable :: dx
    integer :: i, idm

    idm = size(x)
    allocate(dx(idm))

    dx(1) = x(1) - x(idm)

    do concurrent(i = 2:idm)
      dx(2:idm) = x(2:idm) - x(1:idm-1)
    end do

  end function diffu

end module mod_diff

