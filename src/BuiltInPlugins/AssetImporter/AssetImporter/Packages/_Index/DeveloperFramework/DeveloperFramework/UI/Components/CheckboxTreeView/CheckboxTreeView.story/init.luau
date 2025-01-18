local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v3 = require(l_Parent_0.UI.Components.CheckboxTreeView);
local v4 = v1.PureComponent:extend(script.Parent.Name .. "ExampleCheckboxTreeView");
v4.init = function(v5) --[[ Line: 11 ]] --[[ Name: init ]]
    v5.state = {
        checked = {}, 
        items = {
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
v4.render = function(v6) --[[ Line: 69 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), l_join_0 (copy)
    return v1.createElement(v3, {
        Size = UDim2.new(0, 240, 0, 240), 
        RootItems = v6.state.items, 
        Checked = v6.state.checked, 
        OnCheck = function(v7) --[[ Line: 74 ]] --[[ Name: OnCheck ]]
            -- upvalues: v6 (copy), l_join_0 (ref)
            v6:setState({
                checked = l_join_0(v6.state.checked, v7)
            });
        end, 
        ToggleAncestors = v3.UpPropagators.toggleAncestorsByAllChildren, 
        ToggleDescendants = v3.DownPropagators.toggleAllChildren, 
        Style = "BorderBox"
    });
end;
return v4;