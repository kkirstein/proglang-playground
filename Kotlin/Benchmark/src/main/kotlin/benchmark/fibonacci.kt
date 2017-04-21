/* fib.kt
 * Calculate Fibonacci numbers in the Kotlin
 * (http://kotlinlang.org) programming language
 */

package fibonacci

// naive implementation
fun fib_naive(n: Int) : Int {
  if (n < 2) {
    return n
  } else {
    return (fib_naive(n-1) + fib_naive(n-2))
  }
}
