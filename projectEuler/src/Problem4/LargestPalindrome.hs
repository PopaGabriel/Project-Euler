allPossibilities:: [Int]
allPossibilities = [y * z | y <- [1..999],
                            z <- [1..999]]

reverseAnInt:: Int -> Int -> Int
reverseAnInt x soFar
    | x == 0 = soFar
    | otherwise = reverseAnInt (fst (x `divMod` 10)) (soFar * 10 + snd (x `divMod` 10))

-- largestPalindrome:: [Int]
largestPalindrome = maximum [fst y| y <- filter (\x -> snd x == 0) [(x, x - reverseAnInt x 0) | x <- allPossibilities]]