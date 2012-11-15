#!/usr/bin/env runhaskell

double :: Int -> Int
double a = 2 * a
triple :: Int -> Int
triple a = 3 * a


applyOverList :: (Int -> Int) -> [Int] -> [Int]
applyOverList f xs = [ f x | x <- xs ]

doubleList = applyOverList double
tripleList = applyOverList triple




main :: IO ()
main = do
	putStr "double: "
	putStrLn (show (doubleList [2,3,4]))
	putStr "triple: "
	putStrLn (show (tripleList [2,3,4]))