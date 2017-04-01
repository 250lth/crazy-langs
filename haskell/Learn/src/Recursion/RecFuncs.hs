module Recursion.RecFuncs where

-- replicate
replicate' :: Int -> a -> [a]
replicate' n x
    | n <= 0    = []
    | otherwise = x : replicate' (n-1) x

test1 = replicate' 4 6

-- take
take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
    | n <= 0    = []
take' _ []      = []
take' n (x:xs)  = x : take' (n-1) xs

test2 = take' 3 [1,2,3,4,5]

-- reverse
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

test3 = reverse' [1,1,2,3,4,5]

-- repeat
repeat' :: a -> [a]
repeat' x = x:repeat' x

--test4 = repeat' [4]
test4 = take 10 (repeat' [1,2])

-- zip
zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x, y):zip' xs ys

test5 = zip' [1,2,3] ['a', 'b']

-- elem
elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs)
    | a == x = True
    | otherwise = a `elem'` xs

test6 = elem' 1 [1,2,3,4,5]