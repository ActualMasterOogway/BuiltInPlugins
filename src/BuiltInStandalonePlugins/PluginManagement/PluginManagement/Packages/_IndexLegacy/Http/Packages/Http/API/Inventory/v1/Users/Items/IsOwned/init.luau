local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.BaseUrl);
return function(v2) --[[ Line: 16 ]]
    -- upvalues: v1 (copy)
    return function(v3, v4, v5) --[[ Line: 20 ]]
        -- upvalues: v1 (ref), v2 (copy)
        assert(v3 > 0, "Expected userId to be a positive number.");
        assert(tonumber(v5) or false, "Expected itemTargetId to be a positive number.");
        local v6 = string.format("%sv1/users/%d/items/%s/%s/is-owned", v1.INVENTORY_URL, v3, v4.Name, v5);
        local v7 = v2:get(v6);
        return v2:handleRetry(v7);
    end;
end;