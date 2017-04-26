/* benchmark.kt
 * A set of (micro-) benchmarks for the Kotlin
 * (http://kotlinlang.org) programming language
 */

package benchmark

import kotlin.system.measureTimeMillis
import timeit.timeit
import fibonacci.*
import perfectnumber.*

// main entry point
fun main(args: Array<String>) {

  println("Kotlin benchmarks");
  println("=================");
  println();

  println("Fibonacci numbers:");
  println("------------------");
  val (res, elap) = timeit { fibNaive(35) }
  println("fibNaive(35) = $res, elapsed time: $elap ms.")
  val (res2, elap2) = timeit { fib(35) }
  println("fib(35) = $res2, elapsed time: $elap2 ms.")
  val (res3, elap3) = timeit { fib(1000) }
  println("fib(1000) = $res3, elapsed time: $elap3 ms.")

  println();

  println("Perfect numbers:");
  println("----------------");
  val (pn, elap_pn) = timeit { perfectNumbers(10000) }
  println("perfectNumbers(10000) = $pn, elapsed time: $elap_pn ms.")

  println();


  println("------------------");
  println("Done.");

}
