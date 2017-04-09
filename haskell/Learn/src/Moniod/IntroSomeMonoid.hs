module Moniod.IntroSomeMonoid where

import Data.Monoid

--- list is monoid
--instance Monoid [a] where
--    mempty = []
--    mappend = (++)

res1 = [1,2,3] `mappend` [4,5,6]
res2 = ("one" `mappend` "two") `mappend` "tree"
res3 = "one" `mappend` ("two" `mappend` "tree")
res4 = "one" `mappend` "two" `mappend` "tree"
res5 = "pang" `mappend` mempty
res6 = mconcat [[1,2],[3,6],[9]]
res7 = mempty :: [a]


--- Product and Sum
--newtype Product a = Product { getProduct :: a }
--    deriving (Eq, Ord, Read, Show, Bounded)

--instance Num a => Monoid (Product a) where
--    mempty = Product 1
--    Product x `mappend` Product y = Product (x * y)
res8 = getProduct $ Product 3 `mappend` Product 9
res9 = getProduct $ Product 3 `mappend` mempty
res10 = getProduct $ Product 3 `mappend` Product 4 `mappend` Product 2
res11 = getProduct . mconcat . map Product $ [3,4,2]

res12 = getSum $ Sum 2 `mappend` Sum 9
res13 = getSum $ mempty `mappend` Sum 3
res14 = getSum . mconcat . map Sum $ [1,2,3]


--- Any and All
res15 = getAny $ Any True `mappend` Any False
res16 = getAny $ mempty `mappend` Any True
res17 = getAny . mconcat . map Any $ [False, False, False, True]
res18 = getAny $ mempty `mappend` mempty

res19 = getAll $ mempty `mappend` All True
res20 = getAll $ mempty `mappend` All False
res21 = getAll . mconcat . map All $ [True, True, True]
res22 = getAll . mconcat . map All $ [True, False, True]


--- Ordering monoid
res23 = 1 `compare` 2
res24 = 2 `compare` 2
res25 = 3 `compare` 2

res26 = LT `mappend` GT
res27 = GT `mappend` LT
res28 = mempty `mappend` LT
res29 = mempty `mappend` GT

lengthCompare :: String -> String -> Ordering
lengthCompare x y = let a = length x `compare` length y
                        b = x `compare` y
                    in if a == EQ then b else a

res30 = lengthCompare "zen" "ants"
res31 = lengthCompare "zen" "and"

-- compare num of aeiou
lengthCompare1 :: String -> String -> Ordering
lengthCompare1 x y = (length x `compare` length y) `mappend`
                     (vowels x `compare` vowels y) `mappend`
                     (x `compare` y)
                     where vowels = length . filter (`elem` "aeiou")

res32 = lengthCompare1 "zen" "anna"
res33 = lengthCompare1 "zen" "ana"
res34 = lengthCompare1 "zen" "ann"


--- Maybe monoid
res35 = Nothing `mappend` Just "andy"
res36 = Just LT `mappend` Nothing
res37 = Just (Sum 3) `mappend` Just (Sum 4)


-- What if the type in Maybe is not monoid?
-- define a First a type
--newtype First a = First { getFirst :: Maybe a }
--    deriving (Eq, Ord, Read, Show)

-- create instance
--instance Monoid (First a) where
--    mempty = First Nothing
--    First (Just x) `mappend` _ = First (Just x)
--    First Nothing `mappend` x = x
res38 = getFirst $ First (Just 'a') `mappend` First (Just 'b')
res39 = getFirst $ First Nothing `mappend` First (Just 'b')
res40 = getFirst $ First (Just 'a') `mappend` First Nothing

res41 = getFirst . mconcat . map First $ [Nothing, Just 9, Just 10]
res42 = getLast . mconcat . map Last $ [Nothing, Just 9, Just 10]
res43 = getLast $ Last (Just "one") `mappend` Last (Just "two")