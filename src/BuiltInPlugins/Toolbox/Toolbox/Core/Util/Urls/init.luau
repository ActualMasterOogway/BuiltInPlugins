local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local l_HttpService_0 = game:GetService("HttpService");
local l_DisableSalesPageForAvatarCreations2_0 = game:GetFastFlag("DisableSalesPageForAvatarCreations2");
local l_UpdateAssetUploadResultBundleConfigureLink2_0 = game:GetFastFlag("UpdateAssetUploadResultBundleConfigureLink2");
local l_ChangeAvatarAssetCreatorDashboardLink_0 = game:GetFastFlag("ChangeAvatarAssetCreatorDashboardLink");
local v6 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagEnableUGCForAllChecks);
local v7 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows);
local v8 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxCodeUnderstandingSummary);
local l_ToolboxVideoTestUseLocalAudioFile_0 = game:GetFastFlag("ToolboxVideoTestUseLocalAudioFile");
local v10 = require(l_Util_0.SharedFlags.getFFlagToolboxAddBuyerStatus);
local v11 = require(l_Util_0.SharedFlags.getFFlagToolboxRemoveRobuxProductEntirely);
local v12 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxAssetConfigOnboardingLink);
local v13 = require(l_Util_0.SharedFlags.getFFlagEnableUnknownErrorCreatorDashboardMessage);
local l_game_EngineFeature_0 = game:GetEngineFeature("ToolboxSampleProductMUS418");
local v15 = require(l_Util_0.SharedFlags.getFFlagToolboxGrantUponInsertion);
local v16 = require(l_Util_0.SharedFlags.getFFlagToolboxMigrateToOpenCloudUpload);
local v17 = require(l_Util_0.SharedFlags.getFFlagToolboxMigrateVoting);
local v18 = require(l_Util_0.SharedFlags.getFFlagToolboxCreatorContextThumbnail);
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local _ = require(l_Packages_0.Framework);
local v21 = require(l_Packages_0.Dash);
local v22 = require(l_Packages_0.LuauPolyfill);
local l_Set_0 = v22.Set;
local l_Object_0 = v22.Object;
local l_Array_0 = v22.Array;
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetQuotaTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetSubTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.HomeTypes);
local v29 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v30 = require(l_script_FirstAncestor_0.Libs.Http.Url);
local v31 = require(l_script_FirstAncestor_0.Core.Util.ToolboxUtilities);
local v32 = require(l_Util_0.FiatUtil);
local v33 = require(l_Util_0.getPlaceId);
local v34 = require(l_Util_0.wrapStrictTable);
local v35 = {};
local v36 = v30.BASE_URL .. "IDE/Toolbox/Items?";
local v37 = v30.DEVELOP_URL .. "v1/toolbox/items?";
local v38 = v30.ITEM_CONFIGURATION_URL .. "v1/creations/get-assets?";
local v39 = v30.ITEM_CONFIGURATION_URL .. "v1/creations/get-asset-details";
local v40 = v30.USERS_URL .. "/v1/users/%d";
local v41 = v30.GROUP_URL .. "v0/groups/%d";
local v42 = v30.ITEM_CONFIGURATION_URL .. "v1/metadata";
local v43 = v30.PUBLISH_URL .. "v1/assets/upload";
local v44 = v30.PUBLISH_URL .. "v1/assets/%d/thumbnail";
local v45 = v30.DEVELOP_URL .. "v1/assets/%d";
local v46 = v30.ITEM_CONFIGURATION_URL .. "v1/assets/%d/release";
local v47 = v30.ITEM_CONFIGURATION_URL .. "v1/assets/%d/update-price";
local v48 = v30.THUMBNAIL_URL .. "v1/assets?";
local v49 = if v6() then v30.ITEM_CONFIGURATION_URL .. "v1/collectibles/check-item-upload-access?" else nil;
local v50 = v30.ITEM_CONFIGURATION_URL .. "v1/bundles/metadata";
local v51 = v30.ITEM_CONFIGURATION_URL .. "v1/bundles/creation-fee";
local v52 = v30.ITEM_CONFIGURATION_URL .. "v1/bundles/create-context";
local v53 = v30.ITEM_CONFIGURATION_URL .. "v1/bundles";
local v54 = v30.ITEM_CONFIGURATION_URL .. "v1/bundles/status";
local v55 = v30.APIS_URL .. "resource-settings/v1/preferences:batchGet?preferenceTypes=AvatarBundles";
local v56 = v30.APIS_URL .. "resource-settings/v1/bundles";
local v57 = v30.BASE_URL .. "voting/vote?assetId=%s&vote=%s";
local v58 = if v17() then v30.APIS_URL .. "voting-api/vote/asset/%s?vote=%s" else nil;
local v59 = if v17() then v30.APIS_URL .. "voting-api/vote/asset/%s" else nil;
local _ = v30.BASE_URL .. "IDE/Toolbox/InsertAsset?";
local v61 = v30.DEVELOP_URL .. "v1/user/groups/canmanage";
local v62 = v30.APIS_URL .. "studio-plugin-api/v1/plugins?";
local v63 = v30.BASE_URL .. "asset/?";
local v64 = v30.GAME_ASSET_URL .. "asset/?";
local _ = v30.GAME_ASSET_URL .. "asset-thumbnail/image?";
local v66 = v30.BASE_URL .. "headshot-thumbnail/image?";
local v67 = v30.CATALOG_URL .. "v1%s";
local v68 = v30.DEVELOP_URL .. "v1/assets/%s/saved-versions";
local v69 = v30.DEVELOP_URL .. "v1/assets/%s/saved-versions?limit=%s";
local _ = v30.DEVELOP_URL .. "v1/assets/%s/saved-versions?cursor=%s";
local v71 = v30.DEVELOP_URL .. "v1/assets/%s/revert-version?";
local v72 = v30.DEVELOP_URL .. "v1/assets?";
local v73 = v30.APIS_URL .. "packages-api/v1/packages/assets/versions/notes/get";
local v74 = v30.APIS_URL .. "packages-api/v1/packages/version-note/%s/versions/%s";
local v75 = v30.APIS_URL .. "assets/user-auth/v1/operations/%s";
local v76 = v30.APIS_URL .. "assets/user-auth/v1/assets";
local v77 = v30.APIS_URL .. "assets/user-auth/v1/assets/%s";
local v78 = v30.APIS_URL .. "assets/user-auth/v1/assets/%s";
local v79 = v30.DEVELOP_URL .. "v1/assets/%s?";
local v80 = v30.DATA_URL .. "Data/Upload.ashx?";
local v81 = v30.GROUP_URL .. "v2/users/%%20%%20%s/groups/roles";
local v82 = v30.DEVELOP_URL .. "v1/user/is-verified-creator";
local v83 = v30.GROUP_URL .. "v1/groups/%s/roles";
local v84 = v30.FRIENDS_URL .. "v1/users/%d/friends";
local v85 = v30.BASE_URL .. "upgrades/robux";
local v86 = v30.ECONOMY_URL .. "v1/users/%d/currency";
local _ = v30.DEVELOP_URL .. "v1/user/%d/canmanage/%d";
local v88 = v30.ECONOMY_URL .. "/v1/purchases/products/%d";
local v89 = v30.APIS_URL .. "creator-marketplace-purchasing-service/v1/products/%d/purchase";
local v90 = v30.APIS_URL .. "marketplace-fiat-service/v1/product/purchase";
local v91 = if v10() then v30.APIS_URL .. "marketplace-fiat-service/v1/purchaser/status" else nil;
local v92 = if v12() then v30.APIS_URL .. "marketplace-fiat-service/v1/seller/status" else nil;
local v93 = l_ChangeAvatarAssetCreatorDashboardLink_0 and "/creations/catalog/%d/configure" or "/creations?activeTab=TShirt";
local v94 = l_UpdateAssetUploadResultBundleConfigureLink2_0 and "/creations/bundle/%d/configure" or nil;
local v95 = v13() and "/creations" or nil;
local v96 = v30.APIS_URL .. "packages-api/v1/packages/assets/versions/metadata/get";
local v97 = v30.APIS_URL .. "asset-permissions-api/v1/assets/%s/permissions";
local v98 = v30.APIS_URL .. "asset-permissions-api/v1/assets/check-actions";
local v99 = v30.APIS_URL .. "asset-permissions-api/v1/assets/check-permissions";
local v100 = if v15() then v30.APIS_URL .. "asset-permissions-api/v1/assets/permissions" else nil;
local v101 = v30.ITEM_CONFIGURATION_URL .. "v1/tags/prefix-search?";
local v102 = v30.ITEM_CONFIGURATION_URL .. "v1/item-tags/metadata";
local v103 = v30.ITEM_CONFIGURATION_URL .. "v1/item-tags?";
local v104 = v30.ITEM_CONFIGURATION_URL .. "v1/item-tags";
local v105 = v30.ITEM_CONFIGURATION_URL .. "v1/item-tags/%s";
local v106 = v30.APIS_URL .. "toolbox-service/v1";
local _ = v30.APIS_URL .. "toolbox-service/v1/%s?";
local v108 = v30.APIS_URL .. "toolbox-service/v1/items/details?";
local v109 = v30.APIS_URL .. "toolbox-service/v1/creations/group/%d/%s?";
local v110 = v30.APIS_URL .. "toolbox-service/v1/creations/user/%d/%s?";
local v111 = v106 .. "/voting/vote?";
local v112 = v30.ITEM_CONFIGURATION_URL .. "v1/avatar-assets/%s/get-upload-fee";
local v113 = v30.ITEM_CONFIGURATION_URL .. "v1/avatar-assets/%s/upload";
local v114 = v30.ITEM_CONFIGURATION_URL .. "v1/asset-types/%s/agents?";
local v115 = v30.APIS_URL .. "autocomplete-studio/v2/suggest?";
local v116 = v30.APIS_URL .. "marketplace-publishing-requirements-api/v1/requirements?";
local v117 = if v8 then v30.APIS_URL .. "asset-content-properties-service/v1/metadata/%d/%s/code-understanding-summaries" else nil;
local v118 = (v30.APIS_URL .. "user/cloud/v2/creator-store-products/") .. "PRODUCT_NAMESPACE_CREATOR_MARKETPLACE_ASSET-%s-%d";
local v119 = v30.PUBLISH_URL .. "v1/assets/%d/media";
local v120 = v30.PUBLISH_URL .. "v1/assets/%d/media/%d";
local v121 = v30.PUBLISH_URL .. "v1/assets/%d/media/order";
local v122 = v30.PUBLISH_URL .. "v1/assets/%d/media";
local _ = v30.DEVELOP_URL .. "v1/assets/%d/latest-saved-version";
local v124 = v30.DEVELOP_URL .. "v1/universes/%d";
local v125 = if l_game_EngineFeature_0 then v30.INVENTORY_URL .. "v1/users/%d/items/%s/%d/is-owned" else nil;
local v126 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagToolboxAddPackageVersionDescriptions);
v35.constructGetItemDetails = function(v127) --[[ Line: 209 ]] --[[ Name: constructGetItemDetails ]]
    -- upvalues: v108 (copy), v30 (copy)
    return v108 .. v30.makeQueryString({
        assetIds = table.concat(v127, ",")
    });
end;
v35.constructGetAssetsUrl = function(v128, v129, v130, v131, v132, v133, v134) --[[ Line: 216 ]] --[[ Name: constructGetAssetsUrl ]]
    -- upvalues: v36 (copy), v30 (copy)
    return v36 .. v30.makeQueryString({
        category = v128, 
        keyword = v129, 
        num = v130, 
        page = v131, 
        sort = v132, 
        groupId = v133, 
        creatorId = v134
    });
end;
local v135 = l_Set_0.new({
    v29.MUSIC.name, 
    v29.SOUND_EFFECTS.name, 
    v29.UNKNOWN_AUDIO.name, 
    v29.FREE_FONTS.name
});
v35.usesMarketplaceRoute = function(v136) --[[ Line: 236 ]] --[[ Name: usesMarketplaceRoute ]]
    -- upvalues: v135 (copy)
    return v135:has(v136);
end;
v35.constructGetToolboxItemsUrl = function(v137) --[[ Line: 240 ]] --[[ Name: constructGetToolboxItemsUrl ]]
    -- upvalues: l_Object_0 (copy), v21 (copy), l_Array_0 (copy), v33 (copy), v29 (copy), v106 (copy), v35 (copy), v30 (copy), v7 (copy)
    local l_categoryName_0 = v137.categoryName;
    local l_ownerId_0 = v137.ownerId;
    local v140 = l_Object_0.assign({}, v21.omit(v137, {
        "categoryName", 
        "sectionName", 
        "ownerId", 
        "tags", 
        "qualityFilterData"
    }), {
        tags = if v137.tags then l_Array_0.join(v137.tags, ",") else nil
    }, {
        placeId = if v137.sectionName then v33() else nil
    }, {
        assetsInCameraViewport = if v137.assetsInCameraViewport then table.concat(v137.assetsInCameraViewport, ",") else nil
    }, {
        assetsInCameraVicinity = if v137.assetsInCameraVicinity then table.concat(v137.assetsInCameraVicinity, ",") else nil
    });
    local v141 = v29.getCategoryByName(l_categoryName_0);
    if not v141 then
        error(string.format("Could not find categoryData for %s", l_categoryName_0));
    end;
    local v142 = nil;
    if v137.sectionName then
        local l_Value_0 = v29.ToolboxAssetTypeToEngine[v141.assetType].Value;
        v142 = string.format("%s/home/%s/section/%s/assets", v106, l_Value_0, v137.sectionName);
    elseif v35.usesMarketplaceRoute(v141.name) then
        v142 = string.format("%s/marketplace/%d", v106, v141.assetType);
    else
        local v144 = v29.API_NAMES[l_categoryName_0];
        local v145 = v29.getTabForCategoryName(v141.name) == v29.CREATIONS;
        if not v144 then
            error(string.format("Could not find API_NAME for %s", l_categoryName_0));
        end;
        v142 = if v141.ownershipType == v29.OwnershipType.MY then string.format("%s/inventory/user/%d/%s", v106, l_ownerId_0, v144) else if v141.ownershipType == v29.OwnershipType.GROUP then if v145 then string.format("%s/creations/group/%d/%s", v106, l_ownerId_0, v144) else string.format("%s/inventory/group/%d/%s", v106, l_ownerId_0, v144) else if v141.ownershipType == v29.OwnershipType.RECENT then string.format("%s/recent/user/%d/%s", v106, l_ownerId_0, v144) else string.format("%s/%s", v106, v144);
    end;
    if v140.queryParams ~= nil then
        for v146, v147 in pairs(v140.queryParams) do
            v140[v146] = v147;
        end;
    end;
    local v148 = v30.makeQueryString(v140, false, not v7() or false);
    if #v148 > 0 then
        v142 = v142 .. "?" .. v148;
    end;
    return v142;
end;
v35.getDevelopAssetUrl = function(v149, v150, v151, v152, v153, v154, v155, v156) --[[ Line: 338 ]] --[[ Name: getDevelopAssetUrl ]]
    -- upvalues: v37 (copy), v30 (copy)
    return v37 .. v30.makeQueryString({
        category = v149, 
        keyword = v150, 
        num = v153, 
        page = v154, 
        sort = v151, 
        groupId = v155, 
        creatorType = v156, 
        creatorId = v152
    });
end;
v35.constructGetAssetGroupCreationsUrl = function(v157, v158, v159, _, v161) --[[ Line: 352 ]] --[[ Name: constructGetAssetGroupCreationsUrl ]]
    -- upvalues: v109 (copy), v30 (copy)
    return string.format(v109, v161, v157) .. v30.makeQueryString({
        limit = v158, 
        cursor = v159
    });
end;
v35.constructGetAssetCreationsUrl = function(v162, v163, v164, _, v166) --[[ Line: 361 ]] --[[ Name: constructGetAssetCreationsUrl ]]
    -- upvalues: v38 (copy), v30 (copy)
    return v38 .. v30.makeQueryString({
        assetType = v162, 
        isArchived = false, 
        limit = v163, 
        cursor = v164, 
        groupId = v166
    });
end;
v35.constructGetAssetCreationsUrlToolboxService = function(v167, v168, v169, v170, v171) --[[ Line: 374 ]] --[[ Name: constructGetAssetCreationsUrlToolboxService ]]
    -- upvalues: v110 (copy), v30 (copy)
    return string.format(v110, v171, v167) .. v30.makeQueryString({
        limit = v168, 
        cursor = v169, 
        separateModelsAndPackages = v170
    });
end;
v35.constructGetAssetCreationDetailsUrl = function() --[[ Line: 389 ]] --[[ Name: constructGetAssetCreationDetailsUrl ]]
    -- upvalues: v39 (copy)
    return v39;
end;
v35.constructGetCreatorInfoUrl = function(v172, v173) --[[ Line: 393 ]] --[[ Name: constructGetCreatorInfoUrl ]]
    -- upvalues: v41 (copy), v40 (copy)
    assert(type(v172) == "number");
    if v173 == Enum.CreatorType.Group.Value then
        return v41:format(v172);
    elseif v173 == Enum.CreatorType.User.Value then
        return v40:format(v172);
    else
        error(("Unknown creatorType '%s'"):format(v173));
        return;
    end;
end;
v35.constructGetMetaDataUrl = function() --[[ Line: 405 ]] --[[ Name: constructGetMetaDataUrl ]]
    -- upvalues: v42 (copy)
    return v42;
end;
v35.constructGetBundleMetadataUrl = function() --[[ Line: 409 ]] --[[ Name: constructGetBundleMetadataUrl ]]
    -- upvalues: v50 (copy)
    return v50;
end;
v35.constructPostBundleCreationFeeUrl = function() --[[ Line: 413 ]] --[[ Name: constructPostBundleCreationFeeUrl ]]
    -- upvalues: v51 (copy)
    return v51;
end;
v35.constructPostBundleCreationContextUrl = function() --[[ Line: 417 ]] --[[ Name: constructPostBundleCreationContextUrl ]]
    -- upvalues: v52 (copy)
    return v52;
end;
v35.constructPostCreateBundleUrl = function() --[[ Line: 421 ]] --[[ Name: constructPostCreateBundleUrl ]]
    -- upvalues: v53 (copy)
    return v53;
end;
v35.constructGetBundleCreationStatusUrl = function(v174) --[[ Line: 425 ]] --[[ Name: constructGetBundleCreationStatusUrl ]]
    -- upvalues: v54 (copy)
    return ("%s/%s"):format(v54, v174);
end;
v35.constructGetDefaultCreateBundleDataSharingUrl = function() --[[ Line: 429 ]] --[[ Name: constructGetDefaultCreateBundleDataSharingUrl ]]
    -- upvalues: v55 (copy)
    return v55;
end;
v35.constructPostCreateBundleDataSharingUrl = function() --[[ Line: 433 ]] --[[ Name: constructPostCreateBundleDataSharingUrl ]]
    -- upvalues: v56 (copy)
    return v56;
end;
if v6() then
    v35.constructUploadPermissionStatusUrl = function(v175, v176) --[[ Line: 438 ]] --[[ Name: constructUploadPermissionStatusUrl ]]
        -- upvalues: v49 (copy), v30 (copy)
        if v175 == nil then
            return v49 .. v30.makeQueryString({
                targetType = tostring(v176)
            });
        else
            return v49 .. v30.makeQueryString({
                groupId = tostring(v175), 
                targetType = tostring(v176)
            });
        end;
    end;
end;
v35.constructUploadCatalogItemUrl = function() --[[ Line: 454 ]] --[[ Name: constructUploadCatalogItemUrl ]]
    -- upvalues: v43 (copy)
    return v43;
end;
v35.constructUploadAssetThumbnailUrl = function(v177) --[[ Line: 458 ]] --[[ Name: constructUploadAssetThumbnailUrl ]]
    -- upvalues: v44 (copy)
    return v44:format(v177);
end;
v35.contuctGetThumbnailStatusUrl = function(v178) --[[ Line: 462 ]] --[[ Name: contuctGetThumbnailStatusUrl ]]
    -- upvalues: v48 (copy), v30 (copy)
    return v48 .. v30.makeQueryString({
        assetIds = v178, 
        format = "Png", 
        size = "150x150"
    });
end;
v35.constructConfigureSalesUrl = function(v179) --[[ Line: 471 ]] --[[ Name: constructConfigureSalesUrl ]]
    -- upvalues: v46 (copy)
    return v46:format(v179);
end;
v35.constructUpdateSalesUrl = function(v180) --[[ Line: 475 ]] --[[ Name: constructUpdateSalesUrl ]]
    -- upvalues: v47 (copy)
    return v47:format(v180);
end;
v35.constructConfigureCatalogItemUrl = function(v181) --[[ Line: 479 ]] --[[ Name: constructConfigureCatalogItemUrl ]]
    -- upvalues: v45 (copy)
    return v45:format(v181);
end;
v35.constructGetVoteUrl = function(v182, v183) --[[ Line: 483 ]] --[[ Name: constructGetVoteUrl ]]
    -- upvalues: v111 (copy), v30 (copy)
    return v111 .. v30.makeQueryString({
        assetId = v182, 
        assetType = v183
    });
end;
v35.constructPostVoteUrl = function(v184, v185) --[[ Line: 490 ]] --[[ Name: constructPostVoteUrl ]]
    -- upvalues: v17 (copy), v58 (copy), v57 (copy)
    return string.format(if v17() then v58 else v57, v184, v185 and "true" or "false");
end;
if v17() then
    v35.constructPostUnvoteUrl = function(v186) --[[ Line: 499 ]] --[[ Name: constructPostUnvoteUrl ]]
        -- upvalues: v59 (copy)
        return string.format(v59, v186);
    end;
end;
v35.constructInsertAssetUrl = function(v187) --[[ Line: 503 ]] --[[ Name: constructInsertAssetUrl ]]
    -- upvalues: v106 (copy)
    return string.format("%s/insert/asset/%d", v106, v187);
end;
v35.constructGetPluginInfoUrl = function(v188) --[[ Line: 507 ]] --[[ Name: constructGetPluginInfoUrl ]]
    -- upvalues: v62 (copy), v30 (copy)
    return v62 .. v30.makeQueryString({
        pluginIds = v188
    });
end;
v35.constructGetManageableGroupsUrl = function() --[[ Line: 513 ]] --[[ Name: constructGetManageableGroupsUrl ]]
    -- upvalues: v61 (copy)
    return v61;
end;
v35.constructAssetIdString = function(v189) --[[ Line: 517 ]] --[[ Name: constructAssetIdString ]]
    -- upvalues: l_ToolboxVideoTestUseLocalAudioFile_0 (copy)
    if l_ToolboxVideoTestUseLocalAudioFile_0 then
        local v190 = tonumber(v189);
        if v190 then
            return ("rbxassetid://%d"):format(v190);
        else
            return (tostring(v189));
        end;
    else
        return ("rbxassetid://%d"):format(v189);
    end;
end;
v35.constructAssetIdUrl = function(v191) --[[ Line: 529 ]] --[[ Name: constructAssetIdUrl ]]
    -- upvalues: v63 (copy), v30 (copy)
    return v63 .. v30.makeQueryString({
        id = v191
    });
end;
v35.constructAssetSavedVersionString = function(v192, v193) --[[ Line: 535 ]] --[[ Name: constructAssetSavedVersionString ]]
    -- upvalues: v126 (copy), v69 (copy), v68 (copy)
    if v126() then
        return v69:format(v192, v193);
    else
        return v68:format(v192);
    end;
end;
v35.constructGetPackageVersionDescriptionString = function() --[[ Line: 543 ]] --[[ Name: constructGetPackageVersionDescriptionString ]]
    -- upvalues: v73 (copy)
    return v73;
end;
v35.constructSetPackageVersionDescriptionString = function(v194, v195) --[[ Line: 547 ]] --[[ Name: constructSetPackageVersionDescriptionString ]]
    -- upvalues: v74 (copy)
    return v74:format(v194, v195);
end;
v35.constructRevertAssetVersionString = function(v196, v197) --[[ Line: 551 ]] --[[ Name: constructRevertAssetVersionString ]]
    -- upvalues: v71 (copy), v30 (copy)
    return v71:format(v196) .. v30.makeQueryString({
        assetVersionNumber = v197
    });
end;
v35.constructGetDevelopAssetMetadata = function(v198) --[[ Line: 557 ]] --[[ Name: constructGetDevelopAssetMetadata ]]
    -- upvalues: v72 (copy), v30 (copy)
    return v72 .. v30.makeQueryString({
        assetIds = v198
    });
end;
v35.constructAssetGameAssetIdUrl = function(v199, v200, v201, v202) --[[ Line: 563 ]] --[[ Name: constructAssetGameAssetIdUrl ]]
    -- upvalues: v64 (copy), v30 (copy)
    return v64 .. v30.makeQueryString({
        id = v199, 
        assetName = v202
    }) .. "#" .. v30.makeQueryString({
        assetTypeId = v200, 
        isPackage = v201
    });
end;
v35.constructAssetThumbnailUrl = function(v203, v204, v205, v206) --[[ Line: 576 ]] --[[ Name: constructAssetThumbnailUrl ]]
    -- upvalues: v18 (copy)
    local v207 = v18() and "CreatorContextAsset" or "Asset";
    return ("rbxthumb://type=%s&id=%d&w=%d&h=%d"):format(v206 or v207, tonumber(v203) or 0, v204, v205);
end;
v35.constructRBXThumbUrl = function(v208, v209, v210) --[[ Line: 582 ]] --[[ Name: constructRBXThumbUrl ]]
    return ("rbxthumb://type=%s&id=%d&w=%d&h=%d"):format(v208, tonumber(v209) or 0, v210, v210);
end;
v35.constructUserSearchUrl = function(v211) --[[ Line: 586 ]] --[[ Name: constructUserSearchUrl ]]
    -- upvalues: v30 (copy), l_HttpService_0 (copy)
    return v30.APIS_URL .. "search-api/omni-search?" .. v30.makeQueryString({
        searchQuery = v211, 
        sessionId = l_HttpService_0:GenerateGUID(false), 
        pageType = "all", 
        verticalType = "user"
    });
end;
v35.constructUserThumbnailUrl = function(v212, v213) --[[ Line: 597 ]] --[[ Name: constructUserThumbnailUrl ]]
    -- upvalues: v66 (copy), v30 (copy)
    v213 = v213 or 100;
    return v66 .. v30.makeQueryString({
        userId = v212, 
        width = v213, 
        height = v213, 
        format = "png"
    });
end;
v35.constructFavoriteCountsUrl = function(v214) --[[ Line: 610 ]] --[[ Name: constructFavoriteCountsUrl ]]
    -- upvalues: v67 (copy)
    return v67:format(("/favorites/assets/%d/count"):format(v214));
end;
v35.constructGetFavoritedUrl = function(v215, v216) --[[ Line: 614 ]] --[[ Name: constructGetFavoritedUrl ]]
    -- upvalues: v67 (copy)
    return v67:format(("/favorites/users/%d/assets/%d/favorite"):format(v215, v216));
end;
v35.constructPostFavoriteUrl = function(v217, v218) --[[ Line: 618 ]] --[[ Name: constructPostFavoriteUrl ]]
    -- upvalues: v67 (copy)
    return v67:format(("/favorites/users/%d/assets/%d/favorite"):format(v217, v218));
end;
v35.constructDeleteFavoriteUrl = function(v219, v220) --[[ Line: 622 ]] --[[ Name: constructDeleteFavoriteUrl ]]
    -- upvalues: v67 (copy)
    return v67:format(("/favorites/users/%d/assets/%d/favorite"):format(v219, v220));
end;
v35.constructPatchAssetUrl = function(v221) --[[ Line: 626 ]] --[[ Name: constructPatchAssetUrl ]]
    -- upvalues: v79 (copy)
    return v79:format(v221);
end;
v35.constructPostUploadAssetUrl = function(v222, v223, v224, v225, v226, v227, v228, v229) --[[ Line: 631 ]] --[[ Name: constructPostUploadAssetUrl ]]
    -- upvalues: v16 (copy), v80 (copy), v30 (copy)
    assert(not v16(), "Urls.constructPostUploadAssetUrl is marked for deprecation");
    return v80 .. v30.makeQueryString({
        assetid = v222, 
        type = tostring(v223), 
        name = tostring(v224), 
        description = tostring(v225), 
        genreTypeId = v226, 
        ispublic = v227 and "True" or "False", 
        allowComments = v228 and "True" or "False", 
        groupId = v229 or ""
    });
end;
v35.constructOperationUrl = function(v230) --[[ Line: 655 ]] --[[ Name: constructOperationUrl ]]
    -- upvalues: v75 (copy)
    return v75:format(v230);
end;
v35.constructPostUploadAnimationUrl = function() --[[ Line: 660 ]] --[[ Name: constructPostUploadAnimationUrl ]]
    -- upvalues: v76 (copy)
    return v76;
end;
v35.constructValidateAnimationUrl = function(v231) --[[ Line: 664 ]] --[[ Name: constructValidateAnimationUrl ]]
    -- upvalues: v78 (copy)
    return v78:format(v231);
end;
v35.constructPostOverwriteAnimationUrl = function(v232) --[[ Line: 668 ]] --[[ Name: constructPostOverwriteAnimationUrl ]]
    -- upvalues: v77 (copy)
    return v77:format(v232);
end;
v35.constructOverrideAssetsUrl = function(v233, v234) --[[ Line: 672 ]] --[[ Name: constructOverrideAssetsUrl ]]
    -- upvalues: v16 (copy), v80 (copy), v30 (copy)
    assert(not v16(), "Urls.constructOverrideAssetsUrl is marked for deprecation");
    return v80 .. v30.makeQueryString({
        assetid = v233, 
        type = v234
    });
end;
v35.constructGetMyGroupUrl = function(v235) --[[ Line: 680 ]] --[[ Name: constructGetMyGroupUrl ]]
    -- upvalues: v81 (copy)
    return v81:format((tostring(v235)));
end;
v35.constructIsVerifiedCreatorUrl = function() --[[ Line: 684 ]] --[[ Name: constructIsVerifiedCreatorUrl ]]
    -- upvalues: v82 (copy)
    return v82;
end;
v35.constructGetUserFriendsUrl = function(v236) --[[ Line: 688 ]] --[[ Name: constructGetUserFriendsUrl ]]
    -- upvalues: v84 (copy)
    return v84:format(v236);
end;
v35.constructAssetPermissionsUrl = function(v237) --[[ Line: 692 ]] --[[ Name: constructAssetPermissionsUrl ]]
    -- upvalues: v97 (copy)
    return v97:format(v237);
end;
if v15() then
    v35.constructAssetBatchGrantPermissionsUrl = function() --[[ Line: 697 ]] --[[ Name: constructAssetBatchGrantPermissionsUrl ]]
        -- upvalues: v100 (copy)
        return v100;
    end;
end;
v35.constructAssetCheckPermissionsUrl = function() --[[ Line: 703 ]] --[[ Name: constructAssetCheckPermissionsUrl ]]
    -- upvalues: v98 (copy)
    return v98;
end;
v35.getRobuxPurchaseUrl = function() --[[ Line: 707 ]] --[[ Name: getRobuxPurchaseUrl ]]
    -- upvalues: v85 (copy)
    return v85;
end;
v35.constructPostPackageMetadata = function() --[[ Line: 711 ]] --[[ Name: constructPostPackageMetadata ]]
    -- upvalues: v96 (copy)
    return v96;
end;
v35.constructGetRobuxBalanceUrl = function(v238) --[[ Line: 715 ]] --[[ Name: constructGetRobuxBalanceUrl ]]
    -- upvalues: v86 (copy)
    return v86:format(v238);
end;
v35.constructGetGroupRoleInfoUrl = function(v239) --[[ Line: 720 ]] --[[ Name: constructGetGroupRoleInfoUrl ]]
    -- upvalues: v83 (copy)
    return v83:format(v239);
end;
v35.constructAssetCheckPermissionsBatchUrl = function() --[[ Line: 724 ]] --[[ Name: constructAssetCheckPermissionsBatchUrl ]]
    -- upvalues: v99 (copy)
    return v99;
end;
v35.constructAssetPurchaseUrl = function(v240, v241) --[[ Line: 729 ]] --[[ Name: constructAssetPurchaseUrl ]]
    -- upvalues: v11 (copy), v90 (copy), v89 (copy), v88 (copy)
    if v240 == nil or v11() then
        return v90;
    elseif v241 == Enum.AssetType.Plugin.Value then
        return v89:format(v240);
    else
        return v88:format(v240);
    end;
end;
if v10() then
    v35.constructPurchaserStatusUrl = function() --[[ Line: 742 ]] --[[ Name: constructPurchaserStatusUrl ]]
        -- upvalues: v91 (copy)
        return v91;
    end;
end;
if v12() then
    v35.constructSellerStatusUrl = function() --[[ Line: 748 ]] --[[ Name: constructSellerStatusUrl ]]
        -- upvalues: v92 (copy)
        return v92;
    end;
end;
v35.constructGetTagsPrefixSearchUrl = function(v242, v243) --[[ Line: 753 ]] --[[ Name: constructGetTagsPrefixSearchUrl ]]
    -- upvalues: v101 (copy), v30 (copy)
    return v101 .. v30.makeQueryString({
        prefix = v242, 
        numberOfResults = v243
    });
end;
v35.constructGetTagsMetadataUrl = function() --[[ Line: 760 ]] --[[ Name: constructGetTagsMetadataUrl ]]
    -- upvalues: v102 (copy)
    return v102;
end;
v35.constructGetAssetItemTagsUrl = function(v244) --[[ Line: 764 ]] --[[ Name: constructGetAssetItemTagsUrl ]]
    -- upvalues: v103 (copy), v30 (copy)
    return v103 .. v30.makeQueryString({
        itemIds = string.format("AssetId:%d", v244)
    });
end;
v35.constructAddAssetTagUrl = function() --[[ Line: 770 ]] --[[ Name: constructAddAssetTagUrl ]]
    -- upvalues: v104 (copy)
    return v104;
end;
v35.constructDeleteAssetItemTagUrl = function(v245) --[[ Line: 774 ]] --[[ Name: constructDeleteAssetItemTagUrl ]]
    -- upvalues: v105 (copy)
    return v105:format(v245);
end;
v35.constructUploadCatalogItemFormatUrl = function(v246, v247, v248, v249, v250, v251) --[[ Line: 778 ]] --[[ Name: constructUploadCatalogItemFormatUrl ]]
    -- upvalues: v80 (copy), v30 (copy)
    return v80 .. v30.makeQueryString({
        assetid = v246, 
        type = tostring(v247), 
        name = tostring(v248), 
        description = tostring(v249), 
        isPublic = v250 and "True" or "False", 
        format = v251
    });
end;
v35.constructAvatarAssetsGetUploadFeeUrl = function(v252) --[[ Line: 790 ]] --[[ Name: constructAvatarAssetsGetUploadFeeUrl ]]
    -- upvalues: v112 (copy)
    return v112:format(v252.Name);
end;
v35.constructAvatarAssetsUploadUrl = function(v253) --[[ Line: 794 ]] --[[ Name: constructAvatarAssetsUploadUrl ]]
    -- upvalues: v113 (copy)
    return v113:format(v253.Name);
end;
v35.constructAssetTypeAgentsUrl = function(v254) --[[ Line: 798 ]] --[[ Name: constructAssetTypeAgentsUrl ]]
    -- upvalues: v114 (copy), v30 (copy)
    return v114:format(v254.Name) .. v30.makeQueryString({
        ["requestModel.actionType"] = "Upload", 
        ["requestModel.agentType"] = "Group"
    });
end;
v35.constructToolboxAutocompleteUrl = function(v255, v256, v257) --[[ Line: 806 ]] --[[ Name: constructToolboxAutocompleteUrl ]]
    -- upvalues: v115 (copy), v30 (copy)
    return v115 .. v30.makeQueryString({
        cat = v255, 
        limit = v257, 
        prefix = v256
    });
end;
v35.constructGetHomeConfigurationUrl = function(v258, v259) --[[ Line: 816 ]] --[[ Name: constructGetHomeConfigurationUrl ]]
    -- upvalues: v106 (copy), v30 (copy), v33 (copy)
    return string.format("%s/home/%s/configuration?", v106, v258.Name) .. v30.makeQueryString({
        locale = v259, 
        placeId = v33()
    });
end;
v35.constructPublishingRequirementsUrl = function(v260, v261, v262, v263) --[[ Line: 824 ]] --[[ Name: constructPublishingRequirementsUrl ]]
    -- upvalues: v116 (copy), v30 (copy)
    return v116 .. v30.makeQueryString({
        assetId = v260, 
        assetType = if v261 then v261.Name else nil, 
        assetSubTypes = v262, 
        marketplaceType = v263
    });
end;
v35.getCreatorMarketplaceQuotas = function(v264, v265) --[[ Line: 839 ]] --[[ Name: getCreatorMarketplaceQuotas ]]
    -- upvalues: v30 (copy)
    return string.format("%s/v1/asset-quotas?%s", v30.PUBLISH_URL, v30.makeQueryString({
        assetType = v264.Name, 
        resourceType = v265
    }));
end;
v35.constructGetAssetMediaIdsUrl = function(v266) --[[ Line: 853 ]] --[[ Name: constructGetAssetMediaIdsUrl ]]
    -- upvalues: v119 (copy)
    return v119:format(v266);
end;
v35.constructDeleteAssetMediaUrl = function(v267, v268) --[[ Line: 857 ]] --[[ Name: constructDeleteAssetMediaUrl ]]
    -- upvalues: v120 (copy)
    return v120:format(v267, v268);
end;
v35.constructPostSetAssetMediaOrder = function(v269) --[[ Line: 861 ]] --[[ Name: constructPostSetAssetMediaOrder ]]
    -- upvalues: v121 (copy)
    return v121:format(v269);
end;
v35.constructPostUploadAssetMedia = function(v270) --[[ Line: 865 ]] --[[ Name: constructPostUploadAssetMedia ]]
    -- upvalues: v122 (copy)
    return v122:format(v270);
end;
if l_DisableSalesPageForAvatarCreations2_0 then
    v35.constructCreatorDashboardAssetConfigUrl = function(v271) --[[ Line: 870 ]] --[[ Name: constructCreatorDashboardAssetConfigUrl ]]
        -- upvalues: v31 (copy)
        if v31 then
            local v272 = v31.getCreatorDashboardBaseUrl();
            local v273 = v31.getCreatorDashboardCatalogConfigUrlExtension(v271);
            if v272 and v273 then
                return v272 .. v273 or "";
            end;
        end;
        return "";
    end;
end;
if l_ChangeAvatarAssetCreatorDashboardLink_0 then
    v35.constructCreatorDashboardConfigAvatarAssetUrl = function(v274) --[[ Line: 883 ]] --[[ Name: constructCreatorDashboardConfigAvatarAssetUrl ]]
        -- upvalues: v31 (copy), v93 (copy)
        local v275 = if v31 then v31.getCreatorDashboardBaseUrl() else nil;
        local v276 = if v93 then v93:format(v274) else nil;
        if v275 and v276 then
            return v275 .. v276 or "";
        else
            return "";
        end;
    end;
else
    v35.constructCreatorDashboardAvatarAssetUrl = function() --[[ Line: 892 ]] --[[ Name: constructCreatorDashboardAvatarAssetUrl ]]
        -- upvalues: v31 (copy), v93 (copy)
        local v277 = if v31 then v31.getCreatorDashboardBaseUrl() else nil;
        local v278 = if v93 then v93 else nil;
        if v277 and v278 then
            return v277 .. v278 or "";
        else
            return "";
        end;
    end;
end;
if v13() then
    v35.constructCreatorDashboardCreationsPageUrl = function() --[[ Line: 903 ]] --[[ Name: constructCreatorDashboardCreationsPageUrl ]]
        -- upvalues: v31 (copy), v95 (copy)
        local v279 = v31.getCreatorDashboardBaseUrl();
        local l_v95_0 = v95;
        if v279 and l_v95_0 then
            return v279 .. l_v95_0 or "";
        else
            return "";
        end;
    end;
end;
if l_UpdateAssetUploadResultBundleConfigureLink2_0 then
    v35.constructCreatorDashboardBundleConfigureUrl = function(v281) --[[ Line: 914 ]] --[[ Name: constructCreatorDashboardBundleConfigureUrl ]]
        -- upvalues: v31 (copy), v94 (copy)
        if v31 then
            local v282 = v31.getCreatorDashboardBaseUrl();
            local v283 = if v94 then v94:format(v281) else nil;
            if v282 and v283 then
                return v282 .. v283 or "";
            end;
        end;
        return "";
    end;
end;
v35.constructCreatorStoreConfigurationUrl = function(v284) --[[ Line: 928 ]] --[[ Name: constructCreatorStoreConfigurationUrl ]]
    -- upvalues: v31 (copy)
    if v31 then
        local v285 = v31.getCreatorDashboardBaseUrl();
        if v285 and v284 then
            return v285 .. ("/creations/store/%d/configure"):format(v284) or "";
        end;
    end;
    return "";
end;
v35.constructGetUniverseInfo = function(v286) --[[ Line: 938 ]] --[[ Name: constructGetUniverseInfo ]]
    -- upvalues: v124 (copy)
    return v124:format(v286);
end;
if v8() then
    v35.constructCodeUnderstandingSummaryUrl = function(v287) --[[ Line: 943 ]] --[[ Name: constructCodeUnderstandingSummaryUrl ]]
        -- upvalues: v117 (copy)
        return v117:format(v287, "AssetInfo");
    end;
end;
v35.constructGetFiatProductUrl = function(v288, v289) --[[ Line: 948 ]] --[[ Name: constructGetFiatProductUrl ]]
    -- upvalues: v118 (copy), v32 (copy)
    return v118:format(v32.convertAssetTypeToProductType(v289.Value), v288);
end;
if l_game_EngineFeature_0 then
    v35.constructAssetIsOwnedUrl = function(v290, v291, v292) --[[ Line: 953 ]] --[[ Name: constructAssetIsOwnedUrl ]]
        -- upvalues: v125 (copy)
        return v125:format(v290, v291, v292);
    end;
end;
return (v34(v35));