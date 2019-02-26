-- PrintLength.idr

-- Perform I/O operations with the (>>=) sequencing operator

printLength : IO ()
printLength = getLine >>= \input => let len = length input in
                                        putStrLn (show len)




