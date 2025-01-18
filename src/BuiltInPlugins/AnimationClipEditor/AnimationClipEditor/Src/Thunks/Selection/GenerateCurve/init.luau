local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v3 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v4 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v6 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local v7 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v8 = require(l_script_FirstAncestor_0.Src.Util.SelectionUtils);
local v9 = require(l_script_FirstAncestor_0.Src.Util.CurveUtils);
return function(v10, v11) --[[ Line: 21 ]]
    -- upvalues: v1 (copy), v2 (copy), v4 (copy), v8 (copy), v3 (copy), v7 (copy), v9 (copy), v6 (copy), v5 (copy)
    return function(v12) --[[ Line: 22 ]]
        -- upvalues: v1 (ref), v2 (ref), v4 (ref), v8 (ref), v3 (ref), v7 (ref), v9 (ref), v10 (copy), v11 (copy), v6 (ref), v5 (ref)
        local v13 = v12:getState();
        local l_SelectedKeyframes_0 = v13.Status.SelectedKeyframes;
        local l_AnimationData_0 = v13.AnimationData;
        if not l_AnimationData_0 or not l_SelectedKeyframes_0 then
            return;
        else
            local v16 = v1.Dictionary.join({}, l_AnimationData_0);
            v16.Instances = v1.Dictionary.join({}, v16.Instances);
            v16.Events = v2(v16.Events);
            local v17, v18 = v4.getSelectionBounds(l_AnimationData_0, l_SelectedKeyframes_0);
            local v19 = v2(l_SelectedKeyframes_0);
            for v20, v21 in pairs(v19) do
                v16.Instances[v20] = v1.Dictionary.join({}, v16.Instances[v20]);
                v16.Instances[v20].Tracks = v1.Dictionary.join({}, v16.Instances[v20].Tracks);
                local v22 = v16.Instances[v20];
                for v23, v24 in pairs(v21) do
                    v22.Tracks[v23] = v2(v22.Tracks[v23]);
                    local v25 = v22.Tracks[v23];
                    v8.traverse(v24, v25, function(v26, v27) --[[ Line: 48 ]]
                        -- upvalues: v3 (ref), v17 (copy), v7 (ref), v4 (ref), v18 (copy), v9 (ref), v10 (ref), v11 (ref), v1 (ref)
                        if not v26.Selection or not v27.Keyframes or v3(v27.Keyframes) or not v27.Data then
                            return;
                        else
                            if not v27.Data[v17] then
                                local v28 = v7.getSlopes(v27, v17);
                                local v29 = {
                                    Value = v7.getValue(v27, v17), 
                                    LeftSlope = v28
                                };
                                v4.addKeyframe(v27, v17, v29);
                            end;
                            if not v27.Data[v18] then
                                local _, v31 = v7.getSlopes(v27, v18);
                                local _, v33 = v7.findNearestKeyframesProperly(v27.Keyframes, v18);
                                local v34 = if v33 then v27.Data[v27.Keyframes[v33]].InterpolationMode else Enum.KeyInterpolationMode.Cubic;
                                local v35 = {
                                    Value = v7.getValue(v27, v18), 
                                    RightSlope = v31, 
                                    InterpolationMode = v34
                                };
                                v4.addKeyframe(v27, v18, v35);
                            end;
                            for _, v37 in ipairs(v27.Keyframes) do
                                if v17 < v37 and v37 < v18 then
                                    v27.Data[v37] = nil;
                                end;
                            end;
                            local v38 = v9.generateCurve(v27.Type, v10, v11, v17, v27.Data[v17], v18, v27.Data[v18]);
                            if v38 and not v3(v38) then
                                v27.Keyframes = v1.List.join(v1.Dictionary.keys(v27.Data), v1.Dictionary.keys(v38));
                                table.sort(v27.Keyframes);
                                v27.Data = v1.Dictionary.join(v27.Data, v38);
                            end;
                            return;
                        end;
                    end);
                end;
            end;
            v12:dispatch(v6(v16));
            v12:dispatch(v5({}));
            return;
        end;
    end;
end;