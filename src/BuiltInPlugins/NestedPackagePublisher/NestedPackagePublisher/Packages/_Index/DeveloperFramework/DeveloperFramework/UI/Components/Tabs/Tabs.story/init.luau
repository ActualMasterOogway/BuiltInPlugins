local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local _ = require(l_Parent_0.UI.Components.Tabs.types);
local v3 = require(l_Parent_0.UI.Components.Tabs);
local v4 = v1.PureComponent:extend("Tabs");
v4.init = function(v5) --[[ Line: 9 ]] --[[ Name: init ]]
    v5.state = {
        selectedTab = v5.props.Tabs[1]
    };
    v5.onTabSelected = function(v6) --[[ Line: 13 ]]
        -- upvalues: v5 (copy)
        print("Selected tab", v6);
        v5:setState({
            selectedTab = v6
        });
    end;
end;
v4.render = function(v7) --[[ Line: 21 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy)
    local l_props_0 = v7.props;
    local l_state_0 = v7.state;
    return v1.createElement(v3, {
        Tabs = l_props_0.Tabs, 
        SelectedTab = l_state_0.selectedTab, 
        OnTabSelected = v7.onTabSelected
    });
end;
return {
    stories = {
        {
            name = "Labels", 
            story = v1.createElement(v4, {
                Tabs = {
                    {
                        Label = "Left"
                    }, 
                    {
                        Label = "Middle"
                    }, 
                    {
                        Label = "Right"
                    }
                }
            })
        }, 
        {
            name = "Icons & tooltips", 
            story = v1.createElement(v4, {
                Tabs = {
                    {
                        Icon = "rbxasset://textures/StudioToolbox/Tabs/Inventory.png", 
                        Tooltip = "Inventory"
                    }, 
                    {
                        Icon = "rbxasset://textures/StudioToolbox/Tabs/Shop.png", 
                        Tooltip = "Shop"
                    }, 
                    {
                        Icon = "rbxasset://textures/StudioToolbox/Tabs/Recent.png", 
                        Tooltip = "Recent"
                    }
                }
            })
        }, 
        {
            name = "Labels & icons", 
            story = v1.createElement(v4, {
                Tabs = {
                    {
                        Icon = "rbxasset://textures/StudioToolbox/Tabs/Inventory.png", 
                        Label = "Inventory"
                    }, 
                    {
                        Icon = "rbxasset://textures/StudioToolbox/Tabs/Shop.png", 
                        Label = "Shop"
                    }, 
                    {
                        Icon = "rbxasset://textures/StudioToolbox/Tabs/Recent.png", 
                        Label = "Recent"
                    }
                }
            })
        }, 
        {
            name = "Disabled tab", 
            story = v1.createElement(v4, {
                Tabs = {
                    {
                        Icon = "rbxasset://textures/StudioToolbox/Tabs/Inventory.png", 
                        Label = "Inventory"
                    }, 
                    {
                        Icon = "rbxasset://textures/StudioToolbox/Tabs/Shop.png", 
                        Label = "Shop", 
                        Disabled = true
                    }, 
                    {
                        Icon = "rbxasset://textures/StudioToolbox/Tabs/Recent.png", 
                        Label = "Recent"
                    }
                }
            })
        }
    }
};