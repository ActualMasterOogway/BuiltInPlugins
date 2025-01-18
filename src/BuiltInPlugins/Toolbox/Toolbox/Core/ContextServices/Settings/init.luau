local l_Packages_0 = script.Parent.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Framework).ContextServices.ContextItem:extend("Settings");
v1.new = function(v2) --[[ Line: 7 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v3 = {
        settings = v2
    };
    setmetatable(v3, v1);
    return v3;
end;
v1.get = function(v4) --[[ Line: 16 ]] --[[ Name: get ]]
    return v4.settings;
end;
return v1;