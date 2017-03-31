module Start.UseList where

lostNumbers = [4,8,15,16,23,42]

a = [1,2,3,4] ++ [9,10,11,12]
b = "hello" ++ " " ++ "world"
c = ['w', 'o'] ++ ['o', 't']

-- insert
i1 = 'A':" SMALL CAT"
i2 = 5:[1,2,3,4,5]
-- i3 = [1,2,3,4] ++ 5

-- access
a1 = "Steve Buscemi" !! 6
a2 = [9.4, 33.2, 96.2, 11.2, 23.25] !! 1

-- nested
n1 = [[1,2,3,4],[5,3,3,3],[1,2,3,3,4],[1,2,3]]
n2 = n1 ++ [[1,1,1,1]]
n3 = [6,6,6]:n1
n4 = n1 !! 2

-- compare
c1 = [3,2,1] > [2,1,0]
c2 = [3,2,1] > [2,10,100]
c3 = [3,4,2] < [3,4,3]
c4 = [3,4,2] == [3,4,2]

-- more
h = head [5,4,3,2,1]
t = tail [5,4,3,2,1]
l = last [5,4,3,2,1]
i = init [5,4,3,2,1]

len = length [5,4,3,2,1]
checknull = null [1,2,2]
rev = reverse [5,4,3,1,1]
t1 = take 3 [1,2,3,4,5]
t2 = take 1 [3,9,3]
t3 = take 0 [6,6,6]
t4 = take 6 [1]

d1 = drop 3 [8,4,2,1,5,6]
d2 = drop 0 [1,2,3,4]
d3 = drop 100 [1,2,3,4]

m1 = maximum [1,9,2,3,4]
m2 = minimum [8,4,2,1,1,5,6]

s1 = sum[5,2,1,6,3,2,1,5,6]

p1 = product [6,2,1,2]
p2 = product [1,2,5,6,7,9,2,0]

e1 = 4 `elem` [3,4,5,6]
e2 = 10 `elem` [3,4,5,6]
