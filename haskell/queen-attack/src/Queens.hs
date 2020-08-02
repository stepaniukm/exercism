module Queens (boardString, canAttack) where

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString white black = unlines $ map (\row -> unwords $ map (\column -> 
  if row == wr && column == wc then "W" else
  if row == br && column == bc then "B" else "_") [0..7]) [0..7]
  where (wr, wc) = maybe (-1, -1) id white
        (br, bc) = maybe (-1, -1) id black

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (wr, wc) (br, bc) = wr == br || wc == bc || abs (wr - br) == abs (wc - bc)
