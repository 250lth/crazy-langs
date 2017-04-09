module Moniod.MonoidFold where

import qualified Data.Foldable as F
import Data.Monoid

res1 = foldr (*) 1 [1,2,3]
res2 = F.foldr (*) 1 [1,2,3]

res3 = F.foldl (+) 2 (Just 9)
res4 = F.foldr (||) False (Just True)

-- make tree foldable
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show)

-- use foldMap
instance F.Foldable Tree where
    foldMap f EmptyTree = mempty
    foldMap f (Node x l r) = F.foldMap f l `mappend`
                             f x           `mappend`
                             F.foldMap f r

testTree = Node 5
          (Node 3
                (Node 1 EmptyTree EmptyTree)
                (Node 6 EmptyTree EmptyTree)
                )
          (Node 9
                (Node 8 EmptyTree EmptyTree)
                (Node 10 EmptyTree EmptyTree)
                )

res5 = F.foldl (+) 0 testTree
res6 = F.foldl (*) 1 testTree

res7 = getAny $ F.foldMap (\x -> Any $ x == 3) testTree
res8 = getAny $ F.foldMap (\x -> Any $ x > 15) testTree

res9 = F.foldMap (\x -> [x]) testTree