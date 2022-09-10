multiplyByTwo :: [Int] -> Int -> [Int]
multiplyByTwo [] carryOver = [carryOver | carryOver > 0]
multiplyByTwo digits carryOver = ((head digits * 2 + carryOver) `mod` 10) : multiplyByTwo (tail digits) ((head digits * 2 + carryOver) `div` 10)

powerOfTwo :: [Int] -> Int -> [Int]
powerOfTwo digits 0 = digits
powerOfTwo digits nrMultiply = powerOfTwo (multiplyByTwo digits 0) (nrMultiply - 1)

main :: IO ()
main = do
  print (sum (powerOfTwo [1] 100000))