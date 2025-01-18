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
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v12 = require(l_Thunks_0.Watch.FilterScopeWatchThunk);
local v13 = require(l_Parent_0.Src.Util.flatListToString);
local v14 = v1.PureComponent:extend("ScopeDropdownField");
local v15 = {
    LocalScope = "Local", 
    UpvalueScope = "Upvalue", 
    GlobalScope = "Global"
};
local _ = function(v16, v17) --[[ Line: 32 ]] --[[ Name: hasValue ]]
    for _, v19 in pairs(v16) do
        if v19 == v17 then
            return true;
        end;
    end;
    return false;
end;
v14.init = function(v21) --[[ Line: 41 ]] --[[ Name: init ]]
    -- upvalues: v15 (copy), v8 (copy), v13 (copy)
    v21.keyColumns = {
        [1] = "AllScopes", 
        [2] = v15.LocalScope, 
        [3] = v15.UpvalueScope, 
        [4] = v15.GlobalScope
    };
    v21.clickCallback = function(v22) --[[ Line: 49 ]]
        -- upvalues: v21 (copy), v8 (ref), v13 (ref)
        v21.props.onScopeFilterChange(v22);
        v21.props.Analytics:report(v8.WatchScopeEdited, v13(v22));
    end;
end;
v14.render = function(v23) --[[ Line: 55 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v10 (copy)
    local l_props_0 = v23.props;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local l_Localization_1 = l_props_0.Localization;
    local v27 = {
        [1] = nil, 
        [2] = l_Localization_1:getText("Watch", "LocalTooltip"), 
        [3] = l_Localization_1:getText("Watch", "UpvalueTooltip"), 
        [4] = l_Localization_1:getText("Watch", "GlobalTooltip")
    };
    return v1.createElement(v10, {
        KeyTexts = v23.keyColumns, 
        Tooltips = v27, 
        NumDisplay = l_props_0.NumEnabledChoices, 
        MaxDisplay = 3, 
        ClickCallback = v23.clickCallback, 
        KeyStates = l_props_0.KeyStates, 
        Localization = l_Localization_1, 
        Style = l_Stylizer_1, 
        Widget = "Watch", 
        DropdownWidth = 100, 
        ShouldShowDropdownIcon = l_props_0.ShouldShowDropdownIcon, 
        Tooltip = l_Localization_1:getText("Watch", "FilterScopes"), 
        LayoutOrder = l_props_0.LayoutOrder
    });
end;
v14 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v14);
return (v2.connect(function(v28, _) --[[ Line: 89 ]]
    -- upvalues: v15 (copy)
    local v30 = false;
    local v31 = false;
    local v32 = false;
    local l_listOfEnabledScopes_0 = v28.Watch.listOfEnabledScopes;
    local v34 = {};
    local l_LocalScope_0 = v15.LocalScope;
    local v36;
    for _, v38 in pairs(l_listOfEnabledScopes_0) do
        if v38 == l_LocalScope_0 then
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
    l_LocalScope_0 = v15.UpvalueScope;
    for _, v40 in pairs(l_listOfEnabledScopes_0) do
        if v40 == l_LocalScope_0 then
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
    l_LocalScope_0 = v15.GlobalScope;
    for _, v42 in pairs(l_listOfEnabledScopes_0) do
        if v42 == l_LocalScope_0 then
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
        NumEnabledChoices = #l_listOfEnabledScopes_0, 
        KeyStates = v34
    };
end, function(v43) --[[ Line: 99 ]]
    -- upvalues: v12 (copy)
    return {
        onScopeFilterChange = function(v44) --[[ Line: 101 ]] --[[ Name: onScopeFilterChange ]]
            -- upvalues: v43 (copy), v12 (ref)
            return v43(v12(v44));
        end
    };
end)(v14));