import Data.Vect

myReverse' : Vect n elem -> Vect n elem
myReverse' [] = []
myReverse' {n = S k} (x :: xs)
  = let result = myReverse' xs ++ [x] in
        rewrite plusCommutative 1 k in result

myReverse : Vect n elem -> Vect n elem
myReverse [] = []
myReverse (x :: xs) = reverseProof (myReverse xs ++ [x])
  where
    reverseProof : Vect (k + 1) a -> Vect (S k) a
    reverseProof {k} result = rewrite plusCommutative 1 k in result
