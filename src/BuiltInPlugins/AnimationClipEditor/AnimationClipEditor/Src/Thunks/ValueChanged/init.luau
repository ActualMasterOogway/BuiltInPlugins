local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Thunks.AddKeyframe);
local v2 = require(l_script_FirstAncestor_0.Src.Thunks.SetKeyframeData);
local v3 = require(l_script_FirstAncestor_0.Src.Thunks.AddTrack);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
local v5 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Constants);
return function(v7, v8, v9, v10, v11, v12, v13) --[[ Line: 17 ]]
    -- upvalues: v5 (copy), v6 (copy), v3 (copy), v1 (copy), v2 (copy), v4 (copy)
    return function(v14) --[[ Line: 18 ]]
        -- upvalues: v5 (ref), v7 (copy), v8 (copy), v9 (copy), v6 (ref), v3 (ref), v10 (copy), v13 (copy), v12 (copy), v1 (ref), v11 (copy), v2 (ref), v4 (ref)
        local l_AnimationData_0 = v14:getState().AnimationData;
        local v16 = v5.getTrack(l_AnimationData_0, v7, v8);
        if v16 == nil then
            local v17 = v8[1];
            local v18 = if v9 == v6.TRACK_TYPES.Facs then v6.TRACK_TYPES.Facs else v6.TRACK_TYPES.CFrame;
            v14:dispatch(v3(v7, v17, v18, v10, nil, v13));
            local v19 = {
                Value = v12
            };
            if v5.isChannelAnimation(l_AnimationData_0) then
                v19.InterpolationMode = Enum.KeyInterpolationMode.Cubic;
            else
                v19.EasingStyle = Enum.PoseEasingStyle.Linear;
                v19.EasingDirection = Enum.PoseEasingDirection.In;
            end;
            v14:dispatch(v1(v7, v8, v9, v10, v11, v19, v13));
        else
            local l_Data_0 = v16.Data;
            if l_Data_0 and l_Data_0[v11] then
                v14:dispatch(v2(v7, v8, v11, {
                    Value = v12
                }));
            else
                local v21 = {
                    Value = v12
                };
                if v16.IsCurveTrack then
                    v21.InterpolationMode = Enum.KeyInterpolationMode.Cubic;
                else
                    v21.EasingStyle = Enum.PoseEasingStyle.Linear;
                    v21.EasingDirection = Enum.PoseEasingDirection.In;
                end;
                v14:dispatch(v1(v7, v8, v9, v10, v11, v21, v13));
            end;
        end;
        v14:dispatch(v4(v11));
    end;
end;