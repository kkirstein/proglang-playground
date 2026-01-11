package benchmark

import "core:fmt"
import "core:math/big"
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
	fmt.printfln("fib_naive(35) = %d, elapsed time: %v", res_int, time.stopwatch_duration(sw))
	time.stopwatch_reset(&sw)

	time.stopwatch_start(&sw)
	res_int = tasks.fib_int(35)
	time.stopwatch_stop(&sw)
	fmt.printfln("fib_int(35) = %d, elapsed time: %v", res_int, time.stopwatch_duration(sw))
	time.stopwatch_reset(&sw)

	time.stopwatch_start(&sw)
	res_big_int := tasks.fib_big_int(35)
	defer big.destroy(res_big_int)
	defer free(res_big_int)
	time.stopwatch_stop(&sw)
	fmt.printfln(
		"fib_big_int(35) = %s, elapsed time: %s",
		big.itoa(res_big_int),
		time.stopwatch_duration(sw),
	)
	time.stopwatch_reset(&sw)

	time.stopwatch_start(&sw)
	res_big_int = tasks.fib_big_int(1000)
	time.stopwatch_stop(&sw)
	fmt.printfln(
		"fib_big_int(1000) = %s, elapsed time: %f",
		big.itoa(res_big_int),
		time.stopwatch_duration(sw),
	)
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
