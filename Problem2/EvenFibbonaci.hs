evenFibonacci:: Int -> Int -> Int -> Int -> Int
evenFibonacci a b limit sumSoFar
    | b > limit = sumSoFar
    | (b `mod` 2 == 0) = evenFibonacci b (a + b) limit (sumSoFar + b)
    | otherwise = evenFibonacci b (a + b) limit sumSoFar
