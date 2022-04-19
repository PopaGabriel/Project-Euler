multiplesOf3And5:: Int -> Int -> Int -> Int
multiplesOf3And5 sumSoFar limit nr
    | (nr < limit) && ((nr `mod` 3 == 0) || (nr `mod` 5 == 0)) = multiplesOf3And5 (sumSoFar + nr) limit (nr + 1)
    | (nr < limit) = multiplesOf3And5 sumSoFar limit (nr + 1)
    | otherwise = sumSoFar
