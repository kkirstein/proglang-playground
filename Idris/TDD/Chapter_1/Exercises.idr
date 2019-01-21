-- Exercises.idr
-- Solutions for exercises of chapter 1

module Exercises

-- Check if words are palindromes

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


-- Count words & characters

||| Counts the number of words and characters of the given string.
||| Whitespace is ignored.
||| @str A string to be counted
export
counts : (str : String) -> (Nat, Nat)
counts str = let ww = words str
                 numWords = length ww
                 numChars = sum (map length ww) in
                 (numWords, numChars)

||| Counts the number of words and characters of the given string.
||| Whitespace is included..
||| @str A string to be counted
export
countWithSpace : (str : String) -> (Nat, Nat)
countWithSpace str = let ww = words str
                         numWords = length ww
                         numChars = length str in
                         (numWords, numChars)


-- Extract top 10 values

||| Extracts the 10 largest values from given list
||| ('top ten')
||| @l List with numeric values
export
top_ten : Ord a => (l : List a) -> List a
top_ten l = take 10 $ reverse $ sort l

