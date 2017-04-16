module MoreMonad.ListMonad where

res1 = [3,4,5] >>= \x -> [x,-x]
res2 = [] >>= \x -> ["bad", "mad", "rad"]
res3 = [1,2,3] >>= \x -> []

res4 = [1,2] >>= \n -> ['a', 'b'] >>= \ch -> return (n, ch)

listOfTuples :: [(Int, Char)]
listOfTuples = do
    n <- [1,2]
    ch <- ['a', 'b']
    return (n, ch)


--- do notation and list comprehension
res5 =[ (n, ch) | n <- [1,2], ch <- ['a', 'b'] ]

--- MonadPlus and guard
res6 = [ x | x <- [1..50], '7' `elem` show x ]
-- mzero and mplus
class Monad m => MonadPlus m where
    mzero :: m a
    mplus :: m a -> m a -> m a

instance MonadPlus [] where
    mzero = []
    mplus = (++)

guard :: (MonadPlus m) => Bool -> m ()
guard True = return ()
guard False = mzero

--res7 = guard (5 > 2) :: Maybe ()


--- move the knight
type KnightPos = (Int, Int)

moveKnight :: KnightPos -> [KnightPos]
moveKnight (c, r) = do
    (c', r') <- [(c+2, r-1), (c+2,r+1), (c-2, r-1), (c-2,r+1)
                ,(c+1, r-2), (c+1, r+2), (c-1,r-2), (c-1,r+2)]
    guard (c' `elem` [1..8] && r' `elem` [1..8])
    return (c', r')

res10 = moveKnight (6,2)
res11 = moveKnight (8,1)

-- move in 3 steps
in3 :: KnightPos -> [KnightPos]
in3 start = do
    first <- moveKnight start
    second <- moveKnight first
    moveKnight second

-- tell us whether can reach in 3 steps
canReachIn3 :: KnightPos -> KnightPos -> Bool
canReachIn3 start end = end `elem` in3 start

res12 = (6,2) `canReachIn3` (6,1)
res13 = (6,2) `canReachIn3` (7,3)