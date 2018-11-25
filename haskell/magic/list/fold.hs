fold' :: (b -> a -> b) -> b -> [a] -> b
fold' _ acc [] = acc
fold' f acc (x : xs) = fold' f (f acc x) xs

foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' _ acc [] = acc
foldr' f acc (x : xs) = f x (foldr' f acc xs)

foldl :: (a -> b -> a) -> a -> [b] -> a
foldl f a bs = foldr (\b g x -> g (f x b)) id bs a
