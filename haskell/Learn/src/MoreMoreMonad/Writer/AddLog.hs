module MoreMoreMonad.Writer.AddLog where

--- add log to gcd program
import Control.Monad.Writer

gcd' :: Int -> Int -> Writer [String] Int
gcd' a b
    | b == 0 = do
        tell ["Finished with " ++ show a]
        return a
    | otherwise = do
        tell [show a ++ " mod " ++ show b ++ " = " ++ show (a `mod` b)]
        gcd' b (a `mod` b)

res1 = fst $ runWriter (gcd' 8 3)

res2 = mapM_ putStrLn $ snd $ runWriter (gcd' 8 3)