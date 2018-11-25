giveMeFive :: [a] -> [a]
giveMeFive xs = go $ zip [0..] xs
  where
    go [] = []
    go ((i, x) : xs) = if i `rem` 5 == 0 then x : go xs
                                    else go xs
