local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v2 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationData);
return function(v4) --[[ Line: 12 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return function(v5) --[[ Line: 13 ]]
        -- upvalues: v1 (ref), v2 (ref), v3 (ref), v4 (copy)
        local l_AnimationData_0 = v5:getState().AnimationData;
        if not l_AnimationData_0 then
            return;
        else
            local v7 = v1(l_AnimationData_0);
            local l_Looping_0 = v7.Metadata.Looping;
            v2.setLooping(v7, not l_Looping_0);
            v5:dispatch(v3(v7));
            v4:report("onControlPressed", "ToggleLooping");
            return;
        end;
    end;
end;