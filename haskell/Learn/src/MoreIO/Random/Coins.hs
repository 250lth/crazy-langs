module MoreIO.Random.Coins where

import System.Random

threeCoins :: StdGen -> (Bool, Bool, Bool)
threeCoins gen =
    let (firstCoin, newGen) = random gen
        (secondCoin, newGen') = random newGen
        (thirdCoin, newGen'') = random newGen'
    in (firstCoin, secondCoin, thirdCoin)


res1 = threeCoins (mkStdGen 21)
res2 = threeCoins (mkStdGen 22)
res3 = threeCoins (mkStdGen 943)
res4 = threeCoins (mkStdGen 944)