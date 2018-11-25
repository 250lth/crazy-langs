filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x : xs) =
  if f x then x : filter' f xs
         else filter' f xs

giveMeFive : [a] -> [a]
giveMeFive xs = map snd $ filter' (\(i, x) -> i `rem` 5 == 0 $ zip [0..] xs
