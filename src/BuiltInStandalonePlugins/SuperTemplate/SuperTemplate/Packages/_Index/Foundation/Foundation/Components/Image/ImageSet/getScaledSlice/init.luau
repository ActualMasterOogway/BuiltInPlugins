local l_Parent_0 = script:FindFirstAncestor("Foundation").Parent;
local v1 = require(l_Parent_0.FoundationImages);
return function(v2, v3) --[[ Line: 6 ]] --[[ Name: getScaledSlice ]]
    -- upvalues: v1 (copy)
    local v4 = v1.getResolutionScale();
    if v2 then
        local v5 = v2.Min * v4;
        local v6 = v2.Max * v4;
        v2 = Rect.new(v5, v6);
        v3 = (v3 or 1) / v4;
    end;
    return v2, v3;
end;