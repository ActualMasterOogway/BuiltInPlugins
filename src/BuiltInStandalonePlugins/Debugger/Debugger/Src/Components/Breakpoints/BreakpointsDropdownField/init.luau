local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local v8 = require(l_Parent_0.Src.Resources.AnalyticsEventNames);
local l_Stylizer_0 = v3.Style.Stylizer;
local v10 = require(l_Parent_0.Src.Components.Common.DropdownField);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v12 = require(l_Actions_0.BreakpointsWindow.BreakpointColumnFilter);
local l_Models_0 = l_Parent_0.Src.Models;
local v14 = require(l_Models_0.BreakpointTableColumnEnum);
local v15 = require(l_Parent_0.Src.Util.flatListToString);
local v16 = v1.PureComponent:extend("BreakpointsDropdownField");
local _ = function(v17, v18) --[[ Line: 26 ]] --[[ Name: hasValue ]]
    for _, v20 in pairs(v17) do
        if v20 == v18 then
            return true;
        end;
    end;
    return false;
end;
v16.init = function(v22) --[[ Line: 35 ]] --[[ Name: init ]]
    -- upvalues: v14 (copy), v8 (copy), v15 (copy)
    v22.keyColumns = {
        [1] = "AllColumns", 
        [2] = v14.SourceLine, 
        [3] = v14.Condition, 
        [4] = v14.LogMessage, 
        [5] = v14.ContinueExecution, 
        [6] = v14.RemoveOnHit
    };
    v22.clickCallback = function(v23) --[[ Line: 45 ]]
        -- upvalues: v22 (copy), v8 (ref), v15 (ref)
        v22.props.onColumnFilterChange(v23);
        v22.props.Analytics:report(v8.BreakpointsColumnsEdited, v15(v23));
    end;
end;
v16.render = function(v24) --[[ Line: 51 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v10 (copy)
    local l_props_0 = v24.props;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local l_Localization_1 = l_props_0.Localization;
    return v1.createElement(v10, {
        KeyTexts = v24.keyColumns, 
        ClickCallback = v24.clickCallback, 
        KeyStates = l_props_0.ColumnStates, 
        Localization = l_Localization_1, 
        Style = l_Stylizer_1, 
        Widget = "BreakpointsWindow", 
        DropdownWidth = 200, 
        HamburgerMenu = true, 
        ShouldShowDropdownIcon = false
    });
end;
v16 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v16);
return (v2.connect(function(v28, _) --[[ Line: 75 ]]
    -- upvalues: v14 (copy)
    local v30 = false;
    local v31 = false;
    local v32 = false;
    local v33 = false;
    local v34 = false;
    local l_listOfEnabledColumns_0 = v28.Breakpoint.listOfEnabledColumns;
    local v36 = {};
    local l_SourceLine_0 = v14.SourceLine;
    local v38;
    for _, v40 in pairs(l_listOfEnabledColumns_0) do
        if v40 == l_SourceLine_0 then
            v38 = true;
            v30 = true;
        end;
        if v30 then
            break;
        end;
    end;
    if not v30 then
        v38 = false;
    end;
    v30 = false;
    v36[2] = v38;
    l_SourceLine_0 = v14.Condition;
    for _, v42 in pairs(l_listOfEnabledColumns_0) do
        if v42 == l_SourceLine_0 then
            v38 = true;
            v31 = true;
        end;
        if v31 then
            break;
        end;
    end;
    if not v31 then
        v38 = false;
    end;
    v31 = false;
    v36[3] = v38;
    l_SourceLine_0 = v14.LogMessage;
    for _, v44 in pairs(l_listOfEnabledColumns_0) do
        if v44 == l_SourceLine_0 then
            v38 = true;
            v32 = true;
        end;
        if v32 then
            break;
        end;
    end;
    if not v32 then
        v38 = false;
    end;
    v32 = false;
    v36[4] = v38;
    l_SourceLine_0 = v14.ContinueExecution;
    for _, v46 in pairs(l_listOfEnabledColumns_0) do
        if v46 == l_SourceLine_0 then
            v38 = true;
            v33 = true;
        end;
        if v33 then
            break;
        end;
    end;
    if not v33 then
        v38 = false;
    end;
    v33 = false;
    v36[5] = v38;
    l_SourceLine_0 = v14.RemoveOnHit;
    for _, v48 in pairs(l_listOfEnabledColumns_0) do
        if v48 == l_SourceLine_0 then
            v38 = true;
            v34 = true;
        end;
        if v34 then
            break;
        end;
    end;
    if not v34 then
        v38 = false;
    end;
    v34 = false;
    v36[6] = v38;
    return {
        ColumnStates = v36
    };
end, function(v49) --[[ Line: 86 ]]
    -- upvalues: v12 (copy)
    return {
        onColumnFilterChange = function(v50) --[[ Line: 88 ]] --[[ Name: onColumnFilterChange ]]
            -- upvalues: v49 (copy), v12 (ref)
            return v49(v12(v50));
        end
    };
end)(v16));