local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_Pane_0 = v1.UI.Pane;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v6 = require(l_Components_0.MainTabsView);
local v7 = v2.PureComponent:extend("MainView");
v7.render = function(v8) --[[ Line: 16 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_Pane_0 (copy), v6 (copy)
    local l_props_0 = v8.props;
    local v10 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        BackgroundTransparency = 1
    }, {
        MainTabs = v2.createElement(v6, {
            OnResetPlugin = l_props_0.OnResetPlugin, 
            LayoutOrder = v10:getNextOrder()
        })
    });
end;
return v7;