local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v3 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.SnapToNearestFrame);
local v6 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
return function(v7, v8) --[[ Line: 16 ]]
    -- upvalues: v1 (copy), v6 (copy), v3 (copy), v2 (copy), v4 (copy), v5 (copy)
    return function(v9) --[[ Line: 17 ]]
        -- upvalues: v1 (ref), v6 (ref), v7 (copy), v3 (ref), v8 (copy), v2 (ref), v4 (ref), v5 (ref)
        local v10 = v9:getState();
        local l_AnimationData_0 = v10.AnimationData;
        if not l_AnimationData_0 then
            return;
        else
            local l_Instances_0 = l_AnimationData_0.Instances;
            if not l_Instances_0 then
                return;
            else
                local l_Root_0 = l_Instances_0.Root;
                if not l_Root_0 then
                    return;
                else
                    local v14 = nil;
                    if v10.Status.EditorMode == v1.EDITOR_MODE.CurveCanvas then
                        v14 = {};
                        local l_ipairs_0 = ipairs;
                        local v16 = v10.Status.SelectedTracks or {};
                        for _, v18 in l_ipairs_0(v16) do
                            table.insert(v14, v6.getTrack(l_AnimationData_0, "Root", v18));
                        end;
                    else
                        v14 = l_Root_0.Tracks;
                    end;
                    local v19 = false;
                    local l_v7_0 = v7;
                    if v14 then
                        local l_HorizontalScroll_0 = v10.Status.HorizontalScroll;
                        local l_HorizontalZoom_0 = v10.Status.HorizontalZoom;
                        local l_EditingLength_0 = v10.Status.EditingLength;
                        local v24 = v3.getZoomRange(l_AnimationData_0, l_HorizontalScroll_0, l_HorizontalZoom_0, l_EditingLength_0);
                        local v25 = v3.getScaledKeyframePosition(v7, v24.Start, v24.End, v8);
                        local v26 = v24.End + 1;
                        do
                            local l_v26_0 = v26;
                            for _, v29 in pairs(v14) do
                                v3.traverseTracks(nil, v29, function(v30) --[[ Line: 57 ]]
                                    -- upvalues: v2 (ref), v7 (ref), l_v26_0 (ref)
                                    if v30.Keyframes and #v30.Keyframes > 0 then
                                        local v31, v32 = v2.findNearestKeyframes(v30.Keyframes, v7);
                                        if math.abs(v30.Keyframes[v31] - v7) < math.abs(v7 - l_v26_0) then
                                            l_v26_0 = v30.Keyframes[v31];
                                        end;
                                        if v32 and math.abs(v30.Keyframes[v32] - v7) < math.abs(v7 - l_v26_0) then
                                            l_v26_0 = v30.Keyframes[v32];
                                        end;
                                    end;
                                end, true);
                            end;
                            if v24.Start <= l_v26_0 and l_v26_0 <= v24.End and math.abs(v3.getScaledKeyframePosition(l_v26_0, v24.Start, v24.End, v8) - v25) < v1.SNAP_TO_KEYFRAME_THRESHOLD then
                                l_v7_0 = l_v26_0;
                                v19 = true;
                            end;
                        end;
                    end;
                    if v19 then
                        v9:dispatch(v4(l_v7_0));
                        return;
                    else
                        v9:dispatch(v5(v7));
                        return;
                    end;
                end;
            end;
        end;
    end;
end;