--- find the best way

-- define the type of road system
data Section = Section { getA :: Int, getB :: Int, getC :: Int}
    deriving (Show)

type RoadSystem = [Section]

-- we can express heathrow to london like this
heathrowToLondon :: RoadSystem
heathrowToLondon = [ Section 50 10 30
                    , Section 5 90 20
                    , Section 40 2 25
                    , Section 10 8 0
                    ]

--- implement the funciton to calculate the best way

data Label = A | B | C deriving (Show)
type Path = [(Label, Int)]

roadStep :: (Path, Path) -> Section -> (Path, Path)
roadStep (pathA, pathB) (Section a b c) =
    let timeA = sum (map snd pathA)
        timeB = sum (map snd pathB)
        forwardtimeToA = timeA + a
        crosstimeToA = timeB + b + c
        forwardtimeToB = timeB + b
        crosstimeToB = timeA + a + c
        newPathToA = if forwardtimeToA <= crosstimeToA
                        then (A, a):pathA
                        else (C, c):(B, b):pathB
        newPathToB = if forwardtimeToB <= crosstimeToB
                        then (B, b):pathB
                        else (C, c):(A, a):pathA
    in (newPathToA, newPathToB)

--- test1
res1 = roadStep ([], []) (head heathrowToLondon)

optimalPath :: RoadSystem -> Path
optimalPath roadSystem =
    let (bestAPath, bestBPath) = foldl roadStep ([], []) roadSystem
    in if sum (map snd bestAPath) <= sum (map snd bestBPath)
        then reverse bestAPath
        else reverse bestBPath

--- test2
res2 = optimalPath heathrowToLondon

--- get system from input

-- get a list and partite it to groups which have same length
groupsOf :: Int -> [a] -> [[a]]
groupsOf 0 _ = undefined
groupsOf _ [] = []
groupsOf n xs = take n xs : groupsOf n (drop n xs)

-- test group list
res3 = [1, 2, 3] : groupsOf 3 [4,5,6,7,8,9,10]

--- main
main = do
    contents <- getContents
    let threes = groupsOf 3 (map read $ lines contents)
        roadSystem = map (\[a,b,c] -> Section a b c) threes
        path = optimalPath roadSystem
        pathString = concat $ map (show . fst) path
        pathTime = sum $ map snd path
    putStrLn $ "The best path to take is: " ++ pathString
    putStrLn $ "Time taken: " ++ show pathTime