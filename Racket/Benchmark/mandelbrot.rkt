#lang racket

; module mandelbrot
; Calculate Mandelbrot set in Racket
(require racket/draw)

(provide mandelbrot)

; global defs
(define max-n 255)
(define max-r 2)

; calculate pixel value
(define (iterations a z i)
  (let ([z′ (+ (* z z) a)])
    (if (or (= i max-n) (> (magnitude z′) max-r))
        i
        (iterations a z′ (add1 i)))))

; convert pixel value to color
(define (iter->color i)
  (if (= i 255)
      (make-object color% "black")
      (make-object color% (* 5 (modulo i 15)) (* 32 (modulo i 7)) (* 8 (modulo i 31)))))

(define (mandelbrot width height)
  (let* ([target (make-bitmap width height)]
         [dc (new bitmap-dc% [bitmap target])])
    (for* ([x width] [y height])
      (let ([real-x (- (* 3.0 (/ x width)) 2.25)]
            [real-y (- (* 2.5 (/ y height)) 1.25)])
        (send dc set-pen (iter->color (iterations (make-rectangular real-x real-y) 0 0)) 1 'solid)
        (send dc draw-point x y)))
    (send target save-file "mandelbrot.png" 'png)))
