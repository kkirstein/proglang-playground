;;;; ltk-demo.asd
;; vim: ft=lisp

(asdf:defsystem #:ltk-demo
  :serial t
  :description "Demo project for ltk-based GUIs"
  :author "Kay-Uwe Kirstein <kayuwe.kirstein@uster.com>"
  :license "none specified"
  :depends-on (#:ltk)
  :components ((:file "package")
               (:file "ltk-demo")
               (:file "hello-1" :depends-on ("package"))))

