#!/usr/bin/env runhaskell

double :: Int -> Int
double x = x + x

main :: IO ()
main = do
	putStr "double: "
	putStr (show (double 4))