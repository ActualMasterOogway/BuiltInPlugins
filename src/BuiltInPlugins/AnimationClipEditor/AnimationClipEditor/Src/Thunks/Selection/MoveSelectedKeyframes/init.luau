local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v3 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v4 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v7 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v8 = require(l_script_FirstAncestor_0.Src.Util.SelectionUtils);
return function(v9, v10, v11, v12, v13) --[[ Line: 25 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy), v8 (copy), v6 (copy), v7 (copy), v5 (copy), v4 (copy)
    return function(v14) --[[ Line: 26 ]]
        -- upvalues: v13 (copy), v1 (ref), v2 (ref), v10 (copy), v9 (copy), v3 (ref), v8 (ref), v6 (ref), v7 (ref), v11 (copy), v12 (ref), v5 (ref), v4 (ref)
        local v15 = v14:getState();
        local v16 = v13 and v13.selectedKeyframes or v15.Status.SelectedKeyframes;
        local v17 = v13 and v13.animationData or v15.AnimationData;
        local l_FrameRate_0 = v15.Status.FrameRate;
        local l_SnapMode_0 = v15.Status.SnapMode;
        if not v17 or not v16 then
            return;
        else
            local v20 = v1.Dictionary.join({}, v17);
            v20.Instances = v1.Dictionary.join({}, v20.Instances);
            v20.Events = v2(v20.Events);
            local v21 = v9 < v10;
            local v22, v23 = v3.getSelectionBounds(v20, v16);
            local v24 = v2(v16);
            for v25, v26 in pairs(v24) do
                v20.Instances[v25] = v1.Dictionary.join({}, v20.Instances[v25]);
                v20.Instances[v25].Tracks = v1.Dictionary.join({}, v20.Instances[v25].Tracks);
                local v27 = v20.Instances[v25];
                for v28, v29 in pairs(v26) do
                    v27.Tracks[v28] = v2(v27.Tracks[v28]);
                    local v30 = v27.Tracks[v28];
                    v8.traverse(v29, v30, function(v31, v32) --[[ Line: 61 ]]
                        -- upvalues: v1 (ref), v21 (copy), v10 (ref), v9 (ref), l_SnapMode_0 (copy), v6 (ref), v7 (ref), l_FrameRate_0 (copy), v22 (copy), v23 (copy), v3 (ref), v20 (copy), v11 (ref), v12 (ref)
                        if not v31.Selection then
                            return;
                        else
                            local v33 = v1.Dictionary.keys(v31.Selection);
                            table.sort(v33);
                            local v34 = nil;
                            local v35 = nil;
                            local v36 = nil;
                            if v21 then
                                v34 = #v33;
                                v35 = 1;
                                v36 = -1;
                            else
                                v34 = 1;
                                v35 = #v33;
                                v36 = 1;
                            end;
                            for v37 = v34, v35, v36 do
                                local v38 = v33[v37];
                                local v39 = v10 + (v38 - v9);
                                if l_SnapMode_0 ~= v6.SNAP_MODES.None then
                                    v39 = v7.getNearestFrame(v39, l_FrameRate_0);
                                end;
                                v39 = math.clamp(v39, v38 - v22, v6.MAX_ANIMATION_LENGTH - (v23 - v38));
                                if v32.Keyframes then
                                    v3.moveKeyframe(v32, v38, v39);
                                    v3.moveNamedKeyframe(v20, v38, v39);
                                    if v32.Type ~= v6.TRACK_TYPES.Quaternion and v32.Data and v32.Data[v39] and v11 and v12 then
                                        if v32.Type == v6.TRACK_TYPES.Facs then
                                            v12 = math.clamp(v12, 0, 1);
                                        end;
                                        v3.setKeyframeData(v32, v39, {
                                            Value = v32.Data[v39].Value - v11 + v12
                                        });
                                    end;
                                end;
                                v31.Selection[v38] = nil;
                                v31.Selection[v39] = true;
                            end;
                            return;
                        end;
                    end);
                end;
            end;
            v14:dispatch(v5(v20));
            v14:dispatch(v4(v24));
            return;
        end;
    end;
end;