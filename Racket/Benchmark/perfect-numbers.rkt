#lang racket/base

(require racket/future)

; perfect-numbers.rkt
; Calculate perfect numbers in Racket

(provide perfect? perfect-numbers perfect-numbers-futures)


; predicate to check for perfect number
(define (perfect? n)
  (letrec ([loop (λ (i sum)
                   (cond
                     [(= i n) (= sum i)]
                     [(zero? (modulo n i)) (loop (add1 i) (+ sum i))]
                     [else (loop (add1 i) sum)]))])
    (loop 1 0)))
                     

; find all perfect numbers < n
(define (perfect-numbers n)
  (if (zero? n) '()
      (if (perfect? n)
          (cons n (perfect-numbers (sub1 n)))
          (perfect-numbers (sub1 n)))))

; use futures to speed-up things
(define (perfect-numbers-futures n)
  (letrec ([f (for/list ([i (in-range 1 n)]) (future (λ () (perfect? i))))]
           [loop (λ (futs idx)
                   (cond
                     [(null? futs) '()]
                     [(touch (car futs)) (cons idx (loop (cdr futs) (add1 idx)))]
                     [else (loop (cdr futs) (+ 1 idx))]))])
    (loop f 1)))

