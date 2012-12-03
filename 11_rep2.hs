#!/usr/bin/env runhaskell

double :: Int -> Int
double a = 2 * a
triple :: Int -> Int
triple a = 3 * a

-- Now we have the same problem with double and tripleList. The have a common
-- structure, but the specific function applied to each element is different.

doubleList :: [Int] -> [Int]
doubleList [] = []
doubleList (x:xs) = (double x):(doubleList xs)


tripleList :: [Int] -> [Int]
tripleList [] = []
tripleList (x:xs) = (triple x):(tripleList xs)



main :: IO ()
main = do
	putStr "double: "
	putStrLn (show (doubleList [2,3,4]))
	putStr "triple: "
	putStrLn (show (tripleList [2,3,4]))