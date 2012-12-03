#!/usr/bin/env runhaskell

-- This is an example of bad usage of IO in your program. This is result of 
-- splitting your program by blocks as you see then linearly.

-- In FP, you extract blocks by behavior and not by order. You can see that
-- all these functions (except the functional core func) have the IO mark.
-- This means that if I want to reuse any function, the caller function, will
-- have to bear the IO mark and so on. This is horrible for code reuse.

getNum :: Int -> IO (Int)
getNum n = do
	putStrLn $ "Number" ++ (show n) ++ ":"
	a <- getLine
	return $ read a

func :: Num a => a -> a -> a
func = (+)

ans :: IO (Int)
ans = do
	n1 <- getNum 1
	n2 <- getNum 2
	return $ func n1 n2

main :: IO ()
main = do
		a <- ans
		putStr "Sum: "
		print a