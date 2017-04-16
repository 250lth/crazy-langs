module MoreMonad.DoNotation where

-- do notation: put multi monads togethere in order
res1 = Just 3 >>= (\x -> Just (show x ++ "!"))
res2 = Just 3 >>= (\x -> Just "!" >>= (\y -> Just (show x ++ y)))


foo' :: Maybe String
foo' = Just 3 >>= (\x ->
      Just "!" >>= (\y ->
      Just (show x ++ y)))
-- in do notation
foo :: Maybe String
foo = do
    x <- Just 3
    y <- Just "!"
    Just (show x ++ y)


--- in do expression, every line without let is a monad, use <- to get its value
-- the last monad can not use <-
res3 = Just 9 >>= (\x -> Just (x > 8))
-- use do
marySure :: Maybe Bool
marySure = do
    x <- Just 9
    Just (x > 8)


--- pattern matching and calc fail
justH :: Maybe Char
justH = do
    (x:xs) <- Just "Hello"
    return x

-- fail function
wopwop :: Maybe Char
wopwop = do
    (x:xs) <- Just ""
    return x