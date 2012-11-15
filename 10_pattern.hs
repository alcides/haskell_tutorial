#!/usr/bin/env runhaskell



recursiveOp :: (Int -> Int -> Int) -> Int -> Int -> Int
recursiveOp op a 1 = a
recursiveOp op a b = op a (self a (b-1))
						where self = recursiveOp op


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