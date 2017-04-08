module ApplicativeFunctor.FunctorIO where


---instance Functor IO where
---    fmap f action = do
---        result <- action
---        return (f result)

import Data.Char
import Data.List


main = do line <- fmap (intersperse '-' . reverse . map toUpper) getLine
          putStrLn line
