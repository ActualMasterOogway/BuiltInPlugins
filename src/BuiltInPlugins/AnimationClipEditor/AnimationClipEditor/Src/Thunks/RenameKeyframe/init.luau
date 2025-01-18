local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v2 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v3 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
return function(v4, v5, v6) --[[ Line: 12 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return function(v7) --[[ Line: 13 ]]
        -- upvalues: v1 (ref), v2 (ref), v4 (copy), v5 (copy), v3 (ref), v6 (copy)
        local l_AnimationData_0 = v7:getState().AnimationData;
        if not l_AnimationData_0 then
            return;
        else
            local v9 = v1(l_AnimationData_0);
            v2.setKeyframeName(v9, v4, v5);
            v7:dispatch(v3(v9));
            v6:report("onRenameKeyframe", v5, if v9.Metadata then v9.Metadata.Guid else nil);
            return;
        end;
    end;
end;