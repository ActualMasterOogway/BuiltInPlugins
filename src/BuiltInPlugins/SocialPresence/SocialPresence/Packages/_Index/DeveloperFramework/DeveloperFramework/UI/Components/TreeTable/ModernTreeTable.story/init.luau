local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.UI.Components.TreeTable);
local v4 = require(l_Parent_0.UI.Components.TextLabel);
local v5 = require(l_Parent_0.SharedFlags).getFFlagDevFrameworkModernTreeTable();
local v6 = v2.PureComponent:extend(script.Parent.Name .. "ModernTreeTable");
v6.init = function(v7) --[[ Line: 13 ]] --[[ Name: init ]]
    v7.state = {
        Expansion = {}, 
        Selection = {}, 
        Items = {
            {
                name = "Very long workspace that should wrap Very long workspace that should wrap Very long workspace that should wrap Very long workspace that should wrap Very long workspace that should wrap", 
                value = {
                    Value = "Very long value that should wrap Very long value that should wrap Very long value that should wrap Very long value that should wrap Very long value that should wrap", 
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
v6.render = function(v8) --[[ Line: 92 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v2 (copy), v4 (copy), v3 (copy), l_join_0 (copy)
    if not v5 then
        return v2.createElement(v4, {
            Text = "Please enable FFlagDevFrameworkModernTreeTable"
        });
    else
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
            OnExpansionChange = function(v9) --[[ Line: 109 ]] --[[ Name: OnExpansionChange ]]
                -- upvalues: v8 (copy), l_join_0 (ref)
                v8:setState({
                    Expansion = l_join_0(v8.state.Expansion, v9)
                });
            end, 
            OnSelectionChange = function(v10) --[[ Line: 114 ]] --[[ Name: OnSelectionChange ]]
                -- upvalues: v8 (copy)
                v8:setState({
                    Selection = v10
                });
            end, 
            Expansion = v8.state.Expansion, 
            Selection = v8.state.Selection, 
            RootItems = v8.state.Items, 
            GetChildren = function(v11) --[[ Line: 122 ]] --[[ Name: GetChildren ]]
                return v11.children or {};
            end, 
            Scroll = false, 
            Variant = "modern"
        });
    end;
end;
return v6;