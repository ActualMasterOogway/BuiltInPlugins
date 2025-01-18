local l_HttpService_0 = game:GetService("HttpService");
local l_ToolboxEnableAudioGrantDialog_0 = game:GetFastFlag("ToolboxEnableAudioGrantDialog");
local l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForIXP3");
local l_ToolboxLogInsertDuration_0 = game:GetFastFlag("ToolboxLogInsertDuration");
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryCreatorFilter);
local v6 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxGrantUponInsertion);
local v7 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableWebView);
local l_Packages_0 = l_Parent_0.Packages;
local v9 = require(l_Packages_0.Cryo);
local v10 = require(l_Packages_0.Roact);
local v11 = require(l_Packages_0.RoactRodux);
local l_Util_0 = l_Parent_0.Core.Util;
local v13 = require(l_Util_0.Constants);
local v14 = require(l_Util_0.DebugFlags);
local v15 = require(l_Util_0.Images);
local v16 = require(l_Util_0.Analytics.AssetAnalyticsContextItem);
local v17 = require(l_Util_0.InsertToolPromise);
local v18 = require(l_Util_0.InsertAsset);
local v19 = nil;
if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then
    v19 = require(l_Util_0.getIsIXPVariableEnabled);
end;
local v20 = require(l_Util_0.getIsWithinBounds);
local v21 = require(l_Util_0.SharedFlags.getIsUseWebView);
local v22 = require(l_Parent_0.Core.Types.Category);
local v23 = require(l_Parent_0.Core.Components.Asset.Preview.AssetPreviewWrapper);
local v24 = require(l_Parent_0.Core.Components.MessageBox.MessageBox);
local v25 = require(l_Parent_0.Core.Components.ScriptConfirmationDialog);
local v26 = require(l_Parent_0.Core.ContextServices.IXPContext);
local v27 = require(l_Parent_0.Core.Components.PurchaseFlow.PurchaseFlowWrapper);
local v28 = require(l_Parent_0.Core.Components.PurchaseFlow.SubsequentDialogController);
local v29 = require(l_Parent_0.Core.Networking.Requests.PostInsertAssetRequest);
local v30 = require(l_Parent_0.Core.Actions.SetMostRecentAssetInsertTime);
local v31 = require(l_Parent_0.Core.Thunks.GetPageInfoAnalyticsContextInfo);
local v32 = require(l_Parent_0.Core.Networking.Requests.SearchWithOptions);
local v33 = require(l_Parent_0.Core.Actions.SetAssetPreview);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v36 = require(l_Parent_0.Core.ContextServices.Settings);
local v37 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local _ = require(l_Parent_0.Core.Models.AssetInfo);
local v39 = require(l_Parent_0.Core.Types.ConfigTypes);
local _ = require(l_Parent_0.Core.Types.CreatorTypes);
local _ = require(l_Parent_0.Core.Types.AssetLogicTypes);
local _ = require(l_Packages_0.Framework).Util.deepEqual;
local v43 = require(l_Packages_0.Dash);
local v44 = require(l_Parent_0.Core.ContextServices.NavigationContext);
return function(v45) --[[ Line: 131 ]]
    -- upvalues: v10 (copy), v13 (copy), l_ToolboxEnableAudioGrantDialog_0 (copy), v17 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (copy), v19 (ref), v6 (copy), v18 (copy), v7 (copy), v22 (copy), v21 (copy), l_ToolboxLogInsertDuration_0 (copy), v14 (copy), v20 (copy), v5 (copy), v39 (copy), v43 (copy), v9 (copy), v25 (copy), l_HttpService_0 (copy), v15 (copy), v24 (copy), v23 (copy), v28 (copy), v27 (copy), l_withContext_0 (copy), v16 (copy), l_ContextServices_0 (copy), v36 (copy), v26 (copy), v37 (copy), v44 (copy), v33 (copy), v29 (copy), v30 (copy), v31 (copy), v32 (copy), v11 (copy)
    local v46 = v10.PureComponent:extend("AssetLogicWrapper");
    v46.defaultProps = {
        Size = UDim2.new(1, 0, 1, 0)
    };
    v46.init = function(v47) --[[ Line: 138 ]] --[[ Name: init ]]
        -- upvalues: v10 (ref), v13 (ref), l_ToolboxEnableAudioGrantDialog_0 (ref), v17 (ref), l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (ref), v19 (ref), v6 (ref), v18 (ref), v7 (ref), v22 (ref), v21 (ref), l_ToolboxLogInsertDuration_0 (ref), v14 (ref), v20 (ref), v5 (ref), v39 (ref), v43 (ref)
        v47.ref = v10.createRef();
        v47.state = {
            hoveredAssetId = 0, 
            isShowingToolMessageBox = false, 
            isShowingScriptWarningMessageBox = false, 
            previewAssetData = v10.None, 
            isShowingGrantPermissionsMessageBox = false, 
            scriptWarningInfo = nil, 
            grantPermissionsInfo = nil
        };
        v47.lastInsertAttemptTime = 0;
        v47.canInsertAsset = function() --[[ Line: 161 ]]
            -- upvalues: v47 (copy), v13 (ref)
            local v48 = false;
            if tick() - v47.lastInsertAttemptTime > v13.TIME_BETWEEN_ASSET_INSERTION then
                v48 = not v47.insertToolPromise:isWaiting();
            end;
            return v48;
        end;
        v47.onMessageBoxClosed = function() --[[ Line: 166 ]]
            -- upvalues: v47 (copy)
            v47:setState({
                isShowingToolMessageBox = false
            });
            v47.insertToolPromise:insertToWorkspace();
        end;
        v47.onMessageBoxButtonClicked = function(_, v50) --[[ Line: 174 ]]
            -- upvalues: v47 (copy)
            v47:setState({
                isShowingToolMessageBox = false
            });
            if v50 == "yes" then
                v47.insertToolPromise:insertToStarterPack();
                return;
            else
                if v50 == "no" then
                    v47.insertToolPromise:insertToWorkspace();
                end;
                return;
            end;
        end;
        v47.onInsertToolPrompt = function() --[[ Line: 186 ]]
            -- upvalues: v47 (copy)
            v47:setState({
                isShowingToolMessageBox = true
            });
        end;
        v47.onScriptWarningBoxConfirmed = function() --[[ Line: 192 ]]
            -- upvalues: v47 (copy)
            v47:setState({
                isShowingScriptWarningMessageBox = false
            });
            v47.insertToolPromise:dismissWarningPrompt();
            v47.state.scriptWarningInfo.insert();
        end;
        v47.onScriptWarningBoxCanceled = function() --[[ Line: 200 ]]
            -- upvalues: v47 (copy)
            v47:setState({
                isShowingScriptWarningMessageBox = false
            });
            v47.state.scriptWarningInfo.cancel();
            v47.insertToolPromise:cancel();
            v47.insertToolPromise:dismissWarningPrompt();
        end;
        v47.onInsertScriptWarningPrompt = function(v51) --[[ Line: 209 ]]
            -- upvalues: v47 (copy)
            if v47.props._tutorialLimits and v47.props._tutorialLimits.scriptWarningOverride then
                return false;
            elseif v47.props._Settings:get("Plugin"):getShowScriptWarning() then
                v47:setState({
                    isShowingScriptWarningMessageBox = true, 
                    scriptWarningInfo = v51
                });
                return true;
            else
                return false;
            end;
        end;
        v47.onScriptWarningBoxToggleShow = function(v52) --[[ Line: 226 ]]
            -- upvalues: v47 (copy)
            v47.props._Settings:get("Plugin"):setShowScriptWarning(v52);
        end;
        v47.onPermissionsGrantClosed = function() --[[ Line: 231 ]]
            -- upvalues: l_ToolboxEnableAudioGrantDialog_0 (ref), v47 (copy)
            if not l_ToolboxEnableAudioGrantDialog_0 then
                return;
            else
                v47:setState({
                    isShowingGrantPermissionsMessageBox = false
                });
                v47.insertToolPromise:returnResult(false);
                return;
            end;
        end;
        v47.onPermissionsGranted = function(_, v54) --[[ Line: 241 ]]
            -- upvalues: l_ToolboxEnableAudioGrantDialog_0 (ref), v47 (copy)
            if not l_ToolboxEnableAudioGrantDialog_0 then
                return;
            else
                v47:setState({
                    isShowingGrantPermissionsMessageBox = false
                });
                local v55 = v54 == "yes";
                v47.insertToolPromise:returnResult(v55);
                return;
            end;
        end;
        v47.onPermissionsGrantCallback = function(v56) --[[ Line: 253 ]]
            -- upvalues: l_ToolboxEnableAudioGrantDialog_0 (ref), v47 (copy)
            if not l_ToolboxEnableAudioGrantDialog_0 then
                return;
            else
                v47:setState({
                    isShowingGrantPermissionsMessageBox = true, 
                    grantPermissionsInfo = v56
                });
                return;
            end;
        end;
        v47.insertToolPromise = v17.new(v47.onInsertToolPrompt, v47.onInsertScriptWarningPrompt, v47.onPermissionsGrantCallback);
        if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then
            v47.getIsIXPVariableEnabled = function(v57, v58) --[[ Line: 270 ]]
                -- upvalues: v47 (copy), v19 (ref)
                local l__IXP_0 = v47.props._IXP;
                return v19(l__IXP_0, v57, v58);
            end;
        end;
        v47.tryInsert = function(v60, v61, v62, v63, v64) --[[ Line: 276 ]]
            -- upvalues: v47 (copy), v6 (ref), v18 (ref), v7 (ref), v22 (ref), v21 (ref), l_ToolboxLogInsertDuration_0 (ref), l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (ref)
            v47.lastInsertAttemptTime = tick();
            local l_Asset_0 = v60.Asset;
            local l_Id_0 = l_Asset_0.Id;
            local l_Name_0 = l_Asset_0.Name;
            local l_TypeId_0 = l_Asset_0.TypeId;
            local l_AssetSubTypes_0 = l_Asset_0.AssetSubTypes;
            local l_props_0 = v47.props;
            local l__categoryName_0 = l_props_0._categoryName;
            local v72 = l_props_0._searchTerm or "";
            local l_assetIndex_0 = l_props_0.assetIndex;
            local l__layoutMode_0 = l_props_0._layoutMode;
            local l__tutorialLimits_0 = l_props_0._tutorialLimits;
            local v76 = v47.props._Plugin:get();
            local l_networkInterface_0 = v47.props._Network.networkInterface;
            local v78 = if v6() then v18.tryInsertWithBatchGrantPermissions else v18.tryInsert;
            local v79 = nil;
            if v7() then
                local v80 = v22.getTabKeyForCategoryName(l__categoryName_0);
                v79 = v21(l_props_0._IXP) and v80 == v22.MARKETPLACE_KEY;
            end;
            local v89, v90 = v78({
                plugin = v76, 
                assetId = l_Id_0, 
                assetName = l_Name_0, 
                assetSubTypes = l_AssetSubTypes_0, 
                assetTypeId = l_TypeId_0, 
                assetVersionId = v64, 
                tutorialLimits = l__tutorialLimits_0, 
                onError = v79 and function(_, _, _) --[[ Line: 323 ]]

                end or nil, 
                onSuccess = function(v84, v85, v86) --[[ Line: 331 ]] --[[ Name: onSuccess ]]
                    -- upvalues: v22 (ref), l_TypeId_0 (copy), v47 (ref), l_networkInterface_0 (copy), v62 (ref), v61 (copy), l_ToolboxLogInsertDuration_0 (ref), v60 (copy), v63 (copy), l__layoutMode_0 (copy)
                    local v87 = v22.EngineAssetTypeIdToToolboxAssetType[l_TypeId_0];
                    if v22.ToolboxMarketplaceAssetTypes[v87] then
                        v47.props._postInsertAssetRequest(l_networkInterface_0, v84);
                    end;
                    v47.props._setMostRecentAssetInsertTime();
                    v62 = v62 or v61 and "DragInsert" or "ClickInsert";
                    local v88 = v47.props._getPageInfoAnalyticsContextInfo();
                    if typeof(v85) ~= "Instance" and typeof(v85) ~= "userdata" and typeof(v85) ~= "table" then
                        v85 = nil;
                    end;
                    if l_ToolboxLogInsertDuration_0 then
                        v47.props._AssetAnalytics:get():logInsert(v60, v62, v85, v88, v63, l__layoutMode_0, v86);
                        return;
                    else
                        v47.props._AssetAnalytics:get():logInsert(v60, v62, v85, v88, v63, l__layoutMode_0);
                        return;
                    end;
                end, 
                currentCategoryName = l__categoryName_0, 
                categoryName = l__categoryName_0, 
                layoutMode = l__layoutMode_0, 
                searchTerm = v72, 
                assetIndex = l_assetIndex_0, 
                getIsIXPVariableEnabled = if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then v47.getIsIXPVariableEnabled else nil
            }, v47.insertToolPromise, v61, l_networkInterface_0);
            return v89, v90;
        end;
        v47.openAssetPreview = function(v91, v92) --[[ Line: 382 ]]
            -- upvalues: v47 (copy)
            v47:setState(function() --[[ Line: 383 ]]
                -- upvalues: v91 (copy)
                return {
                    previewAssetData = v91
                };
            end);
            local l_Id_1 = v91.Asset.Id;
            v47.props._onPreviewToggled(true, l_Id_1, v92);
        end;
        v47.closeAssetPreview = function(_) --[[ Line: 392 ]]
            -- upvalues: v47 (copy), v10 (ref)
            v47:setState(function() --[[ Line: 393 ]]
                -- upvalues: v10 (ref)
                return {
                    previewAssetData = v10.None
                };
            end);
            v47.props._onPreviewToggled(false, v10.None, nil);
        end;
        v47.logAssetImpression = function(v95, v96, v97, v98, v99, v100, v101) --[[ Line: 404 ]]
            -- upvalues: v47 (copy), v14 (ref), v20 (ref)
            local v102 = v47.props._getPageInfoAnalyticsContextInfo();
            local l__layoutMode_1 = v47.props._layoutMode;
            if v97 == nil or v98 == nil or v99 == nil or v100 == nil then
                if v14.shouldDebugWarnings() then
                    local v104 = {};
                    if v97 == nil then
                        table.insert(v104, "instanceAbsoluteSize");
                    end;
                    if v98 == nil then
                        table.insert(v104, "instanceAbsolutePosition");
                    end;
                    if v99 == nil then
                        table.insert(v104, "parentAbsoluteSize");
                    end;
                    if v100 == nil then
                        table.insert(v104, "parentAbsolutePosition");
                    end;
                    warn("Unable to log asset impression. LogAssetImpression was called with nil parameters: ", table.concat(v104, ", "));
                end;
                return false;
            else
                local v105 = true;
                if v97.X ~= 0 then
                    v105 = v97.Y == 0;
                end;
                local v106 = Vector2.new(v98.X + v97.X, v98.Y + v97.Y);
                local v107 = v20(v98, v99, v100) or v20(v106, v99, v100);
                if v95 and v107 and not v96 and not v105 then
                    v47.props._AssetAnalytics:get():logImpression(v95, v102, v101, l__layoutMode_1);
                end;
                return v107 and not v105;
            end;
        end;
        if v5() then
            v47.onSearchByCreator = function(v108, v109) --[[ Line: 472 ]]
                -- upvalues: v47 (copy), v22 (ref), v39 (ref), v43 (ref)
                local l_props_1 = v47.props;
                local l_networkInterface_1 = l_props_1._Network.networkInterface;
                local v112 = l_props_1._Settings:get("Plugin");
                local l__categoryName_1 = l_props_1._categoryName;
                local v114 = v22.getTabForCategoryName(l__categoryName_1) == v22.INVENTORY;
                local v115 = nil;
                if v114 then
                    local v116 = if v108 then {
                        [tostring(v108.Id)] = {
                            Name = v108.Name, 
                            Id = v108.Id, 
                            Type = if v108.Type == v39.OWNER_TYPES.Group then Enum.CreatorType.Group else Enum.CreatorType.User
                        }
                    } else nil;
                    v115 = v43.join({
                        creatorTargetIds = if v108.Type == v39.OWNER_TYPES.User then v116 else nil, 
                        groupTargetIds = if v108.Type == v39.OWNER_TYPES.Group then v116 else nil
                    }, v109);
                else
                    v115 = v43.join({
                        Creator = v108.Name
                    }, v109);
                end;
                l_props_1._searchWithOptions(l_networkInterface_1, v112, v115);
            end;
        end;
    end;
    v46.willUnmount = function(v117) --[[ Line: 509 ]] --[[ Name: willUnmount ]]
        v117.insertToolPromise:destroy();
    end;
    v46.didUpdate = function(v118, _, _) --[[ Line: 513 ]] --[[ Name: didUpdate ]]
        -- upvalues: v10 (ref)
        local l__previewAssetData_0 = v118.props._previewAssetData;
        local l_previewAssetData_0 = v118.state.previewAssetData;
        if l_previewAssetData_0 and l_previewAssetData_0 ~= v10.None and l_previewAssetData_0.Asset and l__previewAssetData_0 and l__previewAssetData_0.Asset and l_previewAssetData_0.Asset.Id == l__previewAssetData_0.Asset.Id and l_previewAssetData_0 ~= l__previewAssetData_0 then
            v118:setState({
                previewAssetData = l__previewAssetData_0
            });
        end;
    end;
    v46.render = function(v123) --[[ Line: 532 ]] --[[ Name: render ]]
        -- upvalues: v9 (ref), v5 (ref), v10 (ref), v43 (ref), v7 (ref), v22 (ref), v21 (ref), v25 (ref), l_HttpService_0 (ref), v15 (ref), v24 (ref), v23 (ref), v28 (ref), v27 (ref), v45 (copy)
        local l_props_2 = v123.props;
        local l_state_0 = v123.state;
        local l__isPreviewing_0 = l_props_2._isPreviewing;
        local l_TryOpenAssetConfig_0 = l_props_2.TryOpenAssetConfig;
        local l_isShowingToolMessageBox_0 = l_state_0.isShowingToolMessageBox;
        local l_isShowingScriptWarningMessageBox_0 = l_state_0.isShowingScriptWarningMessageBox;
        local l_isShowingGrantPermissionsMessageBox_0 = l_state_0.isShowingGrantPermissionsMessageBox;
        local l_scriptWarningInfo_0 = l_state_0.scriptWarningInfo;
        local l_grantPermissionsInfo_0 = l_state_0.grantPermissionsInfo;
        local v133 = l_state_0.previewAssetData or l_props_2._previewAssetData;
        local l__Localization_0 = v123.props._Localization;
        local v135 = v9.Dictionary.join(l_props_2, {
            CanInsertAsset = v123.canInsertAsset, 
            ClearHoveredAsset = v123.clearHoveredAsset, 
            LogAssetImpression = v123.logAssetImpression, 
            TryInsert = v123.tryInsert, 
            TryOpenAssetConfig = l_TryOpenAssetConfig_0, 
            OnAssetPreviewButtonClicked = v123.openAssetPreview, 
            OnSearchByCreator = if v5() then v123.onSearchByCreator else nil
        });
        local v136 = l__isPreviewing_0 and v133 ~= v10.None;
        v135 = v43.omit(v135, {
            "_categoryName", 
            "_isPreviewing", 
            "_previewAssetId", 
            "_previewAssetData", 
            "_searchTerm", 
            "_searchTerm", 
            "_onPreviewToggled", 
            "_postInsertAssetRequest", 
            "_searchWithOptions", 
            "_setMostRecentAssetInsertTime", 
            "_AssetAnalytics", 
            "_Localization", 
            "_Plugin", 
            "_Settings", 
            "_Network"
        });
        local v137 = nil;
        if v7() then
            local v138 = v22.getTabKeyForCategoryName(l_props_2._categoryName);
            v137 = v21(l_props_2._IXP) and v138 == v22.MARKETPLACE_KEY;
        end;
        return v10.createFragment({
            ToolScriptWarningMessageBox = l_isShowingScriptWarningMessageBox_0 and v10.createElement(v25, {
                Name = string.format("ToolboxToolScriptWarningMessageBox-%s", l_HttpService_0:GenerateGUID()), 
                Info = l_scriptWarningInfo_0, 
                Icon = v15.INFO_ICON, 
                onClose = v123.onScriptWarningBoxCanceled, 
                onCancel = v123.onScriptWarningBoxCanceled, 
                onOkButtonClicked = v123.onScriptWarningBoxConfirmed, 
                onChangeShowDialog = v123.onScriptWarningBoxToggleShow
            }), 
            GrantPermissionsMessageBox = l_isShowingGrantPermissionsMessageBox_0 and v10.createElement(v24, {
                Name = string.format("ToolboxPermissionsMessageBox-%s", l_HttpService_0:GenerateGUID()), 
                Title = l__Localization_0:getText("General", "RobloxStudio"), 
                Text = l__Localization_0:getText("GrantAssetPermission", "DialogText"), 
                InformativeText = l__Localization_0:getText("GrantAssetPermission", "Information", {
                    assetName = l_grantPermissionsInfo_0.assetName, 
                    assetId = l_grantPermissionsInfo_0.assetId, 
                    assetType = l_grantPermissionsInfo_0.assetType
                }), 
                Icon = v15.WARNING_ICON, 
                IconColor = Color3.fromHex("#FFAA21"), 
                onClose = v123.onPermissionsGrantClosed, 
                onButtonClicked = v123.onPermissionsGranted, 
                buttons = {
                    {
                        Text = l__Localization_0:getText("GrantAssetPermission", "CancelButton"), 
                        action = "no"
                    }, 
                    {
                        Text = l__Localization_0:getText("GrantAssetPermission", "GrantButton"), 
                        action = "yes"
                    }
                }
            }), 
            ToolMessageBox = l_isShowingToolMessageBox_0 and v10.createElement(v24, {
                Name = string.format("ToolboxToolMessageBox-%s", l_HttpService_0:GenerateGUID()), 
                Title = l__Localization_0:getText("InsertTool", "DialogTitle"), 
                Text = l__Localization_0:getText("InsertTool", "DialogText"), 
                Icon = v15.INFO_ICON, 
                onClose = v123.onMessageBoxClosed, 
                onButtonClicked = v123.onMessageBoxButtonClicked, 
                buttons = {
                    {
                        Text = l__Localization_0:getText("Common", "Yes"), 
                        action = "yes"
                    }, 
                    {
                        Text = l__Localization_0:getText("Common", "No"), 
                        action = "no"
                    }
                }
            }), 
            AssetPreview = if v137 then nil else v136 and v10.createElement(v23, {
                assetData = v133, 
                canInsertAsset = v123.canInsertAsset, 
                logAssetImpression = v123.logAssetImpression, 
                onAssetPreviewButtonClicked = v123.openAssetPreview, 
                onClose = v123.closeAssetPreview, 
                onSearchByCreator = if v5() then v123.onSearchByCreator else nil, 
                tryInsert = v123.tryInsert, 
                tryOpenAssetConfig = l_TryOpenAssetConfig_0
            }), 
            SubsequentDialogController = v10.createElement(v28), 
            PurchaseFlowWrapper = if v137 then nil else v10.createElement(v27, {
                AssetData = v133, 
                TryInsert = v123.tryInsert
            }), 
            Contents = v10.createElement(v45, v135)
        });
    end;
    v46 = l_withContext_0({
        _AssetAnalytics = v16, 
        _Localization = l_ContextServices_0.Localization, 
        _Plugin = l_ContextServices_0.Plugin, 
        _Settings = v36, 
        _IXP = if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then v26 else nil, 
        _Network = v37, 
        _NavigationContext = v44
    })(v46);
    local function v146(v139, _) --[[ Line: 690 ]] --[[ Name: mapStateToProps ]]
        -- upvalues: v22 (ref)
        v139 = v139 or {};
        local v141 = v139.assets or {};
        local v142 = v139.pageInfo or {};
        local v143 = v142.categoryName or v22.DEFAULT.name;
        local l_tutorialLimits_0 = v139.tutorialLimits;
        local v145 = (v141.idToAssetMap or {})[v141.previewAssetId];
        return {
            _categoryName = v143, 
            _isPreviewing = v141.isPreviewing or false, 
            _layoutMode = v142.layoutMode, 
            _previewAssetData = v145, 
            _searchTerm = v142.searchTerm or "", 
            _tutorialLimits = l_tutorialLimits_0
        };
    end;
    local function v156(v147) --[[ Line: 712 ]] --[[ Name: mapDispatchToProps ]]
        -- upvalues: v33 (ref), v29 (ref), v30 (ref), v31 (ref), v32 (ref)
        return {
            _onPreviewToggled = function(v148, v149, v150) --[[ Line: 714 ]] --[[ Name: _onPreviewToggled ]]
                -- upvalues: v147 (copy), v33 (ref)
                v147(v33(v148, v149, v150));
            end, 
            _postInsertAssetRequest = function(v151, v152) --[[ Line: 717 ]] --[[ Name: _postInsertAssetRequest ]]
                -- upvalues: v147 (copy), v29 (ref)
                v147(v29(v151, v152));
            end, 
            _setMostRecentAssetInsertTime = function() --[[ Line: 720 ]] --[[ Name: _setMostRecentAssetInsertTime ]]
                -- upvalues: v147 (copy), v30 (ref)
                v147(v30());
            end, 
            _getPageInfoAnalyticsContextInfo = function() --[[ Line: 723 ]] --[[ Name: _getPageInfoAnalyticsContextInfo ]]
                -- upvalues: v147 (copy), v31 (ref)
                return v147(v31());
            end, 
            _searchWithOptions = function(v153, v154, v155) --[[ Line: 726 ]] --[[ Name: _searchWithOptions ]]
                -- upvalues: v147 (copy), v32 (ref)
                v147(v32(v153, v154, v155));
            end
        };
    end;
    return v11.connect(v146, v156)(v46);
end;