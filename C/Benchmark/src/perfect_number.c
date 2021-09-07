/* vim: set ft=c sw=4 ts=4: */

/* perfect_number.c
 * Perfect number calculation in C */

#include "perfect_number.h"
#include <stdio.h>

#include "dynarr/DG_dynarr.h"

/** perfect number predicate */
bool is_perfect(unsigned n) {
    unsigned sum = 0;
    for (unsigned i = 1; i < n; i++) {
        if (n % i == 0)
            sum += i;
    }

    return (sum == n);
}

/** find perfect number < limit */
unsigned perfect_numbers(PerfectNumbers *pn, unsigned limit) {

    da_init(*pn);
    unsigned i;

#pragma omp parallel for private(i), schedule(dynamic)
    for (i = 1; i < limit; i++) {
        if (is_perfect(i)) {
            da_push(*pn, i);
        }
    }

    return da_count(*pn);
}

/** pretty-print perfect numbers */
void print_perfect_numbers(PerfectNumbers const *const pn) {

    unsigned len = da_count(*pn);

    printf("{");
    if (len > 0)
        printf(" %d", pn->p[0]);
    for (unsigned i = 1; i < len; i++) {
        printf(", %d", pn->p[i]);
    }
    printf(" }");
}
