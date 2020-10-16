/* vim: set et sw=4 ts=4: */

/*
   main.c

   Entry point to (micro-benchmarks for the C programming language
   */

#include <stdio.h>
#include <time.h>

#include "fib.h"

int main (int argc, char **argv) {
    clock_t tic, toc;

    printf ("Benchmark\n");
    printf ("=========\n");
    printf ("\n");

    printf ("Fibonacci numbers\n");
    printf ("-----------------\n");
    tic = clock ();
    int res = fib_naive (35);
    toc = clock ();
    printf ("fib_naive(35) = %d (Elapsed %.3fs)\n", res, ((double) (toc - tic)) / CLOCKS_PER_SEC );

    printf ("todo..\n");
    printf ("\n");

    printf ("Perfect numbers\n");
    printf ("---------------\n");
    printf ("todo..\n");
    printf ("\n");

    printf ("Prime numbers\n");
    printf ("-------------\n");
    printf ("todo..\n");
    printf ("\n");

    printf ("Mandelbrot set\n");
    printf ("--------------\n");
    printf ("todo..\n");
    printf ("\n");



    return 0;
}

