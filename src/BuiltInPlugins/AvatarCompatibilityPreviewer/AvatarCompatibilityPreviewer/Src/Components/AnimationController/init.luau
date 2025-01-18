local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Components.AnimationControllerDisplay);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useAnimationOnAnimateTarget);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v5) --[[ Line: 16 ]] --[[ Name: AnimationController ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    local v6, v7 = v1.useState(0);
    local v8, v9 = v1.useState(nil);
    local v10 = v3(v5.Dummy, v5.AnimationId, v7, v8);
    v1.useEffect(function() --[[ Line: 23 ]]
        -- upvalues: v7 (copy)
        v7(0);
    end, {
        v10
    });
    if v10 == nil then
        return nil;
    else
        return v1.createElement(v2, {
            AnimationPositionAlpha = v6, 
            Length = v10.Length, 
            ForcedPositionAlpha = v8, 
            SetForcedPositionAlpha = v9
        });
    end;
end;