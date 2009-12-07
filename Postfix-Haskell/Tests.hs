module Main where
import Test.HUnit
import Data.List
import Postfix
import Char

main = runTestTT $
       TestList [testSimpleNumber
                ,testNumberProduction
                ,testTermProduction
                ,testLoopOnStar
                ,testSimpleMultiplication
                ,testSeveralMultiplications
                ,testSimpleAddition
                ,testPrecedence
                ,testParentheses]

testSimpleNumber =
    TestList [postfix "3" ~?= ["3"]
             ,postfix "41" ~?= ["41"]]

testNumberProduction =
    TestList [number (TokensAndRest [] "3") ~?= TokensAndRest ["3"] ""
             ,number (TokensAndRest [] "33") ~?= TokensAndRest ["33"] ""
             ,number (TokensAndRest [] "3+4") ~?= TokensAndRest ["3"] "+4"
             ,number (TokensAndRest [] "5+4") ~?= TokensAndRest ["5"] "+4"
             ,number (TokensAndRest [] "53+4") ~?= TokensAndRest ["53"] "+4"]

testTermProduction =
    TestList [term (TokensAndRest [] "3") ~?= TokensAndRest ["3"] ""
             ,term (TokensAndRest [] "3*4") ~?= TokensAndRest ["3", "4", "*"] ""
             ,term (TokensAndRest [] "5*4") ~?= TokensAndRest ["5", "4", "*"] ""
             ]

testLoopOnStar =
    TestList [loopOnStar (TokensAndRest [] "*3") ~?= TokensAndRest ["3", "*"] ""
             ,loopOnStar (TokensAndRest [] "*3*5") ~?= TokensAndRest ["3", "*", "5", "*"] ""]

testSimpleMultiplication =
    TestList [postfix "3*4" ~?= ["3", "4", "*"]
             ,postfix "55*4" ~?= ["55", "4", "*"]]

testSeveralMultiplications =
    TestList [postfix "3*4*5" ~?= ["3", "4", "*", "5", "*"]]

testSimpleAddition =
    TestList [postfix "33+5" ~?= ["33", "5","+"]]

testPrecedence =
    TestList [postfix "33+5*87" ~?= ["33", "5", "87", "*", "+"]]

testParentheses =
    TestList [postfix "(33+5)*87" ~?= ["33", "5", "+", "87", "*"]]

