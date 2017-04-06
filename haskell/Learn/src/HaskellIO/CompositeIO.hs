module HaskellIO.CompositeIO where

import Data.Char

main1 = do
    putStrLn "Hello, what's your name?"
    name <- getLine
    putStrLn ("Hey " ++ name ++ ", you rock")

tellFortune :: String -> String
tellFortune name = "fuck " ++ name

main2 = do
    putStrLn "Hello, what's your name?"
    name <- getLine
    putStrLn $ "Zis is your future: " ++ tellFortune name

main3 = do
    foo <- putStrLn "Hello, what's your name?"
    name <- getLine
    putStrLn ("Hey " ++ name ++ ", you rock!")

--- using let in IO operations
main4 = do
    putStrLn "What's your first name?"
    firstName <- getLine
    putStrLn "What's your last name?"
    lastName <- getLine
    let bigFirstName = map toUpper firstName
        bigLastName = map toUpper lastName
    putStrLn $ "hey " ++ bigFirstName ++ " " ++ bigLastName ++ ", how are you?"

--- reverse
main5 = do
    line <- getLine
    if null line
        then return ()
        else do
            putStrLn $ reverseWords line
            main5

reverseWords :: String -> String
reverseWords = unwords . map reverse . words

--- no interruption
main6 = do
    return ()
    return "HAHEHA"
    line <- getLine
    return "BLAH BLAH BLAH"
    return 4
    putStrLn line

--- use <- to bond name
main7 = do
    a <- return "hell"
    b <- return "yeah"
    putStrLn $ a ++ " " ++ b

main8 = do
    let a = "hell"
        b = "yeah"
    putStrLn $ a ++ " " ++ b