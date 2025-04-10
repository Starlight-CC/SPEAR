local config={
    TOC=100
}
local Args={...}
local PCode=Args[1]
local PC=1
local Line=""
local vars={}
vars.private={}
vars.public={}
local gotoFlags={}
local nums={"1","2","3","4","5","6","7","8","9","0"}
local chars={"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
local operators={"==","~=",">","<","<=",">=","+","-","*","/","++","--"}
local static={"true","false","nil"}
local syntax={
    ["goto"] = {
        call=function(...)
            local args = {...}
            local val = args[1]
            if type(val) == "string" then
                if isin(val,gotoFlags) then
                    PC = gotoFlags[val]
                end
            elseif type(val) == "number" then
                PC = val
            else
                error("error on line"..tostring(PC))
            end
        end,
        set=function(...)
            local args = {...}
            local val = args[1]
            if type(val) == "string" then
                if isin(val,gotoFlags) then
                    PC = gotoFlags[val]
                end
            elseif type(val) == "number" then
                PC = val
            else
                error("error on line"..tostring(PC))
            end
        end,
        index=function(...)
            local args = {...}
            local val = args[1]
            if type(val) == "string" then
                return gotoFlags[val]
            else
                error("error on line"..tostring(PC))
            end
        end
    },
    ["print"]={
        call=function(...)
            local args={...}
            local str = ""
            for i,v in ipairs(args) do
                str = str..tostring(v)
            end
            print(str)
        end
    },
    ["private"]={
        set=function(...)
            local args = {...}
            local varType = args[1]
            local nameSpace = args[2]
            local val = eval(args,4)
            if not isin(nameSpace,syntax) then
                if canFit(val,varType) then
                    vars.private[nameSpace] = {
                        ["type"]=varType,
                        ["value"]=val
                    }
                    lookup[nameSpace] = varType
                else
                    error("error on line"..tostring(PC))
                end
            end
        end
    },
    ["gflag"]={
        set=function(...)
            local args = {...}
            local name = args[1]
            if type(name) == "string" then
                gotoFlags[name] = PC
            else
                error("error on line"..tostring(PC))
            end
        end
    }
}
function canFit(value,varType)
    if type(value) == "number" && not hasDec(val) then
        if varType == "byte" && -1<value<256 then
            return true
        elseif varType == "sbyte" && -129<value<128 then
            return true
        elseif varType == "ushort" && -1<value<65536 then
            return true
        elseif varType == "short" && -32769<value<32768 then
            return true
        elseif varType == "uint" && -1<value<4294967296 then
            return true
        elseif varType == "int" && -2147483649<value<2147483648 then
            return true
        elseif varType == "ulong" && -1<value<18446744073709551616 then
            return true
        elseif varType == "long" && -9223372036854775809<value<9223372036854775808 then
            return true
        end
    elseif type(value) == "number" then
function isin(item,list,iorv)
    for i,v in ipairs(list) do
        if iorv then
            if i == item then
                return true
            end
        else
            if v == item then
                return true
            end
        end
    end
    return true
end
function getLines(filename)
    local lines = {}
    -- io.lines returns an iterator, so we need to manually unpack it into an array
    for line in io.lines(filename) do
        lines[#lines+1] = line
    end
    return lines
end
local PCode = getLines("test")
while true do
    Line = PCode[PC]
    local i = 1
    local subString = ""
    local command = ""
    while true do
        if isin(subString,lookup,true) then
            command = subString
            break
        else
            i = i + 1
            subString = Line.sub(1,i)
        end
    end
    parse(Line.sub(i+1,#Line))