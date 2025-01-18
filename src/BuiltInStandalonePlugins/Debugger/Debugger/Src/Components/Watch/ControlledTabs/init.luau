local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local l_Tabs_0 = require(l_Parent_0.Packages.Framework).UI.Tabs;
local l_Models_0 = l_Parent_0.Src.Models;
local v5 = require(l_Models_0.Watch.TableTab);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v7 = require(l_Actions_0.Watch.SetTab);
local v8 = v1.PureComponent:extend("Tabs");
v8.render = function(v9) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Tabs_0 (copy)
    local l_props_0 = v9.props;
    return v1.createElement(l_Tabs_0, {
        Tabs = l_props_0.Tabs, 
        SelectedTab = l_props_0.selectedTab, 
        OnTabSelected = l_props_0.onTabSelected, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = l_props_0.Size, 
        AutomaticSize = Enum.AutomaticSize.X
    });
end;
return (v2.connect(function(v11, v12) --[[ Line: 29 ]]
    -- upvalues: v5 (copy)
    return {
        selectedTab = v11.Watch.currentTab == v5.Variables and v12.Tabs[1] or v12.Tabs[2]
    };
end, function(v13) --[[ Line: 35 ]]
    -- upvalues: v7 (copy)
    return {
        onTabSelected = function(v14) --[[ Line: 37 ]] --[[ Name: onTabSelected ]]
            -- upvalues: v13 (copy), v7 (ref)
            local l_Key_0 = v14.Key;
            return v13(v7(l_Key_0));
        end
    };
end)(v8));