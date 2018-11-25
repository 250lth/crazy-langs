integral :: Double -> [Double] -> [Double]
integral _ [] = []
integral acc (x : xs) = let i = x + acc in i : integral i xs

scanl :: (b -> a -> b) -> b -> [a] -> [b]
scanl f acc ls = acc : (
  case ls of
    [] -> []
    x : xs -> scanl f (f acc x) xs
                       )
scanr :: (a -> b -> b) -> b -> [a] -> [b]
scanr _ acc [] = [acc]
scanr f acc (x : xs) =
  f x (head ys) : ys
    where
      ys = scanr f acc xs
