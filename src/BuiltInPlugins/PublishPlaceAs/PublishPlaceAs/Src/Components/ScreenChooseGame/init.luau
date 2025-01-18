local l_DevFrameworkDropdownMenuHeight_0 = game:GetFastFlag("DevFrameworkDropdownMenuHeight");
local l_EnableContentMaturityStringChanges_0 = game:GetFastFlag("EnableContentMaturityStringChanges");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local l_StudioService_0 = game:GetService("StudioService");
local v6 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_map_0 = v6.Dash.map;
local v10 = require(l_Parent_0.Src.Resources.Constants);
local v11 = require(l_Parent_0.Src.Thunks.LoadExistingGames);
local v12 = require(l_Parent_0.Src.Thunks.LoadExistingPlaces);
local v13 = require(l_Parent_0.Src.Thunks.LoadGroups);
local _ = require(l_Parent_0.Src.Thunks.LoadGameConfiguration);
local v15 = require(l_Parent_0.Src.Actions.SetScreen);
local v16 = require(l_Parent_0.Src.Actions.SetSelectedGroup);
local v17 = require(l_Parent_0.Src.Components.Footer);
local v18 = require(l_Parent_0.Src.Components.TileGame);
local l_UI_0 = v6.UI;
local l_Button_0 = l_UI_0.Button;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_SearchBar_0 = l_UI_0.SearchBar;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Separator_0 = l_UI_0.Separator;
local v26 = v3.PureComponent:extend("ScreenChooseGame");
local v27 = l_StudioService_0:getUserId();
local l_USER_0 = v10.SUBJECT_TYPE.USER;
local v29 = nil;
local l_TextService_0 = game:GetService("TextService");
v26.init = function(v31) --[[ Line: 51 ]] --[[ Name: init ]]
    -- upvalues: l_USER_0 (ref), v27 (ref), v29 (ref)
    v31.state = {
        searchTerm = ""
    };
    v31.props.DispatchLoadExistingGames(l_USER_0, v27);
    v31.props.DispatchLoadGroups();
    v31.createContentForSelectInput = function(v32) --[[ Line: 59 ]]
        return {
            Id = v32.Text, 
            Key = v32.Key, 
            Label = v32.Text, 
            Text = v32.Text, 
            Type = v32.Type
        };
    end;
    v31.onItemActivated = function(v33, _) --[[ Line: 69 ]]
        -- upvalues: v27 (ref), l_USER_0 (ref), v29 (ref), v31 (copy)
        if v33.Key ~= v27 then
            v27 = v33.Key;
            l_USER_0 = v33.Type;
            v29 = v33.Text;
            v31.props.DispatchLoadExistingGames(v33.Type, v33.Key);
            v31.props.DispatchSetSelectedGroup(v33.Key);
        end;
    end;
    v31.OnSearchRequested = function(v35) --[[ Line: 79 ]]
        -- upvalues: v31 (copy)
        v31:setState({
            searchTerm = v35
        });
    end;
end;
v26.render = function(v36) --[[ Line: 86 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), l_StudioService_0 (copy), v29 (ref), v3 (copy), v18 (copy), l_USER_0 (ref), v27 (ref), l_EnableContentMaturityStringChanges_0 (copy), l_TextService_0 (copy), l_Separator_0 (copy), l_SearchBar_0 (copy), l_SelectInput_0 (copy), l_map_0 (copy), l_DevFrameworkDropdownMenuHeight_0 (copy), l_ScrollingFrame_0 (copy), l_LoadingIndicator_0 (copy), l_Button_0 (copy), v17 (copy)
    local l_props_0 = v36.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_OnClose_0 = l_props_0.OnClose;
    local l_Games_0 = l_props_0.Games;
    local l_NextPageCursor_0 = l_props_0.NextPageCursor;
    local l_Groups_0 = l_props_0.Groups;
    local v44 = l_props_0.CurrentGameMinAge and l_props_0.CurrentGameMinAge >= 17;
    local l_DispatchLoadExistingGames_0 = l_props_0.DispatchLoadExistingGames;
    local l_OpenChoosePlacePage_0 = l_props_0.OpenChoosePlacePage;
    local v47 = l_Localization_0:getText("GroupDropdown", "MyGames");
    local v48 = {
        {
            Type = v10.SUBJECT_TYPE.USER, 
            Key = l_StudioService_0:getUserId(), 
            Text = v47
        }
    };
    if l_Groups_0 and next(l_Groups_0) ~= nil then
        for _, v50 in pairs(l_Groups_0) do
            table.insert(v48, {
                Type = v10.SUBJECT_TYPE.GROUP, 
                Key = v50.groupId, 
                Text = v50.name
            });
        end;
    end;
    local v51 = v29 or v48[1].Text;
    local v52 = {
        v3.createElement("UIGridLayout", {
            CellSize = UDim2.new(0, l_Stylizer_0.SCREEN_CHOOSE_GAME.ICON_SIZE, 0, l_Stylizer_0.SCREEN_CHOOSE_GAME.TILE_HEIGHT), 
            CellPadding = UDim2.new(0, l_Stylizer_0.SCREEN_CHOOSE_GAME.CELL_PADDING_X, 0, l_Stylizer_0.SCREEN_CHOOSE_GAME.CELL_PADDING_Y), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v3.Ref] = v36.layoutRef
        })
    };
    if l_props_0.GamesQueryState == v10.QUERY_STATE.QUERY_STATE_SUCCESS then
        for _, v54 in pairs(l_Games_0) do
            assert(v54.isUserEligible ~= nil);
            if string.find(v54.name:lower(), v36.state.searchTerm:lower()) and v54.isUserEligible then
                v52[#v52 + 1] = v3.createElement(v18, {
                    Name = v54.name, 
                    Id = v54.rootPlaceId, 
                    PrivacyType = v54.privacyType, 
                    MinimumAge = v54.minimumAge, 
                    LayoutOrder = #v52 + 1, 
                    OnActivated = function() --[[ Line: 146 ]] --[[ Name: OnActivated ]]
                        -- upvalues: l_OpenChoosePlacePage_0 (copy), v54 (copy)
                        l_OpenChoosePlacePage_0(v54, nil);
                    end
                });
            end;
        end;
    end;
    local v55 = l_Stylizer_0.SCREEN_CHOOSE_GAME.ICON_SIZE + l_Stylizer_0.SCREEN_CHOOSE_GAME.TILE_FOOTER_SIZE + l_Stylizer_0.SCREEN_CHOOSE_GAME.CELL_PADDING_Y;
    if math.ceil((#v52 - 1) / 5) * v55 < 3 * v55 and l_NextPageCursor_0 and l_USER_0 and v27 then
        l_DispatchLoadExistingGames_0(l_USER_0, v27, l_NextPageCursor_0);
    end;
    local v56 = l_Localization_0:getText("ScreenHeader", "ChooseGameNew");
    if v44 then
        v56 = if l_EnableContentMaturityStringChanges_0 then v56 .. " " .. l_Localization_0:getText("ScreenHeader", "RestrictedContentWarning") else v56 .. " " .. l_Localization_0:getText("ScreenHeader", "17PlusWarning");
    end;
    local l_Y_0 = l_TextService_0:GetTextSize(v56, 18, l_Stylizer_0.header.font, Vector2.new(5 * v55, 1e999)).Y;
    local l_createElement_0 = v3.createElement;
    local v59 = "Frame";
    local v60 = {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Stylizer_0.backgroundColor
    };
    local v61 = {
        ChooseGameText = if l_EnableContentMaturityStringChanges_0 then v3.createElement("TextLabel", {
            Text = v56, 
            Position = UDim2.new(0, 30, 0, 20), 
            Size = UDim2.new(0.95, 0, 0, l_Y_0), 
            BackgroundTransparency = 1, 
            TextColor3 = l_Stylizer_0.header.text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = l_Stylizer_0.header.font, 
            TextSize = 18, 
            TextWrapped = true
        }) else v3.createElement("TextLabel", {
            Text = v56, 
            Position = UDim2.new(0, 30, 0, 25), 
            BackgroundTransparency = 1, 
            TextColor3 = l_Stylizer_0.header.text, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            Font = l_Stylizer_0.header.font, 
            TextSize = 18
        }), 
        Sep1 = v3.createElement(l_Separator_0, {
            Position = if l_EnableContentMaturityStringChanges_0 then UDim2.new(0.5, 0, 0, 50 + (l_Y_0 / 18 - 1) * 18) else UDim2.new(0.5, 0, 0, 50)
        }), 
        SearchBar = v3.createElement("Frame", {
            Position = if l_EnableContentMaturityStringChanges_0 then UDim2.new(0.6, 4, 0, 70 + (l_Y_0 / 18 - 1) * 18) else UDim2.new(0.6, 4, 0, 70), 
            Size = UDim2.new(0, l_Stylizer_0.DROPDOWN_WIDTH - 10, 0, l_Stylizer_0.DROPDOWN_HEIGHT), 
            BackgroundTransparency = 1
        }, {
            v3.createElement(l_SearchBar_0, {
                Size = UDim2.new(1, 0, 1, 0), 
                ShowSearchIcon = true, 
                ShowSearchButton = false, 
                IncrementalTextSearch = true, 
                OnSearchRequested = v36.OnSearchRequested
            })
        }), 
        GroupDropdownMenu = v3.createElement(l_SelectInput_0, {
            Items = l_map_0(v48, v36.createContentForSelectInput), 
            MenuHeight = l_DevFrameworkDropdownMenuHeight_0 and 600 or nil, 
            OnItemActivated = v36.onItemActivated, 
            PlaceholderText = v51, 
            Position = if l_EnableContentMaturityStringChanges_0 then UDim2.new(0, 30, 0, 70 + (l_Y_0 / 18 - 1) * 18) else UDim2.new(0, 30, 0, 70), 
            SelectedIndex = v27, 
            Size = UDim2.new(0, l_Stylizer_0.selectInput.width.creator, 0, l_Stylizer_0.selectInput.button.height), 
            Width = l_Stylizer_0.selectInput.width.creator
        })
    };
    local v62 = false;
    if l_props_0.GamesQueryState == v10.QUERY_STATE.QUERY_STATE_SUCCESS then
        v62 = v3.createElement(l_ScrollingFrame_0, {
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            Position = if l_EnableContentMaturityStringChanges_0 then UDim2.new(0, 30, 0, 115 + (l_Y_0 / 18 - 1) * 18) else UDim2.new(0, 30, 0, 115), 
            Size = UDim2.new(0.95, 0, 0.7, 0), 
            NextPageRequestDistance = 100, 
            NextPageFunc = function() --[[ Line: 251 ]] --[[ Name: NextPageFunc ]]
                -- upvalues: l_NextPageCursor_0 (copy), l_USER_0 (ref), v27 (ref), l_DispatchLoadExistingGames_0 (copy)
                if l_NextPageCursor_0 and l_USER_0 and v27 then
                    l_DispatchLoadExistingGames_0(l_USER_0, v27, l_NextPageCursor_0);
                end;
            end
        }, v52);
    end;
    v61.MainContentsSuccess = v62;
    v62 = false;
    if l_props_0.GamesQueryState == v10.QUERY_STATE.QUERY_STATE_QUERYING then
        v62 = v3.createElement("Frame", {
            Position = if l_EnableContentMaturityStringChanges_0 then UDim2.new(0, 30, 0, 115 + (l_Y_0 / 18 - 1) * 18) else UDim2.new(0, 30, 0, 115), 
            Size = UDim2.new(0.95, 0, 0.7, 0), 
            BackgroundColor3 = l_Stylizer_0.backgroundColor
        }, {
            v3.createElement(l_LoadingIndicator_0, {
                Position = UDim2.new(0.5, -100, 0, 115), 
                Size = UDim2.new(0, 200, 0, 50)
            })
        });
    end;
    v61.MainContentsQuerying = v62;
    v62 = false;
    if l_props_0.GamesQueryState == v10.QUERY_STATE.QUERY_STATE_FAILED then
        v62 = v3.createElement("Frame", {
            Position = if l_EnableContentMaturityStringChanges_0 then UDim2.new(0, 30, 0, 115 + (l_Y_0 / 18 - 1) * 18) else UDim2.new(0, 30, 0, 115), 
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
                Position = UDim2.new(0.5, 0, 0, 100), 
                Size = UDim2.new(0, 150, 0, 75), 
                Style = "Round", 
                Text = l_Localization_0:getText("Button", "Retry"), 
                OnClick = function() --[[ Line: 295 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_DispatchLoadExistingGames_0 (copy), l_USER_0 (ref), v27 (ref)
                    l_DispatchLoadExistingGames_0(l_USER_0, v27);
                end
            })
        });
    end;
    v61.MainContentsFailed = v62;
    v61.Footer = v3.createElement(v17, {
        MainButton = {
            Name = "Create", 
            Active = false
        }, 
        OnClose = l_OnClose_0, 
        NextScreen = v10.SCREENS.CREATE_NEW_GAME, 
        NextScreenText = "CreateNewGame"
    });
    return l_createElement_0(v59, v60, v61);
end;
v26.willUnmount = function(v63) --[[ Line: 313 ]] --[[ Name: willUnmount ]]
    for v64, _ in v63.props.Games do
        v63.props.Games[v64] = nil;
    end;
end;
v26 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    API = l_ContextServices_0.API
})(v26);
return v4.connect(function(v66, _) --[[ Line: 325 ]] --[[ Name: mapStateToProps ]]
    local l_gameInfo_0 = v66.ExistingGame.gameInfo;
    local l_groupInfo_0 = v66.GroupsHavePermission.groupInfo;
    return {
        NextPageCursor = l_gameInfo_0.nextPageCursor, 
        Games = l_gameInfo_0.games, 
        Groups = l_groupInfo_0.groups, 
        GamesQueryState = l_gameInfo_0.queryState, 
        CurrentGameMinAge = l_gameInfo_0.minimumAge
    };
end, function(v70) --[[ Line: 338 ]] --[[ Name: useDispatchForProps ]]
    -- upvalues: v13 (copy), v11 (copy), v12 (copy), v15 (copy), v10 (copy), v16 (copy)
    return {
        DispatchLoadGroups = function() --[[ Line: 340 ]] --[[ Name: DispatchLoadGroups ]]
            -- upvalues: v70 (copy), v13 (ref)
            v70(v13());
        end, 
        DispatchLoadExistingGames = function(v71, v72, v73) --[[ Line: 343 ]] --[[ Name: DispatchLoadExistingGames ]]
            -- upvalues: v70 (copy), v11 (ref)
            v70(v11(v71, v72, v73));
        end, 
        OpenChoosePlacePage = function(v74, _) --[[ Line: 346 ]] --[[ Name: OpenChoosePlacePage ]]
            -- upvalues: v70 (copy), v12 (ref), v15 (ref), v10 (ref)
            v70(v12(v74));
            v70(v15(v10.SCREENS.CHOOSE_PLACE));
        end, 
        DispatchSetSelectedGroup = function(v76) --[[ Line: 350 ]] --[[ Name: DispatchSetSelectedGroup ]]
            -- upvalues: v70 (copy), v16 (ref)
            v70(v16(v76));
        end
    };
end)(v26);