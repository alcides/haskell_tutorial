#!/usr/bin/env runhaskell


type Year = Int
type Month = Int
type Day = Int

-- Introducing records. They are the same as before, but they automatically
-- create new functions:
-- year :: Date -> Year
-- month :: Date -> Month
-- day :: Date -> Day

-- Date: YYYY MMM D
data Date = Date {
		year :: Year,
		month :: Month,
		day :: Day
	}
	deriving (Show)

tomorrow = Date 2012 11 17

display :: Date -> String
display d = naturalMonth (month d) ++ " " ++ naturalDay (day d) ++ ", " ++ (show $ year d)

main :: IO ()
main = do
	putStrLn $ display $ tomorrow

naturalDay :: Day -> String
naturalDay 1 = "1st"
naturalDay 2 = "2nd"
naturalDay 3 = "3rd"
naturalDay n = (show n) ++ "th"
	
naturalMonth :: Month -> String
naturalMonth 1 = "January"
naturalMonth 2 = "February"
naturalMonth 3 = "March"
naturalMonth 4 = "April"
naturalMonth 5 = "May"
naturalMonth 6 = "June"
naturalMonth 7 = "July"
naturalMonth 8 = "August"
naturalMonth 9 = "September"
naturalMonth 10 = "October"
naturalMonth 11 = "November"
naturalMonth 12 = "December"

naturalMonth _ = "Other" -- ??