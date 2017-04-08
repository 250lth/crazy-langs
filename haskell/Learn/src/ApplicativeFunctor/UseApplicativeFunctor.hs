module ApplicativeFunctor.UseApplicativeFunctor where

import Control.Applicative

--- applicative functor: a superior functor

a = fmap (*) [1,2,3,4]
res1 = fmap (\f -> f 9) a

--- say hello to applicative
-- if we want a class to be functor, we should implement pure and <*>
--class (Functor f) => Applicative f where
--    pure :: a -> f a
--    (<*>) :: f (a -> b) -> f a -> f b

--- Maybe applicative functor
res2 = Just (+3) <*> Just 9
res3 = pure (+3) <*> Just 10
res4 = pure (+3) <*> Just 9
res5 = Just (++"hahaha") <*> Nothing
res6 = Nothing <*> Just "woot"

--- applicative style
res7 = pure (+) <*> Just 3 <*> Just 5
res8 = pure (+) <*> Just 3 <*> Nothing
res9 = pure (+) <*> Nothing <*> Just 5

-- <$> : <*>'s infix version
res10 = (++) <$> Just "johntra" <*> Just "volta"

--- list is applicative functor
res11 = pure "Hey" :: [String]
res12 = pure "Hey" :: Maybe String
res13 = [(*0),(+100),(^2)] <*> [1,2,3]
res14 = [(+),(*)] <*> [1,2] <*> [3,4]
res15 = (++) <$> ["haha", "hehe", "hmmm"] <*> ["?","!","."]
res16 = [ x * y | x <- [2,5,10], y <- [8,10,11] ]
res16' = (*) <$> [2,5,20] <*> [8,10,11]
res17 = filter (>50) $ (*) <$> [2,5,10] <*> [8,10,11]

--- IO is applicative functor
get2lines = do
    a <- (++) <$> getLine <*> getLine
    putStrLn $ "The two lines concatenated turn out to be: " ++ a

--- function as functor
res18 = pure 3 "Blah"
res19 = (+) <$> (+3) <*> (*100) $ 5

--- zip list
res20 = getZipList $ (+) <$> ZipList [1,2,3] <*> ZipList [100,100,100]