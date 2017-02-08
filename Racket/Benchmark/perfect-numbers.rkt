#lang racket

; perfect-numbers.rkt
; Calculate perfect numbers in Racket

(provide perfect? perfect-numbers)


; predicate to check for perfect number
;(define (perfect? n)
;  (letrec ([loop (lambda (i sum)
;                   (if (= i n) (= sum n)
;                       (if (zero? (modulo n i))
;                           (loop (+ 1 i) (+ sum i))
;                           (loop (+ 1 i) sum))))])
;    (loop 1 0)))

(define (perfect? n)
  (letrec ([loop (lambda (i sum)
                   (cond
                     [(= i n) (= sum i)]
                     [(zero? (modulo n i)) (loop (+ 1 i) (+ sum i))]
                     [else (loop (+ 1 i) sum)]))])
    (loop 1 0)))
                     

; find all perfect numbers < n
(define (perfect-numbers n)
  (if (zero? n) '()
      (if (perfect? n)
          (cons n (perfect-numbers (- n 1)))
          (perfect-numbers (- n 1)))))
;(define (perfect-numbers-2 n)
;  (if (zero? n) '()
;      (if (perfect?-2 n)
;          (cons n (perfect-numbers (- n 1)))
;          (perfect-numbers (- n 1)))))
