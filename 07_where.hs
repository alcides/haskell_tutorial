#!/usr/bin/env runhaskell

times :: Int -> Int -> Int
times n x = sum xs
		where xs = [ x | i <-[1..n] ]

double :: Int -> Int
double x = times 2 x

triple :: Int -> Int
triple = times 3

main :: IO ()
main = do
	putStr "double: "
	putStr (show (double 4))
