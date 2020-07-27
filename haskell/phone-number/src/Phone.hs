module Phone (number) where

import Data.Char(isDigit)

isAllowedChar :: Char -> Bool
isAllowedChar char = isDigit char || char `elem` ['+', '-', ' ', '(', ')', '.']

areAllAllowed :: String -> Maybe String
areAllAllowed xs = if all isAllowedChar xs then Just xs else Nothing

number :: String -> Maybe String
number xs = case areAllAllowed xs of
            Just x -> case length $ filtered x of
                11 -> if head (filtered x) == '1' && checkNumber (filtered x) 1 then Just $ tail $ filtered x else Nothing
                10 -> if checkNumber (filtered x) 0 then Just $ filtered x else Nothing
                _ -> Nothing
            Nothing -> Nothing
            where filtered = filter isDigit 


checkNumber :: String -> Int -> Bool
checkNumber xs n = let x = xs !! (0+n)
                       y = xs !! (3+n) 
                       disallowed = ['0', '1'] in
                    not (x `elem` disallowed || y `elem` disallowed)
