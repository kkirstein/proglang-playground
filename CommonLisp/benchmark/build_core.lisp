;; get some filesystem utilities
(ql:quickload "uiop")

;; get path to asdf system definition
(defparameter *asdf-file* (uiop:merge-pathnames* (uiop/os:getcwd) "benchmark.asd"))

;; load system and dump core
(asdf:load-asd *asdf-file*)
(ql:quickload "benchmark")
(sb-ext:save-lisp-and-die
  "benchmark.core"
  :compression nil
  :toplevel #'benchmark:main
  :executable nil)
