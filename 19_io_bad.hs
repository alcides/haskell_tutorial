#!/usr/bin/env runhaskell


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