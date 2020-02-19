! fibonacci.f95
! Calculate Fibonacci numbers
!
! vim: set ft=fortran sw=2 ts=2 :

module fibonacci
  implicit none
  save

  integer, parameter :: pr = selected_int_kind(18)

contains

  recursive integer function fib_naive (n) result (res)

    implicit none

    integer :: n

    if (n < 2) then
      res = n
    else
      res = fib_naive (n-2) + fib_naive (n-1)
    end if

  end function fib_naive

  integer (kind=pr) function fib_iter (n)

    implicit none

    integer :: n, i
    integer (kind=pr) :: a, b, tmp

    a = 0_pr
    b = 1_pr

    do i = 1, n
      tmp = b
      b = a + b
      a = tmp
    end do

    fib_iter = a

  end function fib_iter

end module fibonacci
