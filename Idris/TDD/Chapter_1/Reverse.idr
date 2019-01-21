-- Reverse.idr
-- Reversing string interactively, using 'repl'

module Main

main : IO ()
main = repl "> " reverse

