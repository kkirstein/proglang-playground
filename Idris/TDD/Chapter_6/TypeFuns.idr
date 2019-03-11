-- TypeFuns.idr

-- Demonstrates type functions to calculate stuff for either an int or string

StringOrInt : Bool -> Type
StringOrInt False = String
StringOrInt True = Int

||| Returns a String or Int literal, depending on the input
||| parameter.
getStringOrInt : (isInt : Bool) -> StringOrInt isInt
getStringOrInt False = "Ninety four"
getStringOrInt True = 94


||| Converts the given StringOrInt to a (trimmed) String
valToString : (isInt : Bool) -> StringOrInt isInt -> String
valToString False y = trim y
valToString True y = cast y

||| Converts the given StringOrInt to a (trimmed) String
||| Alternative implementation using a case construct
||| in the type signature
valToString2 : (isInt : Bool) -> (case isInt of
                                       False => String
                                       True => Int) -> String
valToString2 False y = trim y
valToString2 True y = cast y


