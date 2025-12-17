-- Tutorial
-- 1.1 Evaluating Expressiong

#eval 42 + 19

#eval String.append "A" (String.append "B" "C")

#eval String.append (String.append "A" "B") "C"

#eval if 3 == 3 then 5  else 7

#eval if 3 == 4 then "equal" else "not equal"

-- 1.2 Types

#eval (1 + 2 : Nat)
#eval (1 -2 : Nat)
#eval (1 -2 : Int)

--#check String.append ["hello", " "] "world"

-- 1.3 Function and Definitions

-- 1.3.1 Defining Functions

def hello := "Hello"
def lean : String := "Lean"

#eval String.append hello (String.append " " lean)

def add1 (n : Nat) : Nat := n + 1

#eval add1 7

def maximum (n :Nat) (k : Nat) :Nat :=
  if n > k then
    k
  else n

#eval maximum (5 + 8) (2 * 7)
#check (maximum)

def joinStringsWith (sep : String) (before : String) (after : String) :=
  String.append before (String.append sep after)

#check (joinStringsWith)
#eval joinStringsWith ", " "Hello" "World"
#check joinStringsWith ", "

def volume (height : Nat) (width : Nat) (depth : Nat) := height * width * depth

-- 1.3.2 Defining Types

def NaturalNumber : Type := Nat

def thirtyEight : NaturalNumber := (38 : Nat)

abbrev N : Type := Nat

def ThirtyTwo : N := 32
