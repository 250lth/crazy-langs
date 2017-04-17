module MoreMoreMonad.Writer.ListConstruction where

import Control.Monad.Writer

--- low effect
gcdReverse :: Int -> Int -> Writer [String] Int
gcdReverse a b
    | b == 0 = do
        tell ["Finished with " ++ show a]
        return a
    | otherwise = do
        result <- gcdReverse b (a `mod` b)
        tell [show a ++ " mod " ++ show b ++ " = " ++ show (a `mod` b)]
        return result

res1 = mapM_ putStrLn $ snd $ runWriter (gcdReverse 8 3)



--- difference list
-- create a newtype for difflist, let it can create monoid instance
newtype DiffList a = DiffList { getDiffList :: [a] -> [a] }

toDiffList :: [a] -> DiffList a
toDiffList xs = DiffList (xs++)

fromDiffList :: DiffList a -> [a]
fromDiffList (DiffList f) = f []

-- create a monoid instance
instance Monoid (DiffList a) where
    mempty = DiffList (\xs -> [] ++ xs)
    (DiffList f) `mappend` (DiffList g) = DiffList (\xs -> f (g xs))

res2 = fromDiffList (toDiffList [1,2,3,4] `mappend` toDiffList [1,2,3])


--- make gcdReverse faster
gcd' :: Int -> Int -> Writer (DiffList String) Int
gcd' a b
    | b == 0 = do
        tell (toDiffList ["Finished with " ++ show a])
        return a
    | otherwise = do
        result <- gcd' b (a `mod` b)
        tell (toDiffList [show a ++ " mod " ++ show b ++ " = " ++ show (a `mod` b)])
        return result

res3 = mapM_ putStrLn . fromDiffList . snd . runWriter $ gcdReverse 110 34