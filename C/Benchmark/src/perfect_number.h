/* vim: set ft=c sw=4 ts=4: */

/* perfect_number.c
 * Header file for perfect number calculation in C */

#ifndef PERFECT_NUMBER_H
#define PERFECT_NUMBER_H

#include "dynarr/DG_dynarr.h"

/** perfect number predicate */
int is_perfect (int n);

DA_TYPEDEF (int, PerfectNumbers);

/** finds perfect number < limit */
int perfect_numbers (PerfectNumbers *pn, int limit);

/** pretty-prints an array of perfect numbers */
void print_perfect_numbers (PerfectNumbers const * const pn);

#endif

