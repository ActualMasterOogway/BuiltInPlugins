local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
local v2 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
return function(v3) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v4) --[[ Line: 10 ]]
        -- upvalues: v2 (ref), v3 (copy), v1 (ref)
        local l_FrameRate_0 = v4:getState().Status.FrameRate;
        local v6 = v2.getNearestFrame(v3, l_FrameRate_0);
        v4:dispatch(v1(v6));
    end;
end;