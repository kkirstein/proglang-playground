/* fib.kt
 * Calculate Fibonacci numbers in the Kotlin
 * (http://kotlinlang.org) programming language
 */

package fibonacci

import java.math.BigInteger

// naive implementation
fun fib_naive(n: Int): Int {
  if (n < 2) {
    return n
  } else {
    return (fib_naive(n-1) + fib_naive(n-2))
  }
}

// optimized tail-recursive implementation

fun fib(n: Int): BigInteger {
  fun loop(a: BigInteger, b: BigInteger, n: Int): BigInteger {
    return if (n == 0) a else loop(b, a + b, n - 1)
  }

  return loop(BigInteger.valueOf(0), BigInteger.valueOf(1), n)
}
