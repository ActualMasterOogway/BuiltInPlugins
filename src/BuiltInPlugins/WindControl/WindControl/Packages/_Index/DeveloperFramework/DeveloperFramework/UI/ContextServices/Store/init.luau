local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Parent.RoactRodux);
local v3 = require(l_Parent_0.UI.ContextServices.ContextItem):extend("Store");
v3.new = function(v4) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy)
    assert(v4, "Store.new: Expected a Rodux store.");
    local v5 = {
        store = v4
    };
    setmetatable(v5, v3);
    return v5;
end;
v3.getProvider = function(v6, v7) --[[ Line: 29 ]] --[[ Name: getProvider ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2.StoreProvider, {
        store = v6.store
    }, v7);
end;
return v3;