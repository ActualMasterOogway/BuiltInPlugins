local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_SearchBar_0 = l_UI_0.SearchBar;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local v15 = require(l_Parent_0.Src.Actions);
local v16 = require(l_Parent_0.Src.Util.GetUniqueGroupName);
local v17 = require(l_Parent_0.Src.TagManager);
local v18 = require(script.Parent.NewTagTextInput);
local v19 = require(script.Parent.TagListView);
local v20 = game:DefineFastFlag("TagEditorSearchClear", false);
local v21 = v2.PureComponent:extend("TagTopPane");
v21.init = function(v22) --[[ Line: 70 ]] --[[ Name: init ]]
    -- upvalues: v17 (copy), v16 (copy), v2 (copy)
    v22.onSearchRequested = function(v23) --[[ Line: 71 ]]
        -- upvalues: v22 (copy)
        v22.props.setSearch(v23);
    end;
    v22.onTextChanged = function(v24) --[[ Line: 75 ]]
        -- upvalues: v22 (copy)
        if v24 == "" then
            v22.props.setSearch("");
        end;
    end;
    v22.onDeleteClicked = function() --[[ Line: 81 ]]
        -- upvalues: v22 (copy), v17 (ref)
        local l_props_0 = v22.props;
        if l_props_0.tagMenu then
            v17.Get():DelTag(l_props_0.tagMenu);
            l_props_0.openTagMenu(nil);
            return;
        else
            if l_props_0.groupMenu then
                v17.Get():DeleteGroup(l_props_0.groupMenu);
                l_props_0.openGroupMenu(nil);
            end;
            return;
        end;
    end;
    v22.onNewGroupClicked = function(v26) --[[ Line: 92 ]]
        -- upvalues: v22 (copy), v16 (ref), v17 (ref)
        local l_props_1 = v22.props;
        if l_props_1.tagMenu ~= nil then
            local v28 = v16(v26:getText("Info", "NewGroup"));
            v17.Get():SetGroup(l_props_1.tagMenu, v28);
        end;
    end;
    v22.onWorldViewButtonClicked = function() --[[ Line: 100 ]]
        -- upvalues: v22 (copy)
        local l_props_2 = v22.props;
        l_props_2.setWorldView(not l_props_2.worldView);
        if not l_props_2.worldView then
            l_props_2.Analytics:report("worldVisualization");
        end;
    end;
    v22.state = {
        worldViewButtonWidth = 0
    };
    v22.worldViewButtonRef = v2.createRef();
end;
v21.updateExtents = function(v30, v31) --[[ Line: 115 ]] --[[ Name: updateExtents ]]
    task.defer(function() --[[ Line: 118 ]]
        -- upvalues: v30 (copy), v31 (copy)
        local v32 = v30.worldViewButtonRef.current and v30.worldViewButtonRef.current.AbsoluteSize.X or 0;
        if not v31 or v31.worldViewButtonWidth ~= v32 then
            v30:setState({
                worldViewButtonWidth = v32
            });
        end;
    end);
end;
v21.didUpdate = function(v33, _, v35) --[[ Line: 131 ]] --[[ Name: didUpdate ]]
    v33:updateExtents(v35);
end;
v21.didMount = function(v36) --[[ Line: 135 ]] --[[ Name: didMount ]]
    v36:updateExtents();
end;
v21.render = function(v37) --[[ Line: 139 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_Pane_0 (copy), l_SearchBar_0 (copy), v20 (copy), l_IconButton_0 (copy), v18 (copy), v19 (copy)
    local l_props_3 = v37.props;
    local l_Localization_1 = l_props_3.Localization;
    local l_TagTopPane_0 = l_props_3.Stylizer.TagTopPane;
    local v41 = l_LayoutOrderIterator_0.new();
    local v42 = l_LayoutOrderIterator_0.new();
    local v43 = l_LayoutOrderIterator_0.new();
    local l_VisibleIcon_0 = l_props_3.Stylizer.VisibleIcon;
    local l_VisibleOffIcon_0 = l_props_3.Stylizer.VisibleOffIcon;
    local v46 = l_props_3.groupMenu or not l_props_3.tagMenu;
    local v47 = not l_props_3.tagMenu and not l_props_3.groupMenu;
    local v48 = if v46 then l_Localization_1:getText("Tooltip", "NewGroupDisabled") else l_Localization_1:getText("Tooltip", "NewGroupEnabled");
    local v49 = if v47 then l_Localization_1:getText("Tooltip", "DeleteDisabled") else l_Localization_1:getText("Tooltip", "DeleteEnabled");
    return v2.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        LayoutOrder = 1, 
        Padding = l_TagTopPane_0.Padding
    }, {
        SearchRowPane = v2.createElement(l_Pane_0, {
            Size = l_TagTopPane_0.SearchBarPaneSize, 
            LayoutOrder = v41:getNextOrder(), 
            Layout = Enum.FillDirection.Horizontal, 
            Spacing = l_TagTopPane_0.RowSpacing
        }, {
            SearchBar = v2.createElement(l_SearchBar_0, {
                Size = l_TagTopPane_0.SearchBarSize, 
                ShowSearchButton = false, 
                ShowSearchIcon = true, 
                LayoutOrder = v42:getNextOrder(), 
                OnSearchRequested = v37.onSearchRequested, 
                OnTextChanged = if v20 then v37.onTextChanged else nil, 
                Style = "Compact", 
                PlaceholderText = l_Localization_1:getText("General", "Search")
            }), 
            NewGroupButton = v2.createElement(l_IconButton_0, {
                BackgroundStyle = "RoundBox", 
                LeftIcon = l_TagTopPane_0.NewGroupIcon, 
                OnClick = function() --[[ Line: 185 ]] --[[ Name: OnClick ]]
                    -- upvalues: v37 (copy), l_Localization_1 (copy)
                    v37.onNewGroupClicked(l_Localization_1);
                end, 
                LayoutOrder = v42:getNextOrder(), 
                Style = v46 and "Disabled", 
                Disabled = v46, 
                TooltipText = v48
            }), 
            DeleteButton = v2.createElement(l_IconButton_0, {
                BackgroundStyle = "RoundBox", 
                LeftIcon = l_TagTopPane_0.DeleteIcon, 
                OnClick = v37.onDeleteClicked, 
                LayoutOrder = v42:getNextOrder(), 
                Style = v47 and "Disabled", 
                Disabled = v47, 
                TooltipText = v49
            })
        }), 
        NewTagRowPane = v2.createElement(l_Pane_0, {
            Size = l_TagTopPane_0.NewTagRowSize, 
            LayoutOrder = v41:getNextOrder(), 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }, {
            NewTagTextInput = v2.createElement(v18, {
                WidthOffset = v37.state.worldViewButtonWidth, 
                LayoutOrder = v43:getNextOrder()
            }), 
            ToggleWorldViewButton = v2.createElement(l_IconButton_0, {
                BackgroundStyle = "RoundBox", 
                LeftIcon = if l_props_3.worldView then l_VisibleIcon_0 else l_VisibleOffIcon_0, 
                Padding = 5, 
                Spacing = 4, 
                AutomaticSize = Enum.AutomaticSize.X, 
                Text = l_Localization_1:getText("Info", "WorldView"), 
                OnClick = v37.onWorldViewButtonClicked, 
                LayoutOrder = v43:getNextOrder(), 
                Size = l_TagTopPane_0.WorldViewButtonSize, 
                TooltipText = l_Localization_1:getText("Tooltip", "WorldView"), 
                [v2.Ref] = v37.worldViewButtonRef
            })
        }), 
        TagListView = v2.createElement(v19, {
            LayoutOrder = v41:getNextOrder()
        })
    });
end;
v21 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v21);
return v3.connect(function(v50, _) --[[ Line: 240 ]] --[[ Name: mapStateToProps ]]
    return {
        tagMenu = v50.TagMenu, 
        groupMenu = v50.GroupMenu, 
        worldView = v50.WorldView, 
        groupData = v50.GroupData
    };
end, function(v52) --[[ Line: 249 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v15 (copy)
    return {
        setSearch = function(v53) --[[ Line: 251 ]] --[[ Name: setSearch ]]
            -- upvalues: v52 (copy), v15 (ref)
            v52(v15.SetSearch(v53));
        end, 
        openTagMenu = function(v54) --[[ Line: 254 ]] --[[ Name: openTagMenu ]]
            -- upvalues: v52 (copy), v15 (ref)
            v52(v15.OpenTagMenu(v54));
        end, 
        openGroupMenu = function(v55) --[[ Line: 257 ]] --[[ Name: openGroupMenu ]]
            -- upvalues: v52 (copy), v15 (ref)
            v52(v15.OpenGroupMenu(v55));
        end, 
        setWorldView = function(v56) --[[ Line: 260 ]] --[[ Name: setWorldView ]]
            -- upvalues: v52 (copy), v15 (ref)
            v52(v15.ToggleWorldView(v56));
        end
    };
end)(v21);