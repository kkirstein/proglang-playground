-- HOF.idr
-- Higher order functions

twice : (a -> a) -> a -> a
twice f x = f (f x)

Shape : Type
rotate : Shape -> Shape

-- taken from Generic.idr:
double : Num ty => ty -> ty
double x = x + x

quadruple : Num a => a -> a
quadruple = twice double

turn_around : Shape -> Shape
turn_around = twice rotate


