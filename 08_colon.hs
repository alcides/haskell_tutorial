#!/usr/bin/env runhaskell

-- Another infinte recursive function. Receives no arguments and returns a list 
-- of Ints. The colon (cons) operator (head:remaining_of_the_list) is used to
-- create a list with the head on the front, and a list as the rest.
-- (1:(2:(3,Nil))) would be the same as [1,2,3] in another language.
ones :: [Int]
ones = 1:ones

double a = 2 * a

-- doubleList takes a list of Integers and returns another list of integers.
doubleList :: [Int] -> [Int]
doubleList [] = []
doubleList (d:ds) = (double d):(doubleList ds)
-- This function is defined using pattern-matching. It tries to find a match
-- for the argument by order. If it is an empty list, it returns another empty 
-- list. If it is something else, it splits it in the head and tail. The
-- returned list is the double of the head on top of the the recursive call
-- to the rest of the list.

main :: IO ()
main = do
	putStr "double: "
	putStrLn (show (doubleList fiveones))
		where fiveones = take 5 ones