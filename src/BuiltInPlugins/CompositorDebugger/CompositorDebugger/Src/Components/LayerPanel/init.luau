local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Tabs_0 = l_UI_0.Tabs;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v12 = require(l_Components_0.LayerView);
local v13 = require(l_Components_0.HistoryGraph);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v15 = require(l_Util_0.AnalyticsEnums);
local v16 = require(l_Util_0.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v18 = v1.PureComponent:extend("LayerPanel");
v18.init = function(v19) --[[ Line: 39 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy), v15 (copy)
    v19.state = {
        lastTabSwitch = os.clock(), 
        selectedTab = v16.LAYER_TABS.LayerData, 
        oldTab = v16.LAYER_TABS.LayerData
    };
    v19.switchToTab = function(v20, v21) --[[ Line: 46 ]]
        -- upvalues: v19 (copy), v15 (ref)
        if v20 == v19.state.selectedTab then
            return;
        else
            v19.props.Analytics:report("onLayerTabChanged", v15.LAYER_TABS[v19.state.selectedTab], v15.LAYER_TABS[v20], v21, os.clock() - v19.state.lastTabSwitch);
            v19:setState({
                lastTabSwitch = os.clock(), 
                oldTab = v19.state.selectedTab, 
                selectedTab = v20
            });
            return;
        end;
    end;
end;
v18.isVisualizationEnabled = function(_, v23) --[[ Line: 67 ]] --[[ Name: isVisualizationEnabled ]]
    -- upvalues: v18 (ref)
    return v18.Visualizers.getModule(v23) ~= nil;
end;
v18.didUpdate = function(v24, v25) --[[ Line: 71 ]] --[[ Name: didUpdate ]]
    -- upvalues: v16 (copy), v15 (copy)
    local l_props_0 = v24.props;
    local l_state_0 = v24.state;
    local v28 = l_props_0.HistoryField and l_props_0.HistoryField.id and l_props_0.HistoryField.section and l_props_0.HistoryField.field;
    if l_state_0.selectedTab == v16.LAYER_TABS.History and not v28 or l_state_0.selectedTab == v16.LAYER_TABS.Visualization and not v24:isVisualizationEnabled(l_props_0.LayerData) then
        v24.switchToTab(v16.LAYER_TABS.LayerData, v15.TAB_SWITCH_REASONS.NoData);
        return;
    else
        if v28 and (not v25.HistoryField or l_props_0.HistoryField.id ~= v25.HistoryField.id or l_props_0.HistoryField.section ~= v25.HistoryField.section or l_props_0.HistoryField.field ~= v25.HistoryField.field) then
            v24.switchToTab(v16.LAYER_TABS.History, v15.TAB_SWITCH_REASONS.HistoryIcon);
        end;
        return;
    end;
end;
v18.render = function(v29) --[[ Line: 102 ]] --[[ Name: render ]]
    -- upvalues: v16 (copy), v18 (ref), v1 (copy), l_Pane_0 (copy), l_Tabs_0 (copy), v15 (copy), v12 (copy), v13 (copy)
    local l_state_1 = v29.state;
    local l_props_1 = v29.props;
    local l_Localization_1 = l_props_1.Localization;
    local l_LayerData_0 = l_props_1.LayerData;
    local l_ShowRawPayload_0 = l_props_1.ShowRawPayload;
    local v35 = l_props_1.HistoryField and l_props_1.HistoryField.id and l_props_1.HistoryField.section and l_props_1.HistoryField.field;
    local v36 = {
        {
            Key = v16.LAYER_TABS.LayerData, 
            Label = l_Localization_1:getText("LayerPanel", v16.LAYER_TABS.LayerData)
        }, 
        {
            Key = v16.LAYER_TABS.Visualization, 
            Label = l_Localization_1:getText("LayerPanel", v16.LAYER_TABS.Visualization), 
            Disabled = not v29:isVisualizationEnabled(l_LayerData_0)
        }, 
        {
            Key = v16.LAYER_TABS.History, 
            Label = l_Localization_1:getText("LayerPanel", v16.LAYER_TABS.History), 
            Disabled = not v35
        }
    };
    if l_ShowRawPayload_0 then
        table.insert(v36, {
            Key = v16.LAYER_TABS.RawData, 
            Label = l_Localization_1:getText("LayerPanel", v16.LAYER_TABS.RawData)
        });
    end;
    local v37 = v18.Visualizers.getModule(l_LayerData_0);
    return v1.createElement(l_Pane_0, {
        [v1.Tag] = "LayerPanel X-Fill X-Column"
    }, {
        Tabs = v1.createElement(l_Tabs_0, {
            LayoutOrder = 1, 
            Tabs = v36, 
            SelectedTab = v29.state.selectedTab, 
            OnTabSelected = function(v38) --[[ Line: 146 ]] --[[ Name: OnTabSelected ]]
                -- upvalues: v29 (copy), v15 (ref)
                v29.switchToTab(v38.Key, v15.TAB_SWITCH_REASONS.Manual);
            end
        }), 
        LayerData = if l_state_1.selectedTab == v16.LAYER_TABS.LayerData then v1.createElement(v12, {
            LayoutOrder = 2, 
            LayerData = l_props_1.LayerData, 
            ExpandedSections = l_props_1.ExpandedSections, 
            Overrides = l_props_1.Overrides, 
            [v1.Tag] = "Panel"
        }) else nil, 
        Visualization = if l_state_1.selectedTab == v16.LAYER_TABS.Visualization and v37 then v1.createElement(l_Pane_0, {
            LayoutOrder = 2, 
            [v1.Tag] = "Panel"
        }, {
            Content = v1.createElement(v37, {
                FrameBuffer = l_props_1.FrameBuffer, 
                HistoryFrame = l_props_1.HistoryFrame, 
                LayerData = l_props_1.LayerData, 
                Overrides = l_props_1.Overrides
            })
        }) else nil, 
        History = if l_state_1.selectedTab == v16.LAYER_TABS.History then v1.createElement(l_Pane_0, {
            [v1.Tag] = "Panel", 
            LayoutOrder = 2
        }, {
            HistoryGraph = v1.createElement(v13, {
                FrameBuffer = l_props_1.FrameBuffer, 
                HistoryField = l_props_1.HistoryField
            })
        }) else nil, 
        RawData = if l_state_1.selectedTab == v16.LAYER_TABS.RawData then v1.createElement(l_Pane_0, {
            LayoutOrder = 2, 
            [v1.Tag] = "Panel"
        }, {
            Pane = v1.createElement(v12, {
                LayoutOrder = 2, 
                LayerData = l_LayerData_0, 
                RawMode = true
            })
        }) else nil
    });
end;
v18 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0
})(v18);
v18 = v2.connect(function(v39, _) --[[ Line: 205 ]] --[[ Name: mapStateToProps ]]
    return {
        HistoryField = v39.Status.HistoryField
    };
end)(v18);
v18.Visualizers = require(script.Visualizers);
return v18;