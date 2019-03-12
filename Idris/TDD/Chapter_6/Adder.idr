-- Adder.idr

-- Demonstrate functions with variable number of arguments by an
-- adder function

AdderType : (numargs : Nat) -> Type -> Type
AdderType Z numType = numType
AdderType (S k) numType = (next : numType) -> AdderType k numType


||| An adder function for variable number of arguments
adder : Num numType => (numargs : Nat) -> (acc : numType) -> AdderType numargs numType
adder Z acc = acc
adder (S k) acc = \next => adder k (next + acc)

