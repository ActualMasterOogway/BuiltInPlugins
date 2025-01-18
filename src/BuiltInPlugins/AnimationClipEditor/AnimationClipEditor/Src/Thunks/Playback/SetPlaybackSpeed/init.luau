local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetPlaybackSpeed);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetPlaybackStartInfo);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
return function(v4) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    return function(v5) --[[ Line: 11 ]]
        -- upvalues: v1 (ref), v4 (copy), v3 (ref), v2 (ref)
        local l_AnimationData_0 = v5:getState().AnimationData;
        v5:dispatch(v1(v4));
        if l_AnimationData_0 and l_AnimationData_0.Metadata and l_AnimationData_0.Metadata.EndTick > 0 and v5:getState().Status.PlayState ~= v3.PLAY_STATE.Pause then
            local v7 = {
                startTime = tick(), 
                startPlayhead = v5:getState().Status.Playhead
            };
            v5:dispatch(v2(v7));
        end;
    end;
end;