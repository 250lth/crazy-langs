module MoreIO.Random.GetRandom where

--- use random and mkStdGen

import System.Random

res1 = random (mkStdGen 100) :: (Int, StdGen)
res2 = random (mkStdGen 949494) :: (Int, StdGen)

res3 = random (mkStdGen 949488) :: (Float, StdGen)
res4 = random (mkStdGen 949488) :: (Bool, StdGen)
res5 = random (mkStdGen 949488) :: (Integer, StdGen)