local l_RunService_0 = game:GetService("RunService");
local l_game_FastInt_0 = game:GetFastInt("ToolboxAutocompleteDropdownSize");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v4 = require(l_Packages_0.Roact);
local v5 = require(l_Packages_0.RoactRodux);
local v6 = require(l_Parent_0.Core.Util.Analytics.Analytics);
local v7 = require(l_Parent_0.Core.Types.Category);
local v8 = require(l_Parent_0.Core.Util.ToolboxUtilities);
local v9 = require(l_Parent_0.Core.Networking.Requests.GetAutocompleteResultsRequest);
local _ = require(l_Parent_0.Core.Thunks.LogMarketplaceSearchAnalytics);
local v11 = require(l_Parent_0.Core.Thunks.LogMarketplaceAutocompleteSearchAnalytics);
local v12 = require(l_Packages_0.Framework);
local l_UI_0 = v12.UI;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_SearchBar_0 = l_UI_0.SearchBar;
local l_ContextServices_0 = v12.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v18 = require(l_Parent_0.Core.ContextServices.IXPContext);
local v19 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v20 = require(l_Parent_0.Core.Types.AutocorrectTypes);
local v21 = require(l_Parent_0.Core.Components.DropdownMenuItem);
local v22 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddRecentSearchesToAutoComplete);
local v23 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAutocorrect);
local v24 = require(l_Parent_0.Core.Util.SharedFlags.getIsIXPEnabledForListView);
local v25 = {};
local function _(v26) --[[ Line: 58 ]] --[[ Name: isOnlySpaces ]]
    return v26:match("^%s*$") ~= nil;
end;
local v28 = v4.PureComponent:extend("SearchBarWithAutocomplete");
v28.init = function(v29) --[[ Line: 64 ]] --[[ Name: init ]]
    -- upvalues: v22 (copy), v25 (copy), v23 (copy), v4 (copy), v21 (copy), v6 (copy), v7 (copy)
    if v22() then
        v29.getRecentSearches = function() --[[ Line: 66 ]]
            -- upvalues: v29 (copy), v25 (ref)
            local l_Plugin_0 = v29.props.Plugin;
            if l_Plugin_0 then
                local v31 = l_Plugin_0:get();
                local l_v31_Setting_0 = v31:GetSetting("RecentSearchesCache");
                if not l_v31_Setting_0 then
                    v31:SetSetting("RecentSearchesCache", v25);
                    l_v31_Setting_0 = v31:GetSetting("RecentSearchesCache");
                end;
                if l_v31_Setting_0 then
                    return l_v31_Setting_0;
                else
                    return {};
                end;
            else
                return;
            end;
        end;
    end;
    v29.state = {
        showAutocompleteResults = false, 
        displayedSearchTerm = "", 
        lastSearchTerm = "", 
        dropdownMenuRenderItems = if v22() then v25 else nil
    };
    v29.isUserInputting = false;
    v29.autocompleteTimer = 0;
    v29.keyCount = 0;
    v29.deleteCount = 0;
    v29.onInputBegan = function() --[[ Line: 97 ]]
        -- upvalues: v29 (copy)
        v29.isUserInputting = true;
    end;
    v29.onInputEnded = function() --[[ Line: 101 ]]
        -- upvalues: v29 (copy)
        v29.isUserInputting = false;
    end;
    v29.onSearchTextChanged = function(v33) --[[ Line: 105 ]]
        -- upvalues: v22 (ref), v29 (copy), v23 (ref)
        if v22() then
            local l_props_0 = v29.props;
            if l_props_0.OnTextChanged then
                l_props_0.OnTextChanged(v33);
            end;
        end;
        if v33 ~= v29.state.displayedSearchTerm then
            if string.len(v33) > string.len(v29.state.displayedSearchTerm) then
                local l_v29_0 = v29;
                l_v29_0.keyCount = l_v29_0.keyCount + 1;
            elseif string.len(v33) < string.len(v29.state.displayedSearchTerm) then
                local l_v29_1 = v29;
                l_v29_1.deleteCount = l_v29_1.deleteCount + 1;
            end;
            if v23() then
                v29:setState(function() --[[ Line: 120 ]]
                    -- upvalues: v33 (copy), v29 (ref)
                    local v37 = if v33 ~= nil and v33 ~= v29.props.autocorrectOfferedQuery then string.len(v33) > 0 else nil;
                    return {
                        displayedSearchTerm = v33, 
                        showAutocompleteResults = v37
                    };
                end);
                return;
            else
                v29:setState({
                    showAutocompleteResults = string.len(v33) > 0, 
                    displayedSearchTerm = v33
                });
            end;
        end;
    end;
    if v22() then
        v29.onRecentSearchesRenderItem = function(v38, v39, v40) --[[ Line: 140 ]]
            -- upvalues: v29 (copy)
            if v39 == 1 then
                return v29.renderRecentSearchesDropdownMenuHeader(v38);
            else
                return v29.renderRecentSearchesDropdownMenuItem(v38, v39, v40);
            end;
        end;
    end;
    v29.onAutocompleteRenderItem = function(v41, v42, v43) --[[ Line: 149 ]]
        -- upvalues: v22 (ref), v29 (copy), v4 (ref), v21 (ref)
        if v22() and v29.props.ShowRecentSearchesInAutoComplete then
            return v29.onRecentSearchesRenderItem(v41, v42, v43);
        else
            return v4.createElement(v21, {
                FocusedText = v29.state.displayedSearchTerm, 
                HideSeparator = v42 == #v29.props.autocompleteResults, 
                LayoutOrder = v42, 
                OnClick = v43, 
                Size = UDim2.new(1, 0, 0, 32), 
                Text = v41
            });
        end;
    end;
    v29.onItemActivated = function(v44, _) --[[ Line: 164 ]]
        -- upvalues: v29 (copy), v6 (ref), v7 (ref)
        v29.props.OnSearchRequested(v44);
        if v29.props.ShowRecentSearchesInAutoComplete then
            v6.MarketplaceRecentSearchClicked(v44);
        else
            v29.props.logAutocompleteSearchAnalytics(v44, v7.AUTOCOMPLETE_API_NAMES[v29.props.categoryName], v29.state.displayedSearchTerm, v29.keyCount, v29.deleteCount, true);
        end;
        v29.keyCount = 0;
        v29.deleteCount = 0;
        v29:setState({
            displayedSearchTerm = v44
        });
    end;
    if v22() then
        v29.clearAllRecentSearches = function() --[[ Line: 186 ]]
            -- upvalues: v29 (copy), v25 (ref)
            v29.updateRecentSearches(v25);
        end;
        v29.tryCacheSearchTerm = function(v46) --[[ Line: 190 ]]
            -- upvalues: v29 (copy)
            if v46:match("^%s*$") ~= nil then
                return;
            else
                local v47 = v29.getRecentSearches();
                if not table.find(v47, v46) then
                    table.insert(v47, 1, v46);
                    v29.updateRecentSearches(v47);
                end;
                return;
            end;
        end;
        v29.removeSearchTermFromCache = function(v48) --[[ Line: 205 ]]
            -- upvalues: v29 (copy)
            local v49 = v29.getRecentSearches();
            local v50 = table.find(v49, v48);
            if v50 then
                table.remove(v49, v50);
                v29.updateRecentSearches(v49);
            end;
        end;
    end;
    v29.onSearchRequested = function(v51) --[[ Line: 218 ]]
        -- upvalues: v29 (copy), v7 (ref), v22 (ref)
        v29.props.OnSearchRequested(v51);
        if v51 ~= v29.state.displayedSearchTerm then
            v29.props.logAutocompleteSearchAnalytics(v51, v7.AUTOCOMPLETE_API_NAMES[v29.props.categoryName], nil, v29.keyCount, v29.deleteCount, true);
        end;
        v29.keyCount = 0;
        v29.deleteCount = 0;
        v29:setState({
            showAutocompleteResults = false
        });
        if v22() then
            v29.tryCacheSearchTerm(v51);
        end;
    end;
    v29.closeAutocomplete = function() --[[ Line: 242 ]]
        -- upvalues: v29 (copy)
        v29:setState({
            showAutocompleteResults = false
        });
    end;
    if v22() then
        if v29.props.ShowRecentSearchesInAutoComplete then
            v29.onTextBoxFocusGained = function() --[[ Line: 250 ]]
                -- upvalues: v29 (copy)
                v29:setState({
                    showAutocompleteResults = true
                });
            end;
        end;
        v29.updateRecentSearches = function(v52) --[[ Line: 257 ]]
            -- upvalues: v29 (copy)
            v29.props.Plugin:get():SetSetting("RecentSearchesCache", v52);
            local v53 = nil;
            v53 = {
                v29.props.Localization:getText("General", "RecentSearches")
            };
            for _, v55 in v52 do
                table.insert(v53, v55);
            end;
            v29:setState({
                dropdownMenuRenderItems = v53
            });
        end;
        v29.renderRecentSearchesDropdownMenuHeader = function(v56) --[[ Line: 277 ]]
            -- upvalues: v4 (ref), v21 (ref), v29 (copy)
            return v4.createElement(v21, {
                DisableHover = true, 
                FocusedText = "", 
                Size = UDim2.new(1, 0, 0, 28), 
                Text = v56, 
                OnClick = function() --[[ Line: 283 ]] --[[ Name: OnClick ]]

                end, 
                DropdownMenuItemButtonStyle = "ToolboxRecentSearchesButton", 
                ItemButtonContentOverride = v4.createElement("TextButton", {
                    BackgroundTransparency = 1, 
                    Text = v29.props.Localization:getText("General", "SearchResultsClearAll"), 
                    TextColor3 = v29.props.Stylizer.linkButton.textColor, 
                    Position = UDim2.new(1, -14, 0.5, 0), 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    LayoutOrder = 3, 
                    Size = UDim2.fromOffset(32, 20), 
                    TextScaled = true, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextXAlignment = Enum.TextXAlignment.Right, 
                    [v4.Event.MouseButton1Click] = function() --[[ Line: 296 ]]
                        -- upvalues: v29 (ref)
                        v29.clearAllRecentSearches();
                    end
                })
            });
        end;
        v29.renderRecentSearchesDropdownMenuItem = function(v57, v58, v59) --[[ Line: 303 ]]
            -- upvalues: v4 (ref), v29 (copy), v21 (ref)
            local v60, v61 = v4.createBinding("rbxasset://textures/StudioToolbox/Clear.png");
            local v62, v63 = v4.createBinding(v29.props.Stylizer.recentSearchesCloseButton.backgroundColor);
            return v4.createElement(v21, {
                HideSeparator = true, 
                EnableClearButton = true, 
                LayoutOrder = v58, 
                OnClick = v59, 
                Size = UDim2.new(1, 0, 0, 28), 
                Text = v57, 
                DropdownMenuItemButtonStyle = "ToolboxRecentSearchesButton", 
                OnMouseEnter = function() --[[ Line: 316 ]] --[[ Name: OnMouseEnter ]]
                    -- upvalues: v63 (copy), v29 (ref), v61 (copy)
                    v63(v29.props.Stylizer.recentSearchesCloseButton.hoverColor);
                    v61("rbxasset://textures/StudioToolbox/ClearHover.png");
                end, 
                OnMouseLeave = function() --[[ Line: 320 ]] --[[ Name: OnMouseLeave ]]
                    -- upvalues: v63 (copy), v29 (ref), v61 (copy)
                    v63(v29.props.Stylizer.recentSearchesCloseButton.backgroundColor);
                    v61("rbxasset://textures/StudioToolbox/Clear.png");
                end, 
                ItemButtonContentOverride = v4.createElement("ImageButton", {
                    BackgroundTransparency = 1, 
                    Image = v60, 
                    Position = UDim2.new(1, -14, 0.5, 0), 
                    AnchorPoint = Vector2.new(1, 0.5), 
                    ImageColor3 = v62, 
                    LayoutOrder = 3, 
                    Size = UDim2.fromOffset(14, 14), 
                    [v4.Event.MouseButton1Click] = function() --[[ Line: 332 ]]
                        -- upvalues: v29 (ref), v57 (copy)
                        v29.removeSearchTermFromCache(v57);
                    end
                })
            });
        end;
    end;
end;
v28.didMount = function(v64) --[[ Line: 341 ]] --[[ Name: didMount ]]
    -- upvalues: v8 (copy), v22 (copy), l_RunService_0 (copy), v7 (copy), l_game_FastInt_0 (copy)
    if v8.getShouldDisableAutocomplete() then
        return;
    else
        if v22() and v64.props.ShowRecentSearchesInAutoComplete then
            v64.updateRecentSearches(v64.getRecentSearches());
        end;
        local l_networkInterface_0 = v64.props.Network.networkInterface;
        v64.runServiceConnection = l_RunService_0.RenderStepped:Connect(function(v66) --[[ Line: 352 ]]
            -- upvalues: v64 (copy), v7 (ref), l_networkInterface_0 (copy), l_game_FastInt_0 (ref)
            local l_displayedSearchTerm_0 = v64.state.displayedSearchTerm;
            if v64.state.showAutocompleteResults and v64.state.lastSearchTerm ~= l_displayedSearchTerm_0 then
                v64.autocompleteTimer = v64.autocompleteTimer + v66;
                if v64.isUserInputting then
                    v64.autocompleteTimer = 0;
                end;
                if v64.autocompleteTimer > 0.12 and l_displayedSearchTerm_0 ~= "" then
                    local v68 = v7.AUTOCOMPLETE_API_NAMES[v64.props.categoryName];
                    v64.props.getAutocompleteResults(l_networkInterface_0, v68, l_displayedSearchTerm_0, l_game_FastInt_0);
                    v64.autocompleteTimer = 0;
                    v64:setState({
                        lastSearchTerm = l_displayedSearchTerm_0
                    });
                end;
            end;
            if l_displayedSearchTerm_0 == "" and v64.state.lastSearchTerm ~= "" then
                local v69 = v7.AUTOCOMPLETE_API_NAMES[v64.props.categoryName];
                v64.props.getAutocompleteResults(l_networkInterface_0, v69, l_displayedSearchTerm_0, l_game_FastInt_0);
                v64.autocompleteTimer = 0;
                v64:setState({
                    lastSearchTerm = l_displayedSearchTerm_0
                });
            end;
        end);
        return;
    end;
end;
v28.willUnmount = function(v70) --[[ Line: 389 ]] --[[ Name: willUnmount ]]
    if v70.runServiceConnection then
        v70.runServiceConnection:Disconnect();
        v70.runServiceConnection = nil;
    end;
end;
v28.didUpdate = function(v71, v72, _) --[[ Line: 396 ]] --[[ Name: didUpdate ]]
    if v72.searchTerm ~= v71.props.searchTerm then
        v71:setState({
            displayedSearchTerm = v71.props.searchTerm, 
            lastSearchTerm = v71.props.searchTerm
        });
    end;
end;
v28.render = function(v74) --[[ Line: 406 ]] --[[ Name: render ]]
    -- upvalues: v22 (copy), v7 (copy), v24 (copy), v4 (copy), l_SearchBar_0 (copy), l_DropdownMenu_0 (copy)
    local l_props_1 = v74.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_displayedSearchTerm_1 = v74.state.displayedSearchTerm;
    local v78 = if v22() then v74.props.ShowRecentSearchesInAutoComplete else nil;
    local v79 = v7.getTabForCategoryName(l_props_1.categoryName) == v7.MARKETPLACE;
    local v80 = v24(l_props_1.IXP) or v79;
    local v81 = {
        LayoutOrder = l_props_1.LayoutOrder, 
        OnInputBegan = v74.onInputBegan, 
        OnTextBoxFocusGained = if v22() then v74.onTextBoxFocusGained else nil, 
        OnInputEnded = v74.onInputEnded, 
        OnSearchRequested = v74.onSearchRequested, 
        OnTextChanged = v74.onSearchTextChanged, 
        OnSearchOptionsToggled = l_props_1.OnSearchOptionsToggled, 
        SearchIsFiltered = l_props_1.SearchIsFiltered, 
        ShowSearchButton = false, 
        ShowFilterButton = v80, 
        ShowSearchIcon = true, 
        PlaceholderText = l_props_1.Localization:getText("General", "SearchBarDefaultText"), 
        SearchTerm = l_displayedSearchTerm_1, 
        Style = "ToolboxSearchBar", 
        Width = l_props_1.Width
    };
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = 1, 
        Size = UDim2.new(0, l_props_1.Width, 1, 0)
    }, {
        TutorialStroke = if l_props_1.hasTutorialLimits and l_props_1.searchTerm == "" then v4.createElement("UIStroke", {
            Thickness = l_Stylizer_0.asset.strokeThickness, 
            Color = l_Stylizer_0.asset.strokeColor
        }) else nil, 
        TutorialCorner = if l_props_1.hasTutorialLimits and l_props_1.searchTerm == "" then v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, 3)
        }) else nil, 
        SearchBar = v4.createElement(l_SearchBar_0, v81), 
        AutocompleteDropdown = if v22() and v78 then v4.createElement(l_DropdownMenu_0, {
            Hide = not v74.state.showAutocompleteResults or #v74.state.dropdownMenuRenderItems == 1, 
            Items = v74.state.dropdownMenuRenderItems, 
            OnFocusLost = v74.closeAutocomplete, 
            OnItemActivated = v74.onItemActivated, 
            OnRenderItem = v74.onAutocompleteRenderItem, 
            Priority = 2, 
            Style = "ToolboxSearchBarDropdown", 
            Width = l_props_1.Width
        }) else v4.createElement(l_DropdownMenu_0, {
            Hide = not v74.state.showAutocompleteResults or #l_props_1.autocompleteResults == 0, 
            Items = l_props_1.autocompleteResults, 
            OnFocusLost = v74.closeAutocomplete, 
            OnItemActivated = v74.onItemActivated, 
            OnRenderItem = v74.onAutocompleteRenderItem, 
            Priority = 2, 
            Style = "ToolboxSearchBarDropdown", 
            Width = l_props_1.Width
        })
    });
end;
v28 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Network = v19, 
    Plugin = if v22() then l_ContextServices_0.Plugin else nil, 
    Stylizer = l_ContextServices_0.Stylizer, 
    IXP = v18
})(v28);
return v5.connect(function(v82, _) --[[ Line: 487 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v20 (copy), v7 (copy), v23 (copy)
    v82 = v82 or {};
    local v84 = v82.pageInfo or {};
    local l_correctionState_0 = v84.correctionState;
    local v86 = nil;
    v86 = if l_correctionState_0 == v20.AutocorrectResponseState.CorrectionAvailable then v84.correctedQuery else if l_correctionState_0 == v20.AutocorrectResponseState.CorrectionAccepted then v84.userQuery else "";
    return {
        autocompleteResults = v82.autocompleteResults and v82.autocompleteResults.autocompleteResults or {}, 
        categoryName = v84.categoryName or v7.DEFAULT.name, 
        searchTerm = v84.searchTerm or "", 
        searchId = v84.searchId or "", 
        autocorrectOfferedQuery = if v23() then v86 else nil, 
        hasTutorialLimits = v82.tutorialLimits.assetIds ~= nil
    };
end, function(v87) --[[ Line: 511 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v11 (copy), v9 (copy)
    return {
        logAutocompleteSearchAnalytics = function(v88, v89, v90, v91, v92, v93) --[[ Line: 513 ]] --[[ Name: logAutocompleteSearchAnalytics ]]
            -- upvalues: v87 (copy), v11 (ref)
            v87(v11(v88, v89, v90, v91, v92, v93, false));
        end, 
        getAutocompleteResults = function(v94, v95, v96, v97) --[[ Line: 527 ]] --[[ Name: getAutocompleteResults ]]
            -- upvalues: v87 (copy), v9 (ref)
            v87(v9(v94, v95, v96, v97));
        end
    };
end)(v28);