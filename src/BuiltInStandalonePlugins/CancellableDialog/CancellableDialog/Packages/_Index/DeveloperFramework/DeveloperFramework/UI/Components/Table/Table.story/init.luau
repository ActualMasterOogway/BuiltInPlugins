local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.Pane);
local v3 = require(l_Parent_0.UI.Components.Table);
local v4 = require(l_Parent_0.UI.Components.Tooltip);
local v5 = require(l_Parent_0.UI.Components.TextLabel);
local v6 = require(l_Parent_0.Parent.Dash);
local l_copy_0 = v6.copy;
local l_join_0 = v6.join;
local l_map_0 = v6.map;
local l_insert_0 = table.insert;
local v11 = {};
for v12 = 1, 1000 do
    l_insert_0(v11, {
        Name = "Row " .. v12, 
        Count = math.floor(math.random() * 100), 
        Size = math.floor(math.random() * 100) * 10 .. "px"
    });
end;
local v13 = v1.PureComponent:extend("TableStory");
v13.init = function(v14) --[[ Line: 27 ]] --[[ Name: init ]]
    v14.state = {
        sizes = v14.props.InitialSizes
    };
    v14.onSizesChange = function(v15) --[[ Line: 31 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            sizes = v15
        });
    end;
end;
v13.render = function(v16) --[[ Line: 38 ]] --[[ Name: render ]]
    -- upvalues: l_map_0 (copy), l_join_0 (copy), l_copy_0 (copy), v1 (copy), v3 (copy)
    local l_props_0 = v16.props;
    local l_state_0 = v16.state;
    local v21 = l_map_0(l_props_0.Columns, function(v19, v20) --[[ Line: 41 ]]
        -- upvalues: l_join_0 (ref), l_state_0 (copy)
        return l_join_0(v19, {
            Width = l_state_0.sizes[v20]
        });
    end);
    local v22 = l_copy_0(l_props_0.Rows);
    return v1.createElement(v3, l_join_0(l_props_0, {
        OnColumnSizesChange = v16.onSizesChange, 
        Rows = v22, 
        Columns = v21
    }));
end;
local v23 = {
    {
        Name = "Name"
    }, 
    {
        Name = "Count"
    }, 
    {
        Name = "Size"
    }
};
local v24 = {
    {
        Name = "Left", 
        Count = 1, 
        Size = "50px"
    }, 
    {
        Name = "Middle", 
        Count = 10, 
        Size = "80px"
    }, 
    {
        Name = "Right", 
        Count = 3, 
        Size = "20px"
    }
};
local v25 = {
    {
        Name = "Left", 
        Count = 1, 
        Size = "50px"
    }, 
    {
        Name = "Middle", 
        Count = 10, 
        Size = "80px"
    }, 
    {
        Name = "This cell/row will have a larger row height because it has more characters", 
        Count = 3, 
        Size = "20px"
    }
};
return {
    stories = {
        {
            name = "Fixed size", 
            story = v1.createElement(v13, {
                UseScale = true, 
                ClampSize = true, 
                InitialSizes = {
                    UDim.new(0.3333333333333333, 0), 
                    UDim.new(0.3333333333333333, 0), 
                    UDim.new(0.3333333333333333, 0)
                }, 
                Size = UDim2.new(1, 0, 0, 200), 
                Columns = v23, 
                Rows = v24
            })
        }, 
        {
            name = "With footer", 
            story = v1.createElement(v13, {
                UseScale = true, 
                ClampSize = true, 
                Size = UDim2.new(1, 0, 0, 200), 
                InitialSizes = {
                    UDim.new(0.3333333333333333, 0), 
                    UDim.new(0.3333333333333333, 0), 
                    UDim.new(0.3333333333333333, 0)
                }, 
                Footer = v1.createElement(v2, {
                    Padding = 5, 
                    Layout = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left
                }, {
                    Label = v1.createElement(v5, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        Text = "3 items"
                    })
                }), 
                Columns = v23, 
                Rows = v24
            })
        }, 
        {
            name = "With scroll", 
            story = v1.createElement(v13, {
                Scroll = true, 
                UseScale = true, 
                ClampSize = true, 
                Size = UDim2.new(1, 0, 0, 200), 
                InitialSizes = {
                    UDim.new(0.3333333333333333, 0), 
                    UDim.new(0.3333333333333333, 0), 
                    UDim.new(0.3333333333333333, 0)
                }, 
                Footer = v1.createElement(v2, {
                    Padding = 5, 
                    Layout = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left
                }, {
                    Label = v1.createElement(v5, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        Text = "1000 items"
                    })
                }), 
                Columns = v23, 
                Rows = v11
            })
        }, 
        {
            name = "With GetRowHeight", 
            story = v1.createElement(v13, {
                Size = UDim2.new(1, 0, 0, 200), 
                InitialSizes = {
                    UDim.new(0.3333333333333333, 0), 
                    UDim.new(0.3333333333333333, 0), 
                    UDim.new(0.3333333333333333, 0)
                }, 
                Columns = v23, 
                CellComponent = function(v26) --[[ Line: 110 ]] --[[ Name: WrappedTableCell ]]
                    -- upvalues: v1 (copy), v2 (copy), v5 (copy), v4 (copy)
                    local l_Value_0 = v26.Value;
                    local l_Style_0 = v26.Style;
                    local v29 = v26.Width or UDim.new(1 / #v26.Columns, 0);
                    local v30 = if v26.Emphasis then l_Style_0.BackgroundOdd else l_Style_0.BackgroundEven;
                    local v31 = nil;
                    v31 = if typeof(l_Value_0) == "number" and math.floor(l_Value_0) ~= l_Value_0 then ("%.3f"):format(l_Value_0) else tostring(l_Value_0);
                    local v32 = v26.Tooltip or v31;
                    local v33 = false;
                    if v32 ~= nil then
                        v33 = v32 ~= "";
                    end;
                    return v1.createElement(v2, {
                        LayoutOrder = v26.ColumnIndex, 
                        Padding = {
                            Top = 1, 
                            Bottom = 1, 
                            Left = 5, 
                            Right = 5
                        }, 
                        Style = "Box", 
                        BackgroundColor3 = v30, 
                        BorderSizePixel = 1, 
                        BorderColor3 = l_Style_0.Border, 
                        Size = UDim2.new(v29.Scale, v29.Offset, 1, 0), 
                        ClipsDescendants = true
                    }, {
                        Text = v1.createElement(v5, {
                            Text = v31, 
                            TextWrapped = true, 
                            Size = UDim2.fromScale(1, 1), 
                            TextXAlignment = Enum.TextXAlignment.Left
                        }), 
                        Tooltip = v33 and v1.createElement(v4, {
                            MaxWidth = l_Style_0.Tooltip.MaxWidth, 
                            Text = v32, 
                            TextXAlignment = Enum.TextXAlignment.Left
                        })
                    });
                end, 
                Rows = v25, 
                RowHeight = 20, 
                GetRowHeight = function(v34, v35) --[[ Line: 102 ]] --[[ Name: getRowHeight ]]
                    local v36 = math.ceil(string.len(v34.Name) / 20) - 1;
                    if v36 > 0 then
                        return v35 + v36 * 20;
                    else
                        return v35;
                    end;
                end
            })
        }
    }
};