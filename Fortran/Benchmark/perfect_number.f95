! perfect_number.f95
! Calculate Perfect numbers
!
! vim: set ft=fortran sw=8 ts=8 :

      module perfect_number

              integer, parameter :: pr = selected_int_kind(18)

      contains

              logical function is_perfect (n)

                      implicit none

                      integer :: n, i
                      integer :: s = 0

                      do i = 1, (n-1)
                              if (modulo(n, i) == 0) s = s + i
                      end do

                      write (*,*) "Summe: ", s

                      is_perfect = (s == n)

              end function is_perfect

      end module perfect_number

