module FunctionGrammar.Guard where

-- pattern is to check whether the struct is matched
-- guard is to check whether the args are true

-- sample: BMI
bmiTell :: Double -> String
bmiTell bmi
    | bmi <= 18.5 = "You are underweight, you emo, you!"
    | bmi <= 25.0 = "You are supposely normal. Pffft, I bet you are ugly!!"
    | bmi <= 30.0 = "You are fat! Lose some weight, fatty!"
    | otherwise = "You are a whale, congratulations!!"

bmitest1 = bmiTell 10
bmitest2 = bmiTell 19
bmitest3 = bmiTell 26
bmitest4 = bmiTell 38

bmiTell2 :: Double -> Double -> String
bmiTell2 weight height
    | weight / height ^ 2 <= 18.5 = "You are underweight, you emo, you!"
    | weight / height ^ 2 <= 25.0 = "You are supposely normal. Pffft, I bet you are ugly!!"
    | weight / height ^ 2 <= 30.0 = "You are fat! Lose some weight, fatty!"
    | otherwise = "You are a whale, congratulations!!"

bmitest5 = bmiTell2 85 1.90

-- max
max' :: (Ord a) => a -> a -> a
max' a b
    | a < b = b
    | otherwise = a

tm1 = max' "A" "B"
tm2 = max' 12.3 1
tm3 = max' [1,2,3] [1]

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a == b = EQ
    | a <= b = LT
    | otherwise = GT
tm4 = "a" `myCompare` "b" -- use ``, we can define and call functions in an infix way

