helper nr = (==0) . (nr `mod`)

isDivided nr = any (helper nr)

isSqrt::Integer -> Integer
isSqrt = ceiling . sqrt . fromIntegral


largetsPrimeNumber nr nrSoFar primes
    | nrSoFar >= isSqrt nr =  primes
    | (nr `mod` nrSoFar == 0) && not ((isDivided nrSoFar) primes) = largetsPrimeNumber nr (nrSoFar + 2) (nrSoFar : primes) 
    | otherwise = largetsPrimeNumber nr (nrSoFar + 2) primes