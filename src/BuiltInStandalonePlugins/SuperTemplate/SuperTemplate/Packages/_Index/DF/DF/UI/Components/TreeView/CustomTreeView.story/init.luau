local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local l_copy_0 = require(l_Parent_0.Parent.Dash).copy;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.UI);
local l_Button_0 = v3.Button;
local l_Pane_0 = v3.Pane;
local l_TextLabel_0 = v3.TextLabel;
local l_TreeView_0 = v3.TreeView;
local v8 = v2.PureComponent:extend(script.Parent.Name .. "CustomTreeView");
v8.init = function(v9) --[[ Line: 15 ]] --[[ Name: init ]]
    -- upvalues: l_copy_0 (copy)
    v9.state = {
        Expansion = {}, 
        Items = {
            {
                name = "Workspace", 
                children = {
                    {
                        name = "Ocean", 
                        children = {
                            {
                                name = "Billy The Fish"
                            }
                        }
                    }
                }
            }, 
            {
                name = "ReplicatedStorage", 
                children = {
                    {
                        name = "WeatherSystem"
                    }, 
                    {
                        name = "CloudSystem", 
                        children = {
                            {
                                name = "Cheeky Cumulus"
                            }
                        }
                    }
                }
            }, 
            {
                name = "ServerStorage", 
                children = {
                    {
                        name = "Secret Base", 
                        children = {
                            {
                                name = "Obsidian Door"
                            }
                        }
                    }
                }
            }
        }
    };
    v9.onToggle = function(v10) --[[ Line: 63 ]]
        -- upvalues: l_copy_0 (ref), v9 (copy)
        local l_item_0 = v10.item;
        local v12 = l_copy_0(v9.state.Expansion);
        v12[l_item_0] = not v12[l_item_0];
        v9:setState({
            Expansion = v12
        });
    end;
    v9.getRowProps = function(v13, v14, v15, v16) --[[ Line: 71 ]]
        -- upvalues: v9 (copy)
        local l_item_1 = v13.item;
        return {
            Expanded = v9.state.Expansion[l_item_1], 
            OnToggle = v9.onToggle, 
            Key = v14, 
            Position = v15, 
            Row = v13, 
            Size = v16
        };
    end;
end;
local v18 = v2.PureComponent:extend("CustomRow");
v18.init = function(v19) --[[ Line: 85 ]] --[[ Name: init ]]
    v19.onToggle = function() --[[ Line: 86 ]]
        -- upvalues: v19 (copy)
        local l_props_0 = v19.props;
        l_props_0.OnToggle(l_props_0.Row);
    end;
end;
v18.render = function(v21) --[[ Line: 91 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_Pane_0 (copy), l_Button_0 (copy), l_TextLabel_0 (copy)
    local l_props_1 = v21.props;
    local l_Row_0 = l_props_1.Row;
    local l_item_2 = l_Row_0.item;
    local l_Expanded_0 = l_props_1.Expanded;
    local v26 = l_item_2.children and #l_item_2.children > 0;
    local v27 = l_Row_0.depth * 24;
    return v2.createElement(l_Pane_0, {
        Size = l_props_1.Size, 
        Position = l_props_1.Position, 
        Padding = {
            Left = v27
        }
    }, {
        Toggle = v26 and v2.createElement(l_Button_0, {
            Text = l_Expanded_0 and "-" or "+", 
            Position = UDim2.new(0, 5 + v27, 0, 4), 
            Size = UDim2.new(0, 24, 0, 24), 
            OnClick = v21.onToggle
        }) or nil, 
        Label = v2.createElement(l_TextLabel_0, {
            Text = l_item_2.name, 
            Size = UDim2.new(1, -40, 1, 0), 
            Position = UDim2.new(0, 40 + v27, 0, 0), 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    });
end;
v8.render = function(v28) --[[ Line: 120 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_TreeView_0 (copy), v18 (copy)
    return v2.createElement(l_TreeView_0, {
        Size = UDim2.new(0, 240, 0, 240), 
        Expansion = v28.state.Expansion, 
        RootItems = v28.state.Items, 
        Style = "BorderBox", 
        RowComponent = v18, 
        RowHeight = 32, 
        GetRowProps = v28.getRowProps, 
        GetChildren = function(v29) --[[ Line: 129 ]] --[[ Name: GetChildren ]]
            return v29.children or {};
        end
    });
end;
return {
    stories = {
        {
            name = "Example", 
            story = v8
        }
    }
};