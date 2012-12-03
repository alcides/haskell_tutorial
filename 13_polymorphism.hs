#!/usr/bin/env runhaskell


double :: Int -> Int
double a = 2 * a
triple :: Int -> Int
triple a = 3 * a
half :: Int -> Float
half a = (fromIntegral a) / 2
-- Introducing Floats!!! Because not everything in Life is an Int.
-- Don't know what fromIntegral is? Hoogle it ;)

-- So now we need to pass not only Ints, but also Floats. Heck, let's just make
-- it generic. This is done using polymorphism, a different kind of the one used
-- in OOP languages. We use a and b in the types as "any type".

applyOverList :: (a -> b) -> [a] -> [b]
applyOverList f xs = [ f x | x <- xs ]

-- applyOverList now receives a function from type a to type b (can be
-- diferent or equal) and a list of type as, and returns a list of type bs.

-- Note that the type inference is as general as possible, and will come up with
-- this type if you comment the type definition on the previous slide.
	
-- PS: This function seems very useful and common. We have just defined map,
-- from the map-reduce pattern.

-- PS2: [ f x | x <- xs ] is in fact syntax sugar for (map f xs). Inception!

doubleList = applyOverList double
tripleList = applyOverList triple
halfList = applyOverList half




main :: IO ()
main = do
	putStr "double: "
	putStrLn (show (doubleList [2,3,4]))
	putStr "half: "
	putStrLn (show (halfList [2,3,4]))