local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.flags.getFFlagDebugUGCDisableSurfaceAppearanceTests);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidateBodyPartsCollisionFidelity);
local v4 = require(l_Parent_0.flags.getFFlagUGCValidateBodyPartsModeration);
local v5 = require(l_Parent_0.flags.getFFlagRefactorValidateAssetTransparency);
local v6 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v7 = require(l_Parent_0.flags.getFFlagUGCValidateOrientedSizing);
local v8 = require(l_Parent_0.validation.validateBodyPartMeshBounds);
local v9 = require(l_Parent_0.validation.validateAssetBounds);
local v10 = require(l_Parent_0.validation.validateBodyPartChildAttachmentBounds);
local v11 = require(l_Parent_0.validation.validateDependencies);
local v12 = require(l_Parent_0.validation.validateDescendantMeshMetrics);
local v13 = require(l_Parent_0.validation.validateDescendantTextureMetrics);
local v14 = require(l_Parent_0.validation.validateSurfaceAppearances);
local v15 = require(l_Parent_0.validation.validateMaterials);
local v16 = require(l_Parent_0.validation.validateTags);
local v17 = require(l_Parent_0.validation.validateProperties);
local v18 = require(l_Parent_0.validation.validateAttributes);
local v19 = require(l_Parent_0.validation.validateHSR);
local v20 = require(l_Parent_0.validation.validateBodyPartCollisionFidelity);
local v21 = require(l_Parent_0.validation.validateModeration);
local v22 = require(l_Parent_0.validation.validateAssetTransparency);
local v23 = require(l_Parent_0.validation.DEPRECATED_validateAssetTransparency);
local v24 = require(l_Parent_0.validation.validatePose);
local v25 = require(l_Parent_0.util.validateWithSchema);
local v26 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v27 = require(l_Parent_0.util.resetPhysicsData);
local _ = require(l_Parent_0.util.Types);
return function(v29, v30, v31) --[[ Line: 41 ]] --[[ Name: validateMeshPartBodyPart ]]
    -- upvalues: v25 (copy), v1 (copy), v2 (copy), v14 (copy), v11 (copy), v27 (copy), v26 (copy), v8 (copy), v10 (copy), v7 (copy), v24 (copy), v9 (copy), v12 (copy), v13 (copy), v19 (copy), v6 (copy), v5 (copy), v22 (copy), v23 (copy), v15 (copy), v17 (copy), v3 (copy), v20 (copy), v16 (copy), v18 (copy), v4 (copy), v21 (copy)
    local l_isServer_0 = v31.isServer;
    local l_assetTypeEnum_0 = v31.assetTypeEnum;
    local l_allowUnreviewedAssets_0 = v31.allowUnreviewedAssets;
    local v35 = if v31.bypassFlags then v31.bypassFlags.skipSnapshot else false;
    local l_restrictedUserIds_0 = v31.restrictedUserIds;
    local v37 = v25(v30, v29, v31);
    if not v37.success then
        v1.reportFailure(v1.ErrorType.validateMeshPartBodyPart_ValidateWithSchema, nil, v31);
        return false, {
            string.format("Body part '%s' does not follow R15 schema. The specific issues are: ", v29.Name), 
            v37.message
        };
    else
        if not v2() then
            local v38, v39 = v14(v29, v31);
            if not v38 then
                return v38, v39;
            end;
        end;
        local v40, v41 = v11(v29, v31);
        if not v40 then
            return v40, v41;
        else
            v40, v41 = v27({
                v29
            }, v31);
            if not v40 then
                return false, {
                    v41
                };
            else
                local v42 = v26.new();
                v42:updateReasons(v8(v29, v31));
                v42:updateReasons(v10(v29, v31));
                if v7() then
                    v42:updateReasons(v24(v29, v31));
                end;
                v42:updateReasons(v9(nil, v29, v31));
                v42:updateReasons(v12(v29, v31));
                v42:updateReasons(v13(v29, v31));
                v42:updateReasons(v19(v29, v31));
                if v6() and v5() then
                    local v43 = tick();
                    v42:updateReasons(v22(v29, v31));
                    v1.recordScriptTime("validateAssetTransparency", v43, v31);
                elseif not v35 then
                    local v44 = tick();
                    v42:updateReasons(v23(v29, l_assetTypeEnum_0, l_isServer_0));
                    v1.recordScriptTime("validateAssetTransparency", v44, v31);
                end;
                v42:updateReasons(v15(v29, v31));
                v42:updateReasons(v17(v29, l_assetTypeEnum_0, v31));
                if v3() then
                    v42:updateReasons(v20(v29, v31));
                end;
                v42:updateReasons(v16(v29, v31));
                v42:updateReasons(v18(v29, v31));
                if v4() then
                    local v45 = not l_isServer_0;
                    if l_allowUnreviewedAssets_0 then
                        v45 = false;
                    end;
                    if v45 then
                        v42:updateReasons(v21(v29, l_restrictedUserIds_0, v31));
                    end;
                end;
                return v42:getFinalResults();
            end;
        end;
    end;
end;