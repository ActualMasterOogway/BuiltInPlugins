local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework).ContextServices.ContextItem:extend("RobloxAPI");
v1.new = function(v2) --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v3 = {
        api = v2
    };
    setmetatable(v3, v1);
    return v3;
end;
v1.get = function(v4) --[[ Line: 19 ]] --[[ Name: get ]]
    return v4.api;
end;
return v1;