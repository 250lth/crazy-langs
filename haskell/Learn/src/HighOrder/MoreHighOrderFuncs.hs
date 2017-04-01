module HighOrder.MoreHighOrderFuncs where

-- high-order functions can use another function as arg
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

res1 = applyTwice (+3) 10
res2 = applyTwice (++ " HAHAHA") "HEY"
res3 = applyTwice ("HAHA" ++ ) "HEY"
res4 = applyTwice (3:) [1]

--- implement zipWith
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

res5 = zipWith' (+) [4,2,5,6] [2,6,2,3]
res6 = zipWith' max [6,3,2,1] [7,3,1,5]
res7 = zipWith' (++) ["foo", "bar", "baz"] ["fighters", "hoppers", "aldrin"]
res8 = zipWith' (*) (replicate 5 2) [1..]
res9 = zipWith' (zipWith' (*)) [[1,2,3], [3,5,6], [2,3,4]] [[3,2,2], [3,4,5], [5,4,3]]

--- implement flip
flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f y x = f x y

res10 = zip [1,2,3,4,5] "hello"
res11 = flip' zip [1,2,3,4,5] "hello"
res12 = zipWith div [2,2..] [10,8,6,4,2]
res13 = zipWith (flip' div) [2,2..] [10,8,6,4,2]