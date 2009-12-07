local function first(s)
    return s:sub(1, 1)
end
local function rest(s)
    return s:sub(2)
end

local zero = string.byte'0'
local nine = string.byte'9'

local function numberEnd(s)
    for i = 1, #s do
        local char = s:byte(i)
        if not (zero <= char and char <= nine) then
            return i
        end
    end
    return nil
end

local function number(tokens, s)
    local position = numberEnd(s)
    local theNumber, tail = s, ""
    if position then
        theNumber, tail = s:sub(1, position-1), s:sub(position)
    end
    tokens[#tokens+1] = theNumber
    return tail
end

local function factor(tokens, s)
    if '(' == first(s) then
        local tail = expression(tokens, rest(s))
        assert(')' == first(tail))
        return rest(tail)
    end
    return number(tokens, s)
end

local function binaryOperation(tokens, s, operator, subproduction)
    local tail = subproduction(tokens, s)
    while operator == first(tail) do
        tail = subproduction(tokens, rest(tail))
        tokens[#tokens+1] = operator
    end
    return tail
end

local function term(tokens, s)
    return binaryOperation(tokens, s, '*', factor)
end

function expression(tokens, s)
    return binaryOperation(tokens, s, '+', term)
end

function postfix(s)
    local tokens = {}
    expression(tokens, s)
    return table.concat(tokens, ' ')
end
