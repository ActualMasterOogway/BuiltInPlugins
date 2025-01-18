local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactUtils");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.useEventConnection);
return function(v3) --[[ Line: 8 ]] --[[ Name: useSelection ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = v3 or game:GetService("Selection");
    local v5, v6 = v1.useState(function() --[[ Line: 11 ]]
        -- upvalues: v4 (copy)
        return v4:Get();
    end);
    v2(v4.SelectionChanged, function() --[[ Line: 15 ]]
        -- upvalues: v6 (copy), v4 (copy)
        v6(v4:Get());
    end, {});
    return v5;
end;