calculateCollatzLength :: Int -> Int -> Int
calculateCollatzLength steps 1 = steps
calculateCollatzLength steps number
  | number `mod` 2 == 1 = calculateCollatzLength (steps + 1) (number * 3 + 1)
  | otherwise = calculateCollatzLength (steps + 1) (fst $ number `divMod` 2)

main :: IO ()
main = do
  let collatzMatrix = [(calculateCollatzLength 0 x, x) | x <- [1 .. 1000000]]
  let maxVal = maximum [fst x | x <- collatzMatrix]
  print $ filter ((== maxVal) . fst) collatzMatrix