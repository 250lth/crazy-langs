module HighOrder.Fold where

--- foldl to fold left

sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

res1 = sum' [3,5,2,1]

sum'' :: (Num a) => [a] -> a
sum'' = foldl (+) 0

res2 = sum'' [3,5,2,1]

--- foldr to fold right

map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs

res3 = map' (+3) [1,2,3]

map'' :: (a -> b) -> [a] -> [b]
map'' f xs = foldl (\acc x -> acc ++ [f x]) [] xs

res4 = map'' (+3) [1,2,3]

--- foldl1 and foldr1
maximum' :: (Ord a) => [a] -> a
maximum' = foldl1 max

res5 = maximum' [1,2,3,4,5]

--- examples

-- reverse
reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

reverse'' :: [a] -> [a]
reverse'' = foldl (flip (:)) []

res6 = reverse' [1,2,3]

-- product
product' :: (Num a) => [a] -> a
product' = foldl (*) 1

res7 = product' [1,2,3,4,5]

-- filter
filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x acc -> if p x then x : acc else acc) []

res8 = filter' (<10) [1,11,111,5]

-- last
last' :: [a] -> a
last' = foldl1 (\_ x -> x)

res9 = last' [1,2,3,4]

--- A way to understand fold
--- Fold is to use the function continiously of a list
res10 = 3 + (4 + (5 + (6 + 0)))
res11 = foldl1 (+) [3,4,5,6]
res12 = (+) 3 ((+) 4 ((+) 5 ((+) 6 0)))

res13 = flip (:) (flip (:) (flip (:) (flip (:) [] 3) 4) 5) 6

--- Fold of infinite list
and' :: [Bool] -> Bool
and' xs = foldr (&&) True xs

res14 = and' [True, False, True]
res15 = and' (repeat False)

--- Scan: similar with fold, but it will storage the records in a List
res16 = scanl (+) 0 [3,5,2,1]
res17 = scanr (+) 0 [3,5,2,1]
res18 = scanl1 (\acc x -> if x > acc then x else acc) [3,4,5,3,7,9,2,1]
res19 = scanl (flip (:)) [] [3,2,1]

-- scan whether sum of sqrt is more than 1000
sqrtSums :: Int
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1

res20 = sqrtSums
res21 = sum (map sqrt [1..131])
res22 = sum (map sqrt [1..130])