module MoreIO.Random.MoreRandFuncs where

import System.Random

res1 = take 5 $ randoms (mkStdGen 11) :: [Int]
res2 = take 5 $ randoms (mkStdGen 11) :: [Bool]
res3 = take 5 $ randoms (mkStdGen 11) :: [Float]

-- implement randoms
randoms' :: (RandomGen g, Random a) => g -> [a]
randoms' gen = let (value, newGen) = random gen in value:randoms' newGen

-- implement a finite random generator
finiteRandoms :: (RandomGen g, Random a, Num n) => n -> g -> ([a], g)
finiteRandoms 0 gen = ([], gen)
finiteRandoms n gen =
    let (value, newGen) = random gen
        (restOfList, finalGen) = finiteRandoms (n-1) newGen
    in (value:restOfList, finalGen)

-- randomR
res4 = randomR (1,6) (mkStdGen 359353)
res5 = randomR (1,6) (mkStdGen 35935335)

-- randomRs
res6 = take 10 $ randomRs ('a', 'z') (mkStdGen 3) :: [Char]