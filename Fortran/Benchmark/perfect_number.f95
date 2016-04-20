! perfect_number.f95
! Calculate Perfect numbers
!
! vim: set ft=fortran sw=2 ts=2 :

      module perfect_number
        implicit none
        save

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

          logical, dimension(:), allocatable :: flags
          integer :: s, i, c, idx

          ! flag perfect numbers
          allocate(flags(1:n), stat=s)
          flags = .false.
          c = 0

          !$omp parallel do private(i), schedule(dynamic)
          do i = 1, n
          if (is_perfect(i)) then
            flags(i) = .true.
            c = c + 1
          end if
          end do
          !$omp end parallel do

          ! copy perfect numbers to output array
          allocate(res(1:c), stat=s)
          idx = 1
          do i = 1, n
          if (flags(i)) then
            res(idx) = i
            idx = idx + 1
          end if
          end do

        end subroutine perfect_numbers

      end module perfect_number

