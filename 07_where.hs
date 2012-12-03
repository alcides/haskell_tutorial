#!/usr/bin/env runhaskell

-- Another way of expressing times.
times :: Int -> Int -> Int
times n x = sum $ take n xs
		where xs = x:xs
-- The where clause defines a function in the scope of that function definition.
-- The $ operator is syntax sugar for function application. Since function
-- calling is one of the operations with the most priority, sometimes is useful
-- to use the $ sign.

-- sum $ take n xs is the same as sum (take n xs)

-- So what are the sum and take functions? 
-- Introducing Hoogle: http://www.haskell.org/hoogle/, a search engine for 
-- Haskell modules. Hoogle the function name and see its documentation.

-- Tip: Prelude is the default package that is automatically loaded in 
-- haskell programs

-- So, we are summing the first n elements of xs. What is xs?
-- xs = x:xs is a recursive infinite function. How can this program terminate 
-- then? Lazyness is one of the features of Haskell. Things (thunks) are not 
-- calculated until they are in fact needed. Taking 3 elements of xs, means
-- that it will take one x, another x and yet another x. It will then sum them
-- together. Since we only need 3, the recursive function will only be called 
-- thrice.

double :: Int -> Int
double x = times 2 x

triple :: Int -> Int
triple = times 3

main :: IO ()
main = do
	putStr "double: "
	putStr (show (double 4))
