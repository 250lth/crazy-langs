class Functor f where
  fmap :: (a -> b) -> f a -> f b

instance Functor [] where
  fmap = map

instance Functor Maybe where
  fmap f (Just a) = Just (f a)
  fmap _ Nothing = Nothing

instance Functor ((,) a) where
  fmap f (x, y) = (x, f y)

instance Functor ((->) a) where
  fmap = (.)
