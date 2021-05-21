;;;; benchmark.lisp

(in-package #:benchmark)

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
    (time (format t "(fib-naive 35) = ~a~%" (fibonacci:fibonacci-2 35)))
    (format t "Fibonacci series (linear recursive approach):~%")
    (time (format t "(fib 10000) = ~a~%" (fibonacci:fibonacci 10000)))
    (format t "~%")
    

    ;;
    ;; time computation of perfect numbers
    ;;
    (format t "Perfect numbers:~%")
    (format t "----------------~%")
    (time (format t "(perfect-numbers 10000) = ~a~%" (perfect-numbers:make-perfect-numbers 10000)))
    (format t "~%")

    ;;
    ;; time computation of Mandelbrot sets
    ;;
    (defparameter bw-file "mandelbrot_bw.pgm")
    (defparameter rgb-file "mandelbrot_rgb.ppm")
    (format t "Mandelbrot sets:~%")
    (format t "----------------~%")
    (time (mandelbrot:write-pgm-bw bw-file 180 120 -0.5 0.0 (/ 4.0 180)))
    (time (mandelbrot:write-pgm-bw bw-file 640 480 -0.5 0.0 (/ 4.0 640)))
    (time (mandelbrot:write-pgm-rgb rgb-file 640 480 -0.5 0.0 (/ 4.0 640)))
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

