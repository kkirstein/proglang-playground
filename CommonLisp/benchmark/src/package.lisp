;;;; package.lisp
;;; Package definitions for benchmark app
;;;

;;
;; package benchmark (entry point)
;;
(defpackage :benchmark
  (:use :cl)
  (:export :main))

;;
;; package fibonacci
;;
(defpackage :benchmark/fibonacci
  (:use :cl)
  (:export :fibonacci :fibonacci-2))

;;
;; package perfect-numbers
;;
(defpackage :benchmark/perfect-numbers
  (:use :cl)
  (:export :perfectp :make-perfect-numbers))

;; 
;; package mandelbrot
;;
(defpackage :benchmark/mandelbrot
  (:use :cl)
  (:export :write-pgm-bw :write-pgm-rgb))
