! benchmark.f90
! A selection of micro-benchmarks for Fortran
!
! vim: set ft=fortran sw=4 ts=4 :

program benchmark

    use iso_fortran_env, only: compiler_version, compiler_options 

    use fibonacci
    use perfect_number
    !use color_map
    use mandelbrot

    implicit none

    integer, parameter :: width = 1920
    integer, parameter :: height = 1600

    integer, parameter :: pn_limit = 10000
    !  integer, parameter :: pn_limit = 33550336

    integer :: tic, toc, rate
    integer :: res_int
    integer (kind=pr) :: res_int_pr
    integer, dimension(:), allocatable :: res_pn
    integer, dimension(:,:,:), allocatable :: res_img

    character(:), allocatable :: file_name, res_pn_str

    call system_clock(count_rate = rate)

#ifdef __GFORTRAN__
    write (*, *) "Compiler infos"
    write (*, *) "=============="

    write (*, *) 'Compiler version: ', compiler_version()
    write (*, *) 'Compiler options: ', compiler_options()
    write (*, *)
#endif

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
    write (*,*) "=============="
    call system_clock(tic)
    res_img = image(width, height, -0.5, 0.0, 4.0/width)
    call system_clock(toc)
    write (*,333) "mandelbrot_set", &
        & " Elapsed time: ", float(toc-tic)/rate * 1000, "ms"

    call system_clock(tic)
    file_name = "mandelbrot.ppm"
    call write_ppm(width, height, res_img, file_name)
    call system_clock(toc)
    write (*,333) "mandelbrot_set written to file", &
        & " Elapsed time: ", float(toc-tic)/rate * 1000, "ms"

    write (*,*) ""

    write (*,*) " done!"

    111 format (A25, I20, A, F0.3, A)
    222 format (A25, I8, A, A, /, A, F0.3, A)
    333 format (A35, 10X, A, F0.3, A)

end program benchmark
