-- Exercises_5_3.idr

-- Read a List from stdin and write content to given file

readToBlank : IO (List String)
readToBlank = do putStrLn "Enter text (blank line to end):"
                 x <- getLine
                 if x == ""
                    then pure []
                    else do xs <- readToBlank
                            pure (x :: xs)

spreadListToLines : (ls : List String) -> String
spreadListToLines [] = "\n"
spreadListToLines (x :: xs) = x ++ "\n" ++ spreadListToLines xs


readAndSave : IO ()
readAndSave = do
  ls <- readToBlank
  putStr "Enter filename: "
  fileName <- getLine
  Right () <- writeFile fileName (spreadListToLines ls)
  putStrLn ("Data written to file " ++ fileName ++ "\n")



