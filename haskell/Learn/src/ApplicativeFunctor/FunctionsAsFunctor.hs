module ApplicativeFunctor.FunctionsAsFunctor where

-- use fmap on functions is function composite

res1 = fmap (*3) (+100) 1
res2 = (*3) `fmap` (+100) $ 1
res3 = (*3) . (+100) $ 1
res4 = fmap (show . (*3))  (+100) 1

res5 = fmap (replicate 3) [1,2,3,4]
res6 = fmap (replicate 3) (Just 4)
res7 = fmap (replicate 3) (Right "blah")
res8 = fmap (replicate 3) Nothing
res9 = fmap (replicate 3) (Left "foo")