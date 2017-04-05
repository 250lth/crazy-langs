module BuildTypes.YesOrNo where

class YesNo a where
    yesno :: a -> Bool

instance YesNo Int where
    yesno 0 = False
    yesno _ = True

instance YesNo [a] where
    yesno [] = False
    yesno _ = True

instance YesNo Bool where
    yesno = id  -- id is a std function, meaning return as it is

instance YesNo (Maybe a) where
    yesno (Just _) = True
    yesno Nothing = False

