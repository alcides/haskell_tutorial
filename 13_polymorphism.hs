#!/usr/bin/env runhaskell


double :: Int -> Int
double a = 2 * a
triple :: Int -> Int
triple a = 3 * a
-- half :: Int -> Float
-- half a = (fromIntegral a) / 2


applyOverList :: (Int -> Int) -> [Int] -> [Int]
applyOverList f xs = [ f x | x <- xs ]

doubleList = applyOverList double
tripleList = applyOverList triple
halfList = applyOverList half




main :: IO ()
main = do
	putStr "double: "
	putStrLn (show (doubleList [2,3,4]))
	putStr "half: "
	putStrLn (show (halfList [2,3,4]))