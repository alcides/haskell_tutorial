#!/usr/bin/env runhaskell

double a = 2 * a

doubleList :: [Int] -> [Int]
doubleList [] = []
doubleList (d:ds) = (double d):(doubleList ds)

ones :: [Int]
ones = 1:ones

main :: IO ()
main = do
	putStr "double: "
	putStrLn (show (doubleList fiveones))
		where fiveones = take 5 ones