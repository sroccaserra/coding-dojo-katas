require 'luaunit'
require 'postfix'

module(..., package.seeall)

function testOneNumber()
    assertEquals('3', postfix'3')
    --> return '3'
    assertEquals('44', postfix'44')
    --> return s
end

function testOneMultiplication()
    assertEquals('3 4 *', postfix'3*4')
    --> if '3*4' == s then return '3 4 *' end

    assertEquals('44 4 *', postfix'44*4')
    --> if '4*4' == s then return '4 4 *' end
    --> position = s:find('*4')
    --- if position then return s:sub(1, position -1) end

    assertEquals('44 44 *', postfix'44*44')
    --> if s:find('*44') ... if s:find('*4')...
    --> extract method 'number'
    --> number returns tail as well; if '*' == tail:sub(1, 1) ...
    --> extract methods 'first' & 'rest'
    --> introduction of tokens table to factor out spaces
end

function testSeveralMultiplications()
    assertEquals('3 4 * 5 *', postfix'3*4*5')
    --> 'if' becomes 'while'
end

function testAddition()
    assertEquals('3 4 +', postfix'3+4')
    --> extract method 'term'
    --> simetry => introduce 'expression'
    --> extract method 'binaryOperation'
    assertEquals('3 4 + 5 +', postfix'3+4+5') -- pass
end

function testPrecedence()
    assertEquals('3 4 5 * +', postfix'3+4*5') -- pass
end

function testParenthese()
    assertEquals('3', postfix'(3)')
    --> extract method 'factor';
    --- if '(' == first(s) then return expression(tokens, rest(s)) end
    assertEquals('3 4 + 5 *', postfix'(3+4)*5')
    --> consume ')' with rest(expression(tokens, rest(s)))
    --> remove regex if needed
end
