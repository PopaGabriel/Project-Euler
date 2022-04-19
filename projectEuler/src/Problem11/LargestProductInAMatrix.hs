import Data.Char (digitToInt)
import System.IO ()

breakItBaby :: String -> [String]
breakItBaby = lines

turnItToInt :: String -> Int
turnItToInt [] = 0
turnItToInt word@(x : xs) = digitToInt x * (10 ^ (length word - 1)) + turnItToInt xs

buildElem :: Int -> Int -> [Int] -> [Int]
buildElem pos le list = [list !! pos, list !! (pos + le), list !! (pos + le * 2), list !! (pos + le * 3)]

isGoodDiagonall :: Int -> Int -> Int -> Bool
isGoodDiagonall pos le maxLen = snd (pos `divMod` le) <= le - 4

isGoodDiagonallBackwards :: Int -> Int -> Int -> Bool
isGoodDiagonallBackwards pos lle maxLen = snd (pos `divMod` lle) >= 3 && (pos + 3 * (lle - 1) < maxLen - 3)

rightPairs :: Int -> Int -> [Int] -> [[Int]]
rightPairs _ _ [] = []
rightPairs pos len list@(_ : xs)
  | ((pos + 3) `mod` len) < len - 3 = (take 4 list) : rightPairs (pos + 1) len xs
  | otherwise = rightPairs (pos + 1) len xs

removeLastN :: Int -> [Int] -> [Int]
removeLastN _ [] = []
removeLastN 0 list = list
removeLastN x list = removeLastN (x - 1) (init list)

takeDown :: Int -> [Int] -> [[Int]]
takeDown _ [] = []
takeDown len list
  | 3 * len < (length list) = [head list, list !! len, list !! (2 * len), list !! (3 * len)] : takeDown len (tail list)
  | otherwise = []

takeDiagonal :: Int -> Int -> [Int] -> [[Int]]
takeDiagonal pos le list
  | pos == (length list) - 3 * le - 3 = []
  | isGoodDiagonall pos le (length list) = (buildElem pos (le + 1) list) : takeDiagonal (pos + 1) le list
  | otherwise = takeDiagonal (pos + 1) le list

takeDiagonalBackwards :: Int -> Int -> [Int] -> [[Int]]
takeDiagonalBackwards pos le list
  | pos == (length list) - 3 * le = []
  | isGoodDiagonallBackwards pos le (length list) = (buildElem pos (le - 1) list) : takeDiagonalBackwards (pos + 1) le list
  | otherwise = takeDiagonalBackwards (pos + 1) le list

solveHorizontal len = maximum . removeLastN 3 . map (product) . rightPairs 0 len . concat

solveVertical len maxLen = takeDown len maxLen

solveDiagonalRight le = takeDiagonal 0 le . concat

solveDiagonalLeft le = takeDiagonalBackwards 0 le . concat

resultFunctor :: (Ord c, Foldable t, Num c) => (a -> [t c]) -> a -> c
resultFunctor x = maximum . map (product) . x

transform :: String -> [[Int]]
transform = map (map turnItToInt . words) . lines

main :: IO ()
main = do
  line <- readFile "Input"
  let result = transform line
  let len = length (head result)
  let y = maximum (map (product) (solveVertical len (concat result)))
  let x = solveHorizontal len result
  let z = solveDiagonalRight len result
  let t = maximum (map (product) (solveDiagonalLeft len result))
  print (z)
  print (maximum [x, y, t])