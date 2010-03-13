module Postfix where
import Data.List
import Char

type Token = String
type Rest = String

data TokensAndRest = TokensAndRest {
      tokens :: [Token],
      rest :: Rest
    } deriving (Eq, Show)

type TokenAccumulator = (TokensAndRest -> TokensAndRest)

postfix s = tokens $ expression $ TokensAndRest [] s

-- expression ::= <term> ["+" <term>]*

expression :: TokenAccumulator
expression x = loopOnPlus $ term x

loopOnPlus :: TokenAccumulator
loopOnPlus (TokensAndRest tokens ('+':cs)) = loopOnPlus $ TokensAndRest tokens'' cs'
    where TokensAndRest tokens' cs' = term $ TokensAndRest tokens cs
          tokens'' = tokens' ++ ["+"]
loopOnPlus x = x

-- term ::= <factor> ["*" <factor>]*

term :: TokenAccumulator
term x = loopOnStar $ factor x

loopOnStar :: TokenAccumulator
loopOnStar (TokensAndRest tokens ('*':cs)) = loopOnStar $ TokensAndRest tokens'' cs'
    where TokensAndRest tokens' cs' = factor $ TokensAndRest tokens cs
          tokens'' = tokens' ++ ["*"]
loopOnStar x = x

-- binaryOperation :: Char -> TokenAccumulator -> TokenAccumulator
-- binaryOperation operator subexpression = f
--     where f :: TokenAccumulator
--           f (TokensAndRest tokens (operator:cs)) = f $ TokensAndRest tokens'' cs'
--               where TokensAndRest tokens' cs' = subexpression $ TokensAndRest tokens cs
--                     tokens'' = tokens' ++ [[operator]]
--           f x = x

-- factor ::= "(" <expression> ")"
--            | <number>

factor :: TokenAccumulator
factor (TokensAndRest tokens ('(':cs)) = TokensAndRest tokens' cs''
    where TokensAndRest tokens' cs' = expression $ TokensAndRest tokens cs
          cs'' = tail cs'
factor x = number x

-- number ::= ["0".."9"]+

number :: TokenAccumulator
number (TokensAndRest tokens s) = TokensAndRest (tokens ++ [n]) rest
    where (n, rest) = span isDigit s
