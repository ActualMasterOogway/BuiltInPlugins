local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.UI.Components.TreeTable);
local v4 = v2.PureComponent:extend(script.Parent.Name .. "ExampleTreeTable");
v4.init = function(v5) --[[ Line: 11 ]] --[[ Name: init ]]
    v5.state = {
        Expansion = {}, 
        Selection = {}, 
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
end;
v4.render = function(v6) --[[ Line: 90 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy), l_join_0 (copy)
    return v2.createElement(v3, {
        Size = UDim2.new(1, 0, 0, 240), 
        Columns = {
            {
                Name = "Name", 
                Key = "name"
            }, 
            {
                Name = "Value", 
                Key = "value"
            }
        }, 
        OnExpansionChange = function(v7) --[[ Line: 103 ]] --[[ Name: OnExpansionChange ]]
            -- upvalues: v6 (copy), l_join_0 (ref)
            v6:setState({
                Expansion = l_join_0(v6.state.Expansion, v7)
            });
        end, 
        OnSelectionChange = function(v8) --[[ Line: 108 ]] --[[ Name: OnSelectionChange ]]
            -- upvalues: v6 (copy)
            v6:setState({
                Selection = v8
            });
        end, 
        Expansion = v6.state.Expansion, 
        Selection = v6.state.Selection, 
        RootItems = v6.state.Items, 
        GetChildren = function(v9) --[[ Line: 116 ]] --[[ Name: GetChildren ]]
            return v9.children or {};
        end, 
        Scroll = true
    });
end;
return v4;