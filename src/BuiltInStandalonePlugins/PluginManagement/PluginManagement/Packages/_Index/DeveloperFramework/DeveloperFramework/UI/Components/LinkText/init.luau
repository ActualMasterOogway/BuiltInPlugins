local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Wrappers.withAbsoluteSize);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local l_Util_0 = l_Parent_0.Util;
local v7 = require(l_Util_0.StyleModifier);
local v8 = require(l_Util_0.prioritize);
local v9 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkInlineLayout)();
local v10 = require(l_Parent_0.UI.Components.HoverArea);
local v11 = v1.PureComponent:extend("LinkText");
v11.init = function(v12) --[[ Line: 61 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy), v9 (copy), v1 (copy)
    v12.state = {};
    v12.mouseEnter = function() --[[ Line: 64 ]]
        -- upvalues: v12 (copy), v7 (ref), v9 (ref)
        v12:setState({
            StyleModifier = v7.Hover
        });
        if v12.props.onHover and v9 then
            v12.props.onHover(true);
        end;
    end;
    v12.mouseLeave = function() --[[ Line: 73 ]]
        -- upvalues: v12 (copy), v1 (ref), v9 (ref)
        v12:setState({
            StyleModifier = v1.None
        });
        if v12.props.onHover and v9 then
            v12.props.onHover(false);
        end;
    end;
end;
v11.render = function(v13) --[[ Line: 83 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v7 (copy), v9 (copy), v1 (copy), l_join_0 (copy), v10 (copy)
    local l_props_0 = v13.props;
    local l_StyleModifier_0 = v13.state.StyleModifier;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Size_0 = l_props_0.Size;
    local v18 = v8(l_props_0.Font, l_Stylizer_0.Font);
    local v19 = v8(l_props_0.TextSize, l_Stylizer_0.TextSize);
    local v20 = l_props_0.Text or "";
    local l_TextColor_0 = l_Stylizer_0.TextColor;
    local l_TextColorHovered_0 = l_Stylizer_0.TextColorHovered;
    local l_TextTruncate_0 = l_props_0.TextTruncate;
    local l_TextWrapped_0 = l_props_0.TextWrapped;
    local l_TextXAlignment_0 = l_props_0.TextXAlignment;
    local l_TextYAlignment_0 = l_props_0.TextYAlignment;
    local v27 = nil;
    v27 = if l_TextWrapped_0 then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY;
    local v28 = nil;
    v28 = if l_TextTruncate_0 then l_Size_0 else l_Size_0 or UDim2.new((not not l_TextTruncate_0 or l_TextWrapped_0) and 1 or 0, 0, 0, 0);
    local l_OnClick_0 = l_props_0.OnClick;
    local l_Position_0 = l_props_0.Position;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_ZIndex_0 = l_props_0.ZIndex;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v34 = true;
    if l_StyleModifier_0 ~= v7.Hover then
        v34 = v9 and l_props_0.isHovered;
    end;
    local v35 = l_Stylizer_0.EnableHover == nil or l_Stylizer_0.EnableHover;
    local l_ShowUnderline_0 = l_Stylizer_0.ShowUnderline;
    local v37 = l_Stylizer_0.ForceUnderline and true or l_ShowUnderline_0 and v34 and not l_TextWrapped_0;
    local l_l_TextColor_0_0 = l_TextColor_0;
    if v34 then
        l_l_TextColor_0_0 = l_TextColorHovered_0 or l_TextColor_0;
    end;
    local v39 = v1.createElement("TextButton", l_join_0({
        Font = v18, 
        TextSize = v19, 
        TextColor3 = l_l_TextColor_0_0, 
        TextTruncate = l_TextTruncate_0, 
        TextWrapped = l_TextWrapped_0, 
        TextXAlignment = l_TextXAlignment_0, 
        TextYAlignment = l_TextYAlignment_0, 
        AutomaticSize = v27, 
        BackgroundTransparency = 1, 
        Size = v28, 
        Position = if v35 then nil else l_Position_0, 
        RichText = if v9 then l_props_0.RichText else nil, 
        AnchorPoint = if v35 then nil else l_AnchorPoint_0, 
        ZIndex = l_ZIndex_0, 
        LayoutOrder = l_LayoutOrder_0, 
        Text = v20, 
        [v1.Event.Activated] = l_OnClick_0
    }, l_props_0.WrapperProps));
    if v35 then
        return v1.createElement(v10, {
            AnchorPoint = l_AnchorPoint_0, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            Cursor = "PointingHand", 
            LayoutOrder = l_LayoutOrder_0, 
            MouseEnter = v13.mouseEnter, 
            MouseLeave = v13.mouseLeave, 
            Size = l_props_0.HoverAreaSize, 
            Position = l_Position_0, 
            ZIndex = l_ZIndex_0
        }, {
            Button = v39, 
            Underline = v1.createElement("Frame", {
                Position = UDim2.new(0, 0, 1, -1), 
                LayoutOrder = 1, 
                Size = if l_TextWrapped_0 then UDim2.new(1, 0, 0, 1) else UDim2.new(0, l_props_0.AbsoluteSize.X, 0, 1), 
                BackgroundColor3 = l_l_TextColor_0_0, 
                BorderSizePixel = 0, 
                BackgroundTransparency = v37 and 0 or 1
            })
        });
    else
        return v39;
    end;
end;
return (v4((l_withContext_0({
    Stylizer = v2.Stylizer
})(v11))));