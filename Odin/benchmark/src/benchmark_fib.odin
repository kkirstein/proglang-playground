package benchmark

import "core:fmt"
import "core:math/big"
import "core:time"
import "tasks"

benchmark_fib :: proc () {
	sw := time.Stopwatch{}

	fmt.println("Fibonacci Numbers")
	fmt.println("-----------------")

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
		"fib_big_int(35) = %s, elapsed time: %v",
		big.itoa(res_big_int),
		time.stopwatch_duration(sw),
	)
	time.stopwatch_reset(&sw)

	time.stopwatch_start(&sw)
	res_big_int = tasks.fib_big_int(1000)
	time.stopwatch_stop(&sw)
	fmt.printfln(
		"fib_big_int(1000) = %s, elapsed time: %v",
		big.itoa(res_big_int),
		time.stopwatch_duration(sw),
	)
	time.stopwatch_reset(&sw)
	fmt.println()
}