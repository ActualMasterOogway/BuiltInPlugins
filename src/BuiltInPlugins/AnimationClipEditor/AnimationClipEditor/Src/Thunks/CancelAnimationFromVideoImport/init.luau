local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetCreatingAnimationFromVideo);
return function(v2) --[[ Line: 11 ]]
    -- upvalues: v1 (copy)
    return function(v3) --[[ Line: 12 ]]
        -- upvalues: v1 (ref), v2 (copy)
        v3:dispatch(v1(false));
        local v4 = v3:getState();
        if not v4.Status.AnimationFromVideoErroredOut then
            local l_AnimationFromVideoUploadStartTime_0 = v4.Status.AnimationFromVideoUploadStartTime;
            local v6 = l_AnimationFromVideoUploadStartTime_0 and os.clock() - l_AnimationFromVideoUploadStartTime_0;
            v2:report("onAnimationEditorImportVideoUploadCancel", v6);
        end;
    end;
end;