#!/usr/bin/env runhaskell

-- Until now I have done everything wrong. It is true that the core of FP are
-- functions. But the first thing you do on a FP project is to define the Data
-- Types. By having a good understanding of how to represent information,
-- it is really easy to express the rest of the program as functions of those
-- types.

-- Haskell provides a set of features for defining new types:

-- Type aliasing. Why make functions that receive Ints, when in fact we want
-- functions that receives Months? More readable, and it's the same for the
-- compiler.
type Year = Int
type Month = Int
type Day = Int

-- Haskell supports algebraic data types.
-- Date is the constructor for the Date type (could have different name)
-- Date: YYYY MMM D
data Date = Date Year Month Day
	deriving Show

today = Date 2012 11 31
tomorrow = today `addDateAndDay` 100


daysOfMonth :: Int -> Int
daysOfMonth 2 = 28 -- Homework
daysOfMonth n | n `elem` [1,3,5,7,8,10,12] = 31
daysOfMonth _ = 30

addDateAndDay :: Date -> Day -> Date
(Date y m d) `addDateAndDay` day = correctDate $ Date y m (d+day)
-- Constructors are really good for deconstructing the object in pattern matching.

addDateAndDate :: Date -> Date -> Date
(Date y1 m1 d1) `addDateAndDate` (Date y2 m2 d2) = correctDate $ Date (y1 + y2) (m1 + m2) (d1 + d2)

correctDate :: Date -> Date
correctDate (Date y m d) | d > daysOfMonth d = correctDate $ Date y (m+1) (d - daysOfMonth d)
					     | m > 12 = correctDate $ Date (y+1) (m - 12) d
correctDate d = d


main :: IO ()
main = do
	putStrLn $ show $ tomorrow