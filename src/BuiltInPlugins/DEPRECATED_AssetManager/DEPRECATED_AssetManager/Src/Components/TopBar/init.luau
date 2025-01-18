local l_Parent_0 = script.Parent.Parent.Parent;
local l_StudioAssetManagerAddRecentlyImportedView_0 = game:GetFastFlag("StudioAssetManagerAddRecentlyImportedView");
local l_EnableAssetManagerGlobalSearchBar_0 = game:GetFastFlag("EnableAssetManagerGlobalSearchBar");
local l_EnableAssetManagerSortButton_0 = game:GetFastFlag("EnableAssetManagerSortButton");
local v4 = require(l_Parent_0.Packages.Roact);
local v5 = require(l_Parent_0.Packages.RoactRodux);
local v6 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v6.UI;
local l_Button_0 = l_UI_0.Button;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_SearchBar_0 = l_UI_0.SearchBar;
local l_Util_0 = v6.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local v22 = require(l_Parent_0.Src.Actions.SetRecentViewToggled);
local v23 = require(l_Parent_0.Src.Actions.SetSearchTerm);
local v24 = require(l_Parent_0.Src.Actions.SetToPreviousScreen);
local v25 = require(l_Parent_0.Src.Actions.SetToNextScreen);
local v26 = require(l_Parent_0.Src.Actions.SetView);
local v27 = require(l_Parent_0.Src.Thunks.LaunchBulkImport);
local v28 = require(l_Parent_0.Src.Util.Screens);
local v29 = require(l_Parent_0.Src.Util.View);
local l_BulkImportService_0 = game:GetService("BulkImportService");
local l_enableBadgesCallout_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableBadgesCallout;
local v32 = l_enableBadgesCallout_0() and require(script.Parent.TeachingCallout) or nil;
local v33 = v4.PureComponent:extend("TopBar");
v33.init = function(v34) --[[ Line: 56 ]] --[[ Name: init ]]
    v34.state = {
        showSortDropdown = false
    };
    v34.OnTreeViewButtonActivated = function() --[[ Line: 61 ]]
        -- upvalues: v34 (copy)
        v34.props.OnOverlayActivated();
    end;
    v34.OnSearchRequested = function(v35) --[[ Line: 66 ]]
        -- upvalues: v34 (copy)
        local l_props_0 = v34.props;
        l_props_0.Analytics:report("search");
        l_props_0.dispatchSetSearchTerm(v35);
    end;
    v34.OnSelectSortItem = function(_, _) --[[ Line: 72 ]]
        -- upvalues: v34 (copy)
        v34:setState({
            showSortDropdown = false
        });
    end;
    v34.OnOpenSortDropdown = function() --[[ Line: 79 ]]
        -- upvalues: v34 (copy)
        v34:setState({
            showSortDropdown = true
        });
    end;
    v34.OnCloseSortDropdown = function() --[[ Line: 85 ]]
        -- upvalues: v34 (copy)
        v34:setState({
            showSortDropdown = false
        });
    end;
end;
v33.render = function(v39) --[[ Line: 92 ]] --[[ Name: render ]]
    -- upvalues: l_GetTextSize_0 (copy), v29 (copy), l_EnableAssetManagerSortButton_0 (copy), l_EnableAssetManagerGlobalSearchBar_0 (copy), v28 (copy), l_LayoutOrderIterator_0 (copy), v4 (copy), l_Button_0 (copy), l_HoverArea_0 (copy), l_Tooltip_0 (copy), l_StyleModifier_0 (copy), l_StudioAssetManagerAddRecentlyImportedView_0 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_LinkText_0 (copy), l_BulkImportService_0 (copy), l_enableBadgesCallout_0 (copy), v32 (copy), l_SearchBar_0 (copy), l_DropdownMenu_0 (copy)
    local l_props_1 = v39.props;
    local l_Analytics_0 = l_props_1.Analytics;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_TopBar_0 = l_Stylizer_0.TopBar;
    local l_Localization_0 = l_props_1.Localization;
    local l_Size_0 = l_props_1.Size;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_Enabled_0 = l_props_1.Enabled;
    local l_RecentViewToggled_0 = l_props_1.RecentViewToggled;
    local l_dispatchSetRecentViewToggled_0 = l_props_1.dispatchSetRecentViewToggled;
    local l_CurrentScreen_0 = l_props_1.CurrentScreen;
    local l_PreviousScreens_0 = l_props_1.PreviousScreens;
    local l_NextScreens_0 = l_props_1.NextScreens;
    local l_dispatchSetToPreviousScreen_0 = l_props_1.dispatchSetToPreviousScreen;
    local l_dispatchSetToNextScreen_0 = l_props_1.dispatchSetToNextScreen;
    local v55 = #l_PreviousScreens_0 > 0;
    local v56 = #l_NextScreens_0 > 0;
    local l_BulkImporterRunning_0 = l_props_1.BulkImporterRunning;
    local l_dispatchLaunchBulkImporter_0 = l_props_1.dispatchLaunchBulkImporter;
    local v59 = l_Localization_0:getText("BulkImport", "BulkImportRunning");
    local v60 = l_Localization_0:getText("BulkImport", "BulkImportShowLink");
    local v61 = l_GetTextSize_0(v59, l_TopBar_0.Tooltip.TextSize, l_Stylizer_0.Font, Vector2.new(l_TopBar_0.Tooltip.Width, 1e999));
    local v62 = l_GetTextSize_0(v60, l_TopBar_0.Tooltip.TextSize, l_Stylizer_0.Font, Vector2.new(l_TopBar_0.Tooltip.Width, 1e999));
    local v63 = v61.Y + l_TopBar_0.Tooltip.Padding + v62.Y;
    local l_View_0 = l_props_1.View;
    local l_dispatchSetView_0 = l_props_1.dispatchSetView;
    local v66 = nil;
    if l_View_0.Key == v29.GRID.Key then
        v66 = "ListViewButton";
    elseif l_View_0.Key == v29.LIST.Key then
        v66 = "GridViewButton";
    end;
    local v67 = nil;
    v67 = if l_EnableAssetManagerSortButton_0 then l_TopBar_0.Button.Size * 6 + l_TopBar_0.Padding * 2 else l_TopBar_0.Button.Size * 5 + l_TopBar_0.Padding * 4;
    local v68 = nil;
    local v69 = nil;
    if l_EnableAssetManagerGlobalSearchBar_0 then
        v68 = true;
        v69 = if l_CurrentScreen_0.Path ~= v28.MAIN.Path then l_Localization_0:getText("SearchBar", "PlaceholderText") .. " " .. l_Localization_0:getText("Folders", l_CurrentScreen_0.Path) else l_Localization_0:getText("SearchBar", "GlobalPlaceholderText");
    else
        v68 = l_CurrentScreen_0.Path ~= v28.MAIN.Path;
        v69 = l_Localization_0:getText("SearchBar", "PlaceholderText") .. " " .. l_Localization_0:getText("Folders", l_CurrentScreen_0.Path);
    end;
    local v70 = l_LayoutOrderIterator_0.new();
    local v71 = l_Localization_0:getText("TopBar", "ExplorerOverlayButton");
    local v72 = l_Localization_0:getText("TopBar", "BackButton");
    local v73 = l_Localization_0:getText("TopBar", "ForwardButton");
    local v74 = l_Localization_0:getText("TopBar", "BulkImportButton");
    local v75 = nil;
    if l_View_0.Key == v29.GRID.Key then
        v75 = l_Localization_0:getText("TopBar", "ListViewButton");
    elseif l_View_0.Key == v29.LIST.Key then
        v75 = l_Localization_0:getText("TopBar", "GridViewButton");
    end;
    local v76 = nil;
    local v77 = nil;
    local v78 = nil;
    local v79 = nil;
    local v80 = nil;
    if l_EnableAssetManagerSortButton_0 then
        v76 = l_Localization_0:getText("TopBar", "SortButton");
        v77 = l_Localization_0:getText("SortOption", "RecentlyAdded");
        v78 = l_Localization_0:getText("SortOption", "RecentlyUsed");
        v79 = l_Localization_0:getText("SortOption", "AscendingName");
        v80 = l_Localization_0:getText("SortOption", "DescendingName");
    end;
    return v4.createElement("Frame", {
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundColor3 = l_Stylizer_0.BackgroundColor, 
        BorderColor3 = l_Stylizer_0.BorderColor, 
        BorderSizePixel = 1
    }, {
        TopBarLayout = v4.createElement("UIListLayout", {
            Padding = UDim.new(0, l_TopBar_0.Padding), 
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = v4.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_TopBar_0.Padding), 
            PaddingRight = UDim.new(0, l_TopBar_0.Padding)
        }), 
        ExplorerOverlayButton = v4.createElement(l_Button_0, {
            Size = UDim2.new(0, l_TopBar_0.Button.Size, 0, l_TopBar_0.Button.Size), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LayoutOrder = v70:getNextOrder(), 
            Style = "OverlayButton", 
            OnClick = function() --[[ Line: 223 ]] --[[ Name: OnClick ]]
                -- upvalues: l_Enabled_0 (copy), v39 (copy)
                if l_Enabled_0 then
                    v39.OnTreeViewButtonActivated();
                end;
            end
        }, {
            HoverArea = l_Enabled_0 and v4.createElement(l_HoverArea_0, {
                Cursor = "PointingHand", 
                MouseEnter = v39.mouseEnter, 
                MouseLeave = v39.mouseLeave
            }), 
            Tooltip = l_Enabled_0 and v4.createElement(l_Tooltip_0, {
                Text = v71, 
                Enabled = true
            })
        }), 
        NavigationButtonsFrame = v4.createElement("Frame", {
            Size = UDim2.new(0, 2 * l_TopBar_0.Button.Size, 0, l_TopBar_0.Button.Size), 
            BackgroundTransparency = 1, 
            LayoutOrder = v70:getNextOrder()
        }, {
            ButtonLayout = v4.createElement("UIListLayout", {
                Padding = UDim.new(0, 0), 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            PreviousButton = v4.createElement(l_Button_0, {
                Size = UDim2.new(0, l_TopBar_0.Button.Size, 0, l_TopBar_0.Button.Size), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                LayoutOrder = 1, 
                Style = "PreviousButton", 
                StyleModifier = not v55 and l_StyleModifier_0.Disabled, 
                OnClick = function() --[[ Line: 260 ]] --[[ Name: OnClick ]]
                    -- upvalues: v55 (copy), l_Enabled_0 (copy), l_dispatchSetToPreviousScreen_0 (copy), l_StudioAssetManagerAddRecentlyImportedView_0 (ref), l_RecentViewToggled_0 (copy), l_dispatchSetRecentViewToggled_0 (copy)
                    if v55 and l_Enabled_0 then
                        l_dispatchSetToPreviousScreen_0(v55);
                        if l_StudioAssetManagerAddRecentlyImportedView_0 and l_RecentViewToggled_0 then
                            l_dispatchSetRecentViewToggled_0(false);
                        end;
                    end;
                end
            }, {
                HoverArea = v55 and l_Enabled_0 and v4.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand", 
                    MouseEnter = v39.mouseEnter, 
                    MouseLeave = v39.mouseLeave
                }), 
                Tooltip = v55 and l_Enabled_0 and v4.createElement(l_Tooltip_0, {
                    Text = v72, 
                    Enabled = true
                })
            }), 
            NextButton = v4.createElement(l_Button_0, {
                Size = UDim2.new(0, l_TopBar_0.Button.Size, 0, l_TopBar_0.Button.Size), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                LayoutOrder = 2, 
                Style = "NextButton", 
                StyleModifier = not v56 and l_StyleModifier_0.Disabled, 
                OnClick = function() --[[ Line: 289 ]] --[[ Name: OnClick ]]
                    -- upvalues: v56 (copy), l_Enabled_0 (copy), l_dispatchSetToNextScreen_0 (copy), l_StudioAssetManagerAddRecentlyImportedView_0 (ref), l_RecentViewToggled_0 (copy), l_dispatchSetRecentViewToggled_0 (copy)
                    if v56 and l_Enabled_0 then
                        l_dispatchSetToNextScreen_0(v56);
                        if l_StudioAssetManagerAddRecentlyImportedView_0 and l_RecentViewToggled_0 then
                            l_dispatchSetRecentViewToggled_0(false);
                        end;
                    end;
                end
            }, {
                HoverArea = v56 and l_Enabled_0 and v4.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand", 
                    MouseEnter = v39.mouseEnter, 
                    MouseLeave = v39.mouseLeave
                }), 
                Tooltip = v56 and l_Enabled_0 and v4.createElement(l_Tooltip_0, {
                    Text = v73, 
                    Enabled = true
                })
            })
        }), 
        BulkImporterButton = v4.createElement(l_Button_0, {
            Size = UDim2.new(0, l_TopBar_0.Button.Size, 0, l_TopBar_0.Button.Size), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LayoutOrder = v70:getNextOrder(), 
            Style = "BulkImporterButton", 
            StyleModifier = l_BulkImporterRunning_0 and l_StyleModifier_0.Disabled, 
            OnClick = function() --[[ Line: 319 ]] --[[ Name: OnClick ]]
                -- upvalues: l_BulkImporterRunning_0 (copy), l_Enabled_0 (copy), l_Analytics_0 (copy), l_dispatchLaunchBulkImporter_0 (copy)
                if not l_BulkImporterRunning_0 and l_Enabled_0 then
                    l_Analytics_0:report("clickBulkImportButton");
                    l_dispatchLaunchBulkImporter_0(0);
                end;
            end
        }, {
            OpenBulkImporterTooltip = v4.createElement(l_Tooltip_0, {
                Content = v4.createElement(l_Pane_0, {
                    Layout = Enum.FillDirection.Vertical, 
                    Spacing = l_TopBar_0.Tooltip.Padding, 
                    Style = "Box"
                }, {
                    TextLabel = v4.createElement(l_TextLabel_0, {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Font = l_Stylizer_0.Font, 
                        LayoutOrder = 1, 
                        Size = UDim2.fromScale(1, 0), 
                        Text = v59, 
                        TextSize = l_TopBar_0.Tooltip.TextSize, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }), 
                    LinkText = v4.createElement(l_LinkText_0, {
                        LayoutOrder = 2, 
                        Style = "BulkImporterTooltip", 
                        Text = v60, 
                        OnClick = function() --[[ Line: 348 ]] --[[ Name: OnClick ]]
                            -- upvalues: l_BulkImportService_0 (ref)
                            l_BulkImportService_0:ShowBulkImportView();
                        end
                    })
                }), 
                ContentExtents = Vector2.new(l_TopBar_0.Tooltip.Width, v63), 
                Enabled = l_BulkImporterRunning_0
            }), 
            HoverArea = not l_BulkImporterRunning_0 and l_Enabled_0 and v4.createElement(l_HoverArea_0, {
                Cursor = "PointingHand", 
                MouseEnter = v39.mouseEnter, 
                MouseLeave = v39.mouseLeave
            }), 
            BulkImportButtonTooltip = not l_BulkImporterRunning_0 and l_Enabled_0 and v4.createElement(l_Tooltip_0, {
                Text = v74, 
                Enabled = true
            })
        }), 
        GridListToggleButton = v4.createElement(l_Button_0, {
            Size = UDim2.new(0, l_TopBar_0.Button.Size, 0, l_TopBar_0.Button.Size), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LayoutOrder = v70:getNextOrder(), 
            Style = v66, 
            StyleModifier = l_BulkImporterRunning_0 and l_StyleModifier_0.Disabled, 
            OnClick = function() --[[ Line: 377 ]] --[[ Name: OnClick ]]
                -- upvalues: l_View_0 (copy), v29 (ref), l_dispatchSetView_0 (copy)
                if l_View_0.Key == v29.GRID.Key then
                    l_dispatchSetView_0(v29.LIST);
                    return;
                else
                    if l_View_0.Key == v29.LIST.Key then
                        l_dispatchSetView_0(v29.GRID);
                    end;
                    return;
                end;
            end
        }, {
            HoverArea = not l_BulkImporterRunning_0 and l_Enabled_0 and v4.createElement(l_HoverArea_0, {
                Cursor = "PointingHand", 
                MouseEnter = v39.mouseEnter, 
                MouseLeave = v39.mouseLeave
            }), 
            Tooltip = l_Enabled_0 and v4.createElement(l_Tooltip_0, {
                Text = v75, 
                Enabled = true
            }), 
            TeachingCallout = l_enableBadgesCallout_0() and v4.createElement(v32, {
                DefinitionId = "AssetManagerBadgesDevProductCallout", 
                LocationId = "GridListToggleButton"
            })
        }), 
        SearchBar = if not l_EnableAssetManagerSortButton_0 and v68 then v4.createElement(l_SearchBar_0, {
            Size = UDim2.new(1, -v67, 1, -2), 
            LayoutOrder = v70:getNextOrder(), 
            Disabled = not l_Enabled_0, 
            Style = "Compact", 
            ShowSearchIcon = true, 
            ShowSearchButton = false, 
            PlaceholderText = v69, 
            IncrementalTextSearch = true, 
            IncrementalTextSearchDelay = 0, 
            OnSearchRequested = v39.OnSearchRequested
        }) else nil, 
        SearchSortFrame = if l_EnableAssetManagerSortButton_0 then v4.createElement(l_Pane_0, {
            Size = UDim2.new(1, -v67, 0, l_TopBar_0.Button.Size), 
            BackgroundTransparency = 1, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v70:getNextOrder()
        }, {
            SearchBar = v68 and v4.createElement(l_SearchBar_0, {
                Size = UDim2.new(1, -l_TopBar_0.Button.Size, 1, -2), 
                LayoutOrder = 1, 
                Disabled = not l_Enabled_0, 
                Style = "Compact", 
                ShowSearchIcon = true, 
                ShowSearchButton = false, 
                PlaceholderText = v69, 
                IncrementalTextSearch = true, 
                IncrementalTextSearchDelay = 0, 
                OnSearchRequested = v39.OnSearchRequested
            }), 
            SortButton = v4.createElement(l_Button_0, {
                Size = UDim2.new(0, l_TopBar_0.Button.Size, 0, l_TopBar_0.Button.Size), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                LayoutOrder = 2, 
                Style = "SortButton", 
                StyleModifier = v39.state.showSortDropdown and l_StyleModifier_0.Selected, 
                OnClick = function() --[[ Line: 455 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_Enabled_0 (copy), v39 (copy)
                    if l_Enabled_0 then
                        v39.OnOpenSortDropdown();
                    end;
                end
            }, {
                Menu = v4.createElement(l_DropdownMenu_0, {
                    Hide = not v39.state.showSortDropdown, 
                    Items = {
                        v77, 
                        v78, 
                        v79, 
                        v80
                    }, 
                    OnItemActivated = v39.OnSelectSortItem, 
                    OnFocusLost = v39.OnCloseSortDropdown
                }), 
                HoverArea = l_Enabled_0 and v4.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand", 
                    MouseEnter = v39.mouseEnter, 
                    MouseLeave = v39.mouseLeave
                }), 
                Tooltip = l_Enabled_0 and v4.createElement(l_Tooltip_0, {
                    Text = v76, 
                    Enabled = true
                })
            })
        }) else nil
    });
end;
v33 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v33);
return v5.connect(function(v81, _) --[[ Line: 495 ]] --[[ Name: mapStateToProps ]]
    local l_previousScreens_0 = v81.Screen.previousScreens;
    local l_nextScreens_0 = v81.Screen.nextScreens;
    return {
        BulkImporterRunning = v81.AssetManagerReducer.bulkImporterRunning, 
        CurrentScreen = v81.Screen.currentScreen, 
        PreviousScreens = l_previousScreens_0, 
        NextScreens = l_nextScreens_0, 
        RecentViewToggled = v81.AssetManagerReducer.recentViewToggled, 
        View = v81.AssetManagerReducer.view
    };
end, function(v85) --[[ Line: 509 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v27 (copy), v22 (copy), v23 (copy), v24 (copy), v25 (copy), v26 (copy)
    return {
        dispatchLaunchBulkImporter = function(v86) --[[ Line: 511 ]] --[[ Name: dispatchLaunchBulkImporter ]]
            -- upvalues: v85 (copy), v27 (ref)
            v85(v27(v86));
        end, 
        dispatchSetRecentViewToggled = function(v87) --[[ Line: 514 ]] --[[ Name: dispatchSetRecentViewToggled ]]
            -- upvalues: v85 (copy), v22 (ref)
            v85(v22(v87));
        end, 
        dispatchSetSearchTerm = function(v88) --[[ Line: 517 ]] --[[ Name: dispatchSetSearchTerm ]]
            -- upvalues: v85 (copy), v23 (ref)
            v85(v23(v88));
        end, 
        dispatchSetToPreviousScreen = function(v89) --[[ Line: 520 ]] --[[ Name: dispatchSetToPreviousScreen ]]
            -- upvalues: v85 (copy), v24 (ref)
            if v89 then
                v85(v24());
            end;
        end, 
        dispatchSetToNextScreen = function(v90) --[[ Line: 525 ]] --[[ Name: dispatchSetToNextScreen ]]
            -- upvalues: v85 (copy), v25 (ref)
            if v90 then
                v85(v25());
            end;
        end, 
        dispatchSetView = function(v91) --[[ Line: 530 ]] --[[ Name: dispatchSetView ]]
            -- upvalues: v85 (copy), v26 (ref)
            v85(v26(v91));
        end
    };
end)(v33);