module FunctionalSolveProblems.RPNCalculator where

import Data.List

--solveRPN :: String -> Double
--solveRPN expression = head (foldl foldingFunction [] (words expression))
--    where foldingFunction stack item = ...

--- Convert to Point-Free style
solveRPN :: String -> Double
solveRPN = head . foldl foldingFunction [] . words
    where   foldingFunction (x:y:ys) "*" = (x * y):ys
            foldingFunction (x:y:ys) "+" = (x + y):ys
            foldingFunction (x:y:ys) "-" = (y - x):ys
            foldingFunction (x:y:ys) "/" = (y / x):ys
            foldingFunction (x:y:ys) "^" = (y ** x):ys
            foldingFunction (x:xs) "ln" = log x:xs
            foldingFunction xs "sum" = [sum xs]
            foldingFunction xs numberString = read numberString:xs


-- test the folding function
res1 = solveRPN "10 4 3 + 2 * -"
res2 = solveRPN "2 3.5 +"
res3 = solveRPN "90 34 12 33 55 66 + * - +"
res4 = solveRPN "90 34 12 33 55 66 + * - + -"
res5 = solveRPN "90 3.8 -"

res6 = solveRPN "2.7 ln"
res7 = solveRPN "10 10 10 10 sum 4 /"
res8 = solveRPN "10 10 10 10 10 sum 4 /"
res9 = solveRPN "10 2 ^"