local l_Parent_0 = script.Parent.Parent.Parent;
local l_ContextItem_0 = require(l_Parent_0.Packages.Framework).ContextServices.ContextItem;
local v2 = require(l_Parent_0.Src.Networking.NetworkingImpl);
local v3 = l_ContextItem_0:extend(script.Name);
v3.new = function(...) --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v3 (copy)
    return (setmetatable({
        impl = v2.new(...)
    }, v3));
end;
v3.get = function(v4) --[[ Line: 23 ]] --[[ Name: get ]]
    return v4.impl;
end;
return v3;