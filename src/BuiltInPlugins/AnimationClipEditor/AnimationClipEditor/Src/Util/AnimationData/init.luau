local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Math_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Math;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v5 = require(l_Util_0.Constants);
local v6 = require(l_Util_0.deepCopy);
local v7 = require(l_Util_0.fuzzyCFrameEq);
local v8 = require(l_Util_0.isEmpty);
local v9 = require(l_Util_0.KeyframeUtils);
local _ = require(l_Util_0.PathUtils);
local v11 = require(l_Util_0.Templates);
local v12 = require(l_Util_0.TrackUtils);
local v13 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
local v18 = {
    new = function(v14, v15, v16) --[[ Line: 35 ]] --[[ Name: new ]]
        -- upvalues: v11 (copy)
        assert(v14 ~= nil, "Expected a name for the AnimationData.");
        local v17 = v11.animationData();
        v17.Metadata.Name = v14;
        v17.Metadata.IsChannelAnimation = false;
        if v16 and v16 ~= "" then
            v17.Metadata.Guid = v16;
        end;
        v17.Instances.Root.Type = v15;
        return v17;
    end
};
v18.newRigAnimation = function(v19) --[[ Line: 49 ]] --[[ Name: newRigAnimation ]]
    -- upvalues: v18 (copy), v5 (copy)
    return v18.new(v19, v5.INSTANCE_TYPES.Rig);
end;
if not v13() then
    v18.toCFrameArray = function(v20, v21, v22) --[[ Line: 54 ]] --[[ Name: toCFrameArray ]]
        -- upvalues: v5 (copy), v9 (copy)
        assert(v20 ~= nil, "No bones array was provided.");
        assert(v21 ~= nil, "No data table was provided.");
        assert(typeof(v20) == "table", "Bones should be an array of bone names.");
        assert(typeof(v21) == "table", "Data must be an AnimationData table.");
        local l_TICK_FREQUENCY_0 = v5.TICK_FREQUENCY;
        local v24 = v22 or l_TICK_FREQUENCY_0;
        assert(v24 ~= nil, "No frame rate was found for exporting.");
        assert(l_TICK_FREQUENCY_0 > 0, "Input frame rate must be positive.");
        assert(v24 > 0, "Output frame rate must be positive.");
        local v25 = v21.Metadata.EndTick - v21.Metadata.StartTick;
        local v26 = l_TICK_FREQUENCY_0 / v24;
        local v27 = v25 / v26;
        local v28 = {};
        local l_Root_0 = v21.Instances.Root;
        assert(l_Root_0.Type == "Skeleton", "Can only export Skeleton animations to CFrame[][]");
        local l_Tracks_0 = l_Root_0.Tracks;
        for v31, v32 in ipairs(v20) do
            local v33 = {};
            if l_Tracks_0[v32] then
                for v34 = 1, v27 do
                    v33[v34] = v9.getValue(l_Tracks_0[v32], v34 * v26);
                end;
            end;
            v28[v31] = v33;
        end;
        return v28;
    end;
    v18.fromCFrameArray = function(v35, v36, v37, v38) --[[ Line: 89 ]] --[[ Name: fromCFrameArray ]]
        -- upvalues: v18 (copy), v11 (copy), v5 (copy)
        assert(v35 ~= nil, "No bones array was provided.");
        assert(typeof(v35) == "table", "Bones should be an array of bone names.");
        local v39 = v18.new(v37, v38);
        v39.Instances.Root.Type = "Skeleton";
        local l_Tracks_1 = v39.Instances.Root.Tracks;
        for v41, v42 in ipairs(v35) do
            if #v36[v41] > 0 then
                l_Tracks_1[v42] = v11.track(v5.TRACK_TYPES.CFrame);
                l_Tracks_1[v42].Keyframes = {};
                l_Tracks_1[v42].Data = {};
                v39.Metadata.EndTick = math.max(v39.Metadata.EndTick, #v36[v41]);
                for v43 = 1, #v36[v41] do
                    table.insert(l_Tracks_1[v42].Keyframes, v43);
                    local v44 = v11.keyframe();
                    v44.EasingStyle = Enum.PoseEasingStyle.Linear;
                    v44.EasingDirection = Enum.PoseEasingDirection.In;
                    v44.Value = v36[v41][v43];
                    l_Tracks_1[v42].Data[v43] = v44;
                end;
            end;
        end;
        return v39;
    end;
end;
v18.addEvent = function(v45, v46, v47, v48) --[[ Line: 120 ]] --[[ Name: addEvent ]]
    -- upvalues: v9 (copy)
    local l_Keyframes_0 = v45.Keyframes;
    local l_Data_0 = v45.Data;
    if not l_Data_0[v46] then
        local v51 = v9.findInsertIndex(l_Keyframes_0, v46);
        if v51 then
            table.insert(l_Keyframes_0, v51, v46);
        end;
        l_Data_0[v46] = {};
    end;
    if not l_Data_0[v46][v47] then
        l_Data_0[v46][v47] = v48 or "";
    end;
end;
v18.moveEvents = function(v52, v53, v54) --[[ Line: 136 ]] --[[ Name: moveEvents ]]
    -- upvalues: v9 (copy), v6 (copy)
    if v53 == v54 then
        return;
    else
        local l_Keyframes_1 = v52.Keyframes;
        local l_Data_1 = v52.Data;
        if l_Data_1[v53] then
            local v57 = v9.findKeyframe(l_Keyframes_1, v53);
            table.remove(l_Keyframes_1, v57);
            local v58 = v9.findInsertIndex(l_Keyframes_1, v54);
            if v58 then
                table.insert(l_Keyframes_1, v58, v54);
            end;
            l_Data_1[v54] = v6(l_Data_1[v53]);
            l_Data_1[v53] = nil;
        end;
        return;
    end;
end;
v18.deleteEvents = function(v59, v60) --[[ Line: 157 ]] --[[ Name: deleteEvents ]]
    -- upvalues: v9 (copy)
    local l_Keyframes_2 = v59.Keyframes;
    local l_Data_2 = v59.Data;
    if l_Data_2[v60] then
        local v63 = v9.findKeyframe(l_Keyframes_2, v60);
        table.remove(l_Keyframes_2, v63);
        l_Data_2[v60] = nil;
    end;
end;
v18.setEventValue = function(v64, v65, v66, v67) --[[ Line: 168 ]] --[[ Name: setEventValue ]]
    local l_Data_3 = v64.Data;
    if l_Data_3[v65] and l_Data_3[v65][v66] then
        l_Data_3[v65][v66] = v67;
    end;
end;
v18.removeEvent = function(v69, v70, v71) --[[ Line: 176 ]] --[[ Name: removeEvent ]]
    -- upvalues: v8 (copy), v9 (copy)
    local l_Keyframes_3 = v69.Keyframes;
    local l_Data_4 = v69.Data;
    if l_Data_4[v70] and l_Data_4[v70][v71] then
        l_Data_4[v70][v71] = nil;
        if v8(l_Data_4[v70]) then
            l_Data_4[v70] = nil;
            local v74 = v9.findKeyframe(l_Keyframes_3, v70);
            table.remove(l_Keyframes_3, v74);
        end;
    end;
end;
v18.addTrack = function(v75, v76, v77, v78, v79, v80) --[[ Line: 190 ]] --[[ Name: addTrack ]]
    -- upvalues: v11 (copy), v12 (copy)
    v75[v76] = v11.track(v77);
    if v78 then
        v12.splitTrackComponents(v75[v76], v79, v80);
    else
        v75[v76].Keyframes = {};
        v75[v76].Data = {};
        v75[v76].EulerAnglesOrder = v80;
    end;
    return v75[v76];
end;
v18.addKeyframe = function(v81, v82, v83) --[[ Line: 204 ]] --[[ Name: addKeyframe ]]
    -- upvalues: v9 (copy), v1 (copy), v11 (copy)
    local l_Keyframes_4 = v81.Keyframes;
    local v85 = v9.findInsertIndex(l_Keyframes_4, v82);
    if v85 then
        table.insert(l_Keyframes_4, v85, v82);
    end;
    v81.Data[v82] = v1.Dictionary.join(v81.Data[v82] or v11.keyframe(), v83);
end;
v18.addDefaultKeyframe = function(v86, v87, v88) --[[ Line: 213 ]] --[[ Name: addDefaultKeyframe ]]
    -- upvalues: v9 (copy), v18 (copy)
    local v89 = {
        Value = v9.getDefaultValue(v88)
    };
    if v86.IsCurveTrack then
        v89.InterpolationMode = Enum.KeyInterpolationMode.Cubic;
    else
        v89.EasingStyle = Enum.PoseEasingStyle.Linear;
        v89.EasingDirection = Enum.PoseEasingDirection.In;
    end;
    v18.addKeyframe(v86, v87, v89);
end;
v18.moveNamedKeyframe = function(v90, v91, v92) --[[ Line: 228 ]] --[[ Name: moveNamedKeyframe ]]
    -- upvalues: v12 (copy), v18 (copy)
    if v90.Events then
        local l_NamedKeyframes_0 = v90.Events.NamedKeyframes;
        if l_NamedKeyframes_0 and l_NamedKeyframes_0[v91] then
            local v94 = l_NamedKeyframes_0[v91];
            local v95 = true;
            for _, v97 in pairs(v90.Instances) do
                local v98 = v12.getSummaryKeyframes(v97.Tracks, v90.Metadata.StartTick, v90.Metadata.EndTick);
                for _, v100 in ipairs(v98) do
                    if v100 == v91 then
                        v95 = false;
                    end;
                end;
            end;
            if v95 then
                v18.setKeyframeName(v90, v91, nil);
                v18.setKeyframeName(v90, v92, v94);
            end;
        end;
    end;
end;
v18.moveKeyframe = function(v101, v102, v103) --[[ Line: 252 ]] --[[ Name: moveKeyframe ]]
    -- upvalues: v9 (copy), v6 (copy)
    if v102 == v103 then
        return;
    else
        local l_Keyframes_5 = v101.Keyframes;
        local v105 = v9.findKeyframe(l_Keyframes_5, v102);
        table.remove(l_Keyframes_5, v105);
        local v106 = v9.findInsertIndex(l_Keyframes_5, v103);
        if v106 then
            table.insert(l_Keyframes_5, v106, v103);
        end;
        v101.Data[v103] = v6(v101.Data[v102]);
        v101.Data[v102] = nil;
        return;
    end;
end;
v18.deleteKeyframe = function(v107, v108) --[[ Line: 271 ]] --[[ Name: deleteKeyframe ]]
    -- upvalues: v9 (copy)
    v107.Data[v108] = nil;
    local v109 = v9.findKeyframe(v107.Keyframes, v108);
    table.remove(v107.Keyframes, v109);
end;
v18.setKeyframeData = function(v110, v111, v112) --[[ Line: 278 ]] --[[ Name: setKeyframeData ]]
    -- upvalues: v1 (copy)
    v110.Data[v111] = v1.Dictionary.join(v110.Data[v111], v112);
end;
v18.setKeyframeName = function(v113, v114, v115) --[[ Line: 283 ]] --[[ Name: setKeyframeName ]]
    -- upvalues: v5 (copy)
    if v115 == v5.DEFAULT_KEYFRAME_NAME then
        v113.Events.NamedKeyframes[v114] = nil;
        return;
    else
        v113.Events.NamedKeyframes[v114] = v115;
        return;
    end;
end;
v18.validateKeyframeNames = function(v116) --[[ Line: 292 ]] --[[ Name: validateKeyframeNames ]]
    -- upvalues: v8 (copy), v12 (copy), v18 (copy)
    if v116.Events then
        local l_NamedKeyframes_1 = v116.Events.NamedKeyframes;
        if l_NamedKeyframes_1 and not v8(l_NamedKeyframes_1) then
            local v118 = {};
            for _, v120 in pairs(v116.Instances) do
                local v121 = v12.getSummaryKeyframes(v120.Tracks, v116.Metadata.StartTick, v116.Metadata.EndTick);
                for _, v123 in ipairs(v121) do
                    v118[v123] = true;
                end;
            end;
            for v124, _ in pairs(l_NamedKeyframes_1) do
                if not v118[v124] then
                    v18.setKeyframeName(v116, v124, nil);
                end;
            end;
        end;
    end;
end;
v18.setEndTick = function(v126) --[[ Line: 313 ]] --[[ Name: setEndTick ]]
    -- upvalues: v12 (copy), v8 (copy)
    if not v126 then
        return;
    else
        local v127 = 0;
        if v126 and v126.Instances then
            for _, v129 in pairs(v126.Instances) do
                if v129.Tracks then
                    for _, v131 in pairs(v129.Tracks) do
                        v12.traverseTracks(nil, v131, function(v132) --[[ Line: 323 ]]
                            -- upvalues: v8 (ref), v127 (ref)
                            if v132.Keyframes and not v8(v132.Keyframes) then
                                local v133 = v132.Keyframes[#v132.Keyframes];
                                v127 = math.max(v127, v133);
                            end;
                        end);
                    end;
                end;
            end;
        end;
        if v126.Metadata then
            v126.Metadata.EndTick = v127;
        end;
        return;
    end;
end;
v18.getMaximumLength = function(v134) --[[ Line: 338 ]] --[[ Name: getMaximumLength ]]
    -- upvalues: v5 (copy)
    return v134 * v5.MAX_TIME;
end;
v18.setLooping = function(v135, v136) --[[ Line: 342 ]] --[[ Name: setLooping ]]
    if v135 then
        v135.Metadata.Looping = v136;
    end;
end;
v18.isQuantized = function(v137) --[[ Line: 350 ]] --[[ Name: isQuantized ]]
    if v137 and v137.Instances then
        for _, v139 in pairs(v137.Instances) do
            for _, v141 in pairs(v139.Tracks) do
                for _, v143 in ipairs(v141.Keyframes) do
                    if v143 ~= math.floor(v143) then
                        return false;
                    end;
                end;
            end;
        end;
        return true;
    else
        return;
    end;
end;
v18.removeExtraKeyframes = function(v144) --[[ Line: 367 ]] --[[ Name: removeExtraKeyframes ]]
    -- upvalues: v5 (copy), v12 (copy)
    local v145 = false;
    if not v144 or not v144.Metadata then
        return v145;
    else
        if v144 and v144.Instances and v144.Metadata then
            local function v149(v146) --[[ Line: 376 ]] --[[ Name: removeKeyframesAndData ]]
                -- upvalues: v5 (ref), v145 (ref)
                if v146 and v146.Keyframes and v146.Data then
                    for v147, v148 in ipairs(v146.Keyframes) do
                        if v5.MAX_ANIMATION_LENGTH < v148 then
                            v146.Data[v148] = nil;
                            v146.Keyframes[v147] = nil;
                            v145 = true;
                        end;
                    end;
                end;
            end;
            local l_pairs_0 = pairs;
            local v151 = v144.Instances or {};
            for _, v153 in l_pairs_0(v151) do
                for _, v155 in pairs(v153.Tracks) do
                    v12.traverseTracks(nil, v155, v149, true);
                end;
            end;
            v149(v144.Events);
        end;
        return v145;
    end;
end;
v18.getSelectionBounds = function(_, v157) --[[ Line: 401 ]] --[[ Name: getSelectionBounds ]]
    -- upvalues: v8 (copy), v5 (copy)
    if not v157 or v8(v157) then
        return nil, nil;
    else
        local l_MAX_ANIMATION_LENGTH_0 = v5.MAX_ANIMATION_LENGTH;
        local v159 = 0;
        local function v160(v161) --[[ Line: 409 ]] --[[ Name: traverse ]]
            -- upvalues: l_MAX_ANIMATION_LENGTH_0 (ref), v159 (ref), v160 (copy)
            local l_pairs_1 = pairs;
            local v163 = v161.Selection or {};
            for v164, _ in l_pairs_1(v163) do
                l_MAX_ANIMATION_LENGTH_0 = math.min(v164, l_MAX_ANIMATION_LENGTH_0);
                v159 = math.max(v164, v159);
            end;
            l_pairs_1 = pairs;
            v163 = v161.Components or {};
            for _, v167 in l_pairs_1(v163) do
                v160(v167);
            end;
        end;
        for _, v169 in pairs(v157) do
            for _, v171 in pairs(v169) do
                v160(v171);
            end;
        end;
        return l_MAX_ANIMATION_LENGTH_0, v159;
    end;
end;
v18.getEventBounds = function(_, v173) --[[ Line: 429 ]] --[[ Name: getEventBounds ]]
    -- upvalues: v5 (copy), v1 (copy)
    local l_MAX_ANIMATION_LENGTH_1 = v5.MAX_ANIMATION_LENGTH;
    local v175 = 0;
    local v176 = v1.Dictionary.keys(v173);
    table.sort(v176);
    if v176 then
        if v176[1] <= l_MAX_ANIMATION_LENGTH_1 then
            l_MAX_ANIMATION_LENGTH_1 = v176[1];
        end;
        if v175 <= v176[#v176] then
            v175 = v176[#v176];
        end;
    end;
    return l_MAX_ANIMATION_LENGTH_1, v175;
end;
v18.promoteToChannels = function(v177, v178, v179) --[[ Line: 445 ]] --[[ Name: promoteToChannels ]]
    -- upvalues: v12 (copy), v5 (copy), v18 (copy)
    if not v177 or v177.Metadata and v177.Metadata.IsChannelAnimation then
        return 0, 0;
    else
        for _, v181 in pairs(v177.Instances) do
            for _, v183 in pairs(v181.Tracks) do
                v12.splitTrackComponents(v183, v5.TRACK_TYPES.Quaternion);
                if v183.Type == v5.TRACK_TYPES.CFrame and v178 == v5.TRACK_TYPES.EulerAngles then
                    v12.convertTrackToEulerAngles(v183.Components[v5.PROPERTY_KEYS.Rotation], v179);
                end;
            end;
        end;
        v18.clearTrackSequences(v177);
        v177.Metadata.IsChannelAnimation = true;
        v177.Metadata.Name = v177.Metadata.Name .. " [CHANNELS]";
        local v184 = 0;
        local v185 = 0;
        for _, v187 in pairs(v177.Instances) do
            for _, v189 in pairs(v187.Tracks) do
                v184 = v184 + 1;
                v185 = v185 + v12.countKeyframes(v189);
            end;
        end;
        return v184, v185;
    end;
end;
v18.isChannelAnimation = function(v190) --[[ Line: 479 ]] --[[ Name: isChannelAnimation ]]
    return v190 and v190.Metadata and v190.Metadata.IsChannelAnimation;
end;
v18.getTrack = function(v191, v192, v193) --[[ Line: 483 ]] --[[ Name: getTrack ]]
    -- upvalues: v8 (copy)
    if not v191 or not v191.Instances[v192] or not v193 or v8(v193) then
        return nil;
    else
        local v194 = v191.Instances[v192].Tracks[v193[1]];
        for v195, v196 in ipairs(v193) do
            if v195 > 1 then
                if not v194 or v194.Components == nil then
                    return nil;
                else
                    v194 = v194.Components[v196];
                end;
            end;
        end;
        return v194;
    end;
end;
v18.hasFacsData = function(v197) --[[ Line: 502 ]] --[[ Name: hasFacsData ]]
    -- upvalues: v5 (copy)
    if not v197 then
        return false;
    else
        for _, v199 in pairs(v197.Instances) do
            for _, v201 in pairs(v199.Tracks) do
                if v201.Type == v5.TRACK_TYPES.Facs then
                    return true;
                end;
            end;
        end;
        return false;
    end;
end;
local function v215(v202) --[[ Line: 523 ]] --[[ Name: clearSequences ]]
    -- upvalues: v5 (copy), v7 (copy), l_Math_0 (copy), v9 (copy)
    local v203 = nil;
    v203 = if not (v202.Type ~= v5.TRACK_TYPES.CFrame) or v202.Type == v5.TRACK_TYPES.Quaternion then v7 else l_Math_0.fuzzyEq;
    if not v202.Keyframes or not v202.Keyframes[1] or not v202.Data then
        return false;
    else
        assert(v202.Keyframes and v202.Keyframes[1] and v202.Data);
        local v204 = v202.Keyframes[1];
        local v205 = v202.Data[v204];
        if not v205 then
            return false;
        else
            local v206 = nil;
            local v207 = {};
            for v208 = 2, #v202.Keyframes do
                local v209 = v202.Keyframes[v208];
                if v203(v202.Data[v209].Value, v205.Value) then
                    v207[v209] = true;
                elseif v209 ~= v204 then
                    if v206 then
                        v207[v206] = nil;
                    end;
                    v204 = v209;
                    v205 = v202.Data[v204];
                end;
                v206 = v209;
            end;
            if v206 and v206 ~= v204 then
                v207[v206] = nil;
            end;
            local v210 = {};
            local v211 = false;
            for _, v213 in v202.Keyframes do
                if v207[v213] then
                    v202.Data[v213] = nil;
                    v211 = true;
                else
                    table.insert(v210, v213);
                end;
            end;
            v202.Keyframes = v210;
            if #v202.Keyframes == 2 then
                local v214 = v9.getValue(v202, v202.Keyframes[1]);
                if v203(v214, (v9.getValue(v202, v202.Keyframes[2]))) and v203(v214, v9.getDefaultValue(v202.Type)) then
                    v202.Data = {};
                    v202.Keyframes = {};
                    v211 = true;
                end;
            end;
            return v211;
        end;
    end;
end;
v18.clearTrackSequences = function(v216) --[[ Line: 590 ]] --[[ Name: clearTrackSequences ]]
    -- upvalues: v12 (copy), v215 (copy), v5 (copy), v8 (copy)
    if not v216 then
        return false;
    else
        local v217 = false;
        for _, v219 in pairs(v216.Instances) do
            for v220, v221 in pairs(v219.Tracks) do
                v12.traverseTracks(nil, v221, function(v222) --[[ Line: 599 ]]
                    -- upvalues: v217 (ref), v215 (ref)
                    v217 = v215(v222) or v217;
                end, true);
                if (v221.Type == v5.TRACK_TYPES.CFrame or v221.Type == v5.TRACK_TYPES.Facs) and v221.Keyframes and v8(v221.Keyframes) then
                    v219.Tracks[v220] = nil;
                end;
            end;
        end;
        return v217;
    end;
end;
return v18;