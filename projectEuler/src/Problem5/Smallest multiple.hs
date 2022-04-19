helper nr = (== 0) . (nr `mod`)

dividedBy::[Int] -> Int -> Bool
dividedBy divisors x = all (helper x) divisors

smallestMultiple:: [Int] -> Int -> Int
smallestMultiple divisors x
    | dividedBy divisors x = x
    | otherwise = smallestMultiple divisors $! x + 1