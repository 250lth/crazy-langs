module Main

main : IO ()
main = do
  putStr "Enter your name: "
  x <- getLine
  putStr ("Hello " ++ x ++ "!")
