local l_Parent_0 = script.Parent.Parent;
local v1 = {};
local v2 = require(l_Parent_0.ChalkLua);
v1.default = function() --[[ Line: 15 ]] --[[ Name: getNoTestFoundPassWithNoTests ]]
    -- upvalues: v2 (copy)
    return v2.bold("No tests found, exiting with code 0");
end;
return v1;