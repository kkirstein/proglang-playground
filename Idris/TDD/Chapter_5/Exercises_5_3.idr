-- Exercises_5_3.idr

-- Read a List from stdin and write content to given file

import Data.Vect

||| Reads a list of strings from stdin, until a blank line is given
readToBlank : IO (List String)
readToBlank = do putStrLn "Enter text (blank line to end):"
                 x <- getLine
                 if x == ""
                    then pure []
                    else do xs <- readToBlank
                            pure (x :: xs)

||| Converts a list of strings to a single string,
||| where each list entry is separated by newline
||| @ls List of String
spreadListToLines : (ls : List String) -> String
spreadListToLines [] = "\n"
spreadListToLines (x :: xs) = x ++ "\n" ++ spreadListToLines xs


||| Reads a list of string from stdin and writes it
||| to the given filename
readAndSave : IO ()
readAndSave = do
  ls <- readToBlank
  putStr "Enter filename: "
  fileName <- getLine
  Right () <- writeFile fileName (spreadListToLines ls)
  putStrLn ("Data written to file " ++ fileName ++ "\n")



readLines : (fid : File) -> IO (n : Nat ** Vect n String)
readLines fid = do
  eof <- fEOF fid
  if eof
     then pure (_ ** [])
     else do Right x <- fGetLine fid | Left err => do
                   putStrLn ("Error: " ++ (show err))
                   pure (_ ** [])
             (_ ** xs) <- readLines fid
             pure (_ ** (x :: xs))

||| Read a Vect of string from a given file.
||| Each line is an Vect entry
readVectFile : (filename : String) -> IO (n ** Vect n String)
readVectFile filename = do
  Right fid <- openFile filename Read | Left err => do
    putStrLn ("Error: " ++ (show err))
    pure (0 ** [])
  readLines fid



