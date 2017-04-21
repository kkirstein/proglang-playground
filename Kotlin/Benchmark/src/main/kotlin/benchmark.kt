/* benchmark.kt
 * A set of (micro-) benchmarks for the Kotlin
 * (http://kotlinlang.org) programming language
 */

package benchmark

import kotlin.system.measureTimeMillis
import fibonacci.*

// main entry point
fun main(args: Array<String>) {

  println("Kotlin benchmarks");
  println("=================");
  println();

  println("Fibonacci numbers:");
  println("------------------");
  val res = fib_naive(35)
  var elap = measureTimeMillis { fib_naive(35) }
  println("fib_naive(35) = $res, elapsed time: $elap ms.")
  var res2 = fib(35)
  elap = measureTimeMillis { fib(35) }
  println("fib(35) = $res2, elapsed time: $elap ms.")
  res2 = fib(1000)
  elap = measureTimeMillis { fib(1000) }
  println("fib(1000) = $res2, elapsed time: $elap ms.")

  println();

  println("------------------");
  println("Done.");

}
