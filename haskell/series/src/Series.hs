module Series (slices) where

import Data.Char

slices :: Int -> String -> [[Int]]
slices n string = map (map digitToInt) $ generateSlices n string
  where generateSlices q str = map (\starting -> take q $ drop starting str) $ take (length str - q + 1) [0..]