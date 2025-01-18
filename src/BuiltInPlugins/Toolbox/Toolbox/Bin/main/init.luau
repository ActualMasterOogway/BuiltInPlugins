return function(v0, v1) --[[ Line: 3 ]]
    if not v0 then
        return;
    else
        local l_Parent_0 = script.Parent.Parent;
        local l_Util_0 = l_Parent_0.Core.Util;
        local l_DebugToolboxEnableRoactChecks_0 = game:GetFastFlag("DebugToolboxEnableRoactChecks");
        local l_DebugToolboxGetRolesRequest_0 = game:GetFastFlag("DebugToolboxGetRolesRequest");
        local l_UnifyModelPackagePublish3_0 = game:GetFastFlag("UnifyModelPackagePublish3");
        local l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForAll");
        local l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForIXP3");
        local l_ShowSaveToRobloxOnStudioAssetService_0 = game:GetFastFlag("ShowSaveToRobloxOnStudioAssetService");
        local v10 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAssetConfigOnboardingLink);
        if require(l_Util_0.isCli)() then
            return;
        else
            local l_StudioService_0 = game:GetService("StudioService");
            local v12 = l_StudioService_0:HasInternalPermission();
            local l_Packages_0 = l_Parent_0.Packages;
            local v14 = require(l_Packages_0.Roact);
            local v15 = require(l_Packages_0.Framework);
            local v16 = require(l_Packages_0.Dev.DeveloperTools);
            if l_DebugToolboxEnableRoactChecks_0 then
                v14.setGlobalConfig({
                    elementTracing = true, 
                    propValidation = true, 
                    typeChecks = true
                });
            end;
            local v17 = require(l_Packages_0.Rodux);
            local v18 = require(l_Util_0.InsertAsset);
            local v19 = require(l_Util_0.Analytics.AssetAnalyticsContextItem);
            local v20 = require(l_Util_0.DebugFlags);
            local v21 = require(l_Util_0.Settings);
            local v22 = require(l_Util_0.ToolboxTheme);
            local v23 = require(l_Util_0.AssetConfigTheme);
            local v24 = require(l_Util_0.AssetConfigConstants);
            local v25 = require(l_Util_0.AssetConfigUtil);
            local v26 = require(l_Util_0.Analytics.makeToolboxAnalyticsContext);
            local v27 = require(l_Parent_0.Core.ContextServices.IXPContext);
            if v20.shouldDebugWarnings() then
                require(l_Packages_0.Framework).Util.Promise.onUnhandledRejection = warn;
            end;
            local v28 = require(l_Parent_0.Core.Types.Background);
            local v29 = require(l_Parent_0.Core.Types.Suggestion);
            local v30 = require(l_Parent_0.Core.Types.ConfigTypes);
            local v31 = require(l_Parent_0.Core.Components.ToolboxPlugin);
            local l_getToolboxEnabled_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).getToolboxEnabled;
            local v33 = require(l_Parent_0.Core.Util.ToolboxCommunication);
            local v34 = require(l_Parent_0.Core.Reducers.ToolboxReducer);
            local v35 = require(l_Parent_0.Core.Reducers.AssetConfigReducer);
            local v36 = require(l_Parent_0.Core.Networking.NetworkInterface);
            local v37 = require(l_Parent_0.Core.Components.AssetConfiguration.AssetConfigWrapper);
            local v38 = require(l_Parent_0.Core.Components.ToolboxServiceWrapper);
            local v39 = require(l_Parent_0.Core.Networking.Requests.GetRolesRequest);
            local v40 = require(l_Parent_0.Core.Networking.Requests.GetRolesDebugRequest);
            local v41 = require(l_Parent_0.Core.Flags.getFFlagToolboxRollingAssetPermissionRequests);
            local l_ContextServices_0 = v15.ContextServices;
            local l_ThunkWithArgsMiddleware_0 = v15.Util.ThunkWithArgsMiddleware;
            local l_find_0 = require(l_Packages_0.Dash).find;
            local l_SourceStrings_0 = l_Parent_0.LocalizationSource.SourceStrings;
            local l_LocalizedStrings_0 = l_Parent_0.LocalizationSource.LocalizedStrings;
            local l_HttpService_0 = game:GetService("HttpService");
            local l_RobloxPluginGuiService_0 = game:GetService("RobloxPluginGuiService");
            local l_StudioAssetService_0 = game:GetService("StudioAssetService");
            if not l_getToolboxEnabled_0() then
                return;
            else
                local v50 = l_ContextServices_0.Localization.new({
                    stringResourceTable = l_SourceStrings_0, 
                    translationResourceTable = l_LocalizedStrings_0, 
                    pluginName = "Toolbox", 
                    libraries = {
                        [v15.Resources.LOCALIZATION_PROJECT_NAME] = {
                            stringResourceTable = v15.Resources.SourceStrings, 
                            translationResourceTable = v15.Resources.LocalizedStrings
                        }
                    }
                });
                local function v53() --[[ Line: 114 ]] --[[ Name: createTheme ]]
                    -- upvalues: v22 (copy)
                    return v22.new({
                        getTheme = function() --[[ Line: 116 ]] --[[ Name: getTheme ]]
                            return settings().Studio.Theme;
                        end, 
                        isDarkerTheme = function(v51) --[[ Line: 119 ]] --[[ Name: isDarkerTheme ]]
                            local l_v51_Color_0 = v51:GetColor(Enum.StudioStyleGuideColor.MainBackground);
                            return (l_v51_Color_0.r + l_v51_Color_0.g + l_v51_Color_0.b) / 3 < 0.5;
                        end, 
                        themeChanged = settings().Studio.ThemeChanged
                    });
                end;
                local function v54() --[[ Line: 128 ]] --[[ Name: createAssetConfigTheme ]]
                    -- upvalues: v23 (copy)
                    return v23.new({
                        getTheme = function() --[[ Line: 131 ]] --[[ Name: getTheme ]]
                            return settings().Studio.Theme;
                        end, 
                        themeChanged = settings().Studio.ThemeChanged
                    });
                end;
                local v55 = nil;
                local v56 = nil;
                local function v91(v57, v58, v59, v60, v61, v62) --[[ Line: 156 ]] --[[ Name: createAssetConfig ]]
                    -- upvalues: v56 (ref), v55 (ref), l_find_0 (copy), v25 (copy), v30 (copy), v24 (copy), l_ThunkWithArgsMiddleware_0 (copy), l_StudioAssetService_0 (copy), v17 (copy), v35 (copy), l_UnifyModelPackagePublish3_0 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (copy), v41 (copy), v10 (copy), v54 (copy), v36 (copy), l_RobloxPluginGuiService_0 (copy), v14 (copy), l_StudioService_0 (copy), v27 (copy), v37 (copy), v0 (copy), v38 (copy), v50 (copy)
                    if v56 then
                        return;
                    else
                        local v63 = {};
                        local v64 = {};
                        local v65 = {};
                        local v66 = {};
                        local v67 = {};
                        local v68 = false;
                        local v69 = {};
                        local v70 = 0;
                        if v55 then
                            v63 = v55:getState().roles.allowedAssetTypesForRelease;
                            v64 = v55:getState().roles.allowedAssetTypesForUpload;
                            v65 = v55:getState().roles.allowedAssetTypesForFree;
                            v66 = v55:getState().roles.allowedBundleTypeSettings;
                            v67 = v55:getState().packages.permissionsTable;
                            v68 = v55:getState().itemTags.isItemTagsFeatureEnabled;
                            v69 = v55:getState().itemTags.enabledAssetTypesForItemTags;
                            v70 = v55:getState().itemTags.maximumItemTagsPerItem;
                        end;
                        local v71 = nil;
                        local v72 = if v55:getState() and v55:getState().assets then v55:getState().assets.idToAssetMap else nil;
                        if v72 then
                            local v75 = l_find_0(v72, function(_, v74) --[[ Line: 188 ]]
                                -- upvalues: v57 (copy)
                                return v57 == v74;
                            end);
                            v71 = if v75 and v75.Asset then v75.Asset.AssetMediaIds else nil;
                        end;
                        local v76 = v25.getFlowStartScreen(v58, v63);
                        local v77 = v30:getDefualtTab();
                        if v58 == v24.FLOW_TYPE.DOWNLOAD_FLOW then
                            v77 = v30:getOverrideTab();
                        end;
                        local v78 = {
                            l_ThunkWithArgsMiddleware_0({
                                StudioAssetService = l_StudioAssetService_0
                            })
                        };
                        local v79 = v17.Store.new(v35, {
                            assetId = v57, 
                            assetMediaIds = v71, 
                            screenFlowType = v58, 
                            currentScreen = v76, 
                            instances = v59, 
                            sourceInstances = (not not l_UnifyModelPackagePublish3_0 or l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0) and v61 or nil, 
                            allowedAssetTypesForRelease = v63, 
                            allowedAssetTypesForUpload = v64, 
                            allowedAssetTypesForFree = v65, 
                            allowedBundleTypeSettings = v66, 
                            idToFiatProductMap = {}, 
                            isItemTagsFeatureEnabled = v68, 
                            enabledAssetTypesForItemTags = v69, 
                            maximumItemTagsPerItem = v70, 
                            rollingAssetPermissionRequests = if v41() then {
                                inProgress = {}, 
                                queued = {}
                            } else nil, 
                            assetTypeEnum = v60, 
                            currentTab = v77, 
                            packagePermissions = v67, 
                            overrideCursor = {}, 
                            deleteLocal = false, 
                            hasSubsequent = v62, 
                            sellerStatusData = if v10() then {} else nil
                        }, v78);
                        local v80 = v54();
                        local v81 = v36.new();
                        local function v87() --[[ Line: 248 ]] --[[ Name: onAssetConfigDestroy ]]
                            -- upvalues: v56 (ref), l_RobloxPluginGuiService_0 (ref), v14 (ref), l_StudioService_0 (ref)
                            if v56 then
                                local function _() --[[ Line: 250 ]] --[[ Name: fireTabRefreshEvent ]]
                                    -- upvalues: l_RobloxPluginGuiService_0 (ref)
                                    local l_Toolbox_0 = l_RobloxPluginGuiService_0:FindFirstChild("Toolbox");
                                    local v83 = l_Toolbox_0 and l_Toolbox_0:FindFirstChild("tabRefresh");
                                    if v83 then
                                        v83:Fire();
                                    end;
                                end;
                                local l_Toolbox_1 = l_RobloxPluginGuiService_0:FindFirstChild("Toolbox");
                                local v86 = l_Toolbox_1 and l_Toolbox_1:FindFirstChild("tabRefresh");
                                if v86 then
                                    v86:Fire();
                                end;
                                v14.unmount(v56);
                                v56 = nil;
                                l_StudioService_0:AnimationIdSelected(0);
                            end;
                        end;
                        local v88 = if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then v27.new() else nil;
                        local v89 = v14.createElement(v37, {
                            assetId = v57, 
                            assetTypeEnum = v60, 
                            plugin = v0, 
                            store = v79, 
                            theme = v80, 
                            networkInterface = v81, 
                            onAssetConfigDestroy = v87
                        });
                        local v90 = v14.createElement(v38, {
                            ixp = if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then v88 else nil, 
                            localization = v50, 
                            plugin = v0, 
                            theme = v80, 
                            store = v79, 
                            settings = settings
                        }, {
                            v89
                        });
                        v56 = v14.mount(v90);
                        return;
                    end;
                end;
                (function() --[[ Line: 293 ]] --[[ Name: main ]]
                    -- upvalues: v55 (ref), v17 (copy), v34 (copy), v19 (copy), v26 (copy), v21 (copy), v0 (copy), v53 (copy), v36 (copy), v28 (copy), v29 (copy), v12 (copy), v16 (copy), v14 (copy), v33 (copy), v31 (copy), v1 (copy), v91 (copy), l_DebugToolboxGetRolesRequest_0 (copy), v40 (copy), v39 (copy), v27 (copy), v38 (copy), v50 (copy), l_UnifyModelPackagePublish3_0 (copy), l_ShowSaveToRobloxOnStudioAssetService_0 (copy), v25 (copy), v24 (copy), l_HttpService_0 (copy), v18 (copy)
                    v55 = v17.Store.new(v34, nil, {
                        v17.thunkMiddleware
                    });
                    local v92 = v19.new();
                    local v93 = v26();
                    local v94 = v21.new(v0);
                    local v95 = v53();
                    local v96 = v36.new();
                    local l_BACKGROUNDS_0 = v28.BACKGROUNDS;
                    local l_SUGGESTIONS_0 = v29.SUGGESTIONS;
                    local v99 = nil;
                    local v100 = nil;
                    if v12 then
                        v100 = v16.forPlugin("Toolbox", v0);
                    end;
                    local function v101() --[[ Line: 315 ]] --[[ Name: onPluginWillDestroy ]]
                        -- upvalues: v99 (ref), v14 (ref), v100 (ref)
                        if v99 then
                            v14.unmount(v99);
                        end;
                        if v100 then
                            v100:destroy();
                        end;
                    end;
                    v33:setup(v55);
                    local v107 = v14.createElement(v31, {
                        plugin = v0, 
                        store = v55, 
                        settings = v94, 
                        theme = v95, 
                        networkInterface = v96, 
                        pluginLoaderContext = v1, 
                        backgrounds = l_BACKGROUNDS_0, 
                        suggestions = l_SUGGESTIONS_0, 
                        onPluginWillDestroy = v101, 
                        tryOpenAssetConfig = function(v102, v103, v104, v105) --[[ Line: 338 ]] --[[ Name: tryOpenAssetConfig ]]
                            -- upvalues: v91 (ref), l_DebugToolboxGetRolesRequest_0 (ref), v55 (ref), v40 (ref), v96 (copy), v39 (ref)
                            local function v106() --[[ Line: 339 ]] --[[ Name: proceedToEdit ]]
                                -- upvalues: v91 (ref), v102 (copy), v103 (copy), v104 (copy), v105 (copy)
                                v91(v102, v103, v104, v105);
                            end;
                            if l_DebugToolboxGetRolesRequest_0 then
                                v55:dispatch(v40(v96)):andThen(v106, v106);
                                return;
                            else
                                v55:dispatch(v39(v96)):andThen(v106, v106);
                                return;
                            end;
                        end
                    });
                    local v108 = v27.new();
                    local v109 = nil;
                    v109 = v14.createElement(v38, {
                        localization = v50, 
                        plugin = v0, 
                        theme = v95, 
                        store = v55, 
                        settings = v94, 
                        assetAnalytics = v92, 
                        analytics = v93, 
                        ixp = v108
                    }, {
                        v107
                    });
                    v99 = v14.mount(v109);
                    if v100 then
                        v100:addRoactTree("Roact tree", v99, v14);
                    end;
                    if l_UnifyModelPackagePublish3_0 or l_ShowSaveToRobloxOnStudioAssetService_0 then
                        v1.signals["StudioAssetService.OnSaveToRoblox"]:Connect(function(v110, v111, v112) --[[ Line: 373 ]]
                            -- upvalues: v25 (ref), v91 (ref), v24 (ref), l_DebugToolboxGetRolesRequest_0 (ref), v55 (ref), v40 (ref), v96 (copy), v39 (ref)
                            local function v114() --[[ Line: 374 ]] --[[ Name: proceedToUpload ]]
                                -- upvalues: v25 (ref), v110 (copy), v112 (copy), v111 (copy), v91 (ref), v24 (ref)
                                local v113 = v25.getClonedInstances(v110);
                                assert(v112 ~= nil);
                                if v111 ~= nil then
                                    v91(nil, v24.FLOW_TYPE.UPLOAD_FLOW, v113, if typeof(v111) == "EnumItem" then v111 else if typeof(v111) == "string" then v24.UGCBundleTypes[v111] else nil, v110, v112);
                                    return;
                                elseif #v113 == 1 and v113[1]:IsA("AnimationClip") then
                                    v91(nil, v24.FLOW_TYPE.UPLOAD_FLOW, v113, Enum.AssetType.Animation, nil, v112);
                                    return;
                                else
                                    v91(nil, v24.FLOW_TYPE.UPLOAD_FLOW, v113, nil, v110, v112);
                                    return;
                                end;
                            end;
                            if l_DebugToolboxGetRolesRequest_0 then
                                v55:dispatch(v40(v96)):andThen(v114, v114);
                                return;
                            else
                                v55:dispatch(v39(v96)):andThen(v114, v114);
                                return;
                            end;
                        end);
                    else
                        v1.signals["StudioService.OnSaveToRoblox"]:Connect(function(v115) --[[ Line: 429 ]]
                            -- upvalues: v25 (ref), v91 (ref), v24 (ref), l_DebugToolboxGetRolesRequest_0 (ref), v55 (ref), v40 (ref), v96 (copy), v39 (ref)
                            local function v117() --[[ Line: 430 ]] --[[ Name: proceedToUpload ]]
                                -- upvalues: v25 (ref), v115 (copy), v91 (ref), v24 (ref)
                                local v116 = v25.getClonedInstances(v115);
                                if #v116 == 1 and v116[1]:IsA("AnimationClip") then
                                    v91(nil, v24.FLOW_TYPE.UPLOAD_FLOW, v116, Enum.AssetType.Animation);
                                    return;
                                else
                                    v91(nil, v24.FLOW_TYPE.UPLOAD_FLOW, v116, nil, v115);
                                    return;
                                end;
                            end;
                            if l_DebugToolboxGetRolesRequest_0 then
                                v55:dispatch(v40(v96)):andThen(v117, v117);
                                return;
                            else
                                v55:dispatch(v39(v96)):andThen(v117, v117);
                                return;
                            end;
                        end);
                    end;
                    v1.signals["StudioService.OnImportFromRoblox"]:Connect(function(_) --[[ Line: 459 ]]
                        -- upvalues: v91 (ref), v24 (ref)
                        v91(nil, v24.FLOW_TYPE.DOWNLOAD_FLOW, nil, Enum.AssetType.Animation);
                    end);
                    v1.signals["StudioService.OnOpenManagePackagePlugin"]:Connect(function(_, v120) --[[ Line: 463 ]]
                        -- upvalues: v91 (ref), v24 (ref)
                        v91(v120, v24.FLOW_TYPE.EDIT_FLOW, nil, Enum.AssetType.Model);
                    end);
                    v1.signals["StudioService.OnPublishAsPlugin"]:Connect(function(v121) --[[ Line: 468 ]]
                        -- upvalues: v91 (ref), v24 (ref), v25 (ref), l_DebugToolboxGetRolesRequest_0 (ref), v55 (ref), v40 (ref), v96 (copy), v39 (ref)
                        local function v122() --[[ Line: 469 ]] --[[ Name: proceedToPublish ]]
                            -- upvalues: v91 (ref), v24 (ref), v25 (ref), v121 (copy)
                            v91(nil, v24.FLOW_TYPE.UPLOAD_FLOW, v25.getClonedInstances(v121), Enum.AssetType.Plugin);
                        end;
                        if l_DebugToolboxGetRolesRequest_0 then
                            v55:dispatch(v40(v96)):andThen(v122, v122);
                            return;
                        else
                            v55:dispatch(v39(v96)):andThen(v122, v122);
                            return;
                        end;
                    end);
                    v1.signals["MemStorageService.OpenAssetConfiguration"]:Connect(function(v123) --[[ Line: 488 ]]
                        -- upvalues: l_HttpService_0 (ref), v91 (ref), v24 (ref)
                        local v124 = l_HttpService_0:JSONDecode(v123);
                        if v124.assetType == Enum.AssetType.Image then
                            v91(v124.id, v24.FLOW_TYPE.EDIT_FLOW, nil, Enum.AssetType.Image);
                            return;
                        else
                            v91(v124.id, v24.FLOW_TYPE.EDIT_FLOW, nil, Enum.AssetType.MeshPart);
                            return;
                        end;
                    end);
                    v18.registerLocalization(v50);
                    v18.registerProcessDragHandler(v0);
                end)();
                return;
            end;
        end;
    end;
end;