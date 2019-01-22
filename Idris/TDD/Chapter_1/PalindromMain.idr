-- PalindromeMain.idr
-- App for checking palindromes

module Main

import Exercises

main : IO ()
main = repl "Enter a string: " (\s => (show $ palindrome s) ++ "\n")

