;;;; mandelbrot.lisp
;;; Compute Mandelbrot set in Lisp
;;;

(in-package mandelbrot)

;;
;; global variables
;;
(defparameter *width* 4.0)
(defparameter *n-max* 200)
(defparameter *r-max* 2.0)
(defparameter *color-max* 255)

;; 
;; compute pixel value
;;
(defun pixel-value (Z0)
  "Compute pixel value for complex value Z0"
  (let ((Z Z0))
    (do ((N *n-max* (1- N)))
      ((or (zerop N) (> (abs Z) *r-max*)) N)
      (setf Z (+ (* Z Z) Z0)))))

;;
;; get b/w value for given pixel coordinates
;;
(defun pixel-value-bw (X Y X-OFFSET Y-OFFSET PIXEL-SIZE)
  "Calculate B/W vallue for given pixel coordinates and scaling"
  (let ((x-val (+ (* X PIXEL-SIZE) X-OFFSET))
	(y-val (- (* Y PIXEL-SIZE) Y-OFFSET)))
    (if (zerop (pixel-value (complex x-val y-val)))
      0
      *color-max*)))
;;
;;
;; get rgb value for given pixel coordinates
;;
(defun pixel-value-rgb (X Y X-OFFSET Y-OFFSET PIXEL-SIZE)
  "Calculate RGB vallue for given pixel coordinates and scaling"
  (let* ((x-val (+ (* X PIXEL-SIZE) X-OFFSET))
	(y-val (- (* Y PIXEL-SIZE) Y-OFFSET))
	(val (pixel-value (complex x-val y-val))))
    (if (zerop val)
      '(0 0 0)
      (elt *color-map* val))))

;;
;; generate b/w PGM file
;;
(defun write-pgm-bw (FILE-NAME X-MAX Y-MAX X-CENTER Y-CENTER PIXEL-SIZE)
  "Generate PGM file with B/W Mandelbrot set"
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


