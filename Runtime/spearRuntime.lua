local config = {
    TOC = 100
}
function getLines(filename)
    local lines = {}
    -- io.lines returns an iterator, so we need to manually unpack it into an array
    for line in io.lines(filename) do
        lines[#lines+1] = line
    end
    return lines
end
local LN = getLines("test")
local PC = 1
local vars = {}
local nums = {"1","2","3","4","5","6","7","8","9","0"}
local chars = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
local function isin(c,l,m)
    for i,v in pairs(l) do
        if not m then
            if v == c then
                return true
            end
        else
            if i == c then
                return true
            end
        end
    end
    return false
end
local function space(ii,c)
    while C:sub(ii,ii) == " " do
        ii = ii + 1
    end
    return ii
end
    
local i,flag1,flag2,flag3,tmp,TO
while true do
    local CL = LN[PC]
    if CL:sub(1,4) == "goto" then
        i = 5
        i = space(i,CL)
        if CL:sub(i,i) == "\"" then
            flag1 = "string"
            break
        elseif isin(CL:sub(i,i),nums) then
            flag1 = "num"
            break
        else
            tmp = ""
            while not CL:sub(i,i) == nil do
                tmp = tmp..CL:sub(i,i)
            end
            if isin(tmp,vars,true) then
                flag1 = "var"
                flag2 = vars[tostring(tmp)]
            else
                error("goto: arg invalid")
            end
        end
        if flag1 == "num" then
            tmp = ""
            while isin(CL:sub(i,i),nums) do
                tmp = tmp..CL:sub(i,i)
                i = i + 1
            end
            tmp = tonumber(tmp)
        elseif flag1 == "var" then
            tmp = flag2
        end
        print(LN[PC])
        PC = tmp-1
    elseif CL:sub(1,4) == "exit" or PC == #LN then
        break
    elseif CL:sub(1,3) == "var" then
        i = 4
        i = space(i,CL)
        local name = ""
        while not CL:sub(i,i) == "=" do
            name = name..CL:sub(i,i)
            i = i + 1
        end
        i = i + 1
        while not CL:sub(i,i) == nil or CL:sub(i,i) == " " do
            value = value..CL:sub(i,i)
            i = i + 1
        end
        vars[name] = value
    end
    PC = PC + 1
end
print("SL PROG FINISHED")
