local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.enumerate);
local _ = require(l_Parent_0.Src.Types);
return (v1("TokenValidationError", {
    "None", 
    "InvalidSyntax", 
    "DoesNotExist", 
    "IncorrectType", 
    "CyclicReference"
}));