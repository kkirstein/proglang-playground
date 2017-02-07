#lang racket

; perfect-numbers.rkt
; Calculate perfect numbers in Racket

(provide perfect?)


; predicate to check for perfect number
(define (perfect? n)
  (letrec ([loop (lambda (i sum)
                   (if (= i n) (= sum n)
                       (if ())))])
    (loop n 0)))
