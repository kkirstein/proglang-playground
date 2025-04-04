-- DataStore.idr
--
-- A simple Vect-based data store with
-- integer key and string values

module Main

import Data.Vect

infix 5 .+.

data Schema = SString
            | SInt
            | (.+.) Schema Schema

SchemaType : Schema -> Type
SchemaType SString = String
SchemaType SInt = Int
SchemaType (x .+. y) = (SchemaType x, SchemaType y)

||| A record-style DataStore type
record DataStore where
       constructor MkData 
       schema : Schema
       size : Nat
       items : Vect size (SchemaType schema)

{-
addToStore : DataStore -> String -> DataStore
addToStore (MkData size items) newItem = MkData _ (addToData items)
  where
    addToData : Vect old String -> Vect (S old) String
    addToData [] = [newItem]
    addToData (x :: xs) = x :: (addToData xs)


||| commands for data store
data Command = Add String
             | Get Integer
             | Search String
             | Size
             | Quit


parseCommand : (cmd : String) -> (args : String) -> Maybe Command
parseCommand "add" str = Just (Add str)
parseCommand "get" val = case all isDigit (unpack val) of
                              False => Nothing
                              True => Just (Get (cast val))
parseCommand "search" str = Just (Search str)
parseCommand "size" "" = Just Size
parseCommand "quit" "" = Just Quit
parseCommand _ _ = Nothing

||| Parses given string and returns matching command
||| if sucessful (or Nothing in case of invalid string)
parse : (input : String) -> Maybe Command
parse input = case span (/= ' ') input of
                   (cmd, args) => parseCommand cmd (ltrim args)



getEntry : (pos : Integer) -> (store : DataStore) -> Maybe (String, DataStore)
getEntry pos store = let store_items = items store in
                         case integerToFin pos (size store) of
                              Nothing => Just ("Out of range\n", store)
                              (Just id) => Just (index id store_items ++ "\n", store)


findEntriesString : (idx : Nat) -> (str : String) -> (items : Vect len String) -> String
findEntriesString idx str [] = "\n"
findEntriesString idx str (x :: xs) = if (isInfixOf str x)
                                         then (show idx) ++ ": " ++ x ++ "\n" ++ findEntriesString (idx + 1) str xs 
                                         else findEntriesString (idx + 1) str xs

findEntries : (str : String) -> (store : DataStore) -> String
findEntries str store = findEntriesString Z str (items store)

concatStringVect : (p : Nat ** Vect p (Nat, String)) -> String
concatStringVect (Z ** []) = "\n"
concatStringVect (S x ** ((id, str) :: items)) = (show id) ++ ": " ++ str ++ "\n" ++ concatStringVect (x ** items)

||| Processes given String command
processInput : DataStore -> String -> Maybe (String, DataStore)
processInput store input = case parse input of
                                Nothing => Just ("Unknown command: " ++ input ++ "\n", store)
                                Just (Add item) =>
                                  Just ("ID " ++ show (size store) ++ "\n", addToStore store item)
                                Just (Get pos) => getEntry pos store
                                Just (Search str) =>
                                  Just (findEntries str store, store)
                                Just Size =>
                                  Just ("Size: " ++ cast (size store) ++ "\n", store)
                                Just Quit => Nothing

-- entry point
main : IO ()
main = replWith (MkData 0 []) "Command: " processInput

-}


