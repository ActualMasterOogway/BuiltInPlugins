local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_ContextItem_0 = require(l_Parent_1.Framework).ContextServices.ContextItem;
local l_Core_0 = l_Parent_0.Core;
local v4 = require(l_Core_0.InsertAssetController);
local v5 = l_ContextItem_0:extend("InsertAssetContext");
v5.new = function(v6) --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v5 (copy)
    assert(v6, "InsertAssetContext.new expects a plugin");
    return (setmetatable({
        _controller = v4.new(v6)
    }, v5));
end;
v5.get = function(v7) --[[ Line: 22 ]] --[[ Name: get ]]
    return v7._controller;
end;
v5.destroy = function(_) --[[ Line: 26 ]] --[[ Name: destroy ]]

end;
v5.mock = function() --[[ Line: 28 ]] --[[ Name: mock ]]
    return {};
end;
return v5;