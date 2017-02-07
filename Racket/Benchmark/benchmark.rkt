#lang racket

(require "fibonacci.rkt")


(define (benchmark)
  (displayln "Fibonacci numbers")
  (displayln "=================")
  (displayln (string-append "fib-naive(35) = "
                            (number->string (time (fib-naive 35)))))
  (displayln (string-append "fib(35) = "
                            (number->string (time (fib 35)))))
  (displayln (string-append "fib(1000) = "
                            (number->string (time (fib 1000)))))
  (newline)
  (displayln "Perfect numbers")
  (displayln "===============")
  (newline)
  (displayln "Mandelbrot sets")
  (displayln "===============")
  (newline))