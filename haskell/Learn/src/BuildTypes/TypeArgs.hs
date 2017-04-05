module BuildTypes.TypeArgs where

-- a is a type arg, and Maybe is a type constructor
data Maybe a = Nothing | Just a

--- vector von doom
-- implement a type of 3-dimesional vector
data Vector a = Vector a a a deriving (Show)

vplus :: (Num a) => Vector a -> Vector a -> Vector a
(Vector i j k) `vplus` (Vector l m n) = Vector (i+1) (j+m) (k+n)

dotProd :: (Num a) => Vector a -> Vector a -> a
(Vector i j k) `dotProd` (Vector l m n) = i * l + j * m + k * n

vmult :: (Num a) => Vector a -> a -> Vector a
(Vector i j k) `vmult` m = Vector (i * m) (j * m) (k * m)

res1 = Vector 3 5 8 `vplus` Vector 9 2 8
res2 = Vector 3 5 8 `vplus` Vector 9 2 8 `vplus` Vector 0 2 3
res3 = Vector 3 9 7 `vmult` 10
res4 = Vector 4 9 5 `dotProd` Vector 9.0 2.0 4.0
res5 = Vector 2 9 3 `vmult` (Vector 4 9 5 `dotProd` Vector 9 2 4)