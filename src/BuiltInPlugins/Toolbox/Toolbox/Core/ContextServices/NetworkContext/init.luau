local l_Packages_0 = script.Parent.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Framework).ContextServices.ContextItem:extend("NetworkInterface");
v1.new = function(v2) --[[ Line: 9 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v3 = {
        networkInterface = v2
    };
    setmetatable(v3, v1);
    return v3;
end;
return v1;