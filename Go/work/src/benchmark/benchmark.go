// benchmark.go
//
// vim: ft=go sw=4 ts=4
//
// A set of (micro-) benchmarks for the Go programming language
//

package main

import (
	"benchmark/fib"
	"benchmark/perfectnumber"
	"fmt"
	"time"
)

// main entry point
func main() {

	var tic, toc time.Time

	fmt.Println("Fibonacci numbers")
	fmt.Println("=================")

	tic = time.Now()
	res0 := fib.FibNaive(35)
	toc = time.Now()
	fmt.Printf("FibNaive(35) = %d\tElapsed time: %fs\n", res0, toc.Sub(tic).Seconds())

	tic = time.Now()
	res1 := fib.Fib(35).String()
	toc = time.Now()
	fmt.Printf("Fib(35)      = %s\tElapsed time: %fs\n", res1, toc.Sub(tic).Seconds())

	tic = time.Now()
	res2 := fib.Fib(1000).String()
	toc = time.Now()
	fmt.Printf("Fib(1000)      = %s\tElapsed time: %fs\n", res2, toc.Sub(tic).Seconds())

	fmt.Println()
	fmt.Println("Perfect numbers")
	fmt.Println("===============")

	tic = time.Now()
	res3 := perfectnumber.PerfectNumbers(10000)
	toc = time.Now()
	fmt.Printf("PerfectNumbers(10000) = %v\tElapsed time: %fs\n", res3, toc.Sub(tic).Seconds())
	tic = time.Now()
	res4 := []int{}
	for pn := range perfectnumber.PerfectNumbersAsync(10000) {
		res4 = append(res4, pn)
	}
	toc = time.Now()
	fmt.Printf("PerfectNumbersAsync(10000) = %v\tElapsed time: %fs\n", res4, toc.Sub(tic).Seconds())
	fmt.Println()

}
