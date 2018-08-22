
data DumbNumber = Naught | One | Two |Three

data Natural = Zero | After Natural

-- A polymorphic list
data MyList a = Blank | (::) a (MyList a)

first : MyList a -> Maybe a
first Blank = Nothing
first (x :: xs) = Just x


