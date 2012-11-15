#!/usr/bin/env runhaskell


quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort (x:xs) = (quicksort (filter (<= x) xs)) ++ [x]
                              ++ (quicksort (filter (> x) xs))

main :: IO ()
main = do
	let target = [3,1,2]
	putStr "unordered: "
	putStrLn (show target)
	putStr "ordered: "
	putStrLn $ show $ quicksort target -- $$$$$