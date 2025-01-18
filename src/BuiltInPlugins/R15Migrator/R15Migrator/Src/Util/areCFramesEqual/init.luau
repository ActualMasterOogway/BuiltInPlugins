local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_Math_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Math;
return function(v2, v3, v4) --[[ Line: 11 ]] --[[ Name: areCFramesEqual ]]
    -- upvalues: l_Math_0 (copy)
    local v5 = {
        v2:GetComponents()
    };
    local v6 = {
        v3:GetComponents()
    };
    for v7 = 1, 12 do
        if not l_Math_0.fuzzyEq(v5[v7], v6[v7], v4) then
            return false;
        end;
    end;
    return true;
end;