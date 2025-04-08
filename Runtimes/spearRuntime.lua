config={
    TOC=100
}
PC=1
vars={}
nums={"1","2","3","4","5","6","7","8","9","0"}
chars={"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
operators={"==","~=",">","<","<=",">=","+","-","*","/","++","--"}
static={"true","false","nil"}
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
        --Var types
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
        {name="string"mode={}},
        {name="func",mode={}},
        {name="table",mode={}},
        {name="list",mode={}},
        {name="bool",mode={}}
    }},
    {name="public",mode=function() return copy("private") end},
    {name="goto",mode={}},
    {name="prv",mode=function() return copy("private") end},
    {name="pub",mode=function() return copy("private") end}
}
Operations={
    T=function() return true end,
    F=function() return false end,
    N=function() return nil end
}
--0 is name
--tbl is a numbered arg
--1 unnumbered arg
modes={
}
