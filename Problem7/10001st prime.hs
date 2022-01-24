isDivisible:: Int -> [Int] -> Bool
isDivisible nr = any (== 0) . map (nr `mod`)

numbers = [2..]

-- primeGenerator:: [Int] -> [Int]
primeGenerator (x:xs) = x : primeGenerator [x' | x' <- xs, x' `mod` x /= 0]

primeGetter:: Int -> Int
primeGetter x = primeGenerator numbers !! x