module FunctionGrammar.PatternMatching where

lucky :: Int -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"
-- test lucky
tl1 = lucky 9
tl2 = lucky 7

-- catchall pattern
sayMe :: Int -> String
sayMe 1 = "One"
sayMe 2 = "Two"
sayMe 3 = "Three"
sayMe 4 = "Four"
sayMe 5 = "Five"
sayMe x = "Not between 1 and 5"
-- test
sm1 = sayMe 1
sm2 = sayMe 3
sm3 = sayMe 8
-- pattern matching should keep the order

-- recursion
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)
-- test
f1 = factorial 0
f2 = factorial 1
f3 = factorial 10
f4 = factorial 50

-- We should always keep a catchall pattern!!!

--- Tuple's pattern matching
addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors a b = (fst a + fst b, snd a + snd b)
av1 = addVectors (1,1) (1,2)

addVectorsBetter :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectorsBetter (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)
av2 = addVectorsBetter (1,1) (1,2)

first :: (a, b, c) -> a
first (x, _, _) = x
fir = first (3,4,5)

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

--- List and ListComprehension's pattern matching
xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]
txs = [a+b | (a, b) <- xs]
-- grammar sugar => x:xs is something like head|tail
head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x

th1 = head' [4,5,6]
th2 = head' "Hello!"
th3 = head' []

-- a function to tell us to flattern a list's first several members
tell :: (Show a) => [a] -> String
tell [] = "Tell list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y

tt1 = tell [1]
--tt2 = tell [] -- ok in ghci
tt3 = tell [1,2]
tt4 = tell [1,2,2,3]

badAdd :: (Num a) => [a] -> a
badAdd (x:y:z:[]) = x + y + z
-- no ++ in pattern matching

--- As pattern
firstletter :: String -> String
firstletter "" = "Empty string, whoops"
firstletter all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

tf1 = firstletter "Dracula"
