local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationData);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetHaveToSetBackToNotLooping);
local v3 = require(l_script_FirstAncestor_0.Src.Actions.SetInReviewState);
local v4 = require(l_script_FirstAncestor_0.Src.Actions.SetPast);
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local v6 = require(l_script_FirstAncestor_0.Src.Thunks.LoadAnimationData);
local v7 = require(l_script_FirstAncestor_0.Src.Thunks.MergeBodyAndFacialAnimation);
local v8 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v9 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
return function(v11, v12, v13) --[[ Line: 22 ]]
    -- upvalues: v8 (copy), v9 (copy), v7 (copy), v5 (copy), v6 (copy), v4 (copy), v3 (copy), v1 (copy), v2 (copy)
    return function(v14) --[[ Line: 23 ]]
        -- upvalues: v11 (copy), v8 (ref), v12 (copy), v9 (ref), v7 (ref), v13 (copy), v5 (ref), v6 (ref), v4 (ref), v3 (ref), v1 (ref), v2 (ref)
        local v15 = v11.Localization:getText("FaceCapture", "DefaultFaceRecordingName");
        local v16 = v8.newRigAnimation(v15);
        for _, v18 in pairs(v16.Instances) do
            local l_Tracks_0 = v18.Tracks;
            for v20, v21 in pairs(v12) do
                for v22, v23 in pairs(v21) do
                    local v24 = l_Tracks_0[v22];
                    if v24 == nil then
                        v24 = if v22 == "Head" then v8.addTrack(l_Tracks_0, v22, v9.TRACK_TYPES.CFrame, false, v9.TRACK_TYPES.Quaternion) else v8.addTrack(l_Tracks_0, v22, v9.TRACK_TYPES.Facs, false, v9.TRACK_TYPES.Quaternion);
                    end;
                    v8.addKeyframe(v24, v20, {
                        Value = v23, 
                        EasingStyle = Enum.PoseEasingStyle.Linear, 
                        EasingDirection = Enum.PoseEasingDirection.In
                    });
                end;
            end;
        end;
        v8.clearTrackSequences(v16);
        if v14:getState().AnimationData then
            v14:dispatch(v7(v16, v9.TRACKS_SUBSETS_TYPE.Face, v13));
        else
            v14:dispatch(v5());
            local l_Past_0 = v14:getState().History.Past;
            v14:dispatch(v6(v16, v13));
            v14:dispatch(v4(l_Past_0));
        end;
        v14:dispatch(v3(true));
        local l_AnimationData_0 = v14:getState().AnimationData;
        if not l_AnimationData_0.Metadata.Looping then
            v8.setLooping(l_AnimationData_0, true);
            v14:dispatch(v1(l_AnimationData_0));
            v14:dispatch(v2(true));
        end;
    end;
end;