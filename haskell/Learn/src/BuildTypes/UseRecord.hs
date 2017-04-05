module BuildTypes.UseRecord where

data Person = Person
              { firstName :: String
              , lastName :: String
              , age :: Int
              , height :: Float
              , phoneNumber :: String
              , flavor :: String } deriving (Show)

data Car = Car { company :: String
               , model :: String
               , year :: Int} deriving (Show)

res1 = Car {company="Ford", model="Mustang", year=1967}