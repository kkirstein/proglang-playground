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
    integer :: i, s, limit

    s = 0
    limit = int(sqrt(real(n)))
    do i = 1, (n-1)
    ! do i = 2, limit
      if (modulo(n, i) == 0) then
        s = s + i
      end if
    end do

    is_perfect = (s == n)

  end function is_perfect


  subroutine perfect_numbers (n, res)
    use ISO_FORTRAN_ENV, only: ERROR_UNIT
    implicit none

    integer, intent( in ) :: n
    integer, dimension(:), allocatable, intent( out ) :: res

    logical, dimension(:), allocatable :: flags
    integer :: s, i, c, idx

    ! flag perfect numbers
    allocate(flags(1:n), stat=s)
    if (s /= 0) then
      write (ERROR_UNIT,*) "Error allocating data"
      stop -1
    end if
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
    if (s /= 0) then
      write (ERROR_UNIT,*) "Error allocating data"
      stop -1
    end if
    idx = 1
    do i = 1, n
      if (flags(i)) then
        res(idx) = i
        idx = idx + 1
      end if
    end do

  end subroutine perfect_numbers

  subroutine to_string(ary, str)
    use ISO_FORTRAN_ENV, only: ERROR_UNIT
    implicit none

    integer, dimension(:), intent( in ) :: ary
    character(:), allocatable, intent( out ) :: str
    character(5) :: num_str

    integer :: len, s, i

    len = size(ary)

    allocate(character(8*len) :: str, stat=s)
    if (s /= 0) then
      write (ERROR_UNIT,*) "Error allocating data"
      stop -1
    end if

    ! fill-in output string
    str = ""
    do i = 1, (len-1)
      write(num_str, '(I5)') ary(i)
      str = str // num_str // ", "
    end do
    write(num_str, '(I5)') ary(len)
    str = str // num_str

  end subroutine to_string

end module perfect_number
