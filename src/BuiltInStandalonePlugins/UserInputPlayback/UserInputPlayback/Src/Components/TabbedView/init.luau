local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_UserInputPlaybackPluginFixTabInitiallySelected_0 = game:GetFastFlag("UserInputPlaybackPluginFixTabInitiallySelected");
local l_UI_0 = v2.UI;
local l_Tabs_0 = l_UI_0.Tabs;
local v7 = v1.PureComponent:extend("TabbedView");
v7.init = function(v8) --[[ Line: 18 ]] --[[ Name: init ]]
    local l_props_0 = v8.props;
    assert(l_props_0.Tabs);
    assert(#l_props_0.Tabs >= 1);
    v8.state = {
        selectedTab = l_props_0.InitialTab or l_props_0.Tabs[1]
    };
    v8.onTabSelected = function(v10) --[[ Line: 28 ]]
        -- upvalues: v8 (copy)
        v8:setState({
            selectedTab = v10
        });
    end;
end;
v7.render = function(v11) --[[ Line: 35 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_UI_0 (copy), l_Tabs_0 (copy), l_UserInputPlaybackPluginFixTabInitiallySelected_0 (copy)
    local l_props_1 = v11.props;
    local l_state_0 = v11.state;
    local l_Stylizer_0 = l_props_1.Stylizer;
    return v1.createElement(l_UI_0.Pane, {
        Size = UDim2.new(1, 0, 1, 0), 
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        TabBar = v1.createElement(l_UI_0.Pane, {
            Style = "Box", 
            BackgroundColor = l_Stylizer_0.TabBarBackgroundColor, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            Tabs = v1.createElement(l_Tabs_0, {
                Tabs = l_props_1.Tabs, 
                SelectedTab = if l_UserInputPlaybackPluginFixTabInitiallySelected_0 then l_state_0.selectedTab.Key else l_state_0.selectedTab, 
                OnTabSelected = v11.onTabSelected
            })
        }), 
        TabContent = v1.createElement(l_UI_0.Pane, {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = l_Stylizer_0.ForegroundTabColor
        }, {
            TabView = v1.createElement(l_state_0.selectedTab.ContentComponent)
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v7));