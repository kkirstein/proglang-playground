! benchmark.f
! A selectoin of micro-benchmarks for Fortran
!
! vim: set ft=fortran sw=2 ts=2 :

      program benchmark

        use fibonacci
        use perfect_number
        !use color_map
        use mandelbrot

        implicit none

        integer, parameter :: width = 1920
        integer, parameter :: height = 1600

        integer :: tic, toc, rate
        integer :: res_int
        integer (kind=pr) :: res_int_pr
        integer, dimension(:), allocatable :: res_pn
        integer, dimension(:,:,:), allocatable :: res_img

        call system_clock(count_rate = rate)

        write (*,*) "Fibonacci numbers"
        write (*,*) "================="
        call system_clock(tic)
        res_int = fib_naive(35)
        call system_clock(toc)
        write (*,111) "fib_naive(35) = ", res_int, &
          & " Elapsed time: ", float(toc-tic)/rate * 1000, "ms"

        call system_clock(tic)
        res_int_pr = fib_iter(35)
        call system_clock(toc)
        write (*,111) "fib_iter(35) = ", res_int_pr, &
          & " Elapsed time: ", float(toc-tic)/rate * 1000, "ms"

        call system_clock(tic)
        res_int_pr = fib_iter(1000)
        call system_clock(toc)
        write (*,111) "fib_iter(1000) = ", res_int_pr, &
          & " Elapsed time: ", float(toc-tic)/rate * 1000, "ms"

        write (*,*) ""


        write (*,*) "Perfect numbers"
        write (*,*) "==============="
        call system_clock(tic)
        call perfect_numbers(10000, res_pn)
        call system_clock(toc)
        write (*,222) "perfect_numbers(10000) = ", res_pn, &
          & " Elapsed time: ", float(toc-tic)/rate * 1000, "ms"

        write (*,*) ""


        write (*,*) "Mandelbrot set"
        write (*,*) "=============="
        call system_clock(tic)
        res_img = image(width, height, -0.5, 0.0, 4.0/width)
        call system_clock(toc)
        write (*,333) "mandelbrot_set", &
          & " Elapsed time: ", float(toc-tic)/rate * 1000, "ms"

        write (*,*) ""

        write (*,*) " done!"

        111 format (A25, I20, A, F0.3, A)
        222 format (A25, I5, I5, I5, I5, A, F0.3, A)
        333 format (A25, 20X, A, F0.3, A)

      end program benchmark

