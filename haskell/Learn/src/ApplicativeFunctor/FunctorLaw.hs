module ApplicativeFunctor.FunctorLaw where

--- Law 1
-- If we map func id to a functor value, the return should be same as origin
-- fmap id = id
res1 = fmap id (Just 3)
res2 = id (Just 3)
res3 = fmap id [1..5]
res4 = id [1..5]
res5 = fmap id []
res6 = fmap id Nothing


--- Law 2
-- if we composite 2 funcs, then map it to a functor, the result should be same as map in turn
-- fmap (f . g) = fmap f . fmap g
