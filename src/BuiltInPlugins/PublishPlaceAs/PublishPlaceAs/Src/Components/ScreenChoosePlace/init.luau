local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local l_BrowserService_0 = game:GetService("BrowserService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = require(l_Parent_0.Src.Resources.Constants);
local l_UI_0 = v5.UI;
local l_Button_0 = l_UI_0.Button;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_SearchBar_0 = l_UI_0.SearchBar;
local l_Separator_0 = l_UI_0.Separator;
local l_TextWithLinks_0 = l_UI_0.TextWithLinks;
local l_Pane_0 = l_UI_0.Pane;
local v17 = require(l_Parent_0.Src.Actions.SetIsPublishing);
local v18 = require(l_Parent_0.Src.Actions.SetScreen);
local v19 = require(l_Parent_0.Src.Actions.SetPlaceInfo);
local v20 = require(l_Parent_0.Src.Actions.SetPublishInfo);
local v21 = require(l_Parent_0.Src.Actions.SetPublishInProgress);
local v22 = require(l_Parent_0.Src.Thunks.LoadExistingPlaces);
local v23 = require(l_Parent_0.Src.Components.Footer);
local v24 = require(l_Parent_0.Src.Components.TilePlace);
local v25 = require(l_Parent_0.Src.Network.Http);
local v26 = v3.PureComponent:extend("ScreenChoosePlace");
local v27 = require(l_Parent_0.Src.Flags.getFFlagCAP1481Warning);
local v28 = require(l_Parent_0.Src.Flags.getFStringCAP1107SettingsUrl);
local l_StudioUsePublishInProgressScreen2_0 = game:GetFastFlag("StudioUsePublishInProgressScreen2");
local l_EnableContentMaturityStringChanges_0 = game:GetFastFlag("EnableContentMaturityStringChanges");
v26.init = function(v31) --[[ Line: 49 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v31.state = {
        searchTerm = ""
    };
    v31.finishedConnection = nil;
    v31.layoutRef = v3.createRef();
    v31.OnSearchRequested = function(v32) --[[ Line: 58 ]]
        -- upvalues: v31 (copy)
        v31:setState({
            searchTerm = v32
        });
    end;
end;
v26.didMount = function(v33) --[[ Line: 65 ]] --[[ Name: didMount ]]
    -- upvalues: l_StudioPublishService_0 (copy)
    v33.finishedConnection = l_StudioPublishService_0.GamePublishFinished:connect(function(v34, _, v36) --[[ Line: 66 ]]
        -- upvalues: v33 (copy)
        if v33.state.selectedPlace == nil then
            return;
        elseif v34 then
            v33.props.OpenPublishSuccessfulPage(v33.state.selectedPlace, v33.props.ParentGame);
            return;
        else
            v33.props.OpenPublishFailPage(v33.state.selectedPlace, v33.props.ParentGame, v36);
            return;
        end;
    end);
end;
v26.willUnmount = function(v37) --[[ Line: 79 ]] --[[ Name: willUnmount ]]
    for v38, _ in pairs(v37.props.Places) do
        v37.props.Places[v38] = nil;
    end;
    if v37.finishedConnection then
        v37.finishedConnection:disconnect();
    end;
end;
v26.render = function(v40) --[[ Line: 90 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v8 (copy), v24 (copy), l_Separator_0 (copy), l_EnableContentMaturityStringChanges_0 (copy), v27 (copy), l_Pane_0 (copy), l_TextWithLinks_0 (copy), v25 (copy), v28 (copy), l_BrowserService_0 (copy), l_SearchBar_0 (copy), l_ScrollingFrame_0 (copy), l_LoadingIndicator_0 (copy), l_Button_0 (copy), v23 (copy), l_StudioUsePublishInProgressScreen2_0 (copy), l_StudioPublishService_0 (copy)
    local l_props_0 = v40.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_OnClose_0 = l_props_0.OnClose;
    local l_NextPageCursor_0 = l_props_0.NextPageCursor;
    local l_Places_0 = l_props_0.Places;
    local l_ParentGame_0 = l_props_0.ParentGame;
    local l_IsPublishing_0 = l_props_0.IsPublishing;
    local v49 = l_props_0.SourceGameMinAge and l_props_0.SourceGameMinAge >= 17 and l_props_0.ParentGame.minimumAge and l_props_0.ParentGame.minimumAge < 17;
    local l_DispatchLoadExistingPlaces_0 = l_props_0.DispatchLoadExistingPlaces;
    local l_dispatchSetIsPublishing_0 = l_props_0.dispatchSetIsPublishing;
    local l_OpenChooseGamePage_0 = l_props_0.OpenChooseGamePage;
    local l_OpenPublishInProgressPage_0 = l_props_0.OpenPublishInProgressPage;
    local v54 = false;
    if v40.state.selectedPlace ~= nil then
        v54 = v40.state.selectedPlace.placeId == 0;
    end;
    local v55 = l_Localization_0:getText("ScreenHeader", "ChoosePlace", {
        l_ParentGame_0 and l_ParentGame_0.name or ""
    });
    local v56 = l_Localization_0:getText("General", "UntitledGame");
    local v57 = {
        v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0), 
            [v3.Ref] = v40.layoutRef
        })
    };
    if l_props_0.PlacesQueryState == v8.QUERY_STATE.QUERY_STATE_SUCCESS then
        for _, v59 in pairs(l_Places_0) do
            if string.find(v59.name:lower(), v40.state.searchTerm:lower()) then
                local l_createElement_0 = v3.createElement;
                local l_v24_0 = v24;
                local v62 = {
                    Name = v59.name, 
                    Id = v59.placeId, 
                    LayoutOrder = #v57 + 1
                };
                local v63 = false;
                if v40.state.selectedPlace ~= nil then
                    v63 = v40.state.selectedPlace.placeId == v59.placeId;
                end;
                v62.Selected = v63;
                v62.LastItem = false;
                v62.OnActivated = function() --[[ Line: 143 ]] --[[ Name: OnActivated ]]
                    -- upvalues: v40 (copy), v59 (copy)
                    v40:setState({
                        selectedPlace = v59
                    });
                end;
                l_createElement_0 = l_createElement_0(l_v24_0, v62);
                v57[#v57 + 1] = l_createElement_0;
            end;
        end;
        v57[0] = v3.createElement(v24, {
            Name = l_Localization_0:getText("Button", "AddNewPlaceToGame"), 
            LayoutOrder = 1, 
            Selected = v54, 
            OnActivated = function() --[[ Line: 157 ]] --[[ Name: OnActivated ]]
                -- upvalues: v40 (copy), v56 (copy)
                v40:setState({
                    selectedPlace = {
                        placeId = 0, 
                        name = v56
                    }
                });
            end
        });
    end;
    local v64 = v54 and "Create" or "Overwrite";
    local _ = 200;
    if (v57 and math.ceil(#v57 * 80) or 200) < 560 and l_NextPageCursor_0 then
        l_DispatchLoadExistingPlaces_0(l_ParentGame_0, l_NextPageCursor_0);
    end;
    local l_createElement_1 = v3.createElement;
    local v67 = "Frame";
    local v68 = {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Stylizer_0.backgroundColor, 
        BorderSizePixel = 0
    };
    local v70 = {
        Back = v3.createElement("ImageButton", {
            Image = l_Stylizer_0.icons.backArrow, 
            Size = UDim2.new(0, 20, 0, 20), 
            Position = UDim2.new(0, 30, 0, 10), 
            Style = 0, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            [v3.Event.Activated] = function() --[[ Line: 204 ]]
                -- upvalues: l_OpenChooseGamePage_0 (copy)
                l_OpenChooseGamePage_0();
            end
        }), 
        Sep1 = v3.createElement(l_Separator_0, {
            Position = UDim2.new(0.5, 0, 0, 50)
        }), 
        Header = v3.createElement("TextLabel", {
            Text = v55, 
            Position = UDim2.new(0, 30, 0, 80), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = 20, 
            BackgroundTransparency = 1, 
            Font = l_Stylizer_0.header.font, 
            TextColor3 = l_Stylizer_0.textColor
        }), 
        Warning17PlusFrame = if v49 then v3.createElement("Frame", {
            Position = UDim2.new(0, 30, 0, 105), 
            Size = if l_EnableContentMaturityStringChanges_0 then UDim2.new(1, -60, 0, 40) else UDim2.new(1, 0, 0, 20), 
            BackgroundTransparency = 1
        }, {
            WarningIcon = if l_EnableContentMaturityStringChanges_0 then v3.createElement("ImageLabel", {
                Size = UDim2.fromOffset(20, 20), 
                Position = UDim2.new(0, 0, 0, 10), 
                AnchorPoint = Vector2.new(0, 0.5), 
                Image = l_Stylizer_0.icons.warning, 
                BackgroundTransparency = 1
            }) else v3.createElement("ImageLabel", {
                Size = UDim2.fromOffset(20, 20), 
                AnchorPoint = Vector2.new(0, 0.5), 
                Image = l_Stylizer_0.icons.warning, 
                BackgroundTransparency = 1
            }), 
            WarningText = if l_EnableContentMaturityStringChanges_0 then v3.createElement("TextLabel", {
                Position = UDim2.fromOffset(25, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = l_Localization_0:getText("ScreenHeader", "RestrictedContentWarning"), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextSize = 20, 
                BackgroundTransparency = 1, 
                Font = l_Stylizer_0.header.font, 
                TextColor3 = l_Stylizer_0.warningTextColor, 
                TextWrapped = true
            }) else v3.createElement("TextLabel", {
                Position = UDim2.fromOffset(25, 0), 
                Text = l_Localization_0:getText("ScreenHeader", "17PlusWarning"), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextSize = 20, 
                BackgroundTransparency = 1, 
                Font = l_Stylizer_0.header.font, 
                TextColor3 = l_Stylizer_0.warningTextColor
            })
        }) else nil, 
        WarningDataSharingFrame = if v27() and game.GameId ~= 0 then v3.createElement(l_Pane_0, {
            Position = UDim2.new(0, 30, 0, 125), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 800, 0, 50), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Spacing = 10
        }, {
            WarningIcon = v3.createElement("ImageLabel", {
                Size = UDim2.fromOffset(20, 20), 
                AnchorPoint = Vector2.new(0, 0.5), 
                Image = l_Stylizer_0.icons.warning, 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }), 
            Warning = v3.createElement(l_Pane_0, {
                BackgroundTransparency = 1, 
                Layout = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Spacing = 10, 
                LayoutOrder = 2
            }, {
                WarningText = v3.createElement("TextLabel", {
                    Text = l_Localization_0:getText("DataSharing", "ChoosePlaceWarning"), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextSize = 20, 
                    BackgroundTransparency = 1, 
                    Font = l_Stylizer_0.header.font, 
                    TextColor3 = l_Stylizer_0.warningTextColor, 
                    LayoutOrder = 1
                }), 
                WarningLink = v3.createElement(l_TextWithLinks_0, {
                    Text = l_Localization_0:getText("DataSharing", "ChoosePlaceWarning2"), 
                    TextProps = {
                        Font = l_Stylizer_0.header.font, 
                        TextSize = 20, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor = l_Stylizer_0.warningTextColor
                    }, 
                    LinkMap = {
                        ["[hereLink]"] = {
                            LinkText = l_Localization_0:getText("DataSharing", "SettingsPage"), 
                            LinkCallback = function() --[[ Line: 317 ]] --[[ Name: LinkCallback ]]
                                -- upvalues: v25 (ref), v28 (ref), l_BrowserService_0 (ref)
                                local v69 = v25.BuildRobloxUrl("create", v28());
                                l_BrowserService_0:OpenBrowserWindow(v69);
                            end
                        }
                    }, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    LayoutOrder = 2
                })
            })
        }) else nil, 
        SearchBar = v3.createElement("Frame", {
            Position = UDim2.new(0.7, 4, 0, 62), 
            Size = UDim2.new(0, l_Stylizer_0.DROPDOWN_WIDTH + 20, 0, l_Stylizer_0.DROPDOWN_HEIGHT), 
            BackgroundTransparency = 1
        }, {
            v3.createElement(l_SearchBar_0, {
                Size = UDim2.new(0.7, 0, 1, 0), 
                ShowSearchIcon = true, 
                ShowSearchButton = false, 
                IncrementalTextSearch = true, 
                OnSearchRequested = v40.OnSearchRequested
            })
        })
    };
    local v71 = false;
    if l_props_0.PlacesQueryState == v8.QUERY_STATE.QUERY_STATE_SUCCESS then
        v71 = v3.createElement(l_ScrollingFrame_0, {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0.5, l_Stylizer_0.FOOTER_HEIGHT * 2), 
            Position = UDim2.new(0, 0, 0, v27() and 175 or 135), 
            NextPageRequestDistance = 100, 
            NextPageFunc = function() --[[ Line: 351 ]] --[[ Name: NextPageFunc ]]
                -- upvalues: l_NextPageCursor_0 (copy), l_DispatchLoadExistingPlaces_0 (copy), l_ParentGame_0 (copy)
                if l_NextPageCursor_0 then
                    l_DispatchLoadExistingPlaces_0(l_ParentGame_0, l_NextPageCursor_0);
                end;
            end
        }, v57);
    end;
    v70.MainContentsSuccess = v71;
    v71 = false;
    if l_props_0.PlacesQueryState == v8.QUERY_STATE.QUERY_STATE_QUERYING then
        v71 = v3.createElement("Frame", {
            Position = UDim2.new(0, 30, 0, 115), 
            Size = UDim2.new(0.95, 0, 0.7, 0), 
            BackgroundColor3 = l_Stylizer_0.backgroundColor
        }, {
            v3.createElement(l_LoadingIndicator_0, {
                Position = UDim2.new(0.5, -100, 0, 115), 
                Size = UDim2.new(0, 200, 0, 50)
            })
        });
    end;
    v70.MainContentsQuerying = v71;
    v71 = false;
    if l_props_0.PlacesQueryState == v8.QUERY_STATE.QUERY_STATE_FAILED then
        v71 = v3.createElement("Frame", {
            Position = UDim2.new(0, 30, 0, 115), 
            Size = UDim2.new(0.95, 0, 0.7, 0), 
            BackgroundColor3 = l_Stylizer_0.backgroundColor
        }, {
            v3.createElement("TextLabel", {
                Text = l_Localization_0:getText("General", "FetchFailed"), 
                Position = UDim2.new(0.5, 0, 0, 50), 
                TextSize = 24, 
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextColor3 = l_Stylizer_0.failText.text, 
                Font = l_Stylizer_0.failText.font
            }), 
            v3.createElement(l_Button_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                OnClick = function() --[[ Line: 386 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_DispatchLoadExistingPlaces_0 (copy), l_ParentGame_0 (copy)
                    l_DispatchLoadExistingPlaces_0(l_ParentGame_0);
                end, 
                Position = UDim2.new(0.5, 0, 0, 100), 
                Size = UDim2.new(0, 150, 0, 75), 
                Style = "Round", 
                Text = l_Localization_0:getText("Button", "Retry")
            })
        });
    end;
    v70.MainContentsFailed = v71;
    v70.Footer = v3.createElement(v23, {
        MainButton = {
            Name = v64, 
            Active = l_ParentGame_0 and v40.state.selectedPlace ~= nil and not l_IsPublishing_0, 
            OnActivated = function() --[[ Line: 400 ]] --[[ Name: OnActivated ]]
                -- upvalues: l_StudioUsePublishInProgressScreen2_0 (ref), v40 (copy), l_OpenPublishInProgressPage_0 (copy), l_ParentGame_0 (copy), l_props_0 (copy), l_StudioPublishService_0 (ref), l_dispatchSetIsPublishing_0 (copy)
                if l_StudioUsePublishInProgressScreen2_0 and v40.state.selectedPlace.placeId ~= 0 then
                    l_OpenPublishInProgressPage_0(l_ParentGame_0, v40.state.selectedPlace, l_props_0.IsPublish);
                    return;
                else
                    game:GetService("StudioPublishService"):SetTeamCreateOnPublishInfo(false, "");
                    if v40.state.selectedPlace.placeId == 0 then
                        l_StudioPublishService_0:setUploadNames("New Place", l_ParentGame_0.name);
                    else
                        l_StudioPublishService_0:setUploadNames(v40.state.selectedPlace.name, l_ParentGame_0.name);
                    end;
                    l_StudioPublishService_0:publishAs(l_ParentGame_0.universeId, v40.state.selectedPlace.placeId, 0, l_props_0.IsPublish, nil);
                    l_dispatchSetIsPublishing_0(true);
                    return;
                end;
            end
        }, 
        OnClose = l_OnClose_0
    });
    return l_createElement_1(v67, v68, v70);
end;
v26 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v26);
return v4.connect(function(v72, _) --[[ Line: 435 ]] --[[ Name: mapStateToProps ]]
    local l_placeInfo_0 = v72.ExistingGame.placeInfo;
    local l_selectedGame_0 = v72.ExistingGame.selectedGame;
    local _ = v72.ExistingGame.gameConfiguration;
    local l_gameInfo_0 = v72.ExistingGame.gameInfo;
    return {
        NextPageCursor = l_placeInfo_0.nextPageCursor, 
        Places = l_placeInfo_0.places, 
        ParentGame = l_selectedGame_0, 
        IsPublishing = v72.PublishedPlace.isPublishing, 
        PlacesQueryState = l_placeInfo_0.queryState, 
        SourceGameMinAge = l_gameInfo_0.minimumAge
    };
end, function(v78) --[[ Line: 450 ]] --[[ Name: useDispatchForProps ]]
    -- upvalues: v22 (copy), v17 (copy), v19 (copy), v18 (copy), v8 (copy), v21 (copy), v20 (copy)
    return {
        DispatchLoadExistingPlaces = function(v79, v80) --[[ Line: 452 ]] --[[ Name: DispatchLoadExistingPlaces ]]
            -- upvalues: v78 (copy), v22 (ref)
            v78(v22(v79, v80));
        end, 
        dispatchSetIsPublishing = function(v81) --[[ Line: 455 ]] --[[ Name: dispatchSetIsPublishing ]]
            -- upvalues: v78 (copy), v17 (ref)
            v78(v17(v81));
        end, 
        OpenChooseGamePage = function() --[[ Line: 458 ]] --[[ Name: OpenChooseGamePage ]]
            -- upvalues: v78 (copy), v19 (ref), v18 (ref), v8 (ref)
            v78(v19({
                places = {}
            }));
            v78(v18(v8.SCREENS.CHOOSE_GAME));
        end, 
        OpenPublishInProgressPage = function(v82, v83, v84) --[[ Line: 462 ]] --[[ Name: OpenPublishInProgressPage ]]
            -- upvalues: v78 (copy), v21 (ref), v18 (ref), v8 (ref)
            v78(v21({
                universe = v82, 
                place = v83, 
                isPublish = v84, 
                failCount = 0, 
                requestInFlight = false
            }));
            v78(v18(v8.SCREENS.PUBLISH_IN_PROGRESS));
        end, 
        OpenPublishSuccessfulPage = function(v85, v86) --[[ Line: 472 ]] --[[ Name: OpenPublishSuccessfulPage ]]
            -- upvalues: v78 (copy), v20 (ref), v18 (ref), v8 (ref)
            v78(v20({
                id = v86.universeId, 
                name = v85.name, 
                parentGameName = v86.name
            }));
            v78(v18(v8.SCREENS.PUBLISH_SUCCESSFUL));
        end, 
        OpenPublishFailPage = function(v87, v88, v89) --[[ Line: 476 ]] --[[ Name: OpenPublishFailPage ]]
            -- upvalues: v78 (copy), v20 (ref), v18 (ref), v8 (ref)
            v78(v20({
                id = v87.placeId, 
                name = v87.name, 
                parentGameName = v88.name, 
                parentGameId = v88.universeId, 
                failed = true, 
                message = v89
            }));
            v78(v18(v8.SCREENS.PUBLISH_FAIL));
        end, 
        ClearPlaces = function() --[[ Line: 487 ]] --[[ Name: ClearPlaces ]]
            -- upvalues: v78 (copy), v19 (ref)
            v78(v19({
                places = {}
            }));
        end
    };
end)(v26);