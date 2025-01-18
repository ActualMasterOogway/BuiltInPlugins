local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Dash);
local l_join_0 = v1.join;
local l_map_0 = v1.map;
local l_sort_0 = table.sort;
local v5 = require(l_Parent_0.Parent.Roact);
local v6 = require(l_Parent_0.UI.Components.TreeTable);
local v7 = v5.PureComponent:extend(script.Parent.Name .. "ExampleTreeTable");
local v8 = {
    {
        Name = "Name", 
        Key = "name"
    }, 
    {
        Name = "Value", 
        Key = "value"
    }
};
v7.init = function(v9) --[[ Line: 25 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), l_join_0 (copy), l_sort_0 (copy)
    v9.state = {
        SortChildren = nil, 
        SortIndex = nil, 
        SortOrder = nil, 
        Expansion = {}, 
        Sizes = {
            UDim.new(0.5, 0), 
            UDim.new(0.5, 0)
        }, 
        Items = {
            {
                name = "Workspace", 
                value = {
                    Value = 12, 
                    LeftIcon = {
                        Image = "rbxasset://textures/DeveloperFramework/Favorites/star_filled.png", 
                        Size = UDim2.new(0, 14, 0, 14)
                    }
                }, 
                children = {
                    {
                        name = "Ocean", 
                        value = 53, 
                        children = {
                            {
                                name = "Billy The Fish", 
                                value = 12
                            }
                        }
                    }
                }
            }, 
            {
                name = "ReplicatedStorage", 
                value = 18, 
                children = {
                    {
                        name = "WeatherSystem", 
                        value = {
                            Value = 193, 
                            LeftIcon = {
                                Image = "rbxasset://textures/DeveloperFramework/Favorites/star_filled.png", 
                                Size = UDim2.new(0, 14, 0, 14)
                            }
                        }
                    }, 
                    {
                        name = "CloudSystem", 
                        value = 9001, 
                        children = {
                            {
                                name = "Cheeky Cumulus", 
                                value = {
                                    Value = 200, 
                                    LeftIcon = {
                                        Image = "rbxasset://textures/DeveloperFramework/Favorites/star_filled.png", 
                                        Size = UDim2.new(0, 14, 0, 14)
                                    }
                                }
                            }
                        }
                    }
                }
            }, 
            {
                name = "ServerStorage", 
                value = 30, 
                children = {
                    {
                        name = "Secret Base", 
                        value = 212, 
                        children = {
                            {
                                name = "Obsidian Door", 
                                value = 120
                            }
                        }
                    }
                }
            }
        }
    };
    v9.onSortChange = function(v10, v11) --[[ Line: 105 ]]
        -- upvalues: v8 (ref), l_join_0 (ref), v9 (copy), l_sort_0 (ref)
        local function v17(v12, v13) --[[ Line: 106 ]] --[[ Name: sortChildren ]]
            -- upvalues: v8 (ref), v10 (copy), v11 (copy)
            local v14 = v8[v10];
            local v15 = typeof(v12[v14.Key]) == "table" and v12[v14.Key].Value or v12[v14.Key];
            local v16 = typeof(v13[v14.Key]) == "table" and v13[v14.Key].Value or v13[v14.Key];
            if v11 == Enum.SortDirection.Descending then
                return v15 < v16;
            else
                return v16 < v15;
            end;
        end;
        local v18 = l_join_0(v9.state.Items);
        l_sort_0(v18, v17);
        v9:setState({
            Items = v18, 
            SortChildren = v17, 
            SortIndex = v10, 
            SortOrder = v11
        });
    end;
    v9.onSizesChange = function(v19) --[[ Line: 125 ]]
        -- upvalues: v9 (copy)
        v9:setState({
            Sizes = v19
        });
    end;
end;
v7.render = function(v20) --[[ Line: 132 ]] --[[ Name: render ]]
    -- upvalues: l_map_0 (copy), v8 (copy), l_join_0 (copy), v5 (copy), v6 (copy)
    local v23 = l_map_0(v8, function(v21, v22) --[[ Line: 133 ]]
        -- upvalues: l_join_0 (ref), v20 (copy)
        return l_join_0(v21, {
            Width = v20.state.Sizes[v22]
        });
    end);
    return v5.createElement(v6, {
        Columns = v23, 
        SortIndex = v20.state.SortIndex, 
        SortOrder = v20.state.SortOrder, 
        SortChildren = v20.state.SortChildren, 
        OnSortChange = v20.onSortChange, 
        Size = UDim2.new(1, 0, 0, 240), 
        OnExpansionChange = function(v24) --[[ Line: 146 ]] --[[ Name: OnExpansionChange ]]
            -- upvalues: v20 (copy), l_join_0 (ref)
            v20:setState({
                Expansion = l_join_0(v20.state.Expansion, v24)
            });
        end, 
        OnColumnSizesChange = v20.onSizesChange, 
        Expansion = v20.state.Expansion, 
        RootItems = v20.state.Items, 
        GetChildren = function(v25) --[[ Line: 154 ]] --[[ Name: GetChildren ]]
            return v25.children or {};
        end, 
        UseScale = true, 
        ClampSize = true, 
        Scroll = true
    });
end;
return v7;