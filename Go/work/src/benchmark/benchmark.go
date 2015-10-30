// benchmark.go
// 
// vim: ft=go sw=4 ts=4
//
// A set of (micro-) benchmarks for the Go programming language
//

package main

import (
	"fmt"
	"time"
	"benchmark/fib"
)


// main entry point
func main() {

	fmt.Println("Fibonacci numbers")
	fmt.Println("=================")
	tic0 := time.Now()
	res0 := fib.FibNaive(35)
	toc0 := time.Now()
	fmt.Printf("FibNaive(35) = %d\tElapsed time: %fs\n", res0, toc0.Sub(tic0).Seconds())

	tic1 := time.Now()
	res1 := fib.Fib(35).String()
	toc1 := time.Now()
	fmt.Printf("Fib(35)      = %s\tElapsed time: %fs\n", res1, toc1.Sub(tic1).Seconds())

	tic2 := time.Now()
	res2 := fib.Fib(1000).String()
	toc2 := time.Now()
	fmt.Printf("Fib(1000)      = %s\tElapsed time: %fs\n", res2, toc2.Sub(tic2).Seconds())

	fmt.Println()

}

