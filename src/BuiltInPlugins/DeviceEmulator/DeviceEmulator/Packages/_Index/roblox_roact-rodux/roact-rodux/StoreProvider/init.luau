local v0 = require(script.Parent.Parent.Roact);
local v1 = require(script.Parent.storeKey);
local v2 = v0.Component:extend("StoreProvider");
v2.init = function(v3, v4) --[[ Line: 7 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    local l_store_0 = v4.store;
    if l_store_0 == nil then
        error("Error initializing StoreProvider. Expected a `store` prop to be a Rodux store.");
    end;
    v3._context[v1] = l_store_0;
end;
v2.render = function(v6) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: v0 (copy)
    return v0.oneChild(v6.props[v0.Children]);
end;
return v2;