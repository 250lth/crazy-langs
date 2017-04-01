module HighOrder.UsingLambda where

--- declare a lambda, using '\'
--- after  '->' is the function body
--- we usually use '()' to bracket the lambdas

res1 = map (\x -> x + 3) [1,6,3,2]

-- multiple args
res2 = zipWith (\a b -> (a * 30 + 3) / b) [5,4,3,2,1] [1,2,3,4,5]

-- use pattern matching
res3 = map (\(a,b) -> a + b) [(1,2), (3,5), (6,3), (2,6), (2,5)]
-- one doesn't match, it crashes!!!

--- lambdas are more readable in curry

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

addThree' :: Int -> Int -> Int -> Int
addThree' = \x -> \y -> \z -> x + y + z -- more of curry

flip' :: (a -> b -> c) -> b -> a -> c
flip' f = \x y -> f y x

res4 = zipWith (flip (++)) ["love you", "love me"] ["i ", "you "]
res5 = map (flip subtract 20) [1,2,3,4]

