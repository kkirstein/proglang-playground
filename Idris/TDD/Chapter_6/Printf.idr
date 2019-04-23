-- Printf.idr
-- A C-style printf function, demonstarting
-- variable function arguments


module Printf

export
data Format = Num Format
            | Chr Format
            | Dbl Format
            | Str Format
            | Lit String Format
            | End

%name Format fmt

export
PrintfType : Format -> Type
PrintfType (Num fmt) = (i : Int) -> PrintfType fmt
PrintfType (Chr fmt) = (c : Char) -> PrintfType fmt
PrintfType (Dbl fmt) = (f : Double) -> PrintfType fmt
PrintfType (Str fmt) = (str : String) -> PrintfType fmt
PrintfType (Lit str fmt) = PrintfType fmt
PrintfType End = String


||| Generates a string from the given format spec
export
printfFmt : (fmt : Format) -> (acc : String) -> PrintfType fmt
printfFmt (Num fmt) acc = \i => printfFmt fmt (acc ++ (show i))
printfFmt (Chr fmt) acc = \c => printfFmt fmt (acc ++ (show c))
printfFmt (Dbl fmt) acc = \f => printfFmt fmt (acc ++ (show f))
printfFmt (Str fmt) acc = \str => printfFmt fmt (acc ++ str)
printfFmt (Lit str fmt) acc = printfFmt fmt (acc ++ str)
printfFmt End acc = acc

||| Convert given char list to format data type
export
toFormat : (xs : List Char) -> Format
toFormat [] = End
toFormat ('%' :: 'd' :: chars) = Num (toFormat chars)
toFormat ('%' :: 'c' :: chars) = Chr (toFormat chars)
toFormat ('%' :: 'f' :: chars) = Dbl (toFormat chars)
toFormat ('%' :: 's' :: chars) = Str (toFormat chars)
toFormat ('%' :: chars) = Lit "%" (toFormat chars)
toFormat (c :: chars) = case toFormat chars of
                             (Lit lit chars') => Lit (strCons c lit) chars'
                             fmt => Lit (strCons c "") fmt

||| Outputs the given format string as String
||| @fmt Format specification
export
printf : (fmt : String) -> PrintfType (toFormat (unpack fmt))
printf fmt = printfFmt _ ""



