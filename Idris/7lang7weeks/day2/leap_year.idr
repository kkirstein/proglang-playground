-- vim: ft=idris sw= ts=2 et

import Data.So

-- validation defs
isLeap : Integer -> Bool
isLeap year = (mod year 400 == 0) ||
              ((mod year 4 == 0) && not (mod year 100 == 0))

numberOfDays : Integer -> Integer -> Integer
numberOfDays year 2 = if isLeap year then 29 else 28
numberOfDays _    9 = 30
numberOfDays _    4 = 30
numberOfDays _    6 = 30
numberOfDays _   11 = 30
numberOfDays _    _ = 31

validateDate : Integer -> Integer -> Integer -> Bool
validateDate year month day = (day >= 1) &&
                              (day <= numberOfDays year month) &&
                              (month >= 1) &&
                              (month <= 12)

-- Date data type
data Date : Integer -> Integer -> Integer -> Type where
  makeDate : (y:Integer) -> (m:Integer) -> (d:Integer) -> So (validateDate y m d) -> Date y m d

dataFromUnsafeInput : (y:Integer) -> (m:Integer) -> (d:Integer)
                      -> Maybe (Date y m d)
dataFromUnsafeInput y m d = case choose (validateDate y m d) of
                                 Left valid => Just (makeDate y m d valid)
                                 Right _    => Nothing
