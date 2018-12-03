import Control.Lens

data Point = Point
    { _positionX :: Double
    , _positionY :: Double
    } deriving (Show)
makeLenses ''Point

data Segment = Segment
    { _segmentStart :: Point
    , _segmentEnd :: Point
    } deriving (Show)
makeLenses ''Segment

makePoint :: (Double, Double) -> Point
makePoint (x, y) = Point x y

makeSegment :: (Double, Double) -> (Double, Double) -> Segment
makeSegment start end = Segment (makePoint start) (makePoint end)

-- cabal install lens
-- ghci -XTemplateHaskell

--let testSeg = makeSegment (0, 1) (2, 4)
--view segmentEnd testSeg
--set segmentEnd (makePoint (2, 3)) testSeg
--view (segmentEnd . positionY) testSeg
--over (segmentEnd . positionY) (2 *) testSeg
