;;;; let-over-lambda.asd
;;; ASDF definition file for code of the let-over-lambda book
;;;
;;; vim: ft=lisp

(asdf:defsystem #:let-over-lambda
  :serial t
  :description "Code from the Let over Lambda book on Common Lisp macros"
  :author "Kay-Uwe Kirstein <kayuwe.kirstein@uster.com>"
  :license "MIT"
  :components ((:module "chapter-1"
                        :components
                        ((:file "list-helper")))))
