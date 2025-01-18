local l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForIXP3");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.RoactRodux);
local v5 = require(l_Parent_0.Core.Util.Analytics.Analytics);
local v6 = require(l_Parent_0.Core.Util.Constants);
local v7 = require(l_Parent_0.Core.Util.DebugFlags);
local v8 = require(l_Parent_0.Core.Util.Images);
local v9 = require(l_Parent_0.Core.Util.PageInfoHelper);
local v10 = require(l_Parent_0.Core.Localization.getLocalizedCategories);
local v11 = nil;
if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then
    v11 = require(l_Parent_0.Core.Util.getIsIXPVariableEnabled);
end;
local v12 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxContentManagementCombineTabs);
local v13 = require(l_Parent_0.Core.Types.Category);
local v14 = require(l_Parent_0.Core.Types.LayoutMode);
local _ = require(l_Parent_0.Core.Types.AnalyticsTypes);
local v16 = require(l_Packages_0.Framework);
local l_deepCopy_0 = v16.Util.deepCopy;
local l_IconButton_0 = v16.UI.IconButton;
local _ = v16.UI.Tooltip;
local v20 = require(l_Parent_0.Core.ContextServices.IXPContext);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v23 = require(l_Parent_0.Core.ContextServices.Settings);
local v24 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v25 = require(l_Parent_0.Core.Components.DropdownMenu);
local v26 = require(l_Parent_0.Core.Components.SearchBarWithAutocomplete);
local v27 = require(l_Parent_0.Core.Actions.SetLayoutMode);
local v28 = require(l_Parent_0.Core.Actions.UpdateSearchTerm);
local v29 = require(l_Parent_0.Core.Networking.Requests.RequestSearchRequest);
local v30 = require(l_Parent_0.Core.Networking.Requests.SelectCategoryRequest);
local v31 = require(l_Parent_0.Core.Networking.Requests.SelectGroupRequest);
local v32 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddRecentSearchesToAutoComplete);
local v33 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows);
local v34 = require(l_Parent_0.Core.Util.SharedFlags.getIsIXPEnabledForListView);
local v35 = require(l_Parent_0.Core.Util.ToolboxCommunication);
local v36 = v3.PureComponent:extend("Header");
local l_settings_0 = settings;
local v38 = nil;
if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then
    v38 = {
        [v13.MY_PACKAGES.name] = true, 
        [v13.GROUP_PACKAGES.name] = true, 
        [v13.CREATIONS_GROUP_PACKAGES.name] = true
    };
end;
v36.init = function(v39) --[[ Line: 90 ]] --[[ Name: init ]]
    -- upvalues: l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (copy), v11 (ref), v5 (copy), v7 (copy), v9 (copy), l_settings_0 (copy), v13 (copy), v35 (copy), v33 (copy), v14 (copy)
    v39.state = {
        searchTerm = ""
    };
    v39.keyCount = 0;
    v39.deleteCount = 0;
    v39.unlocalizedCategories = nil;
    local v40 = nil;
    v39.onCategorySelected = function(v41, _) --[[ Line: 100 ]]
        -- upvalues: v39 (copy), l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (ref), v11 (ref), v5 (ref), v40 (ref)
        local l_networkInterface_0 = v39.props.Network.networkInterface;
        local v44 = if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then v11(v39.props.IXP, "MarketplaceModelsAsPackages", "MarketplaceModelsAsPackagesEnabled") else nil;
        local v45 = nil;
        v45 = if v44 then v39.unlocalizedCategories[v41].name else v39.props.categories[v41].name;
        if v39.props.categoryName ~= v45 then
            v5.onCategorySelected(v39.props.categoryName, v45);
            v40 = v39.props.Settings:get("Plugin");
            v39.props.selectCategory(l_networkInterface_0, v40, v45);
            if v39.props.searchTerm and v39.props.searchTerm ~= "" then
                v39.onSearchRequested(v39.props.searchTerm, v45);
            end;
        end;
    end;
    v39.onGroupSelected = function(v46) --[[ Line: 130 ]]
        -- upvalues: v39 (copy)
        if v39.props.groupIndex ~= v46 then
            local l_networkInterface_1 = v39.props.Network.networkInterface;
            v39.props.selectGroup(l_networkInterface_1, v46);
        end;
    end;
    v39.onSearchRequested = function(v48, v49) --[[ Line: 137 ]]
        -- upvalues: v39 (copy), v7 (ref), v9 (ref), l_settings_0 (ref), v13 (ref), v35 (ref)
        local l_networkInterface_2 = v39.props.Network.networkInterface;
        local v51 = v39.props.Settings:get("Plugin");
        if type(v48) ~= "string" and v7.shouldDebugWarnings() then
            warn(("Toolbox onSearchRequested searchTerm = %s is not a string"):format((tostring(v48))));
        end;
        local l_creatorFilter_0 = v39.props.creatorFilter;
        if not l_creatorFilter_0 or not l_creatorFilter_0.Id then
            local _ = nil;
        end;
        local _ = v9.getCategory(v49 or v39.props.categoryName);
        v39.keyCount = 0;
        v39.deleteCount = 0;
        v39.mostRecentSearchRequestTime = tick();
        local l_mostRecentSearchRequestTime_0 = v39.mostRecentSearchRequestTime;
        local l_FVariable_0 = l_settings_0():GetFVariable("StudioSearchWithoutInsertionTimeSeconds");
        delay(l_FVariable_0, function() --[[ Line: 157 ]]
            -- upvalues: l_mostRecentSearchRequestTime_0 (copy), v39 (ref)
            if l_mostRecentSearchRequestTime_0 == v39.mostRecentSearchRequestTime then
                v39:checkRecentAssetInsertion();
            end;
        end);
        local l_categoryName_0 = v39.props.categoryName;
        local v58 = v49 or v39.props.categoryName;
        if v13.categoryIsFont(l_categoryName_0) and v13.categoryIsFont(v58) then
            v39.props.updateSearchTerm(v48);
            return;
        else
            v39.props.requestSearch(l_networkInterface_2, v51, v48, v49);
            v35:fire("SearchRequested", {
                searchTerm = v48
            });
            return;
        end;
    end;
    v39.onSearchOptionsToggled = function() --[[ Line: 183 ]]
        -- upvalues: v39 (copy)
        if v39.props.onSearchOptionsToggled then
            v39.props.onSearchOptionsToggled();
        end;
    end;
    v39.onSearchTextChanged = function(v59) --[[ Line: 189 ]]
        -- upvalues: v39 (copy)
        if string.len(v59) > string.len(v39.state.searchTerm) then
            local l_v39_0 = v39;
            l_v39_0.keyCount = l_v39_0.keyCount + 1;
        elseif string.len(v59) < string.len(v39.state.searchTerm) then
            local l_v39_1 = v39;
            l_v39_1.deleteCount = l_v39_1.deleteCount + 1;
        end;
        v39:setState({
            searchTerm = v59
        });
    end;
    v39.toggleLayoutMode = v33() and function() --[[ Line: 199 ]]
        -- upvalues: v39 (copy), v14 (ref), v13 (ref), v5 (ref)
        local l_props_0 = v39.props;
        local v63 = l_props_0.Settings:get("Plugin");
        local v64 = if l_props_0.layoutMode == v14.Grid then v14.ListView else v14.Grid;
        l_props_0.setLayoutMode(v64);
        v63:setLayoutMode(v64);
        local v65 = v13.getCategoryByName(l_props_0.categoryName);
        local v66 = {
            assetType = if v65 then v65.assetType else nil, 
            searchId = l_props_0.searchId
        };
        v5.MarketplaceListViewToggleClicked(v64, v66);
    end or nil;
end;
v36.willUpdate = function(v67, v68, _) --[[ Line: 218 ]] --[[ Name: willUpdate ]]
    -- upvalues: l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (copy)
    if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then
        v67.unlocalizedCategories = v68.categories;
    end;
end;
v36.render = function(v70) --[[ Line: 224 ]] --[[ Name: render ]]
    -- upvalues: l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (copy), v11 (ref), l_deepCopy_0 (copy), v38 (ref), v10 (copy), v13 (copy), v12 (copy), v34 (copy), v6 (copy), v32 (copy), v3 (copy), v26 (copy), v25 (copy), v33 (copy), l_IconButton_0 (copy), v14 (copy), v8 (copy)
    local l_props_1 = v70.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_Localization_0 = l_props_1.Localization;
    local v74 = if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then v11(l_props_1.IXP, "MarketplaceModelsAsPackages", "MarketplaceModelsAsPackagesEnabled") else nil;
    local l_categoryName_1 = l_props_1.categoryName;
    local v76 = nil;
    local v77 = nil;
    if v74 then
        local v78 = l_deepCopy_0(l_props_1.categories);
        for v79, v80 in pairs(v78) do
            if v38[v80.category] then
                table.remove(v78, v79);
            end;
        end;
        v76 = v10(l_Localization_0, v78);
        v77 = 1;
        for v81, v82 in ipairs(v78) do
            if v82.name == l_categoryName_1 then
                v77 = v81;
            end;
        end;
        v70.unlocalizedCategories = v78;
    else
        v76 = v10(l_Localization_0, l_props_1.categories);
        v77 = v13.getCategoryIndex(l_categoryName_1, l_props_1.roles, if v12() then l_props_1.IXP else nil);
    end;
    local l_onCategorySelected_0 = v70.onCategorySelected;
    local l_searchTerm_0 = l_props_1.searchTerm;
    local l_onSearchRequested_0 = v70.onSearchRequested;
    local l_groups_0 = l_props_1.groups;
    local l_groupIndex_0 = l_props_1.groupIndex;
    local l_onGroupSelected_0 = v70.onGroupSelected;
    local v89 = if v34(l_props_1.IXP) then v13.getTabForCategoryName(l_props_1.categoryName) == v13.INVENTORY and l_props_1.categoryName ~= v13.MY_AUDIO.name and l_props_1.categoryName ~= v13.MY_FONTS.name else nil;
    local l_searchIsFiltered_0 = l_props_1.searchIsFiltered;
    local v91 = nil;
    local v92 = nil;
    if v34(l_props_1.IXP) then
        local v93 = v89 and 5 or 0;
        v91 = if v89 then v6.HEADER_DROPDOWN_MIN_WIDTH + v93 else v6.HEADER_DROPDOWN_MAX_WIDTH;
        v92 = if v89 then v6.HEADER_OPTIONSBUTTON_WIDTH + v6.HEADER_INNER_PADDING else 0;
    else
        v91 = v6.HEADER_DROPDOWN_MAX_WIDTH;
        v92 = 0;
    end;
    local _ = v70.onSearchOptionsToggled;
    local v95 = math.max(100, (l_props_1.maxWidth or 0) - 2 * v6.HEADER_OUTER_PADDING - v91 - v92 - v6.HEADER_INNER_PADDING);
    local v96 = v13.categoryIsGroupAsset(l_categoryName_1);
    local l_header_0 = l_Stylizer_0.header;
    local v98 = v13.getTabForCategoryName(l_categoryName_1) == v13.CREATIONS;
    local _ = v13.getTabForCategoryName(l_categoryName_1) == v13.INVENTORY;
    local v100 = v98 and not v96;
    local v101 = not v96 and not v98;
    if v13.getTabForCategoryName(l_categoryName_1) == v13.RECENT then
        v101 = false;
        v100 = true;
    end;
    local v102 = {
        LayoutOrder = 1, 
        OnSearchRequested = l_onSearchRequested_0, 
        OnTextChanged = v70.onSearchTextChanged, 
        SearchTerm = l_searchTerm_0, 
        Width = v95, 
        OnSearchOptionsToggled = v70.onSearchOptionsToggled, 
        SearchIsFiltered = l_searchIsFiltered_0, 
        ShowRecentSearchesInAutoComplete = if v32() then v70.state.searchTerm == "" or v70.state.searchTerm == nil else nil
    };
    local v103 = v3.createElement(v26, v102);
    return v3.createElement("ImageButton", {
        Position = l_props_1.Position, 
        Size = UDim2.new(1, 0, 0, v6.HEADER_HEIGHT), 
        BackgroundColor3 = l_header_0.backgroundColor, 
        BorderSizePixel = 0, 
        ZIndex = 2, 
        AutoButtonColor = false
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, v6.HEADER_OUTER_PADDING), 
            PaddingLeft = UDim.new(0, v6.HEADER_OUTER_PADDING), 
            PaddingRight = UDim.new(0, v6.HEADER_OUTER_PADDING), 
            PaddingTop = UDim.new(0, v6.HEADER_OUTER_PADDING)
        }), 
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v6.HEADER_INNER_PADDING)
        }), 
        CategoryMenu = v3.createElement(v25, {
            Disabled = l_props_1.hasTutorialLimits, 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = v100 and UDim2.new(1, 0, 1, 0) or UDim2.new(0, v91, 1, 0), 
            LayoutOrder = 0, 
            visibleDropDownCount = 8, 
            selectedDropDownIndex = v77, 
            items = v76, 
            menuKey = not v98 and "category" or nil, 
            onItemClicked = l_onCategorySelected_0
        }), 
        SearchBar = v101 and v103, 
        ToggleListViewButton = if v33() and v89 then v3.createElement(l_IconButton_0, {
            BackgroundStyle = "None", 
            Cursor = "PointingHand", 
            IconColor = l_header_0.iconColor, 
            IconSize = v6.HEADER_OPTIONSBUTTON_WIDTH, 
            LayoutOrder = 2, 
            LeftIcon = if l_props_1.layoutMode == v14.ListView then v8.GALLERY_ICON else v8.LIST_ICON, 
            OnClick = v70.toggleLayoutMode, 
            Padding = 2, 
            Size = UDim2.fromOffset(v92, v6.HEADER_OPTIONSBUTTON_HEIGHT), 
            TooltipText = if l_props_1.layoutMode == v14.ListView then l_Localization_0:getText("General", "GridView") else l_Localization_0:getText("General", "ListView")
        }) else nil, 
        GroupMenu = v96 and v3.createElement(v25, {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(0, v95, 1, 0), 
            LayoutOrder = 1, 
            visibleDropDownCount = 8, 
            selectedDropDownIndex = l_groupIndex_0, 
            items = l_groups_0, 
            menuKey = "id", 
            onItemClicked = l_onGroupSelected_0
        })
    });
end;
v36.checkRecentAssetInsertion = function(v104) --[[ Line: 404 ]] --[[ Name: checkRecentAssetInsertion ]]
    -- upvalues: v5 (copy), v9 (copy)
    if v104.mostRecentSearchRequestTime > v104.props.mostRecentAssetInsertTime then
        v5.onTermSearchedWithoutInsertion(v9.getCategory(v104.props.categoryName), v104.props.searchTerm);
    end;
end;
local function _(v105) --[[ Line: 416 ]] --[[ Name: getTabRefreshEvent ]]
    if not v105 then
        return nil;
    else
        return v105:FindFirstChild("tabRefresh");
    end;
end;
local function _(v107) --[[ Line: 424 ]] --[[ Name: getOrCreateTabRefreshEvent ]]
    local v108 = if not v107 then nil else v107:FindFirstChild("tabRefresh");
    if not v108 then
        v108 = Instance.new("BindableEvent");
        v108.Name = "tabRefresh";
        v108.Parent = v107;
    end;
    return v108;
end;
local function _(v110) --[[ Line: 434 ]] --[[ Name: destroyTabRefreshEvent ]]
    local v111 = if not v110 then nil else v110:FindFirstChild("tabRefresh");
    if v111 then
        v111:Destroy();
    end;
end;
v36.addTabRefreshCallback = function(v113) --[[ Line: 441 ]] --[[ Name: addTabRefreshCallback ]]
    if not v113.tabRefreshConnection then
        local l_pluginGui_0 = v113.props.pluginGui;
        local v115 = if not l_pluginGui_0 then nil else l_pluginGui_0:FindFirstChild("tabRefresh");
        if not v115 then
            v115 = Instance.new("BindableEvent");
            v115.Name = "tabRefresh";
            v115.Parent = l_pluginGui_0;
        end;
        v113.tabRefreshConnection = v115.Event:connect(function() --[[ Line: 444 ]]
            -- upvalues: v113 (copy)
            local l_categoryName_2 = v113.props.categoryName;
            local v117 = v113.props.Settings:get("Plugin");
            v113.props.selectCategory(v113.props.Network.networkInterface, v117, l_categoryName_2);
        end);
    end;
end;
v36.removeTabRefreshCallback = function(v118) --[[ Line: 453 ]] --[[ Name: removeTabRefreshCallback ]]
    if v118.tabRefreshConnection then
        v118.tabRefreshConnection:disconnect();
        v118.tabRefreshConnection = nil;
    end;
end;
v36.didMount = function(v119) --[[ Line: 460 ]] --[[ Name: didMount ]]
    -- upvalues: l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 (copy)
    if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then
        v119.unlocalizedCategories = v119.props.categories;
    end;
    local l_pluginGui_1 = v119.props.pluginGui;
    if not if not l_pluginGui_1 then nil else l_pluginGui_1:FindFirstChild("tabRefresh") then
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        l_BindableEvent_0.Name = "tabRefresh";
        l_BindableEvent_0.Parent = l_pluginGui_1;
    end;
    v119:addTabRefreshCallback();
end;
v36.willUnmount = function(v122) --[[ Line: 468 ]] --[[ Name: willUnmount ]]
    v122:removeTabRefreshCallback();
    local l_pluginGui_2 = v122.props.pluginGui;
    local v124 = if not l_pluginGui_2 then nil else l_pluginGui_2:FindFirstChild("tabRefresh");
    if v124 then
        v124:Destroy();
    end;
end;
v36 = l_withContext_0({
    IXP = if not not l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 or v33() or v12() then v20 else nil, 
    Settings = v23, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Network = v24
})(v36);
isSearchFiltered = function(v125) --[[ Line: 485 ]] --[[ Name: isSearchFiltered ]]
    return v125.includeUnverifiedCreators;
end;
return v4.connect(function(v126, _) --[[ Line: 489 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v13 (copy), v33 (copy)
    v126 = v126 or {};
    local v128 = v126.assets or {};
    local v129 = v126.pageInfo or {};
    return {
        categories = v129.categories or {}, 
        categoryName = v129.categoryName or v13.DEFAULT.name, 
        creatorFilter = v129.creator or {}, 
        groups = v129.groups or {}, 
        groupIndex = v129.groupIndex or 0, 
        layoutMode = if v33() then v129.layoutMode else nil, 
        mostRecentAssetInsertTime = v128.mostRecentAssetInsertTime, 
        roles = v126.roles, 
        searchId = v129.searchId, 
        searchIsFiltered = isSearchFiltered(v129), 
        searchTerm = v129.searchTerm or "", 
        hasTutorialLimits = v126.tutorialLimits.assetIds ~= nil
    };
end, function(v130) --[[ Line: 511 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v30 (copy), v31 (copy), v29 (copy), v33 (copy), v27 (copy), v28 (copy)
    return {
        selectCategory = function(v131, v132, v133) --[[ Line: 513 ]] --[[ Name: selectCategory ]]
            -- upvalues: v130 (copy), v30 (ref)
            v130(v30(v131, v132, v133));
        end, 
        selectGroup = function(v134, v135) --[[ Line: 517 ]] --[[ Name: selectGroup ]]
            -- upvalues: v130 (copy), v31 (ref)
            v130(v31(v134, v135));
        end, 
        requestSearch = function(v136, v137, v138, v139) --[[ Line: 521 ]] --[[ Name: requestSearch ]]
            -- upvalues: v130 (copy), v29 (ref)
            v130(v29(v136, v137, v138, v139, false));
        end, 
        setLayoutMode = v33() and function(v140) --[[ Line: 526 ]]
            -- upvalues: v130 (copy), v27 (ref)
            v130(v27(v140));
        end or nil, 
        updateSearchTerm = function(v141) --[[ Line: 531 ]] --[[ Name: updateSearchTerm ]]
            -- upvalues: v130 (copy), v28 (ref)
            v130(v28(v141));
        end
    };
end)(v36);