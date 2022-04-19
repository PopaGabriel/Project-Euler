generator:: [Int]
generator = 2 : [3,5..]

listOfPrimes::[Int]->[Int]
listOfPrimes (x:xs) = x : listOfPrimes [y | y <- xs, y `mod` x /= 0]
listOfPrimes [] = []

