module HighOrder.CurryFunc where

multThree :: Int -> Int -> Int -> Int
multThree x y z = x * y * z

--- also can be like this
multThree2 :: Int -> (Int -> (Int -> Int))
multThree2 x y z = x * y * z

multTwoWithNine = multThree 9
test = multTwoWithNine 2 3

--
compareWithHundred :: Int -> Ordering
compareWithHundred x = compare 100 x

test1 = compareWithHundred 99

compareWithHundred1 :: Int -> Ordering
compareWithHundred1 = compare 100

test2 = compareWithHundred1 100


--- section
divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

test3 = divideByTen 200
test4 = 200 / 10
test5 = (/10) 200

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

test6 = isUpperAlphanum 'a'

--- print function
-- multThree 3 4 -- error