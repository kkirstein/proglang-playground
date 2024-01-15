#lang racket
; playground for DSL macros
(require (for-syntax syntax/parse))
(define-syntax (infix form)
  (syntax-parse form
    [(infix (zahl1 op zahl2))
     #'(op zahl1 zahl2)]))

