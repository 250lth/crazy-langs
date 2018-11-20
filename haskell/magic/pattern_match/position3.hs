data Position = MakePosition { positionX :: Double, positionY :: Double }

positionFoo1 = MakePosition 3 4

positionFoo2 = MakePosition { positionX = 5, positionY = 8 }
