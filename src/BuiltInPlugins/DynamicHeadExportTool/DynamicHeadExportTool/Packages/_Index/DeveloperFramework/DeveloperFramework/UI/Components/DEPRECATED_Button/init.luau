local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Parent.Cryo);
local v3 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v3.withContext;
local v5 = require(l_Parent_0.UI.Components.Container);
local v6 = require(l_Parent_0.UI.Components.Image);
local v7 = require(l_Parent_0.UI.Components.Pane);
local v8 = require(l_Parent_0.UI.Components.Tooltip);
local v9 = require(l_Parent_0.Util);
local v10 = require(l_Parent_0.Util.StyleModifier);
local l_prioritize_0 = v9.prioritize;
local v12 = require(l_Parent_0.Util.Typecheck);
local v13 = require(l_Parent_0.Wrappers.withForwardRef);
local v14 = v1.PureComponent:extend("Button");
v12.wrap(v14, script);
v14.init = function(v15) --[[ Line: 61 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v10 (copy)
    v15.state = {};
    v15.mouseEnter = function() --[[ Line: 64 ]]
        -- upvalues: v15 (copy), v1 (ref), v10 (ref)
        v15:setState({
            MouseOver = true, 
            StyleModifier = if v15.props.DisableHover then v1.None else v10.Hover
        });
        if not v15.props.DisableHover and v15.props.OnMouseEnter then
            v15.props.OnMouseEnter();
        end;
    end;
    v15.mouseLeave = function() --[[ Line: 75 ]]
        -- upvalues: v15 (copy), v1 (ref)
        v15:setState({
            MouseOver = false, 
            StyleModifier = v1.None
        });
        if not v15.props.DisableHover and v15.props.OnMouseLeave then
            v15.props.OnMouseLeave();
        end;
    end;
    v15.enableHover = function() --[[ Line: 86 ]]
        -- upvalues: v15 (copy), v10 (ref), v1 (ref)
        v15:setState(function(v16) --[[ Line: 87 ]]
            -- upvalues: v10 (ref), v1 (ref)
            return {
                StyleModifier = if v16.MouseOver then v10.Hover else v1.None
            };
        end);
        if v15.state.MouseOver == true and v15.props.OnMouseEnter then
            v15.props.OnMouseEnter();
        end;
    end;
    v15.disableHover = function() --[[ Line: 97 ]]
        -- upvalues: v15 (copy), v1 (ref)
        v15:setState({
            StyleModifier = v1.None
        });
        if v15.props.OnMouseLeave then
            v15.props.OnMouseLeave();
        end;
    end;
    v15.onClick = function(v17) --[[ Line: 106 ]]
        -- upvalues: v15 (copy), v10 (ref)
        if v15.props.StyleModifier ~= v10.Disabled then
            v15.props.OnClick(v17);
        end;
    end;
    v15.onRightClick = function(v18) --[[ Line: 112 ]]
        -- upvalues: v15 (copy), v10 (ref)
        local l_props_0 = v15.props;
        if l_props_0.StyleModifier ~= v10.Disabled and l_props_0.OnRightClick then
            l_props_0.OnRightClick(v18);
        end;
    end;
end;
v14.didUpdate = function(v20, v21) --[[ Line: 120 ]] --[[ Name: didUpdate ]]
    local l_props_1 = v20.props;
    if v21.DisableHover ~= l_props_1.DisableHover then
        if l_props_1.DisableHover then
            v20.disableHover();
            return;
        else
            v20.enableHover();
        end;
    end;
end;
v14.render = function(v23) --[[ Line: 131 ]] --[[ Name: render ]]
    -- upvalues: l_prioritize_0 (copy), v1 (copy), v5 (copy), v2 (copy), v7 (copy), v6 (copy), v8 (copy)
    local l_props_2 = v23.props;
    local l_state_0 = v23.state;
    local v26 = l_props_2.StyleModifier or l_state_0.StyleModifier;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_Background_0 = l_Stylizer_0.Background;
    local l_BackgroundStyle_0 = l_Stylizer_0.BackgroundStyle;
    local l_Foreground_0 = l_Stylizer_0.Foreground;
    local l_ForegroundStyle_0 = l_Stylizer_0.ForegroundStyle;
    local v32 = l_prioritize_0(l_props_2.IconPadding, l_Stylizer_0.IconPadding);
    local v33 = l_props_2.IconSize or UDim2.fromScale(1, 1);
    local l_Padding_0 = l_Stylizer_0.Padding;
    local l_AutomaticSize_0 = l_props_2.AutomaticSize;
    local l_ForwardRef_0 = l_props_2.ForwardRef;
    local l_Text_0 = l_props_2.Text;
    local l_Icon_0 = l_props_2.Icon;
    local l_OnClick_0 = l_props_2.OnClick;
    local v40 = l_prioritize_0(l_Stylizer_0.Size, l_props_2.Size);
    local l_Position_0 = l_props_2.Position;
    local l_SizeConstraint_0 = l_props_2.SizeConstraint;
    local l_AnchorPoint_0 = l_props_2.AnchorPoint;
    local l_ZIndex_0 = l_props_2.ZIndex;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    assert(typeof(l_OnClick_0) == "function", string.format("Button requires OnClick to be of type function, not %s", (typeof(l_OnClick_0))));
    local v46 = UDim2.new(1, 0, 1, 0);
    if l_AutomaticSize_0 then
        v46 = v40;
    end;
    return v1.createElement(v5, {
        AutomaticSize = l_AutomaticSize_0, 
        Background = l_Background_0, 
        BackgroundStyle = l_BackgroundStyle_0, 
        BackgroundStyleModifier = v26, 
        Size = v40, 
        SizeConstraint = l_SizeConstraint_0, 
        Position = l_Position_0, 
        AnchorPoint = l_AnchorPoint_0, 
        ZIndex = l_ZIndex_0, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Foreground = l_Foreground_0 and v1.createElement(v5, {
            Background = l_Foreground_0, 
            BackgroundStyle = l_ForegroundStyle_0, 
            BackgroundStyleModifier = v26, 
            Margin = l_Padding_0, 
            ZIndex = 1
        }), 
        TextButton = v1.createElement("TextButton", {
            AutomaticSize = l_AutomaticSize_0, 
            Size = v46, 
            BackgroundTransparency = 1, 
            Font = l_Stylizer_0.Font, 
            TextSize = l_Stylizer_0.TextSize, 
            TextColor3 = l_Stylizer_0.TextColor, 
            TextTruncate = l_Stylizer_0.TextTruncate, 
            TextWrapped = l_Stylizer_0.TextWrapped, 
            TextXAlignment = l_Stylizer_0.TextXAlignment, 
            TextYAlignment = l_Stylizer_0.TextYAlignment, 
            Text = if not l_Icon_0 then l_Text_0 or "" else "", 
            ZIndex = 2, 
            [v1.Event.Activated] = v23.onClick, 
            [v1.Event.MouseButton2Click] = v23.onRightClick, 
            [v1.Event.MouseEnter] = v23.mouseEnter, 
            [v1.Event.MouseLeave] = v23.mouseLeave, 
            [v1.Ref] = l_ForwardRef_0
        }, v2.Dictionary.join(l_props_2[v1.Children] or {}, if l_Icon_0 then {
            Container = v1.createElement(v7, {
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Size = UDim2.fromScale(1, 1), 
                Spacing = 10
            }, {
                ImageContainer = if l_Icon_0 then v1.createElement(v7, {
                    LayoutOrder = 1, 
                    Padding = v32, 
                    Size = UDim2.new(1, 0, 1, -v32 * 2)
                }, {
                    Image = v1.createElement(v6, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Size = v33, 
                        Style = {
                            Image = l_Icon_0, 
                            Color = l_Stylizer_0.TextColor
                        }
                    }, {
                        Constraint = v1.createElement("UIAspectRatioConstraint", {
                            AspectRatio = 1, 
                            DominantAxis = Enum.DominantAxis.Height
                        })
                    })
                }) else nil, 
                TextContainer = if l_Text_0 then v1.createElement(v7, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = 2
                }, {
                    Text = v1.createElement("TextLabel", {
                        AutomaticSize = l_AutomaticSize_0, 
                        Size = v46, 
                        BackgroundTransparency = 1, 
                        Font = l_Stylizer_0.Font, 
                        TextSize = l_Stylizer_0.TextSize, 
                        TextColor3 = l_Stylizer_0.TextColor, 
                        TextTruncate = l_Stylizer_0.TextTruncate, 
                        TextWrapped = l_Stylizer_0.TextWrapped, 
                        TextXAlignment = l_Stylizer_0.TextXAlignment, 
                        TextYAlignment = l_Stylizer_0.TextYAlignment, 
                        Text = l_Text_0, 
                        ZIndex = 2
                    })
                }) else nil
            })
        } else {})), 
        Tooltip = l_props_2.Tooltip and v1.createElement(v8, {
            Text = l_props_2.Tooltip
        }) or nil
    });
end;
return v13((l_withContext_0({
    Stylizer = v3.Stylizer
})(v14)));