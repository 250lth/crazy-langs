module Test where

main :: IO ()
main = do
  l <- fmap length getLine
  print l
