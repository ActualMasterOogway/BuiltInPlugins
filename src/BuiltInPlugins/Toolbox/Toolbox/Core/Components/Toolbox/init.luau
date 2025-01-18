local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local v2 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixDefaultTabForCreations);
local v3 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnablePluginHomeview);
local l_AICOChatBot_0 = game:GetFastFlag("AICOChatBot");
local l_AICOChatBotFindVariationFix_0 = game:GetFastFlag("AICOChatBotFindVariationFix");
local l_CAPNewUserExperiment_0 = game:GetFastFlag("CAPNewUserExperiment");
local v7 = game:DefineFastFlag("TutorialMarketplaceTabFix", false);
local l_Packages_0 = l_Parent_0.Packages;
local v9 = require(l_Packages_0.Cryo);
local v10 = require(l_Packages_0.Roact);
local v11 = require(l_Packages_0.RoactRodux);
local v12 = require(l_Packages_0.Framework);
local l_showRobloxCreatedAssets_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).showRobloxCreatedAssets;
local l_getHomeViewEnabledAssetTypes_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).getHomeViewEnabledAssetTypes;
local v15 = require(l_Parent_0.Core.Util.SharedFlags.getIsUseWebView);
local v16 = require(l_Parent_0.SharedPluginConstants);
local l_Util_0 = l_Parent_0.Core.Util;
local v18 = require(l_Util_0.Constants);
local v19 = require(l_Util_0.PageInfoHelper);
local v20 = require(l_Util_0.getTabs);
local v21 = require(l_Util_0.Analytics.Analytics);
local v22 = require(l_Util_0.isInSemanticSearchIXP);
local l_Types_0 = l_Parent_0.Core.Types;
local v24 = require(l_Types_0.Sort);
local v25 = require(l_Types_0.Category);
local v26 = require(l_Types_0.RequestReason);
local l_Components_0 = l_Parent_0.Core.Components;
local v28 = require(l_Components_0.AnnouncementDialog);
local v29 = require(l_Components_0.TabSet);
local v30 = require(l_Components_0.Header);
local v31 = require(l_Components_0.MainView.MainView);
local v32 = require(l_Components_0.SoundPreviewComponent);
local v33 = require(l_Components_0.Home.HomeWrapper);
local v34 = if v1() then nil else require(l_Parent_0.Core.Components.SearchOptions.SearchOptions);
local v35 = require(l_Parent_0.Core.Components.SearchOptions.SearchOptionWrappers.AudioMarketplaceSearchOptions);
local v36 = if v1() then require(l_Parent_0.Core.Components.SearchOptions.SearchOptionWrappers.MarketplaceSearchOptions) else nil;
local v37 = if v1() then require(l_Parent_0.Core.Components.SearchOptions.SearchOptionWrappers.InventorySearchOptions) else nil;
local v38 = require(l_Components_0.WebView.WebViewConnector);
local l_Requests_0 = l_Parent_0.Core.Networking.Requests;
local v40 = require(l_Requests_0.UpdatePageInfoAndSendRequest);
local v41 = require(l_Requests_0.ChangeMarketplaceTab);
local v42 = require(l_Requests_0.GetToolboxManageableGroupsRequest);
local v43 = require(l_Requests_0.GetRolesRequest);
local v44 = require(l_Requests_0.GetRolesDebugRequest);
local v45 = require(l_Requests_0.GetRobuxBalance);
local v46 = require(l_Parent_0.Core.ContextServices.IXPContext);
local l_ContextServices_0 = v12.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v49 = require(l_Parent_0.Core.ContextServices.Settings);
local v50 = require(l_Parent_0.Core.ContextServices.ModalContext);
local v51 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local _ = require(l_Parent_0.Core.Types.HomeTypes);
local v53 = require(l_Parent_0.Core.Actions.SetLayoutMode);
local v54 = require(l_Parent_0.Core.Thunks.LogMarketplaceSearchAnalytics);
local l_DebugToolboxGetRolesRequest_0 = game:GetFastFlag("DebugToolboxGetRolesRequest");
local v56 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxContentManagementCombineTabs);
local v57 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows);
local v58 = require(l_Parent_0.Core.Util.SharedFlags.getIsIXPEnabledForListView);
local v59 = require(l_Parent_0.Core.Types.LayoutMode);
local v60 = require(l_Parent_0.Core.Types.Background);
local v61 = v10.PureComponent:extend("Toolbox");
v61.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0)
};
v61.handleInitialSettings = function(v62) --[[ Line: 113 ]] --[[ Name: handleInitialSettings ]]
    -- upvalues: v7 (copy), v57 (copy), v60 (copy), v25 (copy), v56 (copy), v2 (copy), v26 (copy), v58 (copy), v59 (copy)
    if not v62.props.Settings or not v62.props.Network then
        return;
    else
        local l_networkInterface_0 = v62.props.Network.networkInterface;
        local v64 = v62.props.Settings:get("Plugin");
        local v65 = v64:loadInitialSettings();
        if v7 and v62.props.hasTutorialLimits then
            return;
        else
            local v66 = nil;
            if v57() then
                v66 = v64:getLayoutMode();
                v62.props.setLayoutMode(v66);
            end;
            local v67 = nil;
            local v68 = nil;
            local v69 = v60.getBackgroundForStudioTheme();
            v67 = 1;
            v68 = "";
            local l_categoryName_0 = v65.categoryName;
            local v71 = v25.getTabForCategoryName(l_categoryName_0);
            if v56() and v71 == v25.CREATIONS then
                v71 = if v2() then v25.DEFAULT_TAB else v25.INVENTORY;
                l_categoryName_0 = v25.DEFAULT.name;
            end;
            local v72 = {
                categories = v71, 
                categoryName = l_categoryName_0, 
                creator = v65.creator, 
                searchTerm = v68, 
                sortIndex = v67, 
                targetPage = 1, 
                selectedBackgroundIndex = v69, 
                requestReason = v26.InitLoad
            };
            local v73 = true;
            if v71 ~= v25.INVENTORY then
                v73 = v71 == v25.CREATIONS;
            end;
            if v73 then
                v62.props.getToolboxManageableGroups(l_networkInterface_0, v64, v72);
            end;
            if not (v58(v62.props.IXP) and v66 == v59.ListView and v25.getTabForCategoryName(l_categoryName_0) == v25.INVENTORY) then
                v62.props.updatePageInfo(l_networkInterface_0, v64, v72);
            end;
            return;
        end;
    end;
end;
v61.init = function(v74, v75) --[[ Line: 181 ]] --[[ Name: init ]]
    -- upvalues: v18 (copy), v25 (copy), v21 (copy), l_showRobloxCreatedAssets_0 (copy), v56 (copy), v9 (copy), v19 (copy), l_AICOChatBot_0 (copy), l_CAPNewUserExperiment_0 (copy)
    v74.state = {
        toolboxWidth = math.max(v75.initialWidth or 0, v18.TOOLBOX_MIN_WIDTH), 
        showSearchOptions = false
    };
    v74.onAbsoluteSizeChange = function(v76) --[[ Line: 189 ]]
        -- upvalues: v18 (ref), v74 (copy)
        local v77 = math.max(v76.AbsoluteSize.X, v18.TOOLBOX_MIN_WIDTH);
        if v74.state.toolboxWidth ~= v77 then
            v74:setState({
                toolboxWidth = v77
            });
        end;
    end;
    v74:handleInitialSettings();
    v74.toggleSearchOptions = function() --[[ Line: 200 ]]
        -- upvalues: v74 (copy), v25 (ref), v21 (ref)
        local l_showSearchOptions_0 = v74.state.showSearchOptions;
        if not l_showSearchOptions_0 then
            local l_categoryName_1 = v74.props.categoryName;
            local v80 = v25.getCategoryByName(l_categoryName_1);
            local v81 = v25.getTabKeyForCategoryName(l_categoryName_1);
            local v82 = if v80 then v25.ToolboxAssetTypeToEngine[v80.assetType] else nil;
            v21.MarketplaceSearchFilterOpened(v82, v81);
        end;
        v74.props.Modal.onSearchOptionsToggled(not l_showSearchOptions_0);
        v74:setState({
            showSearchOptions = not l_showSearchOptions_0
        });
    end;
    local function v87(v83, v84) --[[ Line: 219 ]] --[[ Name: determineCategoryNameOnTabChange ]]
        -- upvalues: v25 (ref)
        if v25.CREATIONS_KEY == v83 then
            for _, v86 in ipairs(v84) do
                if v86 and (v86.selectable == nil or v86.selectable) then
                    return v86.name;
                end;
            end;
        end;
        return v84[1].name;
    end;
    local function _(v88) --[[ Line: 231 ]] --[[ Name: getCreatorOverrideIfNeeded ]]
        -- upvalues: l_showRobloxCreatedAssets_0 (ref), v25 (ref)
        if l_showRobloxCreatedAssets_0() and v88 == v25.MARKETPLACE_KEY then
            return v25.CREATOR_ROBLOX;
        else
            return nil;
        end;
    end;
    v74.changeMarketplaceTab = function(v90, v91) --[[ Line: 241 ]]
        -- upvalues: v25 (ref), v74 (copy), v56 (ref), v9 (ref), v87 (copy), l_showRobloxCreatedAssets_0 (ref), v19 (ref), v21 (ref)
        local v92 = v25.getCategories(v90, v74.props.roles, if v56() then v74.props.IXP else nil);
        local v93 = v9.Dictionary.join({
            categoryName = v87(v90, v92), 
            creator = if l_showRobloxCreatedAssets_0() and v90 == v25.MARKETPLACE_KEY then v25.CREATOR_ROBLOX else nil, 
            searchTerm = "", 
            sortIndex = 1, 
            groupIndex = 0
        }, v91 or {});
        local v94 = v74.props.Settings:get("Plugin");
        local l_networkInterface_1 = v74.props.Network.networkInterface;
        v74.props.changeMarketplaceTab(l_networkInterface_1, v90, v92, v94, v93, if v56() then v74.props.IXP else nil);
        local v96 = v19.getCategory(v74.props.categoryName);
        local v97 = v19.getCategory(v93.categoryName);
        v21.onCategorySelected(v96, v97);
    end;
    v74.onBackToHome = function() --[[ Line: 275 ]]
        -- upvalues: v74 (copy), v25 (ref)
        local l_categoryName_2 = v74.props.categoryName;
        local v99 = v25.getTabKeyForCategoryName(l_categoryName_2);
        v74.changeMarketplaceTab(v99, {
            categoryName = l_categoryName_2
        });
    end;
    if l_AICOChatBot_0 or l_CAPNewUserExperiment_0 then
        v74.updatePageInfoWithSearchTerm = function(v100) --[[ Line: 284 ]]
            -- upvalues: v74 (copy)
            if not v74.props.Settings or not v74.props.Network then
                return;
            else
                local l_networkInterface_2 = v74.props.Network.networkInterface;
                local v102 = v74.props.Settings:get("Plugin");
                local v103 = {
                    searchTerm = v100
                };
                v74.props.updatePageInfo(l_networkInterface_2, v102, v103);
                return;
            end;
        end;
    end;
end;
v61.didUpdate = function(v104, v105, _) --[[ Line: 301 ]] --[[ Name: didUpdate ]]
    local l_props_0 = v104.props;
    if v105.searchId ~= l_props_0.searchId then
        v104.props.logSearchAnalytics(l_props_0.searchTerm);
    end;
end;
v61.didMount = function(v108) --[[ Line: 308 ]] --[[ Name: didMount ]]
    -- upvalues: v16 (copy), v25 (copy), v21 (copy), l_AICOChatBot_0 (copy), l_CAPNewUserExperiment_0 (copy), l_AICOChatBotFindVariationFix_0 (copy), v18 (copy)
    v108:handleInitialSettings();
    v108.props.setRoles(v108.props.Network.networkInterface);
    v108.props.getRobuxBalance(v108.props.Network.networkInterface);
    v108._showPluginsConnection = v108.props.pluginLoaderContext and v108.props.pluginLoaderContext.signals["MemStorageService." .. v16.SHOW_TOOLBOX_PLUGINS_EVENT]:Connect(function() --[[ Line: 317 ]]
        -- upvalues: v25 (ref), v108 (copy), v21 (ref)
        local l_name_0 = v25.WHITELISTED_PLUGINS.name;
        v108.changeMarketplaceTab(v25.MARKETPLACE_KEY, {
            categoryName = l_name_0
        });
        v21.openedFromPluginManagement();
    end) or nil;
    if l_AICOChatBot_0 or l_CAPNewUserExperiment_0 then
        v108._showPluginsConnection = v108.props.pluginLoaderContext and v108.props.pluginLoaderContext.signals["MemStorageService." .. v16.SHOW_TOOLBOX_OPEN_MODELS_AND_SEARCH_EVENT]:Connect(function(v110) --[[ Line: 332 ]]
            -- upvalues: l_AICOChatBotFindVariationFix_0 (ref), v108 (copy), v25 (ref)
            if l_AICOChatBotFindVariationFix_0() then
                v108.changeMarketplaceTab(v25.MARKETPLACE_KEY, {
                    categoryName = v25.FREE_MODELS.name, 
                    searchTerm = v110
                });
                return;
            else
                v108.changeMarketplaceTab(v25.MARKETPLACE_KEY, {
                    categoryName = v25.FREE_MODELS.name
                });
                v108.updatePageInfoWithSearchTerm(v110);
                return;
            end;
        end) or nil;
    end;
    v108._changeMarketplaceTabConnection = v108.props.pluginLoaderContext and v108.props.pluginLoaderContext.signals["MemStorageService." .. v18.OPEN_MARKETPLACE_VIEW_FOR_ASSET_TYPE]:Connect(function(v111) --[[ Line: 351 ]]
        -- upvalues: v25 (ref), v108 (copy), v21 (ref)
        local v112 = Enum.AssetType[v111];
        local v113 = v25.getMarketplaceCategoryByAssetType(v112);
        v108.changeMarketplaceTab(v25.MARKETPLACE_KEY, {
            categoryName = v113.name
        });
        v21.openedExternallyByAssetType(v111);
    end) or nil;
end;
v61.willUnmount = function(v114) --[[ Line: 363 ]] --[[ Name: willUnmount ]]
    if v114._showPluginsConnection then
        v114._showPluginsConnection:Disconnect();
        v114._showPluginsConnection = nil;
    end;
    if v114._changeMarketplaceTabConnection then
        v114._changeMarketplaceTabConnection:Disconnect();
        v114._changeMarketplaceTabConnection = nil;
    end;
end;
v61.render = function(v115) --[[ Line: 375 ]] --[[ Name: render ]]
    -- upvalues: v25 (copy), v18 (copy), v3 (copy), l_getHomeViewEnabledAssetTypes_0 (copy), v1 (copy), v10 (copy), v37 (copy), v35 (copy), v36 (copy), v34 (copy), v15 (copy), v28 (copy), v22 (copy), v29 (copy), v56 (copy), v20 (copy), v30 (copy), v38 (copy), v33 (copy), v24 (copy), v31 (copy), v32 (copy)
    local l_props_1 = v115.props;
    local l_state_0 = v115.state;
    local l_toolboxWidth_0 = l_state_0.toolboxWidth;
    local l_showSearchOptions_1 = l_state_0.showSearchOptions;
    local _ = l_props_1.backgrounds;
    local l_creator_0 = l_props_1.creator;
    local l_searchTerm_0 = l_props_1.searchTerm;
    local v123 = l_props_1.suggestions or {};
    local l_categoryName_3 = l_props_1.categoryName;
    local l_audioSearchInfo_0 = l_props_1.audioSearchInfo;
    local l_additionalAudioSearchInfo_0 = l_props_1.additionalAudioSearchInfo;
    local l_uiSortIntent_0 = l_props_1.uiSortIntent;
    local v128 = v25.getTabKeyForCategoryName(l_categoryName_3);
    local l_tryOpenAssetConfig_0 = l_props_1.tryOpenAssetConfig;
    local l_pluginGui_0 = l_props_1.pluginGui;
    local l_Size_0 = v115.props.Size;
    local l_Stylizer_0 = v115.props.Stylizer;
    local l_Localization_0 = l_props_1.Localization;
    local l_locale_0 = l_props_1.Localization.locale;
    local l_onAbsoluteSizeChange_0 = v115.onAbsoluteSizeChange;
    local l_TAB_WIDGET_HEIGHT_0 = v18.TAB_WIDGET_HEIGHT;
    local v137 = false;
    local v138 = {};
    local v139 = v25.getEngineAssetType(v25.getCategoryByName(l_categoryName_3).assetType);
    local v140 = if v3() and l_getHomeViewEnabledAssetTypes_0() ~= nil then string.split(l_getHomeViewEnabledAssetTypes_0(), ";") else {};
    if v128 == v25.MARKETPLACE_KEY and (not l_creator_0 or l_creator_0 == "") and l_searchTerm_0 == "" and l_audioSearchInfo_0 == nil and l_additionalAudioSearchInfo_0 == nil and l_uiSortIntent_0 == nil then
        if v3() then
            for _, v142 in ipairs(v140) do
                local v143 = Enum.AssetType[v142];
                if v143 then
                    table.insert(v138, v143);
                end;
            end;
        else
            table.insert(v138, Enum.AssetType.Model);
            table.insert(v138, Enum.AssetType.Audio);
        end;
        v137 = table.find(v138, v139);
    end;
    local v144 = nil;
    if v1() then
        local v145 = v25.getTabForCategoryName(l_categoryName_3) == v25.INVENTORY;
        if l_showSearchOptions_1 then
            v144 = if v145 then v10.createElement(v37, {
                OnClose = v115.toggleSearchOptions
            }) else if v25.categoryIsAudio(l_categoryName_3) then v10.createElement(v35, {
                OnClose = v115.toggleSearchOptions
            }) else v10.createElement(v36, {
                OnClose = v115.toggleSearchOptions
            });
        end;
    else
        v144 = if l_showSearchOptions_1 then v10.createElement(v34, {
            onSearchOptionsToggled = v115.toggleSearchOptions
        }) else nil;
    end;
    local v146 = v15(l_props_1.IXP);
    return v10.createElement("Frame", {
        Position = UDim2.new(0, 0, 0, 0), 
        Size = l_Size_0, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Stylizer_0.backgroundColor, 
        [v10.Change.AbsoluteSize] = l_onAbsoluteSizeChange_0, 
        [v10.Event.MouseEnter] = l_props_1.onMouseEnter
    }, {
        AnnouncementDialogContainer = v10.createElement(v28, {
            checkUserInIXP = v22
        }), 
        Tabs = if v146 then nil else v10.createElement(v29, {
            Disabled = l_props_1.hasTutorialLimits, 
            Size = UDim2.new(1, 0, 0, v18.TAB_WIDGET_HEIGHT), 
            Tabs = if v56() then v20(l_Localization_0, l_props_1.roles, l_props_1.IXP) else v20(l_Localization_0), 
            CurrentTab = v128, 
            onTabSelected = v115.changeMarketplaceTab
        }), 
        Header = if v146 then nil else v10.createElement(v30, {
            Position = UDim2.new(0, 0, 0, l_TAB_WIDGET_HEIGHT_0), 
            maxWidth = l_toolboxWidth_0, 
            onSearchOptionsToggled = v115.toggleSearchOptions, 
            pluginGui = l_pluginGui_0
        }), 
        MainView = if v146 and v128 == v25.MARKETPLACE_KEY then v10.createElement(v38, {
            ChangeMarketplaceTab = v115.changeMarketplaceTab, 
            PluginLoaderContext = v115.props.pluginLoaderContext
        }) else if v137 then v10.createElement(v33, {
            AssetType = v139, 
            CategoryName = l_categoryName_3, 
            Locale = l_locale_0, 
            Position = UDim2.new(0, 0, 0, l_TAB_WIDGET_HEIGHT_0 + v18.HEADER_HEIGHT + 1), 
            Size = UDim2.new(1, 0, 1, -(v18.HEADER_HEIGHT + l_TAB_WIDGET_HEIGHT_0 + 2)), 
            SortName = v24.getDefaultSortNameForCategory(l_categoryName_3), 
            TryOpenAssetConfig = l_tryOpenAssetConfig_0, 
            EnabledAssetTypes = v138
        }) else v10.createElement(v31, {
            Position = UDim2.new(0, 0, 0, l_TAB_WIDGET_HEIGHT_0 + v18.HEADER_HEIGHT + 1), 
            Size = UDim2.new(1, 0, 1, -(v18.HEADER_HEIGHT + l_TAB_WIDGET_HEIGHT_0 + 2)), 
            maxWidth = l_toolboxWidth_0, 
            suggestions = v123, 
            tryOpenAssetConfig = l_tryOpenAssetConfig_0, 
            onBackToHome = v115.onBackToHome
        }), 
        SearchOptions = v144, 
        AudioPreview = v10.createElement(v32)
    });
end;
v61 = l_withContext_0({
    IXP = if not not v56() or v57() or v58() then v46 else nil, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Settings = v49, 
    Modal = v50, 
    Network = v51
})(v61);
return v11.connect(function(v147, _) --[[ Line: 543 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v25 (copy), v9 (copy)
    v147 = v147 or {};
    local v149 = v147.pageInfo or {};
    return {
        categoryName = v149.categoryName or v25.DEFAULT.name, 
        creator = v149.creator, 
        audioSearchInfo = v149.audioSearchInfo, 
        additionalAudioSearchInfo = v149.additionalAudioSearchInfo, 
        roles = v147.roles or {}, 
        searchId = v149.searchId or "", 
        searchTerm = v149.searchTerm or "", 
        sorts = v149.sorts or {}, 
        uiSortIntent = if v149.uiSortIntent and v149.uiSortIntent ~= v9.None then v149.uiSortIntent else nil, 
        hasTutorialLimits = v147.tutorialLimits.assetIds ~= nil
    };
end, function(v150) --[[ Line: 562 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: l_DebugToolboxGetRolesRequest_0 (copy), v44 (copy), v43 (copy), v40 (copy), v41 (copy), v45 (copy), v42 (copy), v54 (copy), v57 (copy), v53 (copy)
    return {
        setRoles = function(v151) --[[ Line: 564 ]] --[[ Name: setRoles ]]
            -- upvalues: l_DebugToolboxGetRolesRequest_0 (ref), v150 (copy), v44 (ref), v43 (ref)
            if l_DebugToolboxGetRolesRequest_0 then
                v150(v44(v151));
                return;
            else
                v150(v43(v151));
                return;
            end;
        end, 
        updatePageInfo = function(v152, v153, v154) --[[ Line: 572 ]] --[[ Name: updatePageInfo ]]
            -- upvalues: v150 (copy), v40 (ref)
            v150(v40(v152, v153, v154));
        end, 
        changeMarketplaceTab = function(v155, v156, v157, v158, v159, v160) --[[ Line: 576 ]] --[[ Name: changeMarketplaceTab ]]
            -- upvalues: v150 (copy), v41 (ref)
            v150(v41(v155, v156, v157, v158, v159, v160));
        end, 
        getRobuxBalance = function(v161) --[[ Line: 580 ]] --[[ Name: getRobuxBalance ]]
            -- upvalues: v150 (copy), v45 (ref)
            v150(v45(v161));
        end, 
        getToolboxManageableGroups = function(v162, v163, v164) --[[ Line: 584 ]] --[[ Name: getToolboxManageableGroups ]]
            -- upvalues: v150 (copy), v42 (ref)
            v150(v42(v162, v163, v164));
        end, 
        logSearchAnalytics = function(v165) --[[ Line: 588 ]] --[[ Name: logSearchAnalytics ]]
            -- upvalues: v150 (copy), v54 (ref)
            return v150(v54(v165, false));
        end, 
        setLayoutMode = v57() and function(v166) --[[ Line: 593 ]]
            -- upvalues: v150 (copy), v53 (ref)
            v150(v53(v166));
        end or nil
    };
end)(v61);