#!/usr/bin/env runhaskell

-- No language is complete without sorting algorithms.

quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort (x:xs) = (quicksort (filter (<= x) xs)) ++ [x]
                              ++ (quicksort (filter (> x) xs))
							  
-- filter is another very common operation
-- filter :: (a -> Bool) -> [a] -> [a]
-- filter (<5) [1,2,5,6]
-- filter takes a predicate function (<5) and returns a list of all elements
-- that satisfy that predicate ([1,2]).


main :: IO ()
main = do
	let target = [3,1,2]
	putStr "unordered: "
	putStrLn (show target)
	putStr "ordered: "
	putStrLn $ show $ quicksort target