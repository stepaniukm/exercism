module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = if by100 then by4 && by400 else by4
  where by4 = year `mod` 4 == 0
        by100 = year `mod` 100 == 0
        by400 = year `mod` 400 == 0
