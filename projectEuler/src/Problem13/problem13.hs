import Data.Char (digitToInt)
import Data.List (transpose)

makeList :: String -> [Int]
makeList = map digitToInt

propagateSum :: Int -> [Int] -> [Int]
propagateSum 0 [] = []
propagateSum carryOver [] = snd value : propagateSum (fst value) []
  where
    value = divMod carryOver 10
propagateSum carryOver valueArray = snd newCarry : propagateSum (fst newCarry) (tail valueArray)
  where
    value = head valueArray
    newCarry = divMod (carryOver + value) 10

transform :: String -> [Int]
transform = reverse . propagateSum 0 . reverse . map sum . transpose . map makeList . lines

main :: IO ()
main = do
  fileData <- readFile "input"
  let read_data = transform fileData
  print $ take 10 read_data