module BuildTypes.UseFunctor where

-- class Functor f where
--  fmap :: (a -> b) -> f a -> f b

--instance Functor [] where
--    fmap = map

res1 = fmap (*2) [1..3]
res2 = map (*2) [1..3]

--- Maybe
res3 = fmap (++ " HEY GUYS IM INSIDE THE JUST") (Just "Something serious")
res4 = fmap (++ " HEY GUYS IM INSIDE The JUST") Nothing
res5 = fmap (*2) (Just 2000)
res6 = fmap (*2) Nothing

-- Tree

-- Either a

-- kind