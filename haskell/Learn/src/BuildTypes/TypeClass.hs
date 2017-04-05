module BuildTypes.TypeClass where

-- Eq
--class Eq a where
--    (==) :: a -> a -> Bool
--    (/=) :: a -> a -> Bool
--    x == y = not (x /= y)
--    x /= y = not (x == y)

-- def TrafficLight
data TrafficLight = Red | Yellow | Green
-- implement it as Eq
instance Eq TrafficLight where
    Red == Red = True
    Green == Green = True
    Yellow == Yellow = True
    _ == _ = False

-- implement it as Show
instance Show TrafficLight where
    show Red = "Red Light"
    show Yellow = "Yellow light"
    show Green = "Green light"

res1 = Red == Red
res2 = Red == Yellow
res3 = Red `elem` [Red, Yellow, Green]
res4 = [Red, Yellow, Green]

--- subclass
-- class (Eq a) => Num a where ...

--- Type with instance : type with args
--instance Eq (Maybe m) where
--    Just x == Just y = x == y
--    Nothing == Nothing = True
--    _ == _ = False

--instance (Eq m) => Eq (Maybe m) where
--    Just x == Just y = x == y
--    Nothing == Nothing = True
--    _ == _ = False
