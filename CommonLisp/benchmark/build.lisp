(asdf:load-asd #p"C:/Users/kayuwe.kirstein/Workspaces/Misc/proglang-playground/CommonLisp/benchmark/benchmark.asd")
(ql:quickload "benchmark")
(sb-ext:save-lisp-and-die
  "benchmark"
  :compression nil
  :toplevel #'benchmark:main
  :executable t)
