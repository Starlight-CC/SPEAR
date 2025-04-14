--[=[
 _________________________________________
|  ###  ###  ###   #   ##        ###  ### |
|  #    # #  #    # #  # #       #    #   |
|  ###  ###  ###  ###  ##        #    #   |
|    #  #    #    # #  # #       #    #   |
|  ###  #    ###  # #  # #       ###  ### |
|_________________________________________|
]=]
-- Config
local config={
    TOC=100 -- timout clock
}
-- Setup statics
local nums={"1","2","3","4","5","6","7","8","9","0"}
local chars={"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
local operators={"==","~=",">","<","<=",">=","+","-","*","/","++","--"}
local static={"true","false","nil"}
-- Setup vars
local vars = {}
vars.private,vars.public,vars.runtime = {},{},{}
local gotoFlags = {}
-- Setup counters and flags
local PC = 1 -- Program counter
local Line = "" -- Current line
local TO = 0 -- clock iterations
-- Get startup args
local startupArgs = {...}
-- Make syntax
--[=[Key
    new, 
    set, self = args
    sudoset, Self args
    call, self(args)
    index, self[args]
    class, self{}
    dec, self(args[1]){args[2]}
]=]
local syntax = {

}
-- Basic funcs
local function isin(item,list,iorv) -- If item is in list
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
local function getLines(filename) -- Gets lines of a file
    local lines = {}
    -- io.lines returns an iterator, so we need to manually unpack it into an array
    for line in io.lines(filename) do
        lines[#lines+1] = line
    end
    return lines
end
-- Begin running code
local Program = getLines(startupArgs[1])
while true do
    Line = Program[PC]
    local command = ""
    local subString = ""
    local i = 1
    while true do
        if isin(subString,join(syntax,vars.public,vars.private,table.unpack(vars.runtime)),true) then
            command = subString
            break
        else
            i=i+1
            TO=TO+1
            subString = Line.sub(1,i)
        end
        if TO == config.TOC then
            error("Timed out")
        end
    end
    if not isin(subString,join(syntax,vars.public,vars.private,table.unpack(vars.runtime)),true) then
        error("Command parse error")
    end
    