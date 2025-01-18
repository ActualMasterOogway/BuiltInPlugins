local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework).ContextServices.ContextItem:extend("DialogProvider");
v1.new = function(v2) --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    assert(typeof(v2) == "function", "No showDialog function was provided.");
    local v3 = {
        showDialog = v2
    };
    setmetatable(v3, v1);
    return v3;
end;
return v1;