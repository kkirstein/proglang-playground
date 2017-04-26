/* timeit.kt
 * Package to generate timing infos of function application
 * in the Kotlin (http://kotlinlang.org) programming language
 */

package timeit

// container for timing and function result
data class Result<T>(val result: T, val elapsed: Long)

// call given function and record elapsed timeit
fun <T> timeit(body: () -> T): Result<T> {
  val tic = System.currentTimeMillis()
  val res: T = body()
  val toc = System.currentTimeMillis()

  return Result<T>(res, toc-tic)
}
