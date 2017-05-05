/* benchmark.kt
 * A set of (micro-) benchmarks for the Kotlin
 * (http://kotlinlang.org) programming language
 */

package benchmark

import kotlin.system.measureTimeMillis
import kotlinx.coroutines.experimental.*
import timeit.timeIt
import timeit.timeIt2
import fibonacci.*
import perfectnumber.*

// main entry point
fun main(args: Array<String>) = runBlocking<Unit> {

  println("Kotlin benchmarks");
  println("=================");
  println();

  println("Fibonacci numbers:");
  println("------------------");

  launch(CommonPool) {
    val res = timeIt2 { fibNaiveAsync(35) }
    println("fibNaive(35) = ${res.result} (Async), elapsed time: ${res.elapsed} ms.")
  }

  val res1 = timeIt { fibNaive(35) }
  println("fibNaive(35) = ${res1.result}, elapsed time: ${res1.elapsed} ms.")
  val res2 = timeIt { fib(35) }
  println("fib(35) = ${res2.result}, elapsed time: ${res2.elapsed} ms.")
  val res3 = timeIt { fib(1000) }
  println("fib(1000) = ${res3.result}, elapsed time: ${res3.elapsed} ms.")

  println();

  println("Perfect numbers:");
  println("----------------");
  val resPn = timeIt { perfectNumbers(10000) }
  println("perfectNumbers(10000) = ${resPn.result}, elapsed time: ${resPn.elapsed} ms.")
  val resPnSeq = timeIt { perfectNumberSeq.take(5).toList() }
  println("perfectNumberSeq(5) = ${resPnSeq.result}, elapsed time: ${resPnSeq.elapsed} ms.")

  println();

  println("------------------");
  delay(1000L)
  println("Done.");

}
