#!/usr/bin/env runhaskell

-- In this example we have two definitions (times and power), that share the
-- same structure (recursive call until argument is 1), they are only different
-- in one detail: the + or * operator used.

-- This is one of those cases where a GoF enthusiast would recommend you to use
-- a design pattern. Which is a good idea. But the most common design pattern
-- in FP is very, very simple. (Next slide)

times 1 n = n
times a b = a + (times (b-1) a)

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