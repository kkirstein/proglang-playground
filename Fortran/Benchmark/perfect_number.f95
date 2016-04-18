! perfect_number.f95
! Calculate Perfect numbers
!
! vim: set ft=fortran sw=8 ts=8 :

      module perfect_number

              integer, parameter :: pr = selected_int_kind(18)

      contains

              pure logical function is_perfect (n)

                      implicit none
                      integer, intent( in ) :: n
                      integer :: i, s

                      s = 0
                      do i = 1, (n-1)
                              if (modulo(n, i) == 0) s = s + i
                      end do

                      is_perfect = (s == n)

              end function is_perfect

              subroutine perfect_numbers (n, res)

              implicit none
              integer, intent( in ) :: n
              integer, dimension(:), allocatable, intent( out ) :: res

              integer :: s, i

              allocate(res(1:10), stat=s)

              forall( i = 1:10 ) res(i) = i

              end subroutine perfect_numbers

      end module perfect_number

