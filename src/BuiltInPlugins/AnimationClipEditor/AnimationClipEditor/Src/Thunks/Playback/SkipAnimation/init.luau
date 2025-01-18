local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v2 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
return function(v3, v4) --[[ Line: 10 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v5) --[[ Line: 11 ]]
        -- upvalues: v3 (copy), v1 (ref), v2 (ref), v4 (copy)
        local v6 = v5:getState();
        local l_AnimationData_0 = v6.AnimationData;
        local l_Tracks_0 = v6.Status.Tracks;
        local l_Playhead_0 = v6.Status.Playhead;
        if not l_AnimationData_0 or not l_AnimationData_0.Metadata or not l_Tracks_0 then
            return;
        else
            local l_StartTick_0 = l_AnimationData_0.Metadata.StartTick;
            if l_AnimationData_0.Metadata.EndTick - l_StartTick_0 == 0 then
                return;
            else
                local v11 = nil;
                local v12 = {};
                for _, v14 in ipairs(l_Tracks_0) do
                    local v15 = l_AnimationData_0.Instances[v14.Instance];
                    if v15 and v15.Tracks[v14.Name] then
                        v12[v14.Name] = v15.Tracks[v14.Name];
                    end;
                end;
                v11 = if v3 then v1.getNextKeyframe(v12, l_Playhead_0) else v1.getPreviousKeyframe(v12, l_Playhead_0);
                v5:dispatch(v2(v11));
                if v3 then
                    v4:report("onControlPressed", "SkipForward");
                    return;
                else
                    v4:report("onControlPressed", "SkipBackward");
                    return;
                end;
            end;
        end;
    end;
end;