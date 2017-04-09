module Moniod.AboutMonoid where

--- monoid type class
--class Monoid m where
--    mempty :: m
--    mappend :: m -> m -> m
--    mconcat :: [m] -> m
--    mconcat = foldr mappend mempty

--- monoid law
-- 1: mempty `mappend` x = x
-- 2: x `mappend` mempty = x
-- 3: (x `mappend` y) `mappend` z = x `mappend` (y `mappend` z)
