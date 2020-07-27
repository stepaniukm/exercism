module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock {hours:: Int, minutes:: Int}
  deriving Eq

type Hours = Int
type Minutes = Int

simplifyTime :: (Hours, Minutes) -> (Hours, Minutes)
simplifyTime (h, m) 
  | h >= 0 && h < 24 && m >= 0 && m < 60 = (h, m)
  | h >= 24 = simplifyTime (h - 24, m)
  | h < 0 = simplifyTime (24 + h, m)
  | m < 0 = simplifyTime (h - 1, 60 + m)
  | otherwise = simplifyTime (h + 1, m - 60)

fromHourMin :: Hours -> Minutes -> Clock
fromHourMin h m = Clock{hours = sh, minutes = sm} 
                      where (sh,sm) = simplifyTime (h, m)

toString :: Clock -> String
toString (Clock {hours = h, minutes = m}) = fh ++ ":" ++ fm 
                                      where fh = if length (show h) == 1 then "0" ++ show h else show h
                                            fm = if length (show m) == 1 then "0" ++ show m else show m
                                      
addDelta :: Hours -> Minutes -> Clock -> Clock
addDelta hour mins clock = Clock{hours = sh, minutes = sm} 
                      where (sh,sm) = simplifyTime (hours clock + hour, minutes clock + mins)
