module BuildTypes.RecursiveDataStruct where

--- define List
--data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)
--data List a = Empty | Cons { listHead :: a, listTail :: List a }
--    deriving (Show, Read, Eq, Ord)

-- call the constructor using Cons
--res1 = Empty
--res2 = 5 `Cons` Empty
--res3 = 4 `Cons` (5 `Cons` Empty)
--res4 = 3 `Cons` (4 `Cons` (5 `Cons` Empty))

--- Optimization out list
-- name a function with special symbols, it can be seen as infix function
-- fixity declaration
infixr 5 :-:
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)

res5 = 3 :-: 4 :-: 5 :-: Empty
a = 3 :-: 4 :-: 5 :-: Empty
res6 = 100 :-: a

infixr 5 ^++
(^++) :: List a -> List a -> List a
Empty ^++ ys = ys
(x :-: xs) ^++ ys = x :-: (xs ^++ ys)

b = 6 :-: 7 :-: Empty
res7 = a ^++ b
