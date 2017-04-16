module MoreMonad.MaybeIsMonad where

--- Maybe as a functor
res1 = fmap (++ "!") (Just "wisdom")
res2 = fmap (++ "!") Nothing

--- Maybe as applicative functor
res3 = Just (+3) <*> Just 3
res4 = Nothing <*> Just "greed"
res5 = Just odd <*> Nothing

res6 = max <$> Just 3 <*> Nothing
res7 = max <$> Just 3 <*> Nothing


--- let >>= work with Maybe
res8 = (\x -> Just (x + 1)) 1
res9 = (\x -> Just (x + 1)) 100

applyMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
applyMaybe Nothing f = Nothing
applyMaybe (Just x) f = f x

res10 = Just 3 `applyMaybe` \x -> Just (x+1)
res11 = Just "smile" `applyMaybe` \x -> Just (x ++ ":)")
res12 = Nothing `applyMaybe` \x -> Just (x+1)
res13 = Nothing `applyMaybe` \x -> Just (x ++ " :)")

res14 = Just 3 `applyMaybe` \x -> if x > 2 then Just x else Nothing
res15 = Just 1 `applyMaybe` \x -> if x > 2 then Just x else Nothing

