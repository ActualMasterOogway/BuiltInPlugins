local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetIKEnabled);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetIKOpenedTimestamp);
return function(v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v4) --[[ Line: 6 ]]
        -- upvalues: v1 (ref), v3 (copy), v2 (ref)
        local v5 = v4:getState();
        local l_AnimationData_0 = v5.AnimationData;
        if not v5.Status.RootInstance then
            return;
        else
            local v7 = not v5.Status.IKEnabled;
            v4:dispatch(v1(v7));
            local v8 = if l_AnimationData_0 and l_AnimationData_0.Metadata then l_AnimationData_0.Metadata.Guid else nil;
            if v7 then
                v3:report("onIkEnabled", v8);
                v4:dispatch(v2(os.time()));
                return;
            else
                v3:report("onIkDisabled", os.time() - v5.Status.IKOpenedTimestamp, v8);
                return;
            end;
        end;
    end;
end;