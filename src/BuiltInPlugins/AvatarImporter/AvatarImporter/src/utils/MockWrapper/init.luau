local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
return function(v3) --[[ Line: 6 ]] --[[ Name: MockWrapper ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_store_0 = v3.store;
    return v1.createElement(v2.StoreProvider, {
        store = l_store_0
    }, v3[v1.Children]);
end;