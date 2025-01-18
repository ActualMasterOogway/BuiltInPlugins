local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.ConstantsInterface);
local v4 = require(l_Parent_0.util.prettyPrintVector3);
local _ = require(l_Parent_0.util.Types);
local v6 = require(l_Parent_0.util.AssetTraversalUtils);
local v7 = require(l_Parent_0.util.BoundsCalculator);
local v8 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v9 = require(l_Parent_0.validation.validateScaleType);
local v10 = require(l_Parent_0.flags.getFFlagUGCValidateOrientedSizing);
local v11 = require(l_Parent_0.flags.getFFlagUGCValidateConfigurableFullBodyBounds);
local l_assetHierarchy_0 = v6.assetHierarchy;
local v13 = {
    root = "LowerTorso", 
    children = {
        UpperTorso = {
            children = {
                Head = l_assetHierarchy_0[Enum.AssetType.DynamicHead], 
                LeftUpperArm = l_assetHierarchy_0[Enum.AssetType.LeftArm], 
                RightUpperArm = l_assetHierarchy_0[Enum.AssetType.RightArm]
            }
        }, 
        LeftUpperLeg = l_assetHierarchy_0[Enum.AssetType.LeftLeg], 
        RightUpperLeg = l_assetHierarchy_0[Enum.AssetType.RightLeg]
    }
};
local function v24(v14, v15, v16, v17) --[[ Line: 42 ]] --[[ Name: forEachMeshPart ]]
    -- upvalues: v2 (copy)
    local v18 = v15 and v16;
    assert(v14 ~= nil ~= (v18 ~= nil));
    if v14 then
        for _, v20 in v14 do
            if not v17(v20) then
                return false;
            end;
        end;
    else
        local v21 = v2.ASSET_TYPE_INFO[v16];
        assert(v21);
        if Enum.AssetType.DynamicHead == v16 then
            return v17(v15);
        else
            for v22 in pairs(v21.subParts) do
                local l_v15_FirstChild_0 = v15:FindFirstChild(v22);
                assert(l_v15_FirstChild_0);
                if not v17(l_v15_FirstChild_0) then
                    return false;
                end;
            end;
        end;
    end;
    return true;
end;
local function v35(v25, v26, v27, v28) --[[ Line: 76 ]] --[[ Name: getScaleType ]]
    -- upvalues: v24 (copy), v1 (copy), v9 (copy)
    local v29 = v26 and v27;
    assert(v25 ~= nil ~= (v29 ~= nil));
    local v30 = nil;
    if not v24(v25, v26, v27, function(v31) --[[ Line: 86 ]]
        -- upvalues: v30 (ref)
        local l_AvatarPartScaleType_0 = v31:FindFirstChild("AvatarPartScaleType");
        assert(l_AvatarPartScaleType_0);
        if not v30 then
            v30 = l_AvatarPartScaleType_0;
            return true;
        else
            return v30.Value == l_AvatarPartScaleType_0.Value;
        end;
    end) then
        v1.reportFailure(v1.ErrorType.validateAssetBounds_InconsistentAvatarPartScaleType, nil, v28);
        return false, {
            "All MeshParts must have the same value in their AvatarPartScaleType child. Please verify the values match."
        }, nil;
    else
        local v33, v34 = v9(v30, v28);
        return v33, v34, if v33 then v30.Value else nil;
    end;
end;
local function v50(v36, v37, v38, v39, v40) --[[ Line: 114 ]] --[[ Name: validateMinBoundsInternal ]]
    -- upvalues: v10 (copy), v8 (copy), v1 (copy), v4 (copy)
    if v10() then
        local v41 = v8.new();
        local v42 = false;
        local v43 = v39.maxMeshCorner - v39.minMeshCorner;
        for _, v45 in {
            "X", 
            "Y", 
            "Z"
        } do
            local v46 = v43[v45];
            local v47 = v37[v45];
            local v48 = v47 <= v46;
            if not v48 and not v42 then
                v1.reportFailure(v1.ErrorType.validateAssetBounds_AssetSizeTooSmall, nil, v40);
                v42 = true;
            end;
            v41:updateReasons(v48, {
                string.format("%s meshes %s axis size of '%.2f' is smaller than the min allowed bounding box %s axis size of '%.2f'. You need to scale up the meshes.", if v38 then v38.Name else "Full body", v45, v46, v45, v47)
            });
        end;
        return v41:getFinalResults();
    else
        local v49 = false;
        if v36.X >= v37.X then
            v49 = false;
            if v36.Y >= v37.Y then
                v49 = v36.Z >= v37.Z;
            end;
        end;
        if not v49 then
            v1.reportFailure(v1.ErrorType.validateAssetBounds_AssetSizeTooSmall, nil, v40);
            return false, {
                if not v38 then string.format("Full body size is smaller than the min allowed bounding size of '%s'. You need to scale up or remodel the asset.", v4(v37)) else string.format("%s asset size is smaller than the min allowed bounding size of '%s'. You need to scale up or remodel the asset.", v38.Name, v4(v37))
            };
        else
            return true;
        end;
    end;
end;
local function v65(v51, v52, v53, v54, v55) --[[ Line: 178 ]] --[[ Name: validateMaxBoundsInternal ]]
    -- upvalues: v10 (copy), v8 (copy), v1 (copy), v4 (copy)
    if v10() then
        local v56 = v8.new();
        local v57 = false;
        local v58 = v54.maxOverall - v54.minOverall;
        for _, v60 in {
            "X", 
            "Y", 
            "Z"
        } do
            local v61 = v58[v60];
            local v62 = v52[v60];
            local v63 = v61 <= v62;
            if not v63 and not v57 then
                v1.reportFailure(v1.ErrorType.validateAssetBounds_AssetSizeTooBig, nil, v55);
                v57 = true;
            end;
            v56:updateReasons(v63, {
                string.format("%s meshes and joints %s axis size of '%.2f' is larger than the max allowed bounding box %s axis size of '%.2f'. You need to scale down the meshes/joints", if v53 then v53.Name else "Full body", v60, v61, v60, v62)
            });
        end;
        return v56:getFinalResults();
    else
        local v64 = false;
        if v51.X <= v52.X then
            v64 = false;
            if v51.Y <= v52.Y then
                v64 = v51.Z <= v52.Z;
            end;
        end;
        if not v64 then
            v1.reportFailure(v1.ErrorType.validateAssetBounds_AssetSizeTooBig, nil, v55);
            return false, {
                if not v53 then string.format("Full body size is larger than the max allowed bounding size of '%s'. You need to scale down or remodel the asset.", v4(v52)) else string.format("%s asset size is larger than the max allowed bounding size of '%s'. You need to scale down or remodel the asset.", v53.Name, v4(v52))
            };
        else
            return true;
        end;
    end;
end;
return function(v66, v67, v68) --[[ Line: 239 ]] --[[ Name: validateAssetBounds ]]
    -- upvalues: v10 (copy), v7 (copy), v6 (copy), v13 (copy), l_assetHierarchy_0 (copy), v35 (copy), v8 (copy), v11 (copy), v2 (copy), v3 (copy), v50 (copy), v65 (copy), v1 (copy)
    local v69 = tick();
    local v70 = nil;
    v70 = if v10() then v68.assetTypeEnum else if v68 then v68.assetTypeEnum else nil;
    local v71 = v67 and v70;
    assert(v66 ~= nil ~= (v71 ~= nil));
    local v72 = {};
    if v10() then
        local v73 = nil;
        local v74 = nil;
        local v75 = nil;
        if v66 then
            local v76, v77, v78 = v7.calculateFullBodyBounds(v66, v68);
            v73 = v76;
            v74 = v77;
            v75 = v78;
        else
            local v79, v80, v81 = v7.calculateAssetBounds(v67, v68);
            v73 = v79;
            v74 = v80;
            v75 = v81;
        end;
        if not v73 then
            return v73, v74;
        else
            v72 = v75;
        end;
    elseif v66 then
        v6.traverseHierarchy(v66, nil, nil, nil, CFrame.new(), v13.root, v13, v72, v68);
    elseif Enum.AssetType.DynamicHead == v70 then
        v6.calculateBounds(v70, v67, CFrame.new(), v72, v68);
    else
        local v82 = l_assetHierarchy_0[v70];
        v6.traverseHierarchy(nil, v67, v70, nil, CFrame.new(), v82.root, v82, v72, v68);
    end;
    local v83, v84, v85 = v35(v66, v67, v70, v68);
    if not v83 then
        return v83, v84;
    else
        local v86 = v8.new();
        local v87 = nil;
        local v88 = nil;
        if v66 then
            if v11() then
                v87 = v2.FULL_BODY_BOUNDS[v85].minSize;
                v88 = v2.FULL_BODY_BOUNDS[v85].maxSize;
            else
                local v89, v90 = v3.calculateFullBodyBounds(v85);
                v87 = v89;
                v88 = v90;
            end;
        else
            v87 = v2.ASSET_TYPE_INFO[v70].bounds[v85].minSize;
            v88 = v2.ASSET_TYPE_INFO[v70].bounds[v85].maxSize;
        end;
        v86:updateReasons(v50(v72.maxMeshCorner - v72.minMeshCorner, v87, v70, v72, v68));
        v86:updateReasons(v65(v72.maxOverall - v72.minOverall, v88, v70, v72, v68));
        if v10() or v68 then
            v1.recordScriptTime(script.Name, v69, v68);
        end;
        return v86:getFinalResults();
    end;
end;