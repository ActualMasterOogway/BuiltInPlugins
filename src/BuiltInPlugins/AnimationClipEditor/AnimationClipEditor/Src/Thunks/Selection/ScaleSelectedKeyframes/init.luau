local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v5 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v6 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v7 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local v8 = require(l_script_FirstAncestor_0.Src.Util.SelectionUtils);
local function _(v9) --[[ Line: 35 ]] --[[ Name: roundToInt ]]
    return (math.floor(v9 + 0.5));
end;
return function(v11, v12, v13) --[[ Line: 39 ]]
    -- upvalues: v1 (copy), v2 (copy), v8 (copy), v3 (copy), v4 (copy), v5 (copy), v7 (copy), v6 (copy)
    return function(v14) --[[ Line: 40 ]]
        -- upvalues: v13 (copy), v1 (ref), v2 (ref), v8 (ref), v12 (copy), v11 (copy), v3 (ref), v4 (ref), v5 (ref), v7 (ref), v6 (ref)
        local v15 = v14:getState();
        local l_FrameRate_0 = v15.Status.FrameRate;
        local l_SnapMode_0 = v15.Status.SnapMode;
        local v18 = v13 and v13.selectedKeyframes or v15.Status.SelectedKeyframes;
        local v19 = v13 and v13.animationData or v15.AnimationData;
        if not v19 or not v18 then
            return;
        else
            local v20 = v1.Dictionary.join({}, v19);
            v20.Instances = v1.Dictionary.join({}, v20.Instances);
            v20.Events = v2(v20.Events);
            local v21 = v2(v18);
            for v22, v23 in pairs(v21) do
                v20.Instances[v22] = v1.Dictionary.join({}, v20.Instances[v22]);
                v20.Instances[v22].Tracks = v1.Dictionary.join({}, v20.Instances[v22].Tracks);
                local v24 = v20.Instances[v22];
                for v25, v26 in pairs(v23) do
                    v24.Tracks[v25] = v2(v24.Tracks[v25]);
                    local v27 = v24.Tracks[v25];
                    v8.traverse(v26, v27, function(v28, v29) --[[ Line: 70 ]]
                        -- upvalues: v1 (ref), v12 (ref), v11 (ref), l_SnapMode_0 (copy), v3 (ref), v4 (ref), l_FrameRate_0 (copy), v5 (ref), v20 (copy)
                        local v30 = false;
                        if not v28.Selection or not next(v28.Selection) then
                            return;
                        else
                            local v31 = v1.Dictionary.keys(v28.Selection);
                            table.sort(v31);
                            if v12 > 1 then
                                local function v35(v32, v33) --[[ Line: 78 ]] --[[ Name: scaleKeyframe ]]
                                    -- upvalues: v11 (ref), v12 (ref), l_SnapMode_0 (ref), v3 (ref), v4 (ref), l_FrameRate_0 (ref), v29 (copy), v5 (ref), v20 (ref), v28 (copy)
                                    local v34 = math.floor(v11 + (v32 - v11) * v12 + 0.5);
                                    if l_SnapMode_0 ~= v3.SNAP_MODES.None then
                                        v34 = v4.getNearestFrame(v34, l_FrameRate_0);
                                    end;
                                    v34 = math.clamp(v34, 0, v3.MAX_ANIMATION_LENGTH);
                                    if v34 * v33 >= v11 * v33 then
                                        return true;
                                    else
                                        if v29.Keyframes then
                                            v5.moveKeyframe(v29, v32, v34);
                                            v5.moveNamedKeyframe(v20, v32, v34);
                                        end;
                                        v28.Selection[v32] = nil;
                                        v28.Selection[v34] = true;
                                        return false;
                                    end;
                                end;
                                for v36 = 1, #v31 do
                                    if v35(v31[v36], 1) then
                                        break;
                                    end;
                                end;
                                for v37 = #v31, 1, -1 do
                                    v30 = v35(v31[v37], -1);
                                    if v30 then
                                        break;
                                    end;
                                end;
                                if not v30 then
                                    return;
                                end;
                            else
                                local v38, v39 = v4.findNearestKeyframes(v31, v11);
                                if v39 == nil then
                                    v39 = v38 + 1;
                                end;
                                local function v42(v40) --[[ Line: 123 ]] --[[ Name: scaleKeyframe ]]
                                    -- upvalues: v11 (ref), v12 (ref), l_SnapMode_0 (ref), v3 (ref), v4 (ref), l_FrameRate_0 (ref), v29 (copy), v5 (ref), v20 (ref), v28 (copy)
                                    local v41 = math.floor(v11 + (v40 - v11) * v12 + 0.5);
                                    if l_SnapMode_0 ~= v3.SNAP_MODES.None then
                                        v41 = v4.getNearestFrame(v41, l_FrameRate_0);
                                    end;
                                    v41 = math.clamp(v41, 0, v3.MAX_ANIMATION_LENGTH);
                                    if v29.Keyframes then
                                        v5.moveKeyframe(v29, v40, v41);
                                        v5.moveNamedKeyframe(v20, v40, v41);
                                    end;
                                    v28.Selection[v40] = nil;
                                    v28.Selection[v41] = true;
                                end;
                                for v43 = v38, 1, -1 do
                                    v42(v31[v43]);
                                end;
                                for v44 = v39, #v31 do
                                    v42(v31[v44]);
                                end;
                            end;
                            v30 = false;
                            return;
                        end;
                    end);
                end;
            end;
            v14:dispatch(v7(v20));
            v14:dispatch(v6(v21));
            return;
        end;
    end;
end;