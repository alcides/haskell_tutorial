#!/usr/bin/env runhaskell

func = (+)

programLogic :: String -> String -> String
programLogic a b = show $ func (read a) (read b)

main :: IO ()
main = do
	let ask n = do
		putStrLn $ "Number" ++ (show n) ++ ": "
		getLine
	a1 <- ask 1
	a2 <- ask 2
	putStr "Sum: "
	putStrLn $ programLogic a1 a2
	