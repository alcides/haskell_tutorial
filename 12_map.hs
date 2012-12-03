#!/usr/bin/env runhaskell

double :: Int -> Int
double a = 2 * a
triple :: Int -> Int
triple a = 3 * a

-- applyOverList is a function that receives a function, a list of ints, and
-- returns a list of the application of a function to each element.
applyOverList :: (Int -> Int) -> [Int] -> [Int]
applyOverList f xs = [ f x | x <- xs ]

-- The [ ... ] syntax is called list comprehension. It is only syntax sugar
-- that makes the code more mathematical and (surprisingly) more readable.
-- You can read it as: for each element of xs, apply f to it and return the
-- results as a list. Later we will see how to filter elements using the same
-- syntax.

doubleList = applyOverList double
tripleList = applyOverList triple


main :: IO ()
main = do
	putStr "double: "
	putStrLn (show (doubleList [2,3,4]))
	putStr "triple: "
	putStrLn (show (tripleList [2,3,4]))