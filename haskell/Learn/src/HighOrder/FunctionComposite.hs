module HighOrder.FunctionComposite where

-- function composite:
-- (f . g)(x) = f(g(x))

-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- f . g = \x -> f (g x)

res1 = map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24]
-- use function composite
res2 = map (negate . abs) [5,-3,-6,7,-3,2,-19,24]

-- f (g (z x)) <=> (f . g . z) x
res3 = map (\xs -> negate (sum (tail xs))) [[1..5], [3..6], [1..7]]
res4 = map (negate . sum . tail) [[1..5], [3..6], [1..7]]

--- composite of multiple args
res5 = sum (replicate 5 (max 6.7 8.9))
res6 = (sum . replicate 5) (max 6.7 8.9)
res7 = sum . replicate 5 $ max 6.7 8.9

res8 = replicate 2 (product (map (*3) (zipWith max [1,2] [4,5])))
res9 = replicate 2 . product . map (*3) $ zipWith max [1,2] [4,5]

res10 = zipWith max [1,2] [4,5]
res11 = map (*3) $ zipWith max [1,2] [4,5]
res12 = product . map (*3) $ zipWith max [1,2] [4,5]

--- Point-Free style
sum' :: (Num a) => [a] -> a
sum' = foldl (+) 0

fn = ceiling . negate . tan . cos . max 50

