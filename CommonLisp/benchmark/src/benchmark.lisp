;;;; benchmark.lisp

(in-package #:benchmark)

;;; "benchmark" goes here. Hacks and glory await!
;;;
(defun main ()
  (progn

    ;;
    ;; time different versions of Fibanocci calculations
    ;;
    (format t "Fibonacci series (double recursive approach):~%")
    (time (fibonacci:fibonacci-2 35))
    (format t "Fibonacci series (linear recursive approach):~%")
    (time (fibonacci:fibonacci 1000))
    (format t "~%")

    ;;
    ;; time computation of perfect numbers
    ;;
    (format t "Perfect numbers:~%")
    (time (perfect-numbers:make-perfect-numbers 10000))
    (format t "~%")

    ;;
    ;; time computation of Mandelbrot sets
    ;;
    (defconstant bw-file "mandelbrot_bw.pgm")
    (defconstant rgb-file "mandelbrot_rgb.pgm")
    (format t "Mandelbrot sets:~%")
    (time (mandelbrot:write-pgm-bw bw-file 180 120 -0.5 0.0 (/ 4.0 180)))
    (time (mandelbrot:write-pgm-bw bw-file 640 480 -0.5 0.0 (/ 4.0 640)))
    (time (mandelbrot:write-pgm-rgb rgb-file 640 480 -0.5 0.0 (/ 4.0 640)))
    (format t "~%")

    ;;
    ;; clean-up and finish
    ;;
    (format t "DONE~%")

    :DONE))

;;
;; call main entry point
;;
;(main)

