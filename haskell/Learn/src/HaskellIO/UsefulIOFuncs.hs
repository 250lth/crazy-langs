module HaskellIO.UsefulIOFuncs where

import Control.Monad
import Data.Char

--- putStr
main1 = do
    putStr "Hey, "
    putStr "I'm "
    putStr "Andy"

--- putChar
main2 = do
    putChar 't'
    putChar 'e'
    putChar 'h'

-- use putChar to define putStr recursively
putStr1 :: String -> IO ()
putStr1 [] = return ()
putStr1 (x:xs) = do
    putChar x
    putStr xs

--- print
main3 = do
    print True
    print 2
    print "haah"
    print 3.2
    print [3,4,3]

--- when : defined in Control.Monad
main4 = do
    input <- getLine
    when (input == "SWORDFISH") $ do
        putStrLn input

--- sequence
main5 = do
    a <- getLine
    b <- getLine
    c <- getLine
    print [a,b,c]

main6 = do
    rs <- sequence [getLine, getLine, getLine]
    print rs

res1 = sequence $ map print [1,2,3,4,5]

--- mapM
res2 = mapM print [1,2,3]
res3 = mapM_ print [1,2,3]

--- forever : in Control.Monad
main7 = forever $ do
    putStr "Give me some input: "
    l <- getLine
    putStrLn $ map toUpper l

--- forM
main8 = do
    colors <- forM [1,2,3,4] (\a -> do
        putStrLn $ "Which color do you associate with the number "
            ++ show a ++ "?"
        color <- getLine
        return color)
    putStrLn "The colors that you associate with 1,2,3 and 4 are: "
    mapM putStrLn colors