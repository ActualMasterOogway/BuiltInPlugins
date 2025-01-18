local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.util.pcallDeferred);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v4 = require(l_Parent_0.Analytics);
local v5 = require(l_Parent_0.Constants);
local v6 = require(l_Parent_0.validation.validateMeshComparison);
local v7 = require(l_Parent_0.util.getMeshSize);
local v8 = require(l_Parent_0.util.getEditableMeshFromContext);
local v9 = require(l_Parent_0.util.getExpectedPartSize);
local v10 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v11 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v12 = require(l_Parent_0.flags.getFFlagUGCValidateCageOrigin);
local v13 = require(l_Parent_0.flags.getFIntUGCValidateBodyPartMaxCageOrigin);
local v14 = if v12() then v13() / 100 else nil;
local function v24(v15, v16, v17, v18, v19, v20) --[[ Line: 33 ]] --[[ Name: getMeshInfoHelper ]]
    -- upvalues: v11 (copy), v8 (copy)
    local v21 = {
        fullName = v15:GetFullName(), 
        contentId = v17, 
        fieldName = v16, 
        context = v19, 
        scale = v18
    };
    if v11() then
        local v22, v23 = v8(v15, v16, v20);
        if not v22 then
            return false, v21;
        else
            v21.editableMesh = v23;
        end;
    end;
    return true, v21;
end;
local function v28(v25, v26, v27) --[[ Line: 61 ]] --[[ Name: getMeshInfo ]]
    -- upvalues: v24 (copy)
    if v25:IsA("WrapTarget") then
        return v24(v25, "CageMeshId", v25.CageMeshId, v26, v25.ClassName, v27);
    elseif v25:IsA("MeshPart") then
        return v24(v25, "MeshId", v25.MeshId, v26, v25.Name, v27);
    else
        return false;
    end;
end;
local function v37(v29, v30, v31) --[[ Line: 82 ]] --[[ Name: validateWrapTargetComparison ]]
    -- upvalues: v28 (copy), v6 (copy), v5 (copy)
    local v32, v33 = v28(v30, v29, v31);
    if not v32 then
        return false, {
            "Failed to load mesh data"
        };
    else
        local l_WrapTarget_0 = v30:FindFirstChildWhichIsA("WrapTarget");
        assert(l_WrapTarget_0, "Missing WrapTarget child for " .. v30.Name);
        local v35, v36 = v28(l_WrapTarget_0, v29, v31);
        if not v35 then
            return false, {
                "Failed to load mesh data"
            };
        else
            return v6(v33, v36, v5.RenderVsWrapMeshMaxDiff, v31);
        end;
    end;
end;
local function v49(v38, v39) --[[ Line: 107 ]] --[[ Name: calculateMeshSize ]]
    -- upvalues: v11 (copy), v8 (copy), v3 (copy), v2 (copy), v7 (copy), v4 (copy)
    local v40 = {
        fullName = v38:GetFullName(), 
        fieldName = "MeshId", 
        contentId = v38.MeshId, 
        context = v38.Name
    };
    if v11() then
        local v41, v42 = v8(v38, "MeshId", v39);
        if not v41 then
            return false, {
                string.format("Mesh for '%s' failed to load. Make sure the mesh exists and try again.", v40.fullName)
            };
        else
            v40.editableMesh = v42;
        end;
    end;
    local v43 = nil;
    local v44 = nil;
    if v3() then
        local v45, v46 = v2(function() --[[ Line: 135 ]]
            -- upvalues: v7 (ref), v40 (copy)
            return v7(v40);
        end, v39);
        v43 = v45;
        v44 = v46;
    else
        local l_status_0, l_result_0 = pcall(v7, v40);
        v43 = l_status_0;
        v44 = l_result_0;
    end;
    if not v43 then
        v4.reportFailure(v4.ErrorType.validateBodyPartMeshBounds_FailedToLoadMesh, nil, v39);
        if v39.isServer then
            error("Failed to read mesh");
        end;
        return false, {
            "Failed to read mesh"
        };
    else
        return true, nil, v44;
    end;
end;
local function v53(v50, v51) --[[ Line: 157 ]] --[[ Name: validateCageOrigin ]]
    -- upvalues: v12 (copy), v14 (copy), v4 (copy)
    assert(v12());
    local l_WrapTarget_1 = v50:FindFirstChildWhichIsA("WrapTarget");
    assert(l_WrapTarget_1, "Missing WrapTarget child for " .. v50.Name);
    if l_WrapTarget_1.CageOrigin.Position.Magnitude > v14 then
        v4.reportFailure(v4.ErrorType.validateBodyPart_CageOriginOutOfBounds, nil, v51);
        return false, {
            string.format("WrapTarget %s found under %s has a CageOrigin position greater than %.2f. You need to set CageOrigin.Position to 0,0,0.", l_WrapTarget_1.Name, v50.Name, v14)
        };
    else
        return true;
    end;
end;
local function v62(v54, v55) --[[ Line: 182 ]] --[[ Name: validateInternal ]]
    -- upvalues: v49 (copy), v11 (copy), v9 (copy), v10 (copy), v12 (copy), v53 (copy), v37 (copy), v4 (copy)
    local v56 = tick();
    local v57, v58, v59 = v49(v54, v55);
    if not v57 or not v59 then
        return v57, v58;
    else
        local v60 = nil;
        v60 = if v11() then v9(v54, v55) / v59 else v54.Size / v59;
        local v61 = v10.new();
        if v12() then
            v61:updateReasons(v53(v54, v55));
        end;
        v61:updateReasons(v37(v60, v54, v55));
        v4.recordScriptTime(script.Name, v56, v55);
        return v61:getFinalResults();
    end;
end;
return function(v63, v64) --[[ Line: 210 ]] --[[ Name: validateBodyPartMeshBounds ]]
    -- upvalues: v5 (copy), v62 (copy), v10 (copy)
    local l_assetTypeEnum_0 = v64.assetTypeEnum;
    local v66 = v5.ASSET_TYPE_INFO[l_assetTypeEnum_0];
    if Enum.AssetType.DynamicHead == l_assetTypeEnum_0 then
        return v62(v63, v64);
    else
        local v67 = v10.new();
        for v68 in pairs(v66.subParts) do
            local l_v63_FirstChild_0 = v63:FindFirstChild(v68);
            assert(l_v63_FirstChild_0);
            v67:updateReasons(v62(l_v63_FirstChild_0, v64));
        end;
        return v67:getFinalResults();
    end;
end;