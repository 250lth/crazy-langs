module HighOrder.FunctionalToolbox where

--- map
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map f xs

res1 = map (+3) [1,5,3,1,6]
res2 = map (++ "!") ["BIFF", "BANG", "POW"]
res3 = map (replicate 3) [3..6]
res4 = map (map (^2)) [[1,2], [3,4,5,6], [7,8]]
res5 = map fst [(1,2), (3,5), (6,3), (2,6), (2,5)]

--- filter
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
    | p x   = x : filter' p xs
    | otherwise = filter' p xs

res6 = filter (>3) [1,2,3,2,1,6,4,3,2,1]
res7 = filter (==3) [1,2,3,4,5]
res8 = filter even [1..10]

-- let notNull x = not (null x) in filter notNull [[1,2,3],[],[3,4,5],[2,2],[],[],[]]
res9 = filter (`elem` ['a'..'z']) "u LaUgH aT mE BeCaUsE I aM diFfeRent"
res10 = filter (`elem` ['A'..'Z']) "i LAuGh at you bEcause u R all the same"

res11 = filter (<15) (filter even [1..20])
res12 = [x | x <- [1..20], x < 15, even x]


--- use filter to implement quicksort
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerOrEqual = filter (<= x) xs
        larger = filter (> x) xs
    in quicksort smallerOrEqual ++ [x] ++ quicksort larger

res13 = quicksort [1,3,1,563,4234,46,45,243,2,6,85]

--- more samples of map and filter

-- find the largest divisible
largestDivisible :: Integer
largestDivisible = head (filter p [100000, 99999..])
    where p x = x `mod` 3829 == 0

res14 = largestDivisible

-- find all the odd's square and sum them
res15 = takeWhile (/=' ') "elephants know how to party"
res16 = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))
res17 = sum (takeWhile (<10000) [m | m <- [n ^ 2 | n <- [1..]], odd m])

--- Collatz sequence

-- create chain
chain :: Integer -> [Integer]
chain 1 = [1]
chain n
    | even n = n:chain (n `div` 2)
    | odd n = n:chain (n * 3 + 1)

res18 = chain 10
res19 = chain 1
res20 = chain 30

-- num long chains
numLongChains :: Int
numLongChains = length (filter isLong (map chain [1..100]))
    where isLong xs = length xs > 15

res21 = numLongChains

--- map multiple args functions
listOfFuns = map (*) [0..]
res22 = (listOfFuns !! 4) 5