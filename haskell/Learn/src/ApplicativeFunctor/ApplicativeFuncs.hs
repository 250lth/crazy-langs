module ApplicativeFunctor.ApplicativeFuncs where

import Control.Applicative

--- liftA2
res1 = fmap (\x -> [x]) (Just 4)
res2 = liftA2 (:) (Just 3) (Just [4])
res3 = (:) <$> Just 3 <*> Just [4]

-- sequenceA : accept a list of applicatives, return a applicative list
sequenceA1 :: (Applicative f) => [f a] -> f [a]
sequenceA1 [] = pure []
sequenceA1 (x:xs) = (:) <$> x <*> sequenceA1 xs

res4 = sequenceA1 [Just 1, Just 2]

-- use fold to implement sequenceA
sequenceA2 :: (Applicative f) => [f a] -> f [a]
sequenceA2 = foldr (liftA2 (:)) (pure [])

res5 = sequenceA2 [Just 3, Just 2, Just 1]
res6 = sequenceA2 [Just 3, Nothing, Just 1]
res7 = sequenceA2 [(+3),(+2),(+1)] 3
res8 = sequenceA2 [[1,2,3],[4,5,6]]
res9 = sequenceA2 [[1,2,3],[4,5,6],[3,4,4],[]]

-- check wether a num satisfies all the predicates in a list
res10 = map (\f -> f 7) [(> 4), (< 10), odd]
res11 = and $ map (\f -> f 7) [(>4),(<10),odd]

-- use sequenceA
res12 = sequenceA [(>4),(<10),odd] 7
res13 = and $ sequenceA [(>4),(<10),odd] 7