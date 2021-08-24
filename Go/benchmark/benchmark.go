// benchmark.go
//
// vim: ft=go sw=4 ts=4
//
// A set of (micro-) benchmarks for the Go programming language
//

package main

import (
	"benchmark/fib"
	"benchmark/mandelbrot"
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
	fmt.Printf("Fib(1000)    = %s\tElapsed time: %fs\n", res2, toc.Sub(tic).Seconds())

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

	fmt.Println("Mandelbrot set")
	fmt.Println("==============")
	tic = time.Now()
	img1 := mandelbrot.Mandelbrot(640, 480, -0.5, 0.0, 4.0/640)
	toc = time.Now()
	fmt.Printf("Mandelbrot(%d x %d)\tElapsed time: %fs\n",
		img1.Rect.Max.X, img1.Rect.Max.Y, toc.Sub(tic).Seconds())

	tic = time.Now()
	img2 := mandelbrot.Mandelbrot(1920, 1200, -0.5, 0.0, 4.0/1920)
	toc = time.Now()
	fmt.Printf("Mandelbrot(%d x %d)\tElapsed time: %fs\n",
		img2.Rect.Max.X, img2.Rect.Max.Y, toc.Sub(tic).Seconds())

	tic = time.Now()
	mbAsync := mandelbrot.MandelbrotAsync(1920, 1200, -0.5, 0.0, 4.0/1920)
	img3 := <-mbAsync
	toc = time.Now()
	fmt.Printf("MandelbrotAsync(%d x %d)\tElapsed time: %fs\n",
		img3.Rect.Max.X, img3.Rect.Max.Y, toc.Sub(tic).Seconds())

	tic = time.Now()
	err1 := mandelbrot.WritePng("mandelbrot_640x480.png", img1)
	toc = time.Now()
	fmt.Printf("Mandelbrot(640 x 480) written to file. Error: %v\tElapsed time: %fs\n", err1, toc.Sub(tic).Seconds())

	tic = time.Now()
	err2 := mandelbrot.WritePng("mandelbrot_1920x1200.png", img2)
	toc = time.Now()
	fmt.Printf("Mandelbrot(1920 x 1200) written to file. Error: %v\tElapsed time: %fs\n", err2, toc.Sub(tic).Seconds())
	fmt.Println()
}
