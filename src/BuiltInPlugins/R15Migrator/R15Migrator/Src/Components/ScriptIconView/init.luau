local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local v4 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local l_UI_0 = v2.UI;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local v11 = v1.PureComponent:extend("ScriptIconView");
v11.defaultProps = {
    AllowTooltips = true
};
local function _(v12) --[[ Line: 24 ]] --[[ Name: numReverted ]]
    -- upvalues: v4 (copy)
    return v12[v4.ScriptStatus.Reverted] or 0;
end;
local function _(v14) --[[ Line: 28 ]] --[[ Name: numComplete ]]
    -- upvalues: v4 (copy)
    return v14[v4.ScriptStatus.Complete] or 0;
end;
local function _(v16) --[[ Line: 32 ]] --[[ Name: numErrors ]]
    -- upvalues: v4 (copy)
    return v16[v4.ScriptStatus.Error] or 0;
end;
local function _(v18) --[[ Line: 36 ]] --[[ Name: numVarErrors ]]
    -- upvalues: v4 (copy)
    return v18[v4.ScriptStatus.VariableError] or 0;
end;
local function _(v20) --[[ Line: 40 ]] --[[ Name: numWarnings ]]
    -- upvalues: v4 (copy)
    return v20[v4.ScriptStatus.Warning] or 0;
end;
v11.renderIcon = function(v22, v23, v24, v25, v26) --[[ Line: 44 ]] --[[ Name: renderIcon ]]
    -- upvalues: v1 (copy), l_Image_0 (copy), l_Tooltip_0 (copy)
    local l_props_0 = v22.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_AllowTooltips_0 = l_props_0.AllowTooltips;
    return v1.createElement(l_Image_0, {
        Image = v23, 
        ImageColor3 = v24, 
        Size = l_Stylizer_0.StatusImageSize, 
        LayoutOrder = v26
    }, {
        Tooltip = if l_AllowTooltips_0 then v1.createElement(l_Tooltip_0, {
            Text = l_Localization_0:getText("ScriptStatus", v25)
        }) else nil
    });
end;
v11.renderCount = function(v31, v32, v33) --[[ Line: 64 ]] --[[ Name: renderCount ]]
    -- upvalues: v1 (copy), l_TextLabel_0 (copy)
    local l_Stylizer_1 = v31.props.Stylizer;
    return v1.createElement(l_TextLabel_0, {
        Text = tostring(v32), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = v33, 
        TextSize = l_Stylizer_1.CountTextSize
    });
end;
v11.render = function(v35) --[[ Line: 76 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_LayoutOrderIterator_0 (copy), v1 (copy), l_Pane_0 (copy)
    local l_props_1 = v35.props;
    local l_Size_0 = l_props_1.Size;
    local l_Statuses_0 = l_props_1.Statuses;
    local l_ShowCounts_0 = l_props_1.ShowCounts;
    local l_Stylizer_2 = l_props_1.Stylizer;
    local v41 = l_Statuses_0[v4.ScriptStatus.Error] or 0;
    local v42 = l_Statuses_0[v4.ScriptStatus.VariableError] or 0;
    local v43 = l_Statuses_0[v4.ScriptStatus.Warning] or 0;
    local v44 = l_Statuses_0[v4.ScriptStatus.Complete] or 0;
    local v45 = l_Statuses_0[v4.ScriptStatus.Reverted] or 0;
    local v46 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Spacing = l_Stylizer_2.Spacing, 
        Size = l_Size_0
    }, {
        CompleteIcon = if v44 > 0 then v35:renderIcon(l_Stylizer_2.StatusIcons.Complete, nil, v4.ScriptStatus.Complete, v46:getNextOrder()) else nil, 
        CompleteCount = if l_ShowCounts_0 and v44 > 1 then v35:renderCount(v44, v46:getNextOrder()) else nil, 
        ErrorIcon = if v41 > 0 then v35:renderIcon(l_Stylizer_2.StatusIcons.Error, nil, v4.ScriptStatus.Error, v46:getNextOrder()) else nil, 
        ErrorCount = if l_ShowCounts_0 and v41 > 0 then v35:renderCount(v41, v46:getNextOrder()) else nil, 
        VarErrorIcon = if v42 > 0 then v35:renderIcon(l_Stylizer_2.StatusIcons.VariableError, nil, v4.ScriptStatus.VariableError, v46:getNextOrder()) else nil, 
        VarErrorCount = if l_ShowCounts_0 and v42 > 0 then v35:renderCount(v42, v46:getNextOrder()) else nil, 
        WarningIcon = if v43 > 0 then v35:renderIcon(l_Stylizer_2.StatusIcons.Warning, nil, v4.ScriptStatus.Warning, v46:getNextOrder()) else nil, 
        WarningCount = if l_ShowCounts_0 and v43 > 0 then v35:renderCount(v43, v46:getNextOrder()) else nil, 
        RevertedIcon = if v45 > 0 then v35:renderIcon(l_Stylizer_2.StatusIcons.Reverted, l_Stylizer_2.RevertedIconColor, v4.ScriptStatus.Reverted, v46:getNextOrder()) else nil, 
        RevertedCount = if l_ShowCounts_0 and v45 > 1 then v35:renderCount(v45, v46:getNextOrder()) else nil
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v11));