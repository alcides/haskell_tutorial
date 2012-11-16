#!/usr/bin/env runhaskell

func = (+)

{-
class Monad m where
  (>>=) :: m a -> (a -> m b) -> m b
  (>>) :: m a -> m b -> m b
  return :: a -> m a
  fail :: String -> m a
-}

data ZeroError a = OK a | Fail a
	deriving Show

instance Monad ZeroError where
	return a = OK a
	(OK a) >>= f = f a
	(Fail a) >>= f = case f a of
		OK s -> Fail s
		Fail s -> Fail s
		
sdiv :: Int -> Int -> ZeroError Int
sdiv a 0 = Fail 0
sdiv a b = OK $ a `div` b
		
		
makeDiv :: Int -> Int -> ZeroError Int
makeDiv = sdiv

getResult :: ZeroError (Int)
getResult = do
	d <- 1 `sdiv` 0
	e <- 4 `sdiv` 2	
	return $ d + e

main :: IO ()
main = do
	putStrLn $ case getResult of
		OK s -> show s
		Fail _ -> "Failed to Divide by 0"
	