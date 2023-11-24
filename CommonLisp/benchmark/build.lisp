(asdf:load-asd #P"C:/Users/kayuwe.kirstein/Workspaces/Misc/proglang-playground/CommonLisp/benchmark/benchmark.asd")
(ql:quickload "benchmark")
(sb-ext:save-lisp-and-die
  "benchmark.core"
  :compression nil
  :toplevel #'benchmark:main
  :executable t)
