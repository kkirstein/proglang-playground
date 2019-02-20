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


findEntries : (str : String) -> (store : DataStore) ->  (p : Nat ** Vect p String)
findEntries str store = let store_items = items store in
                            filter (== str) store_items

||| Processes given String command
processInput : DataStore -> String -> Maybe (String, DataStore)
processInput store input = case parse input of
                                Nothing => Just ("Unknown command: " ++ input ++ "\n", store)
                                Just (Add item) =>
                                  Just ("ID " ++ show (size store) ++ "\n", addToStore store item)
                                Just (Get pos) => getEntry pos store
                                Just (Search str) =>
                                  Just (?concateStringVect (findEntries str store), store)
                                Just Size =>
                                  Just ("Size: " ++ cast (size store) ++ "\n", store)
                                Just Quit => Nothing

-- entry point
main : IO ()
main = replWith (MkData 0 []) "Command: " processInput




