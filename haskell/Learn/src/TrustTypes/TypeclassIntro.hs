module TrustTypes.TypeclassIntro where

-- Eq
eq1 = 5 == 5
eq2 = 5 /= 5
eq3 = 'a' == 'a'
eq4 = "hoho" == "hoho"
eq5 = 3.432 == 3.432

-- Ord
ord1 = "Abrakadabra" < "Zebra"
ord2 = "Abrakadabra" `compare` "Zebra"
ord3 = 5 >= 2
ord4 = 5 `compare` 3
ord5 = 'b' > 'a'

-- Show
s1 = show 3
s2 = show 5.334
s3 = show True

-- Read
r1 = read "True" || False
r2 = read "8.2" + 3.8
r3 = read "5" - 2
r4 = read "[1,2,3,4]" ++ [3]
-- r5 = read "4"
r6 = read "5" :: Int
r7 = read "5" :: Float
r8 = read "[1,2,3,4]" :: [Int]
r9 = read "(3, 'a')" :: (Int, Char)
r10 = [read "True", False, True, False]

-- Enum
e1 = ['a'..'e']
e2 = [LT .. GT]
e3 = [3 .. 5]
e4 = succ 'B'

-- Bounded
b1 = minBound :: Int
b2 = maxBound :: Char
b3 = maxBound :: Bool
b4 = minBound :: Bool
b5 = maxBound :: (Bool, Int, Char)

-- Num
n1 = 20 :: Int
n2 = 20 :: Integer
n3 = 20 :: Float
n4 = 20 :: Double

-- Float

-- Integral
--i1 = fromIntegral :: (Integral a, Num b) => a -> b
--i2 = length :: [a] -> Int
i3 = fromIntegral (length [1,2,3,4]) + 3.2
