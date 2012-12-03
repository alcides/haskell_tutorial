#!/usr/bin/env runhaskell

-- The right approach is to have all the IO together in a main function, and all
-- the logic of your program should be in pure functions (without side effects).

-- Pure functions have several advantages:
-- * You can prove theorically that your program is always correct.
-- * You spend less time debugging weird situations where libraries you use 
-- change your program data.
-- * These functions are easier to test.
-- * Pure functions can be automatically parallelized.
-- * Pure functions are composable and allow for a more modular design.

func = (+)


-- Pure function
programLogic :: String -> String -> String
programLogic a b = show $ func (read a) (read b)

main :: ()
main = do
	let ask n = do
		putStrLn $ "Number" ++ (show n) ++ ": "
		getLine
	a1 <- ask 1
	a2 <- ask 2
	putStr "Sum: "
	putStrLn $ programLogic a1 a2
	