module HaskellModule.MapKV where

import qualified Data.Map as Map
import Data.Char

--- association list

-- implemention of Data.Map::lookup
phoneBook = [
             ("betty", "555-2938"),
             ("bonnie", "452-2928"),
             ("pasty", "493-2928"),
             ("lucille", "205-2928"),
             ("wendy", "939-8282"),
             ("penny", "853-2492")]

-- find a key
-- v1
findKey1 :: (Eq k) => k -> [(k,v)] -> v
findKey1 key xs = snd . head . filter (\(k,v) -> key == k) $ xs

-- v2: don't break when no key, use Maybe
findKey2 :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey2 key [] = Nothing
findKey2 key ((k,v):xs)
    | key == k = Just v
    | otherwise = findKey2 key xs

res1 = findKey2 "penny" phoneBook
res2 = findKey2 "betty" phoneBook
res3 = findKey2 "wilma" phoneBook

-- v3: use fold to implement
findKey3 :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey3 key xs = foldr (\(k,v) acc -> if key == k then Just v else acc) Nothing xs

res4 = findKey3 "penny" phoneBook
res5 = findKey3 "betty" phoneBook
res6 = findKey3 "wilma" phoneBook

--- Use Data.Map

-- fromList will convert a accociate-list to a map
res7 = Map.fromList [(3, "shoes"),(4,"trees"),(9,"bees")]
res8 = Map.fromList [("kima","greggs"),("jimmy","mcnulty"),("jay","landsman")]
-- it will ignore old keys
res9 = Map.fromList [("MS",1),("MS",2),("MS",3)]

-- a map of phonebook
phoneBook2 :: Map.Map String String
phoneBook2 = Map.fromList $
            [("betty", "555-2938"),
             ("bonnie", "452-2928"),
             ("pasty", "493-2928"),
             ("lucille", "205-2928"),
             ("wendy", "939-8282"),
             ("penny", "853-2492")]

res10 = Map.lookup "betty" phoneBook2
res11 = Map.lookup "wendy" phoneBook2
res12 = Map.lookup "grace" phoneBook2

-- insert
newBook = Map.insert "grace" "341-9021" phoneBook2
res13 = Map.lookup "grace" newBook

-- size
res14 = Map.size phoneBook2
res15 = Map.size newBook

-- use Data.Char to change digit to int
string2digits :: String -> [Int]
string2digits = map digitToInt . filter isDigit

res16 = string2digits "948-9282"

-- use Data.Map::map to change numbers
intbook = Map.map string2digits phoneBook2
res17 = Map.lookup "betty" intbook

-- use fromListWith to deal with duplicated keys
phoneBook3 = [("betty", "555-2938"),
             ("betty", "342-2492"),
             ("pasty", "943-2929"),
             ("pasty", "827-9162"),
             ("bonnie", "452-2928"),
             ("pasty", "493-2928"),
             ("lucille", "205-2928"),
             ("wendy", "939-8282"),
             ("penny", "555-2111"),
             ("penny", "853-2492")
             ]

-- use fromListWith
phoneBookToMap :: (Ord k) => [(k, String)] -> Map.Map k String
phoneBookToMap xs = Map.fromListWith add xs
    where add number1 number2 = number1 ++ ", " ++ number2

res18 = Map.lookup "pasty" $ phoneBookToMap phoneBook3

-- put numbers into list
phoneBookToMap2 :: (Ord k) => [(k,a)] -> Map.Map k [a]
phoneBookToMap2 xs = Map.fromListWith (++) $ map (\(k,v) -> (k,[v])) xs

res19 = Map.lookup "pasty" $ phoneBookToMap2 phoneBook3

-- keep max when duplicated keys
res20 = Map.fromListWith max [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)]
-- add the same keys
res21 = Map.fromListWith (+) [(2,3),(2,5),(2,100),(3,29),(3,22),(3,11),(4,22),(4,15)]