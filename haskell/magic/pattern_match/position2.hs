data Position = Cartesian Double Double | Polar Double Double

distance :: Position -> Position -> Double
distance (Cartesian x1 y1) (Cartesian x2 y2) =
    sqrt ((x1 - x2) ^ 2 + (y1 - y2) ^ 2)

distance (Cartesian x1 y1) (Polar a r) =
    let x2 = r * cos a
        y2 = r * sin a
    in sqrt ((x1 - x2) ^ 2 + (y1 - y2) ^ 2)

distance (Polar a r) (Cartesian x2 y2) = 
    let x1 = r * cos a
        y1 = r * sin a
    in sqrt ((x1 - x2) ^ 2 + (y1 - y2) ^ 2)

distance (Polar a1 r1) (Polar a2 r2) =
    let x1 = r1 * cos a1
        y1 = r1 * sin a1
        x2 = r2 * cos a2
        y2 = r2 * sin a2
    in sqrt ((x1 - x2) ^ 2 + (y1 - y2) ^ 2)
