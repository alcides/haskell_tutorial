#!/usr/bin/env runhaskell

func = (+)

-- Monads are worth a Talk on their own.
-- http://www.cs.rit.edu/~ats/talks/monads/monads.pdf
-- http://channel9.msdn.com/Shows/Going+Deep/Brian-Beckman-Dont-fear-the-Monads#358968

-- A monad in Haskell is just a type class with the following definition.

{-
class Monad m where
  (>>=) :: m a -> (a -> m b) -> m b
  (>>) :: m a -> m b -> m b
  return :: a -> m a
  fail :: String -> m a
-}

-- Here we implement a new datatype that is ZeroError, that represents
-- either a Sucessful division, or a Failed division (by 0).

data ZeroError a = OK a | Fail a
	deriving Show

-- ZeroError is a monad.
-- return a, makes it an OK result.
-- Applying a function f to an OK result, will result in f of the result.
-- Applying a function f to a Fail result, will result in the same Fail.
instance Monad ZeroError where
	return a = OK a
	(OK a) >>= f = f a
	(Fail a) >>= f = case f a of
		OK s -> Fail s
		Fail s -> Fail s

-- The main function for division
sdiv :: Int -> Int -> ZeroError Int
sdiv a 0 = Fail 0
sdiv a b = OK $ a `div` b

-- Haskell features syntax support for monads with the do-notation.
-- Between the lines of the do expression, the compiler introduces the
-- bind operator.

getResult :: ZeroError (Int)
getResult = do
	d <- 1 `sdiv` 0 -- replace 0 with 1 for OK case.
	e <- 4 `sdiv` 2	
	return $ d + e
	
-- My idea of monads is they are used to wrap something inside a type, and
-- still allow for all regular operations, just by defining two functions:
-- bind (>>=) and return.
 
main :: IO ()
main = do
	putStrLn $ case getResult of
		OK s -> show s
		Fail _ -> "Failed to Divide by 0"
	