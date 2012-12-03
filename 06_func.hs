#!/usr/bin/env runhaskell


-- times (*) receives two integers and returns another integer.
times :: Int -> Int -> Int
times 0 _ = 0
times 1 x = x
times n x = x + (times (n-1) x)

-- double and triple are specific applications of the times function.
double :: Int -> Int
double x = times 2 x

triple :: Int -> Int
triple = times 3

-- This is the power of Currying.
-- times :: Int -> Int -> Int, a function that receives 2 integers and returns
-- another, can be used as:
-- times :: Int -> (Int -> Int), a function that receives an integer and
-- returns a function from an integer to another integer.

-- Functions that receive functions as arguments and return functions are
-- pretty common in FP. It's the concept of functions as values.

main :: IO ()
main = do
	putStr "double: "
	putStr (show (double 4))