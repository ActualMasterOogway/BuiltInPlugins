local l_Parent_0 = script.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.AssetConfigConstants);
local v3 = require(l_Util_0.fixUpPreValidation);
local v4 = require(l_Util_0.getUserId);
local v5 = require(l_Util_0.Urls);
local l_Packages_0 = l_Parent_0.Packages;
local v7 = require(l_Packages_0.Cryo);
local _ = require(l_Packages_0.Framework);
local v9 = require(l_Packages_0.Dash);
local v10 = require(l_Util_0.getAllowedAssetTypeEnums);
local v11 = tonumber(settings():GetFVariable("FileMaxSizeBytes"));
local l_UseDefaultThumbnailForAnimation_0 = game:GetFastFlag("UseDefaultThumbnailForAnimation");
local l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForAll");
local l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForIXP3");
local _ = require(l_Util_0.DebugFlags);
local v16 = require(l_Util_0.SharedFlags.getFFlagEnableUGCMissingPartsMessage);
local _ = require(l_Parent_0.Core.Localization.getLocalizedAssetTextMap);
local _ = require(l_Util_0.SharedFlags.getFFlagEnableUGCUploadFlowAnalytics);
local l_EnableUGCBundleUnknownMeshPartFiltering_0 = game:GetFastFlag("EnableUGCBundleUnknownMeshPartFiltering");
local v20 = require(l_Util_0.SharedFlags.getFFlagEnableUGCBundleUploadBodyScale);
local v21 = require(l_Util_0.SharedFlags.getFFlagEnableBodyScaleValidationSupport);
local v22 = require(l_Util_0.SharedFlags.getFFlagEnableBodyColorSetUploadSupport);
local l_StudioService_0 = game:GetService("StudioService");
local function _(v24, v25) --[[ Line: 41 ]]
    local v26 = 10 ^ (v25 or 0);
    return math.floor(v24 * v26 + 0.5) / v26;
end;
local v37 = {
    isUGCBundleType = function(v28) --[[ Line: 61 ]] --[[ Name: isUGCBundleType ]]
        -- upvalues: v2 (copy)
        local v29 = true;
        if v28 ~= v2.UGCBundleTypes.Body then
            v29 = v28 == v2.UGCBundleTypes.DynamicHead;
        end;
        return v29;
    end, 
    isReadyForSale = function(v30) --[[ Line: 66 ]] --[[ Name: isReadyForSale ]]
        -- upvalues: v2 (copy)
        local v31 = true;
        if v2.ASSET_STATUS.ReviewApproved ~= v30 then
            v31 = true;
            if v2.ASSET_STATUS.OnSale ~= v30 then
                v31 = true;
                if v2.ASSET_STATUS.OffSale ~= v30 then
                    v31 = v2.ASSET_STATUS.DelayedRelease == v30;
                end;
            end;
        end;
        return v31;
    end, 
    isOnSale = function(v32) --[[ Line: 73 ]] --[[ Name: isOnSale ]]
        -- upvalues: v2 (copy)
        local v33 = true;
        if v2.ASSET_STATUS.OnSale ~= v32 then
            v33 = v2.ASSET_STATUS.Free == v32;
        end;
        return v33;
    end, 
    getMarketplaceFeesPercentage = function(v34, v35) --[[ Line: 78 ]] --[[ Name: getMarketplaceFeesPercentage ]]
        local v36 = v34[v35.Name];
        return v36 and v36.marketplaceFeesPercentage or 0;
    end
};
v37.calculatePotentialEarning = function(v38, v39, v40, v41) --[[ Line: 83 ]] --[[ Name: calculatePotentialEarning ]]
    -- upvalues: v37 (copy)
    v39 = tonumber(v39);
    if not v39 then
        return 0;
    else
        v39 = math.floor(v39 * 1 + 0.5) / 1;
        local v42 = math.floor(v39 * (0.01 * v37.getMarketplaceFeesPercentage(v38, v40)) * 1 + 0.5) / 1;
        if v39 < v41 then
            return 0;
        else
            return v39 - v42;
        end;
    end;
end;
v37.getPriceRange = function(v43, v44) --[[ Line: 98 ]] --[[ Name: getPriceRange ]]
    local v45 = v43 and v44 and v43[v44.Name];
    return v45 and v45.allowedPriceRange or {};
end;
v37.getMinPrice = function(v46, v47) --[[ Line: 105 ]] --[[ Name: getMinPrice ]]
    -- upvalues: v37 (copy)
    local v48 = v37.getPriceRange(v46, v47);
    if v37.isBuyableMarketplaceAsset(v47) then
        return 0;
    else
        return v48.minRobux and tonumber(v48.minRobux) or 0;
    end;
end;
v37.getPriceInfo = function(v49, v50, _) --[[ Line: 116 ]] --[[ Name: getPriceInfo ]]
    -- upvalues: v37 (copy)
    local v52 = 0;
    local v53 = 0;
    local v54 = 0;
    if v37.isUGCBundleType(v50) then
        local v55 = v49 and v50 and v49[v50.rawValue()];
        local l_allowedPriceRange_0 = v55.allowedPriceRange;
        v54 = tonumber(v55.marketplaceFeePercentage) or 0;
        v52 = if l_allowedPriceRange_0.minimumPrice then tonumber(l_allowedPriceRange_0.minimumPrice) or 0 else 0;
        if l_allowedPriceRange_0.maximumPrice then
            return v52, tonumber(l_allowedPriceRange_0.maximumPrice) or 0, v54;
        else
            return v52, 0, v54;
        end;
    else
        if v50 and v49[v50.Name] then
            local v57 = v49 and v50 and v49[v50.Name];
            local l_allowedPriceRange_1 = v57.allowedPriceRange;
            v54 = tonumber(v57.marketplaceFeesPercentage) or 0;
            v52 = if l_allowedPriceRange_1.minRobux then tonumber(l_allowedPriceRange_1.minRobux) or 0 else 0;
            if l_allowedPriceRange_1.maxRobux then
                return v52, tonumber(l_allowedPriceRange_1.maxRobux) or 0, v54;
            else
                v53 = 0;
            end;
        end;
        return v52, v53, v54;
    end;
end;
v37.hasAllowedAssetTypesForRelease = function(v59) --[[ Line: 140 ]] --[[ Name: hasAllowedAssetTypesForRelease ]]
    -- upvalues: v10 (copy)
    return #v10(v59) > 0;
end;
v37.promptImagePicker = function() --[[ Line: 144 ]] --[[ Name: promptImagePicker ]]
    -- upvalues: l_StudioService_0 (copy), v2 (copy), v11 (copy)
    local v60 = l_StudioService_0:PromptImportFile(v2.IMAGE_TYPES);
    if v60 then
        if v60.Size > v11 then
            return nil;
        else
            return v60;
        end;
    else
        return;
    end;
end;
v37.isCatalogAsset = function(v61) --[[ Line: 158 ]] --[[ Name: isCatalogAsset ]]
    -- upvalues: v2 (copy)
    local v62 = v2.ASSET_TYPE_INFO[v61];
    local v63 = false;
    if v62 ~= nil then
        v63 = v62.isCatalog == true;
    end;
    return v63;
end;
v37.isMarketplaceAsset = function(v64) --[[ Line: 163 ]] --[[ Name: isMarketplaceAsset ]]
    -- upvalues: v2 (copy)
    local v65 = v2.ASSET_TYPE_INFO[v64];
    local v66 = false;
    if v65 ~= nil then
        v66 = v65.isMarketplace == true;
    end;
    return v66;
end;
v37.isCreatorStoreAssetNotIncludingAnimation = function(v67) --[[ Line: 168 ]] --[[ Name: isCreatorStoreAssetNotIncludingAnimation ]]
    -- upvalues: v37 (copy)
    if v67 and v37.isMarketplaceAsset(v67) and v67 ~= Enum.AssetType.Animation then
        return true;
    else
        return false;
    end;
end;
v37.isBuyableMarketplaceAsset = function(v68) --[[ Line: 177 ]] --[[ Name: isBuyableMarketplaceAsset ]]
    -- upvalues: v2 (copy)
    local v69 = v2.ASSET_TYPE_INFO[v68];
    local v70 = false;
    if v69 ~= nil then
        v70 = false;
        if v69.isMarketplace == true then
            v70 = v69.isBuyable == true;
        end;
    end;
    return v70;
end;
v37.getFlowStartScreen = function(v71, v72) --[[ Line: 182 ]] --[[ Name: getFlowStartScreen ]]
    -- upvalues: v2 (copy), v37 (copy)
    if v71 == v2.FLOW_TYPE.UPLOAD_FLOW then
        if v37.hasAllowedAssetTypesForRelease(v72) then
            return v2.SCREENS.CONFIGURE_ASSET;
        else
            return v2.SCREENS.ASSET_TYPE_SELECTION;
        end;
    elseif v71 == v2.FLOW_TYPE.EDIT_FLOW or v71 == v2.FLOW_TYPE.DOWNLOAD_FLOW then
        return v2.SCREENS.CONFIGURE_ASSET;
    else
        return;
    end;
end;
v37.getGenreTypes = function() --[[ Line: 197 ]] --[[ Name: getGenreTypes ]]
    -- upvalues: v2 (copy)
    return v2.GENRE_TYPE;
end;
v37.getGenreIndex = function(v73) --[[ Line: 201 ]] --[[ Name: getGenreIndex ]]
    -- upvalues: v2 (copy)
    local v74 = 1;
    for v75, v76 in pairs(v2.GENRE_TYPE) do
        if v73 == v76.name then
            return v75;
        end;
    end;
    return v74;
end;
v37.getGenreName = function(v77) --[[ Line: 212 ]] --[[ Name: getGenreName ]]
    -- upvalues: v2 (copy)
    if #v2.GENRE_TYPE < v77 then
        v77 = 1;
    end;
    return v2.GENRE_TYPE[v77].name;
end;
v37.getOwnerDropDownContent = function(v78, v79) --[[ Line: 219 ]] --[[ Name: getOwnerDropDownContent ]]
    -- upvalues: v4 (copy)
    local v80 = {
        {
            name = v79:getText("General", "Me"), 
            creatorType = "User", 
            creatorId = v4()
        }
    };
    for _, v82 in ipairs(v78) do
        table.insert(v80, {
            name = v82.name, 
            creatorId = v82.id, 
            creatorType = "Group", 
            item = v82
        });
    end;
    return v80;
end;
v37.getClonedInstances = function(v83) --[[ Line: 236 ]] --[[ Name: getClonedInstances ]]
    local v84 = {};
    for v85 = 1, #v83 do
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 241 ]]
            -- upvalues: v83 (copy), v85 (copy)
            return v83[v85]:Clone();
        end);
        v84[#v84 + 1] = l_status_0 and l_result_0 or nil;
    end;
    return v84;
end;
v37.getPreviewType = function(v88, v89) --[[ Line: 250 ]] --[[ Name: getPreviewType ]]
    -- upvalues: v2 (copy), v37 (copy), l_UseDefaultThumbnailForAnimation_0 (copy)
    local v90 = v89 and v2.PreviewTypes.ModelPreview or v2.PreviewTypes.Thumbnail;
    if v88 and v37.isBuyableMarketplaceAsset(v88) then
        v90 = v2.PreviewTypes.ImagePicker;
    end;
    if l_UseDefaultThumbnailForAnimation_0 and v88 == Enum.AssetType.Animation then
        v90 = v2.PreviewTypes.Thumbnail;
    end;
    return v90;
end;
v37.getResultThumbnail = function(v91, v92) --[[ Line: 263 ]] --[[ Name: getResultThumbnail ]]
    -- upvalues: v5 (copy), v2 (copy)
    local _ = nil;
    if v92 then
        return (v92:GetTemporaryId());
    else
        return (v5.constructAssetThumbnailUrl(v91, v2.rbxThumbSizes.AssetThumbnailSize, v2.rbxThumbSizes.AssetThumbnailSize));
    end;
end;
v37.isPackagePublishAllowed = function(v94, v95) --[[ Line: 284 ]] --[[ Name: isPackagePublishAllowed ]]
    -- upvalues: l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (copy), v37 (copy)
    local v96 = true;
    local v97 = nil;
    if #v94 > 1 then
        v96 = false;
        v97 = if not not l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then if v95 then v95:getText("AssetConfigPackage", "CantConvertMultipleInstancesWarning") else nil else v95:getText("AssetConfigPackage", "CantConvertMultipleInstancesWarning");
    end;
    local v98 = v94[1];
    if v37.isPackage(v98) then
        v96 = false;
    end;
    if v98:IsA("Model") and v98.PrimaryPart ~= nil and v98.PrimaryPart.Archivable ~= true then
        v96 = false;
        v97 = if not not l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then if v95 then v95:getText("AssetConfigPackage", "CantConvertModelWithPrimaryPartNonArchivableWarning") else nil else v95:getText("AssetConfigPackage", "CantConvertModelWithPrimaryPartNonArchivableWarning");
    end;
    if v98:IsA("PVInstance") == false and v98:FindFirstChildWhichIsA("PVInstance") ~= nil then
        v97 = if not not l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then if v95 then v95:getText("AssetConfigPackage", "Non3DRoot3DDescendentsWarning") else nil else v95:getText("AssetConfigPackage", "Non3DRoot3DDescendentsWarning");
    end;
    for _, v100 in pairs(v98:GetDescendants()) do
        if v100:IsA("PackageLink") and v100.Parent ~= v98 and v100.Status ~= nil and (v100.Status == "Changed" or v100.Status == "Changed + New Version Available") then
            v96 = false;
            if l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then
                if v95 then
                    v97 = v95:getText("AssetConfigPackage", "CantConvertIfChildPackageHasUnpublishedChangesWarning");
                else
                    v97 = nil;
                end;
            else
                v97 = v95:getText("AssetConfigPackage", "CantConvertIfChildPackageHasUnpublishedChangesWarning");
            end;
        end;
    end;
    return v96, v97;
end;
v37.isPackage = function(v101) --[[ Line: 364 ]] --[[ Name: isPackage ]]
    if v101:FindFirstChildOfClass("PackageLink") ~= nil then
        return true;
    else
        return false;
    end;
end;
v37.getUGCBodyBundleAssetQuantities = function(v102, v103, v104) --[[ Line: 386 ]] --[[ Name: getUGCBodyBundleAssetQuantities ]]
    -- upvalues: v37 (copy)
    local v105 = v37.getUGCBodyPartsAssetTypeMap(v102, v103, v104);
    if v105 == nil then
        return nil;
    else
        local v106 = {};
        for v107 in v105 do
            local l_Name_0 = v107.Name;
            local v109 = v106[l_Name_0];
            if v109 ~= nil then
                v106[l_Name_0] = v109 + 1;
            else
                v106[l_Name_0] = 1;
            end;
        end;
        return v106;
    end;
end;
v37.getBodyScaleValues = function(v110) --[[ Line: 423 ]] --[[ Name: getBodyScaleValues ]]
    -- upvalues: v20 (copy)
    assert(v20(), "FFlagEnableUGCBundleUploadBodyScale is not enabled");
    local l_Humanoid_0 = v110:FindFirstChild("Humanoid");
    if l_Humanoid_0 == nil then
        return nil;
    else
        local function _(v112) --[[ Line: 430 ]] --[[ Name: getValue ]]
            -- upvalues: l_Humanoid_0 (copy)
            local l_l_Humanoid_0_FirstChild_0 = l_Humanoid_0:FindFirstChild(v112);
            if l_l_Humanoid_0_FirstChild_0 ~= nil and l_l_Humanoid_0_FirstChild_0:IsA("NumberValue") then
                return l_l_Humanoid_0_FirstChild_0.Value;
            else
                return nil;
            end;
        end;
        local v115 = {};
        local l_BodyHeightScale_0 = l_Humanoid_0:FindFirstChild("BodyHeightScale");
        v115.height = if l_BodyHeightScale_0 ~= nil and l_BodyHeightScale_0:IsA("NumberValue") then l_BodyHeightScale_0.Value else nil;
        l_BodyHeightScale_0 = l_Humanoid_0:FindFirstChild("BodyWidthScale");
        v115.width = if l_BodyHeightScale_0 ~= nil and l_BodyHeightScale_0:IsA("NumberValue") then l_BodyHeightScale_0.Value else nil;
        l_BodyHeightScale_0 = l_Humanoid_0:FindFirstChild("HeadScale");
        v115.head = if l_BodyHeightScale_0 ~= nil and l_BodyHeightScale_0:IsA("NumberValue") then l_BodyHeightScale_0.Value else nil;
        l_BodyHeightScale_0 = l_Humanoid_0:FindFirstChild("BodyTypeScale");
        v115.bodyType = if l_BodyHeightScale_0 ~= nil and l_BodyHeightScale_0:IsA("NumberValue") then l_BodyHeightScale_0.Value else nil;
        l_BodyHeightScale_0 = l_Humanoid_0:FindFirstChild("BodyProportionScale");
        v115.proportion = if l_BodyHeightScale_0 ~= nil and l_BodyHeightScale_0:IsA("NumberValue") then l_BodyHeightScale_0.Value else nil;
        return v115;
    end;
end;
v37.getBodyColorSet = function(v117) --[[ Line: 453 ]] --[[ Name: getBodyColorSet ]]
    -- upvalues: v22 (copy)
    assert(v22(), "FFlagEnableBodyColorSetUploadSupport is not enabled");
    local l_BodyColors_0 = v117:FindFirstChildWhichIsA("BodyColors");
    if l_BodyColors_0 == nil then
        return nil;
    else
        return {
            headColor3 = tostring(l_BodyColors_0.HeadColor3:ToHex()), 
            torsoColor3 = tostring(l_BodyColors_0.TorsoColor3:ToHex()), 
            leftArmColor3 = tostring(l_BodyColors_0.LeftArmColor3:ToHex()), 
            rightArmColor3 = tostring(l_BodyColors_0.RightArmColor3:ToHex()), 
            leftLegColor3 = tostring(l_BodyColors_0.LeftLegColor3:ToHex()), 
            rightLegColor3 = tostring(l_BodyColors_0.RightLegColor3:ToHex())
        };
    end;
end;
v37.getUGCBundleTypeFromString = function(v119) --[[ Line: 476 ]] --[[ Name: getUGCBundleTypeFromString ]]
    -- upvalues: v2 (copy)
    return v2.UGCBundleTypeStringToEnumeration[v119];
end;
v37.getAllowedAssetTypeSettingsForBundle = function(v120, v121) --[[ Line: 485 ]] --[[ Name: getAllowedAssetTypeSettingsForBundle ]]
    -- upvalues: v7 (copy)
    if v121 == nil or v121 == v7.None then
        return nil;
    else
        return v120[v121.rawValue()].allowedAssetTypeSettings;
    end;
end;
v37.getAllowedAssetTypeEnumsForBundle = function(v122, v123) --[[ Line: 508 ]] --[[ Name: getAllowedAssetTypeEnumsForBundle ]]
    -- upvalues: v37 (copy), v2 (copy)
    local v124 = {};
    local v125 = v37.getAllowedAssetTypeSettingsForBundle(v122, v123);
    if v125 == nil then
        return v124;
    else
        for v126 in v125 do
            local v127 = v2.AllowedAssetStringsMetadataToAssetTypeMap[v126];
            if v127 ~= nil then
                table.insert(v124, v127);
            end;
        end;
        return v124;
    end;
end;
v37.getAllowedAssetTypeEnumsForBundleWithSettings = function(v128, v129) --[[ Line: 531 ]] --[[ Name: getAllowedAssetTypeEnumsForBundleWithSettings ]]
    -- upvalues: v37 (copy), v2 (copy)
    local v130 = {};
    local v131 = v37.getAllowedAssetTypeSettingsForBundle(v128, v129);
    if v131 == nil then
        return v130;
    else
        for v132, v133 in v131 do
            local v134 = v2.AllowedAssetStringsMetadataToAssetTypeMap[v132];
            if v134 ~= nil then
                table.insert(v130, {
                    assetType = v134, 
                    settings = v133
                });
            end;
        end;
        return v130;
    end;
end;
v37.isAllowedUGCAssetType = function(v135, v136) --[[ Line: 560 ]] --[[ Name: isAllowedUGCAssetType ]]
    return table.find(v136, v135) ~= nil;
end;
v37.getUGCBodyPartsAssetTypeMap = function(v137, v138, v139) --[[ Line: 599 ]] --[[ Name: getUGCBodyPartsAssetTypeMap ]]
    -- upvalues: v37 (copy), v2 (copy), v9 (copy)
    if not v137:IsA("Model") then
        return nil;
    else
        local v140 = v37.getAllowedAssetTypeEnumsForBundle(v138, v139);
        local v141 = {};
        for v142, v143 in v2.UGC_BODY_PARTS do
            local l_v137_FirstChild_0 = v137:FindFirstChild(v143);
            if l_v137_FirstChild_0 ~= nil then
                local v145 = v2.UGC_BODY_PART_NAMES_TO_ASSET_TYPE[v142];
                if v37.isAllowedUGCAssetType(v145, v140) then
                    if v141[v145] == nil then
                        v141[v145] = {
                            l_v137_FirstChild_0
                        };
                    else
                        v9.append(v141[v145], {
                            l_v137_FirstChild_0
                        });
                    end;
                end;
            end;
        end;
        return v141;
    end;
end;
v37.AssetTypeRequiresFolderForUpload = function(v146) --[[ Line: 636 ]] --[[ Name: AssetTypeRequiresFolderForUpload ]]
    if v146 == Enum.AssetType.DynamicHead or v146 == Enum.AssetType.EyebrowAccessory or v146 == Enum.AssetType.EyelashAccessory or v146 == Enum.AssetType.HairAccessory then
        return false;
    else
        return true;
    end;
end;
v37.createUGCBodyPartFolders = function(v147, v148, v149, v150) --[[ Line: 663 ]] --[[ Name: createUGCBodyPartFolders ]]
    -- upvalues: v37 (copy)
    local v151 = v37.getUGCBodyPartsAssetTypeMap(v147, v148, v149);
    if v151 == nil then
        return nil;
    else
        local v152 = {};
        for v153, v154 in v151 do
            if v37.AssetTypeRequiresFolderForUpload(v153) then
                local l_Folder_0 = Instance.new("Folder");
                l_Folder_0.Name = "R15ArtistIntent";
                for _, v157 in v154 do
                    v157.Parent = l_Folder_0;
                end;
                v152[v153] = {
                    l_Folder_0
                };
                if v150 then
                    local v158 = l_Folder_0:Clone();
                    v158.Name = "R15Fixed";
                    table.insert(v152[v153], v158);
                    local l_Folder_1 = Instance.new("Folder");
                    l_Folder_1.Name = "R6";
                    table.insert(v152[v153], l_Folder_1);
                end;
            else
                v152[v153] = v154;
            end;
        end;
        return v152;
    end;
end;
v37.getLocalizedUGCBundleName = function(v160, v161) --[[ Line: 712 ]] --[[ Name: getLocalizedUGCBundleName ]]
    -- upvalues: v2 (copy)
    if v160 == v2.UGCBundleTypes.Body then
        return v161:getText("AssetConfig", "UGCBodyBundleName");
    elseif v160 == v2.UGCBundleTypes.DynamicHead then
        return v161:getText("AssetConfig", "UGCDynamicHeadBundleName");
    else
        return "";
    end;
end;
v37.resetAvatarBodyPartsToOriginalSizeAndPosition = function(v162) --[[ Line: 728 ]] --[[ Name: resetAvatarBodyPartsToOriginalSizeAndPosition ]]
    -- upvalues: v21 (copy)
    if not v21() then
        return;
    else
        for _, v164 in v162:GetDescendants() do
            if v164.Name == "OriginalPosition" and v164.Parent:IsA("Attachment") then
                v164.Parent.Position = v164.Value;
            elseif v164.Name == "OriginalSize" and v164.Parent:IsA("MeshPart") then
                v164.Parent.Size = v164.Value;
            end;
        end;
        return;
    end;
end;
v37.sanitizeForValidation = function(v165) --[[ Line: 743 ]] --[[ Name: sanitizeForValidation ]]
    -- upvalues: v21 (copy), v37 (copy), v3 (copy)
    if v21() then
        v37.resetAvatarBodyPartsToOriginalSizeAndPosition(v165);
    end;
    v3(v165);
end;
if v16() then
    v37.getOptionalAssetTypesForBundle = function(v166, v167) --[[ Line: 755 ]] --[[ Name: getOptionalAssetTypesForBundle ]]
        -- upvalues: v37 (copy)
        local v168 = v37.getAllowedAssetTypeEnumsForBundleWithSettings(v166, v167);
        local v169 = {};
        for _, v171 in v168 do
            if v171.settings.minimumQuantity == 0 then
                table.insert(v169, v171.assetType);
            end;
        end;
        return v169;
    end;
    v37.getOptionalBodyPartsNotFound = function(v172, v173, v174) --[[ Line: 776 ]] --[[ Name: getOptionalBodyPartsNotFound ]]
        -- upvalues: v37 (copy)
        local v175 = v37.getOptionalAssetTypesForBundle(v173, v174);
        local v176 = v37.getUGCBodyPartsAssetTypeMap(v172, v173, v174);
        local v177 = {};
        if v176 == nil then
            return v177;
        else
            for _, v179 in v175 do
                if v176[v179] == nil then
                    table.insert(v177, v179);
                end;
            end;
            return v177;
        end;
    end;
end;
if l_EnableUGCBundleUnknownMeshPartFiltering_0 then
    v37.getAllowedAssetTypesByBundleType = function(v180, v181) --[[ Line: 809 ]] --[[ Name: getAllowedAssetTypesByBundleType ]]
        -- upvalues: v37 (copy)
        local v182 = v37.getAllowedAssetTypeEnumsForBundle(v180, v181);
        local v183 = {};
        for _, v185 in v182 do
            v183[v185] = v185;
        end;
        return v183;
    end;
    v37.getUnknownMeshPartNames = function(v186) --[[ Line: 823 ]] --[[ Name: getUnknownMeshPartNames ]]
        -- upvalues: v2 (copy)
        local v187 = {};
        for _, v189 in pairs(v186:GetChildren()) do
            if v2.UGC_BODY_PARTS[v189.Name] == nil and v189:IsA("MeshPart") then
                table.insert(v187, v189.Name);
            end;
        end;
        return v187;
    end;
end;
v37.getAvatarAssetTypeAsString = function(v190) --[[ Line: 836 ]] --[[ Name: getAvatarAssetTypeAsString ]]
    -- upvalues: v37 (copy)
    if v190 ~= nil and type(v190) == "userdata" then
        if v37.isUGCBundleType(v190) then
            return v190.rawValue();
        elseif v37.isCatalogAsset(v190) then
            return v190.Name;
        end;
    end;
    return "";
end;
return v37;