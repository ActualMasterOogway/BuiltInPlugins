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
local v12 = require(l_Actions_0.Watch.MyWatchesFilterChange);
local l_Models_0 = l_Parent_0.Src.Models;
local v14 = require(l_Models_0.Watch.MyWatchesColumnEnum);
local v15 = require(l_Parent_0.Src.Util.flatListToString);
local v16 = v1.PureComponent:extend("MyWatchesDropdownField");
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
        [2] = v14.Value, 
        [3] = v14.DataType
    };
    v22.clickCallback = function(v23) --[[ Line: 42 ]]
        -- upvalues: v22 (copy), v8 (ref), v15 (ref)
        v22.props.onMyWatchesFilterChange(v23);
        v22.props.Analytics:report(v8.MyWatchesColumnsEdited, v15(v23));
    end;
end;
v16.render = function(v24) --[[ Line: 48 ]] --[[ Name: render ]]
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
return (v2.connect(function(v28, _) --[[ Line: 73 ]]
    -- upvalues: v14 (copy)
    local v30 = false;
    local v31 = false;
    local l_listOfMyWatchesColumns_0 = v28.Watch.listOfMyWatchesColumns;
    local v33 = {};
    local l_Value_0 = v14.Value;
    local v35;
    for _, v37 in pairs(l_listOfMyWatchesColumns_0) do
        if v37 == l_Value_0 then
            v35 = true;
            v30 = true;
        end;
        if v30 then
            break;
        end;
    end;
    if not v30 then
        v35 = false;
    end;
    v30 = false;
    v33[2] = v35;
    l_Value_0 = v14.DataType;
    for _, v39 in pairs(l_listOfMyWatchesColumns_0) do
        if v39 == l_Value_0 then
            v35 = true;
            v31 = true;
        end;
        if v31 then
            break;
        end;
    end;
    if not v31 then
        v35 = false;
    end;
    v31 = false;
    v33[3] = v35;
    return {
        ColumnStates = v33
    };
end, function(v40) --[[ Line: 81 ]]
    -- upvalues: v12 (copy)
    return {
        onMyWatchesFilterChange = function(v41) --[[ Line: 83 ]] --[[ Name: onMyWatchesFilterChange ]]
            -- upvalues: v40 (copy), v12 (ref)
            return v40(v12(v41));
        end
    };
end)(v16));