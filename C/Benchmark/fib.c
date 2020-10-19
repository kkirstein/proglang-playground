/* vim: set et sw=4 ts=4: */

/*
   fib.h

   Implementation file for calculating Fibonacci numbers

   */

#include "fib.h"

int fib_naive (int n) {
    if (n < 2) {
        return n;
    } else {
        return (fib_naive (n - 1) + fib_naive (n - 2));
    }
}

void fib_aux (mpz_t res, const mpz_t a, const mpz_t b, int n) {

    mpz_t tmp;

    if (n == 0) {
        mpz_init_set (res, a);
    } else {
	    mpz_init (tmp);
        mpz_add (tmp, a, b);
        fib_aux (res, b, tmp, n-1);
        mpz_clear (tmp);
    }
}

void fib (mpz_t res, int n) {
    
    mpz_t a, b;
    mpz_init (a);
    mpz_init (b);

    mpz_set_ui (a, 0);
    mpz_set_ui (b, 1);
    fib_aux(res, a, b, n);

    mpz_clears (a, b, NULL);
}

