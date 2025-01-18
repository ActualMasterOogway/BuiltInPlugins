local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.ConstantsInterface);
local v3 = require(l_Parent_0.util.AssetCalculator);
local v4 = require(l_Parent_0.util.getPartNamesInHierarchyOrder);
local v5 = require(l_Parent_0.util.getMeshMinMax);
local v6 = require(l_Parent_0.util.getMeshVerts);
local v7 = require(l_Parent_0.util.getMeshInfo);
local v8 = require(l_Parent_0.util.BoundsDataUtils);
local v9 = require(l_Parent_0.util.getExpectedPartSize);
local v10 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v11 = require(l_Parent_0.flags.getFFlagUGCValidateStraightenLimbs);
local v12 = require(l_Parent_0.flags.getFFlagUGCValidateCalculateScaleToValidateBounds);
local v13 = require(l_Parent_0.flags.getFFlagUGCValidateUseMeshSizeProperty);
local v14 = require(l_Parent_0.flags.getFFlagUGCValidateUseDataCache);
local v15 = {};
local function v22(v16, v17, v18) --[[ Line: 36 ]] --[[ Name: orientSingleAssetToWorldAxes ]]
    -- upvalues: v11 (copy), v3 (copy)
    if v17 ~= Enum.AssetType.LeftArm and v17 ~= Enum.AssetType.RightArm and v17 ~= Enum.AssetType.LeftLeg and v17 ~= Enum.AssetType.RightLeg then
        return;
    else
        local v19 = nil;
        v19 = if v11() then v3.calculateStraightenedLimb(v17, v16, v18) else v3.calculatePartsLocalToAsset(v17, v16);
        for v20, v21 in v19 do
            v16[v20] = v21;
        end;
        return;
    end;
end;
local function v38(v23, v24) --[[ Line: 62 ]] --[[ Name: orientFullBodyArmsLegsToWorldAxes ]]
    -- upvalues: v22 (copy), v4 (copy), v2 (copy)
    local function v37(v25, v26) --[[ Line: 63 ]] --[[ Name: orientAndMoveParts ]]
        -- upvalues: v22 (ref), v23 (copy), v24 (copy), v4 (ref), v2 (ref)
        v22(v23, v25, v24);
        local v27 = v4(v25);
        local v28 = v24(v27[1]);
        local v29 = v2.getRigAttachmentToParent(v25, v28.Name);
        local l_v28_FirstChild_0 = v28:FindFirstChild(v29);
        assert(l_v28_FirstChild_0);
        local v31 = v23[v28.Name] * l_v28_FirstChild_0.CFrame;
        local v32 = v24(v26);
        assert(v32);
        local l_v32_FirstChild_0 = v32:FindFirstChild(v29);
        assert(l_v32_FirstChild_0);
        local v34 = (v23[v32.Name] * l_v32_FirstChild_0.CFrame).Position - v31.Position;
        for _, v36 in v27 do
            v23[v36] = CFrame.new(v23[v36].Position + v34) * v23[v36].Rotation;
        end;
    end;
    v37(Enum.AssetType.LeftArm, "UpperTorso");
    v37(Enum.AssetType.RightArm, "UpperTorso");
    v37(Enum.AssetType.LeftLeg, "LowerTorso");
    v37(Enum.AssetType.RightLeg, "LowerTorso");
end;
local function v64(v39, v40, v41, v42, v43) --[[ Line: 94 ]] --[[ Name: calculateBoundsDataForPart ]]
    -- upvalues: v14 (copy), v13 (copy), v5 (copy), v10 (copy), v9 (copy), v6 (copy), v8 (copy), v2 (copy), v12 (copy)
    if v14() then
        assert(v39 ~= nil ~= (v43 ~= nil));
    end;
    local v44 = nil;
    if v13() then
        v44 = v40.MeshSize;
    else
        if v14() and v43 then
            if v43.meshData and v43.meshData[v40.MeshId] then
                local l_meshMin_0 = v43.meshData[v40.MeshId].meshMin;
                local l_meshMax_0 = v43.meshData[v40.MeshId].meshMax;
                if l_meshMin_0 and l_meshMax_0 then
                    v44 = l_meshMax_0 - l_meshMin_0;
                end;
            end;
            if not v44 then
                return false, {
                    "Mesh bounds not found in data cache"
                };
            end;
        end;
        if not v14() or not v44 then
            local v47, v48, v49, v50 = v5(v39, v42);
            if not v47 then
                return v47, v48;
            else
                v44 = v50 - v49;
            end;
        end;
    end;
    local v51 = (if v10() then v9(v40, v42) else v40.Size) / v44;
    local v52 = nil;
    if v14() and v43 then
        if v43.meshData and v43.meshData[v40.MeshId] then
            local l_verts_0 = v43.meshData[v40.MeshId].verts;
            if l_verts_0 then
                v52 = l_verts_0;
            end;
        end;
        if not v52 then
            return false, {
                "Verts not found in data cache"
            };
        end;
    end;
    if not v14() or not v52 then
        local v54, v55, v56 = v6(v39, v42);
        if not v54 then
            return v54, v55;
        else
            v52 = v56;
        end;
    end;
    local v57 = {};
    for _, v59 in v52 do
        v8.expandMeshBounds(v57, v41:PointToWorldSpace(v59 * v51));
    end;
    for _, v61 in v2.getAttachments(nil, v40.Name) do
        local v62 = nil;
        if v12() then
            if string.match(v61, "RigAttachment$") ~= nil then
                v62 = v40:FindFirstChild(v61);
                assert(v62);
            else
                continue;
            end;
        else
            v62 = v40:FindFirstChild(v61);
            assert(v62);
            if string.match(v62.Name, "RigAttachment$") == nil then
                continue;
            end;
        end;
        local v63 = v41 * v62.CFrame;
        v8.expandRigAttachmentBounds(v57, v63.Position);
    end;
    v8.setOverallBounds(v57);
    return true, nil, v57;
end;
local function v80(v65, v66, v67, v68) --[[ Line: 193 ]] --[[ Name: calculateAllPartsBoundsData ]]
    -- upvalues: v14 (copy), v7 (copy), v64 (copy)
    local v69 = {};
    for v70, v71 in v65 do
        local v72 = v66(v70);
        local v73 = nil;
        if not v14() or not v68 then
            local v74, v75, v76 = v7(v72, v67);
            if not v74 then
                return v74, v75;
            else
                v73 = v76;
            end;
        end;
        local v77, v78, v79 = v64(v73, v72, v71, v67, v68);
        if not v77 then
            return v77, v78;
        else
            v69[v70] = v79;
        end;
    end;
    return true, nil, v69;
end;
local function v90(v81, v82, v83) --[[ Line: 222 ]] --[[ Name: calculateTotalBoundsForAsset ]]
    -- upvalues: v80 (copy), v8 (copy)
    local v84, v85, v86 = v80(v81, v82, v83);
    if not v84 then
        return v84, v85;
    else
        local v87 = {};
        for _, v89 in v86 do
            v87 = v8.combineBounds(v87, v89);
        end;
        return true, nil, v87;
    end;
end;
local function v98(v91, v92) --[[ Line: 241 ]] --[[ Name: calculatePartBounds ]]
    -- upvalues: v90 (copy)
    local v93 = {
        [v91.Name] = CFrame.new()
    };
    local v95, v96, v97 = v90(v93, function(v94) --[[ Line: 246 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: v91 (copy)
        assert(v94 == v91.Name);
        return v91;
    end, v92);
    if not v95 then
        return v95, v96;
    else
        return true, nil, v97;
    end;
end;
v15.calculateAssetBounds = function(v99, v100) --[[ Line: 260 ]] --[[ Name: calculateAssetBounds ]]
    -- upvalues: v98 (copy), v3 (copy), v22 (copy), v90 (copy)
    local l_assetTypeEnum_0 = v100.assetTypeEnum;
    assert(l_assetTypeEnum_0);
    if l_assetTypeEnum_0 == Enum.AssetType.DynamicHead then
        return v98(v99, v100);
    else
        local v102 = v3.calculateAllTransformsForAsset(l_assetTypeEnum_0, v99);
        local function v104(v103) --[[ Line: 273 ]] --[[ Name: findMeshHandle ]]
            -- upvalues: v99 (copy)
            return (v99:FindFirstChild(v103));
        end;
        v22(v102, l_assetTypeEnum_0, v104);
        local v105, v106, v107 = v90(v102, v104, v100);
        if not v105 then
            return v105, v106;
        else
            return true, nil, v107;
        end;
    end;
end;
v15.calculateIndividualAssetPartsData = function(v108, v109) --[[ Line: 289 ]] --[[ Name: calculateIndividualAssetPartsData ]]
    -- upvalues: v3 (copy), v22 (copy), v80 (copy)
    local l_assetTypeEnum_1 = v109.assetTypeEnum;
    assert(l_assetTypeEnum_1);
    local v111 = v3.calculateAllTransformsForAsset(l_assetTypeEnum_1, v108);
    local function v113(v112) --[[ Line: 298 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: l_assetTypeEnum_1 (copy), v108 (copy)
        if l_assetTypeEnum_1 == Enum.AssetType.DynamicHead then
            return v108;
        else
            return (v108:FindFirstChild(v112));
        end;
    end;
    v22(v111, l_assetTypeEnum_1, v113);
    local v114, v115, v116 = v80(v111, v113, v109);
    if not v114 then
        return v114, v115;
    else
        local v117 = {};
        for v118, v119 in v116 do
            v117[v118] = {
                boundsData = v119, 
                cframe = v111[v118]
            };
        end;
        return true, nil, v117;
    end;
end;
v15.calculateIndividualFullBodyPartsData = function(v120, v121, v122) --[[ Line: 323 ]] --[[ Name: calculateIndividualFullBodyPartsData ]]
    -- upvalues: v3 (copy), v38 (copy), v80 (copy)
    local function v124(v123) --[[ Line: 328 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: v120 (copy)
        return v120[v123];
    end;
    local v125 = v3.calculateAllTransformsForFullBody(v120);
    v38(v125, v124);
    local v126, v127, v128 = v80(v125, v124, v121, v122);
    if not v126 then
        return v126, v127;
    else
        local v129 = {};
        for v130, v131 in v128 do
            v129[v130] = {
                boundsData = v131, 
                cframe = v125[v130]
            };
        end;
        return true, nil, v129;
    end;
end;
v15.calculateFullBodyBounds = function(v132, v133) --[[ Line: 349 ]] --[[ Name: calculateFullBodyBounds ]]
    -- upvalues: v3 (copy), v38 (copy), v90 (copy)
    local function v135(v134) --[[ Line: 353 ]] --[[ Name: findMeshHandle ]]
        -- upvalues: v132 (copy)
        return v132[v134];
    end;
    local v136 = v3.calculateAllTransformsForFullBody(v132);
    v38(v136, v135);
    local v137, v138, v139 = v90(v136, v135, v133);
    if not v137 then
        return v137, v138;
    else
        return true, nil, v139;
    end;
end;
return v15;