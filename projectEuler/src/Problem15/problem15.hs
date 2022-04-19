recursivePathCalc :: Int -> Int -> Int -> Int -> Int
recursivePathCalc maxH maxW currH currW
  | maxH == currH && maxW == currW = 1
  | maxH == currH = recursivePathCalc maxH maxW currH (currW + 1)
  | maxW == currW = recursivePathCalc maxH maxW (currH + 1) currW
  | otherwise = recursivePathCalc maxH maxW (currH + 1) currW + recursivePathCalc maxH maxW currH (currW + 1)

main :: IO ()
main = do
  print $ recursivePathCalc 20 20 0 0
