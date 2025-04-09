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
            args = {...}
            if type(args[1]) == 
        end
    },
}