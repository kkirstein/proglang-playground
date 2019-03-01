-- Exercise_5_2.idr

-- Implement a guessing game fro numbers

module Main

import System
import ReadNum

||| Guessing game: Interactive dialogs to guess a given number.
||| @target the number to be guessed
||| @guesses the number of trials
guess : (target : Nat) -> (guesses : Nat) -> IO ()
guess target guesses =
  do putStr ("Guess my number " ++ "(" ++ (show guesses) ++ " trial): ")
     Just trial <- readNumber | Nothing => (putStrLn "Invalid input! Try again.." >>= \_ =>
                                          guess target guesses)
     case compare trial target of
          EQ => putStrLn "Correct!"
          LT => putStrLn "Too small, try again.." >>= \_ => guess target (S guesses)
          GT => putStrLn "Too large, try again.." >>= \_ => guess target (S guesses)


||| Mimic replWith function from Prelude module
myReplWith : (state : a) -> (prompt : String) -> (onInput : a -> String -> Maybe (String, a)) -> IO ()


||| Mimic repl function from Prelude module
myRepl : (prompt : String) -> (onInput : String -> String) -> IO ()


main : IO ()
main = do
  tsecs <- time
  let target = tsecs `mod` 100
  guess (cast target) 1


