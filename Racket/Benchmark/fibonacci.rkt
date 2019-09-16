#lang racket/base

; Fibonacci.rkt
; Calculate Fibonacci numbers in Racket

(provide fib-naive fib)


; naive Fibonacci implementation
(define (fib-naive n)
  (if (< n 2) n (+ (fib-naive (- n 1)) (fib-naive (- n 2)))))

; tail-call optimized version
(define (fib n)
  (letrec ([fib-aux (lambda (a b n)
                   (if (zero? n) a (fib-aux b (+ a b) (- n 1))))])
    (fib-aux 0 1 n)))
