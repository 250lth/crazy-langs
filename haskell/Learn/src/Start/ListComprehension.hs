module Start.ListComprehension where

l1 = [x*2 | x <- [1..10]]
l2 = [x*2 | x <- [1..10], x * 2 >= 12]


-- use predicate
l3 = [x | x <- [50..100], x `mod` 7 == 3]

boomBangs xs = [ if x < 10 then "BOOM!" else "BANG" | x <- xs, odd x]
b1 = boomBangs [7..13]

-- multiple predicates
m1 = [ x | x <- [10..20], x /= 13, x /= 15, x /= 19 ]

-- multiple lists
ml = [ x + y | x <- [1, 2, 3], y <- [ 10, 100, 1000 ] ]
ml1 = [ x * y | x <- [2, 5, 10], y <- [8, 10, 11] ]
ml2 = [ x * y | x <- [2, 5, 10], y <- [8, 10, 11], x * y > 50 ]

-- for strings
nouns = ["hobo", "frog", "pope"]
adjs = ["lazy", "grouchy", "scheming"]
sl = [adj ++ " " ++ noun | adj <- adjs, noun <- nouns]

-- write func
length' xs = sum [1 | _ <- xs]
testl1 = length' "hahahahahahafuckyou"

removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z'] ]
testl2 = removeNonUppercase "FDFAAS fdafas fafdasfaFDFASF as sa fsdA FAS A"

xxs = [[1,3,5,2,3,1,2,4,5], [1,2,3,4,5,6,7,8,9], [1,2,4,6,8,23,553,2]]
remOdd = [ [ x | x <- xs, even x ] | xs <- xxs ]
