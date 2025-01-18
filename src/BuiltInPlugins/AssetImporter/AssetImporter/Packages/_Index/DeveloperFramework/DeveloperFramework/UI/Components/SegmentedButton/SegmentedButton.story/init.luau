local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Parent.Cryo);
local v3 = require(l_Parent_0.UI.Components.SegmentedButton);
local v4 = require(l_Parent_0.Util.StyleModifier);
local v5 = v1.PureComponent:extend("SegmentedButtonExample");
v5.init = function(v6) --[[ Line: 11 ]] --[[ Name: init ]]
    v6.state = {
        currentId = nil, 
        currentIndex = nil
    };
    v6.selectItem = function(v7) --[[ Line: 17 ]]
        -- upvalues: v6 (copy)
        if typeof(v7) == "number" then
            v6:setState({
                currentIndex = v7
            });
            return;
        else
            v6:setState({
                currentId = v7.Id
            });
            return;
        end;
    end;
end;
v5.render = function(v8) --[[ Line: 30 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    return v1.createElement(v3, v2.Dictionary.join({
        SelectedId = v8.state.currentId, 
        SelectedIndex = v8.state.currentIndex, 
        Items = {
            "Left", 
            "Center", 
            "Right"
        }, 
        OnItemActivated = v8.selectItem, 
        Size = UDim2.fromOffset(160, 32)
    }, v8.props));
end;
return {
    stories = {
        {
            name = "Default", 
            story = function() --[[ Line: 51 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v5 (copy)
                return v1.createElement(v5);
            end
        }, 
        {
            name = "Two Items", 
            story = function() --[[ Line: 58 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v5 (copy)
                return v1.createElement(v5, {
                    Items = {
                        "Left", 
                        "Right"
                    }
                });
            end
        }, 
        {
            name = "Icon Items", 
            story = function() --[[ Line: 70 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v5 (copy)
                return v1.createElement(v5, {
                    Items = {
                        {
                            Icon = "rbxasset://textures/StudioToolbox/Tabs/Inventory.png", 
                            Id = "Inventory", 
                            Label = "Inventory"
                        }, 
                        {
                            Icon = "rbxasset://textures/StudioToolbox/Tabs/Shop.png", 
                            Id = "Shop", 
                            Label = "Shop"
                        }, 
                        {
                            Icon = "rbxasset://textures/StudioToolbox/Tabs/Recent.png", 
                            Id = "Recent", 
                            Label = "Recent"
                        }
                    }, 
                    Size = UDim2.fromOffset(300, 32)
                });
            end
        }, 
        {
            name = "Icon Items", 
            story = function() --[[ Line: 96 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v5 (copy)
                return v1.createElement(v5, {
                    Items = {
                        {
                            Icon = "rbxasset://textures/StudioToolbox/Tabs/Inventory.png", 
                            Id = "Inventory"
                        }, 
                        {
                            Icon = "rbxasset://textures/StudioToolbox/Tabs/Shop.png", 
                            Id = "Shop"
                        }, 
                        {
                            Icon = "rbxasset://textures/StudioToolbox/Tabs/Recent.png", 
                            Id = "Recent"
                        }
                    }
                });
            end
        }, 
        {
            name = "Disabled", 
            story = function() --[[ Line: 118 ]] --[[ Name: story ]]
                -- upvalues: v1 (copy), v5 (copy), v4 (copy)
                return v1.createElement(v5, {
                    StyleModifier = v4.Disabled
                });
            end
        }
    }
};