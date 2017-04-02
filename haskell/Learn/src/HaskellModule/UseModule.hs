module HaskellModule.UseModule where

import Data.List
import Data.Char

--- sample1 : count the words

-- use words to turn string to string list
res1 = words "hey these are the words in this sentence"
res2 = words "hey these         are     the words in this sentence"

-- use group to group elements
res3 = group [1,1,1,1,2,2,2,2,3,3,2,2,2,5,6,7]
res4 = group ["boom", "bip", "bip", "boom", "boom"]

-- sort first
res5 = sort [5,4,3,7,2,1]
res6 = sort ["boom", "bip", "bip", "boom", "boom"]

-- the word counter
wordNums :: String -> [(String, Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words

res7 = wordNums "ha ha hei hei hei fool you ha hei"

--- sample2 : needle in the haystack

-- use tails
res8 = tails "party"
res9 = tails [1,2,3]

-- use isPrefixOf to check whether is headed with
res10 = "hawaii" `isPrefixOf` "hawaii joe"
res11 = "haha" `isPrefixOf` "ha"
res12 = "ha" `isPrefixOf` "ha"

-- use any to check whether have elements satisfy the condition
res13 = any (> 4) [1,2,3]
res14 = any (== 'F') "Frank Sobotka"
res15 = any (\x -> x > 5 && x < 10) [1,4,11]

-- check the needles
isIn :: (Eq a) => [a] -> [a] -> Bool
needle `isIn` haystack = any (needle `isPrefixOf`) (tails haystack)

res16 = "art" `isIn` "party"
res17 = [1,2] `isIn` [1,3,5]

--- Caesar ciper

-- import Data.Char
-- use ord and chr to conversion between chars and nums
res18 = ord 'a'
res19 = chr 97
res20 = map ord "abcdefgh"

-- to encode
encode :: Int -> String -> String
encode offset msg = map (\c -> chr $ ord c + offset) msg

res21 = encode 3 "hey mark"
res22 = encode 5 "please instruct your men"
res23 = encode 1 "to party hard"

-- to decode
decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg

res24 = decode 3 res21
res25 = decode 5 res22
res26 = decode 1 res23

--- Strict foldl
-- use foldl', no delay calculation
res27 = foldl' (+) 0 (replicate 1000000 1)

--- Find cool numbers: the number that its sum of every bit is the given number

-- Data.Char::digitToInt, use in '0'-'9' and 'A'-'F'
res28 = digitToInt '2'
res29 = digitToInt 'F'
--res30 = digitToInt 'z'

-- return the sum of every bit
digitSum :: Int -> Int
digitSum = sum . map digitToInt . show

res30 = digitSum 124143341

-- Data.List::find, return the first element that satisfies the condition
-- Maybe a / Just / Nothing
res31 = Nothing
res32 = Just "hey"
res33 = Just 3

-- use find
res34 = find (> 4) [3,4,5,6]
res35 = find odd [2,4,6,8,9]
res36 = find (=='z') "mjolnir"

-- find first to 40
firstTo40 :: Maybe Int
firstTo40 = find (\x -> digitSum x == 40) [1..]

res37 = firstTo40

-- find first to any numbers
firstTo :: Int -> Maybe Int
firstTo n = find (\x -> digitSum x == n) [1..]

res38 = firstTo 27
res39 = firstTo 1
res40 = firstTo 13