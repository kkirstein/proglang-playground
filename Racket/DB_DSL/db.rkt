#lang racket
(require (for-syntax syntax/parse))

; basic procedures of DB DSL
(define the-db (make-hash))

(define (get-it key)
  (hash-ref the-db key))

(define (put-it key val)
  (hash-set! the-db key val))

(define (print-it x)
  (display (format "~v" x))
  (newline))

; parse embedded DSL
; e.g., (db (PUT "Hallo" 35))
(define-syntax (db form)
 (syntax-parse form
   [(db (SHOW-DB))
    #'(print-it the-db)]
   [(db (PRINT x))
    #'(print-it x)]
   [(db (PUT name val))
    #'(put-it name val)]
   [(db (var = GET name))
    #'(define var (get-it name))]))

