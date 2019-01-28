-- PalindromeMain.idr
-- App for checking palindromes

module Main

import Exercises

main : IO ()
main = repl "Enter a string: " (\s => format $ palindrome s)
  where
    format : Bool -> String
    format x = (show x) ++ "\n"

