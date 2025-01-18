local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local l_Util_0 = l_Parent_0.Core.Util;
local v5 = require(l_Util_0.PagedRequestCursor);
local l_LoadingInProgress_0 = require(l_Util_0.Keys).LoadingInProgress;
local v7 = require(l_Util_0.AssetConfigConstants);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v9 = require(l_Actions_0.SetAssetId);
local v10 = require(l_Actions_0.SetUploadAssetType);
local v11 = require(l_Actions_0.SetUploadAssetValidationStatus);
local v12 = require(l_Actions_0.SetVersionHistoryData);
local v13 = require(l_Actions_0.SetPackageDescriptions);
local v14 = require(l_Actions_0.SetAssetConfigData);
local v15 = require(l_Actions_0.SetCurrentScreen);
local v16 = require(l_Actions_0.SetScreenConfig);
local v17 = require(l_Actions_0.AddChange);
local v18 = require(l_Actions_0.ClearChange);
local v19 = require(l_Actions_0.SetAssetGroupData);
local v20 = require(l_Actions_0.UploadResult);
local v21 = require(l_Actions_0.ValidateAnimationResult);
local v22 = require(l_Actions_0.NetworkError);
local v23 = require(l_Actions_0.SetAssetConfigTab);
local v24 = require(l_Actions_0.SetOverrideAssets);
local v25 = require(l_Actions_0.SetAssetConfigManageableGroups);
local v26 = require(l_Actions_0.SetIsVerifiedCreator);
local v27 = require(l_Actions_0.SetLoadingPage);
local v28 = require(l_Actions_0.UpdateOverrideAssetData);
local v29 = require(l_Actions_0.SetCurrentPage);
local v30 = require(l_Actions_0.SetOverrideCursor);
local v31 = require(l_Actions_0.SetAssetConfigThumbnailStatus);
local v32 = require(l_Actions_0.SetGroupMetadata);
local v33 = require(l_Actions_0.SetOwnerUsername);
local v34 = require(l_Actions_0.CollaboratorSearchActions);
local v35 = require(l_Actions_0.SetCollaborators);
local v36 = require(l_Actions_0.SetIsPackage);
local v37 = require(l_Actions_0.UpdateAssetConfigData);
local v38 = require(l_Actions_0.UpdateAssetConfigStore);
local v39 = require(l_Actions_0.SetGroupRoleInfo);
local v40 = require(l_Actions_0.SetPackagePermission);
local v41 = require(l_Actions_0.SetTagSuggestions);
local v42 = require(l_Actions_0.SetFieldError);
local v43 = require(l_Actions_0.SetUploadFee);
local v44 = require(l_Actions_0.SetAssetConfigAssetTypeAgents);
local v45 = require(l_Actions_0.SetDescendantPermissions);
local v46 = require(l_Actions_0.ResolveAssetPermissionsRollingRequest);
local v47 = require(l_Actions_0.StartInProgressAssetPermissionsRollingRequest);
local v48 = require(l_Actions_0.QueueAssetPermissionsRollingRequest);
local v49 = require(l_Actions_0.SetPublishingRequirements);
local v50 = require(l_Actions_0.SetAssetMediaIds);
local v51 = require(l_Actions_0.SetAssetMediaMetadataArray);
local v52 = require(l_Actions_0.SetProgressBarInfo);
local v53 = require(l_Actions_0.SetFiatProduct);
local v54 = require(l_Parent_0.Core.Actions.SetSellerStatus);
local _ = require(l_Parent_0.Core.Types.MarketplaceFiatServiceTypes);
local v56 = require(l_Parent_0.Core.Flags.getFFlagToolboxRollingAssetPermissionRequests);
local v57 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAssetConfigOnboardingLink);
return v3.createReducer({
    assetConfigData = {}, 
    assetGroupData = {}, 
    idToFiatProductMap = {}, 
    versionHistory = nil, 
    packageDescriptions = {}, 
    changed = {}, 
    assetId = nil, 
    thumbnailStatus = nil, 
    instances = nil, 
    sourceInstances = nil, 
    screenFlowType = v7.FLOW_TYPE.UPLOAD_FLOW, 
    assetTypeEnum = nil, 
    assetTypeValidationSucceeded = nil, 
    currentScreen = nil, 
    screenConfigs = {}, 
    allowedAssetTypesForRelease = {}, 
    allowedAssetTypesForUpload = {}, 
    allowedBundleTypeSettings = {}, 
    canAffordUploadFee = true, 
    uploadFee = 0, 
    currentTab = nil, 
    resultsArray = {}, 
    manageableGroups = {}, 
    assetTypeAgents = {}, 
    isVerifiedCreator = true, 
    networkError = nil, 
    networkErrorAction = nil, 
    progressPercentage = 0, 
    progressTitle = nil, 
    progressText = nil, 
    networkTable = {}, 
    fetchedAll = false, 
    loadingPage = 0, 
    currentPage = 1, 
    overrideCursor = v5.createDefaultCursor(), 
    groupMetadata = {}, 
    localUserFriends = nil, 
    cachedSearchResults = {}, 
    searchText = "", 
    success = false, 
    collaborators = {}, 
    isPackageAsset = false, 
    packagePermissions = {}, 
    descendantPermissions = {}, 
    iconFile = nil, 
    deleteLocal = nil, 
    tagSuggestions = {}, 
    latestTagSuggestionTime = 0, 
    latestTagSearchQuery = "", 
    publishingRequirements = {}, 
    sellerStatusData = if v57() then {} else nil
}, {
    [v38.name] = function(v58, v59) --[[ Line: 162 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v58, v59.storeData);
    end, 
    [v9.name] = function(v60, v61) --[[ Line: 166 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v60, {
            assetId = v61.assetId
        });
    end, 
    [v10.name] = function(v62, v63) --[[ Line: 172 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v62, {
            assetTypeEnum = v63.assetTypeEnum
        });
    end, 
    [v11.name] = function(v64, v65) --[[ Line: 178 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v64, {
            assetTypeValidationSucceeded = v65.assetTypeValidationSucceeded
        });
    end, 
    [v15.name] = function(v66, v67) --[[ Line: 184 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v66, {
            currentScreen = v67.currentScreen
        });
    end, 
    [v16.name] = function(v68, v69) --[[ Line: 190 ]]
        -- upvalues: v2 (copy)
        local v70 = v2.Dictionary.join(v68.screenConfigs[v69.screen], {
            [v69.variable] = v69.value
        });
        local v71 = v2.Dictionary.join(v68.screenConfigs, {
            [v69.screen] = v70
        });
        return v2.Dictionary.join(v68, {
            screenConfigs = v71
        });
    end, 
    [v12.name] = function(v72, v73) --[[ Line: 204 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v72, {
            versionHistory = v73.versionHistory
        });
    end, 
    [v13.name] = function(v74, v75) --[[ Line: 210 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v74, {
            packageDescriptions = v75.packageDescriptions
        });
    end, 
    [v14.name] = function(v76, v77) --[[ Line: 216 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v76, {
            assetConfigData = v77.assetConfigData
        });
    end, 
    [v37.name] = function(v78, v79) --[[ Line: 222 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v78, {
            assetConfigData = v2.Dictionary.join(v78.assetConfigData or {}, v79.assetConfigData)
        });
    end, 
    [v17.name] = function(v80, v81) --[[ Line: 228 ]]
        -- upvalues: v2 (copy)
        local l_setting_0 = v81.setting;
        local l_value_0 = v81.value;
        return v2.Dictionary.join(v80, {
            changed = v2.Dictionary.join(v80.changed or {}, {
                [l_setting_0] = l_value_0
            })
        });
    end, 
    [v18.name] = function(v84, v85) --[[ Line: 239 ]]
        -- upvalues: v2 (copy)
        local l_setting_1 = v85.setting;
        return v2.Dictionary.join(v84, {
            changed = v2.Dictionary.join(v84.changed or {}, {
                [l_setting_1] = v2.None
            })
        });
    end, 
    [v19.name] = function(v87, v88) --[[ Line: 249 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v87, {
            assetGroupData = v88.assetGroupData
        });
    end, 
    [v22.name] = function(v89, v90) --[[ Line: 255 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v89, {
            networkError = v90.response, 
            networkErrorAction = v90.networkErrorAction
        });
    end, 
    [v52.name] = function(v91, v92) --[[ Line: 262 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v91, {
            progressPercentage = v92.progressPercentage, 
            progressTitle = v92.progressTitle, 
            progressText = v92.progressText
        });
    end, 
    [v20.name] = function(v93, v94) --[[ Line: 270 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v93, {
            uploadSucceeded = v94.uploadSucceeded
        });
    end, 
    [v21.name] = function(v95, v96) --[[ Line: 276 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v95, {
            validateAnimationSucceeded = v96.validateAnimationSucceeded
        });
    end, 
    [v23.name] = function(v97, v98) --[[ Line: 282 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v97, {
            currentTab = v98.tabItem
        });
    end, 
    [v24.name] = function(v99, v100) --[[ Line: 288 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v99, {
            resultsArray = v100.resultsArray, 
            fetchedAll = v2.None
        });
    end, 
    [v28.name] = function(v101, v102) --[[ Line: 295 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v101, {
            resultsArray = v2.List.join(v101.resultsArray or {}, v102.resultsArray), 
            fetchedAll = v102.fetchedAll
        });
    end, 
    [v25.name] = function(v103, v104) --[[ Line: 302 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v103, {
            manageableGroups = v104.manageableGroups
        });
    end, 
    [v26.name] = function(v105, v106) --[[ Line: 308 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v105, {
            isVerifiedCreator = v106.isVerifiedCreator
        });
    end, 
    [v27.name] = function(v107, v108) --[[ Line: 314 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v107, {
            loadingPage = v108.loadingPage
        });
    end, 
    [v29.name] = function(v109, v110) --[[ Line: 320 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v109, {
            currentPage = v110.currentPage
        });
    end, 
    [v30.name] = function(v111, v112) --[[ Line: 326 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v111, {
            overrideCursor = v112.overrideCursor
        });
    end, 
    [v31.name] = function(v113, v114) --[[ Line: 332 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v113, {
            thumbnailStatus = v114.thumbnailStatus
        });
    end, 
    [v32.name] = function(v115, v116) --[[ Line: 338 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v115, {
            [v116.groupMetadata.Id] = {
                name = v116.groupMetadata.Name, 
                groupMetadata = v116.groupMetadata
            }
        });
    end, 
    [v33.name] = function(v117, v118) --[[ Line: 347 ]]
        -- upvalues: v2 (copy)
        if Enum.CreatorType[v117.assetConfigData.Creator.type] ~= Enum.CreatorType.User then
            return v117;
        else
            return v2.Dictionary.join(v117, {
                assetConfigData = v2.Dictionary.join(v117.assetConfigData, {
                    Creator = v2.Dictionary.join(v117.assetConfigData.Creator, {
                        username = v118.ownerUsername
                    })
                })
            });
        end;
    end, 
    [v34.LoadedLocalUserFriends.name] = function(v119, v120) --[[ Line: 361 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v119, {
            localUserFriends = v120.success and v120.friends or {}
        });
    end, 
    [v34.LoadedLocalUserGroups.name] = function(v121, v122) --[[ Line: 367 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v121, {
            localUserGroups = v122.success and v122.groups or {}
        });
    end, 
    [v34.LoadedWebResults.name] = function(v123, v124) --[[ Line: 373 ]]
        -- upvalues: v2 (copy)
        if not v123.cachedSearchResults then
            v123 = v2.Dictionary.join(v123, {
                cachedSearchResults = {}
            });
        end;
        return v2.Dictionary.join(v123, {
            cachedSearchResults = v2.Dictionary.join(v123.cachedSearchResults, {
                [v124.key] = v124.success and v124.results or {}
            })
        });
    end, 
    [v34.LoadingWebResults.name] = function(v125, v126) --[[ Line: 386 ]]
        -- upvalues: v2 (copy), l_LoadingInProgress_0 (copy)
        if not v125.cachedSearchResults then
            v125 = v2.Dictionary.join(v125, {
                cachedSearchResults = {}
            });
        end;
        return v2.Dictionary.join(v125, {
            cachedSearchResults = v2.Dictionary.join(v125.cachedSearchResults, {
                [v126.searchTerm] = l_LoadingInProgress_0
            })
        });
    end, 
    [v34.LoadingLocalUserFriends.name] = function(v127, _) --[[ Line: 399 ]]
        -- upvalues: v2 (copy), l_LoadingInProgress_0 (copy)
        return v2.Dictionary.join(v127, {
            localUserFriends = l_LoadingInProgress_0
        });
    end, 
    [v34.LoadingLocalUserGroups.name] = function(v129, _) --[[ Line: 405 ]]
        -- upvalues: v2 (copy), l_LoadingInProgress_0 (copy)
        return v2.Dictionary.join(v129, {
            localUserGroups = l_LoadingInProgress_0
        });
    end, 
    [v34.SearchTextChanged.name] = function(v131, v132) --[[ Line: 411 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v131, {
            searchText = v132.text
        });
    end, 
    [v35.name] = function(v133, v134) --[[ Line: 417 ]]
        -- upvalues: v2 (copy)
        if v133.originalCollaborators then
            return v2.Dictionary.join(v133, {
                collaborators = v134.collaborators
            });
        else
            return v2.Dictionary.join(v133, {
                originalCollaborators = v134.collaborators, 
                collaborators = v134.collaborators
            });
        end;
    end, 
    [v36.name] = function(v135, v136) --[[ Line: 430 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v135, {
            isPackageAsset = v136.isPackageAsset
        });
    end, 
    [v39.name] = function(v137, v138) --[[ Line: 436 ]]
        -- upvalues: v2 (copy)
        if Enum.CreatorType[v137.assetConfigData.Creator.type] ~= Enum.CreatorType.Group then
            return v137;
        else
            local l_targetId_0 = v137.assetConfigData.Creator.targetId;
            for _, v141 in pairs(v138.groupRoleInfo) do
                for v142, v143 in pairs(v137[l_targetId_0].groupMetadata.Roles) do
                    if v141.name == v143.Name then
                        local v144 = v2.Dictionary.join(v143, {
                            Id = v141.id
                        });
                        v137[l_targetId_0].groupMetadata.Roles[v142] = v144;
                    end;
                end;
            end;
            return v137;
        end;
    end, 
    [v40.name] = function(v145, v146) --[[ Line: 455 ]]
        -- upvalues: v2 (copy)
        if not v145.packagePermissions then
            v145.packagePermissions = {};
        end;
        v145.packagePermissions = v2.Dictionary.join(v145.packagePermissions, v146.packagePermissions);
        return v145;
    end, 
    [v41.name] = function(v147, v148) --[[ Line: 465 ]]
        -- upvalues: v2 (copy)
        if v148.sentTime < (v147.latestTagSuggestionTime or 0) then
            return v147;
        else
            return v2.Dictionary.join(v147, {
                tagSuggestions = v148.suggestions, 
                latestTagSuggestionTime = v148.sentTime, 
                latestTagSearchQuery = v148.prefix
            });
        end;
    end, 
    [v42.name] = function(v149, v150) --[[ Line: 477 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v149, {
            tabErrors = v2.Dictionary.join(v149.tabErrors or {}, {
                [v150.tabName] = v2.Dictionary.join(v149.tabErrors and v149.tabErrors[v150.tabName] or {}, {
                    [v150.fieldName] = v150.hasError
                })
            })
        });
    end, 
    [v43.name] = function(v151, v152) --[[ Line: 487 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v151, {
            isUploadFeeEnabled = v152.isUploadFeeEnabled, 
            uploadFee = v152.uploadFee, 
            canAffordUploadFee = v152.canAffordUploadFee
        });
    end, 
    [v44.name] = function(v153, v154) --[[ Line: 495 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v153, {
            assetTypeAgents = v154.assetTypeAgents
        });
    end, 
    [v45.name] = function(v155, v156) --[[ Line: 501 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v155, {
            descendantPermissions = v156.permission
        });
    end, 
    [v46.name] = function(v157, v158) --[[ Line: 507 ]]
        -- upvalues: v56 (copy), v2 (copy)
        assert(v56());
        return v2.Dictionary.join(v157, {
            rollingAssetPermissionRequests = v2.Dictionary.join(v157.rollingAssetPermissionRequests, {
                inProgress = v2.List.removeValue(v157.rollingAssetPermissionRequests.inProgress, v158.id)
            })
        });
    end, 
    [v47.name] = function(v159, v160) --[[ Line: 516 ]]
        -- upvalues: v56 (copy), v2 (copy)
        assert(v56());
        return v2.Dictionary.join(v159, {
            rollingAssetPermissionRequests = v2.Dictionary.join(v159.rollingAssetPermissionRequests, {
                inProgress = v2.List.join(v159.rollingAssetPermissionRequests.inProgress, {
                    v160.id
                }), 
                queued = v2.List.removeValue(v159.rollingAssetPermissionRequests.queued, v160.id)
            })
        });
    end, 
    [v48.name] = function(v161, v162) --[[ Line: 526 ]]
        -- upvalues: v56 (copy), v2 (copy)
        assert(v56());
        return v2.Dictionary.join(v161, {
            rollingAssetPermissionRequests = v2.Dictionary.join(v161.rollingAssetPermissionRequests, {
                queued = v2.List.join(v161.rollingAssetPermissionRequests.queued, {
                    v162.id
                })
            })
        });
    end, 
    [v49.name] = function(v163, v164) --[[ Line: 535 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v163, {
            publishingRequirements = v164.publishingRequirements
        });
    end, 
    [v50.name] = function(v165, v166) --[[ Line: 541 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v165, {
            assetMediaIds = v166.assetMediaIds
        });
    end, 
    [v51.name] = function(v167, v168) --[[ Line: 547 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v167, {
            assetMediaMetadataArray = v168.assetMediaMetadataArray
        });
    end, 
    [v53.name] = function(v169, v170) --[[ Line: 553 ]]
        -- upvalues: v2 (copy)
        local v171 = {
            [v170.assetId] = v170.fiatProduct
        };
        return v2.Dictionary.join(v169, {
            idToFiatProductMap = v2.Dictionary.join(v169.idToFiatProductMap, v171)
        });
    end, 
    [v54.name] = v57() and function(v172, v173) --[[ Line: 562 ]]
        -- upvalues: v2 (copy)
        local l_sellerStatusData_0 = v173.sellerStatusData;
        return v2.Dictionary.join(v172, {
            sellerStatusData = l_sellerStatusData_0
        });
    end or nil
});