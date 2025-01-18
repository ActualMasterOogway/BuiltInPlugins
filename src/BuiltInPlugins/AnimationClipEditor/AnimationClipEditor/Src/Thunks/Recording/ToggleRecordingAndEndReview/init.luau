local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Thunks.Recording.SetFacialRecordingMode);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetInReviewState);
return function(v3) --[[ Line: 6 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v4) --[[ Line: 7 ]]
        -- upvalues: v2 (ref), v1 (ref), v3 (copy)
        if v4:getState().Status.inReviewState then
            v4:dispatch(v2(false));
            v4:dispatch(v1(false));
            return;
        else
            v3:report("onFacialAnimationRecordingEnabled");
            v4:dispatch(v1(true));
            return;
        end;
    end;
end;