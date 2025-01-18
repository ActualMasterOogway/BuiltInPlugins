local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local function v5(v4) --[[ Line: 11 ]] --[[ Name: getAspectRatio ]]
    if typeof(v4) == "table" then
        return {
            AspectRatio = v4.AspectRatio, 
            AspectType = v4.AspectType, 
            DominantAxis = v4.DominantAxis
        };
    else
        return {
            AspectRatio = v4, 
            AspectType = nil, 
            DominantAxis = nil
        };
    end;
end;
return v2.memo(function(v6) --[[ Line: 36 ]] --[[ Name: AspectRatio ]]
    -- upvalues: v5 (copy), v2 (copy)
    local v7 = v5(v6.value);
    return v2.createElement("UIAspectRatioConstraint", v7);
end);