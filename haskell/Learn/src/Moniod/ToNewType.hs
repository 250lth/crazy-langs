module Moniod.ToNewType where

import Control.Applicative

-- type to applicative functor
-- use <*>
res1 = [(+1),(*100),(*5)] <*> [1,2,3]
-- zipList
res2 = getZipList $ ZipList [(+1),(*100),(*5)] <*> ZipList [1,2,3]


--- newtype kw to def ZipList
-- newtype ZipList a = ZipList { getZipList :: [a] }
-- newtype is faster than data, because the complier knows that the new type is created from a existed type
-- newtype just has one field, data has one or more

-- newtype can deriving
newtype CharList = CharList { getCharList :: [Char] } deriving (Eq, Show)
res3 = CharList "this will be shown"
res4 = CharList "benny" == CharList "benny"
res5 = CharList "benny" == CharList "oisters"


--- use newtype to create type instance
newtype Pair b a = Pair { getPair :: (a, b) }
-- create it as Functor instance
instance Functor (Pair c) where
    fmap f (Pair (x, y)) = Pair (f x, y)

res6 = getPair $ fmap (*100) (Pair (2,3))
res7 = getPair $ fmap reverse (Pair ("london calling", 3))


--- newtype is lazy
data CoolBool = CoolBool { getCoolBool :: Bool }
helloMe :: CoolBool -> String
helloMe (CoolBool _) = "hello"
res8 = helloMe undefined -- Exception
-- use newtype instead
newtype CoolBool1 = CoolBool1 { getCoolBool1 :: Bool }
helloMe1 :: CoolBool1 -> String
helloMe1 (CoolBool1 _) = "hello"
res9 = helloMe1 undefined

--- type, newtype and data
-- type just give alias
type IntList = [Int]
res10 = ([1,2,3] :: IntList) ++ ([1,2,3] :: [Int])
-- newtype use existed type to create newtype
-- data creates a complete new type