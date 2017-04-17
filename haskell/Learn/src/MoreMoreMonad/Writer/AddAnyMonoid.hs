module MoreMoreMonad.Writer.AddAnyMonoid where

import Data.Monoid

--- mappend
res1 = [1,2,3] `mappend` [4,5,6]

--- modify applyLog with mappend instead of ++
applyLog :: (Monoid m) => (a, m) -> (a -> (b, m)) -> (b, m)
applyLog (x, log) f = let (y, newLog) = f x in (y, log `mappend` newLog)


--- add drinks to food list
type Food = String
type Price = Sum Int

addDrink :: Food -> (Food, Price)
addDrink "beans" = ("milk", Sum 25)
addDrink "jerky" = ("whiskey", Sum 99)
addDrink _ = ("beer", Sum 30)

res2 = Sum 3 `mappend` Sum 9

res3 = ("beans", Sum 10) `applyLog` addDrink
res4 = ("jerky", Sum 25) `applyLog` addDrink
res5 = ("dogmeat", Sum 5) `applyLog` addDrink

res6 = ("dogmeat", Sum 5) `applyLog` addDrink `applyLog` addDrink