module MoreMonad.UpgradeOurApplicativeFunctor where

-- see fmap's type
-- fmap :: (Functor f) => (a -> b) -> f a -> f b

-- applicative type class
-- (<*>) :: (Applicative f) => f (a -> b) -> f a -> f b

res1 = (*) <$> Just 2 <*> Just 8
res2 = (++) <$> Just "klingon" <*> Nothing
res3 = (-) <$> [3,4] <*> [1,2,3]