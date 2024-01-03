;;;; mandelbrot.lisp
;;; Compute Mandelbrot set in Lisp
;;;

(defpackage :benchmark/mandelbrot
  (:use :cl :imago)
  (:export :make-mandelbrot))

(in-package :benchmark/mandelbrot)
;(declaim (optimize (speed 3) (debug 0) (safety 0)))

;;
;; global variables
;;
(declaim
  (type float *r-max*)
  (type fixnum *n-max* *color-max*))
(defparameter *n-max* 200)
(defparameter *r-max* 2.0)
(defparameter *color-max* 255)

;; 
;; compute pixel value
;;
(defun pixel-value (Z0)
  "Compute pixel value for complex value Z0"
  (declare (type (complex single-float) Z0))
  (do ((N *n-max* (1- N))
       (Z Z0 (+ (* Z Z) Z0)))
      ((or (zerop N) (> (abs Z) *r-max*)) (the fixnum N))))

;;
;; get b/w value for given pixel coordinates
;;
(defun pixel-value-bw (X Y X-OFFSET Y-OFFSET PIXEL-SIZE)
  "Calculate B/W vallue for given pixel coordinates and scaling"
  (declare (type fixnum X Y)
           (single-float X-OFFSET Y-OFFSET PIXEL-SIZE))
  (let ((x-val (+ (* X PIXEL-SIZE) X-OFFSET))
        (y-val (- (* Y PIXEL-SIZE) Y-OFFSET)))
    (if (zerop (pixel-value (complex x-val y-val)))
        0
        *color-max*)))

;;
;; calculate rgb values for given pixel coordinates
;;
(defun pixel-value-rgb (x y x-offset y-offset pixel-size)
  "Calculate RGB value for given pixel coordinated and scaling"
  (declare (type fixnum X Y)
           (single-float X-OFFSET Y-OFFSET PIXEL-SIZE))
  (let* ((x-val (+ (* x pixel-size) x-offset))
         (y-val (- (* y pixel-size) y-offset))
         (val (pixel-value (complex x-val y-val))))
    (list (* 5 (mod val 15)) (* 32 (mod val 7)) (* 8 (mod val 31)))))

;;
;; generate Mandelbort set of given size & coordinates
;;
(defun make-mandelbrot (width height x-center y-center pixel-size)
  "Generate Mandelbrot set for given size & coordinates"
  (declare (type fixnum width height)
           (single-float x-center y-center pixel-size))
  (let ((x-offset (- x-center (* 0.5 pixel-size (1+ width))))
        (y-offset (+ y-center (* 0.5 pixel-size (1+ height))))
        (img (imago:make-rgb-image width height)))
    (imago:do-image-pixels (img color x y)
      (setf color (apply #'imago:make-color (pixel-value-rgb x y x-offset y-offset pixel-size))))
    img))

;;
;; generate b/w PGM file
;;
(defun write-pgm-bw (FILE-NAME X-MAX Y-MAX X-CENTER Y-CENTER PIXEL-SIZE)
  "Generate PGM file with B/W Mandelbrot set"
  (declare (type fixnum X-MAX Y-MAX)
           (single-float X-CENTER Y-CENTER PIXEL-SIZE))
  (let ((x-offset (- X-CENTER (* 0.5 PIXEL-SIZE (1+ X-MAX))))
        (y-offset (+ Y-CENTER (* 0.5 PIXEL-SIZE (1+ Y-MAX)))))
    (with-open-file (stream (make-pathname :name FILE-NAME) :direction :output :if-exists :supersede)
      (progn (format stream "P2~%")
             (format stream "~d~%" X-MAX)
             (format stream "~d~%" Y-MAX)
             (format stream "~d~%" *color-max*)
             (do ((j 1 (1+ j)))
                 ((> j Y-MAX) nil)
               (do ((i 1 (1+ i)))
                   ((> i X-MAX) nil)
                 (format stream "~d~%" (pixel-value-bw i j x-offset y-offset PIXEL-SIZE))))))))

;;
;; generate rgb PGM file
;;
(defun write-pgm-rgb (FILE-NAME X-MAX Y-MAX X-CENTER Y-CENTER PIXEL-SIZE)
  "Generate PGM file with RGB Mandelbrot set"
  (let ((x-offset (- X-CENTER (* 0.5 PIXEL-SIZE (1+ X-MAX))))
        (y-offset (+ Y-CENTER (* 0.5 PIXEL-SIZE (1+ Y-MAX)))))
    (with-open-file (stream (make-pathname :name FILE-NAME) :direction :output :if-exists :supersede)
      (progn (format stream "P3~%")
             (format stream "~d~%" X-MAX)
             (format stream "~d~%" Y-MAX)
             (format stream "~d~%" *color-max*)
             (do ((j 1 (1+ j)))
                 ((> j Y-MAX) nil)
               (do ((i 1 (1+ i)))
                   ((> i X-MAX) nil)
                 (format stream "~{~a ~}~%" (pixel-value-rgb i j x-offset y-offset PIXEL-SIZE))))))))
