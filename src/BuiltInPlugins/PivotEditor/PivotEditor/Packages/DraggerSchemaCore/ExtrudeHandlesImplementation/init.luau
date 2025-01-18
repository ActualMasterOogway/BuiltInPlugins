local l_RunService_0 = game:GetService("RunService");
local l_DraggerFramework_0 = script.Parent.Parent.DraggerFramework;
local v2 = require(l_DraggerFramework_0.Utility.JointMaker);
local v3 = require(l_DraggerFramework_0.Utility.getBoundingBoxScale);
local v4 = require(l_DraggerFramework_0.Utility.TemporaryTransparency);
local v5 = require(l_DraggerFramework_0.Utility.Math);
local v6 = require(l_DraggerFramework_0.Utility.JointUtil);
local v7 = require(l_DraggerFramework_0.Utility.getSoftSnaps);
local v8 = require(l_DraggerFramework_0.Flags.getFFlagDraggerImprovements);
local v9 = require(l_DraggerFramework_0.Flags.getFFlagDraggerLockedSummon);
local v10 = require(l_DraggerFramework_0.Flags.getFFlagDraggerFinalShortcuts);
local v11 = require(l_DraggerFramework_0.Flags.getFFlagDraggerSafeScaleTo);
local v12 = CFrame.new();
local v13 = Vector3.new();
local v14 = Vector3.new(1, 1, 1, 0) * 1e999;
local v15 = {};
v15.__index = v15;
v15.new = function(v16) --[[ Line: 33 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v15 (copy)
    return (setmetatable({
        _draggerContext = v16, 
        _jointMaker = v2.new()
    }, v15));
end;
v15.getBoundingBox = function(_, _, v19) --[[ Line: 51 ]] --[[ Name: getBoundingBox ]]
    -- upvalues: v13 (copy)
    if v19:isSelectionSinglePart() then
        local v20 = v19:getObjectsToTransform()[1];
        return v20.CFrame, Vector3.zero, v20.Size;
    else
        local v21, v22, v23 = v19:getBoundingBox();
        local v24 = 0.5 * v23;
        local v25 = (v22 - v24):Min(v13);
        local v26 = (v22 + v24):Max(v13);
        v23 = v26 - v25;
        return v21, (v26 + v25) / 2, v23;
    end;
end;
v15.shouldScaleFromCenter = function(v27, _, _, _) --[[ Line: 73 ]] --[[ Name: shouldScaleFromCenter ]]
    return v27._draggerContext:isCtrlKeyDown();
end;
local _ = function(v31) --[[ Line: 77 ]] --[[ Name: mapSize ]]
    local v32 = 0;
    for _ in v31 do
        v32 = v32 + 1;
    end;
    return v32;
end;
v15.axesToScale = function(v35, v36, v37) --[[ Line: 87 ]] --[[ Name: axesToScale ]]
    -- upvalues: v8 (copy), v10 (copy)
    local v38 = {
        X = true, 
        Y = true, 
        Z = true
    };
    if if v8() and v10() then v35._draggerContext:isAltKeyDown() else v35._draggerContext:isShiftKeyDown() then
        return v38;
    else
        local v39 = v36:getRootModelMapping();
        local l_LoosePartMap_0 = v39.LoosePartMap;
        local v41 = 0;
        for _ in l_LoosePartMap_0 do
            v41 = v41 + 1;
        end;
        local l_v41_0 = v41;
        v41 = v39.RootModelMap;
        local v44 = 0;
        for _ in v41 do
            v44 = v44 + 1;
        end;
        if v44 > 0 or l_v41_0 > 1 then
            return v38;
        else
            v41 = next(v39.LoosePartMap);
            if v41 and v41:IsA("Part") and v41.Shape == Enum.PartType.Ball then
                return v38;
            else
                return ({
                    {
                        X = true
                    }, 
                    {
                        Y = true
                    }, 
                    {
                        Z = true
                    }
                })[v37];
            end;
        end;
    end;
end;
v15.getMinMaxSizes = function(_, v47, v48, v49) --[[ Line: 131 ]] --[[ Name: getMinMaxSizes ]]
    -- upvalues: v5 (copy), v13 (copy), v14 (copy)
    local v50 = v5.setToVector3(v48);
    local v51 = (Vector3.new(1, 1, 1, 0) - v50) * 2048 * 10;
    local v52 = v47:getObjectsToTransform();
    local l_v13_0 = v13;
    local l_v14_0 = v14;
    local v55 = 2048;
    local v56 = 0.001;
    if #v52 == 1 and v52[1]:IsA("TrussPart") then
        v55 = 512;
        v56 = 2;
    end;
    for _, v58 in ipairs(v52) do
        l_v13_0 = l_v13_0:Max(v58.Size);
        l_v14_0 = l_v14_0:Min(v58.Size);
    end;
    local v59 = v5.maxComponent(l_v13_0 - v51);
    local v60 = v5.minComponent(l_v14_0 + v51);
    local v61 = v55 / v59;
    local v62 = v56 / v60;
    local v63 = v49:Max(v61 * v49 - v51);
    return v49:Min(v62 * v49 + v51), v63;
end;
v15._unjoinRoots = function(v64) --[[ Line: 162 ]] --[[ Name: _unjoinRoots ]]
    -- upvalues: v6 (copy)
    v64._reenableJointList = {};
    v64._adjustScaleJointList = {};
    for v65, v66 in v64._partToRootMap do
        for _, v68 in v65:GetJoints() do
            if v68:IsA("WeldConstraint") then
                local v69 = v6.getWeldConstraintCounterpart(v68, v65);
                if v64._partToRootMap[v69] ~= v66 then
                    v68.Enabled = false;
                    table.insert(v64._reenableJointList, v68);
                end;
            elseif v68:IsA("JointInstance") then
                local v70 = v6.getJointInstanceCounterpart(v68, v65);
                if v64._partToRootMap[v70] ~= v66 then
                    v68.Enabled = false;
                    table.insert(v64._reenableJointList, v68);
                    table.insert(v64._adjustScaleJointList, v68);
                end;
            end;
        end;
    end;
end;
v15._rejoinRoots = function(v71, v72) --[[ Line: 185 ]] --[[ Name: _rejoinRoots ]]
    for _, v74 in v71._adjustScaleJointList do
        v74.C0 = v74.C0.Rotation + v74.C0.Position * v72;
        v74.C1 = v74.C1.Rotation + v74.C1.Position * v72;
    end;
    for _, v76 in v71._reenableJointList do
        v76.Enabled = true;
    end;
    v71._reenableJointList = nil;
    v71._adjustScaleJointList = nil;
end;
v15.beginScale = function(v77, v78, v79, _) --[[ Line: 197 ]] --[[ Name: beginScale ]]
    -- upvalues: l_RunService_0 (copy), v4 (copy)
    local v81, v82, v83 = v77:getBoundingBox(v78, v79);
    v77._originalBoundingBoxSize = v83;
    v77._originalBoundingBoxCFrame = v81 * CFrame.new(v82);
    v77._initialSelectionInfo = v79;
    local v84 = nil;
    local v85, v86 = v79:getObjectsToTransform();
    v77._allParts = v85;
    v84 = v86;
    v85 = v79:getRootModelMapping();
    v77._partToRootMap = v85.PartToRootMap;
    v77._loosePartMap = v85.LoosePartMap;
    v77._rootModelMap = v85.RootModelMap;
    v77._originalDimensionMap = {};
    for v87 in v77._loosePartMap do
        v77._originalDimensionMap[v87] = v87.Size;
    end;
    for v88 in v77._rootModelMap do
        v77._originalDimensionMap[v88] = v88:GetScale();
    end;
    v77._isSinglePartMode = v79:isSelectionSinglePart();
    v77._jointMaker:pickUpParts(v77._allParts, v77._rootModelMap);
    if l_RunService_0:IsRunning() then
        v77._jointMaker:anchorParts();
    end;
    v77._jointMaker:breakJointsToOutsiders();
    v77:_unjoinRoots();
    v77:_recordLooseAttachmentFixup(v84);
    v77:_recordLoosePartFixup(v77._loosePartMap);
    if not v77._draggerContext:areCollisionsEnabled() then
        v77._temporaryTransparency = v4.new(v77._allParts);
    end;
    v77._lastDeltaSize = Vector3.new(0, 0, 0, 0);
end;
v15.getSoftSnaps = function(v89, v90, v91) --[[ Line: 241 ]] --[[ Name: getSoftSnaps ]]
    -- upvalues: v9 (copy), v5 (copy), v7 (copy)
    if v89._draggerContext:areCollisionsEnabled() then
        return {};
    else
        local v92, v93, v94 = v89:getBoundingBox(nil, v89._initialSelectionInfo);
        local v95 = nil;
        local v96 = nil;
        local v97 = v92:VectorToObjectSpace(v90);
        local l_Magnitude_0 = (v94 * v97).Magnitude;
        if v91 and not v9() then
            v95 = v92 * CFrame.new(v93) * v91;
            v96 = Vector3.one * 0.01;
        else
            v95 = v92 * CFrame.new(v93) + v90 * (0.5 * l_Magnitude_0);
            v96 = (v94 + Vector3.one * 0.2) * v5.complimentDirection(v97);
        end;
        local v99 = v89._draggerContext:getMaxSoftSnaps();
        return v7(v95, v96, v90, v89._initialSelectionInfo:getObjectsToTransform(), {
            -1, 
            1
        }, {
            1
        }, v99);
    end;
end;
local function _(v100, v101, v102) --[[ Line: 279 ]] --[[ Name: roundDownIfClose ]]
    local v103 = math.floor(v100 / v101) * v101;
    if v100 - v103 < v102 then
        return v103;
    else
        return v100;
    end;
end;
v15._maybeSnapPartSizeBackDownToGrid = function(v105, v106) --[[ Line: 293 ]] --[[ Name: _maybeSnapPartSizeBackDownToGrid ]]
    local v107 = v105._draggerContext:getGridSize();
    local l_X_0 = v106.X;
    local v109 = math.floor(l_X_0 / v107) * v107;
    local v110 = if l_X_0 - v109 < 0.001 then v109 else l_X_0;
    v109 = v106.Y;
    local v111 = math.floor(v109 / v107) * v107;
    l_X_0 = if v109 - v111 < 0.001 then v111 else v109;
    v111 = v106.Z;
    local v112 = math.floor(v111 / v107) * v107;
    return (Vector3.new(v110, l_X_0, if v111 - v112 < 0.001 then v112 else v111));
end;
local function _(v113) --[[ Line: 302 ]] --[[ Name: largestComponent ]]
    return (math.min(math.abs(v113.X), math.abs(v113.Y), (math.abs(v113.Z))));
end;
local function _(v115, v116) --[[ Line: 306 ]] --[[ Name: getFraction ]]
    local v117 = math.min(math.abs(v115.X), math.abs(v115.Y), (math.abs(v115.Z)));
    local v118 = math.min(math.abs(v116.X), math.abs(v116.Y), (math.abs(v116.Z)));
    if v118 == 0 then
        return 0;
    else
        return v117 / v118;
    end;
end;
local function _(v120, v121) --[[ Line: 317 ]] --[[ Name: safeDivideVectors ]]
    return (Vector3.new(v121.X == 0 and 1 or v120.X / v121.X, v121.Y == 0 and 1 or v120.Y / v121.Y, v121.Z == 0 and 1 or v120.Z / v121.Z));
end;
v15.updateScale = function(v123, v124, v125) --[[ Line: 328 ]] --[[ Name: updateScale ]]
    -- upvalues: v11 (copy)
    local v126 = nil;
    local l_v125_0 = v125;
    if v123._isSinglePartMode then
        local v128 = nil;
        local v129 = nil;
        local v130 = nil;
        local v131, v132 = next(v123._loosePartMap);
        v128 = v131;
        v129 = v132;
        v130 = v123._originalDimensionMap[v128];
        do
            local l_v128_0, l_v129_0, l_v130_0 = v128, v129, v130;
            v126 = function(v136) --[[ Line: 338 ]] --[[ Name: doResize ]]
                -- upvalues: v123 (copy), v124 (copy), l_v128_0 (ref), l_v130_0 (ref), l_v125_0 (ref), v125 (copy), l_v129_0 (ref)
                v123._lastDeltaSize = v124 * v136;
                l_v128_0.Size = l_v130_0 + v123._lastDeltaSize;
                l_v125_0 = v125 * v136;
                l_v128_0.CFrame = l_v129_0 * CFrame.new(l_v125_0);
            end;
        end;
    else
        local l__originalBoundingBoxCFrame_0 = v123._originalBoundingBoxCFrame;
        local l__originalBoundingBoxSize_0 = v123._originalBoundingBoxSize;
        local l_Position_0 = l__originalBoundingBoxCFrame_0.Position;
        local v140 = l__originalBoundingBoxCFrame_0:VectorToWorldSpace(v125);
        local v141 = (l__originalBoundingBoxSize_0 + v124).Magnitude / l__originalBoundingBoxSize_0.Magnitude;
        local v142 = {};
        for v143, v144 in v123._loosePartMap do
            v142[v143] = v140 + (v144.Position - l_Position_0) * (v141 - 1);
        end;
        for v145, v146 in v123._rootModelMap do
            v142[v145] = v140 + (v146.Position - l_Position_0) * (v141 - 1);
        end;
        v126 = function(v147) --[[ Line: 363 ]] --[[ Name: doResize ]]
            -- upvalues: v123 (copy), v124 (copy), l_v125_0 (ref), v125 (copy), v141 (copy), v142 (copy), v11 (ref)
            v123._lastDeltaSize = v124 * v147;
            l_v125_0 = v125 * v147;
            local v148 = 1 + v147 * (v141 - 1);
            local v149 = Vector3.new(v148, v148, v148);
            for v150, v151 in v123._loosePartMap do
                v150.CFrame = v151 + v142[v150] * v147;
                v150.Size = v123._originalDimensionMap[v150] * v149;
            end;
            if not v11() or v148 > 0 then
                for v152, v153 in v123._rootModelMap do
                    v152:PivotTo(v153 + v142[v152] * v147);
                    v152:ScaleTo(v123._originalDimensionMap[v152] * v148);
                end;
            end;
        end;
    end;
    if v123._draggerContext:areCollisionsEnabled() then
        local l__lastDeltaSize_0 = v123._lastDeltaSize;
        local v155 = math.min(math.abs(l__lastDeltaSize_0.X), math.abs(l__lastDeltaSize_0.Y), (math.abs(l__lastDeltaSize_0.Z)));
        local v156 = math.min(math.abs(v124.X), math.abs(v124.Y), (math.abs(v124.Z)));
        v123:_binarySearchForGoodPartSize(v126, v156 == 0 and 0 or v155 / v156, 1, true, 0.001 / math.max(math.min(math.abs(v124.X), math.abs(v124.Y), (math.abs(v124.Z))), 1));
    else
        v126(1);
    end;
    if v123._isSinglePartMode then
        local v157 = next(v123._loosePartMap);
        v157.Size = v123:_maybeSnapPartSizeBackDownToGrid(v157.Size);
    end;
    local l__originalBoundingBoxSize_1 = v123._originalBoundingBoxSize;
    local v159 = l__originalBoundingBoxSize_1 + v123._lastDeltaSize;
    local v160 = Vector3.new(l__originalBoundingBoxSize_1.X == 0 and 1 or v159.X / l__originalBoundingBoxSize_1.X, l__originalBoundingBoxSize_1.Y == 0 and 1 or v159.Y / l__originalBoundingBoxSize_1.Y, l__originalBoundingBoxSize_1.Z == 0 and 1 or v159.Z / l__originalBoundingBoxSize_1.Z);
    v123:_applyLoosePartFixup(v160, l_v125_0);
    v123:_applyLooseAttachmentFixup(v160, l_v125_0);
    v123._jointMaker:fixupConstraintLengths();
    if v123._draggerContext:shouldJoinSurfaces() then
        v123._jointPairs = v123._jointMaker:computeJointPairs();
    end;
    return v123._lastDeltaSize, l_v125_0;
end;
v15.endScale = function(v161) --[[ Line: 423 ]] --[[ Name: endScale ]]
    if v161._jointPairs then
        v161._jointPairs:createJoints();
        v161._jointPairs = nil;
    end;
    local v162 = v161._originalBoundingBoxSize + v161._lastDeltaSize;
    local l__originalBoundingBoxSize_2 = v161._originalBoundingBoxSize;
    local v164 = math.min(math.abs(v162.X), math.abs(v162.Y), (math.abs(v162.Z)));
    local v165 = math.min(math.abs(l__originalBoundingBoxSize_2.X), math.abs(l__originalBoundingBoxSize_2.Y), (math.abs(l__originalBoundingBoxSize_2.Z)));
    v161:_rejoinRoots(v165 == 0 and 0 or v164 / v165);
    v161._jointMaker:restoreAnchored();
    v161._jointMaker:putDownParts();
    if v161._temporaryTransparency then
        v161._temporaryTransparency:destroy();
        v161._temporaryTransparency = nil;
    end;
end;
v15.render = function(v166, v167, v168) --[[ Line: 440 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy)
    if v166._draggerContext:shouldJoinSurfaces() and v166._jointPairs then
        local v169 = v166._originalBoundingBoxCFrame * CFrame.new(v168);
        local v170 = v166._originalBoundingBoxSize + v167;
        local v171 = v3(v166._draggerContext, v169, v170);
        return v166._jointPairs:renderJoints(v171);
    else
        return nil;
    end;
end;
v15._binarySearchForGoodPartSize = function(v172, v173, v174, v175, v176, v177) --[[ Line: 458 ]] --[[ Name: _binarySearchForGoodPartSize ]]
    v173(v175);
    local v178 = v172._jointMaker:isColliding(v176);
    if not v178 then
        return;
    else
        local v179 = 0;
        local l_v174_0 = v174;
        local l_v175_0 = v175;
        for _ = 1, 32 do
            local v183 = 0.5 * (l_v174_0 + l_v175_0);
            v173(v183);
            v178 = v172._jointMaker:isColliding(v176);
            if v178 then
                v179 = v179 + 1;
                l_v175_0 = v183;
            else
                l_v174_0 = v183;
            end;
        end;
        if math.abs(l_v174_0 - v174) < v177 then
            v178 = true;
            l_v174_0 = v174;
        end;
        if v178 then
            v173(l_v174_0);
        end;
        return l_v174_0;
    end;
end;
v15._recordLooseAttachmentFixup = function(v184, v185) --[[ Line: 502 ]] --[[ Name: _recordLooseAttachmentFixup ]]
    local v186 = {};
    v184._fixupLooseAttachments = v186;
    local v187 = v184._originalBoundingBoxCFrame:Inverse();
    local function _(v188) --[[ Line: 507 ]] --[[ Name: trackLooseAttachment ]]
        -- upvalues: v187 (copy), v186 (copy)
        local v189 = v187 * v188.WorldCFrame;
        table.insert(v186, {
            Attachment = v188, 
            LocalRotation = v189.Rotation, 
            LocalPosition = v189.Position
        });
    end;
    for _, v192 in v185 do
        local v193 = v187 * v192.WorldCFrame;
        table.insert(v186, {
            Attachment = v192, 
            LocalRotation = v193.Rotation, 
            LocalPosition = v193.Position
        });
        for _, v195 in v192:GetDescendants() do
            if v195:IsA("Attachment") then
                local v196 = v187 * v195.WorldCFrame;
                table.insert(v186, {
                    Attachment = v195, 
                    LocalRotation = v196.Rotation, 
                    LocalPosition = v196.Position
                });
            end;
        end;
    end;
end;
v15._applyLooseAttachmentFixup = function(v197, v198, v199) --[[ Line: 528 ]] --[[ Name: _applyLooseAttachmentFixup ]]
    local l__originalBoundingBoxCFrame_1 = v197._originalBoundingBoxCFrame;
    for _, v202 in v197._fixupLooseAttachments do
        v202.Attachment.WorldCFrame = l__originalBoundingBoxCFrame_1 * CFrame.new(v199 + v202.LocalPosition * v198) * v202.LocalRotation;
    end;
end;
v15._recordLoosePartFixup = function(v203, v204) --[[ Line: 543 ]] --[[ Name: _recordLoosePartFixup ]]
    -- upvalues: v12 (copy)
    v203._fixupAttachments = {};
    v203._fixupNontrivialAttachments = {};
    v203._fixupOffsets = {};
    v203._fixupScales = {};
    v203._fixupPartPivot = {};
    for v205 in v204 do
        local v206 = v205.CFrame:Inverse();
        local l_PivotOffset_0 = v205.PivotOffset;
        if l_PivotOffset_0 ~= v12 then
            v203._fixupPartPivot[v205] = l_PivotOffset_0;
        end;
        for _, v209 in v205:GetDescendants() do
            if v209:IsA("Attachment") then
                if v209.Parent ~= v205 then
                    local v210 = v206 * v209.WorldCFrame;
                    local l_Position_1 = v210.Position;
                    local v212 = v210 - l_Position_1;
                    table.insert(v203._fixupNontrivialAttachments, {
                        Attachment = v209, 
                        RelativeTo = v205, 
                        LocalRotation = v212, 
                        LocalPosition = l_Position_1
                    });
                else
                    v203._fixupAttachments[v209] = v209.Position;
                end;
            elseif v209:IsA("DataModelMesh") then
                v203._fixupOffsets[v209] = v209.Offset;
                if v209.ClassName == "FileMesh" or v209:IsA("SpecialMesh") and v209.MeshType == Enum.MeshType.FileMesh then
                    v203._fixupScales[v209] = v209.Scale;
                end;
            end;
        end;
    end;
end;
v15._applyLoosePartFixup = function(v213, v214, _) --[[ Line: 588 ]] --[[ Name: _applyLoosePartFixup ]]
    for v216, v217 in v213._fixupAttachments do
        v216.Position = v217 * v214;
    end;
    for _, v219 in v213._fixupNontrivialAttachments do
        v219.Attachment.WorldCFrame = v219.RelativeTo.CFrame * CFrame.new(v219.LocalPosition * v214) * v219.LocalRotation;
    end;
    for v220, v221 in v213._fixupOffsets do
        v220.Offset = v221 * v214;
    end;
    for v222, v223 in v213._fixupScales do
        v222.Scale = v223 * v214;
    end;
    for v224, v225 in v213._fixupPartPivot do
        local l_Position_2 = v225.Position;
        v224.PivotOffset = v225 - l_Position_2 + l_Position_2 * v214;
    end;
end;
return v15;