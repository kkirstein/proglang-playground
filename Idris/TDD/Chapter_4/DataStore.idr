-- DataStore.idr
--
-- A simple Vect-based data store with
-- integer key and string values

module Main

import Data.Vect

||| A record-style DataStore type
data DataStore : Type where
  MkData : (size : Nat) ->
           (items : Vect size String) ->
           DataStore

size : DataStore -> Nat
size (MkData size' items') = size'

items : (store : DataStore) -> Vect (size store) String
items (MkData size' items') = items'

addToStore : DataStore -> String -> DataStore
addToStore (MkData size items) newItem = MkData _ (addToData items)
  where
    addToData : Vect old String -> Vect (S old) String
    addToData [] = [newItem]
    addToData (x :: xs) = x :: (addToData xs)




||| Processes given String command
processInput : DataStore -> String -> Maybe (String, DataStore)

-- entry point
main : IO ()
main = replWith (MkData 0 []) "Command: " processInput




