module TrustTypes.ExplicitTypeDeclare where

-- use :t to check types
-- :: means the type is

-- add type to functions
removeNonUpperCase :: [Char] -> [Char]
removeNonUpperCase st = [ c | c <- st, c `elem` ['A'..'Z']]

a = removeNonUpperCase "FDSF AS sd eea fSD fds  afS"

-- multiple args
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

b = addThree 4 3 2