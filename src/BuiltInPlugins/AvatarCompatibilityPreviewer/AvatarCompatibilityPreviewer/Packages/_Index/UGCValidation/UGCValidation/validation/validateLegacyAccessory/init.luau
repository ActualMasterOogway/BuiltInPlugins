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
local v19 = require(l_Parent_0.validation.validateScaleType);
local v20 = require(l_Parent_0.validation.validateTotalSurfaceArea);
local v21 = require(l_Parent_0.util.RigidOrLayeredAllowed);
local v22 = require(l_Parent_0.util.createAccessorySchema);
local v23 = require(l_Parent_0.util.getAttachment);
local v24 = require(l_Parent_0.util.getAccessoryScale);
local v25 = require(l_Parent_0.util.getEditableMeshFromContext);
local v26 = require(l_Parent_0.util.getEditableImageFromContext);
local v27 = require(l_Parent_0.flags.getFFlagUGCValidateCoplanarTriTestAccessory);
local v28 = require(l_Parent_0.flags.getFFlagUGCValidateMeshVertColors);
local v29 = require(l_Parent_0.flags.getFFlagUGCValidateThumbnailConfiguration);
local v30 = require(l_Parent_0.flags.getFFlagUGCValidationNameCheck);
local v31 = game:DefineFastFlag("LegacyAccessoryCheckAvatarPartScaleType", false);
local v32 = game:DefineFastFlag("LegacyAccessoryCheckCategory", false);
local v33 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v34 = require(l_Parent_0.flags.getFFlagUGCValidateTotalSurfaceAreaTestAccessory);
return function(v35) --[[ Line: 46 ]] --[[ Name: validateLegacyAccessory ]]
    -- upvalues: v32 (copy), v21 (copy), v2 (copy), v3 (copy), v15 (copy), v22 (copy), v5 (copy), v30 (copy), v18 (copy), v23 (copy), v33 (copy), v25 (copy), v26 (copy), v16 (copy), v8 (copy), v12 (copy), v9 (copy), v13 (copy), v11 (copy), v19 (copy), v29 (copy), v17 (copy), v7 (copy), v34 (copy), v20 (copy), v31 (copy), v24 (copy), v10 (copy), v6 (copy), v28 (copy), v14 (copy), v27 (copy), v4 (copy)
    local l_instances_0 = v35.instances;
    local l_assetTypeEnum_0 = v35.assetTypeEnum;
    local l_isServer_0 = v35.isServer;
    local l_allowUnreviewedAssets_0 = v35.allowUnreviewedAssets;
    if v32 and not v21.isRigidAccessoryAllowed(l_assetTypeEnum_0) then
        v2.reportFailure(v2.ErrorType.validateLegacyAccessory_AssetTypeNotAllowedAsRigidAccessory, nil, v35);
        return false, {
            string.format("Asset type '%s' is not a rigid accessory category. It can only be used with layered clothing.", l_assetTypeEnum_0.Name)
        };
    else
        local v40 = v3.ASSET_TYPE_INFO[l_assetTypeEnum_0];
        local v41 = nil;
        local v42 = nil;
        local v43, v44 = v15(l_instances_0, v35);
        v41 = v43;
        v42 = v44;
        if not v41 then
            return false, v42;
        else
            v43 = l_instances_0[1];
            v44 = v22(v40.attachmentNames);
            local v45, v46 = v5(v44, v43, v35);
            v41 = v45;
            v42 = v46;
            if not v41 then
                return false, v42;
            else
                if v30() and l_isServer_0 then
                    v45, v46 = v18(v43, v35);
                    v41 = v45;
                    v42 = v46;
                    if not v41 then
                        return false, v42;
                    end;
                end;
                v45 = v43:FindFirstChild("Handle");
                v46 = v45:FindFirstChildOfClass("SpecialMesh");
                local v47 = {
                    fullName = v46:GetFullName(), 
                    fieldName = "MeshId", 
                    contentId = v46.MeshId, 
                    context = v43.Name
                };
                local l_Scale_0 = v46.Scale;
                local v49 = v23(v45, v40.attachmentNames);
                local v50 = assert(v40.bounds[v49.Name], "Could not find bounds for " .. v49.Name);
                local v51 = true;
                v42 = {};
                local v52 = false;
                if v47.contentId ~= nil then
                    v52 = v47.contentId ~= "";
                end;
                if v33() then
                    local v53, v54 = v25(v46, "MeshId", v35);
                    if not v53 then
                        if not v47.contentId then
                            v52 = false;
                            v51 = false;
                            table.insert(v42, {
                                string.format("Missing meshId on legacy accessory '%s'. Make sure you are using a valid meshId and try again.\n", v43.Name)
                            });
                        else
                            return false, {
                                string.format("Failed to load mesh for legacy accessory '%s'. Make sure mesh exists and try again.", v43.Name)
                            };
                        end;
                    end;
                    v47.editableMesh = v54;
                    v52 = true;
                end;
                local v55 = {
                    fullName = v46:GetFullName(), 
                    fieldName = "TextureId", 
                    contentId = v46.TextureId
                };
                if v33() then
                    local v56, v57 = v26(v46, "TextureId", v35);
                    if not v56 then
                        return false, {
                            string.format("Failed to load texture for legacy accessory '%s'. Make sure texture exists and try again.", v43.Name)
                        };
                    else
                        v55.editableImage = v57;
                    end;
                elseif l_isServer_0 then
                    local v58 = nil;
                    local v59 = nil;
                    local v60 = {};
                    local v61, v62 = v16(v46.TextureId, v35);
                    v58 = v61;
                    v60 = v62;
                    v61, v62 = v16(v46.MeshId, v35);
                    v59 = v61;
                    v60 = v62;
                    if not v58 or not v59 then
                        error(string.format("Failed to load children assets (Meshes, Textures, etc.) for '%s'. Make sure the assets exist and try again.", v43.Name));
                    end;
                end;
                local v63 = {};
                local v64, v65 = v8(v43, v35);
                v41 = v64;
                v63 = v65;
                if not v41 then
                    table.insert(v42, table.concat(v63, "\n"));
                    v51 = false;
                end;
                v64, v65 = v12(v43, nil, v35);
                v41 = v64;
                v63 = v65;
                if not v41 then
                    table.insert(v42, table.concat(v63, "\n"));
                    v51 = false;
                end;
                v64, v65 = v9(v43, v35);
                v41 = v64;
                v63 = v65;
                if not v41 then
                    table.insert(v42, table.concat(v63, "\n"));
                    v51 = false;
                end;
                v64, v65 = v13(v43, v35);
                v41 = v64;
                v63 = v65;
                if not v41 then
                    table.insert(v42, table.concat(v63, "\n"));
                    v51 = false;
                end;
                v64, v65 = v11(v55, nil, v35);
                v41 = v64;
                v63 = v65;
                if not v41 then
                    table.insert(v42, table.concat(v63, "\n"));
                    v51 = false;
                end;
                v64 = v45:FindFirstChild("AvatarPartScaleType");
                if v64 and v64:IsA("StringValue") then
                    local v66;
                    v65, v66 = v19(v64, v35);
                    v41 = v65;
                    v63 = v66;
                    if not v41 then
                        table.insert(v42, table.concat(v63, "\n"));
                        v51 = false;
                    end;
                end;
                if v29() then
                    local v67;
                    v65, v67 = v17(v43, v45, v47, l_Scale_0, v35);
                    v41 = v65;
                    v63 = v67;
                    if not v41 then
                        table.insert(v42, table.concat(v63, "\n"));
                        v51 = false;
                    end;
                end;
                v65 = not l_isServer_0;
                if l_allowUnreviewedAssets_0 then
                    v65 = false;
                end;
                if v65 then
                    local v68, v69 = v7(v43, {}, v35);
                    v41 = v68;
                    v63 = v69;
                    if not v41 then
                        table.insert(v42, table.concat(v63, "\n"));
                        v51 = false;
                    end;
                end;
                if v52 then
                    if v34() then
                        local v70, v71 = v20(v47, l_Scale_0, v35);
                        v41 = v70;
                        v63 = v71;
                        if not v41 then
                            table.insert(v42, table.concat(v63, "\n"));
                            v51 = false;
                        end;
                    end;
                    if v31 and v45:FindFirstChild("AvatarPartScaleType") then
                        local v72 = v24(v45, v49);
                        v50 = {
                            size = v50.size / v72, 
                            offset = if v50.offset then v50.offset / v72 else nil
                        };
                    end;
                    local v73, v74 = v10(v45, v49, v47, l_Scale_0, v50, l_assetTypeEnum_0.Name, v35);
                    v41 = v73;
                    v63 = v74;
                    if not v41 then
                        table.insert(v42, table.concat(v63, "\n"));
                        v51 = false;
                    end;
                    v73, v74 = v6(v47, nil, v35);
                    v41 = v73;
                    v63 = v74;
                    if not v41 then
                        table.insert(v42, table.concat(v63, "\n"));
                        v51 = false;
                    end;
                    if v28() then
                        v73, v74 = v14(v47, false, v35);
                        v41 = v73;
                        v63 = v74;
                        if not v41 then
                            table.insert(v42, table.concat(v63, "\n"));
                            v51 = false;
                        end;
                    end;
                    if v27() then
                        v73, v74 = v4(v47, l_Scale_0, v35);
                        v41 = v73;
                        v63 = v74;
                        if not v41 then
                            table.insert(v42, table.concat(v63, "\n"));
                            v51 = false;
                        end;
                    end;
                end;
                return v51, v42;
            end;
        end;
    end;
end;