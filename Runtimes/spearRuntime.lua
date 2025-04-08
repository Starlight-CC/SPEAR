local config = {
    TOC = 100
}
local PC = 1
local vars = {}
local nums = {"1","2","3","4","5","6","7","8","9","0"}
local chars = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
local SPEAR = {
    syntax={
        {name="print",mode={}},
        {name="do",mode={}},
        {name="end",mode={}},
        {name="if",mode={}},
        {name="while",mode={}},
        {name="repeat",mode={}},
        {name="goto",mode={}},
        {name="gflag",mode={}},
        {name="private",mode={
            {name="byte",mode={}},
            {name="ubyte",mode={}},
            {name="short",mode={}},
            {name="ushort",mode={}},
            {name="int",mode={}},
            {name="uint",mode={}},
            {name="long",mode={}},
            {name="ulong",mode={}},
            {name="sfloat",mode={}},
            {name="float",mode={}},
            {name="double",mode={}},
            {name="quad",mode={}},
            {name="func",mode={}},
            {name="table",mode={}},
            {name="list",mode={}}
        }},
        {name="public",mode=function() return SPEAR.copy("private") end},
        {name="goto",mode={}},
        {name="prv",mode=function() return SPEAR.copy("private") end},
        {name="pub",mode=function() return SPEAR.copy("private") end}
    },
    Operations={
        add=nil,
        sub=nil,
        multiply=nil,
        divide=nil,
        isEqual=nil,
        isNotEqual=nil,
        isGreaterThan=nil,
        isLessThan=nil,
        addOne=nil,
        subOne=nil,
    }
}