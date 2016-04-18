! benchmark.f
! A selectoin of micro-benchmarks for Fortran
!
! vim: set ft=fortran sw=8 ts=8 :

      program benchmark

              use fibonacci
              use perfect_number

              implicit none

      integer, parameter :: pr2 = selected_int_kind(18)

              integer :: tic, toc, rate
              integer :: res_int
              integer (kind=pr2) :: res_int_pr

              logical :: flag

              call system_clock(count_rate = rate)

              write (*,*) "Fibonacci numbers"
              write (*,*) "================="
              call system_clock(tic)
              res_int = fib_naive(35)
              call system_clock(toc)
              write (*,*) "fib_naive(35) = ", res_int, &
                & " Elapsed time: ", float(toc-tic)/rate * 1000, "ms"

              call system_clock(tic)
              res_int_pr = fib_iter(35)
              call system_clock(toc)
              write (*,*) "fib_iter(35) = ", res_int_pr, &
                & " Elapsed time: ", float(toc-tic)/rate * 1000, "ms"

              call system_clock(tic)
              res_int_pr = fib_iter(1000)
              call system_clock(toc)
              write (*,*) "fib_iter(1000) = ", res_int_pr, &
                & " Elapsed time: ", float(toc-tic)/rate * 1000, "ms"

              write (*,*) ""


              write (*,*) "Perfect numbers"
              write (*,*) "==============="
              flag = is_perfect(6)
              write (*,*) "is_perfect(6) = ", flag
              flag = is_perfect(28)
              write (*,*) "is_perfect(28) = ", flag

              write (*,*) "todo.."

              write (*,*) ""

              write (*,*) "Mandelbrot set"
              write (*,*) "=============="
              write (*,*) "todo.."

              write (*,*) ""

              write (*,*) " done!"


      end program benchmark

