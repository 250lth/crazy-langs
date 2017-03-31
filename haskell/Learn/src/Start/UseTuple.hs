module Start.UseTuple where

t1 = (1, 3)
t2 = (3, 'a', "hello")
t3 = (50, 50.4, "hello", 'b')

-- error
-- e1 = [(1,2), (8,11,15),(4,5)]

-- use pair

-- fst
f1 = fst (8, 11)
f2 = fst ("Wow", False)

-- snd
s1 = snd (8, 11)
s2 = snd ("Wow", False)

-- zip
z1 = zip [1,2,3,4,5] [5,5,5,5,5]
z2 = zip [1..5] ["one", "two", "three", "four", "five"]
z3 = zip [5,3,2,6,2,7,2,5,4,6,6] ["im", "a", "turtle"]
z4 = zip [1..] ["apple", "orange", "cherry", "mango"]

-- find rightTrangle
triples = [ (a,b,c) | c <- [1..10], a <- [1..10], b <- [1..10] ]
rightTriangles = [ (a,b,c) | c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2]
rightTriangles2 = [ (a,b,c) | c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2, a+b+c == 24]

