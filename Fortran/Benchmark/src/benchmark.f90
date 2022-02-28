! benchmark.f90
! A selection of micro-benchmarks for Fortran
!
! vim: set ft=fortran sw=4 ts=4 :

program benchmark

    use iso_fortran_env, only: compiler_version, compiler_options 
    use omp_lib, only: omp_get_thread_num, omp_get_num_threads

    use fibonacci
    use perfect_number
    use image
    use mandelbrot

    implicit none

    integer, parameter :: width_small = 640
    integer, parameter :: height_small = 480
    integer, parameter :: width = 1920
    integer, parameter :: height = 1600

    integer, parameter :: pn_limit = 10000
    !  integer, parameter :: pn_limit = 33550336

    integer :: tic, toc, rate
    integer :: res_int
    integer (kind=pr) :: res_int_pr
    integer, dimension(:), allocatable :: res_pn
    type(ImageRGB) :: res_img, res_img_small

    character(:), allocatable :: file_name, res_pn_str

    call system_clock(count_rate = rate)

    write (*, *) "Benchmark"
    write (*, *) "========="

#ifdef __GFORTRAN__
    write (*, *) "Compiler infos"
    write (*, *) "--------------"

    write (*, *) 'Compiler version: ', compiler_version()
    write (*, *) 'Compiler options: ', compiler_options()
#endif

    !$omp parallel
    !$omp master
    write (*, '(x, a, i2)') "OpenMP threads: ", omp_get_num_threads()
    !$omp end master
    !$omp end parallel
    write (*, *)

    write (*,*) "Fibonacci numbers"
    write (*,*) "-----------------"
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
    write (*,*) "---------------"
    call system_clock(tic)
    call perfect_numbers(pn_limit, res_pn)
    call system_clock(toc)
    call to_string(res_pn, res_pn_str)
    write (*,222) "perfect_numbers(", pn_limit, ") = ", res_pn_str, &
        & " Elapsed time: ", float(toc-tic)/rate * 1000, "ms"
    call system_clock(tic)
    call perfect_numbers_realloc(pn_limit, res_pn)
    call system_clock(toc)
    call to_string(res_pn, res_pn_str)
    write (*,222) "perfect_numbers_realloc(", pn_limit, ") = ", res_pn_str, &
        & " Elapsed time: ", float(toc-tic)/rate * 1000, "ms"

    write (*,*) ""


    write (*,*) "Mandelbrot set"
    write (*,*) "--------------"
    call system_clock(tic)
    res_img_small = create(width_small, height_small, -0.5, 0.0, 4.0/width_small)
    call system_clock(toc)
    write (*,333) "mandelbrot_set (", width_small, ", ", height_small, ")", &
        & " Elapsed time: ", float(toc-tic)/rate * 1000, "ms"

    call system_clock(tic)
    res_img = create(width, height, -0.5, 0.0, 4.0/width)
    call system_clock(toc)
    write (*,333) "mandelbrot_set (", width, ", ", height, ")", &
        & " Elapsed time: ", float(toc-tic)/rate * 1000, "ms"

    call system_clock(tic)
    res_img = create_omp(width, height, -0.5, 0.0, 4.0/width)
    call system_clock(toc)
    write (*,333) "mandelbrot_set (OpenMP) (", width, ", ", height, ")", &
        & " Elapsed time: ", float(toc-tic)/rate * 1000, "ms"

    call system_clock(tic)
    file_name = "mandelbrot.ppm"
    call res_img%write_ppm(file_name)
    call system_clock(toc)
    write (*,444) "mandelbrot_set written to file (PPM)", &
        & " Elapsed time: ", float(toc-tic)/rate * 1000, "ms"

    call system_clock(tic)
    file_name = "mandelbrot_small.png"
    call res_img_small%write_png(file_name)
    call system_clock(toc)
    write (*,444) "mandelbrot_set (small) written to file(PNG)", &
        & " Elapsed time: ", float(toc-tic)/rate * 1000, "ms"

    call system_clock(tic)
    file_name = "mandelbrot.png"
    call res_img%write_png(file_name)
    call system_clock(toc)
    write (*,444) "mandelbrot_set written to file(PNG)", &
        & " Elapsed time: ", float(toc-tic)/rate * 1000, "ms"

    write (*,*) ""

    write (*,*) " done!"

    111 format (A25, I20, A, F0.3, A)
    222 format (A25, I8, A, A, /, A, F0.3, A)
    333 format (A35, I5, A, I5, A, 10X, A, F0.3, A)
    444 format (A48, 10X, A, F0.3, A)

end program benchmark
