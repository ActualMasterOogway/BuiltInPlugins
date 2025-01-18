local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Components.Sizing.AvatarSizeSpecificationUtils);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Components.Sizing.useAvatarProportions);
local _ = require(l_script_FirstAncestor_0.Packages.UGCValidation);
return function(v6) --[[ Line: 21 ]] --[[ Name: useAvatarSizeState ]]
    -- upvalues: v4 (copy), v2 (copy), v1 (copy)
    local v7 = v4({
        Avatar = v6.Avatar
    });
    local v8 = v2.useMemo(function() --[[ Line: 26 ]]
        -- upvalues: v1 (ref), v7 (copy), v6 (copy)
        return v1.getBodyTypeSizeSpecification(v7, v6.Avatar.WorldModel);
    end, {
        v7, 
        v6.Avatar.WorldModel, 
        v6.Avatar.LatestWorldModelHash
    });
    local v9 = v2.useMemo(function() --[[ Line: 34 ]]
        -- upvalues: v6 (copy), v1 (ref)
        if v6.ValidationResults then
            return v1.computeInvalidBodyPartList(v6.Avatar.WorldModel, v6.ValidationResults);
        else
            return {};
        end;
    end, {
        v6.Avatar.WorldModel, 
        v6.Avatar.LatestWorldModelHash, 
        v6.Avatar.WorldModelScale, 
        v6.Avatar.ProportionalScale, 
        v6.ValidationResults
    });
    local v11 = v2.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v6 (copy), v1 (ref), v7 (copy), v8 (copy)
        if v6.ValidationResults then
            local v10 = v1.getAvatarSizeBoundsFromValidationResults(v6.ValidationResults, v7);
            if v10 then
                return v10;
            end;
        end;
        return v1.guessAvatarSizeBounds(v8);
    end, {
        v6.ValidationResults, 
        v7, 
        v8
    });
    return (v2.useMemo(function() --[[ Line: 67 ]]
        -- upvalues: v11 (copy), v9 (copy)
        return {
            sizeBounds = v11, 
            invalidBodyParts = v9 or {}
        };
    end, {
        v11, 
        v9
    }));
end;