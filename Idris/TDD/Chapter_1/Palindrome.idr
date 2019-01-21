-- Palindrom.idr
-- Check if words are palindromes

module Palindrome

||| Checks whether the given word is a palindrome
||| The check is case-insensitive
||| @str A string to be checked
export
palindrome : (str : String) -> Bool
palindrome str = let lstr = toLower str
                     rev = reverse lstr in
                     lstr == rev

||| Checks whether the given word is a palindrome
||| The check is case-insensitive and a minimum word
||| length is required.
||| @minLen Minimum required word length for palindrome
||| @str A string to be checked
export
palindromeMinLen : (minLen : Nat) -> (str : String) -> Bool
palindromeMinLen minLen str = let wordLength = length str
                                  lstr = toLower str
                                  rev = reverse lstr in
                                  (wordLength > minLen) && (lstr == rev)



