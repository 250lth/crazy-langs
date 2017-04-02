module HaskellModule.ImportModule where

-- use import
import Data.List

numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub  -- nub can delete the dumplicated elements

res1 = numUniques [1,2,1,3,4,5,2,3,2]

-- in ghci, :m + Data.List / :m + Data.List Data.Map Data.Set

-- just need several funcs
-- import Data.List (nub, sort)
-- import Data.List hiding (nub)

-- import qualified Data.Map
-- import qualified Data.Map as M