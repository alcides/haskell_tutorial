#!/usr/bin/env runhaskell

-- Same as before, but more complex usage. Notice the dayOf, monthOf and yearOf
-- functions, used to extract elements of the date. This is really painful, 
-- right? (Next Slide)

type Year = Int
type Month = Int
type Day = Int

-- Date: YYYY MMM D
data Date = Date Year Month Day
	deriving Show

tomorrow = Date 2012 11 17

dayOf :: Date -> Day
dayOf (Date _ _ d) = d

monthOf :: Date -> Month
monthOf (Date _ m _) = m

yearOf :: Date -> Year
yearOf (Date y _ _) = y

display :: Date -> String
display d = naturalMonth (monthOf d) ++ " " ++ naturalDay (dayOf d) ++ ", " ++ (show $ yearOf d)

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