local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v2 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v3 = require(l_script_FirstAncestor_0.Src.Thunks.AddKeyframe);
return function(v4, v5, v6, v7, v8, v9) --[[ Line: 14 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return function(v10) --[[ Line: 15 ]]
        -- upvalues: v4 (copy), v1 (ref), v5 (copy), v2 (ref), v8 (copy), v6 (copy), v3 (ref), v7 (copy), v9 (copy)
        local l_AnimationData_0 = v10:getState().AnimationData;
        if not l_AnimationData_0 or not l_AnimationData_0.Instances[v4] then
            return;
        else
            local v12 = v1.getTrack(l_AnimationData_0, v4, v5);
            local v13 = nil;
            local v14 = nil;
            local v15 = nil;
            if v12 then
                local v16, v17, v18 = v2.findNearestKeyframesProperly(v12.Keyframes, v8);
                v13 = v16;
                v14 = v17;
                v15 = v18;
                if v13 then
                    return;
                end;
            end;
            local v19 = nil;
            if not v12 or not v14 then
                v19 = {
                    Value = v2.getDefaultValue(v6), 
                    InterpolationMode = Enum.KeyInterpolationMode.Cubic
                };
            else
                local v20 = v2.getValue(v12, v8);
                local l_InterpolationMode_0 = v12.Data[v12.Keyframes[v14]].InterpolationMode;
                local v22 = nil;
                local v23 = nil;
                if l_InterpolationMode_0 == Enum.KeyInterpolationMode.Cubic then
                    local v24, v25 = v2.getSlopes(v12, v8);
                    v22 = v24;
                    v23 = v25;
                end;
                v19 = {
                    Value = v20, 
                    InterpolationMode = l_InterpolationMode_0, 
                    LeftSlope = v22, 
                    RightSlope = v23
                };
            end;
            v10:dispatch(v3(v4, v5, v6, v7, v8, v19, v9));
            return;
        end;
    end;
end;