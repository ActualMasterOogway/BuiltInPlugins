local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Tabs_0 = l_UI_0.Tabs;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v10 = require(l_Actions_0.SetSelectedTab);
local v11 = require(l_Actions_0.SetAllTabsData);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v13 = require(l_Util_0.TabsData);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v15 = require(l_Components_0.Summary.SummaryPane);
local v16 = require(l_Components_0.CharacterConversionPane);
local _ = require(l_Components_0.ScriptConversionPane);
local v18 = require(l_Components_0.ScriptPane);
local v19 = require(l_Components_0.AnimationConversionPane);
local v20 = require(l_Components_0.IconTab);
local v21 = v2.PureComponent:extend("MainTabsView");
v21.init = function(v22) --[[ Line: 32 ]] --[[ Name: init ]]
    local l_props_0 = v22.props;
    v22.onTabSelected = function(v24) --[[ Line: 35 ]]
        -- upvalues: l_props_0 (copy)
        l_props_0.setSelectedTab(v24.Key);
    end;
end;
v21.didMount = function(v25) --[[ Line: 40 ]] --[[ Name: didMount ]]
    -- upvalues: v13 (copy)
    local l_props_1 = v25.props;
    local l_Localization_0 = l_props_1.Localization;
    local l_isSuccessfullyPublished_0 = l_props_1.isSuccessfullyPublished;
    local v30 = v13.getAllTabsData(l_Localization_0, function(v29) --[[ Line: 45 ]]
        -- upvalues: l_isSuccessfullyPublished_0 (copy), v13 (ref)
        if l_isSuccessfullyPublished_0 then
            return v29 == v13.Summary;
        else
            return true;
        end;
    end);
    l_props_1.setAllTabsData(v30);
    l_props_1.setSelectedTab(v13.Summary);
end;
v21.render = function(v31) --[[ Line: 52 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_Pane_0 (copy), l_Tabs_0 (copy), v13 (copy), v20 (copy), v15 (copy), v18 (copy), v16 (copy), v19 (copy)
    local l_props_2 = v31.props;
    local l_selectedTab_0 = l_props_2.selectedTab;
    local l_allTabsData_0 = l_props_2.allTabsData;
    local l_Stylizer_0 = v31.props.Stylizer;
    local l_LayoutOrder_0 = v31.props.LayoutOrder;
    local v37 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundColor = l_Stylizer_0.BackgroundColor
    }, {
        Tabs = if l_allTabsData_0 and l_selectedTab_0 then v2.createElement(l_Tabs_0, {
            LayoutOrder = v37:getNextOrder(), 
            Tabs = l_allTabsData_0, 
            SelectedTab = v13.findTabData(l_selectedTab_0, l_allTabsData_0), 
            OnTabSelected = v31.onTabSelected, 
            FillDirection = Enum.FillDirection.Vertical, 
            TabComponent = v20
        }) else nil, 
        View = v2.createElement(l_Pane_0, {
            LayoutOrder = v37:getNextOrder(), 
            Size = l_Stylizer_0.TabPaneSize, 
            BackgroundColor = l_Stylizer_0.ViewBackgroundColor
        }, {
            SummaryPane = if l_selectedTab_0 and l_selectedTab_0 == v13.Summary then v2.createElement(v15, {
                OnResetPlugin = l_props_2.OnResetPlugin
            }) else nil, 
            ScriptConversionPane = if l_selectedTab_0 and l_selectedTab_0 == v13.ScriptConversion then v2.createElement(v18, {
                OnResetPlugin = l_props_2.OnResetPlugin
            }) else nil, 
            CharacterConversion = if l_selectedTab_0 and l_selectedTab_0 == v13.CharacterConversion then v2.createElement(v16, {
                OnResetPlugin = l_props_2.OnResetPlugin
            }) else nil, 
            AnimationConversionPane = if l_selectedTab_0 and l_selectedTab_0 == v13.AnimationConversion then v2.createElement(v19, {
                OnResetPlugin = l_props_2.OnResetPlugin
            }) else nil
        })
    });
end;
local function v39(v38) --[[ Line: 109 ]] --[[ Name: mapStateToProps ]]
    return {
        selectedTab = v38.PanelSelection.selectedTab, 
        allTabsData = v38.PanelSelection.allTabsData, 
        isSuccessfullyPublished = v38.ConversionProgress.isSuccessfullyPublished
    };
end;
local function v43(v40) --[[ Line: 117 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v10 (copy), v11 (copy)
    return {
        setSelectedTab = function(v41) --[[ Line: 119 ]] --[[ Name: setSelectedTab ]]
            -- upvalues: v40 (copy), v10 (ref)
            v40(v10(v41));
        end, 
        setAllTabsData = function(v42) --[[ Line: 123 ]] --[[ Name: setAllTabsData ]]
            -- upvalues: v40 (copy), v11 (ref)
            v40(v11(v42));
        end
    };
end;
v21 = l_ContextServices_0.withContext({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v21);
return v3.connect(v39, v43)(v21);