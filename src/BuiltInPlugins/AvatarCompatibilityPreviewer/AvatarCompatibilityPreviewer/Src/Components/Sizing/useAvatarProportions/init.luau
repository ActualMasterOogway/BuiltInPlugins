local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Util.AvatarScalingTypes);
return function(v4) --[[ Line: 13 ]] --[[ Name: useAvatarProportions ]]
    -- upvalues: v1 (copy), v3 (copy)
    return (v1.useMemo(function() --[[ Line: 14 ]]
        -- upvalues: v3 (ref), v4 (copy)
        local v5 = {};
        for _, v7 in v3.allAvatarPartScaleTypeValueObjects(v4.Avatar.WorldModel) do
            table.insert(v5, v7.Value);
        end;
        return v3.computeAvatarPartScaleType(v5);
    end, {
        v4.Avatar.WorldModel, 
        v4.Avatar.LatestWorldModelHash
    }));
end;