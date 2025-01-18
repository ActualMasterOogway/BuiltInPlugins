local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local l_ContextItem_0 = require(l_Parent_1.Packages.Framework).ContextServices.ContextItem;
local v3 = require(l_Parent_0.Controllers.WorldRootPhysicsController);
local v4 = l_ContextItem_0:extend(script.Name);
v4.new = function(...) --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v4 (copy)
    local v5 = {
        impl = v3.new(...)
    };
    setmetatable(v5, v4);
    return v5;
end;
v4.get = function(v6) --[[ Line: 24 ]] --[[ Name: get ]]
    return v6.impl;
end;
return v4;