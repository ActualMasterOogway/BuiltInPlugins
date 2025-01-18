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
local v12 = require(l_Actions_0.Watch.VariablesFilterChange);
local l_Models_0 = l_Parent_0.Src.Models;
local v14 = require(l_Models_0.Watch.VariablesColumnEnum);
local v15 = require(l_Parent_0.Src.Util.flatListToString);
local v16 = v1.PureComponent:extend("VariablesDropdownField");
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
        [2] = v14.Scope, 
        [3] = v14.Value, 
        [4] = v14.DataType
    };
    v22.clickCallback = function(v23) --[[ Line: 43 ]]
        -- upvalues: v22 (copy), v8 (ref), v15 (ref)
        v22.props.onVariablesFilterChange(v23);
        v22.props.Analytics:report(v8.VariablesColumnsEdited, v15(v23));
    end;
end;
v16.render = function(v24) --[[ Line: 49 ]] --[[ Name: render ]]
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
        Widget = "Watch", 
        DropdownWidth = 200, 
        HamburgerMenu = true, 
        ShouldShowDropdownIcon = false, 
        LayoutOrder = l_props_0.LayoutOrder
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
    local l_listOfVariablesColumns_0 = v28.Watch.listOfVariablesColumns;
    local v34 = {};
    local l_Scope_0 = v14.Scope;
    local v36;
    for _, v38 in pairs(l_listOfVariablesColumns_0) do
        if v38 == l_Scope_0 then
            v36 = true;
            v30 = true;
        end;
        if v30 then
            break;
        end;
    end;
    if not v30 then
        v36 = false;
    end;
    v30 = false;
    v34[2] = v36;
    l_Scope_0 = v14.Value;
    for _, v40 in pairs(l_listOfVariablesColumns_0) do
        if v40 == l_Scope_0 then
            v36 = true;
            v31 = true;
        end;
        if v31 then
            break;
        end;
    end;
    if not v31 then
        v36 = false;
    end;
    v31 = false;
    v34[3] = v36;
    l_Scope_0 = v14.DataType;
    for _, v42 in pairs(l_listOfVariablesColumns_0) do
        if v42 == l_Scope_0 then
            v36 = true;
            v32 = true;
        end;
        if v32 then
            break;
        end;
    end;
    if not v32 then
        v36 = false;
    end;
    v32 = false;
    v34[4] = v36;
    return {
        ColumnStates = v34
    };
end, function(v43) --[[ Line: 83 ]]
    -- upvalues: v12 (copy)
    return {
        onVariablesFilterChange = function(v44) --[[ Line: 85 ]] --[[ Name: onVariablesFilterChange ]]
            -- upvalues: v43 (copy), v12 (ref)
            return v43(v12(v44));
        end
    };
end)(v16));