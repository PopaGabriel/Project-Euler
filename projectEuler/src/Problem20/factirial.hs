factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

resolve :: Int -> Int -> Int
resolve _ 0 = sum
resolve sum number = resolve (sum + number `mod` 10) (number `div` 10)