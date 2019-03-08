-- PrintLength.idr

-- Perform I/O operations with the (>>=) sequencing operator

printLength : IO ()
printLength = getLine >>= \input => let len = length input in
                                        putStrLn (show len)

printLonger : IO ()
printLonger = do
  s1 <- getLine
  s2 <- getLine
  let (len1, len2) = (length s1, length s2)
  let lenLonger = if len1 > len2 then len1 else len2
  putStrLn (show lenLonger)

printLonger2 : IO ()
printLonger2 = getLine >>= \s1 =>
               getLine >>= \s2 =>
               let (len1, len2) = (length s1, length s2)
                   lenLonger = if len1 > len2 then len1 else len2 in
                   putStrLn (show lenLonger)


