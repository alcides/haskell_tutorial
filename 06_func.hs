#!/usr/bin/env runhaskell

times :: Int -> Int -> Int
times 0 _ = 0
times 1 x = x
times n x = x + (times (n-1) x)

double :: Int -> Int
double x = times 2 x

triple :: Int -> Int
triple = times 3

main :: IO ()
main = do
	putStr "double: "
	putStr (show (double 4))