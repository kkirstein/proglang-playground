-- Exercises_5_3.idr

-- Read a List from stdin and write content to given file

readToBlank : IO (List String)
readToBlank = do putStrLn "Enter text (blank line to end):"
                 x <- getLine
                 if x == ""
                    then pure []
                    else do xs <- readToBlank
                            pure (x :: xs)



readAndSave : IO ()



