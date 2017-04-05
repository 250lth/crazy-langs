module BuildTypes.CreateInstance where

--- same people
data Person = Person { firstName :: String,
                       lastName :: String,
                       age :: Int
                       } deriving (Eq, Show, Read) -- when deriving to Eq instance, we can use == and /= to judge equal

mikeD = Person { firstName = "Michael", lastName = "Diamond", age = 43 }
adRock = Person { firstName = "Adam", lastName = "Horovitz", age = 41 }
mca = Person { firstName = "Adam", lastName = "Yauch", age = 44 }

res1 = mca == adRock
res2 = mikeD == adRock
res3 = mikeD == mikeD
res4 = mikeD == Person { firstName = "Michael", lastName = "Diamond", age = 43 }

beastieBoys = [mca, adRock, mikeD]
res5 = mikeD `elem` beastieBoys

--- tell me how to read it
-- add deriving Show and Read in data Person
res6 = mikeD
res7 = "mikeD is: " ++ show mikeD

--- keep order in the court
res8 = True `compare` False
res9 = True > False
res10 = Nothing > Just 100 -- False
res11 = Nothing > Just (-49999) -- False
res12 = Just 3 `compare` Just 2
res13 = Just 100 > Just 50

--- A day in a week
data Day = Monday | Tuesday | Wendsday | Thursday | Friday | Saturday | Sunday
            deriving (Eq, Ord, Show, Read, Bounded, Enum)

res14 = Wendsday
res15 = show Wendsday
res16 = read "Saturday" :: Day

res17 = Saturday == Sunday
res18 = Saturday == Saturday
res19 = Monday `compare` Wendsday

res20 = minBound :: Day
res21 = maxBound :: Day

res22 = succ Monday
res23 = pred Saturday
res24 = [Thursday .. Sunday]
res25 = [minBound .. maxBound] :: [Day]
