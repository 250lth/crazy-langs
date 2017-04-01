module FunctionGrammar.CaseExpression where

-- case expressions can be used everywhere

describeList :: [a] -> String
describeList ls = "The list is " ++ case ls of [] -> "empty."
                                               [x] -> "a singleton list"
                                               xs -> "a longer list."
td1 = describeList [1]
td2 = describeList []
td3 = describeList [1,2,3]

