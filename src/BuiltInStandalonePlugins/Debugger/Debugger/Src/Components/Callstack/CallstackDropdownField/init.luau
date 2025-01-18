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
local v12 = require(l_Actions_0.Callstack.ColumnFilterChange);
local l_Models_0 = l_Parent_0.Src.Models;
local v14 = require(l_Models_0.Callstack.ColumnEnum);
local v15 = require(l_Parent_0.Src.Util.flatListToString);
local v16 = v1.PureComponent:extend("CallstackDropdownField");
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
        [2] = v14.Frame, 
        [3] = v14.Source, 
        [4] = v14.Function, 
        [5] = v14.Line
    };
    v22.clickCallback = function(v23) --[[ Line: 44 ]]
        -- upvalues: v22 (copy), v8 (ref), v15 (ref)
        v22.props.onColumnFilterChange(v23);
        v22.props.Analytics:report(v8.CallstackColumnsEdited, v15(v23));
    end;
end;
v16.render = function(v24) --[[ Line: 50 ]] --[[ Name: render ]]
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
        Widget = "Callstack", 
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
return (v2.connect(function(v28, _) --[[ Line: 74 ]]
    -- upvalues: v14 (copy)
    local v30 = false;
    local v31 = false;
    local v32 = false;
    local v33 = false;
    local l_listOfEnabledColumns_0 = v28.Callstack.listOfEnabledColumns;
    local v35 = {};
    local l_Frame_0 = v14.Frame;
    local v37;
    for _, v39 in pairs(l_listOfEnabledColumns_0) do
        if v39 == l_Frame_0 then
            v37 = true;
            v30 = true;
        end;
        if v30 then
            break;
        end;
    end;
    if not v30 then
        v37 = false;
    end;
    v30 = false;
    v35[2] = v37;
    l_Frame_0 = v14.Source;
    for _, v41 in pairs(l_listOfEnabledColumns_0) do
        if v41 == l_Frame_0 then
            v37 = true;
            v31 = true;
        end;
        if v31 then
            break;
        end;
    end;
    if not v31 then
        v37 = false;
    end;
    v31 = false;
    v35[3] = v37;
    l_Frame_0 = v14.Function;
    for _, v43 in pairs(l_listOfEnabledColumns_0) do
        if v43 == l_Frame_0 then
            v37 = true;
            v32 = true;
        end;
        if v32 then
            break;
        end;
    end;
    if not v32 then
        v37 = false;
    end;
    v32 = false;
    v35[4] = v37;
    l_Frame_0 = v14.Line;
    for _, v45 in pairs(l_listOfEnabledColumns_0) do
        if v45 == l_Frame_0 then
            v37 = true;
            v33 = true;
        end;
        if v33 then
            break;
        end;
    end;
    if not v33 then
        v37 = false;
    end;
    v33 = false;
    v35[5] = v37;
    return {
        ColumnStates = v35
    };
end, function(v46) --[[ Line: 84 ]]
    -- upvalues: v12 (copy)
    return {
        onColumnFilterChange = function(v47) --[[ Line: 86 ]] --[[ Name: onColumnFilterChange ]]
            -- upvalues: v46 (copy), v12 (ref)
            return v46(v12(v47));
        end
    };
end)(v16));