local l_Parent_0 = script.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForAll");
local l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForIXP3");
local v4 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableUGCForAllChecks);
local v5 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxCodeUnderstandingSummary);
local l_ToolboxUseToolboxServiceForGroupAnimations_0 = game:GetFastFlag("ToolboxUseToolboxServiceForGroupAnimations");
local v7 = require(l_Parent_0.Core.Flags.getFFlagToolboxDisableContextualRecommendationRetries);
local v8 = require(l_Util_0.SharedFlags.getFFlagToolboxAddBuyerStatus);
local v9 = require(l_Util_0.SharedFlags.getFFlagToolboxRemoveRobuxProductEntirely);
local v10 = require(l_Parent_0.Core.Flags.getFFlagQualityFiltersInToolboxSearch);
local v11 = require(l_Util_0.SharedFlags.getFFlagToolboxAssetConfigOnboardingLink);
local l_game_EngineFeature_0 = game:GetEngineFeature("ToolboxSampleProductMUS418");
local v13 = require(l_Util_0.SharedFlags.getFFlagToolboxGrantUponInsertion);
local v14 = require(l_Util_0.SharedFlags.getFFlagToolboxMigrateToOpenCloudUpload);
local v15 = require(l_Util_0.SharedFlags.getFFlagEnableUGCBundleUploadBodyScale);
local v16 = require(l_Util_0.SharedFlags.getFFlagEnableBodyColorSetUploadSupport);
local v17 = require(l_Util_0.SharedFlags.getFFlagToolboxMigrateVoting);
local v18 = require(l_Parent_0.Libs.Http.Networking);
local l_Packages_0 = l_Parent_0.Packages;
local v20 = require(l_Packages_0.Framework);
local v21 = require(l_Packages_0.Dash);
local l_Promise_0 = v20.Util.Promise;
local v23 = require(l_Util_0.DebugFlags);
local v24 = require(l_Util_0.getUserId);
local _ = require(l_Util_0.FiatUtil);
local v26 = require(l_Util_0.PageInfoHelper);
local v27 = require(l_Util_0.Urls);
local v28 = require(l_Util_0.Constants);
local v29 = require(l_Util_0.AssetQualityUtil);
local _ = require(l_Parent_0.Core.Types.AssetQuotaTypes);
local _ = require(l_Parent_0.Core.Types.AssetSubTypes);
local _ = require(l_Parent_0.Core.Types.HomeTypes);
local v33 = require(l_Parent_0.Core.Types.Category);
local _ = require(l_Parent_0.Core.Types.MarketplaceFiatServiceTypes);
local v35 = require(l_Util_0.ToolboxUtilities);
local l_game_FastInt_0 = game:GetFastInt("ToolboxGrantUniverseAudioPermissionsTimeoutInMS");
local l_HttpService_0 = game:GetService("HttpService");
local v38 = {};
v38.__index = v38;
local _ = require(l_Parent_0.Core.Reducers.PageInfo);
local v40 = "--%s\r\n" .. "Content-Type: image/%s\r\n" .. "Content-Disposition: form-data; filename=\"%s\"; name=\"request.files\"\r\n" .. "\r\n" .. "%s\r\n" .. "--%s--\r\n";
v38.new = function() --[[ Line: 75 ]] --[[ Name: new ]]
    -- upvalues: v18 (copy), v38 (copy)
    local v41 = {
        _networkImp = v18.new()
    };
    setmetatable(v41, v38);
    return v41;
end;
local function v46(v42, v43, v44, v45) --[[ Line: 84 ]] --[[ Name: printUrl ]]
    -- upvalues: v23 (copy)
    if v23.shouldDebugUrls() then
        print(("NetworkInterface:%s()"):format(v42));
        print(("\t%s %s"):format(v43:upper() or "method=nil", v44 or "url=nil"));
        if v45 then
            print(("\t%s"):format((tostring(v45))));
        end;
    end;
end;
local function v47(v48, v49, v50) --[[ Line: 94 ]] --[[ Name: sendRequestAndRetry ]]
    -- upvalues: l_Promise_0 (copy), v47 (copy)
    v49 = v49 or {
        attempts = 0, 
        time = 0, 
        maxRetries = 5
    };
    v50 = v50 or false;
    v49.attempts = v49.attempts + 1;
    return v48():catch(function(v51) --[[ Line: 103 ]]
        -- upvalues: v50 (ref), l_Promise_0 (ref), v49 (ref), v47 (ref), v48 (copy)
        local v52 = if v50 then v51.StatusCode else v51.responseCode;
        if v52 == nil then
            if v51.HttpError == Enum.HttpError.Aborted then
                return l_Promise_0.reject(v51);
            end;
        else
            local v53 = false;
            if v52 >= 400 then
                v53 = v52 <= 499;
            end;
            if v49.attempts >= v49.maxRetries or v53 then
                if v50 then
                    v51.responseBody = v51.Body and v51.Body.errors and v51.Body.errors[1] and v51.Body.errors[1].userFacingMessage or "Something went wrong";
                end;
                return l_Promise_0.reject(v51);
            end;
        end;
        local v54 = 2 ^ (v49.attempts - 1);
        wait(v54);
        return v47(v48, v49, v50);
    end);
end;
local function v62(v55, v56) --[[ Line: 147 ]]
    -- upvalues: l_HttpService_0 (copy), v40 (copy)
    local l_v56_BinaryContents_0 = v56:GetBinaryContents();
    local v58 = string.lower(v56.Name);
    local v59 = string.sub(v58, string.find(v58, ".", 1, true) + 1);
    local v60 = l_HttpService_0:GenerateGUID(false);
    local v61 = string.format(v40, v60, v59, v58, l_v56_BinaryContents_0, v60);
    return v61, {
        Url = v55, 
        Method = "POST", 
        Body = v61, 
        CachePolicy = Enum.HttpCachePolicy.None, 
        Headers = {
            ["Content-Type"] = "multipart/form-data; boundary=" .. v60
        }
    };
end;
v38.jsonEncode = function(v63, v64) --[[ Line: 170 ]] --[[ Name: jsonEncode ]]
    return v63._networkImp:jsonEncode(v64);
end;
v38.getAssets = function(v65, v66) --[[ Line: 174 ]] --[[ Name: getAssets ]]
    -- upvalues: v26 (copy), v27 (copy), v28 (copy), v47 (copy), v46 (copy)
    local v67 = v26.getRequestInfo(v66);
    local v68 = v27.constructGetAssetsUrl(v67.category, v67.searchTerm, v28.GET_ITEMS_PAGE_SIZE, v67.targetPage, v67.sortType, v67.groupId, v67.creatorId);
    return v47(function() --[[ Line: 187 ]]
        -- upvalues: v46 (ref), v68 (copy), v65 (copy)
        v46("getAssets", "GET", v68);
        return v65._networkImp:httpGetJson(v68);
    end);
end;
v38.getToolboxItems = function(v69, v70) --[[ Line: 193 ]] --[[ Name: getToolboxItems ]]
    -- upvalues: v33 (copy), v35 (copy), v21 (copy), v10 (copy), v29 (copy), v27 (copy), v7 (copy), v28 (copy), v47 (copy), v46 (copy)
    local l_categoryName_0 = v70.categoryName;
    local v72 = nil;
    if l_categoryName_0 == v33.WHITELISTED_PLUGINS.name then
        v72 = v35.getShouldUsePluginCreatorWhitelist();
    end;
    local v73 = v21.join(v70, {
        useCreatorWhitelist = v72
    });
    local v74 = nil;
    if v10() and v33.categoryIsModel(l_categoryName_0) then
        v74 = v29.convertQualityFilterDataToQueryStrings(v70.qualityFilterData);
        if v74 and v74 ~= "" then
            v73 = v21.join(v73, v74);
        end;
    end;
    local v75 = v27.constructGetToolboxItemsUrl(v73);
    local v76 = if v7() and v70.sectionName == v28.CONTEXTUAL_RECOMMENDATIONS_HOME_CONFIG_SECTION_NAME then {
        attempts = 0, 
        time = 0, 
        maxRetries = 0
    } else nil;
    return v47(function() --[[ Line: 253 ]]
        -- upvalues: v46 (ref), v75 (copy), v69 (copy)
        v46("getToolboxItems", "GET", v75);
        return v69._networkImp:httpGetJson(v75);
    end, v76);
end;
v38.getItemDetailsAssetIds = function(v77, v78) --[[ Line: 259 ]] --[[ Name: getItemDetailsAssetIds ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v79 = v27.constructGetItemDetails(v78);
    return v47(function() --[[ Line: 262 ]]
        -- upvalues: v46 (ref), v79 (copy), v77 (copy)
        v46("getItemDetails", "GET", v79);
        return v77._networkImp:httpGetJson(v79);
    end);
end;
v38.getItemDetails = function(v80, v81) --[[ Line: 268 ]] --[[ Name: getItemDetails ]]
    local v82 = {};
    for _, v84 in ipairs(v81) do
        table.insert(v82, v84.id);
    end;
    return v80:getItemDetailsAssetIds(v82);
end;
v38.getDevelopAsset = function(v85, v86) --[[ Line: 279 ]] --[[ Name: getDevelopAsset ]]
    -- upvalues: v26 (copy), v27 (copy), v28 (copy), v47 (copy), v46 (copy)
    local v87 = v26.getRequestInfo(v86);
    local v88 = v27.getDevelopAssetUrl(v87.category, v87.searchTerm, v87.sortType, v87.creatorId, v28.GET_ITEMS_PAGE_SIZE, v87.targetPage, v87.groupId, v87.creatorType);
    return v47(function() --[[ Line: 293 ]]
        -- upvalues: v46 (ref), v88 (copy), v85 (copy)
        v46("getDevelopAsset", "GET", v88);
        return v85._networkImp:httpGetJson(v88);
    end);
end;
v38.getAssetCreations = function(v89, v90, v91, v92) --[[ Line: 301 ]] --[[ Name: getAssetCreations ]]
    -- upvalues: v26 (copy), v24 (copy), v33 (copy), v27 (copy), v28 (copy), v47 (copy), v46 (copy)
    local v93 = if v90 then v26.getEngineAssetTypeForPageInfoCategory(v90) else v92;
    local v94 = v24();
    local v95 = v33.EngineAssetTypeIdToToolboxAssetType[v93.Value];
    local v96 = false;
    if v33.ToolboxMarketplaceAssetTypes[v95] ~= nil then
        v96 = v95 ~= v33.AssetType.ANIMATION;
    end;
    local l_Name_0 = v93.Name;
    local v98 = if v96 then v27.constructGetAssetCreationsUrlToolboxService(l_Name_0, v28.GET_ITEMS_DETAILS_PAGE_SIZE_LIMIT, v91, true, v94) else v27.constructGetAssetCreationsUrl(l_Name_0, v28.GET_ASSET_CREATIONS_PAGE_SIZE_LIMIT, v91, nil, nil);
    return v47(function() --[[ Line: 330 ]]
        -- upvalues: v46 (ref), v98 (copy), v89 (copy)
        v46("getAssetCreations", "GET", v98);
        return v89._networkImp:httpGetJson(v98);
    end);
end;
v38.getAssetGroupCreations = function(v99, v100, v101, v102, v103) --[[ Line: 336 ]] --[[ Name: getAssetGroupCreations ]]
    -- upvalues: v26 (copy), v33 (copy), l_ToolboxUseToolboxServiceForGroupAnimations_0 (copy), v27 (copy), v28 (copy), v47 (copy), v46 (copy)
    local l_v102_0 = v102;
    local l_v103_0 = v103;
    if v100 then
        l_v102_0 = v26.getEngineAssetTypeForPageInfoCategory(v100);
        l_v103_0 = v33.categoryIsGroupAsset(v100.categoryName) and v26.getGroupIdForPageInfo(v100) or nil;
    end;
    local v106 = v33.EngineAssetTypeIdToToolboxAssetType[l_v102_0.Value];
    local v107 = if l_ToolboxUseToolboxServiceForGroupAnimations_0 then v33.ToolboxMarketplaceAssetTypes[v106] ~= nil else v33.ToolboxMarketplaceAssetTypes[v106] ~= nil and v106 ~= v33.AssetType.ANIMATION;
    local l_Name_1 = l_v102_0.Name;
    local v109 = if v107 then v27.constructGetAssetGroupCreationsUrl(l_Name_1, v28.GET_ITEMS_DETAILS_PAGE_SIZE_LIMIT, v101, nil, l_v103_0) else v27.constructGetAssetCreationsUrl(l_Name_1, v28.GET_ASSET_CREATIONS_PAGE_SIZE_LIMIT, v101, nil, l_v103_0);
    return v47(function() --[[ Line: 372 ]]
        -- upvalues: v46 (ref), v109 (copy), v99 (copy)
        v46("getAssetGroupCreations", "GET", v109);
        return v99._networkImp:httpGetJson(v109);
    end);
end;
v38.getAssetCreationDetails = function(v110, v111) --[[ Line: 378 ]] --[[ Name: getAssetCreationDetails ]]
    -- upvalues: v23 (copy), v28 (copy), v27 (copy), v47 (copy), v46 (copy)
    if v23.shouldDebugWarnings() and v111 and #v111 > v28.GET_ASSET_CREATIONS_DETAILS_LIMIT then
        warn(("getAssetCreationDetails() does not support requests for more than %d assets at one time"):format(#v111));
    end;
    local v112 = v27.constructGetAssetCreationDetailsUrl();
    return v47(function() --[[ Line: 389 ]]
        -- upvalues: v46 (ref), v112 (copy), v110 (copy), v111 (copy)
        v46("getAssetCreationDetails", "POST", v112);
        local v113 = v110._networkImp:jsonEncode({
            assetIds = v111
        });
        return v110._networkImp:httpPostJson(v112, v113);
    end);
end;
v38.getCreatorInfo = function(v114, v115, v116) --[[ Line: 396 ]] --[[ Name: getCreatorInfo ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v117 = v27.constructGetCreatorInfoUrl(v115, v116);
    return v47(function() --[[ Line: 399 ]]
        -- upvalues: v46 (ref), v117 (copy), v114 (copy)
        v46("getCreatorInfo", "GET", v117);
        return v114._networkImp:httpGetJson(v117);
    end);
end;
v38.getMetaData = function(v118) --[[ Line: 405 ]] --[[ Name: getMetaData ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v119 = v27.constructGetMetaDataUrl();
    return v47(function() --[[ Line: 408 ]]
        -- upvalues: v46 (ref), v119 (copy), v118 (copy)
        v46("getAccountInfo", "GET", v119);
        return v118._networkImp:httpGetJson(v119);
    end);
end;
if v4() then
    v38.getUploadPermissionStatus = function(v120, v121, v122) --[[ Line: 415 ]] --[[ Name: getUploadPermissionStatus ]]
        -- upvalues: v27 (copy), v47 (copy), v46 (copy)
        local v123 = v27.constructUploadPermissionStatusUrl(v121, v122);
        return v47(function() --[[ Line: 418 ]]
            -- upvalues: v46 (ref), v123 (copy), v120 (copy)
            v46("getUploadPermissionStatus", "GET", v123);
            return v120._networkImp:httpGetJson(v123);
        end);
    end;
end;
v38.getBundleMetadata = function(v124) --[[ Line: 425 ]] --[[ Name: getBundleMetadata ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v125 = v27.constructGetBundleMetadataUrl();
    return v47(function() --[[ Line: 428 ]]
        -- upvalues: v46 (ref), v125 (copy), v124 (copy)
        v46("getBundleMetadata", "GET", v125);
        return v124._networkImp:httpGetJson(v125);
    end);
end;
v38.postBundleCreationFee = function(v126, v127, v128) --[[ Line: 434 ]] --[[ Name: postBundleCreationFee ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v129 = v27.constructPostBundleCreationFeeUrl();
    local v130 = v126._networkImp:jsonEncode({
        assetQuantities = v128, 
        bundleType = v127.rawValue()
    });
    return v47(function() --[[ Line: 442 ]]
        -- upvalues: v46 (ref), v129 (copy), v130 (copy), v126 (copy)
        v46("postBundleCreationFee", "POST", v129, v130);
        return v126._networkImp:httpPostJson(v129, v130);
    end);
end;
v38.postBundleCreationContext = function(v131, v132, v133, v134, v135, v136, v137) --[[ Line: 448 ]] --[[ Name: postBundleCreationContext ]]
    -- upvalues: v27 (copy), v15 (copy), v16 (copy), v46 (copy), l_Promise_0 (copy)
    local v138 = v27.constructPostBundleCreationContextUrl();
    local v139 = v131._networkImp:jsonEncode({
        assetQuantities = v133, 
        bundleDescription = v135, 
        bundleName = v134, 
        bundleType = v132.rawValue(), 
        bodyScale = if v15() then v136 else nil, 
        bodyColorSet = if v16() then v137 else nil
    });
    local v140 = {
        Url = v138, 
        Method = "POST", 
        Body = v139, 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    };
    v46("postBundleCreationContext", "POST", v138, v139);
    return v131._networkImp:requestInternalRaw(v140):andThen(function(v141) --[[ Line: 480 ]]
        -- upvalues: v131 (copy)
        return v131._networkImp:jsonDecode(v141.Body);
    end):catch(function(v142) --[[ Line: 483 ]]
        -- upvalues: v131 (copy), l_Promise_0 (ref)
        v142.Body = if v142.Body then v131._networkImp:jsonDecode(v142.Body) else nil;
        return l_Promise_0.reject(v142);
    end);
end;
v38.postCreateBundle = function(v143, v144, v145, v146, v147, v148, v149) --[[ Line: 490 ]] --[[ Name: postCreateBundle ]]
    -- upvalues: v27 (copy), v46 (copy), l_Promise_0 (copy)
    local v150 = v27.constructPostCreateBundleUrl();
    local v151 = v143._networkImp:jsonEncode({
        bundleType = v144.rawValue(), 
        name = v145, 
        description = v146, 
        assetIds = v147, 
        operationId = v148, 
        agreedCreationFee = v149
    });
    local v152 = {
        Url = v150, 
        Method = "POST", 
        Body = v151, 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    };
    v46("postCreateBundle", "POST", v150, v151);
    return v143._networkImp:requestInternalRaw(v152):andThen(function(v153) --[[ Line: 515 ]]
        -- upvalues: v143 (copy)
        return v143._networkImp:jsonDecode(v153.Body);
    end):catch(function(v154) --[[ Line: 518 ]]
        -- upvalues: v143 (copy), l_Promise_0 (ref)
        v154.Body = if v154.Body then v143._networkImp:jsonDecode(v154.Body) else nil;
        return l_Promise_0.reject(v154);
    end);
end;
v38.getBundleCreationStatus = function(v155, v156) --[[ Line: 525 ]] --[[ Name: getBundleCreationStatus ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v157 = v27.constructGetBundleCreationStatusUrl(v156);
    return v47(function() --[[ Line: 528 ]]
        -- upvalues: v46 (ref), v157 (copy), v155 (copy)
        v46("getBundleCreationStatus", "GET", v157);
        return v155._networkImp:httpGetJson(v157);
    end);
end;
v38.getDefaultCreateBundleDataSharing = function(v158) --[[ Line: 534 ]] --[[ Name: getDefaultCreateBundleDataSharing ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v159 = v27.constructGetDefaultCreateBundleDataSharingUrl();
    return v47(function() --[[ Line: 537 ]]
        -- upvalues: v46 (ref), v159 (copy), v158 (copy)
        v46("getDefaultBundleDataSharing", "GET", v159);
        return v158._networkImp:httpGetJson(v159);
    end);
end;
v38.postCreateBundleDataSharing = function(v160, v161, v162) --[[ Line: 543 ]] --[[ Name: postCreateBundleDataSharing ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v163 = v27.constructPostCreateBundleDataSharingUrl();
    local v164 = v160._networkImp:jsonEncode({
        configurations = {
            {
                bundleId = v161, 
                dataSharingLicenseTypes = v162
            }
        }
    });
    return v47(function() --[[ Line: 555 ]]
        -- upvalues: v46 (ref), v163 (copy), v164 (copy), v160 (copy)
        v46("postBundleDataSharing", "POST", v163, v164);
        return v160._networkImp:httpPostJson(v163, v164);
    end);
end;
v38.getAssetMediaIds = function(v165, v166) --[[ Line: 561 ]] --[[ Name: getAssetMediaIds ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v167 = v27.constructGetAssetMediaIdsUrl(v166);
    return v47(function() --[[ Line: 563 ]]
        -- upvalues: v46 (ref), v167 (copy), v165 (copy)
        v46("getAssetMediaIds", "GET", v167);
        return v165._networkImp:httpGetJson(v167);
    end);
end;
v38.getVote = function(v168, v169, v170) --[[ Line: 569 ]] --[[ Name: getVote ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v171 = v27.constructGetVoteUrl(v169, v170);
    return v47(function() --[[ Line: 572 ]]
        -- upvalues: v46 (ref), v171 (copy), v168 (copy)
        v46("getVote", "GET", v171);
        return v168._networkImp:httpGetJson(v171);
    end);
end;
v38.postVote = function(v172, v173, v174) --[[ Line: 578 ]] --[[ Name: postVote ]]
    -- upvalues: v27 (copy), v17 (copy), v47 (copy), v46 (copy)
    local v175 = v27.constructPostVoteUrl(v173, v174);
    local v176 = if v17() then {} else v172._networkImp:jsonEncode({
        assetId = v173, 
        vote = v174
    });
    return v47(function() --[[ Line: 588 ]]
        -- upvalues: v46 (ref), v175 (copy), v176 (copy), v172 (copy)
        v46("postVote", "POST", v175, v176);
        return v172._networkImp:httpPostJson(v175, v176);
    end);
end;
v38.configureSales = function(v177, v178, v179, v180) --[[ Line: 594 ]] --[[ Name: configureSales ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v181 = v27.constructConfigureSalesUrl(v178);
    local v182 = v177._networkImp:jsonEncode({
        price = v180, 
        saleStatus = v179
    });
    return v47(function() --[[ Line: 602 ]]
        -- upvalues: v46 (ref), v181 (copy), v182 (copy), v177 (copy)
        v46("configureSales", "POST", v181, v182);
        return v177._networkImp:httpPostJson(v181, v182);
    end);
end;
v38.updateSales = function(v183, v184, v185) --[[ Line: 608 ]] --[[ Name: updateSales ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v186 = v27.constructUpdateSalesUrl(v184);
    local v187 = v183._networkImp:jsonEncode({
        price = v185
    });
    return v47(function() --[[ Line: 615 ]]
        -- upvalues: v46 (ref), v186 (copy), v187 (copy), v183 (copy)
        v46("updateSales", "POST", v186, v187);
        return v183._networkImp:httpPostJson(v186, v187);
    end);
end;
v38.postUnvote = function(v188, v189) --[[ Line: 621 ]] --[[ Name: postUnvote ]]
    -- upvalues: v17 (copy), v27 (copy), v47 (copy), v46 (copy)
    local v190 = if v17() then v27.constructPostUnvoteUrl(v189) else v27.constructPostVoteUrl(v189, "");
    local v191 = if v17() then {} else v188._networkImp:jsonEncode({
        assetId = v189
    });
    return v47(function() --[[ Line: 632 ]]
        -- upvalues: v46 (ref), v190 (copy), v191 (copy), v188 (copy)
        v46("postUnvote", "POST", v190, v191);
        return v188._networkImp:httpPostJson(v190, v191);
    end);
end;
v38.postInsertAsset = function(v192, v193) --[[ Line: 638 ]] --[[ Name: postInsertAsset ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v194 = v27.constructInsertAssetUrl(v193);
    local v195 = {};
    return v47(function() --[[ Line: 642 ]]
        -- upvalues: v46 (ref), v194 (copy), v195 (copy), v192 (copy)
        v46("postInsertAsset", "POST", v194, v195);
        return v192._networkImp:httpPost(v194, v195);
    end);
end;
v38.getManageableGroups = function(v196) --[[ Line: 648 ]] --[[ Name: getManageableGroups ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v197 = v27.constructGetManageableGroupsUrl();
    return v47(function() --[[ Line: 651 ]]
        -- upvalues: v46 (ref), v197 (copy), v196 (copy)
        v46("getManageableGroups", "GET", v197);
        return v196._networkImp:httpGetJson(v197);
    end);
end;
v38.getUsers = function(v198, v199, v200) --[[ Line: 657 ]] --[[ Name: getUsers ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v201 = v27.constructUserSearchUrl(v199);
    v46("getUsers", "GET", v201);
    return v198._networkImp:httpGetJson(v201):andThen(function(v202) --[[ Line: 661 ]]
        -- upvalues: v200 (copy)
        local l_contents_0 = v202.responseBody.searchResults[1].contents;
        local v204 = {};
        for v205 = 1, v200 or 3 do
            local v206 = l_contents_0[v205];
            if v206 then
                table.insert(v204, {
                    UserId = v206.contentId, 
                    Name = v206.username
                });
            else
                break;
            end;
        end;
        return v204;
    end);
end;
v38.getFavoriteCounts = function(v207, v208) --[[ Line: 703 ]] --[[ Name: getFavoriteCounts ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v209 = v27.constructFavoriteCountsUrl(v208);
    v46("getFavorites", "GET", v209);
    return v207._networkImp:httpGet(v209);
end;
v38.getFavorited = function(v210, v211, v212) --[[ Line: 710 ]] --[[ Name: getFavorited ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v213 = v27.constructGetFavoritedUrl(v211, v212);
    v46("getFavorited", "GET", v213);
    return v210._networkImp:httpGet(v213);
end;
v38.getDevelopAssetMetadata = function(v214, v215) --[[ Line: 718 ]] --[[ Name: getDevelopAssetMetadata ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v216 = v27.constructGetDevelopAssetMetadata(v215);
    v46("getDevelopAssetMetadata", "GET", v216);
    return v214._networkImp:httpGet(v216);
end;
v38.getVersionsHistory = function(v217, v218, v219) --[[ Line: 725 ]] --[[ Name: getVersionsHistory ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v220 = v27.constructAssetSavedVersionString(v218, v219);
    v46("getVersionsHistory", "GET", v220);
    return v217._networkImp:httpGet(v220);
end;
v38.postRevertVersion = function(v221, v222, v223) --[[ Line: 733 ]] --[[ Name: postRevertVersion ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v224 = v27.constructRevertAssetVersionString(v222, v223);
    v46("postRevertVersion", "POST", v224);
    return v221._networkImp:httpPostJson(v224, {});
end;
v38.getVersionDescriptions = function(v225, v226) --[[ Line: 740 ]] --[[ Name: getVersionDescriptions ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v227 = v27.constructGetPackageVersionDescriptionString();
    v46("getVersionDescriptions", "POST", v227);
    local v228 = v225._networkImp:jsonEncode(v226);
    return v225._networkImp:httpPostJson(v227, v228);
end;
v38.postVersionDescription = function(v229, v230, v231, v232) --[[ Line: 750 ]] --[[ Name: postVersionDescription ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v233 = v27.constructSetPackageVersionDescriptionString(v230, v231);
    local v234 = v229._networkImp:jsonEncode({
        message = v232
    });
    return v47(function() --[[ Line: 758 ]]
        -- upvalues: v46 (ref), v233 (copy), v234 (copy), v229 (copy)
        v46("postVersionDescription", "POST", v233, v234);
        return v229._networkImp:httpPostJson(v233, v234);
    end);
end;
v38.postFavorite = function(v235, v236, v237) --[[ Line: 764 ]] --[[ Name: postFavorite ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v238 = v27.constructPostFavoriteUrl(v236, v237);
    local v239 = v235._networkImp:jsonEncode({
        userId = v236, 
        assetId = v237
    });
    v46("postFavorite", "POST", v238, v239);
    return v235._networkImp:httpPostJson(v238, v239);
end;
v38.deleteFavorite = function(v240, v241, v242) --[[ Line: 776 ]] --[[ Name: deleteFavorite ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v243 = v27.constructDeleteFavoriteUrl(v241, v242);
    v46("deleteFavorite", "DELETE", v243);
    return v240._networkImp:httpDelete(v243);
end;
v38.uploadCatalogItem = function(v244, v245, v246) --[[ Line: 783 ]] --[[ Name: uploadCatalogItem ]]
    -- upvalues: v27 (copy), v46 (copy), l_Promise_0 (copy)
    local v247 = v27.constructUploadCatalogItemUrl();
    local v248 = {
        Url = v247, 
        Method = "POST", 
        Body = v245, 
        CachePolicy = Enum.HttpCachePolicy.None, 
        Headers = {
            ["Content-Type"] = "multipart/form-data; boundary=" .. v246
        }
    };
    v46("uploadCatalogItem", "POST FORM-DATA", v247, v245);
    return v244._networkImp:requestInternal(v248):catch(function(v249) --[[ Line: 797 ]]
        -- upvalues: l_Promise_0 (ref)
        return l_Promise_0.reject(v249);
    end);
end;
v38.uploadCatalogItemFormat = function(v250, v251, v252, v253, v254, v255, v256, v257) --[[ Line: 802 ]] --[[ Name: uploadCatalogItemFormat ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v258 = v27.constructUploadCatalogItemFormatUrl(v251, v252, v253, v254, v255, v256);
    return v47(function() --[[ Line: 805 ]]
        -- upvalues: v46 (ref), v258 (copy), v257 (copy), v250 (copy)
        v46("uploadCatalogItemFormat", "POST", v258, v257);
        return v250._networkImp:httpPost(v258, v257);
    end);
end;
v38.uploadAssetThumbnail = function(v259, v260, v261) --[[ Line: 811 ]] --[[ Name: uploadAssetThumbnail ]]
    -- upvalues: v27 (copy), v62 (copy), v46 (copy), l_Promise_0 (copy)
    local v262 = v27.constructUploadAssetThumbnailUrl(v260);
    local v263, v264 = v62(v262, v261);
    v46("uploadAssetThumbnail", "POST FORM-DATA", v262, v263);
    return v259._networkImp:requestInternal(v264):catch(function(v265) --[[ Line: 817 ]]
        -- upvalues: l_Promise_0 (ref)
        return l_Promise_0.reject(v265);
    end);
end;
v38.getThumbnailStatus = function(v266, v267) --[[ Line: 822 ]] --[[ Name: getThumbnailStatus ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v268 = v27.contuctGetThumbnailStatusUrl({
        v267
    });
    v46("getThumbnailStatus", "GET", v268);
    return v266._networkImp:httpGetJson(v268);
end;
v38.configureCatalogItem = function(v269, v270, v271) --[[ Line: 829 ]] --[[ Name: configureCatalogItem ]]
    -- upvalues: v27 (copy), v46 (copy), l_Promise_0 (copy)
    local v272 = v27.constructConfigureCatalogItemUrl(v270);
    local v273 = v269._networkImp:jsonEncode(v271);
    local v274 = {
        Url = v272, 
        Method = "PATCH", 
        Body = v273, 
        CachePolicy = Enum.HttpCachePolicy.None, 
        Headers = {
            ["Content-Type"] = "application/json"
        }
    };
    v46("configureCatalogItem", "PATCH", v272, v273);
    return v269._networkImp:requestInternal(v274):catch(function(v275) --[[ Line: 846 ]]
        -- upvalues: l_Promise_0 (ref)
        return l_Promise_0.reject(v275);
    end);
end;
v38.patchAsset = function(v276, v277, v278, v279, v280, v281, v282, v283, v284, v285, v286) --[[ Line: 863 ]] --[[ Name: patchAsset ]]
    -- upvalues: v27 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (copy), v46 (copy)
    local v287 = v27.constructPatchAssetUrl(v277);
    local v288 = v276._networkImp:jsonEncode({
        name = v278, 
        description = v279, 
        genres = v280, 
        enableComments = v281, 
        isCopyingAllowed = v282, 
        locale = v283, 
        localName = v284, 
        localDescription = v285, 
        isConvertMarketplaceModelsToPackageEnabled = if not not l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then v286 else nil
    });
    v46("patchAsset", "PATCH", v287, v288);
    return v276._networkImp:httpPatch(v287, v288);
end;
v38.postUploadAsset = function(v289, v290, v291, v292, v293, v294, v295, v296, v297, v298) --[[ Line: 907 ]] --[[ Name: postUploadAsset ]]
    -- upvalues: v14 (copy), v27 (copy), v46 (copy)
    assert(not v14(), "NetworkInterface:postUploadAsset is marked for deprecation");
    local v299 = v27.constructPostUploadAssetUrl(v290, v291, v292, v293, v294, v295, v296, v297);
    v46("postUploadAsset", "POST", v299, v298);
    return v289._networkImp:httpPost(v299, v298);
end;
v38.postOverrideAsset = function(v300, v301, v302, v303) --[[ Line: 934 ]] --[[ Name: postOverrideAsset ]]
    -- upvalues: v14 (copy), v27 (copy), v46 (copy)
    assert(not v14(), "NetworkInterface:postOverrideAsset is marked for deprecation");
    local v304 = v27.constructOverrideAssetsUrl(v301, v302);
    v46("postOverrideAsset", "POST", v304);
    return v300._networkImp:httpPost(v304, v303);
end;
v38.validateAnimation = function(v305, v306) --[[ Line: 946 ]] --[[ Name: validateAnimation ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v307 = v27.constructValidateAnimationUrl(v306);
    v46("validateAnimation", "GET", v307);
    return v305._networkImp:httpGetJson(v307);
end;
local function v313(v308) --[[ Line: 953 ]] --[[ Name: makeMultipartPayload ]]
    -- upvalues: l_HttpService_0 (copy)
    local v309 = "";
    local v310 = l_HttpService_0:GenerateGUID(false);
    for v311, v312 in v308 do
        v309 = ((v309 .. "--" .. v310 .. "\r\n") .. "Content-Type: " .. v312.contentType .. "\r\n") .. "Content-Disposition: form-data; name=\"" .. v311 .. "\"";
        if v312.filename then
            v309 = v309 .. "; filename=\"" .. v312.filename .. "\"";
        end;
        v309 = ((v309 .. "\r\n") .. "\r\n") .. v312.body .. "\r\n";
    end;
    return v309 .. "--" .. v310 .. "--", v310;
end;
v38.waitForOperation = function(v314, v315, v316, v317) --[[ Line: 973 ]] --[[ Name: waitForOperation ]]
    -- upvalues: v27 (copy), v46 (copy), l_Promise_0 (copy)
    v316 = v316 or 5;
    v317 = v317 or 0;
    local v318 = v27.constructOperationUrl(v315);
    v46("waitForOperation", "GET", v318);
    return v314._networkImp:httpGetJson(v318):andThen(function(v319) --[[ Line: 981 ]]
        -- upvalues: v317 (ref), l_Promise_0 (ref), v314 (copy), v315 (copy), v316 (ref)
        if v319.responseCode == 200 and v319.responseBody and v319.responseBody.done then
            return v319.responseBody.response;
        elseif v317 > 5 then
            return l_Promise_0.reject("Timeout");
        else
            local v320 = 2 ^ (v317 - 1);
            wait(v320);
            return v314:waitForOperation(v315, v316, v317 + 1);
        end;
    end):catch(function(v321) --[[ Line: 994 ]]
        -- upvalues: l_Promise_0 (ref)
        return l_Promise_0.reject(v321);
    end);
end;
v38.postUploadAnimation = function(v322, _, v324, v325, v326, v327, v328) --[[ Line: 1000 ]] --[[ Name: postUploadAnimation ]]
    -- upvalues: v27 (copy), v313 (copy), v46 (copy), l_Promise_0 (copy)
    local v329 = v27.constructPostUploadAnimationUrl();
    local v330, v331 = v313({
        request = {
            contentType = "application/json", 
            body = v322._networkImp:jsonEncode({
                assetType = Enum.AssetType.Animation.Name, 
                displayName = v324, 
                description = v325, 
                creationContext = {
                    creator = {
                        userId = if not v327 then v326 else nil, 
                        groupId = v327
                    }
                }
            })
        }, 
        fileContent = {
            contentType = "model/x-rbxm", 
            filename = "asset.rbxm", 
            body = v328
        }
    });
    local v332 = {
        Url = v329, 
        Method = "POST", 
        Body = v330, 
        CachePolicy = Enum.HttpCachePolicy.None, 
        Headers = {
            ["Content-Type"] = "multipart/form-data; boundary=" .. v331
        }
    };
    v46("uploadAnimation", "POST", v329, v332);
    return v322._networkImp:requestInternal(v332):andThen(function(v333) --[[ Line: 1039 ]]
        -- upvalues: v322 (copy)
        body = v322._networkImp:jsonDecode(v333);
        return v322:waitForOperation(body.operationId);
    end):catch(function(v334) --[[ Line: 1043 ]]
        -- upvalues: l_Promise_0 (ref)
        return l_Promise_0.reject(v334);
    end);
end;
v38.postOverrideAnimation = function(v335, v336, v337) --[[ Line: 1049 ]] --[[ Name: postOverrideAnimation ]]
    -- upvalues: v27 (copy), v313 (copy), v46 (copy), l_Promise_0 (copy)
    local v338 = v27.constructPostOverwriteAnimationUrl(v336);
    local v339, v340 = v313({
        request = {
            contentType = "application/json", 
            body = v335._networkImp:jsonEncode({
                assetId = tostring(v336)
            })
        }, 
        fileContent = {
            contentType = "model/x-rbxm", 
            filename = "asset.rbxm", 
            body = v337
        }
    });
    local v341 = {
        Url = v338, 
        Method = "PATCH", 
        Body = v339, 
        CachePolicy = Enum.HttpCachePolicy.None, 
        Headers = {
            ["Content-Type"] = "multipart/form-data; boundary=" .. v340
        }
    };
    v46("overrideAnimation", "PATCH", v338, v341);
    return v335._networkImp:requestInternal(v341):andThen(function(v342) --[[ Line: 1078 ]]
        -- upvalues: v335 (copy)
        body = v335._networkImp:jsonDecode(v342);
        return v335:waitForOperation(body.operationId);
    end):catch(function(v343) --[[ Line: 1082 ]]
        -- upvalues: l_Promise_0 (ref)
        return l_Promise_0.reject(v343);
    end);
end;
v38.getIsVerifiedCreator = function(v344) --[[ Line: 1088 ]] --[[ Name: getIsVerifiedCreator ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v345 = v27.constructIsVerifiedCreatorUrl();
    v46("getIsVerifiedCreator", "GET", v345);
    return v344._networkImp:httpGetJson(v345);
end;
v38.getPluginInfo = function(v346, v347) --[[ Line: 1096 ]] --[[ Name: getPluginInfo ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v348 = v27.constructGetPluginInfoUrl(v347);
    v46("getPluginInfo", "GET", v348);
    return v346._networkImp:httpGetJson(v348);
end;
v38.getLocalUserFriends = function(v349, v350) --[[ Line: 1103 ]] --[[ Name: getLocalUserFriends ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v351 = v27.constructGetUserFriendsUrl(v350);
    v46("getUserFriends", "GET", v350);
    return v349._networkImp:httpGet(v351);
end;
v38.postForPackageMetadata = function(v352, v353) --[[ Line: 1110 ]] --[[ Name: postForPackageMetadata ]]
    -- upvalues: v27 (copy)
    local v354 = v27.constructPostPackageMetadata();
    local v355 = "[{ \"assetId\" : " .. v353 .. ", \"assetVersionNumber\" : 1 }]";
    return v352._networkImp:httpPostJson(v354, v355);
end;
v38.getRobuxBalance = function(v356, v357) --[[ Line: 1117 ]] --[[ Name: getRobuxBalance ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v358 = v27.constructGetRobuxBalanceUrl(v357);
    v46("getRobuxBalance", "GET", v358);
    return v356._networkImp:httpGetJson(v358);
end;
v38.getHasEditPermissionForAsset = function(v359, v360, v361) --[[ Line: 1124 ]] --[[ Name: getHasEditPermissionForAsset ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v362 = v27.constructAssetCheckPermissionsBatchUrl();
    local v363 = v359._networkImp:jsonEncode({
        requests = {
            {
                subject = {
                    subjectType = "User", 
                    subjectId = v361
                }, 
                action = "Edit", 
                assetId = v360
            }
        }
    });
    v46("getHasEditPermissionForAsset", "POST", v362, v363);
    return v359._networkImp:httpPostJson(v362, v363):andThen(function(v364) --[[ Line: 1141 ]]
        -- upvalues: v360 (copy)
        if #v364.responseBody.results < 1 then
            error(string.format("No results for getHasEditPermissionForAsset. assetId = %s", (tostring(v360))));
        end;
        local v365 = v364.responseBody.results[1];
        if v365.error then
            error(v365.error);
        end;
        return v365.value.status == "HasPermission";
    end);
end;
v38.purchaseAsset = function(v366, v367, v368, v369) --[[ Line: 1156 ]] --[[ Name: purchaseAsset ]]
    -- upvalues: v9 (copy), v27 (copy), v46 (copy)
    local v370 = v366:jsonEncode(v368);
    local v371 = if not (v367 ~= nil) or v9() then v27.constructAssetPurchaseUrl(nil, v369) else v27.constructAssetPurchaseUrl(v367, v369);
    v46("purchaseAsset", "POST", v371);
    return v366._networkImp:httpPostJson(v371, v370);
end;
if v8() then
    v38.getPurchaserStatus = function(v372) --[[ Line: 1168 ]] --[[ Name: getPurchaserStatus ]]
        -- upvalues: v27 (copy), v46 (copy)
        local v373 = v27.constructPurchaserStatusUrl();
        v46("getPurchaserStatus", "GET", v373);
        return v372._networkImp:httpGetJson(v373);
    end;
end;
if v11() then
    v38.getSellerStatus = function(v374) --[[ Line: 1177 ]] --[[ Name: getSellerStatus ]]
        -- upvalues: v27 (copy), v46 (copy)
        local v375 = v27.constructSellerStatusUrl();
        v46("getSellerStatus", "GET", v375);
        return v374._networkImp:httpGetJson(v375);
    end;
end;
v38.getGroupRoleInfo = function(v376, v377) --[[ Line: 1186 ]] --[[ Name: getGroupRoleInfo ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v378 = v27.constructGetGroupRoleInfoUrl(v377);
    v46("getGroupRoleInfo", "GET", v377);
    return v376._networkImp:httpGet(v378);
end;
v38.grantAssetPermissions = function(v379, v380, v381) --[[ Line: 1193 ]] --[[ Name: grantAssetPermissions ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v382 = v27.constructAssetPermissionsUrl(v380);
    local v383 = v379._networkImp:jsonEncode(v381);
    v46("grantAssetPermissions", "PATCH", v382, v383);
    return v379._networkImp:httpPatch(v382, v383);
end;
v38.grantAssetPermissionWithTimeout = function(v384, v385, v386) --[[ Line: 1201 ]] --[[ Name: grantAssetPermissionWithTimeout ]]
    -- upvalues: v27 (copy), l_game_FastInt_0 (copy)
    local v387 = v27.constructAssetPermissionsUrl(v385);
    local v388 = v384._networkImp:jsonEncode(v386);
    local v389 = {
        Url = v387, 
        Method = "PATCH", 
        Body = v388, 
        Headers = {
            ["Content-Type"] = "application/json"
        }, 
        Timeout = l_game_FastInt_0
    };
    return v384._networkImp:requestInternalRaw(v389);
end;
if v13() then
    v38.batchGrantAssetPermissions = function(v390, v391, v392) --[[ Line: 1220 ]] --[[ Name: batchGrantAssetPermissions ]]
        -- upvalues: v27 (copy), v46 (copy), l_Promise_0 (copy)
        local v393 = v27.constructAssetBatchGrantPermissionsUrl();
        local v394 = {};
        for _, v396 in ipairs(v391) do
            table.insert(v394, {
                assetId = v396, 
                grantToDependencies = true
            });
        end;
        local v397 = v390._networkImp:jsonEncode({
            subjectType = "Universe", 
            subjectId = tostring(v392), 
            action = "Use", 
            requests = v394
        });
        v46("batchGrantAssetPermissions", "PATCH", v393, v397);
        return v390._networkImp:httpPatch(v393, v397):andThen(function(v398) --[[ Line: 1236 ]]
            -- upvalues: v390 (copy)
            return v390._networkImp:jsonDecode(v398.responseBody);
        end):catch(function(v399) --[[ Line: 1239 ]]
            -- upvalues: l_Promise_0 (ref)
            return l_Promise_0.reject(v399);
        end);
    end;
end;
v38.revokeAssetPermissions = function(v400, v401, v402) --[[ Line: 1245 ]] --[[ Name: revokeAssetPermissions ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v403 = v27.constructAssetPermissionsUrl(v401);
    local v404 = v400._networkImp:jsonEncode(v402);
    v46("revokeAssetPermissions", "DELETE", v403, v404);
    return v400._networkImp:httpDeleteWithPayload(v403, v404);
end;
v38.getAssetPermissions = function(v405, v406) --[[ Line: 1253 ]] --[[ Name: getAssetPermissions ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v407 = v27.constructAssetPermissionsUrl(v406);
    v46("getAssetPermissions", "GET", v407);
    return v405._networkImp:httpGetJson(v407);
end;
v38.postAssetCheckPermissions = function(v408, v409, v410) --[[ Line: 1260 ]] --[[ Name: postAssetCheckPermissions ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v411 = v27.constructAssetCheckPermissionsUrl();
    return v47(function() --[[ Line: 1263 ]]
        -- upvalues: v408 (copy), v409 (copy), v410 (copy), v46 (ref), v411 (copy)
        local v412 = v408._networkImp:jsonEncode({
            actions = v409, 
            assetIds = v410
        });
        v46("postAssetCheckPermissions", "POST", v411);
        return v408._networkImp:httpPostJson(v411, v412);
    end);
end;
v38.tagsPrefixSearch = function(v413, v414, v415) --[[ Line: 1270 ]] --[[ Name: tagsPrefixSearch ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v416 = v27.constructGetTagsPrefixSearchUrl(v414, v415);
    return v47(function() --[[ Line: 1273 ]]
        -- upvalues: v46 (ref), v416 (copy), v413 (copy)
        v46("tagsPrefixSearch", "GET", v416);
        return v413._networkImp:httpGetJson(v416);
    end);
end;
v38.getTagsMetadata = function(v417) --[[ Line: 1279 ]] --[[ Name: getTagsMetadata ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v418 = v27.constructGetTagsMetadataUrl();
    return v47(function() --[[ Line: 1282 ]]
        -- upvalues: v46 (ref), v418 (copy), v417 (copy)
        v46("getTagsMetadata", "GET", v418);
        return v417._networkImp:httpGetJson(v418);
    end);
end;
v38.getAssetItemTags = function(v419, v420) --[[ Line: 1288 ]] --[[ Name: getAssetItemTags ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v421 = v27.constructGetAssetItemTagsUrl(v420);
    return v47(function() --[[ Line: 1291 ]]
        -- upvalues: v46 (ref), v421 (copy), v419 (copy)
        v46("getAssetItemTags", "GET", v421);
        return v419._networkImp:httpGetJson(v421);
    end);
end;
v38.addAssetTag = function(v422, v423, v424) --[[ Line: 1297 ]] --[[ Name: addAssetTag ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v425 = v27.constructAddAssetTagUrl();
    local v426 = v422._networkImp:jsonEncode({
        itemId = string.format("AssetId:%d", v423), 
        tagId = v424
    });
    return v47(function() --[[ Line: 1305 ]]
        -- upvalues: v46 (ref), v425 (copy), v426 (copy), v422 (copy)
        v46("addAssetTag", "POST", v425, v426);
        return v422._networkImp:httpPost(v425, v426);
    end);
end;
v38.deleteAssetItemTag = function(v427, v428) --[[ Line: 1311 ]] --[[ Name: deleteAssetItemTag ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v429 = v27.constructDeleteAssetItemTagUrl(v428);
    return v47(function() --[[ Line: 1314 ]]
        -- upvalues: v46 (ref), v429 (copy), v427 (copy)
        v46("deleteAssetItemTag", "DELETE", v429);
        return v427._networkImp:httpDelete(v429);
    end);
end;
v38.avatarAssetsGetUploadFee = function(v430, v431, v432, v433) --[[ Line: 1320 ]] --[[ Name: avatarAssetsGetUploadFee ]]
    -- upvalues: v27 (copy), v46 (copy), l_Promise_0 (copy)
    local v434 = v27.constructAvatarAssetsGetUploadFeeUrl(v431);
    local v435 = {
        Url = v434, 
        Method = "POST", 
        Body = v432, 
        CachePolicy = Enum.HttpCachePolicy.None, 
        Headers = {
            ["Content-Type"] = "multipart/form-data; boundary=" .. v433
        }
    };
    v46("avatarAssetsGetUploadFee", "POST FORM-DATA", v434, v432);
    return v430._networkImp:requestInternalRaw(v435):catch(function(v436) --[[ Line: 1334 ]]
        -- upvalues: l_Promise_0 (ref)
        return l_Promise_0.reject(v436);
    end);
end;
v38.avatarAssetsUpload = function(v437, v438, v439, v440) --[[ Line: 1339 ]] --[[ Name: avatarAssetsUpload ]]
    -- upvalues: v27 (copy), v46 (copy), l_Promise_0 (copy)
    local v441 = v27.constructAvatarAssetsUploadUrl(v438);
    local v442 = {
        Url = v441, 
        Method = "POST", 
        Body = v439, 
        CachePolicy = Enum.HttpCachePolicy.None, 
        Headers = {
            ["Content-Type"] = "multipart/form-data; boundary=" .. v440
        }
    };
    v46("avatarAssetsUpload", "POST FORM-DATA", v441, v439);
    return v437._networkImp:requestInternalRaw(v442):catch(function(v443) --[[ Line: 1353 ]]
        -- upvalues: l_Promise_0 (ref)
        return l_Promise_0.reject(v443);
    end);
end;
v38.getAssetTypeAgents = function(v444, v445) --[[ Line: 1358 ]] --[[ Name: getAssetTypeAgents ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v446 = v27.constructAssetTypeAgentsUrl(v445);
    return v47(function() --[[ Line: 1361 ]]
        -- upvalues: v46 (ref), v446 (copy), v444 (copy)
        v46("getAssetTypeAgents", "GET", v446);
        return v444._networkImp:httpGetJson(v446);
    end);
end;
v38.getAutocompleteResults = function(v447, v448, v449, v450) --[[ Line: 1367 ]] --[[ Name: getAutocompleteResults ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v451 = v27.constructToolboxAutocompleteUrl(v448, v449, v450);
    v46("getAutocompleteResults", "GET", v451);
    return v447._networkImp:httpGetJson(v451);
end;
v38.getHomeConfiguration = function(v452, v453, v454) --[[ Line: 1373 ]] --[[ Name: getHomeConfiguration ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v455 = v27.constructGetHomeConfigurationUrl(v453, v454);
    v46("getHomeConfiguration", "GET", v455);
    return v452._networkImp:httpGetJson(v455);
end;
v38.getCreatorMarketplaceQuotas = function(v456, v457, v458) --[[ Line: 1379 ]] --[[ Name: getCreatorMarketplaceQuotas ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v459 = v27.getCreatorMarketplaceQuotas(v457, v458);
    v46("getCreatorMarketplaceQuotas", "GET", v459);
    return v456._networkImp:httpGetJson(v459);
end;
v38.getPublishingRequirements = function(v460, v461, v462, v463) --[[ Line: 1388 ]] --[[ Name: getPublishingRequirements ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v464 = v27.constructPublishingRequirementsUrl(v461, v462, v463, "Creator");
    v46("getPublishingRequirements", "GET", v464);
    return v460._networkImp:httpGetJson(v464);
end;
v38.deleteAssetMedia = function(v465, v466, v467) --[[ Line: 1399 ]] --[[ Name: deleteAssetMedia ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v468 = v27.constructDeleteAssetMediaUrl(v466, v467);
    return v47(function() --[[ Line: 1402 ]]
        -- upvalues: v46 (ref), v468 (copy), v465 (copy)
        v46("deleteAssetMedia", "DELETE", v468);
        return v465._networkImp:httpDelete(v468);
    end);
end;
v38.postSetAssetMediaOrder = function(v469, v470, v471) --[[ Line: 1408 ]] --[[ Name: postSetAssetMediaOrder ]]
    -- upvalues: v27 (copy), v47 (copy), v46 (copy)
    local v472 = v27.constructPostSetAssetMediaOrder(v470);
    local v473 = v469._networkImp:jsonEncode(v471);
    return v47(function() --[[ Line: 1413 ]]
        -- upvalues: v46 (ref), v472 (copy), v473 (copy), v469 (copy)
        v46("postSetAssetMediaOrder", "POST", v472, v473);
        return v469._networkImp:httpPostJson(v472, v473);
    end);
end;
v38.postUploadAssetMedia = function(v474, v475, v476) --[[ Line: 1419 ]] --[[ Name: postUploadAssetMedia ]]
    -- upvalues: v27 (copy), v62 (copy), v47 (copy), v46 (copy), l_Promise_0 (copy)
    local v477 = v27.constructPostUploadAssetMedia(v475);
    local v478, v479 = v62(v477, v476);
    return v47(function() --[[ Line: 1424 ]]
        -- upvalues: v46 (ref), v477 (copy), v478 (copy), v474 (copy), v479 (copy), l_Promise_0 (ref)
        v46("postUploadAssetMedia", "POST FORM-DATA", v477, v478);
        return v474._networkImp:requestInternalRaw(v479):andThen(function(v480) --[[ Line: 1428 ]]
            -- upvalues: v474 (ref)
            return v474._networkImp:jsonDecode(v480.Body);
        end):catch(function(v481) --[[ Line: 1431 ]]
            -- upvalues: v474 (ref), l_Promise_0 (ref)
            v481.Body = if v481.Body then v474._networkImp:jsonDecode(v481.Body) else nil;
            return l_Promise_0.reject(v481);
        end);
    end, nil, true);
end;
v38.getUniverseInfo = function(v482, v483) --[[ Line: 1439 ]] --[[ Name: getUniverseInfo ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v484 = v27.constructGetUniverseInfo(v483);
    v46("getUniverseInfo", "GET", v484);
    return v482._networkImp:httpGet(v484);
end;
if v5() then
    v38.getCodeSummary = function(v485, v486) --[[ Line: 1447 ]] --[[ Name: getCodeSummary ]]
        -- upvalues: v27 (copy), v46 (copy)
        local v487 = v27.constructCodeUnderstandingSummaryUrl(v486);
        v46("getCodeSummary", "GET", v487);
        return v485._networkImp:httpGetJson(v487);
    end;
end;
v38.getFiatProduct = function(v488, v489, v490) --[[ Line: 1455 ]] --[[ Name: getFiatProduct ]]
    -- upvalues: v27 (copy), v46 (copy)
    local v491 = v27.constructGetFiatProductUrl(v489, v490);
    v46("getFiatProduct", "GET", v491);
    return v488._networkImp:httpGetJson(v491);
end;
if l_game_EngineFeature_0 then
    v38.getIsOwnedByUser = function(v492, v493, v494) --[[ Line: 1462 ]] --[[ Name: getIsOwnedByUser ]]
        -- upvalues: v24 (copy), v27 (copy), v46 (copy)
        local v495 = v24();
        local v496 = v27.constructAssetIsOwnedUrl(v495, v494.Name, v493);
        v46("getIsOwnedByUser", "GET", v496);
        return v492._networkImp:httpGetJson(v496);
    end;
    v38.getIsAssetOpenForUse = function(v497, v498) --[[ Line: 1469 ]] --[[ Name: getIsAssetOpenForUse ]]
        -- upvalues: v27 (copy), v46 (copy), v23 (copy)
        local v499 = v27.constructAssetCheckPermissionsBatchUrl();
        local v500 = v497._networkImp:jsonEncode({
            requests = {
                {
                    subject = {
                        subjectType = "All", 
                        subjectId = ""
                    }, 
                    action = "Use", 
                    assetId = v498
                }
            }
        });
        v46("getIsAssetOpenForUse", "POST", v499, v500);
        return v497._networkImp:httpPostJson(v499, v500):andThen(function(v501) --[[ Line: 1486 ]]
            -- upvalues: v23 (ref), v498 (copy)
            if v501 and v501.responseBody then
                if #v501.responseBody.results < 1 and v23.shouldDebugWarnings() then
                    error(string.format("No results for getIsAssetOpenForUse. assetId = %s", (tostring(v498))));
                end;
                local v502 = v501.responseBody.results[1];
                if v502.error and v23.shouldDebugWarnings() then
                    error(v502.error);
                end;
                return v502.value.status == "HasPermission";
            else
                return false;
            end;
        end);
    end;
end;
return v38;