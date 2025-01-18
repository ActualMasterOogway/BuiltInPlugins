local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local l_Math_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Math;
return function(v2, v3) --[[ Line: 8 ]]
    -- upvalues: l_Math_0 (copy)
    local v4 = {
        v2:GetComponents()
    };
    local v5 = {
        v3:GetComponents()
    };
    for v6 = 1, 12 do
        if not l_Math_0.fuzzyEq(v4[v6], v5[v6]) then
            return false;
        end;
    end;
    return true;
end;