module MoreMonad.KeepBalanceMan where

--- A man is working in a fishing factory
--- He is playing a game of walking on a rope
--- when the difference of the number of birds is less than 3, he will be ok


--- the pole
type Birds = Int
type Pole = (Birds, Birds)

--- birds landing
landLeft' :: Birds -> Pole -> Pole
landLeft' n (left, right) = (left + n, right)

landRight' :: Birds -> Pole -> Pole
landRight' n (left, right) = (left, right + n)

-- test
res1 = landLeft' 2 (0,0)
res2 = landRight' 1 (1,2)
res3 = landRight' (-1) (1,2)
res4 = landLeft' 2 (landRight' 1 (landLeft' 1 (0,0)))

--- design a function
x -: f = f x
--test
res5 = 100 -: (*3)
res6 = True -: not
res7 = (0,0) -: landLeft' 2

res8 = (0,0) -: landLeft' 1 -: landRight' 1 -: landLeft' 2


--- Flying away
res9 = landLeft' 10 (0, 3)
res10 = (0,0) -: landLeft' 1 -: landRight' 4 -: landLeft' (-1) -: landRight' (-2)  -- the final res is ok, but he will fall during the process

-- rewrite the functions
landLeft :: Birds -> Pole -> Maybe Pole
landLeft n (left, right)
    | abs ((left + n) - right) < 4 = Just (left + n, right)
    | otherwise = Nothing

landRight :: Birds -> Pole -> Maybe Pole
landRight n  (left, right)
    | abs (left - (right + n)) < 4 = Just (left, right + n)
    | otherwise = Nothing

-- test
res11 = landLeft 2 (0, 0)
res12 = landRight 10 (0, 3)

-- use >>= to accept a Pole
res13 = landRight 1 (0, 0) >>= landLeft 2
res14 = Nothing >>= landLeft 2
res15 = return (0, 0) >>= landRight 2 >>= landLeft 2 >>= landRight 2

res16 = return (0,0) >>= landLeft 1 >>= landRight 4 >>= landLeft (-1) >>= landRight (-2)


--- The bananas on the pole
-- let him fall reguardless the birds
banana :: Pole -> Maybe Pole
banana _ = Nothing

res17 = return (0,0) >>= landLeft 1 >>= banana >>= landRight 1

-- use >> instead of banana
--(>>) :: (Monad m) => m a -> m b -> m b
--m >> n = m >> \_ -> n
res18 = Nothing >> Just 3
res19 = Just 3 >> Just 4
res20 = Just 3 >> Nothing

res21 = return (0,0) >>= landLeft 1 >> Nothing >>= landRight 1

-- Maybe as a value with context, give it to functions
routine :: Maybe Pole
routine = case landLeft 1 (0,0) of
    Nothing -> Nothing
    Just pole1 -> case landRight 4 pole1 of
        Nothing -> Nothing
        Just pole2 -> case landLeft 2 pole2 of
            Nothing -> Nothing
            Just pole3 -> landLeft 1 pole3
