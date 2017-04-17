module MoreMoreMonad.Writer.WriterType where

import Control.Monad.Writer

res1 = runWriter (return 3 :: Writer String Int)
res2 = runWriter (return 3 :: Writer (Sum Int) Int)
res3 = runWriter (return 3 :: Writer (Product Int) Int)