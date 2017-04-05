module BuildTypes.TypeSynonyms where

import qualified Data.Map as Map

--- using "type" to add a synonyms to a type
-- type String = [Char]

--- A more beautiful phonebook
phoneBook = [
             ("betty", "555-2938"),
             ("bonnie", "452-2928"),
             ("pasty", "493-2928"),
             ("lucille", "205-2928"),
             ("wendy", "939-8282"),
             ("penny", "853-2492")]

type PhoneNumber = String
type Name = String
type PhoneBook = [(Name, PhoneNumber)]

inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
inPhoneBook name pnumber pbook = (name, pnumber) `elem` pbook

--- Parameterization type synonyms
--type AssocList k v = [(k,v)]
--type IntMap v = Map Int v
--type IntMap1 = Map Int

--- go left or right
-- Either a b
-- data Either a b = Left a | Right b deriving (Eq, Ord, Read, Show)
res1 = Right 20
res2 = Left "w00t"

-- sample
data LockerState = Taken | Free deriving (Show, Eq)
type Code = String
type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber map = case Map.lookup lockerNumber map of
    Nothing -> Left $ "Locker" ++ show lockerNumber ++ " doesn't exist!"
    Just (state, code) -> if state /= Taken
    then Right code
    else Left $ "Locker" ++ show lockerNumber ++ " is already taken!"

lockers :: LockerMap
lockers = Map.fromList
    [(100,(Taken,"ZD39I"))
    ,(101,(Free,"JAH3I"))
    ,(103,(Free,"IQSA9"))
    ,(105,(Free,"QOTSA"))
    ,(109,(Taken,"893JJ"))
    ,(110,(Taken,"99292"))]

res3 = lockerLookup 101 lockers
res4 = lockerLookup 100 lockers
res5 = lockerLookup 102 lockers
res6 = lockerLookup 110 lockers
res7 = lockerLookup 105 lockers