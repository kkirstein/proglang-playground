/* vim: set et sw=4 ts=4: */

/*
   main.c

   Entry point to (micro-benchmarks for the C programming language
   */

#include <stdio.h>
#include <time.h>
#include <gmp.h>
#include <omp.h>

#include "benchmark_config.h"
#include "fib.h"
#include "perfect_number.h"
#include "primes.h"

int main (int argc, char **argv) {
    clock_t tic, toc;

    int fib_i;
    mpz_t fib_z;
    PerfectNumbers pn;
    PrimeNumbers pr;
    //da_init (pn);
    int pn_len;
    int pr_len;

    printf ("Benchmark (%s)\n", Benchmark_VERSION);
    printf ("===============\n");
#pragma omp parallel
    if (omp_get_thread_num() == 0) printf ("OpenMP: Using %d threads.\n", omp_get_num_threads());
    printf ("\n");

    printf ("Fibonacci numbers\n");
    printf ("-----------------\n");
    tic = clock ();
    fib_i = fib_naive (35);
    toc = clock ();
    printf ("fib_naive(35) = %d (Elapsed %.3fs)\n", fib_i, ((double) (toc - tic)) / CLOCKS_PER_SEC );

    tic = clock ();
    fib (fib_z, 35);
    toc = clock ();
    printf ("fib(35) = ");
    mpz_out_str ( stdout, 10, fib_z);
    printf (" (Elapsed %.3fs)\n", ((double) (toc - tic)) / CLOCKS_PER_SEC );
    mpz_clear (fib_z);

    tic = clock ();
    fib (fib_z, 1000);
    toc = clock ();
    printf ("fib(1000) = ");
    mpz_out_str ( stdout, 10, fib_z);
    printf(" (Elapsed %.3fs)\n", ((double) (toc - tic)) / CLOCKS_PER_SEC );
    mpz_clear (fib_z);

    printf ("\n");

    printf ("Perfect numbers\n");
    printf ("---------------\n");
    tic = clock ();
    pn_len = perfect_numbers (&pn, 10000);
    toc = clock ();
    printf ("pn(10000) = ");
    print_perfect_numbers (&pn);
    printf (" (len = %d)", pn_len);
    printf(" (Elapsed %.3fs)\n", ((double) (toc - tic)) / CLOCKS_PER_SEC );
    da_free (pn);
    printf ("\n");

    printf ("Prime numbers\n");
    printf ("-------------\n");
    tic = clock ();
    pr_len = prime_numbers (&pr, 10000);
    toc = clock ();
    printf ("pr(10000) = {..}");
    // print_perfect_numbers (&pr);
    printf (" (len = %d)", pr_len);
    printf(" (Elapsed %.3fs)\n", ((double) (toc - tic)) / CLOCKS_PER_SEC );
    da_free (pr);
    printf ("\n");

    printf ("Mandelbrot set\n");
    printf ("--------------\n");
    printf ("todo..\n");
    printf ("\n");



    return 0;
}
