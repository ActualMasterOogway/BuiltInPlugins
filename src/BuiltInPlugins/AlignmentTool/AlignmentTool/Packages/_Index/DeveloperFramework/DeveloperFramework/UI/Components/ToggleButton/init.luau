local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util.prioritize);
local v5 = require(l_Parent_0.Util.StyleModifier);
local v6 = require(l_Parent_0.Util.Typecheck);
local v7 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v8 = require(l_Parent_0.UI.Components.HoverArea);
local v9 = v1.PureComponent:extend("ToggleButton");
v6.wrap(v9, script);
v9.defaultProps = {
    Disabled = false, 
    Selected = false, 
    Text = ""
};
v9.init = function(v10) --[[ Line: 45 ]] --[[ Name: init ]]
    v10.onClick = function() --[[ Line: 46 ]]
        -- upvalues: v10 (copy)
        local l_Disabled_0 = v10.props.Disabled;
        local l_OnClick_0 = v10.props.OnClick;
        if not l_Disabled_0 then
            l_OnClick_0(not v10.props.Selected);
        end;
    end;
end;
v9.render = function(v13) --[[ Line: 55 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v5 (copy), v1 (copy), v7 (copy), v8 (copy)
    local l_props_0 = v13.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_Disabled_1 = l_props_0.Disabled;
    local l_Selected_0 = l_props_0.Selected;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Position_0 = l_props_0.Position;
    local v21 = v4(l_props_0.Size, l_Stylizer_0.Size);
    local l_Text_0 = l_props_0.Text;
    local l_ZIndex_0 = l_props_0.ZIndex;
    local v24 = nil;
    if l_Disabled_1 and l_Selected_0 then
        v24 = v5.DisabledAndSelected;
    elseif l_Disabled_1 then
        v24 = v5.Disabled;
    elseif l_Selected_0 then
        v24 = v5.Selected;
    end;
    return v1.createElement(v7, {
        AnchorPoint = l_AnchorPoint_0, 
        LayoutOrder = l_LayoutOrder_0, 
        OnClick = v13.onClick, 
        StyleModifier = v24, 
        Position = l_Position_0, 
        Size = v21, 
        Style = l_Stylizer_0, 
        Text = l_Text_0, 
        ZIndex = l_ZIndex_0
    }, {
        PointingHand = not l_Disabled_1 and v1.createElement(v8, {
            Cursor = "PointingHand"
        }) or nil, 
        TeachingCallout = if l_props_0[v1.Children] then l_props_0[v1.Children].TeachingCallout else nil
    });
end;
return (l_withContext_0({
    Stylizer = v2.Stylizer
})(v9));