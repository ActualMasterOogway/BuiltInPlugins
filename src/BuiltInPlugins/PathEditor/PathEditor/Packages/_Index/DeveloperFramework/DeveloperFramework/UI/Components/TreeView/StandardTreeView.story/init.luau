local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v3 = require(l_Parent_0.UI.Components.TreeView);
local v4 = v1.PureComponent:extend(script.Parent.Name .. "ExampleTreeView");
v4.init = function(v5) --[[ Line: 11 ]] --[[ Name: init ]]
    v5.state = {
        Selection = {}, 
        Expansion = {}, 
        Items = {
            {
                text = "Workspace", 
                children = {
                    {
                        text = "Ocean", 
                        children = {
                            {
                                text = "Billy The Fish"
                            }
                        }
                    }
                }, 
                icon = {
                    Image = "rbxasset://textures/DeveloperFramework/Favorites/star_filled.png", 
                    Size = UDim2.new(0, 14, 0, 14)
                }
            }, 
            {
                text = "ReplicatedStorage", 
                children = {
                    {
                        text = "WeatherSystem"
                    }, 
                    {
                        text = "CloudSystem", 
                        children = {
                            {
                                text = "Cheeky Cumulus"
                            }
                        }
                    }
                }
            }, 
            {
                text = "ServerStorage", 
                children = {
                    {
                        text = "Secret Base - The access code to enter the secret base is actually incredibly long - enough to make the tree view scroll", 
                        icon = {
                            Image = "rbxasset://textures/DeveloperFramework/Favorites/star_filled.png", 
                            Size = UDim2.new(0, 14, 0, 14)
                        }, 
                        children = {
                            {
                                text = "Obsidian Door"
                            }
                        }
                    }
                }
            }
        }
    };
end;
v4.render = function(v6) --[[ Line: 70 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), l_join_0 (copy)
    return v1.createElement(v3, {
        Size = UDim2.new(0, 240, 0, 240), 
        Expansion = v6.state.Expansion, 
        Selection = v6.state.Selection, 
        RootItems = v6.state.Items, 
        Style = "BorderBox", 
        OnExpansionChange = function(v7) --[[ Line: 77 ]] --[[ Name: OnExpansionChange ]]
            -- upvalues: v6 (copy), l_join_0 (ref)
            v6:setState({
                Expansion = l_join_0(v6.state.Expansion, v7)
            });
        end, 
        OnSelectionChange = function(v8) --[[ Line: 82 ]] --[[ Name: OnSelectionChange ]]
            -- upvalues: v6 (copy)
            v6:setState({
                Selection = v8
            });
        end
    });
end;
return {
    stories = {
        {
            name = "Standard", 
            story = v4
        }
    }
};