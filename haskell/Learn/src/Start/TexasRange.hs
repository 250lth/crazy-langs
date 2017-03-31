module Start.TexasRange where

r1 = [1..29]
r2 = ['a'..'z']
r3 = ['K'..'Z']

rs1 = [2,4..20]
rs2 = [3,6..20]

-- isInfinite
i1 = [13,26..24*13]
i2 = take 24 [13, 26..]

-- create infinite
t1 = take 10 (cycle [1,2,3])
t2 = take 12 (cycle "LOL ")
t3 = take 10 (repeat 5)
re1 = replicate 3 10
f1 = [0.1,0.3..1]
