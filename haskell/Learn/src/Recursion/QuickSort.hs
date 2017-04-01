module Recursion.QuickSort where

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallOrEqual = [a | a <- xs, a <= x]
        larger = [a | a <- xs, a > x]
    in quicksort smallOrEqual ++ [x] ++ quicksort larger

test = quicksort [10,1,2,4,2,42,4,645,6,432,24,543,1,4]

