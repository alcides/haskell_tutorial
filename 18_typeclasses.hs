#!/usr/bin/env runhaskell

-- import Prelude hiding ((+))

type Year = Int
type Month = Int
type Day = Int

-- Date: YYYY MMM D
data Date = Date {
		year :: Year,
		month :: Month,
		day :: Day
	}
	deriving (Show)


eqDate :: Date -> Date -> Bool
eqDate one another = all (\f -> (f one) == (f another)) [year, month, day] 

instance Eq Date where  
	(==) = eqDate
	
	
class Addable a where
	(<--) :: a -> a -> a
	
instance Addable Date where
	(<--) = addDateAndDate

today = Date 2012 11 17
tomorrow = today <-- (Date 0 0 0)

main :: IO ()
main = do
	putStrLn $ show $ tomorrow == today
	
	
-- Old Stuff

addDateAndDate :: Date -> Date -> Date
(Date y1 m1 d1) `addDateAndDate` (Date y2 m2 d2) = correctDate $ Date (y1 + y2) (m1 + m2) (d1 + d2)

correctDate :: Date -> Date
correctDate (Date y m d) | d > daysOfMonth d = correctDate $ Date y (m+1) (d - daysOfMonth d)
					     | m > 12 = correctDate $ Date (y+1) (m - 12) d
correctDate d = d


daysOfMonth :: Int -> Int
daysOfMonth 2 = 28 -- Homework
daysOfMonth n | n `elem` [1,3,5,7,8,10,12] = 31
daysOfMonth _ = 30
