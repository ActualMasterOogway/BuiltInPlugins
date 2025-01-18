local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local _ = require(script.types);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Parent.Roact);
local v5 = require(l_Parent_0.Util.Typecheck);
local v6 = require(l_Parent_0.Wrappers.withForwardRef);
local v7 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v8 = require(l_Parent_0.Styling.supportsStyleSheets);
local v9 = require(l_Parent_0.Styling.joinTags);
local v10 = require(l_Parent_0.Parent.Dash);
local l_map_0 = v10.map;
local l_findIndex_0 = v10.findIndex;
local v13 = require(l_Parent_0.UI.Components.Pane);
local v14 = require(l_Parent_0.UI.Components.SimpleTab);
local v15 = v4.PureComponent:extend("Tabs");
v5.wrap(v15, script);
local v16 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkTabsForwardRef);
v15.init = function(v17) --[[ Line: 43 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy), v4 (copy)
    if v16() and v17.props.TabsListRef ~= nil then
        for v18, v19 in v17.props.Tabs do
            v17.props.TabsListRef.current[v19.Key or v18] = v4.createRef();
        end;
    end;
end;
v15.render = function(v20) --[[ Line: 51 ]] --[[ Name: render ]]
    -- upvalues: v14 (copy), l_findIndex_0 (copy), l_map_0 (copy), v4 (copy), v16 (copy), v13 (copy), v8 (copy), v7 (copy), v9 (copy)
    local l_props_0 = v20.props;
    local v22 = l_props_0.TabComponent or v14;
    local l_SelectedTab_0 = l_props_0.SelectedTab;
    if typeof(l_props_0.SelectedTab) == "table" then
        l_SelectedTab_0 = l_findIndex_0(l_props_0.Tabs, function(v24) --[[ Line: 57 ]]
            -- upvalues: l_props_0 (copy)
            return v24 == l_props_0.SelectedTab;
        end);
    elseif typeof(l_props_0.SelectedTab) == "string" then
        l_SelectedTab_0 = l_findIndex_0(l_props_0.Tabs, function(v25) --[[ Line: 61 ]]
            -- upvalues: l_props_0 (copy)
            return v25.Key == l_props_0.SelectedTab;
        end);
    end;
    local v28 = l_map_0(l_props_0.Tabs, function(v26, v27) --[[ Line: 66 ]]
        -- upvalues: v4 (ref), v22 (copy), l_SelectedTab_0 (ref), l_props_0 (copy), v16 (ref)
        return v4.createElement(v22, {
            Tab = v26, 
            Index = v27, 
            Disabled = v26.Disabled, 
            Selected = l_SelectedTab_0 == v27, 
            OnTabSelected = l_props_0.OnTabSelected, 
            [v4.Ref] = if v16() and l_props_0.TabsListRef ~= nil then l_props_0.TabsListRef.current[v26.Key or v27] else nil
        });
    end);
    local v29 = if l_props_0.FillDirection then l_props_0.FillDirection else Enum.FillDirection.Horizontal;
    return v4.createElement(v13, if v8 then {
        LayoutOrder = l_props_0.LayoutOrder, 
        [v7.Tag] = v9("Component-Tabs", l_props_0[v7.Tag] or "X-Fit", v29 == Enum.FillDirection.Vertical and "X-Column" or "X-Row"), 
        [v4.Ref] = if v16() then l_props_0.ForwardRef else nil, 
        [v7.Change.AbsoluteSize] = if v16() then l_props_0.OnAbsoluteSizeChanged else nil
    } else {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Layout = v29, 
        LayoutOrder = l_props_0.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        [v4.Ref] = if v16() then l_props_0.ForwardRef else nil, 
        [v4.Change.AbsoluteSize] = if v16() then l_props_0.OnAbsoluteSizeChanged else nil
    }, v28);
end;
v15 = l_withContext_0({
    Stylizer = if v8 then nil else v2.Stylizer
})(v15);
if v16() then
    v15 = v6(v15);
end;
return v15;