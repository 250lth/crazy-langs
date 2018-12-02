newtype Identity a = Identity { runIdentity :: a }

Identity 3 :: Identity Int

-- runIdentity $ Identity 3

instance Functor Identity where
  fmap f idx = Identity (f (runIdentity idx))
  fmap f = Identity . f . runIdentity

-- fmap (+1) (Identity 3)
