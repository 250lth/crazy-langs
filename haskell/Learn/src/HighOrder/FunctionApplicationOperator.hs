module HighOrder.FunctionApplicationOperator where

--- $ -- function application operator
--($) :: (a -> b) -> a -> b
--f $ x = f x -- first operate with right

res1 = sum (filter (> 10) (map (*2) [2..10]))
res2 = sum $ (filter (> 10) (map (*2) [2..10]))
res3 = sum $ filter (> 10) $ map (*2) [2..10]

res4 = map ($ 3) [(4+), (10*), (^2), sqrt]