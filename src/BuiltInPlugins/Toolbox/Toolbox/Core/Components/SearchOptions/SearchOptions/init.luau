local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.RoactRodux);
local v5 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v7 = require(l_Util_0.Constants);
local v8 = require(l_Util_0.Images);
local v9 = require(l_Util_0.debounce);
local _ = require(l_Parent_0.Core.Components.createFitToContent);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v13 = require(l_Parent_0.Core.ContextServices.Settings);
local v14 = require(l_Parent_0.Core.ContextServices.ModalContext);
local v15 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v16 = require(l_Parent_0.Core.Components.SearchOptions.LiveSearchBar);
local l_RadioButtonList_0 = require(l_Packages_0.Framework).UI.RadioButtonList;
local l_UI_0 = v5.UI;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_ShowOnTop_0 = l_UI_0.ShowOnTop;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_Tooltip_0 = l_UI_0.Tooltip;
local v26 = require(l_Parent_0.Core.Components.Audio.AudioSearch);
local v27 = require(l_Parent_0.Core.Components.SearchOptions.SearchOptionsEntry);
local v28 = require(l_Parent_0.Core.Components.SearchOptions.SearchOptionsFooter);
local l_getShouldHideNonRelevanceSorts_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).getShouldHideNonRelevanceSorts;
local l_Separator_0 = l_UI_0.Separator;
local v31 = require(l_Parent_0.Core.Networking.Requests.SearchWithOptions);
local v32 = require(l_Parent_0.Core.Networking.Requests.UserSearchRequest);
local l_showRobloxCreatedAssets_0 = require(l_Parent_0.Core.Util.ToolboxUtilities).showRobloxCreatedAssets;
local v34 = require(l_Parent_0.Core.Types.Category);
local l_game_FastInt_0 = game:GetFastInt("ToolboxLiveSearchDebounceWait");
local v36 = v3.PureComponent:extend("SearchOptions");
if v1() then
    return nil;
else
    v36.defaultProps = {
        showCreatorSearch = true
    };
    v36.init = function(v37, v38) --[[ Line: 81 ]] --[[ Name: init ]]
        -- upvalues: v3 (copy), v7 (copy), v9 (copy), l_game_FastInt_0 (copy)
        v37.layoutRef = v3.createRef();
        v37.containerRef = v3.createRef();
        v37.buttonsContainerRef = v3.createRef();
        v37.currentLayout = 0;
        v37.searchTerm = v38.LiveSearchData.searchTerm;
        v37.extraSearchDetails = {};
        local l_audioSearchInfo_0 = v37.props.audioSearchInfo;
        local l_includeUnverifiedCreators_0 = v37.props.includeUnverifiedCreators;
        v37.state = {
            minDuration = l_audioSearchInfo_0 and l_audioSearchInfo_0.minDuration or v7.MIN_AUDIO_SEARCH_DURATION, 
            maxDuration = l_audioSearchInfo_0 and l_audioSearchInfo_0.maxDuration or v7.MAX_AUDIO_SEARCH_DURATION, 
            SortIndex = nil, 
            includeUnverifiedCreators = l_includeUnverifiedCreators_0
        };
        v37.sortsList = {};
        v37.mouseEnter = function() --[[ Line: 102 ]]
            -- upvalues: v37 (copy)
            v37.props.Modal.onSearchOptionsMouse(true);
        end;
        v37.mouseLeave = function() --[[ Line: 106 ]]
            -- upvalues: v37 (copy)
            v37.props.Modal.onSearchOptionsMouse(false);
        end;
        v37.debouncedUserSearch = v9(function(v41) --[[ Line: 110 ]]
            -- upvalues: v37 (copy)
            local l_props_0 = v37.props;
            l_props_0.userSearch(l_props_0.Network.networkInterface, v41);
        end, l_game_FastInt_0);
        v37.updateSearch = function(v43, v44) --[[ Line: 115 ]]
            -- upvalues: v37 (copy)
            v37.searchTerm = v43;
            v37.extraSearchDetails = v44;
            v37.debouncedUserSearch(v43);
        end;
        v37.selectSort = function(v45) --[[ Line: 122 ]]
            -- upvalues: v37 (copy)
            local v46 = nil;
            for v47, v48 in pairs(v37.sortsList) do
                if v48.Key == v45 then
                    v46 = v47;
                end;
            end;
            v37:setState({
                SortIndex = v46
            });
        end;
        v37.apply = function(v49) --[[ Line: 134 ]]
            -- upvalues: v37 (copy)
            v37.onSearchOptionsClosed(v49);
        end;
        v37.cancel = function() --[[ Line: 138 ]]
            -- upvalues: v37 (copy)
            v37.onSearchOptionsClosed(nil);
        end;
        v37.footerButtonClicked = function(v50) --[[ Line: 142 ]]
            -- upvalues: v37 (copy), v7 (ref), v3 (ref)
            local v51 = {
                SortIndex = v37.state.SortIndex, 
                Creator = v37.searchTerm
            };
            if v37.state.minDuration ~= v7.MIN_AUDIO_SEARCH_DURATION or v37.state.maxDuration ~= v7.MAX_AUDIO_SEARCH_DURATION then
                v51.AudioSearch = {
                    minDuration = v37.state.minDuration, 
                    maxDuration = v37.state.maxDuration
                };
            end;
            if v37.extraSearchDetails and next(v37.extraSearchDetails) ~= nil then
                v51.Creator = {
                    Name = v37.extraSearchDetails.Name, 
                    Id = v37.extraSearchDetails.Id
                };
            end;
            v51.includeUnverifiedCreators = v37.state.includeUnverifiedCreators;
            v37:setState({
                SortIndex = v3.None, 
                Creator = v3.None
            });
            if v50 == "Cancel" then
                v37.cancel();
                return;
            else
                if v50 == "Apply" then
                    v37.apply(v51);
                end;
                return;
            end;
        end;
        v37.onDurationChange = function(v52, v53) --[[ Line: 179 ]]
            -- upvalues: v37 (copy)
            if v52 ~= v37.state.minDuration or v53 ~= v37.state.maxDuration then
                v37:setState({
                    minDuration = v52, 
                    maxDuration = v53
                });
            end;
        end;
        v37.onToggleIdVerified = function() --[[ Line: 188 ]]
            -- upvalues: v37 (copy)
            v37:setState(function(v54) --[[ Line: 189 ]]
                return {
                    includeUnverifiedCreators = not v54.includeUnverifiedCreators
                };
            end);
        end;
        v37.updateContainerSize = function(v55) --[[ Line: 196 ]]
            -- upvalues: v37 (copy)
            v37:setState({
                windowSize = v55.AbsoluteSize
            });
        end;
        v37.updateContentsSize = function(v56) --[[ Line: 201 ]]
            -- upvalues: v37 (copy)
            spawn(function() --[[ Line: 202 ]]
                -- upvalues: v37 (ref), v56 (copy)
                v37:setState({
                    contentSize = v56
                });
            end);
        end;
        v37.onSearchOptionsClosed = function(v57) --[[ Line: 209 ]]
            -- upvalues: v37 (copy)
            if v57 then
                local l_networkInterface_0 = v37.props.Network.networkInterface;
                local v59 = v37.props.Settings:get("Plugin");
                v37.props.searchWithOptions(l_networkInterface_0, v59, v57);
            end;
            if v37.props.onSearchOptionsToggled then
                v37.props.onSearchOptionsToggled();
            end;
        end;
    end;
    v36.createSeparator = function(v60, _) --[[ Line: 221 ]] --[[ Name: createSeparator ]]
        -- upvalues: v3 (copy), l_Separator_0 (copy)
        return v3.createElement(l_Separator_0, {
            LayoutOrder = v60:nextLayout()
        });
    end;
    v36.resetLayout = function(v62) --[[ Line: 227 ]] --[[ Name: resetLayout ]]
        v62.currentLayout = 0;
    end;
    v36.nextLayout = function(v63) --[[ Line: 231 ]] --[[ Name: nextLayout ]]
        v63.currentLayout = v63.currentLayout + 1;
        return v63.currentLayout;
    end;
    v36.render = function(v64) --[[ Line: 236 ]] --[[ Name: render ]]
        -- upvalues: v34 (copy), l_showRobloxCreatedAssets_0 (copy), v7 (copy), l_getShouldHideNonRelevanceSorts_0 (copy), v3 (copy), l_ScrollingFrame_0 (copy), v27 (copy), l_Pane_0 (copy), l_Checkbox_0 (copy), l_Image_0 (copy), v8 (copy), l_Tooltip_0 (copy), l_TextLabel_0 (copy), v16 (copy), v26 (copy), l_RadioButtonList_0 (copy), l_Separator_0 (copy), v28 (copy), l_ShowOnTop_0 (copy)
        local l_state_0 = v64.state;
        local l_searchOptions_0 = v64.props.Stylizer.searchOptions;
        local l_LiveSearchData_0 = v64.props.LiveSearchData;
        local l_minDuration_0 = l_state_0.minDuration;
        local l_maxDuration_0 = l_state_0.maxDuration;
        local l_Localization_0 = v64.props.Localization;
        local v71 = l_Localization_0:getText("General", "SearchOptionAudioLength");
        local v72 = l_Localization_0:getText("General", "SearchOptionsIncludeUnverifiedDescription");
        local v73 = l_Localization_0:getText("General", "SearchOptionsIncludeUnverifiedHeader");
        local v74 = l_Localization_0:getText("General", "SearchOptionsIncludeUnverifiedTooltip");
        local l_categoryName_0 = v64.props.categoryName;
        local v76 = v34.categoryIsAudio(l_categoryName_0);
        local v77 = true;
        if l_showRobloxCreatedAssets_0() then
            v77 = false;
        end;
        v64.sortsList = {
            {
                Key = "Relevance", 
                Text = l_Localization_0:getText("General", "SortByRelevance")
            }, 
            {
                Key = "MostTaken", 
                Text = l_Localization_0:getText("General", "SortByMostTaken")
            }, 
            {
                Key = "Favorites", 
                Text = l_Localization_0:getText("General", "SortByFavorites")
            }, 
            {
                Key = "Updated", 
                Text = l_Localization_0:getText("General", "SortByUpdated")
            }, 
            {
                Key = "Ratings", 
                Text = l_Localization_0:getText("General", "SortByRatings")
            }
        };
        local v78 = v64.state.SortIndex or v64.props.SortIndex;
        local l_Key_0 = v64.sortsList[v78].Key;
        local l_TAB_WIDGET_HEIGHT_0 = v7.TAB_WIDGET_HEIGHT;
        v64:resetLayout();
        local v81 = not l_getShouldHideNonRelevanceSorts_0();
        local v82 = v77 and not v76;
        local v83 = l_TAB_WIDGET_HEIGHT_0 + v7.HEADER_HEIGHT;
        local v84 = nil;
        v84 = if v64.state.contentSize then UDim2.new(0, v64.state.contentSize.X, 0, v64.state.contentSize.Y) else UDim2.new(0, 0, 0, 0);
        local v85 = true;
        local v86 = UDim2.new(1, 0, 1, 0);
        if v64.containerRef.current then
            local v87 = v64.containerRef.current.AbsoluteSize.Y - (v83 + 40);
            local v88 = v84.Y.Offset + 42;
            if v88 < v87 then
                v86 = UDim2.new(1, 0, 0, v88);
                v85 = false;
            end;
        end;
        local v89 = {
            Main = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, -4, 0, v83 + 4), 
                Size = UDim2.new(0, v7.TOOLBOX_MIN_WIDTH, 1, -(v83 + 8 + 42)), 
                [v3.Ref] = v64.containerRef, 
                [v3.Change.AbsoluteSize] = v64.updateContainerSize
            }, {
                Contents = v3.createElement("Frame", {
                    BackgroundColor3 = l_searchOptions_0.background, 
                    BorderColor3 = l_searchOptions_0.border, 
                    BackgroundTransparency = 0, 
                    Size = v86, 
                    [v3.Event.MouseEnter] = v64.mouseEnter, 
                    [v3.Event.MouseLeave] = v64.mouseLeave
                }, {
                    Container = v3.createElement(l_ScrollingFrame_0, {
                        Position = UDim2.new(0, 0, 0, 0), 
                        Size = UDim2.new(1, 0, 1, -42), 
                        OnCanvasResize = v64.updateContentsSize, 
                        Layout = Enum.FillDirection.Vertical, 
                        AutoSizeCanvas = true, 
                        AutoSizeLayoutOptions = {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            Padding = UDim.new(0, 10)
                        }
                    }, {
                        Padding = v3.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, 10), 
                            PaddingRight = UDim.new(0, 10), 
                            PaddingTop = UDim.new(0, 10), 
                            PaddingBottom = UDim.new(0, 10)
                        }), 
                        AllViews = v3.createElement(v27, {
                            Header = l_Localization_0:getText("General", "SearchOptionsAllViews"), 
                            LayoutOrder = v64:nextLayout()
                        }, {
                            CheckboxAndDescriptionContainer = v3.createElement(l_Pane_0, {
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                                Layout = Enum.FillDirection.Vertical, 
                                LayoutOrder = v64:nextLayout(), 
                                Spacing = 3
                            }, {
                                IncludeUnverifiedToggle = v3.createElement(l_Checkbox_0, {
                                    Checked = l_state_0.includeUnverifiedCreators, 
                                    LayoutOrder = v64:nextLayout(), 
                                    OnClick = v64.onToggleIdVerified, 
                                    Text = v73, 
                                    TextWrapped = true
                                }), 
                                VerifiedDescriptionContainer = v3.createElement(l_Pane_0, {
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                                    Layout = Enum.FillDirection.Horizontal, 
                                    LayoutOrder = v64:nextLayout(), 
                                    Padding = {
                                        Left = 24
                                    }, 
                                    Spacing = 6, 
                                    VerticalAlignment = Enum.VerticalAlignment.Top
                                }, {
                                    Image = v3.createElement(l_Image_0, {
                                        AnchorPoint = Vector2.new(0, 0.5), 
                                        Image = v8.WARNING_ICON_SMALL, 
                                        ImageColor3 = l_searchOptions_0.warningIconColor, 
                                        LayoutOrder = v64:nextLayout(), 
                                        Size = UDim2.fromOffset(16, 16)
                                    }, {
                                        Tooltip = v3.createElement(l_Tooltip_0, {
                                            Text = v74, 
                                            Priority = 11
                                        })
                                    }), 
                                    VerifiedDescription = v3.createElement(l_TextLabel_0, {
                                        AutomaticSize = Enum.AutomaticSize.XY, 
                                        LayoutOrder = v64:nextLayout(), 
                                        Style = "SubText", 
                                        Text = v72, 
                                        TextSize = 14, 
                                        TextWrapped = true, 
                                        TextXAlignment = Enum.TextXAlignment.Left
                                    })
                                })
                            })
                        }), 
                        Separator = v64:createSeparator(l_searchOptions_0.separator), 
                        Creator = v77 and v3.createElement(v27, {
                            LayoutOrder = v64:nextLayout(), 
                            Header = l_Localization_0:getText("General", "SearchOptionCreator")
                        }, {
                            SearchBar = v3.createElement(v16, {
                                defaultTextKey = "SearchBarCreatorText", 
                                searchTerm = l_LiveSearchData_0.searchTerm, 
                                results = l_LiveSearchData_0.results, 
                                updateSearch = v64.updateSearch, 
                                width = v7.SEARCH_BAR_WIDTH
                            })
                        }), 
                        Separator1 = v82 and v64:createSeparator(l_searchOptions_0.separator), 
                        AudioSearchHeader = v76 and v3.createElement(v27, {
                            LayoutOrder = v64:nextLayout(), 
                            Header = v71
                        }, {
                            AudioSearch = v3.createElement(v26, {
                                minDuration = l_minDuration_0, 
                                maxDuration = l_maxDuration_0, 
                                onDurationChange = v64.onDurationChange
                            })
                        }), 
                        Separator2 = v76 and v64:createSeparator(l_searchOptions_0.separator), 
                        SortBy = v81 and v3.createElement(v27, {
                            LayoutOrder = v64:nextLayout(), 
                            Header = l_Localization_0:getText("General", "SearchOptionSort")
                        }, {
                            RadioButtons = v3.createElement(l_RadioButtonList_0, {
                                Buttons = v64.sortsList, 
                                SelectedKey = l_Key_0, 
                                OnClick = v64.selectSort
                            })
                        }), 
                        ViewPadding = v81 and v3.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, 0, 0, 10), 
                            LayoutOrder = v64:nextLayout()
                        })
                    }), 
                    BottomButtonsContainer = v3.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 42), 
                        Position = UDim2.new(0, 0, 1, -42), 
                        ZIndex = 3
                    }, {
                        Padding = v3.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, 10), 
                            PaddingRight = UDim.new(0, 10)
                        }), 
                        GradientOverlay = v85 and v3.createElement("Frame", {
                            LayoutOrder = v64:nextLayout(), 
                            Size = UDim2.new(1, -8, 0, 20), 
                            Position = UDim2.new(0, 0, 0, -20), 
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BorderColor3 = Color3.new(1, 1, 1)
                        }, {
                            Gradient = v3.createElement("UIGradient", {
                                Color = ColorSequence.new(l_searchOptions_0.background), 
                                Rotation = 90, 
                                Transparency = NumberSequence.new({
                                    NumberSequenceKeypoint.new(0, 1), 
                                    NumberSequenceKeypoint.new(1, 0.25)
                                })
                            })
                        }), 
                        Separator = v3.createElement(l_Separator_0, {
                            Position = UDim2.new(0.5, 0, 0, 0), 
                            ZIndex = 2
                        }), 
                        Footer = v3.createElement(v28, {
                            AnchorPoint = Vector2.new(0, 1), 
                            Position = UDim2.new(0, 0, 1, -8), 
                            onButtonClicked = v64.footerButtonClicked
                        })
                    })
                })
            })
        };
        local l_l_ShowOnTop_0_0 = l_ShowOnTop_0;
        local v91 = {
            Priority = 2
        };
        return v3.createElement("Frame", {
            BackgroundTransparency = 1
        }, {
            Portal = v3.createElement(l_l_ShowOnTop_0_0, v91, {
                ClickEventDetectFrame = v3.createElement("ImageButton", {
                    ZIndex = 10, 
                    Position = UDim2.new(0, 0, 0, 0), 
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    AutoButtonColor = false, 
                    [v3.Ref] = v64.containerRef, 
                    [v3.Event.Activated] = v64.cancel
                }, v89)
            })
        });
    end;
    v36 = l_withContext_0({
        Localization = l_ContextServices_0.Localization, 
        Settings = v13, 
        Stylizer = l_ContextServices_0.Stylizer, 
        Modal = v14, 
        Network = v15
    })(v36);
    return v4.connect(function(v92, _) --[[ Line: 516 ]] --[[ Name: mapStateToProps ]]
        -- upvalues: v34 (copy)
        v92 = v92 or {};
        local v94 = v92.pageInfo or {};
        local v95 = nil;
        if v92.liveSearch then
            v95 = {
                searchTerm = v92.liveSearch.searchTerm, 
                results = v92.liveSearch.results
            };
        end;
        return {
            audioSearchInfo = v94.audioSearchInfo, 
            includeUnverifiedCreators = v94.includeUnverifiedCreators, 
            categoryName = v94.categoryName or v34.DEFAULT.name, 
            LiveSearchData = v95, 
            SortIndex = v94.sortIndex or 1
        };
    end, function(v96) --[[ Line: 537 ]]
        -- upvalues: v32 (copy), v31 (copy)
        return {
            userSearch = function(v97, v98) --[[ Line: 540 ]] --[[ Name: userSearch ]]
                -- upvalues: v96 (copy), v32 (ref)
                v96(v32(v97, v98));
            end, 
            searchWithOptions = function(v99, v100, v101) --[[ Line: 544 ]] --[[ Name: searchWithOptions ]]
                -- upvalues: v96 (copy), v31 (ref)
                v96(v31(v99, v100, v101));
            end
        };
    end)(v36);
end;