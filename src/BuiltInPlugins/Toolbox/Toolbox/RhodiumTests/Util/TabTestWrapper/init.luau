local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Parent_0.Core.Components.TabSet);
local v4 = v2.PureComponent:extend("TabTestWrapper");
v4.init = function(v5) --[[ Line: 9 ]] --[[ Name: init ]]
    v5.state = {
        currentTab = "Marketplace"
    };
    v5.changeTab = function(v6) --[[ Line: 14 ]]
        -- upvalues: v5 (copy)
        v5:setState(function() --[[ Line: 15 ]]
            -- upvalues: v6 (copy)
            return {
                currentTab = v6
            };
        end);
    end;
end;
v4.render = function(v7, _) --[[ Line: 23 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v3 (copy)
    return v2.createElement(v3, {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(), 
        CurrentWidth = 565.5, 
        CurrentTab = v7.state.currentTab, 
        Tabs = {
            [1] = {
                Image = "rbxasset://textures/StudioToolbox/Tabs/Shop.png", 
                Key = "Marketplace", 
                Text = "Marketplace"
            }, 
            [2] = {
                Image = "rbxasset://textures/StudioToolbox/Tabs/Shop.png", 
                Key = "Inventory", 
                Text = "Inventory"
            }
        }, 
        onTabSelected = v7.changeTab
    });
end;
return v4;