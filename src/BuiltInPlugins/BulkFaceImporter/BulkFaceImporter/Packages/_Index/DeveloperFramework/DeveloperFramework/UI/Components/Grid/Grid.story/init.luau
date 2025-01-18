local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v8 = require(l_Parent_0.Parent.Roact);
local l_Components_0 = l_Parent_0.UI.Components;
local v10 = require(l_Components_0.DEPRECATED_Button);
local v11 = require(l_Components_0.Favorites);
local v12 = require(l_Components_0.Grid);
local v13 = require(l_Components_0.Pane);
local v14 = require(l_Components_0.TextLabel);
local v15 = require(l_Components_0.LoadingIndicator);
local v16 = require(l_Parent_0.Parent.Dash);
local l_join_0 = v16.join;
local l_map_0 = v16.map;
local function v20(v19) --[[ Line: 17 ]] --[[ Name: createIconCell ]]
    return {
        text = ("Cell %d"):format(v19), 
        icon = {
            Image = "rbxasset://textures/DeveloperFramework/Favorites/star_filled.png", 
            Size = UDim2.new(0, 16, 0, 16)
        }
    };
end;
local v21 = v8.PureComponent:extend("GridStory");
v21.init = function(v22) --[[ Line: 29 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy)
    local v23 = {};
    for v24 = 1, 10000 do
        table.insert(v23, (v20(v24)));
    end;
    v22.state = {
        cells = v23
    };
end;
v21.render = function(v25) --[[ Line: 39 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v13 (copy), v12 (copy)
    local l_state_0 = v25.state;
    return v8.createElement(v13, {
        Style = "BorderBox", 
        Size = UDim2.new(1, 0, 0, 400)
    }, {
        Grid = v8.createElement(v12, {
            Cells = l_state_0.cells, 
            CellPadding = UDim2.fromOffset(10, 10)
        })
    });
end;
local v27 = v8.PureComponent:extend("AutoloadGridStory");
v27.init = function(v28) --[[ Line: 54 ]] --[[ Name: init ]]
    -- upvalues: v20 (copy)
    v28.maxCellCount = 10000;
    v28.width = 400;
    local v29 = {};
    for v30 = 1, 50 do
        table.insert(v29, (v20(v30)));
    end;
    v28.state = {
        cells = v29, 
        loading = false
    };
end;
v27.render = function(v31) --[[ Line: 69 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v13 (copy), v12 (copy), v16 (copy), v20 (copy), v14 (copy), v15 (copy)
    return v8.createElement(v13, {
        Style = "None", 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, v31.width)
    }, {
        Layout = v8.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Padding = UDim.new(0, 10)
        }), 
        GridPane = v8.createElement(v13, {
            Style = "BorderBox", 
            Size = UDim2.new(1, 0, 0, v31.width), 
            LayoutOrder = 1
        }, {
            Grid = v8.createElement(v12, {
                Cells = v31.state.cells, 
                CellPadding = UDim2.fromOffset(10, 10), 
                OnLoadRange = function(v32, v33) --[[ Line: 90 ]] --[[ Name: OnLoadRange ]]
                    -- upvalues: v31 (copy), v16 (ref), v20 (ref)
                    if #v31.state.cells >= v31.maxCellCount then
                        return;
                    elseif v31.state.loading then
                        return;
                    else
                        v31:setState({
                            loading = true
                        });
                        local v34 = v16.copy(v31.state.cells);
                        for v35 = v32, math.min(v33, v31.maxCellCount) do
                            if not v34[v35] then
                                v34[v35] = v20(v35);
                            end;
                        end;
                        task.delay(1, function() --[[ Line: 107 ]]
                            -- upvalues: v31 (ref), v34 (copy)
                            v31:setState({
                                cells = v34, 
                                loading = false
                            });
                        end);
                        return;
                    end;
                end, 
                LayoutOrder = 2
            })
        }), 
        Info = v8.createElement(v14, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Text = ("Cells loaded: %*/%*"):format(#v31.state.cells, v31.maxCellCount), 
            LayoutOrder = 2
        }), 
        LoadingIndicator = if v31.state.loading then v8.createElement(v15, {
            LayoutOrder = 3
        }) else nil
    });
end;
local function v39(v36) --[[ Line: 131 ]] --[[ Name: createCells ]]
    local v37 = {};
    for v38 = 1, v36 do
        table.insert(v37, {
            text = ("Cell %*"):format(v38)
        });
    end;
    return v37;
end;
local function _(v40) --[[ Line: 141 ]] --[[ Name: createCellGroups ]]
    -- upvalues: l_map_0 (copy)
    local v41 = 1;
    return l_map_0(v40, function(v42) --[[ Line: 143 ]]
        -- upvalues: v41 (ref)
        local v43 = v41 + v42 - 1;
        local v44 = ("Cells %* - %*"):format(v41, v43);
        v41 = v41 + v42;
        return {
            CellCount = v42, 
            IsCollapsed = false, 
            Text = v44
        };
    end);
end;
local function v57(v46) --[[ Line: 155 ]] --[[ Name: createFavoritesCellGroups ]]
    -- upvalues: l_map_0 (copy), l_join_0 (copy)
    local v47 = {
        1408, 
        137, 
        42
    };
    local l_l_map_0_0 = l_map_0;
    local v49 = 1;
    local v50;
    do
        local l_v49_0 = v49;
        v50 = l_map_0(v46, function(v52) --[[ Line: 143 ]]
            -- upvalues: l_v49_0 (ref)
            local v53 = l_v49_0 + v52 - 1;
            local v54 = ("Cells %* - %*"):format(l_v49_0, v53);
            l_v49_0 = l_v49_0 + v52;
            return {
                CellCount = v52, 
                IsCollapsed = false, 
                Text = v54
            };
        end);
    end;
    return l_l_map_0_0(v50, function(v55, v56) --[[ Line: 158 ]]
        -- upvalues: l_join_0 (ref), v47 (copy)
        return l_join_0(v55, {
            Favorites = v47[v56], 
            Text = ("Group %*"):format(v56)
        });
    end);
end;
local function v59(v58) --[[ Line: 166 ]] --[[ Name: CustomCell ]]
    -- upvalues: v8 (copy), v10 (copy)
    return v8.createElement(v10, {
        OnClick = function() --[[ Line: 168 ]] --[[ Name: OnClick ]]

        end, 
        Position = v58.Position, 
        Size = v58.Size, 
        Style = "Round", 
        Text = v58.Cell.text
    });
end;
local function v62(v60) --[[ Line: 176 ]] --[[ Name: FavoritesGroupHeader ]]
    -- upvalues: v8 (copy), v13 (copy), v14 (copy), v11 (copy)
    local l_Style_0 = v60.Style;
    return v8.createElement(v13, {
        BackgroundColor = l_Style_0.BackgroundColor, 
        BorderColor = l_Style_0.BorderColor, 
        Position = v60.Position, 
        Size = v60.Size, 
        Spacing = l_Style_0.Spacing, 
        Style = l_Style_0.Style
    }, {
        Text = v8.createElement(v14, {
            AutomaticSize = Enum.AutomaticSize.X, 
            Position = UDim2.fromOffset(8, 0), 
            Size = UDim2.fromScale(0, 1), 
            Text = v60.Text, 
            TextColor = l_Style_0.TextColor, 
            TextSize = l_Style_0.TextSize, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        Favorites = v8.createElement(v11, {
            AnchorPoint = Vector2.new(1, 0.5), 
            Count = v60.Favorites, 
            IsFavorited = false, 
            OnClick = function() --[[ Line: 201 ]] --[[ Name: OnClick ]]

            end, 
            Position = UDim2.new(1, -8, 0.5, 0), 
            Size = UDim2.fromOffset(50, 20)
        })
    });
end;
local v63 = v8.PureComponent:extend("CellGroupsStory");
v63.init = function(v64, v65) --[[ Line: 210 ]] --[[ Name: init ]]
    v64:setState({
        cells = v65.Cells, 
        groups = v65.CellGroups
    });
end;
v63.render = function(v66) --[[ Line: 217 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v12 (copy), l_join_0 (copy), l_map_0 (copy), v59 (copy)
    local l_props_0 = v66.props;
    local l_state_1 = v66.state;
    return v8.createElement(v12, {
        Cells = l_state_1.cells, 
        CellGroups = l_state_1.groups, 
        CellGroupHeader = l_join_0({
            Collapsible = true, 
            OnExpandCollapseClicked = function(v69) --[[ Line: 226 ]] --[[ Name: OnExpandCollapseClicked ]]
                -- upvalues: v66 (copy), l_map_0 (ref), l_join_0 (ref)
                v66:setState(function(v70) --[[ Line: 227 ]]
                    -- upvalues: l_map_0 (ref), v69 (copy), l_join_0 (ref)
                    return {
                        groups = l_map_0(v70.groups, function(v71, v72) --[[ Line: 229 ]]
                            -- upvalues: v69 (ref), l_join_0 (ref)
                            if v69 == v72 then
                                return l_join_0(v71, {
                                    IsCollapsed = not v71.IsCollapsed
                                });
                            else
                                return v71;
                            end;
                        end)
                    };
                end);
            end
        }, l_props_0.CellGroupHeader), 
        CellComponent = v59, 
        CellPadding = UDim2.fromOffset(10, 10), 
        Size = UDim2.new(1, 0, 0, 400)
    });
end;
local v73 = {};
local v74 = {};
local v75 = {
    name = "Basic", 
    story = v21
};
local v76 = {
    name = "Async autoload", 
    story = v27
};
local v77 = {
    name = "CellGroups"
};
local l_createElement_0 = v8.createElement;
local l_v63_0 = v63;
local v80 = {
    Cells = v39(28)
};
local v81 = {
    12, 
    7, 
    3, 
    6
};
local v82 = 1;
local v83;
do
    local l_v82_0 = v82;
    v83 = l_map_0(v81, function(v85) --[[ Line: 143 ]]
        -- upvalues: l_v82_0 (ref)
        local v86 = l_v82_0 + v85 - 1;
        local v87 = ("Cells %* - %*"):format(l_v82_0, v86);
        l_v82_0 = l_v82_0 + v85;
        return {
            CellCount = v85, 
            IsCollapsed = false, 
            Text = v87
        };
    end);
end;
v80.CellGroups = v83;
v77.story = l_createElement_0(l_v63_0, v80);
l_createElement_0 = {
    name = "CellGroupHeader", 
    story = v8.createElement(v63, {
        Cells = v39(24), 
        CellGroups = v57({
            8, 
            8, 
            8
        }), 
        CellGroupHeader = {
            AfterContent = true, 
            Collapsible = false, 
            HeaderComponent = v62
        }
    })
};
v6(v74, 1, v75, v76, v77, l_createElement_0);
v73.stories = v74;
return v73;