local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v3) --[[ Line: 11 ]] --[[ Name: useResetAvatarValuesToScale ]]
    -- upvalues: v1 (copy)
    local v4 = v1.useMemo(function() --[[ Line: 12 ]]
        -- upvalues: v3 (copy)
        return v3.Avatar.WorldModel:FindFirstChildOfClass("Humanoid");
    end, {
        v3.Avatar.WorldModel, 
        v3.Avatar.LatestWorldModelHash
    });
    v1.useEffect(function() --[[ Line: 17 ]]
        -- upvalues: v3 (copy), v4 (copy)
        if v3.Enabled then
            v4.WalkSpeed = 16;
            v4.JumpPower = 50;
            v4.JumpHeight = 7.2;
            v4.NameDisplayDistance = 100;
            v4.HealthDisplayDistance = 100;
            return;
        else
            v4.WalkSpeed = 16 * v3.Avatar.WorldModelScale;
            v4.JumpPower = 50 * math.sqrt(v3.Avatar.WorldModelScale);
            v4.JumpHeight = 7.2 * v3.Avatar.WorldModelScale;
            v4.NameDisplayDistance = 100 * v3.Avatar.WorldModelScale;
            v4.HealthDisplayDistance = 100 * v3.Avatar.WorldModelScale;
            return;
        end;
    end, {
        v3.Enabled, 
        v3.Avatar.WorldModel, 
        v3.Avatar.LatestWorldModelHash, 
        v3.Avatar.WorldModelScale, 
        v4
    });
end;