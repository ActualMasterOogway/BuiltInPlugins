local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.validation.validateCoplanarIntersection);
local v5 = require(l_Parent_0.validation.validateInstanceTree);
local v6 = require(l_Parent_0.validation.validateMeshTriangles);
local v7 = require(l_Parent_0.validation.validateModeration);
local v8 = require(l_Parent_0.validation.validateMaterials);
local v9 = require(l_Parent_0.validation.validateTags);
local v10 = require(l_Parent_0.validation.validateMeshBounds);
local v11 = require(l_Parent_0.validation.validateTextureSize);
local v12 = require(l_Parent_0.validation.validateProperties);
local v13 = require(l_Parent_0.validation.validateAttributes);
local v14 = require(l_Parent_0.validation.validateMeshVertColors);
local v15 = require(l_Parent_0.validation.validateSingleInstance);
local v16 = require(l_Parent_0.validation.validateCanLoad);
local v17 = require(l_Parent_0.validation.validateThumbnailConfiguration);
local v18 = require(l_Parent_0.validation.validateAccessoryName);
local v19 = require(l_Parent_0.validation.validateSurfaceAppearances);
local v20 = require(l_Parent_0.validation.validateScaleType);
local v21 = require(l_Parent_0.validation.validateTotalSurfaceArea);
local v22 = require(l_Parent_0.util.createMeshPartAccessorySchema);
local v23 = require(l_Parent_0.util.getAttachment);
local v24 = require(l_Parent_0.util.getMeshSize);
local v25 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v26 = require(l_Parent_0.util.getEditableMeshFromContext);
local v27 = require(l_Parent_0.util.getEditableImageFromContext);
local v28 = require(l_Parent_0.util.getExpectedPartSize);
local v29 = require(l_Parent_0.util.pcallDeferred);
local v30 = require(l_Parent_0.flags.getFFlagMeshPartAccessoryPBRSupport);
local v31 = require(l_Parent_0.flags.getFFlagUGCValidateCoplanarTriTestAccessory);
local v32 = require(l_Parent_0.flags.getFFlagUGCValidateMeshVertColors);
local v33 = require(l_Parent_0.flags.getFFlagUGCValidateThumbnailConfiguration);
local v34 = require(l_Parent_0.flags.getFFlagUGCValidationNameCheck);
local v35 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v36 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v37 = require(l_Parent_0.flags.getFFlagUGCValidateTotalSurfaceAreaTestAccessory);
return function(v38) --[[ Line: 47 ]] --[[ Name: validateMeshPartAccessory ]]
    -- upvalues: v3 (copy), v15 (copy), v22 (copy), v5 (copy), v34 (copy), v18 (copy), v25 (copy), v36 (copy), v26 (copy), v2 (copy), v27 (copy), v16 (copy), v35 (copy), v29 (copy), v24 (copy), v28 (copy), v23 (copy), v8 (copy), v12 (copy), v9 (copy), v13 (copy), v11 (copy), v30 (copy), v33 (copy), v17 (copy), v7 (copy), v37 (copy), v21 (copy), v10 (copy), v6 (copy), v32 (copy), v14 (copy), v31 (copy), v4 (copy), v19 (copy), v20 (copy)
    assert(v38.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateMeshPartAccessory");
    local l_instances_0 = v38.instances;
    local l_assetTypeEnum_0 = v38.assetTypeEnum;
    local l_isServer_0 = v38.isServer;
    local l_allowUnreviewedAssets_0 = v38.allowUnreviewedAssets;
    local v43 = v3.ASSET_TYPE_INFO[l_assetTypeEnum_0];
    local v44 = nil;
    local v45 = nil;
    local v46, v47 = v15(l_instances_0, v38);
    v44 = v46;
    v45 = v47;
    if not v44 then
        return false, v45;
    else
        v46 = l_instances_0[1];
        v47 = v22(v43.attachmentNames);
        local v48, v49 = v5(v47, v46, v38);
        v44 = v48;
        v45 = v49;
        if not v44 then
            return false, v45;
        else
            if v34() and l_isServer_0 then
                v48, v49 = v18(v46, v38);
                v44 = v48;
                v45 = v49;
                if not v44 then
                    return false, v45;
                end;
            end;
            v48 = v46:FindFirstChild("Handle");
            v49 = {
                fullName = v48:GetFullName(), 
                fieldName = "MeshId", 
                contentId = v48.MeshId, 
                context = v46.Name
            };
            local v50 = v25.new();
            local v51 = false;
            if v49.contentId ~= nil then
                v51 = v49.contentId ~= "";
            end;
            if v36() then
                local v52, v53 = v26(v48, "MeshId", v38);
                if not v52 then
                    if not v49.contentId then
                        v51 = false;
                        v2.reportFailure(v2.ErrorType.validateMeshPartAccessory_NoMeshId, nil, v38);
                        v50:updateReasons(false, {
                            string.format("Accessory MeshPart '%s' must contain a valid meshId. Make sure the mesh referred to by the meshId exists and try again.", v48:GetFullName())
                        });
                    else
                        v2.reportFailure(v2.ErrorType.validateMeshPartAccessory_FailedToLoadMesh, nil, v38);
                        return false, {
                            string.format("Failed to load mesh for accessory '%s'. Make sure mesh exists and try again.", v46.Name)
                        };
                    end;
                end;
                v49.editableMesh = v53;
                v51 = true;
            end;
            local l_TextureID_0 = v48.TextureID;
            local v55 = {
                fullName = v48:GetFullName(), 
                fieldName = "TextureID", 
                contentId = l_TextureID_0
            };
            if v36() then
                local v56, v57 = v27(v48, "TextureID", v38);
                if not v56 then
                    return false, {
                        string.format("Failed to load texture for accessory '%s'. Make sure texture exists and try again.", v46.Name)
                    };
                else
                    v55.editableImage = v57;
                end;
            elseif l_isServer_0 then
                local v58 = true;
                local v59 = nil;
                local v60 = {};
                if l_TextureID_0 ~= "" then
                    local v61, v62 = v16(l_TextureID_0, v38);
                    v58 = v61;
                    v60 = v62;
                end;
                local v63, v64 = v16(v48.MeshId, v38);
                v59 = v63;
                v60 = v64;
                if not v58 or not v59 then
                    error(string.format("Failed to load children assets (Meshes, Textures, etc.) for '%s'. Make sure the assets exist and try again.", v46.Name));
                end;
            end;
            local v65 = nil;
            local v66 = nil;
            if v35() then
                local v67, v68 = v29(function() --[[ Line: 170 ]]
                    -- upvalues: v24 (ref), v49 (copy)
                    return v24(v49);
                end, v38);
                v65 = v67;
                v66 = v68;
            else
                local l_status_0, l_result_0 = pcall(v24, v49);
                v65 = l_status_0;
                v66 = l_result_0;
            end;
            if not v65 then
                v2.reportFailure(v2.ErrorType.validateMeshPartAccessory_FailedToLoadMesh, nil, v38);
                return false, {
                    string.format("Failed to load mesh for accessory '%s'. Make sure mesh exists and try again.", v46.Name)
                };
            else
                local v71 = nil;
                v71 = if v36() then v28(v48, v38) / v66 else v48.Size / v66;
                local v72 = v23(v48, v43.attachmentNames);
                assert(v72);
                local v73 = assert(v43.bounds[v72.Name], "Could not find bounds for " .. v72.Name);
                v50:updateReasons(v8(v46, v38));
                v50:updateReasons(v12(v46, nil, v38));
                v50:updateReasons(v9(v46, v38));
                v50:updateReasons(v13(v46, v38));
                v50:updateReasons(v11(v55, v30(), v38));
                if v33() then
                    v50:updateReasons(v17(v46, v48, v49, v71, v38));
                end;
                local v74 = not l_isServer_0;
                if l_allowUnreviewedAssets_0 then
                    v74 = false;
                end;
                if v74 then
                    v50:updateReasons(v7(v46, {}, v38));
                end;
                if v51 then
                    if v37() then
                        v50:updateReasons(v21(v49, v71, v38));
                    end;
                    v50:updateReasons(v10(v48, v72, v49, v71, v73, l_assetTypeEnum_0.Name, v38));
                    v50:updateReasons(v6(v49, nil, v38));
                    if v32() then
                        v50:updateReasons(v14(v49, false, v38));
                    end;
                    if v31() then
                        v50:updateReasons(v4(v49, v71, v38));
                    end;
                end;
                if v30() then
                    v50:updateReasons(v19(v46, v38));
                end;
                local l_AvatarPartScaleType_0 = v48:FindFirstChild("AvatarPartScaleType");
                if l_AvatarPartScaleType_0 and l_AvatarPartScaleType_0:IsA("StringValue") then
                    v50:updateReasons(v20(l_AvatarPartScaleType_0, v38));
                end;
                return v50:getFinalResults();
            end;
        end;
    end;
end;