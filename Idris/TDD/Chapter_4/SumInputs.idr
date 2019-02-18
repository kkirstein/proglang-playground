-- SumInputs.idr
--
-- A simple interactive program to sum input values




sumInputs : Integer -> String -> Maybe (String, Integer)
sumInputs tot inp = let val = cast inp in
                        if val < 0
                           then Nothing
                           else let newVal = tot + val in
                                    Just ("Subtotal: " ++ show newVal ++ "\n", newVal)

-- entry point
main : IO ()
main = replWith 0 "Value: " sumInputs



