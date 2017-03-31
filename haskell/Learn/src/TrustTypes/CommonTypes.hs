module TrustTypes.CommonTypes where

-- Integer
factorial :: Integer -> Integer
factorial n = product [1..n]

test1 = factorial 50

-- Float
circumference :: Float -> Float
circumference r = 2 * pi * r

test2 = circumference 4.0

-- Double
circumference' :: Double -> Double
circumference' r = 2 * pi * r
test3 = circumference' 4.0