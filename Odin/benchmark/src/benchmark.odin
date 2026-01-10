package benchmark

import "core:fmt"
import "core:time"
import "tasks"

main :: proc() {
	fmt.println("Benchmarks for the Odin programming language")
	fmt.println("============================================")
	sw := time.Stopwatch{}

	fmt.println("Fibonacci Numbers")
	fmt.println("-----------------")
	fmt.println("todo..")
	time.stopwatch_start(&sw)
	res_int := tasks.fib_naive(35)
	time.stopwatch_stop(&sw)
	fmt.printfln("fib_naive(35) = %d, elapsed time: %f", res_int, time.stopwatch_duration(sw))
	time.stopwatch_reset(&sw)
	time.stopwatch_start(&sw)
	res_int = tasks.fib_int(35)
	time.stopwatch_stop(&sw)
	fmt.printfln("fib_int(35) = %d, elapsed time: %f", res_int, time.stopwatch_duration(sw))
	time.stopwatch_reset(&sw)
	fmt.println()

	fmt.println("Perfect Numbers")
	fmt.println("---------------")
	fmt.println("todo..")
	fmt.println()

	fmt.println("Prime Numbers")
	fmt.println("-------------")
	fmt.println("todo..")
	fmt.println()

	fmt.println("Mandelbrot Set")
	fmt.println("--------------")
	fmt.println("todo..")
	fmt.println()

}
