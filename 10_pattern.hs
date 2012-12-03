#!/usr/bin/env runhaskell

-- That design pattern is using Higher-Order Functions. These are functions
-- that receive other functions as arguments. The idea is to define the general
-- common behavior in this function, and receiving the specific behavior as 
-- arguments.

-- recursiveOp is one example. It receives a function that receives two integers
-- and returns another. It then receives the two parameters of times and power,
-- and returns the final integer.

-- FYI:
-- (+) :: Int -> Int -> Int
-- (*) :: Int -> Int -> Int

recursiveOp :: (Int -> Int -> Int) -> Int -> Int -> Int
recursiveOp op a 1 = a
recursiveOp op a b = op a (self a (b-1))
						where self = recursiveOp op


-- What is the type of times? The same! We are using Currying.
-- Fun fact: What is the first name of Mr. Curry?
times = recursiveOp (+)
double = times 2
triple = times 3

-- Another one

power = recursiveOp (*)
square x = power x 2
cube x = power x 3


main :: IO ()
main = do
	putStr "double: "
	putStrLn (show (cube 2))