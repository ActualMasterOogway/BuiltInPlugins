local l_Workspace_0 = game:GetService("Workspace");
local function v44(v1, v2, v3) --[[ Line: 3 ]] --[[ Name: computeBoundingBox ]]
    -- upvalues: l_Workspace_0 (copy)
    local v4 = v1:Inverse();
    local v5 = 1e999;
    local v6 = -1e999;
    local v7 = 1e999;
    local v8 = -1e999;
    local v9 = 1e999;
    local v10 = -1e999;
    local l_Terrain_0 = l_Workspace_0.Terrain;
    for _, v13 in ipairs(v2) do
        if v13 ~= l_Terrain_0 then
            local v14 = nil;
            local v15 = nil;
            if v13:IsA("FormFactorPart") then
                v14 = v13.CFrame;
                v15 = v13.Size;
            else
                v14 = v13.ExtentsCFrame;
                v15 = v13.ExtentsSize;
            end;
            local l_X_0 = v15.X;
            local l_Y_0 = v15.Y;
            local l_Z_0 = v15.Z;
            local v19 = v4 * v14;
            local _, _, _, v23, v24, v25, v26, v27, v28, v29, v30, v31 = v19:components();
            local v32 = 0.5 * (math.abs(l_X_0 * v23) + math.abs(l_Y_0 * v24) + math.abs(l_Z_0 * v25));
            local v33 = 0.5 * (math.abs(l_X_0 * v26) + math.abs(l_Y_0 * v27) + math.abs(l_Z_0 * v28));
            local v34 = 0.5 * (math.abs(l_X_0 * v29) + math.abs(l_Y_0 * v30) + math.abs(l_Z_0 * v31));
            local l_X_1 = v19.X;
            local l_Y_1 = v19.Y;
            local l_Z_1 = v19.Z;
            v5 = math.min(v5, l_X_1 - v32);
            v6 = math.max(v6, l_X_1 + v32);
            v7 = math.min(v7, l_Y_1 - v33);
            v8 = math.max(v8, l_Y_1 + v33);
            v9 = math.min(v9, l_Z_1 - v34);
            v10 = math.max(v10, l_Z_1 + v34);
        end;
    end;
    for _, v39 in ipairs(v3) do
        local v40 = v1:PointToObjectSpace(v39.WorldPosition);
        local l_X_2 = v40.X;
        local l_Y_2 = v40.Y;
        local l_Z_2 = v40.Z;
        v5 = math.min(v5, l_X_2);
        v6 = math.max(v6, l_X_2);
        v7 = math.min(v7, l_Y_2);
        v8 = math.max(v8, l_Y_2);
        v9 = math.min(v9, l_Z_2);
        v10 = math.max(v10, l_Z_2);
    end;
    return Vector3.new(0.5 * (v5 + v6), 0.5 * (v7 + v8), 0.5 * (v9 + v10)), (Vector3.new(v6 - v5, v8 - v7, v10 - v9));
end;
local function v113(v45, v46, v47) --[[ Line: 61 ]] --[[ Name: computeTwoBoundingBoxes ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_X_3 = v45.X;
    local l_Y_3 = v45.Y;
    local l_Z_3 = v45.Z;
    local v51 = v45:Inverse();
    local v52 = 1e999;
    local v53 = -1e999;
    local v54 = 1e999;
    local v55 = -1e999;
    local v56 = 1e999;
    local v57 = -1e999;
    local v58 = 1e999;
    local v59 = -1e999;
    local v60 = 1e999;
    local v61 = -1e999;
    local v62 = 1e999;
    local v63 = -1e999;
    local l_Terrain_1 = l_Workspace_0.Terrain;
    for _, v66 in ipairs(v46) do
        if v66 ~= l_Terrain_1 then
            local v67 = nil;
            local v68 = nil;
            if v66:IsA("FormFactorPart") then
                v67 = v66.CFrame;
                v68 = v66.Size;
            else
                v67 = v66.ExtentsCFrame;
                v68 = v66.ExtentsSize;
            end;
            local l_X_4 = v68.X;
            local l_Y_4 = v68.Y;
            local l_Z_4 = v68.Z;
            local v72 = v51 * v67;
            local _, _, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84 = v72:components();
            local v85 = 0.5 * (math.abs(l_X_4 * v76) + math.abs(l_Y_4 * v77) + math.abs(l_Z_4 * v78));
            local v86 = 0.5 * (math.abs(l_X_4 * v79) + math.abs(l_Y_4 * v80) + math.abs(l_Z_4 * v81));
            local v87 = 0.5 * (math.abs(l_X_4 * v82) + math.abs(l_Y_4 * v83) + math.abs(l_Z_4 * v84));
            local l_X_5 = v72.X;
            local l_Y_5 = v72.Y;
            local l_Z_5 = v72.Z;
            v52 = math.min(v52, l_X_5 - v85);
            v53 = math.max(v53, l_X_5 + v85);
            v54 = math.min(v54, l_Y_5 - v86);
            v55 = math.max(v55, l_Y_5 + v86);
            v56 = math.min(v56, l_Z_5 - v87);
            v57 = math.max(v57, l_Z_5 + v87);
            local v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102 = v67:components();
            v75 = v91;
            v75 = v92;
            v75 = v93;
            v76 = v94;
            v77 = v95;
            v78 = v96;
            v79 = v97;
            v80 = v98;
            v81 = v99;
            v82 = v100;
            v83 = v101;
            v84 = v102;
            v91 = 0.5 * (math.abs(l_X_4 * v76) + math.abs(l_Y_4 * v77) + math.abs(l_Z_4 * v78));
            v92 = 0.5 * (math.abs(l_X_4 * v79) + math.abs(l_Y_4 * v80) + math.abs(l_Z_4 * v81));
            v93 = 0.5 * (math.abs(l_X_4 * v82) + math.abs(l_Y_4 * v83) + math.abs(l_Z_4 * v84));
            v94 = v67.X;
            v95 = v67.Y;
            v96 = v67.Z;
            v58 = math.min(v58, v94 - v91);
            v59 = math.max(v59, v94 + v91);
            v60 = math.min(v60, v95 - v92);
            v61 = math.max(v61, v95 + v92);
            v62 = math.min(v62, v96 - v93);
            v63 = math.max(v63, v96 + v93);
        end;
    end;
    for _, v104 in ipairs(v47) do
        local l_WorldPosition_0 = v104.WorldPosition;
        local v106 = v51 * l_WorldPosition_0;
        local l_X_6 = v106.X;
        local l_Y_6 = v106.Y;
        local l_Z_6 = v106.Z;
        v52 = math.min(v52, l_X_6);
        v53 = math.max(v53, l_X_6);
        v54 = math.min(v54, l_Y_6);
        v55 = math.max(v55, l_Y_6);
        v56 = math.min(v56, l_Z_6);
        v57 = math.max(v57, l_Z_6);
        local l_X_7 = l_WorldPosition_0.X;
        local l_Y_7 = l_WorldPosition_0.Y;
        local l_Z_7 = l_WorldPosition_0.Z;
        v58 = math.min(v58, l_X_7);
        v59 = math.max(v59, l_X_7);
        v60 = math.min(v60, l_Y_7);
        v61 = math.max(v61, l_Y_7);
        v62 = math.min(v62, l_Z_7);
        v63 = math.max(v63, l_Z_7);
    end;
    return Vector3.new(0.5 * (v52 + v53), 0.5 * (v54 + v55), 0.5 * (v56 + v57)), Vector3.new(v53 - v52, v55 - v54, v57 - v56), Vector3.new(0.5 * (v58 + v59) - l_X_3, 0.5 * (v60 + v61) - l_Y_3, 0.5 * (v62 + v63) - l_Z_3), (Vector3.new(v59 - v58, v61 - v60, v63 - v62));
end;
local function v114(v115, v116, v117) --[[ Line: 150 ]] --[[ Name: markAttachmentRecursive ]]
    -- upvalues: v114 (copy)
    if v116[v115] then
        v117[v115] = nil;
        return;
    else
        v116[v115] = true;
        for _, v119 in ipairs(v115:GetChildren()) do
            v114(v119, v116, v117);
        end;
        return;
    end;
end;
local function v125(v120) --[[ Line: 160 ]] --[[ Name: findRootAttachmentMap ]]
    -- upvalues: v114 (copy)
    local v121 = {};
    local v122 = {};
    for _, v124 in ipairs(v120) do
        if not v122[v124] then
            v121[v124] = v124:FindFirstAncestorWhichIsA("BasePart");
            v114(v124, v122, v121);
        end;
    end;
    return v121;
end;
local v126 = {
    BasePart = "BasePart", 
    Model = "Model", 
    Attachment = "Attachment", 
    Bone = "Bone", 
    FaceInstance = "FaceInstance", 
    SurfaceGui = "FaceInstance", 
    Terrain = "Terrain"
};
local function v130(v127) --[[ Line: 184 ]] --[[ Name: collectTransformablesRemapClass ]]
    -- upvalues: v126 (copy)
    for v128, v129 in v126 do
        if v129 and v127:IsA(v128) then
            v126[v127.ClassName] = v129;
            return v129;
        end;
    end;
    v126[v127.ClassName] = false;
    return false;
end;
local function v131(v132, v133, v134) --[[ Line: 211 ]] --[[ Name: collectTransformablesRecursive ]]
    -- upvalues: v126 (copy), v130 (copy), v131 (copy)
    local v135 = v126[v132.ClassName];
    if v135 == nil then
        v135 = v130(v132);
    end;
    local v136 = nil;
    if v135 == "BasePart" then
        v136 = true;
        local l_PartSet_0 = v133.PartSet;
        if v134 and l_PartSet_0[v132] then
            return;
        else
            l_PartSet_0[v132] = true;
            v133.PartToRootMap[v132] = v132;
            v133.BasisObject = v132;
        end;
    elseif v135 == "Model" then
        v136 = true;
        local l_ModelSet_0 = v133.ModelSet;
        if v134 and l_ModelSet_0[v132] then
            return;
        else
            l_ModelSet_0[v132] = true;
            v133.BasisObject = v132;
        end;
    elseif v135 == "Attachment" then
        v133.AttachmentSet[v132] = true;
    elseif v135 == "Bone" then
        v133.BoneSet[v132] = true;
    elseif v135 == "FaceInstance" then
        v133.FaceInstanceSet[v132] = true;
    end;
    if v136 then
        local l_ModelSet_1 = v133.ModelSet;
        local l_PartSet_1 = v133.PartSet;
        local l_PartToRootMap_0 = v133.PartToRootMap;
        local v142 = 0;
        local l_RootToDescendantCountMap_0 = v133.RootToDescendantCountMap;
        for _, v145 in v132:GetDescendants() do
            local v146 = v126[v145.ClassName];
            if v146 == nil then
                v146 = v130(v145);
            end;
            if v146 == "BasePart" then
                l_PartSet_1[v145] = true;
                v142 = v142 + 1;
                l_PartToRootMap_0[v145] = v132;
                if v134 then
                    l_RootToDescendantCountMap_0[v145] = nil;
                end;
            elseif v146 == "Model" then
                l_ModelSet_1[v145] = true;
                v142 = v142 + 1;
                if v134 then
                    l_RootToDescendantCountMap_0[v145] = nil;
                end;
            elseif v146 == "Attachment" then
                v133.AttachmentSet[v145] = true;
            elseif v146 == "Bone" then
                v133.BoneSet[v145] = true;
            elseif v146 == "FaceInstance" then
                v133.FaceInstanceSet[v145] = true;
            end;
        end;
        l_RootToDescendantCountMap_0[v132] = v142;
        return;
    else
        for _, v148 in v132:GetChildren() do
            v131(v148, v133, v134);
        end;
        return;
    end;
end;
local function v154(v149) --[[ Line: 323 ]] --[[ Name: collectTransformables ]]
    -- upvalues: v131 (copy)
    local v150 = {
        RootToDescendantCountMap = {}, 
        PartToRootMap = {}, 
        PartSet = {}, 
        ModelSet = {}, 
        AttachmentSet = {}, 
        BoneSet = {}, 
        FaceInstanceSet = {}, 
        BasisObject = nil
    };
    for v151, v152 in v149 do
        local v153 = v151 ~= 1;
        v131(v152, v150, v153);
    end;
    return v150;
end;
local function _(v155) --[[ Line: 344 ]] --[[ Name: setToList ]]
    local v156 = {};
    for v157 in v155 do
        table.insert(v156, v157);
    end;
    return v156;
end;
local function v213(v159, v160) --[[ Line: 352 ]] --[[ Name: computeInfo ]]
    -- upvalues: v154 (copy), v125 (copy), v44 (copy), v113 (copy)
    local v161 = v159:isSimulating();
    local v162 = v159:shouldUseLocalSpace();
    local v163 = table.create(64);
    local v164 = {};
    local v165 = {};
    local v166 = {};
    local v167 = {};
    local v168 = {};
    local v169 = nil;
    local v170 = 0;
    local v171 = nil;
    local v172 = nil;
    local v173 = v154(v160);
    v164 = v173.PartSet;
    local l_v164_0 = v164;
    local v175 = {};
    for v176 in l_v164_0 do
        table.insert(v175, v176);
    end;
    v163 = v175;
    l_v164_0 = v173.ModelSet;
    v175 = {};
    for v177 in l_v164_0 do
        table.insert(v175, v177);
    end;
    v167 = v175;
    l_v164_0 = v173.AttachmentSet;
    v175 = {};
    for v178 in l_v164_0 do
        table.insert(v175, v178);
    end;
    v165 = v175;
    l_v164_0 = v173.BoneSet;
    v175 = {};
    for v179 in l_v164_0 do
        table.insert(v175, v179);
    end;
    v166 = v175;
    l_v164_0 = v173.FaceInstanceSet;
    v175 = {};
    for v180 in l_v164_0 do
        table.insert(v175, v180);
    end;
    v168 = v175;
    v171 = v173.RootToDescendantCountMap;
    v172 = v173.PartToRootMap;
    for _ in v173.RootToDescendantCountMap do
        v170 = v170 + 1;
    end;
    v169 = v173.BasisObject;
    l_v164_0 = {};
    v175 = v125(v165);
    for v182, v183 in pairs(v175) do
        if not v164[v183] then
            table.insert(l_v164_0, v182);
        end;
    end;
    local v184 = v125(v166);
    for v185, v186 in pairs(v184) do
        if not v164[v186] then
            table.insert(l_v164_0, v185);
        end;
    end;
    local v187 = nil;
    local v188 = nil;
    if v169 then
        v188 = v169:GetPivot();
        v187 = v170 ~= 1;
    elseif #l_v164_0 > 0 then
        v188 = l_v164_0[1].WorldCFrame;
        if #l_v164_0 > 1 then
            v187 = true;
        end;
    else
        v188 = CFrame.new();
        v187 = false;
    end;
    local v189 = {};
    for _, v191 in ipairs(v163) do
        v189[v191] = v191.CFrame;
    end;
    local v192 = false;
    if v161 then
        for _, v194 in ipairs(v163) do
            if not v194:IsGrounded() then
                v192 = true;
                break;
            end;
        end;
        if not v192 then
            for _, v196 in pairs(v175) do
                if not v196:IsGrounded() then
                    v192 = true;
                end;
            end;
            for _, v198 in pairs(v184) do
                if not v198:IsGrounded() then
                    v192 = true;
                end;
            end;
        end;
    end;
    for _, v200 in ipairs(v166) do
        table.insert(v165, v200);
    end;
    local l_v188_0 = v188;
    local v202 = nil;
    local v203 = nil;
    local v204 = nil;
    local v205 = nil;
    local v206 = nil;
    if v162 then
        local v207, v208 = v44(l_v188_0, v163, v165);
        v202 = v207;
        v203 = v208;
        v204 = l_v188_0;
        v205 = v202;
        v206 = v203;
    else
        local v209, v210, v211, v212 = v113(l_v188_0, v163, v165);
        v202 = v209;
        v203 = v210;
        v205 = v211;
        v206 = v212;
        v204 = CFrame.new(v188.Position);
    end;
    if v187 then
        l_v188_0 = l_v188_0 * CFrame.new(v202);
        v202 = Vector3.new();
        v204 = v204 * CFrame.new(v205);
        v205 = Vector3.new();
    end;
    return {
        basisCFrame = v204, 
        basisObject = v169, 
        boundingBoxSize = v206, 
        boundingBoxOffset = v205, 
        localBasisCFrame = l_v188_0, 
        localBoundingBoxSize = v203, 
        localBoundingBoxOffset = v202, 
        rootToDescendantCountMap = v171, 
        partToRootMap = v172, 
        parts = v163, 
        partSet = v164, 
        attachments = l_v164_0, 
        models = v167, 
        allAttachments = v165, 
        originalCFrameMap = v189, 
        hasPhysics = v192, 
        instancesWithConfigurableFace = v168
    };
end;
local v214 = {};
v214.__index = v214;
v214.new = function(v215, v216) --[[ Line: 560 ]] --[[ Name: new ]]
    -- upvalues: v213 (copy), v214 (copy)
    return (setmetatable(v213(v215, v216), v214));
end;
v214.getTransformedCopy = function(v217, v218) --[[ Line: 569 ]] --[[ Name: getTransformedCopy ]]
    -- upvalues: v214 (copy)
    local v219 = {};
    for v220, v221 in pairs(v217) do
        v219[v220] = v221;
    end;
    v219.basisCFrame = (v218 * v219.basisCFrame):Orthonormalize();
    v219.localBasisCFrame = (v218 * v219.localBasisCFrame):Orthonormalize();
    local v222 = {};
    for v223, v224 in pairs(v219.originalCFrameMap) do
        v222[v223] = (v218 * v224):Orthonormalize();
    end;
    v219.originalCFrameMap = v222;
    if v217._rootModelMapping then
        local v225 = table.clone(v217._rootModelMapping.LoosePartMap);
        local v226 = table.clone(v217._rootModelMapping.RootModelMap);
        for v227, v228 in v225 do
            v225[v227] = (v218 * v228):Orthonormalize();
        end;
        for v229, v230 in v226 do
            v226[v229] = (v218 * v230):Orthonormalize();
        end;
        v219._rootModelMapping = table.freeze({
            PartToRootMap = v217._rootModelMapping.PartToRootMap, 
            LoosePartMap = v225, 
            RootModelMap = v226
        });
    end;
    return (setmetatable(v219, v214));
end;
v214.isEmpty = function(v231) --[[ Line: 606 ]] --[[ Name: isEmpty ]]
    local v232 = false;
    if #v231.parts == 0 then
        v232 = #v231.attachments == 0;
    end;
    return v232;
end;
v214.getBoundingBox = function(v233) --[[ Line: 610 ]] --[[ Name: getBoundingBox ]]
    return v233.basisCFrame, v233.boundingBoxOffset, v233.boundingBoxSize;
end;
v214.doesContainItem = function(v234, v235) --[[ Line: 614 ]] --[[ Name: doesContainItem ]]
    return v234.partSet[v235] ~= nil;
end;
v214.isDynamic = function(v236) --[[ Line: 618 ]] --[[ Name: isDynamic ]]
    return v236.hasPhysics;
end;
v214.getOriginalCFrameMap = function(v237) --[[ Line: 627 ]] --[[ Name: getOriginalCFrameMap ]]
    return v237.originalCFrameMap;
end;
v214.getLocalBoundingBox = function(v238) --[[ Line: 635 ]] --[[ Name: getLocalBoundingBox ]]
    return v238.localBasisCFrame, v238.localBoundingBoxOffset, v238.localBoundingBoxSize;
end;
v214.getObjectsToTransform = function(v239) --[[ Line: 640 ]] --[[ Name: getObjectsToTransform ]]
    return v239.parts, v239.attachments, v239.models;
end;
v214.getRootMapping = function(v240) --[[ Line: 653 ]] --[[ Name: getRootMapping ]]
    return {
        RootToDescendantCountMap = v240.rootToDescendantCountMap, 
        PartToRootMap = v240.partToRootMap
    };
end;
v214.getBasisObject = function(v241) --[[ Line: 661 ]] --[[ Name: getBasisObject ]]
    return v241.basisObject;
end;
v214.getAllAttachments = function(v242) --[[ Line: 672 ]] --[[ Name: getAllAttachments ]]
    return v242.allAttachments;
end;
local function v243(v244, v245, v246, v247) --[[ Line: 676 ]] --[[ Name: collectLoosePartsRecursive ]]
    -- upvalues: v243 (copy)
    for _, v249 in v244:GetChildren() do
        if v249:IsA("BasePart") then
            v246[v249] = v249.CFrame;
            v245[v249] = v249;
            v243(v249, v245, v246, v247);
        elseif v249:IsA("Model") then
            v247[v249] = v249:GetPivot();
            for _, v251 in v249:GetDescendants() do
                if v251:IsA("BasePart") then
                    v245[v251] = v249;
                end;
            end;
        else
            v243(v249, v245, v246, v247);
        end;
    end;
end;
local function v258(v252) --[[ Line: 700 ]] --[[ Name: convertRootMappingToLooseParts ]]
    -- upvalues: v243 (copy)
    local v253 = table.clone(v252.PartToRootMap);
    local v254 = {};
    local v255 = {};
    for v256, _ in v252.RootToDescendantCountMap do
        if v256:IsA("BasePart") then
            v255[v256] = v256.CFrame;
            v243(v256, v253, v255, v254);
        else
            v254[v256] = v256:GetPivot();
        end;
    end;
    return v253, v255, v254;
end;
v214.getRootModelMapping = function(v259) --[[ Line: 722 ]] --[[ Name: getRootModelMapping ]]
    -- upvalues: v258 (copy)
    if not v259._rootModelMapping then
        local v260, v261, v262 = v258(v259:getRootMapping());
        v259._rootModelMapping = table.freeze({
            PartToRootMap = v260, 
            LoosePartMap = v261, 
            RootModelMap = v262
        });
    end;
    return v259._rootModelMapping;
end;
local _ = function(v263) --[[ Line: 734 ]] --[[ Name: computeIsSinglePart ]]
    local v264 = 0;
    local v265 = 0;
    for _ in v263.LoosePartMap do
        v264 = v264 + 1;
    end;
    for _ in v263.RootModelMap do
        v265 = v265 + 1;
    end;
    local v268 = false;
    if v264 == 1 then
        v268 = v265 == 0;
    end;
    return v268;
end;
v214.isSelectionSinglePart = function(v270) --[[ Line: 748 ]] --[[ Name: isSelectionSinglePart ]]
    local l__isSinglePart_0 = v270._isSinglePart;
    if l__isSinglePart_0 == nil then
        local v272 = v270:getRootModelMapping();
        local v273 = 0;
        local v274 = 0;
        for _ in v272.LoosePartMap do
            v273 = v273 + 1;
        end;
        for _ in v272.RootModelMap do
            v274 = v274 + 1;
        end;
        l__isSinglePart_0 = false;
        if v273 == 1 then
            l__isSinglePart_0 = v274 == 0;
        end;
        v270._isSinglePart = l__isSinglePart_0;
    end;
    return l__isSinglePart_0;
end;
return v214;