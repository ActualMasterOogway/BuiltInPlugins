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
local v9 = require(l_Parent_0.UI);
local l_List_0 = v9.List;
local l_Pane_0 = v9.Pane;
local l_insert_0 = table.insert;
local v13 = require(l_Parent_0.Parent.Dash);
local l_join_0 = v13.join;
local l_map_0 = v13.map;
local v16 = v8.PureComponent:extend("ListStory");
v16.init = function(v17) --[[ Line: 17 ]] --[[ Name: init ]]
    -- upvalues: l_insert_0 (copy)
    local v18 = {};
    for v19 = 1, 10000 do
        l_insert_0(v18, {
            text = ("Row %d"):format(v19), 
            icon = {
                Image = "rbxasset://textures/DeveloperFramework/Favorites/star_filled.png", 
                Size = UDim2.new(0, 16, 0, 16)
            }
        });
    end;
    v17.state = {
        rows = v18
    };
end;
v16.render = function(v20) --[[ Line: 33 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), l_Pane_0 (copy), l_List_0 (copy)
    local l_state_0 = v20.state;
    return v8.createElement(l_Pane_0, {
        Style = "BorderBox", 
        Size = UDim2.fromOffset(200, 400)
    }, {
        List = v8.createElement(l_List_0, {
            Rows = l_state_0.rows
        })
    });
end;
local v22 = v8.PureComponent:extend("ListStory");
v22.init = function(v23) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: l_insert_0 (copy)
    v23.state = {
        expandedRow = nil
    };
    local v24 = {};
    for v25 = 1, 10000 do
        l_insert_0(v24, {
            key = tostring(v25), 
            text = ("Row %d"):format(v25), 
            icon = {
                Image = "rbxasset://textures/DeveloperFramework/Favorites/star_filled.png", 
                Size = UDim2.new(0, 16, 0, 16)
            }
        });
    end;
    v23.state = {
        rows = v24
    };
end;
v22.render = function(v26) --[[ Line: 67 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), l_Pane_0 (copy), l_List_0 (copy)
    local l_state_1 = v26.state;
    local v32 = {
        HEADER = {
            AbsoluteSize = Vector2.new(200, 20), 
            OnRender = function(_, v29, v30, v31) --[[ Line: 72 ]] --[[ Name: OnRender ]]
                -- upvalues: v8 (ref)
                return v8.createElement("TextLabel", {
                    BackgroundColor3 = Color3.fromHex("#ffa078"), 
                    LayoutOrder = v29, 
                    Position = v30, 
                    Size = v31, 
                    Text = "Custom Header!!"
                });
            end
        }
    };
    if l_state_1.expandedRow then
        v32[l_state_1.expandedRow] = {
            AbsoluteSize = Vector2.new(200, 50), 
            OnRender = function(v33, v34, v35, v36) --[[ Line: 86 ]] --[[ Name: OnRender ]]
                -- upvalues: v8 (ref)
                return v8.createElement("TextLabel", {
                    BackgroundColor3 = Color3.fromHex("#ccfaff"), 
                    LayoutOrder = v34, 
                    Position = v35, 
                    Size = v36, 
                    Text = "Expanded " .. v33.text
                });
            end
        };
    end;
    return v8.createElement(l_Pane_0, {
        Style = "BorderBox", 
        Size = UDim2.fromOffset(200, 400)
    }, {
        List = v8.createElement(l_List_0, {
            GetRowProps = function(v37, v38, v39, v40) --[[ Line: 103 ]] --[[ Name: GetRowProps ]]
                -- upvalues: v8 (ref), v26 (copy)
                return {
                    LayoutOrder = v38, 
                    Position = v39, 
                    Size = v40, 
                    Text = v37.text, 
                    [v8.Event.Activated] = function() --[[ Line: 109 ]]
                        -- upvalues: v26 (ref), v37 (copy)
                        v26:setState({
                            expandedRow = v37.key
                        });
                    end
                };
            end, 
            Rows = l_state_1.rows, 
            RowComponent = "TextButton", 
            SpecialRows = v32
        })
    });
end;
local function v44(v41) --[[ Line: 123 ]] --[[ Name: createRows ]]
    local v42 = {};
    for v43 = 1, v41 do
        table.insert(v42, {
            text = ("Row %*"):format(v43)
        });
    end;
    return v42;
end;
local function _(v45) --[[ Line: 133 ]] --[[ Name: createRowGroups ]]
    -- upvalues: l_map_0 (copy)
    local v46 = 1;
    return l_map_0(v45, function(v47) --[[ Line: 135 ]]
        -- upvalues: v46 (ref)
        local v48 = v46 + v47 - 1;
        local v49 = ("Rows %* - %*"):format(v46, v48);
        v46 = v46 + v47;
        return {
            CellCount = v47, 
            IsCollapsed = false, 
            Text = v49
        };
    end);
end;
local v51 = v8.PureComponent:extend("RowGroupsStory");
v51.init = function(v52, v53) --[[ Line: 149 ]] --[[ Name: init ]]
    v52:setState({
        rows = v53.Rows, 
        groups = v53.RowGroups
    });
end;
v51.render = function(v54) --[[ Line: 156 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), l_List_0 (copy), l_join_0 (copy), l_map_0 (copy)
    local l_props_0 = v54.props;
    local l_state_2 = v54.state;
    return v8.createElement(l_List_0, {
        GetRowProps = function(v57, v58, v59, v60) --[[ Line: 161 ]] --[[ Name: GetRowProps ]]
            return {
                LayoutOrder = v58, 
                Position = v59, 
                Size = v60, 
                Text = v57.text
            };
        end, 
        Rows = l_state_2.rows, 
        RowComponent = "TextButton", 
        RowGroups = l_state_2.groups, 
        RowGroupHeader = l_join_0({
            Collapsible = true, 
            OnExpandCollapseClicked = function(v61) --[[ Line: 174 ]] --[[ Name: OnExpandCollapseClicked ]]
                -- upvalues: v54 (copy), l_map_0 (ref), l_join_0 (ref)
                v54:setState(function(v62) --[[ Line: 175 ]]
                    -- upvalues: l_map_0 (ref), v61 (copy), l_join_0 (ref)
                    return {
                        groups = l_map_0(v62.groups, function(v63, v64) --[[ Line: 177 ]]
                            -- upvalues: v61 (ref), l_join_0 (ref)
                            if v61 == v64 then
                                return l_join_0(v63, {
                                    IsCollapsed = not v63.IsCollapsed
                                });
                            else
                                return v63;
                            end;
                        end)
                    };
                end);
            end
        }, l_props_0.RowGroupHeader), 
        Size = UDim2.fromOffset(200, 400)
    });
end;
local v65 = {};
local v66 = {};
local v67 = {
    name = "Basic", 
    story = v16
};
local v68 = {
    name = "SpecialRows", 
    description = "Example using SpecialRows to make a header and expanded content", 
    story = v22
};
local v69 = {
    name = "RowGroups"
};
local l_createElement_0 = v8.createElement;
local l_v51_0 = v51;
local v72 = {
    Rows = v44(16)
};
local v73 = {
    8, 
    4, 
    4
};
local v74 = 1;
local v75;
do
    local l_v74_0 = v74;
    v75 = l_map_0(v73, function(v77) --[[ Line: 135 ]]
        -- upvalues: l_v74_0 (ref)
        local v78 = l_v74_0 + v77 - 1;
        local v79 = ("Rows %* - %*"):format(l_v74_0, v78);
        l_v74_0 = l_v74_0 + v77;
        return {
            CellCount = v77, 
            IsCollapsed = false, 
            Text = v79
        };
    end);
end;
v72.RowGroups = v75;
v69.story = l_createElement_0(l_v51_0, v72);
v6(v66, 1, v67, v68, v69);
v65.stories = v66;
return v65;