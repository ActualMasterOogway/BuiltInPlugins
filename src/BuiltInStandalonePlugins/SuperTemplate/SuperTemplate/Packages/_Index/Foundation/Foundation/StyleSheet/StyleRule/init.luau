local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.React);
return v1.memo(function(v2) --[[ Line: 12 ]] --[[ Name: StyleRule ]]
    -- upvalues: v1 (copy)
    local v4 = v1.useCallback(function(v3) --[[ Line: 13 ]]
        -- upvalues: v2 (copy)
        if v3 ~= nil then
            v3:SetProperties(v2.properties);
        end;
    end, {
        v2.properties
    });
    return v1.createElement("StyleRule", {
        Selector = v2.Selector, 
        ref = v4
    });
end);