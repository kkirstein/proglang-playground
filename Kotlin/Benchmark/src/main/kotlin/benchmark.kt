/* benchmark.kt
 * A set of (micro-) benchmarks for the Kotlin
 * (http://kotlinlang.org) programming language
 */

package benchmark

import fibonacci.*

// main entry point
fun main(args: Array<String>) {

  println("Kotlin benchmarks");
  println("=================");
  println();

  println("Fibonacci numbers:");
  println("------------------");
  val res = fib_naive(35)
  println("fib_naive(35) = $res")
  println();

  println("------------------");
  println("Done.");

}
