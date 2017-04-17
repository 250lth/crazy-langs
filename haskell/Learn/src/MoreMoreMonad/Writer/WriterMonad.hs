module MoreMoreMonad.WriterMonad where

--- Writer monad is to express values with logs
-- writer let us record logs when calculating

isBigGang' :: Int -> Bool
isBigGang' x = x > 9
-- add a log
isBigGang :: Int -> (Bool, String)
isBigGang x = (x > 9, "Compared gang size to 9.")

res1 = isBigGang 3
res2 = isBigGang 30

-- ensure the first arg's log not lost, merge it with the 2nd log
applyLog :: (a, String) -> (a -> (b, String)) -> (b, String)
applyLog (x, log) f = let (y, newLog) = f x in (y, log ++ newLog)

res3 = (3, "Smallish gang.") `applyLog` isBigGang
res4 = (30, "A freaking platoon.") `applyLog` isBigGang

res5 = ("Tobin", "Got outlaw name.") `applyLog` (\x -> (length x, "Applied length."))
res6 = ("Bathcat", "Got outlaw name.") `applyLog` (\x -> (length x, "Applied length."))
