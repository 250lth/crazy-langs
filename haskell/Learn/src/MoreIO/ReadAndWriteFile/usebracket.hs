import Control.Exception
import System.IO

withFile :: FilePath -> IOMode -> (Handle -> IO a)
withFile name mode f = bracket (openFile name mode)
    (\handle -> hClose handle)
    (\handle -> f handle)

