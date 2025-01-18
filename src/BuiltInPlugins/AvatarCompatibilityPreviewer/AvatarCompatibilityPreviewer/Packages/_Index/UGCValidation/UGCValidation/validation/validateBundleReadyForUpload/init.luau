local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getFFlagUGCValidateFixAccessories);
local v2 = require(l_Parent_0.flags.getEngineFeatureUGCValidateEditableMeshAndImage);
local v3 = require(l_Parent_0.Parent.Promise);
local v4 = require(l_Parent_0.ConstantsInterface);
local _ = require(l_Parent_0.util.BundlesMetadata);
local _ = require(l_Parent_0.util.Types);
local v7 = require(l_Parent_0.util.getRestrictedUserTable);
local v8 = require(l_Parent_0.util.createEditableInstancesForContext);
local v9 = require(l_Parent_0.util.destroyEditableInstances);
local v10 = require(l_Parent_0.util.createUGCBodyPartFolders);
local v11 = require(l_Parent_0.util.fixUpPreValidation);
local v12 = require(l_Parent_0.validation.validateInternal);
local v13 = require(l_Parent_0.validation.validateFullBody);
local v14 = {
    Enum.AssetType.DynamicHead, 
    Enum.AssetType.Torso, 
    Enum.AssetType.LeftArm, 
    Enum.AssetType.RightArm, 
    Enum.AssetType.LeftLeg, 
    Enum.AssetType.RightLeg, 
    Enum.AssetType.HairAccessory, 
    Enum.AssetType.EyebrowAccessory, 
    Enum.AssetType.EyelashAccessory
};
local function v18(v15) --[[ Line: 60 ]] --[[ Name: sanitizeAvatarForValidation ]]
    v15 = v15:Clone();
    for _, v17 in v15:GetDescendants() do
        if v17:IsA("Motor6D") or v17.Name == "OriginalSize" or v17.Name == "OriginalPosition" then
            v17:Destroy();
        elseif v17:IsA("Weld") and v17.Name == "AccessoryWeld" then
            v17:Destroy();
        elseif v17:IsA("MeshPart") and not v17.Parent:IsA("Accessory") and v17.TextureID == "" and not v17:FindFirstChildWhichIsA("SurfaceAppearance") then
            Instance.new("SurfaceAppearance").Parent = v17;
        end;
    end;
    return v15;
end;
return function(v19, v20, v21, v22, v23, v24) --[[ Line: 89 ]] --[[ Name: validateBundleReadyForUpload ]]
    -- upvalues: v3 (copy), v1 (copy), v11 (copy), v18 (copy), v10 (copy), v14 (copy), v7 (copy), v2 (copy), v8 (copy), v12 (copy), v9 (copy), v4 (copy), v13 (copy)
    v22 = v22 or function() --[[ Line: 97 ]]

    end;
    assert(v22 ~= nil, "Luau");
    if not v19:IsA("Model") then
        local v25 = {
            errors = {
                {
                    assetType = nil, 
                    error = {
                        type = "message", 
                        message = "Invalid root instance, must be a model"
                    }
                }
            }, 
            pieces = {}
        };
        return v3.resolve(v25);
    else
        v19 = if v1() then v11(v19) else v18(v19);
        local v26 = v10(v19, v20, v21, false);
        local v27 = {};
        local v28 = {};
        for v29, v30 in v20[v21].allowedAssetTypeSettings do
            local v31 = assert(Enum.AssetType[v29], "Asset type name doesn't map to an enum item");
            if v30.isEligibleForUpload then
                local v32 = true;
                if v30.minimumQuantity ~= 0 then
                    v32 = v30.minimumQuantity == 1;
                end;
                assert(v32, "Invalid minimum quantity, createUGCBodyParts folder is a dictionary and will only ever give one.");
                v32 = true;
                if v30.maximumQuantity ~= 0 then
                    v32 = v30.maximumQuantity == 1;
                end;
                assert(v32, "Invalid maximum quantity, createUGCBodyParts folder is a dictionary and will only ever give one.");
                local v33 = v26[v31];
                v32 = v33 and v33[1];
                if v30.minimumQuantity ~= 0 or v32 ~= nil then
                    table.insert(v28, {
                        assetType = v31, 
                        instance = v32, 
                        settings = v30, 
                        status = v32 == nil and "finished" or "pending"
                    });
                    if v32 == nil then
                        table.insert(v27, {
                            assetType = v31, 
                            error = {
                                type = "notFound"
                            }
                        });
                    end;
                end;
            end;
        end;
        table.sort(v28, function(v34, v35) --[[ Line: 176 ]]
            -- upvalues: v14 (ref)
            return (table.find(v14, v34.assetType) or 1e999) < (table.find(v14, v35.assetType) or 1e999);
        end);
        local v36 = {
            errors = v27, 
            pieces = v28
        };
        v22(v36);
        return v3.each(v28, function(v37, v38) --[[ Line: 191 ]]
            -- upvalues: v7 (ref), v23 (copy), v24 (copy), v2 (ref), v8 (ref), v12 (ref), v9 (ref), v36 (ref), v22 (ref)
            if v37.status == "finished" then
                return;
            else
                assert(v37.instance ~= nil, "Unfinished piece doesn't have an instnace");
                local v39 = nil;
                local v40 = nil;
                local v41 = {
                    v37.instance
                };
                local v42 = {
                    instances = v41, 
                    assetTypeEnum = v37.assetType, 
                    allowUnreviewedAssets = false, 
                    restrictedUserIds = v7(), 
                    isServer = false, 
                    isAsync = false, 
                    allowEditableInstances = v23, 
                    bypassFlags = v24, 
                    validateMeshPartAccessories = false, 
                    requireAllFolders = false
                };
                if v2() then
                    local v43, v44 = v8(v41, v23);
                    if not v43 then
                        v40 = v44;
                        v39 = false;
                    else
                        v42.editableMeshes = v44.editableMeshes;
                        v42.editableImages = v44.editableImages;
                        local v45, v46 = v12(v42);
                        v39 = v45;
                        v40 = v46;
                        v9(v42.editableMeshes, v42.editableImages);
                    end;
                else
                    local v47, v48 = v12(v42);
                    v39 = v47;
                    v40 = v48;
                end;
                v36 = table.clone(v36);
                v36.errors = table.clone(v36.errors);
                if not v39 then
                    assert(v40 ~= nil, "Failure without errors");
                    for _, v50 in v40 do
                        table.insert(v36.errors, {
                            assetType = v37.assetType, 
                            error = {
                                type = "message", 
                                message = v50
                            }
                        });
                    end;
                end;
                v36.pieces = table.clone(v36.pieces);
                v36.pieces[v38].status = "finished";
                v22(v36);
                return;
            end;
        end):andThen(function() --[[ Line: 255 ]]
            -- upvalues: v21 (copy), v4 (ref), v36 (ref), v23 (copy), v24 (copy), v2 (ref), v8 (ref), v13 (ref), v9 (ref), v22 (ref)
            if v21 == "Body" then
                local function v55(v51) --[[ Line: 257 ]] --[[ Name: createFullBodyData ]]
                    -- upvalues: v4 (ref)
                    local v52 = {};
                    for _, v54 in v51 do
                        if v4.isBodyPart(v54.assetType) then
                            table.insert(v52, {
                                assetTypeEnum = v54.assetType, 
                                allSelectedInstances = if v54.instance then {
                                    v54.instance
                                } else {}
                            });
                        end;
                    end;
                    return v52;
                end;
                local v56 = nil;
                local v57 = nil;
                local v58 = v55(v36.pieces);
                local v59 = {
                    fullBodyData = v58, 
                    isServer = false, 
                    allowEditableInstances = v23, 
                    bypassFlags = v24, 
                    validateMeshPartAccessories = false, 
                    requireAllFolders = false
                };
                if v2() then
                    local v60 = {};
                    for _, v62 in v58 do
                        for _, v64 in v62.allSelectedInstances do
                            table.insert(v60, v64);
                        end;
                    end;
                    local v65, v66 = v8(v60, v23);
                    if not v65 then
                        v57 = v66;
                        v56 = false;
                    else
                        v59.editableMeshes = v66.editableMeshes;
                        v59.editableImages = v66.editableImages;
                        local v67, v68 = v13(v59);
                        v56 = v67;
                        v57 = v68;
                        v9(v59.editableMeshes, v59.editableImages);
                    end;
                else
                    local v69, v70 = v13(v59);
                    v56 = v69;
                    v57 = v70;
                end;
                if not v56 then
                    v36 = table.clone(v36);
                    v36.errors = table.clone(v36.errors);
                    assert(v57 and #v57 > 0, "There should always be a reason for failure");
                    for _, v72 in v57 do
                        table.insert(v36.errors, {
                            assetType = nil, 
                            error = {
                                type = "message", 
                                message = v72
                            }
                        });
                    end;
                end;
                v22(v36);
            end;
        end):andThen(function() --[[ Line: 331 ]]
            -- upvalues: v36 (ref)
            return v36;
        end);
    end;
end;