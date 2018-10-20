data Shape = Triangle Double Double
           | Rectangle Double Double
           | Circle Double

area : Shape -> Double
area (Triangle base height) = 0.5 * base * height
area (Rectangle length height) = length * height
area (Circle radius) = pi * radius * radius

data Picture = Privitive Shape
             | Combine Picture Picture
             | Rotate Double Picture
             | Translate Double Double Picture

rectangle : Picture
rectangle = Privitive (Rectangle 20 10)

circle : Picture
circle = Privitive (Circle 5)

triangle : Picture
triangle = Privitive (Triangle 10 10)

testPicture : Picture
testPicture = Combine (Translate 5 5 rectangle)
              (Combine (Translate 35 5 circle)
              (Translate 15 25 triangle))

pictureArea : Picture -> Double
pictureArea (Privitive shape) = area shape
pictureArea (Combine pic pic1) = pictureArea pic + pictureArea pic1
pictureArea (Rotate x pic) = pictureArea pic
pictureArea (Translate x y pic) = pictureArea pic

biggestTriangle : Picture -> Maybe Double
biggestTriangle (Privitive tri@(Triangle x y)) = Just (area tri)
biggestTriangle (Privitive _) = Nothing
biggestTriangle (Combine x y) = max (biggestTriangle x) (biggestTriangle y)
biggestTriangle (Rotate x pic) = biggestTriangle pic
biggestTriangle (Translate x y pic) = biggestTriangle pic
