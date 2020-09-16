! primes.f95
! Calculate prime numbers
!
! vim: set ft=fortran sw=2 ts=2 :

module primes
    implicit none

contains

      pure logical function is_prime (n)

        implicit none
        integer, intent( in ) :: n
        integer :: i, limit

        if (n < 2) then
          is_prime = .false.
        else
          limit = int(sqrt(real(n)))
          do i = 2, limit
            if (modulo(n, i) == 0) then
              is_prime = .false.
              exit
            end if
          end do
        end if

    end function is_prime



end module primes

