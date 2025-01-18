local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework).ContextServices.ContextItem:extend("Navigation");
v1.new = function(v2) --[[ Line: 6 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v3 = {
        navigation = v2
    };
    setmetatable(v3, v1);
    return v3;
end;
v1.get = function(v4) --[[ Line: 15 ]] --[[ Name: get ]]
    return v4.navigation;
end;
return v1;