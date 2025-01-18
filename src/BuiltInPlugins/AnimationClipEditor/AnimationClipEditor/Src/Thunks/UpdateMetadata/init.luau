local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationData);
return function(v3) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v4) --[[ Line: 12 ]]
        -- upvalues: v1 (ref), v3 (copy), v2 (ref)
        local l_AnimationData_0 = v4:getState().AnimationData;
        if not l_AnimationData_0 or not l_AnimationData_0.Metadata then
            return;
        else
            local v6 = v1.Dictionary.join(l_AnimationData_0, {
                Metadata = v1.Dictionary.join(l_AnimationData_0.Metadata, v3)
            });
            v4:dispatch(v2(v6));
            return;
        end;
    end;
end;