--[=[
 ______________________________________________
|  ###  ###  ###   #   ##        #    # #   #  |
|  #    # #  #    # #  # #       #    # #  # # |
|  ###  ###  ###  ###  ##        #    # #  ### |
|    #  #    #    # #  # #       #    # #  # # |
|  ###  #    ###  # #  # #       ###  ###  # # |
|______________________________________________|
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
-- Setup counters, flags, and registers
local PC = 1 -- Program counter
local TO = 0 -- clock iterations
local f1,f2,f3 = "","",""
local Args,Tags,code = {},{},{}
-- Get startup args
local startupArgs = {...}
-- Make syntax
--[=[Key

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
local function join(...)
    local args={...}
    local ret={}
    for _,v1 in ipairs(args) do
        for i2,v2 in pairs(v1) do
            ret[i2]=v2
        end
    end
    return ret
end
-- Begin running code
local Program = io.open(startupArgs[1],"r")
tmp=Program
Program=Program.readAll()
tmp.close()
tmp=""
while true do
    
    
    