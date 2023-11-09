;;; hello-1.lisp
;;; Simple ltk GUIs in common lisp
;;; 
(in-package #:ltk-demo)

;(use-package #:ltk)
; set correct path for windows version of tk
(setf *wish-pathname* "C:/Users/kayuwe.kirstein/AppData/Local/Apps/Tcl86/bin/wish.exe")

;; hello world example
(defun hello-1 ()
  (with-ltk ()
    (let ((b (make-instance 'button
                            :master nil
                            :text "Press Me"
                            :command (lambda ()
                                       (format t "Hello World!~&")))))
      (pack b))))

