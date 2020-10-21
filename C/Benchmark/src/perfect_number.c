/* vim: set ft=c sw=4 ts=4: */

/* perfect_number.c
 * Perfect number calculation in C */

#include <stdio.h>


/**  perfect number predicate */
int is_perfect (int n) {
  int sum = 0;
  for (int i = 1; i < n; i++) {
    if (n % i == 0) sum += i;
  }

  return (sum == n);
}

