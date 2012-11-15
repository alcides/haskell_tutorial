#!/usr/bin/env runhaskell


times 1 n = n
times a b = a * (times (b-1) a)

double = times 2
triple = times 3

-- Another one

power 1 n = n
power a b = a * (power (b-1) a)

square x = power x 2
cube x = power x 3


main :: IO ()
main = do
	putStr "double: "
	putStrLn (show (cube 2))