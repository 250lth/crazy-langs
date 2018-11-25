giveMeFive :: [a] -> [a]
giveMeFive xs = giveMeFiveHelper 0 xs

giveMeFiveHelper :: Int -> [a] -> [a]
giveMeFiveHelper _ [] = []
giveMeFiveHelper i (x : xs) =
  if i `rem` 5 == 0 then x : giveMeFiveHelper (i+1) xs
                    else giveMeFiveHelper (i+1) xs

zip' :: [a] -> [b] -> [(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' (x : xs) (y : ys) = (x,y) : zip xs ys

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ _ [] = []
zipWith' _ [] _ = []
zipWith' f (x : xs) (y : ys) = f x y : zipWith' f xs ys
