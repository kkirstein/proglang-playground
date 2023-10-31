;;;; benchmark.lisp

(defpackage :benchmark
  (:use :cl)
  (:export :main))
(in-package :benchmark)

;;; "benchmark" goes here. Hacks and glory await!
;;;
(defun main ()
  (progn

   (format t "Benchmark~%")
   (format t "=========~%")
   ;;
   ;; time different versions of Fibanocci calculations
   ;;
   (format t "Fibonacci series:~%")
   (format t "-----------------~%")

   (format t "Fibonacci series (double recursive approach):~%")
   (format t "(fib-naive 35) = ~a~%" (time (fibonacci:fibonacci-2 35)))
   (format t "~%")
   (format t "Fibonacci series (linear recursive approach):~%")
   (format t "(fib 10000) = ~a~%" (time (fibonacci:fibonacci 10000)))
   (format t "~%")

   ;;
   ;; time computation of perfect numbers
   ;;
   (format t "Perfect numbers:~%")
   (format t "----------------~%")
   (format t "(perfect-numbers 10000) = ~a~%" (time (perfect-numbers:make-perfect-numbers 10000)))
   (format t "~%")

   ;;
   ;; time computation of Mandelbrot sets
   ;;
   (defparameter bw-file "mandelbrot_bw.pgm")
   (defparameter rgb-file "mandelbrot_rgb.ppm")
   (format t "Mandelbrot sets:~%")
   (format t "----------------~%")
   (time (mandelbrot:write-pgm-bw bw-file 640 480 -0.5 0.0 (/ 4.0 640)))
   (time (mandelbrot:write-pgm-rgb rgb-file 640 480 -0.5 0.0 (/ 4.0 640)))
   (time (mandelbrot:write-pgm-rgb rgb-file 1920 1600 -0.5 0.0 (/ 4.0 1920)))
   (format t "~%")

   ;;
   ;; Monte-Carlo simulations
   ;;
   ;(format t "Monte-Carlo simulations:~%")
   ;(format t "------------------------~%")

   ;;
   ;; clean-up and finish
   ;;
   (format t "DONE~%"))

  :DONE)

;;
;; call main entry point
;;
;(main)
