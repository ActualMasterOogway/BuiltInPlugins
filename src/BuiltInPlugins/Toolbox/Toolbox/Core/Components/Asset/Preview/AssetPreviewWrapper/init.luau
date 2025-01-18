local l_StudioService_0 = game:GetService("StudioService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v4 = require(l_Packages_0.Roact);
local v5 = require(l_Packages_0.RoactRodux);
local v6 = require(l_Packages_0.Cryo);
local l_Util_0 = l_Parent_0.Core.Util;
local v8 = require(l_Util_0.Constants);
local _ = require(l_Util_0.InsertAsset);
local v10 = require(l_Util_0.Analytics.Analytics);
local v11 = require(l_Util_0.Analytics.AssetAnalyticsContextItem);
local _ = require(l_Parent_0.Core.Models.AssetInfo);
local v13 = require(l_Util_0.DebugFlags);
local v14 = require(l_Util_0.getUserId);
local l_AssetPreview_0 = require(l_Packages_0.Framework).UI.AssetPreview;
local v16 = require(l_Packages_0.Dash);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v19 = require(l_Parent_0.Core.ContextServices.Settings);
local v20 = require(l_Parent_0.Core.ContextServices.IXPContext);
local v21 = require(l_Parent_0.Core.ContextServices.NavigationContext);
local v22 = require(l_Parent_0.Core.ContextServices.ModalContext);
local v23 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v24 = require(l_Parent_0.Core.Actions.ClearPreview);
local _ = require(l_Parent_0.Core.Actions.EnqueueSubsequentDialog);
local v26 = require(l_Parent_0.Core.Actions.PausePreviewSound);
local v27 = require(l_Parent_0.Core.Actions.SetAssetPreview);
local v28 = require(l_Parent_0.Core.Actions.SetPurchaseDialogVisibility);
local v29 = require(l_Parent_0.Core.Actions.SetPurchaseStatus);
local v30 = require(l_Parent_0.Core.Components.Asset.Preview.SuggestionsWrapper);
local _ = require(l_Parent_0.Core.Components.PurchaseFlow.PluginPurchaseFlow);
local _ = require(l_Parent_0.Core.Components.PurchaseFlow.PurchaseSuccessDialog);
local v33 = require(l_Parent_0.Core.Components.Asset.Preview.AssetPreviewFooter);
local l_Requests_0 = l_Parent_0.Core.Networking.Requests;
local v35 = require(l_Requests_0.GetPreviewInstanceRequest);
local v36 = require(l_Requests_0.GetCodeSummaryRequest);
local v37 = require(l_Requests_0.GetPluginInfoRequest);
local v38 = require(l_Requests_0.SearchWithOptions);
local v39 = require(l_Requests_0.PostUnvoteRequest);
local v40 = require(l_Requests_0.PostVoteRequest);
local v41 = require(l_Parent_0.Core.Networking.Requests.GetOwnsAssetRequest);
local v42 = require(l_Parent_0.Core.Actions.ClearPurchaseFlow);
local v43 = require(l_Requests_0.GetFavoriteCountsRequest);
local v44 = require(l_Requests_0.GetFavoritedRequest);
local v45 = require(l_Requests_0.ToggleFavoriteStatusRequest);
local v46 = require(l_Parent_0.Core.Thunks.TryCreateContextMenu);
local v47 = require(l_Parent_0.Core.Thunks.GetPageInfoAnalyticsContextInfo);
local v48 = require(l_Requests_0.GetAssetContentAttributionInfoRequest);
local v49 = require(l_Requests_0.GetBuyerStatusRequest);
local v50 = require(l_Parent_0.Core.Components.ResultsFetcher);
local v51 = require(l_Parent_0.Core.Types.AssetSubTypes);
local v52 = require(l_Parent_0.Core.Types.BuyerStatus);
local v53 = require(l_Parent_0.Core.Types.Category);
local v54 = require(l_Parent_0.Core.Types.PurchaseStatus);
local v55 = v4.PureComponent:extend("AssetPreviewWrapper");
local l_ToolboxAssetPreviewProtectAgainstNilAssetData_0 = game:GetFastFlag("ToolboxAssetPreviewProtectAgainstNilAssetData");
local v57 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryCreatorFilter);
local l_disableRatings_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).disableRatings;
local v59 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxCodeUnderstandingSummary);
local v60 = require(l_Util_0.SharedFlags.getIsIXPEnabledForCodeUnderstanding);
local v61 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddBuyerStatus);
local v62 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxRemoveRobuxProductEntirely);
local v63 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxOnlyPreviewOpenUseModels);
local v64 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixSharedAssetInsert);
local v65 = require(l_Util_0.FiatUtil);
local v66 = require(l_Util_0.getReportUrl);
local v67 = Color3.fromRGB(0, 0, 0);
v55.createPurchaseFlow = function(v68) --[[ Line: 107 ]] --[[ Name: createPurchaseFlow ]]
    -- upvalues: v53 (copy), v65 (copy), v62 (copy), v13 (copy), l_StudioService_0 (copy), v54 (copy), v64 (copy)
    local l_props_0 = v68.props;
    local l_assetData_0 = l_props_0.assetData;
    local l_Asset_0 = l_assetData_0.Asset;
    local l_Id_0 = l_Asset_0.Id;
    local l_Owned_0 = l_props_0.Owned;
    local v74 = l_assetData_0.Asset.TypeId or Enum.AssetType.Model.Value;
    local v75 = v74 == Enum.AssetType.Plugin.Value;
    local v76 = nil;
    local v77 = nil;
    local v78 = nil;
    local v79 = v53.shouldShowPrices(l_props_0.categoryName);
    if v79 then
        local l_FiatProduct_0 = l_assetData_0.FiatProduct;
        if l_FiatProduct_0 and l_FiatProduct_0.PurchasePrice then
            v78 = false;
            v76 = v65.isFree(l_FiatProduct_0.Price);
            if v76 then
                v77 = if v75 then l_props_0.Localization:getText("Common", "Install") else l_props_0.Localization:getText("Purchase", "Free");
            else
                local v81 = v65.displayStringFromMoney(l_FiatProduct_0.PurchasePrice, l_props_0.Localization);
                v77 = l_props_0.Localization:getText("Purchase", "BuyForPrice", {
                    price = v81
                });
            end;
        elseif v62() then
            if v13.shouldDebugWarnings() then
                warn(("Expected fiatProduct for categoryName %s, but found none for assetId %s"):format(l_props_0.categoryName, l_Asset_0.Id));
            end;
        else
            v78 = true;
            local v82 = l_assetData_0.Product and l_assetData_0.Product.Price or 0;
            v76 = v82 == 0;
            v77 = if v76 then if v75 then l_props_0.Localization:getText("Common", "Install") else l_props_0.Localization:getText("Purchase", "Free") else v82;
        end;
    end;
    local v83 = nil;
    local l_previewPluginData_0 = v68.props.previewPluginData;
    if l_previewPluginData_0 then
        v83 = l_previewPluginData_0.versionId;
    end;
    local v85 = nil;
    local v86 = nil;
    local v87 = nil;
    v85 = v75 and l_StudioService_0:IsPluginInstalled(l_Id_0);
    local v88 = v74 == Enum.AssetType.FontFamily.Value;
    local v89 = v75 or v88;
    v86 = v75 and v83 == nil and l_Owned_0 == nil;
    v87 = v75 and not v86 and v83 and l_StudioService_0:IsPluginUpToDate(l_Id_0, v83);
    local l_PurchaseStatus_0 = l_props_0.PurchaseStatus;
    if (l_PurchaseStatus_0 == v54.Success or l_PurchaseStatus_0 == v54.Waiting) and not v85 then
        v86 = true;
    end;
    local v91 = v89 and v68.state.showInstallationBar;
    v86 = v86 or v91;
    local v92 = true;
    if v74 ~= Enum.AssetType.Model.Value then
        v92 = v75 or v68.state.overrideEnableVoting;
    end;
    local v93 = v75 and not v85;
    local v94 = (v75 and (v86 or v87) or v75 and v83 == nil or v88 and l_Owned_0 or v89 and l_Owned_0 == nil) and l_PurchaseStatus_0 ~= v54.Failed;
    local v95 = if not not v79 or v89 then v68.tryInstall else v68.tryInsert;
    local v96 = nil;
    local v97 = l_props_0.Localization:getText("Common", "Insert");
    if v75 then
        if v83 == nil then
            v97 = l_props_0.Localization:getText("Common", "Loading");
        elseif v86 then
            v97 = if not not v76 or l_Owned_0 then l_props_0.Localization:getText("General", "Installing") else l_props_0.Localization:getText("Purchase", "PendingPurchase");
        elseif not v85 then
            if not l_Owned_0 then
                v97 = if v64() then if v77 then v77 else l_props_0.Localization:getText("Common", "Install") else v77 or v97;
                v96 = v78;
            else
                v97 = l_props_0.Localization:getText("Common", "Install");
            end;
        else
            v97 = if not v87 then l_props_0.Localization:getText("Common", "Update") else l_props_0.Localization:getText("Common", "Installed");
        end;
    elseif v79 and not l_Owned_0 then
        v97 = v77 or v97;
    elseif v86 then
        v97 = if v76 then l_props_0.Localization:getText("General", "Installing") else l_props_0.Localization:getText("Purchase", "PendingPurchase");
    end;
    if v88 then
        v97 = if l_Owned_0 then l_props_0.Localization:getText("Common", "Installed") else if v79 then v77 or v97 else l_props_0.Localization:getText("Common", "Install");
    end;
    return {
        InstallDisabled = v94, 
        ActionBarText = v97, 
        ShowInstallationBar = v91, 
        ShowRobuxIcon = v96, 
        HasRating = v92, 
        IsUninstalledPlugin = v93, 
        TryInsert = v95
    };
end;
v55.init = function(v98, v99) --[[ Line: 282 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v10 (copy), v61 (copy), v54 (copy), v57 (copy), v16 (copy), v53 (copy), l_StudioService_0 (copy), v14 (copy), l_ToolboxAssetPreviewProtectAgainstNilAssetData_0 (copy), v66 (copy), l_GuiService_0 (copy), v33 (copy), v6 (copy), v50 (copy), v30 (copy), v59 (copy), v63 (copy), v60 (copy), v8 (copy)
    v98.assetPreviewScrollingRef = v4.createRef();
    v98.state = {
        maxPreviewWidth = 0, 
        maxPreviewHeight = 0, 
        showInstallationBar = false, 
        openAssetPreviewStartTime = nil
    };
    v98.ClickDetectorRef = v4.createRef();
    v98.openAssetPreview = function() --[[ Line: 294 ]]
        -- upvalues: v98 (copy), v10 (ref), v61 (ref)
        local l_assetData_1 = v98.props.assetData;
        v98.props.Modal.onAssetPreviewToggled(true);
        v98:setState({
            previewAssetData = l_assetData_1, 
            openAssetPreviewStartTime = tick()
        });
        if v98.props.isPlaying then
            v98.props.pauseASound();
        end;
        v10.onAssetPreviewSelected(l_assetData_1.Asset.Id);
        local v101 = v98.props.getPageInfoAnalyticsContextInfo();
        if v61() then
            v98.props.getBuyerStatus(v98.props.Network.networkInterface):andThen(function(v102) --[[ Line: 314 ]]
                -- upvalues: v98 (ref), l_assetData_1 (copy), v101 (copy)
                v98.props.AssetAnalytics:get():logPreview(l_assetData_1, v101, v102);
            end);
            return;
        else
            v98.props.AssetAnalytics:get():logPreview(l_assetData_1, v101);
            return;
        end;
    end;
    v98.closeAssetPreview = function(v103) --[[ Line: 322 ]]
        -- upvalues: v98 (copy), v10 (ref), v54 (ref), v4 (ref)
        v98.props.Modal.onAssetPreviewToggled(false);
        v98.props.onPreviewToggled(false);
        local v104 = (tick() - (v98.state.openAssetPreviewStartTime or 0)) * 1000;
        v10.onAssetPreviewEnded(v103.Asset.Id, v104);
        v98.props.setPurchaseStatus(v54.None);
        v98:setState({
            previewAssetData = v4.None, 
            openAssetPreviewStartTime = v4.None
        });
    end;
    v98.onCloseButtonClicked = function() --[[ Line: 340 ]]
        -- upvalues: v98 (copy)
        local l_assetData_2 = v98.props.assetData;
        v98.closeAssetPreview(l_assetData_2);
        v98.props.clearPreview();
    end;
    v98.onDetectorABSSizeChange = function() --[[ Line: 346 ]]
        -- upvalues: v98 (copy)
        local l_current_0 = v98.ClickDetectorRef.current;
        if not l_current_0 then
            return;
        else
            local l_AbsoluteSize_0 = l_current_0.AbsoluteSize;
            local l_x_0 = l_AbsoluteSize_0.x;
            local l_y_0 = l_AbsoluteSize_0.y;
            v98:setState({
                maxPreviewWidth = l_x_0 - 64, 
                maxPreviewHeight = l_y_0 - 64
            });
            return;
        end;
    end;
    v98.tryCreateContextMenu = function(v110) --[[ Line: 362 ]]
        -- upvalues: v98 (copy)
        local l_props_1 = v98.props;
        local l_assetData_3 = l_props_1.assetData;
        local v113 = l_props_1.Plugin:get();
        local l_tryOpenAssetConfig_0 = l_props_1.tryOpenAssetConfig;
        local v115 = v98.props.getPageInfoAnalyticsContextInfo();
        v98.props.tryCreateContextMenu(l_assetData_3, v110, v113, l_tryOpenAssetConfig_0, v115);
    end;
    v98.tryInsert = function() --[[ Line: 374 ]]
        -- upvalues: v98 (copy)
        local l_assetData_4 = v98.props.assetData;
        local l_previewSwimlaneName_0 = v98.props.previewSwimlaneName;
        local v118 = v98.props.previewPluginData and v98.props.previewPluginData.versionId;
        return v98.props.tryInsert(l_assetData_4, false, "PreviewClickInsertButton", l_previewSwimlaneName_0, v118);
    end;
    v98.takePlugin = function(_) --[[ Line: 388 ]]
        -- upvalues: v98 (copy)
        v98.props.Network.networkInterface:postTakePlugin();
    end;
    if v57() then
        v98.searchByCreator = function(v120, v121) --[[ Line: 394 ]]
            -- upvalues: v98 (copy)
            local l_props_2 = v98.props;
            if l_props_2.onSearchByCreator then
                l_props_2.onSearchByCreator(v120, v121);
            end;
            local l_assetData_5 = l_props_2.assetData;
            v98.closeAssetPreview(l_assetData_5);
        end;
    else
        v98.searchByCreator = function(v124, v125) --[[ Line: 405 ]]
            -- upvalues: v98 (copy), v16 (ref)
            local l_networkInterface_0 = v98.props.Network.networkInterface;
            local v127 = v98.props.Settings:get("Plugin");
            local v128 = v16.join({
                Creator = v124
            }, v125);
            v98.props.searchWithOptions(l_networkInterface_0, v127, v128);
            local l_assetData_6 = v98.props.assetData;
            v98.closeAssetPreview(l_assetData_6);
        end;
    end;
    local l_onVoteRequested_0 = v98.props.onVoteRequested;
    local l_onUnvoteRequested_0 = v98.props.onUnvoteRequested;
    v98.onVoteUpButtonActivated = function(v132, v133) --[[ Line: 421 ]]
        -- upvalues: v98 (copy), l_onUnvoteRequested_0 (copy), l_onVoteRequested_0 (copy)
        local l_networkInterface_1 = v98.props.Network.networkInterface;
        if v133.HasVoted and v133.UserVote then
            l_onUnvoteRequested_0(l_networkInterface_1, v132);
            return;
        else
            l_onVoteRequested_0(l_networkInterface_1, v132, true);
            return;
        end;
    end;
    v98.onVoteDownButtonActivated = function(v135, v136) --[[ Line: 431 ]]
        -- upvalues: v98 (copy), l_onUnvoteRequested_0 (copy), l_onVoteRequested_0 (copy)
        local l_networkInterface_2 = v98.props.Network.networkInterface;
        if v136.HasVoted and not v136.UserVote then
            l_onUnvoteRequested_0(l_networkInterface_2, v135);
            return;
        else
            l_onVoteRequested_0(l_networkInterface_2, v135, false);
            return;
        end;
    end;
    v98.tryInstall = function() --[[ Line: 441 ]]
        -- upvalues: v98 (copy), v53 (ref), l_StudioService_0 (ref)
        local l_assetData_7 = v98.props.assetData;
        local l_Asset_1 = l_assetData_7.Asset;
        local _ = l_Asset_1.Id;
        local _ = l_Asset_1.Name;
        local l_TypeId_0 = l_Asset_1.TypeId;
        local l_Owned_1 = v98.props.Owned;
        local v144 = nil;
        local v145 = l_TypeId_0 == Enum.AssetType.Plugin.Value;
        local v146 = l_TypeId_0 == Enum.AssetType.FontFamily.Value;
        v144 = v145 or v146;
        if v144 then
            v98:setState({
                showInstallationBar = true
            });
        end;
        local _ = v98.props.Network.networkInterface;
        local l_previewPluginData_1 = v98.props.previewPluginData;
        local _ = if l_previewPluginData_1 then l_previewPluginData_1.versionId else nil;
        local l_categoryName_0 = v98.props.categoryName;
        local _ = v98.props.layoutMode;
        local v152 = nil;
        local v153 = nil;
        v153 = v98.props.previewSwimlaneName;
        local v154 = v53.shouldShowPrices(l_categoryName_0);
        local v155 = v53.getTabForCategoryName(l_categoryName_0);
        v152 = not l_Owned_1 and (v154 or v144) and v155 ~= v53.CREATIONS and v155 ~= v53.INVENTORY;
        local l_FiatProduct_1 = l_assetData_7.FiatProduct;
        if l_FiatProduct_1 then
            v152 = v152 and l_FiatProduct_1.Purchasable;
        end;
        if v152 then
            v98.props.setPurchaseDialogVisibility(true);
            v98:setState({
                showInstallationBar = false
            });
            return false;
        else
            v98.props.setPurchaseDialogVisibility(false);
            local _ = v98.props.getPageInfoAnalyticsContextInfo();
            local v158 = v98.tryInsert();
            if v158 then
                v98:setState({
                    overrideEnableVoting = true
                });
                if l_TypeId_0 == Enum.AssetType.Plugin.Value then
                    l_StudioService_0:UpdatePluginManagement();
                end;
            end;
            v98:setState({
                showInstallationBar = false
            });
            return v158;
        end;
    end;
    v98.tryInstallWithProgress = function() --[[ Line: 517 ]]
        -- upvalues: v98 (copy)
        return v98.showInstallationBarUntilCompleted(v98.tryInstall);
    end;
    v98.toggleShowInstallationBar = function(v159) --[[ Line: 521 ]]
        -- upvalues: v98 (copy)
        v98:setState({
            showInstallationBar = v159
        });
    end;
    v98.showInstallationBarUntilCompleted = function(v160) --[[ Line: 527 ]]
        -- upvalues: v98 (copy)
        local v161 = tick();
        v98.toggleShowInstallationBar(true);
        local v162 = v160();
        local v163 = tick() - v161;
        if v163 < 1 then
            wait(1 - v163);
        end;
        v98.toggleShowInstallationBar(false);
        return v162;
    end;
    v98.requestFavoriteCounts = function() --[[ Line: 544 ]]
        -- upvalues: v98 (copy)
        local l_networkInterface_4 = v98.props.Network.networkInterface;
        local l_assetId_0 = v98.props.assetId;
        v98.props.getFavoriteCounts(l_networkInterface_4, l_assetId_0);
    end;
    v98.checkFavorited = function() --[[ Line: 550 ]]
        -- upvalues: v98 (copy), v14 (ref)
        local l_networkInterface_5 = v98.props.Network.networkInterface;
        local l_assetId_1 = v98.props.assetId;
        v98.props.getFavorited(l_networkInterface_5, v14(), l_assetId_1);
    end;
    v98.onFavoritedActivated = function(_) --[[ Line: 556 ]]
        -- upvalues: v98 (copy), v14 (ref)
        local l_networkInterface_6 = v98.props.Network.networkInterface;
        local l_assetId_2 = v98.props.assetId;
        local l_favorited_0 = v98.props.favorited;
        v98.props.toggleFavoriteStatus(l_networkInterface_6, v14(), l_assetId_2, l_favorited_0);
    end;
    v98.requestAssetContentAttributionInfo = function() --[[ Line: 563 ]]
        -- upvalues: v98 (copy)
        local l_networkInterface_7 = v98.props.Network.networkInterface;
        local l_assetData_8 = v98.props.assetData;
        local v174 = if l_assetData_8 and l_assetData_8.Asset then l_assetData_8.Asset.CreatingUniverseId else nil;
        v98.props.getAssetContentAttributionInfo(l_networkInterface_7, v174);
    end;
    if l_ToolboxAssetPreviewProtectAgainstNilAssetData_0 then
        if v98.props.assetData then
            v98.props.clearPurchaseFlow(v99.assetData.Asset.Id);
        end;
    else
        v98.props.clearPurchaseFlow(v99.assetData.Asset.Id);
    end;
    v98.onClickReport = function() --[[ Line: 579 ]]
        -- upvalues: v98 (copy), v66 (ref), v10 (ref), l_GuiService_0 (ref)
        local l_assetData_9 = v98.props.assetData;
        local l_assetId_3 = v98.props.assetId;
        local l_TypeId_1 = l_assetData_9.Asset.TypeId;
        local v178 = v66(l_assetId_3, l_TypeId_1);
        v10.reportAssetClicked(l_assetId_3, l_TypeId_1);
        l_GuiService_0:OpenBrowserWindow(v178);
    end;
    v98.renderFooter = function(v179) --[[ Line: 589 ]]
        -- upvalues: v4 (ref), v33 (ref), v6 (ref), v98 (copy)
        return v4.createElement(v33, v6.Dictionary.join(v179, {
            AssetData = v98.props.assetData
        }));
    end;
    v98.renderAndGetSuggestions = function(v180) --[[ Line: 598 ]]
        -- upvalues: v98 (copy), v53 (ref), v50 (ref), v4 (ref), v30 (ref), v57 (ref)
        local l_props_3 = v98.props;
        local l_networkInterface_8 = l_props_3.Network.networkInterface;
        local l_Creator_0 = l_props_3.assetData.Creator;
        local l_IsVerifiedCreator_0 = l_props_3.assetData.Creator.IsVerifiedCreator;
        local v185 = v53.ASSET_PREVIEW_SUGGESTIONS_ENABLED_FOR_ASSET_TYPE[l_props_3.categoryName];
        if not l_IsVerifiedCreator_0 or not v185 then
            return;
        else
            local function v188(v186, v187) --[[ Line: 609 ]]
                -- upvalues: v180 (copy), l_props_3 (copy), v98 (ref)
                if v180 then
                    v180();
                end;
                l_props_3.clearPurchaseFlow(l_props_3.assetData.Asset.Id);
                l_props_3.onAssetPreviewButtonClicked(v186, v187);
                v98.initialize(v186);
            end;
            local l_current_1 = v98.assetPreviewScrollingRef.current;
            return v50.Generator({
                categoryName = l_props_3.categoryName, 
                initialPageSize = 30, 
                networkInterface = l_networkInterface_8, 
                queryParams = {
                    creatorTargetId = l_Creator_0.Id
                }, 
                render = function(v190) --[[ Line: 628 ]] --[[ Name: render ]]
                    -- upvalues: v4 (ref), v30 (ref), l_props_3 (copy), l_Creator_0 (copy), v188 (copy), v98 (ref), v57 (ref), l_current_1 (copy)
                    return v4.createElement(v30, {
                        Assets = v190.assets, 
                        CategoryName = l_props_3.categoryName, 
                        CanInsertAsset = l_props_3.canInsertAsset, 
                        CreatorName = l_Creator_0.Name, 
                        IsLoading = v190.loading, 
                        LogAssetImpression = l_props_3.logAssetImpression, 
                        OnAssetPreviewButtonClicked = v188, 
                        OnClickSeeAll = function() --[[ Line: 637 ]] --[[ Name: OnClickSeeAll ]]
                            -- upvalues: v98 (ref), v57 (ref), l_Creator_0 (ref)
                            v98.searchByCreator(if v57() then l_Creator_0 else l_Creator_0.Name, {
                                includeUnverifiedCreators = false, 
                                searchTerm = ""
                            });
                        end, 
                        OriginalAssetId = l_props_3.assetData.Asset.Id, 
                        ParentAbsoluteSize = if l_current_1 then l_current_1.AbsoluteSize else nil, 
                        ParentAbsolutePosition = if l_current_1 then l_current_1.AbsolutePosition else nil, 
                        TryOpenAssetConfig = l_props_3.tryOpenAssetConfig
                    });
                end
            });
        end;
    end;
    if v59() then
        v98.getCodeUnderstandingSummary = function(v191) --[[ Line: 660 ]]
            -- upvalues: v98 (copy)
            local l_props_4 = v98.props;
            if l_props_4.assetData.Asset.HasScripts then
                local l_networkInterface_9 = l_props_4.Network.networkInterface;
                return l_props_4.getCodeUnderstandingSummary(l_networkInterface_9, v191);
            else
                return;
            end;
        end;
    end;
    v98.initialize = function(v194) --[[ Line: 670 ]]
        -- upvalues: v98 (copy), v63 (ref), v60 (ref)
        v98.openAssetPreview(v194);
        if v194.Asset then
            if v194.Asset.TypeId == Enum.AssetType.Plugin.Value then
                v98.props.getPluginInfo(v98.props.Network.networkInterface, v194.Asset.Id);
            elseif v194.Asset.TypeId ~= Enum.AssetType.FontFamily.Value and (not v63() or v194.Asset.TypeId ~= Enum.AssetType.Model.Value or v194.Asset.IsOpenUse) then
                v98.props.getPreviewInstance(v194.Asset.Id, v194.Asset.TypeId);
            end;
            v98.props.getOwnsAsset(v98.props.Network.networkInterface, v194.Asset.Id);
            if v60(v98.props.IXP) then
                v98.getCodeUnderstandingSummary(v194.Asset.Id);
            end;
        end;
        v98.requestFavoriteCounts();
        v98.checkFavorited();
        v98.requestAssetContentAttributionInfo();
    end;
    if v99.assetData.Asset.AssetMediaIds then
        v98.carouselImageIds = v6.List.join({
            v99.assetData.Asset.Id
        }, v99.assetData.Asset.AssetMediaIds);
        v98.assetMediaLogged = {};
        v98.LogAssetMediaImpression = function(v195, v196) --[[ Line: 704 ]]
            -- upvalues: v8 (ref), v98 (copy)
            local v197 = if v196 then v8.ASSET_MEDIA_IMPRESSION_SOURCE.IMAGE_PREVIEW_PASSIVE else v8.ASSET_MEDIA_IMPRESSION_SOURCE.IMAGE_PREVIEW_ACTIVE;
            if v197 ~= v8.ASSET_MEDIA_IMPRESSION_SOURCE.IMAGE_PREVIEW_ACTIVE then
                if v98.assetMediaLogged[v195] then
                    return;
                else
                    v98.assetMediaLogged[v195] = true;
                end;
            end;
            v98.props.AssetAnalytics:get():logAssetMediaImpression(v98.props.assetData, v98.carouselImageIds[v195], v195, v98.props.searchId, v197, nil);
        end;
        v98.OnImageCarouselChange = function(v198, v199) --[[ Line: 724 ]]
            -- upvalues: v98 (copy)
            v98.LogAssetMediaImpression(v198, v199);
        end;
        v98.OnSetImageCarouselImages = function(v200) --[[ Line: 729 ]]
            -- upvalues: v98 (copy)
            v98.LogAssetMediaImpression(v200, true);
        end;
    end;
    v98.onClickDescriptionLink = function(v201) --[[ Line: 734 ]]
        -- upvalues: v98 (copy)
        local l_props_5 = v98.props;
        local l_assetData_10 = l_props_5.assetData;
        local v204 = l_props_5.getPageInfoAnalyticsContextInfo();
        v98.props.AssetAnalytics:get():onAssetDescriptionLinkClicked(l_assetData_10, v204, l_props_5.searchId, v201);
    end;
end;
v55.didMount = function(v205) --[[ Line: 746 ]] --[[ Name: didMount ]]
    v205.initialize(v205.props.assetData);
end;
v55.render = function(v206) --[[ Line: 750 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), l_disableRatings_0 (copy), v51 (copy), v65 (copy), v52 (copy), v4 (copy), l_AssetPreview_0 (copy), v57 (copy), v14 (copy), v60 (copy), v67 (copy)
    local v207 = v206:createPurchaseFlow();
    local l_props_6 = v206.props;
    local l_state_0 = v206.state;
    local l_Localization_0 = l_props_6.Localization;
    local l_modalTarget_0 = l_props_6.Modal.modalTarget;
    local l_assetData_11 = l_props_6.assetData;
    local l_Owned_2 = l_props_6.Owned;
    local v214 = math.min(l_state_0.maxPreviewWidth, v8.ASSET_PREVIEW_MAX_WIDTH);
    local l_maxPreviewHeight_0 = l_state_0.maxPreviewHeight;
    local l_previewModel_0 = l_props_6.previewModel;
    local v217 = not v207.InstallDisabled and not v206.state.showInstallationBar;
    local function v218() --[[ Line: 768 ]]
        -- upvalues: v206 (copy)
        v206.tryCreateContextMenu(v206.props.Localization);
    end;
    local v219 = nil;
    local v220 = nil;
    local v221 = nil;
    if l_disableRatings_0() then
        v219 = nil;
        v220 = nil;
    else
        v219 = {
            OnClick = v206.onFavoritedActivated, 
            Count = tonumber(v206.props.favoriteCounts), 
            IsFavorited = v206.props.favorited
        };
        if v206.props.voting then
            v221 = v207.IsUninstalledPlugin;
        end;
        v220 = v207.HasRating and v206.props.voting;
    end;
    local v222 = nil;
    if l_assetData_11.Asset.AssetSubTypes then
        v222 = v51.contains(l_assetData_11.Asset.AssetSubTypes, v51.Package);
    end;
    local v223 = nil;
    local l_FiatProduct_2 = l_assetData_11.FiatProduct;
    if l_FiatProduct_2 and l_FiatProduct_2.PurchasePrice and not v65.isFree(l_FiatProduct_2.PurchasePrice) and not l_Owned_2 then
        if l_props_6.buyerStatus == v52.CountryRestricted then
            v217 = false;
            v223 = l_Localization_0:getText("AssetPreview", "CountryRestrictedPurchase");
        elseif l_props_6.isExcessiveTransaction then
            v217 = false;
            v223 = l_props_6.Localization:getText("AssetPreview", "ExcessiveTransactionsSubText");
        end;
    end;
    local v225 = false;
    if type(l_assetData_11.Asset.AssetMediaIds) == "table" then
        v225 = next(l_assetData_11.Asset.AssetMediaIds) ~= nil;
    end;
    local v227 = v4.createElement(l_AssetPreview_0, {
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.fromOffset(v214, l_maxPreviewHeight_0), 
        ZIndex = 2, 
        AssetData = l_assetData_11, 
        AssetInstance = l_previewModel_0, 
        OnClickContext = v218, 
        ActionEnabled = v217, 
        ShowRobuxIcon = v207.ShowRobuxIcon, 
        ActionSubText = v223, 
        ActionText = tostring(v207.ActionBarText), 
        OnClickAction = v207.TryInsert, 
        Favorites = v219, 
        Voting = v220, 
        IsUninstalledPlugin = v221, 
        OnVoteUp = v206.onVoteUpButtonActivated, 
        OnVoteDown = v206.onVoteDownButtonActivated, 
        OnClickCreator = v57() and function(_) --[[ Line: 833 ]]
            -- upvalues: v206 (copy), l_assetData_11 (copy)
            return v206.searchByCreator(l_assetData_11.Creator, nil);
        end or v206.searchByCreator, 
        OnClickReport = v206.onClickReport, 
        OnClickDescriptionLink = v206.onClickDescriptionLink, 
        RenderSuggestions = v206.renderAndGetSuggestions, 
        RenderFooter = v206.renderFooter, 
        CanFlagAsset = l_assetData_11.Creator and l_assetData_11.Creator.Id ~= 1 and l_assetData_11.Creator.Id ~= v14(), 
        IsPackage = v222, 
        ImageCarouselAutoAdvanceTimer = if v225 then v8.ASSET_PREVIEW_IMAGE_CAROUSEL_AUTO_ADVANCE_TIMER else nil, 
        OnImageCarouselImageChanged = v206.OnImageCarouselChange, 
        ImageCarouselTransparencyThreshold = v8.IMAGE_CAROUSEL_ON_IMAGE_CHANGE_TRANSPARENCY_THRESHOLD, 
        OnSetImageCarouselImages = v206.OnSetImageCarouselImages, 
        UseImageCarousel = v225, 
        UsageContext = Enum.UsageContext.Preview, 
        ShouldMuteModelSounds = true, 
        ScrollingRef = v206.assetPreviewScrollingRef, 
        CreatingUniverseId = l_props_6.creatingUniverseId, 
        CreatingUniverseName = l_props_6.creatingUniverseName, 
        CreatingUniverseRootPlaceId = l_props_6.creatingUniverseRootPlaceId, 
        CodeSummary = if v60(l_props_6.IXP) then l_props_6.codeSummary else nil
    });
    return l_modalTarget_0 and v4.createElement(v4.Portal, {
        target = l_modalTarget_0
    }, {
        ScreenClickDetector = v4.createElement("TextButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 0.25, 
            BackgroundColor3 = v67, 
            ZIndex = 1, 
            AutoButtonColor = false, 
            [v4.Event.Activated] = v206.onCloseButtonClicked, 
            [v4.Ref] = v206.ClickDetectorRef, 
            [v4.Change.AbsoluteSize] = v206.onDetectorABSSizeChange
        }), 
        AssetPreview = v227
    });
end;
local function v250(v228, v229) --[[ Line: 889 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v61 (copy), v6 (copy), v59 (copy), v53 (copy)
    v228 = v228 or {};
    local v230 = v228.assets or {};
    local l_previewModel_1 = v230.previewModel;
    local v232 = v228.pageInfo or {};
    local l_previewAssetId_0 = v230.previewAssetId;
    local v234 = v228.purchase or {};
    local l_status_0 = v234.status;
    local v236 = v234.cachedOwnedAssets[tostring(l_previewAssetId_0)];
    local l_robuxBalance_0 = v234.robuxBalance;
    local v238 = if v61() then v234.buyerStatus else nil;
    local v239 = v228.favorite or {};
    local v240 = v239.assetIdToCountsMap or {};
    local v241 = v239.assetIdToFavoritedMap or {};
    local v242 = v228.voting or {};
    local l_assetData_12 = v229.assetData;
    local v244 = v234.excessiveTransactionUserIds or {};
    local v245 = if l_assetData_12 and l_assetData_12.Creator then l_assetData_12.Creator.Id else nil;
    local v246 = v245 and v244[v245];
    local v247 = if v230.creatingUniverseName and v230.creatingUniverseName ~= v6.None then v230.creatingUniverseName else nil;
    local v248 = if v230.creatingUniverseRootPlaceId and v230.creatingUniverseRootPlaceId ~= v6.None then v230.creatingUniverseRootPlaceId else nil;
    local v249 = if v59() then v230.codeSummaryMap[tostring(l_previewAssetId_0)] else nil;
    return {
        assetData = l_assetData_12, 
        buyerStatus = v238, 
        categories = nil, 
        categoryName = v232.categoryName or v53.DEFAULT.name, 
        codeSummary = v249, 
        isExcessiveTransaction = v246, 
        layoutMode = v232.layoutMode, 
        previewModel = l_previewModel_1 or nil, 
        previewPluginData = v230.previewPluginData, 
        previewSwimlaneName = v230.previewSwimlaneName, 
        assetId = l_previewAssetId_0, 
        favoriteCounts = v240[l_previewAssetId_0] or 0, 
        favorited = v241[l_previewAssetId_0] or false, 
        voting = v242[l_previewAssetId_0], 
        Owned = v236, 
        PurchaseStatus = l_status_0, 
        searchId = v232.searchId, 
        Balance = l_robuxBalance_0, 
        creatingUniverseName = v247, 
        creatingUniverseRootPlaceId = v248
    };
end;
local function v289(v251) --[[ Line: 957 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v35 (copy), v24 (copy), v59 (copy), v36 (copy), v37 (copy), v38 (copy), v40 (copy), v39 (copy), v27 (copy), v26 (copy), v46 (copy), v41 (copy), v42 (copy), v44 (copy), v43 (copy), v45 (copy), v47 (copy), v61 (copy), v49 (copy), v48 (copy), v29 (copy), v28 (copy)
    return {
        getPreviewInstance = function(v252, v253) --[[ Line: 959 ]] --[[ Name: getPreviewInstance ]]
            -- upvalues: v251 (copy), v35 (ref)
            v251(v35(v252, v253));
        end, 
        clearPreview = function() --[[ Line: 963 ]] --[[ Name: clearPreview ]]
            -- upvalues: v251 (copy), v24 (ref)
            v251(v24());
        end, 
        getCodeUnderstandingSummary = v59() and function(v254, v255) --[[ Line: 968 ]]
            -- upvalues: v251 (copy), v36 (ref)
            v251(v36(v254, v255));
        end or nil, 
        getPluginInfo = function(v256, v257) --[[ Line: 973 ]] --[[ Name: getPluginInfo ]]
            -- upvalues: v251 (copy), v37 (ref)
            v251(v37(v256, v257));
        end, 
        searchWithOptions = function(v258, v259, v260) --[[ Line: 977 ]] --[[ Name: searchWithOptions ]]
            -- upvalues: v251 (copy), v38 (ref)
            v251(v38(v258, v259, v260));
        end, 
        onVoteRequested = function(v261, v262, v263) --[[ Line: 981 ]] --[[ Name: onVoteRequested ]]
            -- upvalues: v251 (copy), v40 (ref)
            v251(v40(v261, v262, v263));
        end, 
        onUnvoteRequested = function(v264, v265) --[[ Line: 985 ]] --[[ Name: onUnvoteRequested ]]
            -- upvalues: v251 (copy), v39 (ref)
            v251(v39(v264, v265));
        end, 
        onPreviewToggled = function(v266) --[[ Line: 989 ]] --[[ Name: onPreviewToggled ]]
            -- upvalues: v251 (copy), v27 (ref)
            v251(v27(v266));
        end, 
        pauseASound = function() --[[ Line: 993 ]] --[[ Name: pauseASound ]]
            -- upvalues: v251 (copy), v26 (ref)
            v251(v26());
        end, 
        tryCreateContextMenu = function(v267, v268, v269, v270, v271) --[[ Line: 997 ]] --[[ Name: tryCreateContextMenu ]]
            -- upvalues: v251 (copy), v46 (ref)
            v251(v46(v267, v268, v269, v270, v271));
        end, 
        getOwnsAsset = function(v272, v273) --[[ Line: 1004 ]] --[[ Name: getOwnsAsset ]]
            -- upvalues: v251 (copy), v41 (ref)
            v251(v41(v272, v273));
        end, 
        clearPurchaseFlow = function(v274) --[[ Line: 1008 ]] --[[ Name: clearPurchaseFlow ]]
            -- upvalues: v251 (copy), v42 (ref)
            v251(v42(v274));
        end, 
        getFavorited = function(v275, v276, v277) --[[ Line: 1013 ]] --[[ Name: getFavorited ]]
            -- upvalues: v251 (copy), v44 (ref)
            v251(v44(v275, v276, v277));
        end, 
        getFavoriteCounts = function(v278, v279) --[[ Line: 1017 ]] --[[ Name: getFavoriteCounts ]]
            -- upvalues: v251 (copy), v43 (ref)
            v251(v43(v278, v279));
        end, 
        toggleFavoriteStatus = function(v280, v281, v282, v283) --[[ Line: 1021 ]] --[[ Name: toggleFavoriteStatus ]]
            -- upvalues: v251 (copy), v45 (ref)
            v251(v45(v280, v281, v282, v283));
        end, 
        getPageInfoAnalyticsContextInfo = function() --[[ Line: 1025 ]] --[[ Name: getPageInfoAnalyticsContextInfo ]]
            -- upvalues: v251 (copy), v47 (ref)
            return v251(v47());
        end, 
        getBuyerStatus = v61() and function(v284) --[[ Line: 1030 ]]
            -- upvalues: v251 (copy), v49 (ref)
            return v251(v49(v284));
        end or nil, 
        getAssetContentAttributionInfo = function(v285, v286) --[[ Line: 1036 ]] --[[ Name: getAssetContentAttributionInfo ]]
            -- upvalues: v251 (copy), v48 (ref)
            return v251(v48(v285, v286));
        end, 
        setPurchaseStatus = function(v287) --[[ Line: 1040 ]] --[[ Name: setPurchaseStatus ]]
            -- upvalues: v251 (copy), v29 (ref)
            return v251(v29(v287));
        end, 
        setPurchaseDialogVisibility = function(v288) --[[ Line: 1044 ]] --[[ Name: setPurchaseDialogVisibility ]]
            -- upvalues: v251 (copy), v28 (ref)
            return v251(v28(v288));
        end
    };
end;
v55 = l_withContext_0({
    Settings = v19, 
    AssetAnalytics = v11, 
    IXP = if v59() then v20 else nil, 
    NavigationContext = v21, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Modal = v22, 
    Network = v23, 
    Localization = l_ContextServices_0.Localization
})(v55);
return v5.UNSTABLE_connect2(v250, v289)(v55);