/* vim: set ft=c sw=4 ts=4: */

/* primes.c
 * Header file for prime number evaluation in C */


#include "primes.h"

#include <math.h>

bool is_prime (unsigned n) {

	if (n < 2) return false;

	unsigned limit = (unsigned) sqrtf((float) n);

	for (unsigned i = 2; i < limit; i++) {
		if (n % i == 0) return false;
	}

	return true;
}


bool is_prime_mpz (mpz_t n) {

	return false;
}

unsigned prime_numbers (PrimeNumbers *pn, unsigned limit) {

	da_init (*pn);

	for (unsigned i = 2; i < limit; i++) {
		if (is_prime (i)) {
			da_push (*pn, i);
		}
	}

	return da_count (*pn);
}

