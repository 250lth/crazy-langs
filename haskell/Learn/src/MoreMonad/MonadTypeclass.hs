module MoreMonad.MonadTypeclass where

--class Monad m where
--    return :: a -> m a
--
--    (>>=) :: m a -> (a -> m b) -> m b
--
--    (>>) :: m a -> m b -> m b
--    x >> y = x >>= \_ -> y
--
--    fail :: String -> m a
--    fail msg = error msg

--instance Monad Maybe where
--    return x = Just x
--    Nothing >>= f = Nothing
--    Just x >>= f = f x
--    fail _ = Nothing

--- Maybe as Monad
res1 = return "WHAT" :: Maybe String
res2 = Just 9 >>= \x -> return (x * 10)
res3 = Nothing >>= \x -> return (x * 10)