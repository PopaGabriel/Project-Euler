import System.IO
import Data.Char(digitToInt)

turnItToDigits:: String -> [Int]
turnItToDigits = concat . map (map (digitToInt)) . lines

take13::[Int]->[Int]
take13 x = take 13 x

keepTaking::[Int]->[[Int]]
keepTaking [] = []
keepTaking list@(_:xs) 
    | length list < 13 = []
    | otherwise = (take13 list) : (keepTaking xs)

multiplyAll::[Int]->Int
multiplyAll x = foldr (\acc y -> acc * y) 1 x

solve = maximum . map multiplyAll . keepTaking . turnItToDigits

main::IO()
main = do
    handle <- readFile "Input"
    let result = solve handle
    print result