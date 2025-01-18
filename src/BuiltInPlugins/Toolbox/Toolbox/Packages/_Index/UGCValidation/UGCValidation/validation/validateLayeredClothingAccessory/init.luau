local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Analytics);
local v3 = require(l_Parent_0.Constants);
local v4 = require(l_Parent_0.validation.validateLCCageQuality);
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
local v16 = require(l_Parent_0.validation.validateHSR);
local v17 = require(l_Parent_0.validation.validateUVSpace);
local v18 = require(l_Parent_0.validation.validateCanLoad);
local v19 = require(l_Parent_0.validation.validateThumbnailConfiguration);
local v20 = require(l_Parent_0.validation.validateAccessoryName);
local v21 = require(l_Parent_0.validation.validateScaleType);
local v22 = require(l_Parent_0.validation.validateTotalSurfaceArea);
local v23 = require(l_Parent_0.validation.validateCoplanarIntersection);
local v24 = require(l_Parent_0.validation.validateMaxCubeDensity);
local v25 = require(l_Parent_0.util.RigidOrLayeredAllowed);
local v26 = require(l_Parent_0.util.createLayeredClothingSchema);
local v27 = require(l_Parent_0.util.getAttachment);
local v28 = require(l_Parent_0.util.getMeshSize);
local v29 = require(l_Parent_0.util.getEditableMeshFromContext);
local v30 = require(l_Parent_0.util.getEditableImageFromContext);
local v31 = require(l_Parent_0.util.getExpectedPartSize);
local v32 = require(l_Parent_0.util.pcallDeferred);
local v33 = require(l_Parent_0.flags.getFFlagUGCValidateCoplanarTriTestAccessory);
local v34 = require(l_Parent_0.flags.getFFlagUGCLCQualityReplaceLua);
local v35 = require(l_Parent_0.flags.getFFlagUGCValidateMeshVertColors);
local v36 = require(l_Parent_0.flags.getFFlagUGCValidateThumbnailConfiguration);
local v37 = require(l_Parent_0.flags.getFFlagUGCValidateLCCagesQuality);
local v38 = require(l_Parent_0.flags.getFFlagUGCValidationNameCheck);
local v39 = require(l_Parent_0.flags.getFFlagUGCValidationShouldYield);
local v40 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v41 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidationMaxVerticesCollision);
local v42 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidationEnableGetValidationRules);
local v43 = require(l_Parent_0.flags.getFFlagUGCValidateTotalSurfaceAreaTestAccessory);
local v44 = require(l_Parent_0.flags.getFFlagUGCValidateCageOrigin);
local v45 = require(l_Parent_0.flags.getFIntUGCValidateAccessoryMaxCageOrigin);
local v46 = if v44() then v45() / 100 else nil;
return function(v47) --[[ Line: 63 ]] --[[ Name: validateLayeredClothingAccessory ]]
    -- upvalues: v25 (copy), v2 (copy), v3 (copy), v15 (copy), v26 (copy), v5 (copy), v38 (copy), v20 (copy), v40 (copy), v29 (copy), v30 (copy), v18 (copy), v39 (copy), v32 (copy), v28 (copy), v31 (copy), v27 (copy), v42 (copy), v8 (copy), v12 (copy), v9 (copy), v13 (copy), v11 (copy), v21 (copy), v36 (copy), v19 (copy), v16 (copy), v44 (copy), v46 (copy), v7 (copy), v43 (copy), v22 (copy), v10 (copy), v6 (copy), v35 (copy), v14 (copy), v33 (copy), v23 (copy), v34 (copy), v17 (copy), v41 (copy), v24 (copy), v37 (copy), v4 (copy)
    local l_instances_0 = v47.instances;
    local l_assetTypeEnum_0 = v47.assetTypeEnum;
    local l_isServer_0 = v47.isServer;
    local l_allowUnreviewedAssets_0 = v47.allowUnreviewedAssets;
    if not v25.isLayeredClothingAllowed(l_assetTypeEnum_0) then
        v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_AssetTypeNotAllowedAsLayeredClothing, nil, v47);
        return false, {
            string.format("Asset type '%s' is not a layered clothing category. It can only be used with rigid accessories.", l_assetTypeEnum_0.Name)
        };
    else
        local v52 = v3.ASSET_TYPE_INFO[l_assetTypeEnum_0];
        local v53 = nil;
        local v54 = nil;
        local v55, v56 = v15(l_instances_0, v47);
        v53 = v55;
        v54 = v56;
        if not v53 then
            return false, v54;
        else
            v55 = l_instances_0[1];
            v56 = v26(v52.attachmentNames);
            local v57, v58 = v5(v56, v55, v47);
            v53 = v57;
            v54 = v58;
            if not v53 then
                return false, v54;
            else
                if v38() and l_isServer_0 then
                    v57, v58 = v20(v55, v47);
                    v53 = v57;
                    v54 = v58;
                    if not v53 then
                        return false, v54;
                    end;
                end;
                v57 = true;
                v54 = {};
                v58 = v55:FindFirstChild("Handle");
                local v59 = {
                    fullName = v58:GetFullName(), 
                    fieldName = "MeshId", 
                    contentId = v58.MeshId, 
                    context = v55.Name
                };
                local v60 = false;
                if v59.contentId ~= nil then
                    v60 = v59.contentId ~= "";
                end;
                if v40() then
                    local v61, v62 = v29(v58, "MeshId", v47);
                    if not v61 then
                        if not v59.contentId then
                            v60 = false;
                            v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_NoMeshId, nil, v47);
                            v57 = false;
                            table.insert(v54, {
                                string.format("Missing meshId on layered clothing accessory '%s'. Make sure you are using a valid meshId and try again.\n", v55.Name)
                            });
                        else
                            v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_FailedToLoadMesh, nil, v47);
                            return false, {
                                string.format("Failed to load mesh for layered clothing accessory '%s'. Make sure mesh exists and try again.", v55.Name)
                            };
                        end;
                    end;
                    v59.editableMesh = v62;
                    v60 = true;
                end;
                local l_TextureID_0 = v58.TextureID;
                local v64 = {
                    fullName = v58:GetFullName(), 
                    fieldName = "TextureID", 
                    contentId = l_TextureID_0
                };
                if v40() then
                    local v65 = nil;
                    local v66 = nil;
                    if l_TextureID_0 ~= "" then
                        local v67, v68 = v30(v58, "TextureID", v47);
                        v65 = v67;
                        v66 = v68;
                        if not v65 then
                            return false, {
                                string.format("Failed to load texture for layered clothing accessory '%s'. Make sure texture exists and try again.", v55.Name)
                            };
                        else
                            v64.editableImage = v66;
                        end;
                    end;
                elseif l_isServer_0 then
                    local v69 = true;
                    local v70 = nil;
                    local v71 = {};
                    if l_TextureID_0 ~= "" then
                        local v72, v73 = v18(l_TextureID_0, v47);
                        v69 = v72;
                        v71 = v73;
                    end;
                    local v74, v75 = v18(v58.MeshId, v47);
                    v70 = v74;
                    v71 = v75;
                    if not v69 or not v70 then
                        error(string.format("Failed to load children assets (Meshes, Textures, etc.) for '%s'. Make sure the assets exist and try again.", v55.Name));
                    end;
                end;
                local v76 = nil;
                local v77 = nil;
                if v39() then
                    local v78, v79 = v32(function() --[[ Line: 205 ]]
                        -- upvalues: v28 (ref), v59 (copy)
                        return v28(v59);
                    end, v47);
                    v76 = v78;
                    v77 = v79;
                else
                    local l_status_0, l_result_0 = pcall(v28, v59);
                    v76 = l_status_0;
                    v77 = l_result_0;
                end;
                if not v76 then
                    v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_FailedToLoadMesh, nil, v47);
                    return false, {
                        string.format("Failed to load mesh for layered clothing accessory '%s'. Make sure mesh exists and try again.", v55.Name)
                    };
                else
                    local v82 = nil;
                    v82 = if v40() then v31(v58, v47) / v77 else v58.Size / v77;
                    local v83 = v27(v58, v52.attachmentNames);
                    local v84 = nil;
                    if v42() then
                        v84 = v52.bounds[v83.Name];
                    else
                        v84 = v3.LC_BOUNDS;
                        if v52.layeredClothingBounds and v52.layeredClothingBounds[v83.Name] then
                            v84 = v52.layeredClothingBounds[v83.Name];
                        end;
                    end;
                    local v85 = {};
                    local v86, v87 = v8(v55, v47);
                    v53 = v86;
                    v85 = v87;
                    if not v53 then
                        table.insert(v54, table.concat(v85, "\n"));
                        v57 = false;
                    end;
                    v86, v87 = v12(v55, nil, v47);
                    v53 = v86;
                    v85 = v87;
                    if not v53 then
                        table.insert(v54, table.concat(v85, "\n"));
                        v57 = false;
                    end;
                    v86, v87 = v9(v55, v47);
                    v53 = v86;
                    v85 = v87;
                    if not v53 then
                        table.insert(v54, table.concat(v85, "\n"));
                        v57 = false;
                    end;
                    v86, v87 = v13(v55, v47);
                    v53 = v86;
                    v85 = v87;
                    if not v53 then
                        table.insert(v54, table.concat(v85, "\n"));
                        v57 = false;
                    end;
                    v86, v87 = v11(v64, true, v47);
                    v53 = v86;
                    v85 = v87;
                    if not v53 then
                        table.insert(v54, table.concat(v85, "\n"));
                        v57 = false;
                    end;
                    v86 = v58:FindFirstChild("AvatarPartScaleType");
                    if v86 and v86:IsA("StringValue") then
                        local v88;
                        v87, v88 = v21(v86, v47);
                        v53 = v87;
                        v85 = v88;
                        if not v53 then
                            table.insert(v54, table.concat(v85, "\n"));
                            v57 = false;
                        end;
                    end;
                    if v36() then
                        local v89;
                        v87, v89 = v19(v55, v58, v59, v82, v47);
                        v53 = v87;
                        v85 = v89;
                        if not v53 then
                            table.insert(v54, table.concat(v85, "\n"));
                            v57 = false;
                        end;
                    end;
                    v87 = v58:FindFirstChildOfClass("WrapLayer");
                    if v87 == nil then
                        v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_NoWrapLayer, nil, v47);
                        table.insert(v54, string.format("Missing WrapLayer on layered clothing accessory %s. You need to create a child WrapLayer and try again.", v55.Name));
                        v57 = false;
                    else
                        local v90, v91 = v16(v87, v47);
                        v53 = v90;
                        v85 = v91;
                        if not v53 then
                            table.insert(v54, table.concat(v85, "\n"));
                            v57 = false;
                        end;
                        if v44() then
                            v2.reportFailure(v2.ErrorType.validateLayeredClothingAccessory_CageOriginOutOfBounds, nil, v47);
                            if v87.CageOrigin.Position.Magnitude > v46 then
                                table.insert(v54, string.format("WrapLayer %s found under %s.%s has a CageOrigin position greater than %.2f. You need to set CageOrigin.Position to 0,0,0.", v87.Name, v55.Name, v58.Name, v46));
                                v57 = false;
                            end;
                        end;
                    end;
                    v87 = not l_isServer_0;
                    if l_allowUnreviewedAssets_0 then
                        v87 = false;
                    end;
                    if v87 then
                        local v92, v93 = v7(v55, {}, v47);
                        v53 = v92;
                        v85 = v93;
                        if not v53 then
                            table.insert(v54, table.concat(v85, "\n"));
                            v57 = false;
                        end;
                    end;
                    if v60 then
                        if v43() then
                            local v94, v95 = v22(v59, v82, v47);
                            v53 = v94;
                            v85 = v95;
                            if not v53 then
                                table.insert(v54, table.concat(v85, "\n"));
                                v57 = false;
                            end;
                        end;
                        local v96, v97 = v10(v58, v83, v59, v82, v84, l_assetTypeEnum_0.Name, v47);
                        v53 = v96;
                        v85 = v97;
                        if not v53 then
                            table.insert(v54, table.concat(v85, "\n"));
                            v57 = false;
                        end;
                        v96, v97 = v6(v59, nil, v47);
                        v53 = v96;
                        v85 = v97;
                        if not v53 then
                            table.insert(v54, table.concat(v85, "\n"));
                            v57 = false;
                        end;
                        if v35() then
                            v96, v97 = v14(v59, false, v47);
                            v53 = v96;
                            v85 = v97;
                            if not v53 then
                                table.insert(v54, table.concat(v85, "\n"));
                                v57 = false;
                            end;
                        end;
                        if v33() then
                            v96, v97 = v23(v59, v82, v47);
                            v53 = v96;
                            v85 = v97;
                            if not v53 then
                                table.insert(v54, table.concat(v85, "\n"));
                                v57 = false;
                            end;
                        end;
                        if v34() then
                            v96, v97 = v17(v59, v47);
                            v53 = v96;
                            v85 = v97;
                            if not v53 then
                                table.insert(v54, table.concat(v85, "\n"));
                                v57 = false;
                            end;
                        end;
                    end;
                    if v41() then
                        local v98, v99 = v24(v59, v47, v82);
                        v53 = v98;
                        v85 = v99;
                        if not v53 then
                            table.insert(v54, table.concat(v85, "\n"));
                            v57 = false;
                        end;
                    end;
                    if v37() then
                        local v100, v101 = v4(v55, v59, v47);
                        v53 = v100;
                        v85 = v101;
                        if not v53 then
                            for _, v103 in v85 do
                                table.insert(v54, v103);
                            end;
                            v57 = false;
                        end;
                    end;
                    return v57, v54;
                end;
            end;
        end;
    end;
end;