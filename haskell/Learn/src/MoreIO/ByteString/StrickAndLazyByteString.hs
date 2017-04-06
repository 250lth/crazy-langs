module MoreIO.ByteString.StrickAndLazyByteString where

import qualified Data.ByteString.Lazy as B
import qualified Data.ByteString as S

res1 = B.pack [99,97,110]
res2 = B.pack [98..120]

by = B.pack [98,111,114,116]
res3 = by
res4 = B.unpack by

res5 = B.fromChunks [S.pack [40,41,42], S.pack [43,44,45], S.pack [46,47,48]]
res6 = B.cons 85 $ B.pack [80,81,82,84]