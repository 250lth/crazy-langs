module BuildTypes.PlantATree where

--- implement a BST

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show)

-- create tree
singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
    | x == a = Node x left right
    | x < a = Node a (treeInsert x left) right
    | x > a = Node a left (treeInsert x right)

-- judge whether an element is in a tree
treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
    | x == a = True
    | x < a = treeElem x left
    | x > a = treeElem x right

nums = [8,6,4,1,7,3,5]
numsTree = foldr treeInsert EmptyTree nums
res1 = numsTree
res2 = 8 `treeElem` numsTree
res3 = 100 `treeElem` numsTree
res4 = 1 `treeElem` numsTree
res5 = 10 `treeElem` numsTree
