#lang racket

(require "fibonacci.rkt" "perfect-numbers.rkt" "mandelbrot.rkt")


(define (benchmark)
  (begin
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
    (displayln (string-append "perfect-numbers(10000) = "
                              (string-join (map number->string (time (perfect-numbers 10000))))))
    (displayln (string-append "perfect-numbers-futures(10000) = "
                              (string-join (map number->string (time (perfect-numbers-futures 10000))))))
    (newline)
    (displayln "Mandelbrot sets")
    (displayln "===============")
    (displayln (string-append "mandelbrot set (640x480) "
                              (if (time (mandelbrot 640 480)) "ok" "failed")))
    (newline)))

    ;(displayln "Press any key to continue..")
    ;(read-char)))


; main entry point
(benchmark)
