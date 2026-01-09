package benchmark

import "core:fmt"
import "tasks"

main :: proc() {
	fmt.println("Benchmarks for the Odin programming language")
	fmt.println("============================================")


	fmt.println("Fibonacci Numbers")
	fmt.println("-----------------")
	fmt.println("todo..")
    res_int := tasks.fib_naive(35) 
    fmt.printfln("fib(35) = %d", res_int)
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
