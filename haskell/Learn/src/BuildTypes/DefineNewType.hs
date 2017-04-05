module BuildTypes.DefineNewType where

-- use "data" to define data types
data Bool = False | True

data Shape = Circle Float Float Float | Rectange Float Float Float Float

area :: Shape -> Float
area (Circle _ _ r) = pi * r ^ 2
area (Rectange x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

res1 = area $ Circle 10 20 10
res2 = area $ Rectange 0 0 100 100
