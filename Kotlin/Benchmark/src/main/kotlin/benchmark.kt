/* benchmark.kt
 * A set of (micro-) benchmarks for the Kotlin
 * (http://kotlinlang.org) programming language
 */

package benchmark

import kotlin.system.measureTimeMillis
/*import kotlin.coroutines.experimental.**/
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
  val res1 = timeit { fibNaive(35) }
  println("fibNaive(35) = ${res1.result}, elapsed time: ${res1.elapsed} ms.")
  val res2 = timeit { fib(35) }
  println("fib(35) = ${res2.result}, elapsed time: ${res2.elapsed} ms.")
  val res3 = timeit { fib(1000) }
  println("fib(1000) = ${res3.result}, elapsed time: ${res3.elapsed} ms.")

  println();

  println("Perfect numbers:");
  println("----------------");
  val resPn = timeit { perfectNumbers(10000) }
  println("perfectNumbers(10000) = ${resPn.result}, elapsed time: ${resPn.elapsed} ms.")
  val resPnSeq = timeit { perfectNumberSeq.take(5).toList() }
  println("perfectNumberSeq(5) = ${resPnSeq.result}, elapsed time: ${resPnSeq.elapsed} ms.")

  println();

  println("------------------");
  println("Done.");

}
