local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v5 = require(l_Parent_0.util.pcallDeferred);
local v6 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v7 = require(l_Parent_0.validation.validateCoplanarIntersection);
local v8 = require(l_Parent_0.validation.validateOverlappingVertices);
local v9 = require(l_Parent_0.validation.validateCageUVs);
local v10 = require(l_Parent_0.validation.validateFullBodyCageDeletion);
local v11 = require(l_Parent_0.validation.validateMeshVertColors);
local v12 = require(l_Parent_0.validation.validateCageUVTriangleArea);
local v13 = require(l_Parent_0.validation.validateMeshTriangleArea);
local v14 = require(l_Parent_0.validation.validateCageUVValues);
local v15 = require(l_Parent_0.validation.validateTotalSurfaceArea);
local v16 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v17 = require(l_Parent_0.util.ParseContentIds);
local v18 = require(l_Parent_0.util.getMeshMinMax);
local v19 = require(l_Parent_0.util.getEditableMeshFromContext);
local v20 = require(l_Parent_0.util.floatEquals);
local v21 = require(l_Parent_0.util.getExpectedPartSize);
local v22 = require(l_Parent_0.util.getMeshIdForSkinningValidation);
local v23 = require(l_Parent_0.flags.getFFlagUGCValidateCoplanarTriTestBody);
local v24 = require(l_Parent_0.flags.getFFlagUGCValidateBodyPartsExtendedMeshTests);
local v25 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateBodyParts);
local v26 = require(l_Parent_0.flags.getFFlagUGCValidateCageUVTriangleArea);
local v27 = require(l_Parent_0.flags.getFFlagUGCValidateMeshTriangleAreaForCages);
local v28 = require(l_Parent_0.flags.getFFlagUGCValidateMeshTriangleAreaForMeshes);
local v29 = require(l_Parent_0.flags.getFFlagUGCValidateUVValuesInReference);
local v30 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v31 = require(l_Parent_0.flags.getFFlagUGCValidateTotalSurfaceAreaTestBody);
local function v44(v32, v33, v34, v35) --[[ Line: 46 ]] --[[ Name: validateIsSkinned ]]
    -- upvalues: v30 (copy), v3 (copy), v2 (copy), v25 (copy), l_UGCValidationService_0 (copy), v22 (copy)
    local v36 = nil;
    local v37 = nil;
    if v30() then
        local l_v32_Attribute_0 = v32:GetAttribute(v3.AlternateMeshIdAttributeName);
        if not v32.HasSkinnedMesh and (l_v32_Attribute_0 == nil or l_v32_Attribute_0 == "" or not v34) then
            v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_NoSkinningInfo, nil, v35);
            return false, {
                (("Missing skinning data for %*.MeshId. You need to skin your model."):format(v32.Name))
            };
        elseif not v25() then
            return true;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 70 ]]
                -- upvalues: l_UGCValidationService_0 (ref), v22 (ref), v32 (copy), v34 (copy)
                return l_UGCValidationService_0:ValidateSkinnedMesh(v22(v32, v34));
            end);
            v36 = l_status_0;
            v37 = l_result_0;
        end;
    elseif not v32.HasSkinnedMesh then
        v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_NoSkinningInfo, nil, v35);
        return false, {
            (("Missing skinning data for %*.MeshId. You need to skin your model."):format(v32.Name))
        };
    elseif not v25() then
        return true;
    else
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 87 ]]
            -- upvalues: l_UGCValidationService_0 (ref), v32 (copy)
            return l_UGCValidationService_0:ValidateSkinnedMesh(v32.MeshId);
        end);
        v36 = l_status_1;
        v37 = l_result_1;
    end;
    if not v36 then
        if v33 then
            error("Failed to retrieve mesh data to validate skinned mesh");
        end;
        v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_FailedToLoadMesh, nil, v35);
        return false, {
            "Failed to retrieve mesh data to validate skinned mesh"
        };
    elseif not v37 then
        local v43 = ("Detected mismatch between model and skinned data for %*. You need to re-skin your model to fix this issue."):format(v32.Name);
        if v33 then
            error(v43);
        end;
        v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_HasSkinnedMeshMismatch, nil, v35);
        return false, {
            v43
        };
    else
        return true;
    end;
end;
local function v64(v45, v46, v47) --[[ Line: 127 ]] --[[ Name: validateTotalAssetTriangles ]]
    -- upvalues: v3 (copy), v30 (copy), v6 (copy), v19 (copy), v2 (copy), v5 (copy), l_UGCValidationService_0 (copy)
    local l_isServer_0 = v47.isServer;
    local v49 = assert(v3.ASSET_RENDER_MESH_MAX_TRIANGLES[v46.Name]);
    local v61, v62, v63 = (function() --[[ Line: 135 ]] --[[ Name: calculateTotalAssetTriangles ]]
        -- upvalues: v45 (copy), v30 (ref), v6 (ref), v19 (ref), v47 (copy), v2 (ref), v5 (ref), l_UGCValidationService_0 (ref)
        local v50 = 0;
        for _, v52 in v45 do
            if v52.instance.ClassName == "MeshPart" then
                assert(v52.fieldName == "MeshId");
                local v53 = nil;
                local v54 = nil;
                if v30() and v6() then
                    local v55, v56 = v19(v52.instance, v52.fieldName, v47);
                    if not v55 then
                        v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_FailedToLoadMesh, nil, v47);
                        return false, string.format("Failed to load mesh for '%s'. Make sure mesh exists and try again.", v52.instance.Name);
                    else
                        local v57, v58 = v5(function() --[[ Line: 160 ]]
                            -- upvalues: l_UGCValidationService_0 (ref), v56 (copy)
                            return l_UGCValidationService_0:GetEditableMeshTriCount(v56);
                        end, v47);
                        v53 = v57;
                        v54 = v58;
                    end;
                else
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 164 ]]
                        -- upvalues: l_UGCValidationService_0 (ref), v52 (copy)
                        return l_UGCValidationService_0:GetMeshTriCount(v52.instance[v52.fieldName]);
                    end);
                    v53 = l_status_2;
                    v54 = l_result_2;
                end;
                if not v53 then
                    return false, string.format("Failed to execute check for triangle face information for mesh '%s'. Make sure mesh exists and try again.", v52.instance.Name);
                else
                    v50 = v50 + v54;
                end;
            end;
        end;
        return true, nil, v50;
    end)();
    if not v61 then
        if l_isServer_0 then
            error(v62);
        end;
        v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_FailedToCalculateTriangles, nil, v47);
        return false, {
            v62
        };
    elseif v49 < v63 then
        v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_TooManyTriangles, nil, v47);
        return false, {
            string.format("Mesh resolution of '%d' for '%s' is higher than max supported number of triangles '%d'. You need to retopologize your model to reduce the triangle count.", v63, v46.Name, v49)
        };
    else
        return true;
    end;
end;
local function v75(v65, v66, v67, v68) --[[ Line: 216 ]] --[[ Name: validateMeshIsAtOrigin ]]
    -- upvalues: v31 (copy), v23 (copy), v18 (copy), v2 (copy)
    local v69 = nil;
    local v70 = nil;
    if v31() or v23() then
        v69 = v66;
        v70 = v67;
    else
        local v71, v72, v73, v74 = v18(v65, v68);
        if not v71 then
            return v71, v72;
        else
            v69 = v73;
            v70 = v74;
        end;
    end;
    if (v69 + (v70 - v69) / 2).Magnitude > 0.001 then
        v2.reportFailure(v2.ErrorType.validateDescendantMeshMetrics_TooFarFromOrigin, nil, v68);
        return false, {
            string.format("Bounds for the mesh '%s' are not centered at the origin. The max allowed distance is '%f'", v65.fullName, 0.001)
        };
    else
        return true;
    end;
end;
return function(v76, v77) --[[ Line: 259 ]] --[[ Name: validateDescendantMeshMetrics ]]
    -- upvalues: v16 (copy), v17 (copy), v3 (copy), v64 (copy), v2 (copy), v30 (copy), v19 (copy), v31 (copy), v23 (copy), v18 (copy), v75 (copy), v20 (copy), v21 (copy), v15 (copy), v7 (copy), v11 (copy), v44 (copy), v28 (copy), v13 (copy), v24 (copy), v10 (copy), v9 (copy), v26 (copy), v12 (copy), v29 (copy), v14 (copy), v27 (copy), v8 (copy)
    local l_isServer_1 = v77.isServer;
    assert(v77.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateDescendantMeshMetrics");
    local l_assetTypeEnum_0 = v77.assetTypeEnum;
    local l_allowEditableInstances_0 = v77.allowEditableInstances;
    local v81 = v16.new();
    local v82 = v17.parse(v76, v3.MESH_CONTENT_ID_FIELDS, v77);
    local v83 = tick();
    v81:updateReasons(v64(v82, l_assetTypeEnum_0, v77));
    v2.recordScriptTime("validateTotalAssetTriangles", v83, v77);
    for _, v85 in v82 do
        local v86 = {
            fullName = v85.instance:GetFullName(), 
            fieldName = v85.fieldName, 
            contentId = v85.instance[v85.fieldName], 
            context = v85.instance.Name
        };
        if v30() then
            local v87, v88 = v19(v85.instance, v85.fieldName, v77);
            if not v87 then
                return false, {
                    string.format("Failed to load mesh for '%s'. Make sure mesh exists and try again.", v85.instance.Name)
                };
            else
                v86.editableMesh = v88;
            end;
        end;
        if v85.instance.ClassName == "MeshPart" then
            assert(v85.fieldName == "MeshId");
            local v89 = v31() or v23();
            local v90 = nil;
            local v91 = nil;
            local v92 = nil;
            local v93 = nil;
            if v89 then
                local v94, v95, v96, v97 = v18(v86, v77);
                v90 = v94;
                v91 = v95;
                v92 = v96;
                v93 = v97;
                if not v90 then
                    v81:updateReasons(false, v91);
                end;
            end;
            if not v89 or v90 then
                v83 = tick();
                v81:updateReasons(v75(v86, v92, v93, v77));
                v2.recordScriptTime("validateMeshIsAtOrigin", v83, v77);
            end;
            if v89 and v92 and v93 then
                local v98 = v93 - v92;
                if v20(v98.X, 0) or v20(v98.Y, 0) or v20(v98.Z, 0) then
                    v81:updateReasons(false, {
                        "Mesh size is zero for " .. v86.fullName .. ". You need to rescale your mesh."
                    });
                else
                    local v99 = nil;
                    v99 = if v30() then v21(v85.instance, v77) / v98 else v85.instance.Size / v98;
                    if v31() then
                        v81:updateReasons(v15(v86, v99, v77));
                    end;
                    if v23() then
                        v81:updateReasons(v7(v86, v99, v77));
                    end;
                end;
            end;
            v81:updateReasons(v11(v86, true, v77));
            v83 = tick();
            v81:updateReasons(v44(v85.instance, l_isServer_1, l_allowEditableInstances_0, v77));
            v2.recordScriptTime("validateIsSkinned", v83, v77);
            if v28() then
                v81:updateReasons(v13(v86, v77));
            end;
        elseif v85.instance.ClassName == "WrapTarget" then
            assert(v85.fieldName == "CageMeshId");
            v86.fullName = v86.fullName .. "OuterCage";
            if v24() then
                v81:updateReasons(v10(v86, v77));
            end;
            v81:updateReasons(v9(v86, v85.instance, v77));
            if v26() then
                v81:updateReasons(v12(v86, v77));
            end;
            if v29() then
                v81:updateReasons(v14(v86, v85.instance, v77));
            end;
            if v27() then
                v81:updateReasons(v13(v86, v77));
            end;
        end;
        if v24() then
            v81:updateReasons(v8(v86, v77));
        end;
    end;
    return v81:getFinalResults();
end;