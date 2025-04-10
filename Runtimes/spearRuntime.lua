local config={
    TOC=100
}
local PC=1
local LC=1
local vars={}
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
                error("invalid arg at line \""..tostring(PC).."\"")
            end
        end,
        index=function(...)
            local args = {...}
            local val = args[1]
            if type(val) == "string" then
                return gotoFlags[val]
            else
                error("invalid arg at line \""..tostring(PC).."\"")
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
            local args={...}
            local varType = args[1]
            local nameSpace = args[2]
            local val = eval(args,4)
            if canFit(val,varType) then
                vars[nameSpace] = {
                    ["type"]=varType,
                    ["value"]=val
                }
            end
        end
    }
}