; benchmark.ss
; A set of micro-benchmarks for standard (R7RS) Scheme
; implementations

(import (rnrs))


(define benchmark
  (lambda ()

    (display "Fibonacci Numbers\n")
    (display "=================\n")
    (newline)

    (display "Perfect Numbers\n")
    (display "===============\n")
    (newline)


    (display "Mandelbrot Set\n")
    (display "===============\n")
    (newline)))

(benchmark)

