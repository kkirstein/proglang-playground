/* vim: set ft=c sw=4 ts=4: */

/* perfect_number.c
 * Perfect number calculation in C */

#include <stdio.h>
#include "perfect_number.h"

#include "dynarr/DG_dynarr.h"

/** perfect number predicate */
bool is_perfect (int n) {
  int sum = 0;
  for (int i = 1; i < n; i++) {
    if (n % i == 0) sum += i;
  }

  return (sum == n);
}

/** find perfect number < limit */
int perfect_numbers (PerfectNumbers *pn, int limit) {

	da_init (*pn);

	for (int i = 1; i < limit; i++) {
		if (is_perfect (i)) {
			da_push (*pn, i);
		}
	}

	return da_count (*pn);
}

/** pretty-print perfect numbers */
void print_perfect_numbers (PerfectNumbers const * const pn) {

	int len = da_count (*pn);

	printf ("{");
	if (len > 0) printf (" %d", pn->p[0]);
	for (int i = 1; i < len; i++) {
		printf (", %d", pn->p[i]);
	}
	printf (" }");
}

