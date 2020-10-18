/* vim: set et sw=4 ts=4: */

/*
   fib.h

   Header file for calculating Fibonacci numbers

*/

#ifndef FIB_H
#define FIB_H

#include <gmp.h>

int fib_naive (int n);

void fib (mpz_t res, int n);

void fib_iter (mpz_t res, int n);

#endif

