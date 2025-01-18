local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.SharedFlags).getFFlagPassTagsThroughToChildren();
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v4 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v4.withContext;
local v6 = require(l_Parent_0.Wrappers.withForwardRef);
local v7 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v8 = require(l_Parent_0.Styling.supportsStyleSheets);
local v9 = require(l_Parent_0.Styling.joinTags);
local v10 = require(l_Parent_0.Styling.hasTag);
local l_prioritize_0 = require(l_Parent_0.Util).prioritize;
local v12 = require(l_Parent_0.UI.Components.Pane);
local v13 = require(l_Parent_0.UI.Components.TextLabel);
local v14 = require(l_Parent_0.UI.Components.Tooltip);
local v15 = require(l_Parent_0.UI.Components.HoverArea);
local v16 = require(l_Parent_0.UI.Components.Image);
local v17 = v1.PureComponent:extend("IconButton");
v17.defaultProps = {
    BackgroundStyle = if v8 then nil else "BorderBox", 
    Disabled = false, 
    LayoutOrder = 0, 
    TextXAlignment = if v8 then nil else Enum.TextXAlignment.Left, 
    TextYAlignment = if v8 then nil else Enum.TextYAlignment.Center
};
v17.init = function(v18) --[[ Line: 81 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy)
    v18.state = {
        Hovering = false
    };
    if not v8 then
        v18.mouseEnter = function() --[[ Line: 87 ]]
            -- upvalues: v18 (copy)
            v18:setState({
                Hovering = true
            });
        end;
        v18.mouseLeave = function() --[[ Line: 93 ]]
            -- upvalues: v18 (copy)
            v18:setState({
                Hovering = false
            });
        end;
    end;
end;
v17.render = function(v19) --[[ Line: 101 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v7 (copy), v9 (copy), v10 (copy), l_prioritize_0 (copy), v1 (copy), v2 (copy), v16 (copy), l_join_0 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy)
    local l_props_0 = v19.props;
    local l_state_0 = v19.state;
    local v22 = if v8 then l_props_0[v7.Tag] else nil;
    local v23 = if v8 then l_props_0.Style or {} else l_props_0.Stylizer;
    if v8 and typeof(v23) == "string" then
        v22 = v9(v22, v23);
        v23 = {};
    end;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_Position_0 = l_props_0.Position;
    local l_Rotation_0 = l_props_0.Rotation;
    local v27 = if v8 then v10(v22, "Disabled") or l_props_0.Disabled else l_props_0.Disabled;
    local v28 = if v8 then nil else l_state_0.Hovering;
    local v29 = if v8 then l_props_0.BackgroundColor3 or l_props_0.BackgroundColor else l_prioritize_0(l_props_0.BackgroundColor, v23.BackgroundColor);
    local v30 = if v8 then l_props_0.HoverColor else l_prioritize_0(l_props_0.HoverColor, v23.Hover.Background);
    local v31 = if l_props_0.OnClick and v28 then v30 else v29;
    if v27 then
        v31 = if v23.Disabled then v23.Disabled.Background else nil;
    end;
    local v32 = if v8 then l_props_0.Size else l_prioritize_0(l_props_0.Size, v23.Size);
    local v33 = if l_props_0.Style == "IconOnly" then nil else l_props_0.BackgroundStyle;
    local v34 = if v8 then l_props_0.TextColor else l_prioritize_0(l_props_0.TextColor, v23.TextColor);
    local v35 = if v8 then l_props_0.DisabledTextColor else l_prioritize_0(l_props_0.DisabledTextColor, v23.Disabled.TextColor);
    local v36 = if not v27 and l_props_0.OnClick then v34 else v35;
    local v37 = if v8 then l_props_0.IconColor else l_prioritize_0(l_props_0.IconColor, v23.IconColor);
    local v38 = if v8 then nil else l_prioritize_0(l_props_0.IconScaleType, v23.IconScaleType);
    local v39 = if not v8 then l_prioritize_0(l_props_0.BorderColor, v23.BorderColor) else l_props_0.BorderColor;
    local v40 = if v8 then l_props_0.IconSize else l_prioritize_0(l_props_0.IconSize, v23.IconSize);
    local v41 = if v8 then l_props_0.Padding else l_prioritize_0(l_props_0.Padding, v23.Padding);
    local v42 = if v8 then l_props_0.Spacing else l_prioritize_0(l_props_0.Spacing, v23.Spacing);
    local v43 = nil;
    if not v8 then
        local v44 = 2 * v40;
        v43 = UDim2.new(1, -v44, 1, 0);
        if l_props_0.AutomaticSize == Enum.AutomaticSize.XY then
            if not l_props_0.Size then
                v32 = UDim2.fromScale(0, 0);
            end;
            v43 = UDim2.fromScale(0, 0);
        elseif l_props_0.AutomaticSize == Enum.AutomaticSize.X then
            if not l_props_0.Size then
                v32 = UDim2.fromScale(0, 1);
            end;
            v43 = UDim2.fromScale(0, 1);
        elseif l_props_0.AutomaticSize == Enum.AutomaticSize.Y then
            if not l_props_0.Size then
                v32 = UDim2.fromScale(1, 0);
            end;
            v43 = UDim2.new(1, -v44, 0, 0);
        end;
        if l_props_0.Style == "Link" then
            v33 = nil;
        end;
    end;
    local v45 = {
        AnchorPoint = l_AnchorPoint_0, 
        AutomaticSize = l_props_0.AutomaticSize, 
        SizeConstraint = l_props_0.SizeConstraint, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Position = l_Position_0, 
        Size = v32, 
        Text = "", 
        Rotation = l_Rotation_0, 
        ZIndex = l_props_0.ZIndex, 
        [v1.Ref] = l_props_0.ForwardRef, 
        [v1.Event.Activated] = not l_props_0.Disabled and l_props_0.OnClick or nil, 
        [v1.Event.MouseButton2Click] = not l_props_0.Disabled and l_props_0.OnRightClick or nil, 
        [v1.Event.MouseEnter] = v19.mouseEnter, 
        [v1.Event.MouseLeave] = v19.mouseLeave
    };
    local v46 = if v8 then v10(v22, "IconOnly") else nil;
    local v47 = nil;
    local v48 = false;
    if v8 then
        v45[v7.Tag] = if v2 then l_props_0[v7.Tag] or v9("Component-IconButton", v22, "X-Fit") else v9("Component-IconButton", v22, "X-Fit");
        if v46 or v10(v22, "Link") then
            v47 = "";
        elseif v27 then
            v47 = "Muted";
        elseif v10(v22, "Primary") then
            v47 = "Primary";
            v48 = true;
        elseif v10(v22, "PrimaryBrand") then
            v47 = "PrimaryBrand";
            v48 = true;
        else
            v47 = "Secondary";
        end;
    end;
    local v49 = nil;
    if l_props_0.LeftIcon then
        if v8 then
            local v50 = l_props_0.IconTag or "Icon16";
            v49 = v1.createElement(v16, if typeof(l_props_0.LeftIcon) == "table" then l_join_0({
                LayoutOrder = 1, 
                [v7.Tag] = v50
            }, l_props_0.LeftIcon) else {
                LayoutOrder = 1, 
                Image = l_props_0.LeftIcon, 
                [v7.Tag] = v50
            });
        else
            v49 = v1.createElement(v12, if typeof(l_props_0.LeftIcon) == "table" then l_join_0(l_props_0.LeftIcon, {
                LayoutOrder = 1
            }) else {
                LayoutOrder = 1, 
                ScaleType = v38, 
                Size = UDim2.fromOffset(v40, v40), 
                Style = {
                    Background = v37, 
                    Image = l_props_0.LeftIcon
                }
            });
        end;
    end;
    local v51 = nil;
    if l_props_0.RightIcon then
        if v8 then
            local v52 = l_props_0.IconTag or "Icon16";
            v51 = v1.createElement(v16, if typeof(l_props_0.RightIcon) == "table" then l_join_0({
                LayoutOrder = 1, 
                [v7.Tag] = v52
            }, l_props_0.RightIcon) else {
                LayoutOrder = 3, 
                Image = l_props_0.RightIcon, 
                [v7.Tag] = l_props_0.IconTag or "Icon16"
            });
        else
            v51 = v1.createElement(v12, if typeof(l_props_0.RightIcon) == "table" then l_join_0(l_props_0.RightIcon, {
                LayoutOrder = 3
            }) else {
                LayoutOrder = 3, 
                ScaleType = v38, 
                Size = UDim2.fromOffset(v40, v40), 
                Style = {
                    Background = v37, 
                    Image = l_props_0.RightIcon
                }
            });
        end;
    end;
    return v1.createElement("TextButton", v45, {
        Content = v1.createElement(v12, if v8 then {
            AutomaticSize = l_props_0.AutomaticSize, 
            BackgroundColor3 = v31, 
            BorderColor = v39, 
            Size = v32, 
            [v7.Tag] = if v2 then l_props_0.PaneTags or v9("X-Fit X-RowM", if v46 then nil else "X-Corner X-Stroke", v47, v10(v22, "Compact") and "X-PadS" or "X-Pad") else v9("X-Fit X-RowM", if v46 then nil else "X-Corner X-Stroke", v47, v10(v22, "Compact") and "X-PadS" or "X-Pad")
        } else {
            AutomaticSize = l_props_0.AutomaticSize, 
            BackgroundColor = v31, 
            BorderColor = v39, 
            ImageTransparency = l_props_0.ImageTransparency, 
            Layout = Enum.FillDirection.Horizontal, 
            Padding = v41, 
            Size = v32, 
            Spacing = v42, 
            Style = v33
        }, {
            LeftIcon = v49, 
            Text = l_props_0.Text and v1.createElement(v13, if v8 then {
                LayoutOrder = 2, 
                Text = l_props_0.Text, 
                [v7.Tag] = v9("X-Fit", v27 and "Disabled" or nil, v48 and "Contrast" or nil)
            } else {
                AutomaticSize = l_props_0.AutomaticSize, 
                Text = l_props_0.Text, 
                TextColor = v36, 
                Size = v43, 
                LayoutOrder = 2, 
                TextXAlignment = l_props_0.TextXAlignment, 
                TextYAlignment = l_props_0.TextYAlignment
            }), 
            RightIcon = v51
        }), 
        Tooltip = l_props_0.TooltipText and v1.createElement(v14, {
            Style = l_props_0.TooltipStyle, 
            Text = l_props_0.TooltipText
        }), 
        HoverArea = if l_props_0.Cursor then v1.createElement(v15, {
            Cursor = l_props_0.Cursor
        }) else nil
    });
end;
return v6((l_withContext_0({
    Stylizer = if v8 then nil else v4.Stylizer
})(v17)));