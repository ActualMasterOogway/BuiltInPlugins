local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework).ContextServices.ContextItem:extend("Analytics");
v1.new = function(v2) --[[ Line: 11 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    assert(v2, "Analytics.new expects analyticsImpl.");
    local v3 = {
        analyticsImpl = v2
    };
    setmetatable(v3, v1);
    return v3;
end;
v1.get = function(v4) --[[ Line: 21 ]] --[[ Name: get ]]
    return v4.analyticsImpl;
end;
return v1;