/* vim: set ft=c sw=4 ts=4: */

/* primes.c
 * Header file for prime number evaluation in C */


#include "primes.h"

#include <math.h>

bool is_prime (int n) {

	if (n < 2) return false;

	int limit = (int) sqrtf((float) n);

	for (int i = 2; i < limit; i++) {
		if (n % i == 0) return false;
	}

	return true;
}


bool is_prime_mpz (mpz_t n) {

	return false;
}

int prime_numbers (PrimeNumbers *pn, int limit) {

	da_init (*pn);

	for (int i = 2; i < limit; i++) {
		if (is_prime (i)) {
			da_push (*pn, i);
		}
	}

	return da_count (*pn);
}

