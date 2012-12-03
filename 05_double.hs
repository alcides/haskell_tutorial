#!/usr/bin/env runhaskell

-- These are comments.


-- In haskell functions are written as equations. They can be
-- used interchangeably. It means that they are pure, with no
-- side effects.
double :: Int -> Int -- Type declaration (optional and inferred by the compiler)
double x = x + x -- The actual definition. 

-- Functions that have IO in their type perform computation with side effects.
-- They are built using the do-notation, and are written in an imperitive style.
main :: IO ()
main = do
	putStr "double: "
	putStr (show (double 3))