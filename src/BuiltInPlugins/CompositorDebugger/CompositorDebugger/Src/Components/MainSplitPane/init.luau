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
local l_SplitPane_0 = l_UI_0.SplitPane;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v12 = {
    UDim.new(0.35, 0), 
    UDim.new(0.25, 0)
};
local v13 = {
    UDim.new(0.6, 0), 
    UDim.new(0.4, 0)
};
local v14 = v1.PureComponent:extend("MainSplitPane");
v14.init = function(v15) --[[ Line: 44 ]] --[[ Name: init ]]
    -- upvalues: v13 (copy)
    v15.state = {
        layout = Enum.FillDirection.Vertical, 
        sizes = v13
    };
    v15.onAbsoluteSizeChanged = function(v16) --[[ Line: 50 ]]
        -- upvalues: v15 (copy)
        v15:setState({
            layout = if v16.AbsoluteSize.X > v16.AbsoluteSize.Y then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical
        });
    end;
    v15.onSizesChange = function(v17) --[[ Line: 58 ]]
        -- upvalues: v15 (copy)
        v15:setState({
            sizes = v17
        });
    end;
end;
v14.render = function(v18) --[[ Line: 65 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), l_SplitPane_0 (copy), v12 (copy)
    local l_state_0 = v18.state;
    local l_props_0 = v18.props;
    local l_layout_0 = l_state_0.layout;
    return v1.createElement(l_Pane_0, {
        [v1.Change.AbsoluteSize] = v18.onAbsoluteSizeChanged, 
        [v1.Tag] = "X-Fill SplitPane"
    }, {
        SplitPane = v1.createElement(l_SplitPane_0, {
            Sizes = l_state_0.sizes, 
            OnSizesChange = v18.onSizesChange, 
            MinSizes = v12, 
            BarStyle = "BorderBox", 
            UseScale = true, 
            ClampSize = true, 
            Layout = l_layout_0
        }, l_props_0.children)
    });
end;
v14 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0
})(v14);
return (v2.connect(function(v22) --[[ Line: 92 ]] --[[ Name: mapStateToProps ]]
    return {
        FrameBuffer = v22.DebugData.FrameBuffer
    };
end)(v14));