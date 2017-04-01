module FunctionGrammar.UseWhere where

-- where can keep results to make it avaliable for other calculations

bmiTell :: Double -> Double -> String
bmiTell weight height
    | bmi <= 18.5 = "You are underweight, you emo, you!"
    | bmi <= 25.0 = "You are supposely normal. Pffft, I bet you are ugly!!"
    | bmi <= 30.0 = "You are fat! Lose some weight, fatty!"
    | otherwise = "You are a whale, congratulations!!"
    where bmi = weight / height ^ 2

bt1 = bmiTell 10 1

bmiTell2 :: Double -> Double -> String
bmiTell2 weight height
    | bmi <= skinny = "You are underweight, you emo, you!"
    | bmi <= normal = "You are supposely normal. Pffft, I bet you are ugly!!"
    | bmi <= fat = "You are fat! Lose some weight, fatty!"
    | otherwise = "You are a whale, congratulations!!!"
    where bmi = weight / height ^ 2
          skinny = 18.5
          normal = 25.0
          fat = 30.0

bt2 = bmiTell2 85 1.80

--- the scope of where
-- the names defined by where can only be used in this function, out of the scope, it won't work

--- pattern matching of where
initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname

ti1 = initials "Fuck" "You"


--- functions in where
calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height ^ 2

tc = calcBmis [(80, 1.8)]