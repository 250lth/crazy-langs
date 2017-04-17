module MoreMoreMonad.Writer.DoInWriter where

import Control.Monad.Writer

logNumber :: Int -> Writer [String] Int
logNumber x = writer (x, ["Got Number: " ++ show x])

multiLog :: Writer [String] Int
multiLog = do
    a <- logNumber 3
    b <- logNumber 5
    return (a*b)

res1 = runWriter multiLog

-- add a extra log
multiLog' :: Writer [String] Int
multiLog' = do
    a <- logNumber 3
    b <- logNumber 5
    tell ["Gonna multiply these two"]
    return (a*b)

res2 = runWriter multiLog'