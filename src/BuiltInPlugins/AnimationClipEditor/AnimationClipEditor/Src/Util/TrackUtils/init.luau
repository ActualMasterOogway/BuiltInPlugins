local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v8 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v9 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v10 = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local v11 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v12 = require(l_script_FirstAncestor_0.Src.Util.CurveUtils);
local v13 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v14 = require(l_script_FirstAncestor_0.Src.Util.Templates);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v16 = {};
local function _(v17) --[[ Line: 20 ]] --[[ Name: removeNegativeZero ]]
    if v17 == 0 then
        return (math.abs(v17));
    else
        return v17;
    end;
end;
v16.traverseTracks = function(v19, v20, v21, v22) --[[ Line: 32 ]] --[[ Name: traverseTracks ]]
    -- upvalues: v8 (copy), v13 (copy)
    assert(v21 ~= nil, "func must not be nil");
    local function v23(v24, v25, v26) --[[ Line: 35 ]] --[[ Name: traverse ]]
        -- upvalues: v8 (ref), v13 (ref), v22 (copy), v21 (copy), v23 (copy)
        if v24 ~= nil then
            if v25 then
                v26 = v8.List.join(v26, {
                    v25
                });
            end;
            local v27 = true;
            if v24.Components ~= nil then
                v27 = v13(v24.Components);
            end;
            if v27 or not v22 then
                v21(v24, v25, v26, v27);
            end;
            if v24.Components ~= nil then
                for v28, v29 in pairs(v24.Components) do
                    v23(v29, v28, v26);
                end;
            end;
        end;
    end;
    v23(v20, v19, {});
end;
v16.traverseKeyframeRange = function(v30, v31, v32, v33) --[[ Line: 61 ]] --[[ Name: traverseKeyframeRange ]]
    -- upvalues: v9 (copy)
    local v34, v35 = v9.findNearestKeyframes(v30, v31);
    local v36 = v9.findNearestKeyframes(v30, v32);
    local v37 = v35 and v35 or v34;
    for v38 = v37, v36 do
        local v39 = v30[v38];
        if v31 <= v39 and v39 <= v32 then
            v33(v39, v30[v38]);
        end;
    end;
end;
v16.getNextKeyframe = function(v40, v41) --[[ Line: 76 ]] --[[ Name: getNextKeyframe ]]
    -- upvalues: v16 (copy), v9 (copy)
    local v42 = nil;
    for _, v44 in pairs(v40) do
        v16.traverseTracks(nil, v44, function(v45) --[[ Line: 79 ]]
            -- upvalues: v9 (ref), v41 (copy), v42 (ref)
            local l_Keyframes_0 = v45.Keyframes;
            local v47, _, v49 = v9.findNearestKeyframesProperly(l_Keyframes_0, v41 + 1);
            v49 = v47 or v49;
            local v50 = v49 and l_Keyframes_0[v49] or nil;
            if v50 then
                v42 = v42 and math.min(v42, v50) or v50;
            end;
        end, true);
    end;
    return v42 or v41;
end;
v16.getPreviousKeyframe = function(v51, v52) --[[ Line: 93 ]] --[[ Name: getPreviousKeyframe ]]
    -- upvalues: v16 (copy), v9 (copy)
    local v53 = nil;
    for _, v55 in pairs(v51) do
        v16.traverseTracks(nil, v55, function(v56) --[[ Line: 96 ]]
            -- upvalues: v9 (ref), v52 (copy), v53 (ref)
            local l_Keyframes_1 = v56.Keyframes;
            local v58, v59 = v9.findNearestKeyframesProperly(l_Keyframes_1, v52 - 1);
            v59 = v58 or v59;
            local v60 = v59 and l_Keyframes_1[v59] or nil;
            if v60 and v60 < v52 then
                v53 = v53 and math.max(v53, v60) or v60;
            end;
        end, true);
    end;
    return v53 or v52;
end;
v16.getSummaryKeyframes = function(v61, v62, v63, v64, _) --[[ Line: 113 ]] --[[ Name: getSummaryKeyframes ]]
    -- upvalues: v16 (copy), v13 (copy), v8 (copy)
    local v66 = {};
    local v67 = {};
    for v68, v69 in pairs(v61) do
        local l_Instance_0 = v69.Instance;
        local v71 = v69.Name or v68;
        v16.traverseTracks(v71, v69, function(v72, _, v74) --[[ Line: 121 ]]
            -- upvalues: v64 (copy), l_Instance_0 (copy), v13 (ref), v16 (ref), v62 (copy), v63 (copy), v66 (copy), v67 (copy)
            local l_Keyframes_2 = v72.Keyframes;
            local v76 = v64 and v64[l_Instance_0] or nil;
            for _, v78 in ipairs(v74) do
                v76 = v76 and (v76.Components and v76.Components[v78] or v76[v78]) or nil;
            end;
            local v79 = v76 and v76.Selection or {};
            if l_Keyframes_2 and not v13(l_Keyframes_2) then
                v16.traverseKeyframeRange(l_Keyframes_2, v62, v63, function(v80) --[[ Line: 133 ]]
                    -- upvalues: v66 (ref), v79 (copy), v67 (ref)
                    v66[v80] = true;
                    if v79[v80] then
                        v67[v80] = true;
                    end;
                end);
            end;
        end, true);
    end;
    return v8.Dictionary.keys(v66), v67;
end;
v16.getScaledKeyframePosition = function(v81, v82, v83, v84) --[[ Line: 147 ]] --[[ Name: getScaledKeyframePosition ]]
    return (math.floor((v81 - v82) * v84 / (v83 - v82)));
end;
v16.getKeyframeFromPosition = function(v85, v86, v87, v88, v89) --[[ Line: 151 ]] --[[ Name: getKeyframeFromPosition ]]
    -- upvalues: v9 (copy)
    local v90 = v89 / (v87 - v86);
    local v91 = v86 + (v85.X - v88) / v90;
    return v9.getNearestTick(v91);
end;
v16.countVisibleKeyframes = function(v92, v93, v94) --[[ Line: 158 ]] --[[ Name: countVisibleKeyframes ]]
    -- upvalues: v16 (copy), v9 (copy)
    local v95, v96 = v16.getKeyframesExtents(v92, v93, v94);
    if v95 == v96 then
        if (v9.findKeyframe(v92, v93) or v9.findKeyframe(v92, v94)) ~= nil then
            return 1;
        else
            return 0;
        end;
    else
        return v96 - v95 + 1;
    end;
end;
v16.getKeyframesExtents = function(v97, v98, v99) --[[ Line: 169 ]] --[[ Name: getKeyframesExtents ]]
    -- upvalues: v9 (copy)
    local v100, v101 = v9.findNearestKeyframes(v97, v98);
    local v102 = nil;
    local v103 = nil;
    v102 = if v101 ~= nil then v101 else v100;
    v103 = v9.findNearestKeyframes(v97, v99);
    if v102 and v103 and v98 <= v97[v102] and v98 <= v97[v103] then
        return v102, v103;
    else
        return;
    end;
end;
v16.getExpandedSize = function(v104) --[[ Line: 185 ]] --[[ Name: getExpandedSize ]]
    -- upvalues: v11 (copy)
    if v104.Components then
        local function v105(v106) --[[ Line: 188 ]] --[[ Name: recGetExpandedSize ]]
            -- upvalues: v105 (copy)
            local v107 = 1;
            if v106.Expanded then
                for _, v109 in pairs(v106.Components) do
                    v107 = v107 + v105(v109);
                end;
            end;
            return v107;
        end;
        local v110 = 1;
        if v104.Expanded then
            for _, v112 in pairs(v104.Components) do
                v110 = v110 + v105(v112);
            end;
        end;
        return v110;
    elseif v104.Type == v11.TRACK_TYPES.CFrame then
        return 3;
    else
        return 2;
    end;
end;
v16.getDefaultValue = function(v113) --[[ Line: 209 ]] --[[ Name: getDefaultValue ]]
    -- upvalues: v9 (copy)
    if v113 and v113.Type then
        return v9.getDefaultValue(v113.Type);
    else
        return;
    end;
end;
v16.getTrackTypeFromName = function(v114, v115) --[[ Line: 217 ]] --[[ Name: getTrackTypeFromName ]]
    for _, v117 in pairs(v115) do
        if v117.Name == v114 then
            return v117.Type;
        end;
    end;
end;
v16.getComponentTypeFromPath = function(v118, v119) --[[ Line: 227 ]] --[[ Name: getComponentTypeFromPath ]]
    -- upvalues: v10 (copy)
    for _, v121 in pairs(v119) do
        if v121.Name == v118[1] then
            local v122 = v10.getRelativePath(v118);
            local l_v121_0 = v121;
            for _, v125 in ipairs(v122) do
                if l_v121_0.Components and l_v121_0.Components[v125] then
                    l_v121_0 = l_v121_0.Components[v125];
                end;
            end;
            return l_v121_0.Type;
        end;
    end;
end;
v16.getEulerAnglesOrder = function(v126) --[[ Line: 242 ]] --[[ Name: getEulerAnglesOrder ]]
    -- upvalues: v11 (copy), v16 (copy)
    if v126 == nil then
        return nil;
    else
        assert(v126);
        if v126.Type == v11.TRACK_TYPES.CFrame then
            if not v126.Components then
                return nil;
            else
                assert(v126.Components);
                return v16.getEulerAnglesOrder(v126.Components[v11.PROPERTY_KEYS.Rotation]);
            end;
        elseif v126.Type == v11.TRACK_TYPES.EulerAngles then
            return v126.EulerAnglesOrder;
        else
            return nil;
        end;
    end;
end;
v16.getRotationType = function(v127) --[[ Line: 263 ]] --[[ Name: getRotationType ]]
    -- upvalues: v11 (copy)
    local v128 = v127.Components and v127.Components[v11.PROPERTY_KEYS.Rotation];
    return v128 and v128.Type or nil;
end;
v16.getRotationTypeFromName = function(v129, v130) --[[ Line: 270 ]] --[[ Name: getRotationTypeFromName ]]
    -- upvalues: v16 (copy)
    for _, v132 in pairs(v130) do
        if v132.Name == v129 then
            return v16.getRotationType(v132);
        end;
    end;
end;
v16.getTrackFromPosition = function(v133, v134, v135) --[[ Line: 280 ]] --[[ Name: getTrackFromPosition ]]
    -- upvalues: v11 (copy), v16 (copy)
    local v136 = math.max(0, v134 - 1);
    v135 = v135 - v11.SUMMARY_TRACK_HEIGHT;
    local v137 = #v133;
    for v138, v139 in ipairs(v133) do
        if v134 <= v138 then
            if v135 > 0 then
                v136 = v136 + 1;
                if v139.Expanded then
                    v135 = v135 - v11.TRACK_HEIGHT * v16.getExpandedSize(v139);
                else
                    v135 = v135 - v11.TRACK_HEIGHT;
                end;
            else
                break;
            end;
        end;
    end;
    if v135 / v11.TRACK_HEIGHT > 0 then
        return v137 + 1;
    elseif v136 == v134 - 1 then
        return 0;
    else
        return (math.max(0, v136));
    end;
end;
v16.getTrackInfoFromPosition = function(v140, v141, v142) --[[ Line: 316 ]] --[[ Name: getTrackInfoFromPosition ]]
    -- upvalues: v11 (copy), v16 (copy), v8 (copy)
    if v142 < v11.SUMMARY_TRACK_HEIGHT then
        return 0, {}, nil, nil;
    else
        v142 = v142 - v11.SUMMARY_TRACK_HEIGHT;
        local function v143(v144, v145, v146) --[[ Line: 323 ]] --[[ Name: recurse ]]
            -- upvalues: v11 (ref), v16 (ref), v143 (copy), v8 (ref)
            if v145 < v11.SUMMARY_TRACK_HEIGHT then
                return v146, v145, v144.Type, v16.getRotationType(v144);
            else
                v145 = v145 - v11.SUMMARY_TRACK_HEIGHT;
                if v144.Expanded then
                    for _, v148 in ipairs(v11.COMPONENT_TRACK_TYPES[v144.Type]._Order) do
                        local v149 = nil;
                        local v150 = nil;
                        if v144.Components[v148] then
                            local v151, v152, v153 = v143(v144.Components[v148], v145, v8.List.join(v146, {
                                v148
                            }));
                            v149 = v151;
                            v145 = v152;
                            v150 = v153;
                            if v149 then
                                return v149, v145, v150, nil;
                            end;
                        end;
                    end;
                end;
                return nil, v145, nil, nil;
            end;
        end;
        local v154 = math.max(0, v141 - 1);
        local v155 = nil;
        local v156 = nil;
        for v157, v158 in ipairs(v140) do
            if v141 <= v157 then
                local v159 = nil;
                local v160, v161, v162, v163 = v143(v158, v142, {
                    v158.Name
                });
                v159 = v160;
                v142 = v161;
                v155 = v162;
                v156 = v163;
                v154 = v154 + 1;
                if v159 then
                    return v154, v159, v155, v156;
                end;
            end;
        end;
        return #v140 + 1, {}, nil, nil;
    end;
end;
v16.getTrackIndex = function(v164, v165) --[[ Line: 362 ]] --[[ Name: getTrackIndex ]]
    for v166, v167 in ipairs(v164) do
        if v165 == v167.Name then
            return v166;
        end;
    end;
end;
v16.getTrackYPosition = function(v168, v169, v170) --[[ Line: 370 ]] --[[ Name: getTrackYPosition ]]
    -- upvalues: v11 (copy), v16 (copy)
    local l_SUMMARY_TRACK_HEIGHT_0 = v11.SUMMARY_TRACK_HEIGHT;
    local l_v169_0 = v169;
    while l_v169_0 < v170 do
        local v173 = v168[l_v169_0];
        if v173.Expanded then
            l_SUMMARY_TRACK_HEIGHT_0 = l_SUMMARY_TRACK_HEIGHT_0 + v11.TRACK_HEIGHT * v16.getExpandedSize(v173);
        else
            l_SUMMARY_TRACK_HEIGHT_0 = l_SUMMARY_TRACK_HEIGHT_0 + v11.TRACK_HEIGHT;
        end;
        l_v169_0 = l_v169_0 + 1;
    end;
    return l_SUMMARY_TRACK_HEIGHT_0;
end;
v16.getCurrentValue = function(v174, v175, v176, v177) --[[ Line: 387 ]] --[[ Name: getCurrentValue ]]
    -- upvalues: v16 (copy), v9 (copy)
    local l_Name_0 = v174.Name;
    local l_Instance_1 = v174.Instance;
    if v176 == nil then
        return v16.getDefaultValue(v174);
    else
        local v180 = v176.Instances[l_Instance_1].Tracks[l_Name_0];
        if v180 then
            return v9.getValue(v180, v175, v177);
        else
            return v16.getDefaultValue(v174);
        end;
    end;
end;
v16.getCurrentValueForPath = function(v181, v182, v183, v184, v185, v186) --[[ Line: 412 ]] --[[ Name: getCurrentValueForPath ]]
    -- upvalues: v9 (copy)
    local v187 = v184.Instances[v182];
    for v188, v189 in ipairs(v181) do
        v187 = (v188 == 1 and v187.Tracks or v187.Components)[v189];
        if not v187 then
            return v9.getDefaultValue(v185);
        end;
    end;
    return v9.getValue(v187, v183, v186);
end;
v16.getItemsForProperty = function(v190, v191, v192, v193) --[[ Line: 433 ]] --[[ Name: getItemsForProperty ]]
    -- upvalues: v11 (copy)
    local l_Type_0 = v190.Type;
    local v195 = v190.EulerAnglesOrder or v193;
    local _ = nil;
    local function v201(v197, v198, v199, v200) --[[ Line: 438 ]] --[[ Name: makeVectorItems ]]
        -- upvalues: v11 (ref)
        return {
            {
                Name = v11.PROPERTY_KEYS.X, 
                Key = "X", 
                Value = v197, 
                Type = v200
            }, 
            {
                Name = v11.PROPERTY_KEYS.Y, 
                Key = "Y", 
                Value = v198, 
                Type = v200
            }, 
            {
                Name = v11.PROPERTY_KEYS.Z, 
                Key = "Z", 
                Value = v199, 
                Type = v200
            }
        };
    end;
    if l_Type_0 == v11.TRACK_TYPES.CFrame then
        local l_Position_0 = v191.Position;
        local v203, v204, v205 = v191:ToEulerAngles(v195);
        local v206 = math.deg(v203);
        v203 = if v206 == 0 then math.abs(v206) else v206;
        v206 = math.deg(v204);
        v204 = if v206 == 0 then math.abs(v206) else v206;
        v206 = math.deg(v205);
        v205 = if v206 == 0 then math.abs(v206) else v206;
        return {
            Position = v201(l_Position_0.X, l_Position_0.Y, l_Position_0.Z, v11.TRACK_TYPES.Number), 
            Rotation = v201(v203, v204, v205, v11.TRACK_TYPES.Angle)
        };
    elseif l_Type_0 == v11.TRACK_TYPES.Position then
        return (v201(v191.X, v191.Y, v191.Z, v11.TRACK_TYPES.Number));
    elseif l_Type_0 == v11.TRACK_TYPES.EulerAngles then
        local l_v201_0 = v201;
        local v208 = math.deg(v191.X);
        local v209 = if v208 == 0 then math.abs(v208) else v208;
        local v210 = math.deg(v191.Y);
        v208 = if v210 == 0 then math.abs(v210) else v210;
        local v211 = math.deg(v191.Z);
        return (l_v201_0(v209, v208, if v211 == 0 then math.abs(v211) else v211, v11.TRACK_TYPES.Angle));
    elseif l_Type_0 == v11.TRACK_TYPES.Quaternion then
        local v212, v213, v214 = v191:ToEulerAngles(v195);
        local l_v201_1 = v201;
        local v216 = math.deg(v212);
        local v217 = if v216 == 0 then math.abs(v216) else v216;
        local v218 = math.deg(v213);
        v216 = if v218 == 0 then math.abs(v218) else v218;
        local v219 = math.deg(v214);
        return (l_v201_1(v217, v216, if v219 == 0 then math.abs(v219) else v219, v11.TRACK_TYPES.Angle));
    elseif l_Type_0 == v11.TRACK_TYPES.Facs then
        return {
            {
                Name = "V", 
                Key = "Value", 
                Value = math.clamp(v191, 0, 1), 
                Type = v11.TRACK_TYPES.Facs
            }
        };
    elseif l_Type_0 == v11.TRACK_TYPES.Angle then
        local v220 = {};
        local v221 = {
            Name = v192, 
            Key = v192
        };
        local v222 = math.deg(v191);
        v221.Value = if v222 == 0 then math.abs(v222) else v222;
        v221.Type = v11.TRACK_TYPES.Angle;
        v6(v220, 1, v221);
        return v220;
    else
        return {
            {
                Name = v192, 
                Key = v192, 
                Value = v191, 
                Type = v11.TRACK_TYPES.Number
            }
        };
    end;
end;
v16.getPropertyForItems = function(v223, v224, v225) --[[ Line: 508 ]] --[[ Name: getPropertyForItems ]]
    -- upvalues: v11 (copy)
    local l_Type_1 = v223.Type;
    local v227 = nil;
    local v228 = v223.EulerAnglesOrder or v225;
    if l_Type_1 == v11.TRACK_TYPES.CFrame then
        local l_Position_1 = v224.Position;
        local l_Rotation_0 = v224.Rotation;
        local v231 = math.rad(l_Rotation_0[1].Value);
        local v232 = math.rad(l_Rotation_0[2].Value);
        local v233 = math.rad(l_Rotation_0[3].Value);
        return CFrame.new(l_Position_1[1].Value, l_Position_1[2].Value, l_Position_1[3].Value) * CFrame.fromEulerAngles(v231, v232, v233, v228);
    elseif l_Type_1 == v11.TRACK_TYPES.Position then
        return (Vector3.new(v224[1].Value, v224[2].Value, v224[3].Value));
    elseif l_Type_1 == v11.TRACK_TYPES.EulerAngles then
        return (Vector3.new(math.rad(v224[1].Value), math.rad(v224[2].Value), (math.rad(v224[3].Value))));
    elseif l_Type_1 == v11.TRACK_TYPES.Quaternion then
        return (CFrame.fromEulerAngles(math.rad(v224[1].Value), math.rad(v224[2].Value), math.rad(v224[3].Value), v228));
    elseif l_Type_1 == v11.TRACK_TYPES.Number then
        return v224[1].Value;
    elseif l_Type_1 == v11.TRACK_TYPES.Angle then
        return (math.rad(v224[1].Value));
    else
        if l_Type_1 == v11.TRACK_TYPES.Facs then
            v227 = math.clamp(v224[1].Value, 0, 1);
        end;
        return v227;
    end;
end;
v16.getZoomRange = function(v234, v235, v236, v237) --[[ Line: 543 ]] --[[ Name: getZoomRange ]]
    -- upvalues: v11 (copy)
    local v238 = {};
    local l_StartTick_0 = v234.Metadata.StartTick;
    local v240 = math.min((math.max(v234.Metadata.EndTick, v237) - l_StartTick_0) * v11.LENGTH_PADDING, v11.MAX_ANIMATION_LENGTH);
    local v241 = math.max(v240 * (1 - v236), 1);
    v238.Start = l_StartTick_0 + (v240 - v241) * v235;
    v238.End = v238.Start + v241;
    return v238;
end;
v16.adjustCurves = function(v242) --[[ Line: 561 ]] --[[ Name: adjustCurves ]]
    -- upvalues: v8 (copy), v12 (copy), v13 (copy), v11 (copy)
    if not v242.Keyframes then
        return;
    else
        local v243 = v8.List.join({}, v242.Keyframes);
        for v244, v245 in pairs(v243) do
            local v246 = v242.Data[v245];
            local l_EasingStyle_0 = v246.EasingStyle;
            local l_EasingDirection_0 = v246.EasingDirection;
            if v244 < #v243 then
                local v249 = v243[v244 + 1];
                local v250 = v242.Data[v249];
                local v251 = v12.generateCurve(v242.Type, l_EasingStyle_0, l_EasingDirection_0, v245, v246, v249, v250);
                if v251 and not v13(v251) then
                    v242.Keyframes = v8.List.join(v242.Keyframes, v8.Dictionary.keys(v251));
                    v242.Data = v8.Dictionary.join(v242.Data, v251);
                end;
            else
                v246.EasingStyle = nil;
                v246.EasingDirection = nil;
                v246.InterpolationMode = v11.POSE_EASING_STYLE_TO_KEY_INTERPOLATION[l_EasingStyle_0];
            end;
        end;
        table.sort(v242.Keyframes);
        v242.IsCurveTrack = true;
        return;
    end;
end;
v16.splitTrackComponents = function(v252, v253, v254) --[[ Line: 595 ]] --[[ Name: splitTrackComponents ]]
    -- upvalues: v11 (copy), v14 (copy), v8 (copy), v16 (copy)
    if v252.Type == v11.TRACK_TYPES.CFrame then
        local function v255(v256) --[[ Line: 598 ]] --[[ Name: createTrackComponents ]]
            -- upvalues: v11 (ref), v253 (copy), v14 (ref), v254 (copy), v255 (copy), v252 (copy), v8 (ref)
            local v257 = v11.COMPONENT_TRACK_TYPES[v256.Type];
            if v257 then
                v256.Components = {};
                for _, v259 in pairs(v257._Order) do
                    local v260 = v257[v259];
                    if v259 == v11.PROPERTY_KEYS.Rotation and v253 then
                        v260 = v253;
                    end;
                    v256.Components[v259] = v14.track(v260);
                    if v259 == v11.PROPERTY_KEYS.Rotation and v260 == v11.TRACK_TYPES.EulerAngles then
                        v256.Components[v259].EulerAnglesOrder = v254;
                    end;
                    v255(v256.Components[v259]);
                end;
                return;
            else
                v256.Keyframes = v252.Keyframes and v8.List.join({}, v252.Keyframes) or {};
                v256.Data = {};
                return;
            end;
        end;
        v255(v252);
        local l_pairs_0 = pairs;
        local v262 = v252.Keyframes or {};
        for _, v264 in l_pairs_0(v262) do
            local l_Value_0 = v252.Data[v264].Value;
            if v253 == v11.TRACK_TYPES.Quaternion then
                local l_Position_2 = l_Value_0.Position;
                local v267 = l_Value_0 - l_Value_0.Position;
                local l_Position_3 = v252.Components.Position;
                local l_Rotation_1 = v252.Components.Rotation;
                for _, v271 in ipairs(v11.COMPONENT_TRACK_TYPES[v11.TRACK_TYPES.Position]._Order) do
                    l_Position_3.Components[v271].Data[v264] = v8.Dictionary.join(v252.Data[v264], {
                        Value = l_Position_2[v271]
                    });
                end;
                l_Rotation_1.Data[v264] = v8.Dictionary.join(v252.Data[v264], {
                    Value = v267
                });
            else
                local l_Position_4 = l_Value_0.Position;
                local v273 = Vector3.new(l_Value_0:ToEulerAngles(v254));
                for v274, v275 in pairs(v252.Components) do
                    local v276 = v274 == v11.PROPERTY_KEYS.Position and l_Position_4 or v273;
                    for v277, v278 in pairs(v275.Components) do
                        v278.Data[v264] = v8.Dictionary.join(v252.Data[v264], {
                            Value = v276[v277]
                        });
                    end;
                    v275.Keyframes = nil;
                    v275.Data = nil;
                end;
            end;
        end;
        for _, v280 in pairs(v252.Components) do
            v16.adjustCurves(v280);
            local l_pairs_1 = pairs;
            local v282 = v280.Components or {};
            for _, v284 in l_pairs_1(v282) do
                v16.adjustCurves(v284);
            end;
        end;
        v252.Keyframes = nil;
        v252.Data = nil;
        return;
    else
        if v252.Type == v11.TRACK_TYPES.Facs then
            v252.Keyframes = v252.Keyframes or {};
            v252.Data = v252.Data or {};
            v16.adjustCurves(v252);
        end;
        return;
    end;
end;
v16.createTrackListEntryComponents = function(v285, v286, v287, v288) --[[ Line: 681 ]] --[[ Name: createTrackListEntryComponents ]]
    -- upvalues: v11 (copy), v14 (copy), v16 (copy)
    local v289 = v11.COMPONENT_TRACK_TYPES[v285.Type];
    v285.Instance = v286;
    if v289 then
        v285.Components = {};
        assert(v285.Components);
        for _, v291 in ipairs(v289._Order) do
            local v292 = v289[v291];
            local v293 = nil;
            if v291 == v11.PROPERTY_KEYS.Rotation then
                v293 = v14.trackListEntry(v287);
                if v287 == v11.TRACK_TYPES.EulerAngles then
                    v293.EulerAnglesOrder = v288;
                end;
            else
                v293 = v14.trackListEntry(v292);
            end;
            v293.Name = v291;
            v285.Components[v291] = v293;
            v16.createTrackListEntryComponents(v285.Components[v291], v286, v287, v288);
        end;
    end;
end;
v16.getComponentsInfo = function(v294, v295, v296) --[[ Line: 725 ]] --[[ Name: getComponentsInfo ]]
    -- upvalues: v16 (copy)
    v296 = v296 or v295;
    local v297 = {};
    local v298 = 0;
    v16.traverseTracks(nil, v294, function() --[[ Line: 730 ]]
        -- upvalues: v298 (ref)
        v298 = v298 + 1;
    end, true);
    v16.traverseTracks(nil, v294, function(v299) --[[ Line: 734 ]]
        -- upvalues: v295 (copy), v296 (ref), v297 (copy), v298 (ref)
        if v299.Data then
            for v300, v301 in pairs(v299.Data) do
                if v295 <= v300 and v300 <= v296 then
                    if v297[v300] then
                        v297[v300].Count = v297[v300].Count + 1;
                        v297[v300].Complete = v297[v300].Count == v298;
                        if v297[v300].EasingStyle ~= v301.EasingStyle then
                            v297[v300].EasingStyle = nil;
                        end;
                        if v297[v300].InterpolationMode ~= v301.InterpolationMode then
                            v297[v300].InterpolationMode = nil;
                        end;
                    else
                        v297[v300] = {
                            Count = 1, 
                            Complete = v298 == 1, 
                            EasingStyle = v301.EasingStyle, 
                            InterpolationMode = v301.InterpolationMode
                        };
                    end;
                end;
            end;
        end;
    end, true);
    return v297;
end;
v16.findTrackEntry = function(v302, v303) --[[ Line: 763 ]] --[[ Name: findTrackEntry ]]
    if not v302 or not v303 then
        return nil;
    else
        local v304 = nil;
        for _, v306 in ipairs(v302) do
            if v306.Name == v303[1] then
                v304 = v306;
                break;
            end;
        end;
        if not v304 then
            return nil;
        else
            for v307, v308 in ipairs(v303) do
                if v307 > 1 then
                    v304 = v304.Components[v308];
                    if not v304 then
                        return nil;
                    end;
                end;
            end;
            return v304;
        end;
    end;
end;
v16.traverseComponents = function(v309, v310, v311) --[[ Line: 796 ]] --[[ Name: traverseComponents ]]
    -- upvalues: v11 (copy), v8 (copy)
    local function v312(v313, v314) --[[ Line: 797 ]] --[[ Name: recurse ]]
        -- upvalues: v11 (ref), v311 (copy), v312 (copy), v8 (ref), v310 (copy)
        local v315 = v11.COMPONENT_TRACK_TYPES[v313];
        if v315 then
            for _, v317 in ipairs(v315._Order) do
                local v318 = v315[v317];
                if v317 == v11.PROPERTY_KEYS.Rotation then
                    v318 = v311;
                end;
                v312(v318, v8.List.join(v314, {
                    v317
                }));
            end;
            return;
        else
            v310(v313, v314);
            return;
        end;
    end;
    v312(v309, {});
end;
v16.traverseValue = function(v319, v320, v321, v322, v323) --[[ Line: 819 ]] --[[ Name: traverseValue ]]
    -- upvalues: v11 (copy), v8 (copy)
    local function v324(v325, v326, v327) --[[ Line: 820 ]] --[[ Name: recurse ]]
        -- upvalues: v11 (ref), v324 (copy), v8 (ref), v322 (copy), v323 (copy), v321 (copy)
        if v325 == v11.TRACK_TYPES.CFrame then
            local l_Position_5 = v327.Position;
            v324(v11.TRACK_TYPES.Position, v8.List.join(v326, {
                v11.PROPERTY_KEYS.Position
            }), l_Position_5);
            local v329 = if v322 == v11.TRACK_TYPES.Quaternion then v327 - l_Position_5 else Vector3.new(v327:ToEulerAngles(v323));
            v324(v322, v8.List.join(v326, {
                v11.PROPERTY_KEYS.Rotation
            }), v329);
            return;
        elseif v325 == v11.TRACK_TYPES.Position then
            v324(v11.TRACK_TYPES.Number, v8.List.join(v326, {
                v11.PROPERTY_KEYS.X
            }), v327.X);
            v324(v11.TRACK_TYPES.Number, v8.List.join(v326, {
                v11.PROPERTY_KEYS.Y
            }), v327.Y);
            v324(v11.TRACK_TYPES.Number, v8.List.join(v326, {
                v11.PROPERTY_KEYS.Z
            }), v327.Z);
            return;
        elseif v325 == v11.TRACK_TYPES.EulerAngles then
            v324(v11.TRACK_TYPES.Angle, v8.List.join(v326, {
                v11.PROPERTY_KEYS.X
            }), v327.X);
            v324(v11.TRACK_TYPES.Angle, v8.List.join(v326, {
                v11.PROPERTY_KEYS.Y
            }), v327.Y);
            v324(v11.TRACK_TYPES.Angle, v8.List.join(v326, {
                v11.PROPERTY_KEYS.Z
            }), v327.Z);
            return;
        else
            v321(v325, v326, v327);
            return;
        end;
    end;
    v324(v319, {}, v320);
end;
v16.findPreviousKeyframe = function(v330, v331, v332) --[[ Line: 852 ]] --[[ Name: findPreviousKeyframe ]]
    -- upvalues: v9 (copy)
    local v333, v334, _ = v9.findNearestKeyframesProperly(v330.Keyframes, v331);
    if v332 then
        v334 = v334 or v333;
    end;
    local v336 = v334 and v330.Keyframes[v334] or nil;
    return v336 and v330.Data[v336] or nil;
end;
v16.convertTrackToEulerAngles = function(v337, v338) --[[ Line: 861 ]] --[[ Name: convertTrackToEulerAngles ]]
    -- upvalues: v11 (copy), v14 (copy), v8 (copy)
    local v345 = {
        [Enum.RotationOrder.XYZ] = function(v339) --[[ Line: 864 ]]
            return v339.Z, v339.Y, v339.X;
        end, 
        [Enum.RotationOrder.XZY] = function(v340) --[[ Line: 867 ]]
            return v340.Y, v340.Z, v340.X;
        end, 
        [Enum.RotationOrder.YXZ] = function(v341) --[[ Line: 870 ]]
            return v341.Z, v341.X, v341.Y;
        end, 
        [Enum.RotationOrder.YZX] = function(v342) --[[ Line: 873 ]]
            return v342.X, v342.Z, v342.Y;
        end, 
        [Enum.RotationOrder.ZXY] = function(v343) --[[ Line: 876 ]]
            return v343.Y, v343.X, v343.Z;
        end, 
        [Enum.RotationOrder.ZYX] = function(v344) --[[ Line: 879 ]]
            return v344.X, v344.Y, v344.Z;
        end
    };
    local v364 = {
        [Enum.RotationOrder.XYZ] = function(v346, v347, v348) --[[ Line: 885 ]]
            return (Vector3.new(v348, v347, v346));
        end, 
        [Enum.RotationOrder.XZY] = function(v349, v350, v351) --[[ Line: 888 ]]
            return (Vector3.new(v351, v349, v350));
        end, 
        [Enum.RotationOrder.YXZ] = function(v352, v353, v354) --[[ Line: 891 ]]
            return (Vector3.new(v353, v354, v352));
        end, 
        [Enum.RotationOrder.YZX] = function(v355, v356, v357) --[[ Line: 894 ]]
            return (Vector3.new(v355, v357, v356));
        end, 
        [Enum.RotationOrder.ZXY] = function(v358, v359, v360) --[[ Line: 897 ]]
            return (Vector3.new(v359, v358, v360));
        end, 
        [Enum.RotationOrder.ZYX] = function(v361, v362, v363) --[[ Line: 900 ]]
            return (Vector3.new(v361, v362, v363));
        end
    };
    local function v381(v365, v366) --[[ Line: 907 ]] --[[ Name: findClosestAngles ]]
        -- upvalues: v338 (copy), v345 (copy), v364 (copy)
        local v367 = Vector3.new(v366:ToEulerAngles(v338));
        if not v365 then
            return v367;
        else
            local v368, v369, v370 = v345[v338](v367);
            local v371, v372, v373 = v345[v338](v365);
            local v374 = v368 + 3.141592653589793;
            local v375 = 3.141592653589793 - v369;
            local v376 = v370 + 3.141592653589793;
            local function _(v377, v378) --[[ Line: 930 ]] --[[ Name: reduceFullCircles ]]
                return v378 + math.floor((v377 - v378) / 6.283185307179586 + 0.5) * 3.141592653589793 * 2;
            end;
            local l_v368_0 = v368;
            v368 = l_v368_0 + math.floor((v371 - l_v368_0) / 6.283185307179586 + 0.5) * 3.141592653589793 * 2;
            l_v368_0 = v374;
            v374 = l_v368_0 + math.floor((v371 - l_v368_0) / 6.283185307179586 + 0.5) * 3.141592653589793 * 2;
            l_v368_0 = v369;
            v369 = l_v368_0 + math.floor((v372 - l_v368_0) / 6.283185307179586 + 0.5) * 3.141592653589793 * 2;
            l_v368_0 = v375;
            v375 = l_v368_0 + math.floor((v372 - l_v368_0) / 6.283185307179586 + 0.5) * 3.141592653589793 * 2;
            l_v368_0 = v370;
            v370 = l_v368_0 + math.floor((v373 - l_v368_0) / 6.283185307179586 + 0.5) * 3.141592653589793 * 2;
            l_v368_0 = v376;
            v376 = l_v368_0 + math.floor((v373 - l_v368_0) / 6.283185307179586 + 0.5) * 3.141592653589793 * 2;
            if (v371 - v368) * (v371 - v368) + (v372 - v369) * (v372 - v369) + (v373 - v370) * (v373 - v370) <= (v371 - v374) * (v371 - v374) + (v372 - v375) * (v372 - v375) + (v373 - v376) * (v373 - v376) then
                return v364[v338](v368, v369, v370);
            else
                return v364[v338](v374, v375, v376);
            end;
        end;
    end;
    local l__Order_0 = v11.COMPONENT_TRACK_TYPES[v11.TRACK_TYPES.EulerAngles]._Order;
    v337.Components = {};
    assert(v337.Components);
    v337.EulerAnglesOrder = v338;
    for _, v384 in ipairs(l__Order_0) do
        local v385 = v11.COMPONENT_TRACK_TYPES[v11.TRACK_TYPES.EulerAngles][v384];
        local v386 = v14.track(v385);
        v386.Keyframes = v8.List.join(v337.Keyframes);
        v386.Data = {};
        v386.IsCurveTrack = true;
        v337.Components[v384] = v386;
    end;
    local v387 = nil;
    if v337.Keyframes and v337.Data then
        for _, v389 in ipairs(v337.Keyframes) do
            local v390 = v337.Data[v389];
            if v390 then
                v387 = v381(v387, v390.Value);
                for _, v392 in ipairs(l__Order_0) do
                    local v393 = v14.keyframe();
                    v393.Value = v387[v392];
                    v393.InterpolationMode = v390.InterpolationMode;
                    v337.Components[v392].Data[v389] = v393;
                end;
            end;
        end;
        for _, v395 in ipairs(l__Order_0) do
            local v396 = v337.Components[v395];
            for v397, v398 in ipairs(v337.Keyframes) do
                local v399 = v337.Keyframes[v397 - 1];
                local v400 = v337.Keyframes[v397 + 1];
                local v401 = v337.Data[v398];
                local v402 = v396.Data[v398];
                if v401.LeftSlope ~= nil and v399 then
                    local l_Value_1 = v396.Data[v399].Value;
                    local v404 = v387[v395] - l_Value_1;
                    v402.LeftSlope = v401.LeftSlope * v404;
                else
                    v402.LeftSlope = nil;
                end;
                if v401.RightSlope ~= nil and v400 then
                    local v405 = v396.Data[v400].Value - v387[v395];
                    v402.RightSlope = v401.RightSlope * v405;
                else
                    v402.RightSlope = nil;
                end;
            end;
        end;
    end;
    v337.Keyframes = nil;
    v337.Data = nil;
    v337.Type = v11.TRACK_TYPES.EulerAngles;
end;
v16.countKeyframes = function(v406) --[[ Line: 1033 ]] --[[ Name: countKeyframes ]]
    -- upvalues: v16 (copy)
    local v407 = 0;
    v16.traverseTracks(nil, v406, function(v408) --[[ Line: 1035 ]]
        -- upvalues: v407 (ref)
        if v408.Keyframes then
            v407 = v407 + #v408.Keyframes;
        end;
    end, true);
    return v407;
end;
return v16;