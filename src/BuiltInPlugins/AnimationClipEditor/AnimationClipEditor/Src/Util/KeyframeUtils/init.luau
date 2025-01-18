local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_TweenService_0 = game:GetService("TweenService");
local v5 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagFacialAnimationRecordingInStudio);
local v37 = {
    getDefaultValue = function(v6) --[[ Line: 18 ]] --[[ Name: getDefaultValue ]]
        -- upvalues: v1 (copy)
        if v6 == v1.TRACK_TYPES.CFrame or v6 == v1.TRACK_TYPES.Quaternion then
            return CFrame.new();
        elseif v6 == v1.TRACK_TYPES.Position or v6 == v1.TRACK_TYPES.EulerAngles then
            return (Vector3.new());
        elseif v6 == v1.TRACK_TYPES.Number or v6 == v1.TRACK_TYPES.Angle or v6 == v1.TRACK_TYPES.Facs then
            return 0;
        else
            assert(false, "Unknown track type");
            return 0;
        end;
    end, 
    findNearestKeyframes = function(v7, v8) --[[ Line: 45 ]] --[[ Name: findNearestKeyframes ]]
        if v7 == nil or #v7 == 0 then
            return nil, nil;
        else
            local v9 = 1;
            local v10 = #v7;
            if v8 < v7[v9] then
                return v9, nil;
            elseif v7[v10] < v8 then
                return v10, nil;
            else
                local v11 = nil;
                while true do
                    if v9 <= v10 then
                        v11 = math.floor((v10 + v9) / 2);
                        local v12 = v7[v11];
                        if v8 == v12 then
                            return v11, nil;
                        elseif v12 < v8 then
                            v9 = v11 + 1;
                        elseif v8 < v12 then
                            v10 = v11 - 1;
                        end;
                    elseif v8 < v7[v11] then
                        return v11 - 1, v11;
                    else
                        return v11, v11 + 1;
                    end;
                end;
            end;
        end;
    end, 
    findNearestKeyframesProperly = function(v13, v14) --[[ Line: 83 ]] --[[ Name: findNearestKeyframesProperly ]]
        if v13 == nil or #v13 == 0 then
            return nil, nil, nil;
        else
            local v15 = 1;
            local v16 = #v13;
            if v14 < v13[v15] then
                return nil, nil, v15;
            elseif v13[v16] < v14 then
                return nil, v16, nil;
            else
                local v17 = nil;
                while true do
                    if v15 <= v16 then
                        v17 = math.floor((v16 + v15) / 2);
                        local v18 = v13[v17];
                        if v14 == v18 then
                            return v17, nil, nil;
                        elseif v18 < v14 then
                            v15 = v17 + 1;
                        elseif v14 < v18 then
                            v16 = v17 - 1;
                        end;
                    elseif v14 < v13[v17] then
                        return nil, v17 - 1, v17;
                    else
                        return nil, v17, v17 + 1;
                    end;
                end;
            end;
        end;
    end, 
    findKeyframe = function(v19, v20) --[[ Line: 120 ]] --[[ Name: findKeyframe ]]
        local v21 = 1;
        local v22 = #v19;
        local v23 = nil;
        while true do
            if v21 <= v22 then
                v23 = math.floor((v22 + v21) / 2);
                local v24 = v19[v23];
                if v20 == v24 then
                    return v23;
                elseif v24 < v20 then
                    v21 = v23 + 1;
                elseif v20 < v24 then
                    v22 = v23 - 1;
                end;
            else
                return nil;
            end;
        end;
    end, 
    findInsertIndex = function(v25, v26) --[[ Line: 144 ]] --[[ Name: findInsertIndex ]]
        local v27 = 1;
        local v28 = #v25;
        local v29 = nil;
        while true do
            if v27 <= v28 then
                v29 = math.floor((v28 + v27) / 2);
                local v30 = v25[v29];
                if v26 == v30 then
                    return nil;
                elseif v30 < v26 then
                    v27 = v29 + 1;
                elseif v26 < v30 then
                    v28 = v29 - 1;
                end;
            else
                return v27;
            end;
        end;
    end, 
    interpolate = function(v31, v32, v33) --[[ Line: 166 ]] --[[ Name: interpolate ]]
        if typeof(v31) == "CFrame" and typeof(v32) == "CFrame" then
            return v31:Lerp(v32, v33);
        elseif typeof(v31) == "Vector3" and typeof(v32) == "Vector3" then
            return v31:Lerp(v32, v33);
        elseif typeof(v31) == "number" and typeof(v32) == "number" then
            return v31 + (v32 - v31) * v33;
        else
            assert(false, "Attempted to interpolate an unsupported value.");
            return;
        end;
    end, 
    getNearestTick = function(v34) --[[ Line: 182 ]] --[[ Name: getNearestTick ]]
        return (math.floor(v34 + 0.5));
    end, 
    getNearestFrame = function(v35, v36) --[[ Line: 186 ]] --[[ Name: getNearestFrame ]]
        -- upvalues: v1 (copy)
        return (math.floor(math.floor(v35 * v36 / v1.TICK_FREQUENCY + 0.5) * v1.TICK_FREQUENCY / v36 + 0.5));
    end
};
v37.snapToFrame = function(v38, v39) --[[ Line: 200 ]] --[[ Name: snapToFrame ]]
    -- upvalues: v37 (copy)
    local v40 = false;
    if v39 > 0 then
        v40 = v39 < 1;
    end;
    assert(v40, "Tolerance should be between 0 and 1.");
    local v41 = v37.getNearestTick(v38);
    if math.abs(v38 - v41) < v39 then
        return v41;
    else
        return v38;
    end;
end;
v37.getSlope = function(v42, v43, v44) --[[ Line: 213 ]] --[[ Name: getSlope ]]
    -- upvalues: v37 (copy), v1 (copy)
    local function v45(v46, v47, v48, v49) --[[ Line: 217 ]] --[[ Name: getSlope ]]
        -- upvalues: v37 (ref), v1 (ref), v45 (copy)
        local v50 = v37.findNearestKeyframesProperly(v46.Keyframes, v47);
        if not v50 then
            return 0;
        else
            local v51 = v46.Keyframes[v50];
            local v52 = v46.Data[v51];
            local function _() --[[ Line: 227 ]] --[[ Name: getPrevKeyframe ]]
                -- upvalues: v46 (copy), v50 (copy)
                local v53 = v46.Keyframes[v50 - 1];
                return v53, v53 and v46.Data[v53] or nil;
            end;
            local function _() --[[ Line: 232 ]] --[[ Name: getNextKeyframe ]]
                -- upvalues: v46 (copy), v50 (copy)
                local v55 = v46.Keyframes[v50 + 1];
                return v55, v55 and v46.Data[v55] or nil;
            end;
            local function v67() --[[ Line: 239 ]] --[[ Name: finiteDifference ]]
                -- upvalues: v46 (copy), v50 (copy), v1 (ref), v47 (copy), v52 (copy)
                local v57 = v46.Keyframes[v50 - 1];
                local l_v57_0 = v57;
                local v59 = v57 and v46.Data[v57] or nil;
                local v60 = v46.Keyframes[v50 + 1];
                v57 = v60;
                local v61 = v60 and v46.Data[v60] or nil;
                if l_v57_0 and v57 then
                    if v46.Type == v1.TRACK_TYPES.Quaternion then
                        return 0.5 * (1 / (v57 - v47) + 1 / (v47 - l_v57_0));
                    else
                        v60 = function(v62) --[[ Line: 246 ]] --[[ Name: clamp ]]
                            -- upvalues: v1 (ref)
                            local l_CLAMPED_AUTO_TANGENT_THRESHOLD_0 = v1.CLAMPED_AUTO_TANGENT_THRESHOLD;
                            return (math.max(0, (math.min(v62 / l_CLAMPED_AUTO_TANGENT_THRESHOLD_0, (1 - v62) / l_CLAMPED_AUTO_TANGENT_THRESHOLD_0, 1))));
                        end;
                        local v64 = 0.5 * ((v61.Value - v52.Value) / (v57 - v47) + (v59.Value - v52.Value) / (l_v57_0 - v47));
                        local v65 = (v52.Value - v59.Value) / (v61.Value - v59.Value);
                        local l_CLAMPED_AUTO_TANGENT_THRESHOLD_1 = v1.CLAMPED_AUTO_TANGENT_THRESHOLD;
                        return v64 * math.max(0, (math.min(v65 / l_CLAMPED_AUTO_TANGENT_THRESHOLD_1, (1 - v65) / l_CLAMPED_AUTO_TANGENT_THRESHOLD_1, 1)));
                    end;
                else
                    return 0;
                end;
            end;
            if v48 == v1.SLOPES.Right then
                if v52.InterpolationMode == Enum.KeyInterpolationMode.Constant then
                    return 0;
                elseif v52.InterpolationMode == Enum.KeyInterpolationMode.Linear then
                    local v68 = v46.Keyframes[v50 + 1];
                    local l_v68_0 = v68;
                    local v70 = v68 and v46.Data[v68] or nil;
                    if v46.Type == v1.TRACK_TYPES.Quaternion then
                        return v70 and 1 / (l_v68_0 - v47) or 0;
                    else
                        return v70 and (v70.Value - v52.Value) / (l_v68_0 - v47) or 0;
                    end;
                elseif v52.RightSlope then
                    return v52.RightSlope;
                elseif not v49 then
                    return v45(v46, v47, v1.SLOPES.Left, true);
                else
                    return (v67());
                end;
            else
                local v71 = v46.Keyframes[v50 - 1];
                local l_v71_0 = v71;
                local v73 = v71 and v46.Data[v71] or nil;
                if not v73 then
                    return 0;
                elseif v73.InterpolationMode == Enum.KeyInterpolationMode.Constant then
                    return 0;
                elseif v73.InterpolationMode == Enum.KeyInterpolationMode.Linear then
                    if v46.Type == v1.TRACK_TYPES.Quaternion then
                        return 1 / (v47 - l_v71_0);
                    else
                        return (v73.Value - v52.Value) / (l_v71_0 - v47);
                    end;
                elseif v52.LeftSlope then
                    return v52.LeftSlope;
                elseif not v49 then
                    return v45(v46, v47, v1.SLOPES.Right, true);
                else
                    return (v67());
                end;
            end;
        end;
    end;
    return v45(v42, v43, v44, false);
end;
v37.getSlopes = function(v74, v75) --[[ Line: 329 ]] --[[ Name: getSlopes ]]
    -- upvalues: v2 (copy), v37 (copy), v1 (copy)
    if not v74.Keyframes or v2(v74.Keyframes) then
        return nil, nil;
    else
        local l_Keyframes_0 = v74.Keyframes;
        local l_Data_0 = v74.Data;
        if l_Data_0[v75] then
            return v37.getSlope(v74, v75, v1.SLOPES.Left), v37.getSlope(v74, v75, v1.SLOPES.Right);
        else
            local v78, v79 = v37.findNearestKeyframes(l_Keyframes_0, v75);
            if v78 and v79 then
                local v80 = l_Keyframes_0[v78];
                local v81 = l_Keyframes_0[v79];
                local v82 = l_Data_0[v80];
                local v83 = l_Data_0[v81];
                if v82.EasingSyle == Enum.KeyInterpolationMode.Constant then
                    return 0, 0;
                elseif v82.EasingStyle == Enum.KeyInterpolationMode.Linear then
                    local v84 = nil;
                    v84 = if v74.Type == v1.TRACK_TYPES.Quaternion then 1 / (v81 - v80) else (v83.Value - v82.Value) / (v81 - v80);
                    return v84, v84;
                else
                    local v85 = v37.getSlope(v74, v80, v1.SLOPES.Right);
                    local v86 = v37.getSlope(v74, v81, v1.SLOPES.Left);
                    local v87 = v81 - v80;
                    local v88 = (v75 - v80) / v87;
                    local v89 = 6 * v88 * (v88 - 1);
                    local v90 = (v88 - 1) * (3 * v88 - 1);
                    local v91 = -v89;
                    local v92 = v88 * (3 * v88 - 2);
                    local v93 = nil;
                    if v74.Type == v1.TRACK_TYPES.Quaternion then
                        v93 = v91 / v87 + v90 * v85 + v92 * v86;
                        local v94 = v88 * v88;
                        local v95 = ((v88 - 2) * v88 + 1) * v88;
                        local v96 = v94 * (3 - 2 * v88);
                        local v97 = v94 * (v88 - 1);
                        local v98 = v95 * v87 * v85 + v96 + v97 * v87 * v86;
                        return v93 / v98, v93 / (1 - v98);
                    else
                        v93 = (v89 * v82.Value + v91 * v83.Value) / v87 + v90 * v85 + v92 * v86;
                        return v93, v93;
                    end;
                end;
            else
                return 0, 0;
            end;
        end;
    end;
end;
v37.blendCurveKeyframes = function(v99, v100, v101, v102) --[[ Line: 396 ]] --[[ Name: blendCurveKeyframes ]]
    -- upvalues: v37 (copy), v1 (copy)
    assert(v101 < v102, "Low keyframe must be less than high keyframe.");
    local l_Data_1 = v99.Data;
    local v104 = l_Data_1[v101];
    local v105 = l_Data_1[v102];
    local v106 = v102 - v101;
    local v107 = (v100 - v101) / v106;
    if v104.InterpolationMode == Enum.KeyInterpolationMode.Constant then
        return v104.Value;
    elseif v104.InterpolationMode == Enum.KeyInterpolationMode.Linear then
        return v37.interpolate(v104.Value, v105.Value, v107);
    else
        local v108 = v37.getSlope(v99, v101, v1.SLOPES.Right);
        local v109 = v37.getSlope(v99, v102, v1.SLOPES.Left);
        local v110 = v107 * v107;
        local v111 = v110 * (2 * v107 - 3) + 1;
        local v112 = ((v107 - 2) * v107 + 1) * v107;
        local v113 = v110 * (3 - 2 * v107);
        local v114 = v110 * (v107 - 1);
        if v99.Type == v1.TRACK_TYPES.Quaternion then
            local v115 = v112 * v106 * v108 + v113 + v114 * v106 * v109;
            return v37.interpolate(v104.Value, v105.Value, v115);
        else
            return v111 * v104.Value + v112 * v106 * v108 + v113 * v105.Value + v114 * v106 * v109;
        end;
    end;
end;
v37.blendKeyframes = function(v116, v117, v118, v119) --[[ Line: 433 ]] --[[ Name: blendKeyframes ]]
    -- upvalues: l_TweenService_0 (copy), v37 (copy)
    assert(v118 < v119, "Low keyframe must be less than high keyframe.");
    local v120 = v116[v118];
    local v121 = v116[v119];
    local v122 = (v117 - v118) / (v119 - v118);
    local v123 = nil;
    if v120.EasingStyle == Enum.PoseEasingStyle.Constant then
        return v120.Value;
    else
        v123 = if v120.EasingStyle == Enum.PoseEasingStyle.Linear then v122 else if v120.EasingStyle == Enum.PoseEasingStyle.CubicV2 then l_TweenService_0:GetValue(v122, Enum.EasingStyle[Enum.PoseEasingStyle.Cubic.Name], Enum.EasingDirection[v120.EasingDirection.Name]) else l_TweenService_0:GetValue(v122, Enum.EasingStyle[v120.EasingStyle.Name], Enum.EasingDirection[v120.EasingDirection.Name]);
        return v37.interpolate(v120.Value, v121.Value, v123);
    end;
end;
v37.getValue = function(v124, v125, v126) --[[ Line: 465 ]] --[[ Name: getValue ]]
    -- upvalues: v2 (copy), v37 (copy), v1 (copy), v5 (copy)
    if v124.Keyframes and not v2(v124.Keyframes) and v124.Data and not v2(v124.Data) then
        local l_Keyframes_1 = v124.Keyframes;
        local v128, v129 = v37.findNearestKeyframes(l_Keyframes_1, v125);
        local v130 = l_Keyframes_1[v128];
        local v131 = v129 and l_Keyframes_1[v129];
        if v129 == nil then
            return v124.Data[v130].Value;
        elseif v124.IsCurveTrack then
            return v37.blendCurveKeyframes(v124, v125, v130, v131);
        else
            return v37.blendKeyframes(v124.Data, v125, v130, v131);
        end;
    elseif v124.Type == v1.TRACK_TYPES.CFrame then
        local v132 = if not v5() or v124 and v124.Components then v124.Components[v1.PROPERTY_KEYS.Position] else nil;
        local v133 = if not v5() or v124 and v124.Components then v124.Components[v1.PROPERTY_KEYS.Rotation] else nil;
        local v134 = v132 and v37.getValue(v132, v125, v126) or Vector3.new();
        if (not v5() or v133) and v133.Type == v1.TRACK_TYPES.EulerAngles then
            local v135 = v133 and v37.getValue(v133, v125, v126) or Vector3.new();
            return CFrame.new(v134) * CFrame.fromEulerAngles(v135.X, v135.Y, v135.Z, v133.EulerAnglesOrder or v126);
        else
            local v136 = v133 and v37.getValue(v133, v125, v126) or CFrame.new();
            return CFrame.new(v134) * v136;
        end;
    elseif (v124.Type == v1.TRACK_TYPES.Position or v124.Type == v1.TRACK_TYPES.EulerAngles) and v124.Components then
        local v137 = v124.Components[v1.PROPERTY_KEYS.X];
        local v138 = v124.Components[v1.PROPERTY_KEYS.Y];
        local v139 = v124.Components[v1.PROPERTY_KEYS.Z];
        return (Vector3.new(v137 and v37.getValue(v137, v125, v126) or 0, v138 and v37.getValue(v138, v125, v126) or 0, v139 and v37.getValue(v139, v125, v126) or 0));
    else
        return v37.getDefaultValue(v124.Type);
    end;
end;
return v37;