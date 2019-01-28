-- PalindromeMain.idr
-- App for checking palindromes

module Main

import Exercises

main : IO ()
main = repl "Enter a string: " (\s => format $ countWithSpace s)
  where
    format : (Nat, Nat) -> String
    format c = "Number of words: " ++ (show (fst c)) ++ ", " ++
               "number of Chars: " ++ (show (snd c)) ++ "\n"



