/* vim: set ft=c sw=4 ts=4: */

/* primes.c
 * Header file for prime number evaluation in C */

#ifndef PRIMES_H
#define PRIMES_H

#include <stdbool.h>
#include <gmp.h>
#include "dynarr/DG_dynarr.h"

/** predicate, whether given number is a prime */
bool is_prime (unsigned n);

/** predicate, whether given number is a prime */
bool is_prime_mpz (mpz_t n);

DA_TYPEDEF (unsigned, PrimeNumbers);

/** generate a dynamic array of primes < limit
 * return: number of found primes */
unsigned prime_numbers (PrimeNumbers *pn, unsigned limit);

#endif

