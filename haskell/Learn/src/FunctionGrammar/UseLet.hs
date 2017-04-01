module FunctionGrammar.UseLet where

cylinder :: Double -> Double -> Double
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r * 2
    in  sideArea + 2 * topArea
    -- the name bonded by let can only be seen by "in"

tc = cylinder 3.1 4.1

---
l1 = 4 * (let a = 9 in a + 1) + 2

l2 = [let square x = x * x in (square 5, square 3, square 2)]

l3 = (let a = 100; b = 200; c = 300 in a * b * c, let foo="Hey"; bar = "there" in foo ++ bar)

l4 = (let (a,b,c) = (1,2,3) in a+b+c) * 100

--- let in list comprehension
calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi > 25.0]

tc2 = calcBmis [(80,1.8)]
tc3 = calcBmis [(90,1.8)]

--- in ghci
