sumNaturals::Int -> Int
sumNaturals x = foldr (\y acc-> acc + y) 0 [1..x]

powerList::Int->[Int]->[Int]
powerList x = map (^x)

makeTheDifference:: Int -> Int
makeTheDifference x = (sumNaturals x) ^ 2 - sum (powerList 2 [1..x])