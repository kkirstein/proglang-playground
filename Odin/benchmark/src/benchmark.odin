package benchmark

import "core:fmt"
import "core:math/big"
import "core:time"
import "tasks"

main :: proc() {
	fmt.println("Benchmarks for the Odin programming language")
	fmt.println("============================================")

	benchmark_fib()

	benchmark_pn()

	fmt.println("Prime Numbers")
	fmt.println("-------------")
	fmt.println("todo..")
	fmt.println()

	fmt.println("Mandelbrot Set")
	fmt.println("--------------")
	fmt.println("todo..")
	fmt.println()

}
