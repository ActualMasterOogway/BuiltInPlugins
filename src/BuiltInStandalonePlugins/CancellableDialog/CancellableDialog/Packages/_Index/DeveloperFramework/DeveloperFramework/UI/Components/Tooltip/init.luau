local l_RunService_0 = game:GetService("RunService");
local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v3 = require(l_Parent_0.Parent.Roact);
local v4 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v4.withContext;
local v6 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v7 = require(l_Parent_0.Styling.supportsStyleSheets);
local v8 = require(l_Parent_0.Styling.joinTags);
local v9 = require(script.styles);
local v10 = require(l_Parent_0.UI.Components.TextLabel.styles);
local v11 = require(l_Parent_0.UI.Components.ShowOnTop);
local v12 = require(l_Parent_0.UI.Components.DropShadow);
local v13 = require(l_Parent_0.UI.Components.Pane);
local v14 = require(l_Parent_0.UI.Components.TextLabel);
local v15 = require(l_Parent_0.Util.prioritize);
local v16 = require(l_Parent_0.Util.Typecheck);
local v17 = if not v7 then require(script.style) else nil;
local l_assign_0 = require(l_Parent_0.Parent.Dash).assign;
local v19 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkMaterialPickerInstantTooltip);
local v20 = require(l_Parent_0.SharedFlags.getFFlagACEFaceAnimationEditorUIFixes);
local v21 = v3.PureComponent:extend("Tooltip");
v16.wrap(v21, script);
v21.defaultProps = {
    Enabled = true, 
    Priority = 0
};
v21.init = function(v22, v23) --[[ Line: 91 ]] --[[ Name: init ]]
    assert(v23.Text or v23.Content, "Either Text prop or Content prop is required");
    assert(not v23.Content or v23.ContentExtents, "Content prop requires ContentExtents prop");
    v22.state = {
        showTooltip = false
    };
    v22.hoverConnection = nil;
    v22.mousePosition = nil;
    v22.isTooltipHovered = false;
    v22.tooltipMouseEnter = function() --[[ Line: 102 ]]
        -- upvalues: v22 (copy)
        v22.isTooltipHovered = true;
    end;
    v22.tooltipMouseLeave = function() --[[ Line: 106 ]]
        -- upvalues: v22 (copy)
        v22.isTooltipHovered = false;
        v22:maybeHideTooltip();
    end;
    v22.mouseEnter = function(_, v25, v26) --[[ Line: 111 ]]
        -- upvalues: v22 (copy)
        if not v22.isTooltipHovered then
            v22.targetTime = tick() + v22:getShowDelay();
            v22.mousePosition = Vector2.new(v25, v26);
            v22:connectHover();
        end;
    end;
    v22.mouseMoved = function(_, v28, v29) --[[ Line: 119 ]]
        -- upvalues: v22 (copy)
        v22.mousePosition = Vector2.new(v28, v29);
        v22.targetTime = tick() + v22:getShowDelay();
    end;
    v22.mouseLeave = function() --[[ Line: 124 ]]
        -- upvalues: v22 (copy)
        v22.targetTime = 0;
        v22.mousePosition = nil;
        v22:maybeHideTooltip();
    end;
end;
v21.getShowDelay = function(v30) --[[ Line: 131 ]] --[[ Name: getShowDelay ]]
    -- upvalues: v7 (copy), v15 (copy), v9 (copy), v17 (copy), v19 (copy)
    if v7 then
        return v15(v30.props.ShowDelay, v9:GetAttribute("ShowDelay"));
    else
        local v31 = v30.props.Stylizer or v17;
        if v19() then
            return v30.props.ShowDelay or v31.ShowDelay;
        else
            return v31.ShowDelay;
        end;
    end;
end;
v21.connectHover = function(v32) --[[ Line: 145 ]] --[[ Name: connectHover ]]
    -- upvalues: l_RunService_0 (copy), v19 (copy)
    v32:disconnectHover();
    v32.hoverConnection = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 147 ]]
        -- upvalues: v32 (copy), v19 (ref)
        if tick() >= v32.targetTime then
            v32:disconnectHover();
            v32:setState({
                showTooltip = true
            });
            if v19() and v32.props.OnTooltipShown and v32.props.Enabled then
                v32.props.OnTooltipShown();
            end;
        end;
    end);
end;
v21.disconnectHover = function(v33) --[[ Line: 162 ]] --[[ Name: disconnectHover ]]
    if v33.hoverConnection then
        v33.hoverConnection:Disconnect();
        v33.hoverConnection = nil;
    end;
end;
v21.maybeHideTooltip = function(v34) --[[ Line: 169 ]] --[[ Name: maybeHideTooltip ]]
    local v35 = true;
    if v34.mousePosition == nil then
        v35 = v34.isTooltipHovered;
    end;
    if not v35 then
        v34:disconnectHover();
        v34:setState({
            showTooltip = false
        });
    end;
end;
v21.willUnmount = function(v36) --[[ Line: 179 ]] --[[ Name: willUnmount ]]
    v36:disconnectHover();
end;
v21.render = function(v37) --[[ Line: 183 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v9 (copy), v15 (copy), v19 (copy), v10 (copy), l_TextService_0 (copy), v3 (copy), l_assign_0 (copy), v14 (copy), v6 (copy), v20 (copy), v8 (copy), v11 (copy), v12 (copy), v13 (copy)
    local l_props_0 = v37.props;
    local l_state_0 = v37.state;
    local v40 = if v7 then l_props_0.Style or {} else l_props_0.Stylizer;
    local v41 = if v7 then v9:GetAttribute("Padding") else v40.Padding;
    local v42 = if v7 then v9:GetAttribute("DropShadowPadding") else v40.DropShadow and v40.DropShadow.Radius or 0;
    local v43 = if v7 then v9:GetAttribute("Offset") else v40.Offset;
    local v44 = if v7 then v15(l_props_0.MaxWidth, v9:GetAttribute("MaxWidth")) else l_props_0.MaxWidth or v40.MaxWidth;
    local l_Text_0 = l_props_0.Text;
    local l_Enabled_0 = l_props_0.Enabled;
    local l_Priority_0 = l_props_0.Priority;
    local v48 = if v19() then l_props_0.Position else nil;
    local l_mousePosition_0 = v37.mousePosition;
    local v50 = {
        TooltipChild = l_props_0.Child or nil
    };
    local v51 = l_props_0.Focus:get();
    if l_state_0.showTooltip and l_mousePosition_0 and l_Enabled_0 and v51 then
        local v52 = l_mousePosition_0.X + v43.X;
        local v53 = l_mousePosition_0.Y + v43.Y;
        if v19() and v48 then
            v52 = v48.X;
            v53 = v48.Y;
        end;
        local l_X_0 = v51.AbsoluteSize.X;
        local l_Y_0 = v51.AbsoluteSize.Y;
        local v56 = nil;
        local v57 = nil;
        if v19() then
            v56 = v15(l_props_0.ContainerXBounds, NumberRange.new(0, v51.AbsoluteSize.X));
            v57 = v15(l_props_0.ContainerYBounds, NumberRange.new(0, v51.AbsoluteSize.Y));
        end;
        local v58 = (v42 + v41) * 2;
        local _ = nil;
        local v60 = math.max(0, (if v19() then math.min(v56.Max, v44) else math.min(l_X_0, v44)) - v58);
        local v61 = nil;
        local v62 = nil;
        if l_props_0.Content then
            v61 = l_props_0.ContentExtents.X + v58;
            v62 = l_props_0.ContentExtents.Y + v58;
        else
            local v63 = if v7 then v10:GetAttribute("TextLabelFont") else v40.Font;
            local v64 = if v7 then v10:GetAttribute("TextLabelTextSize") else v40.TextSize;
            local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_Text_0, v64, v63, Vector2.new(v60, 1e999));
            v61 = l_l_TextService_0_TextSize_0.X + v58 + 1;
            v62 = l_l_TextService_0_TextSize_0.Y + v58 + 1;
        end;
        if v19() then
            local v66 = v15(l_props_0.AnchorPoint, UDim2.new(0, 0, 0, 0));
            local l_Scale_0 = v66.X.Scale;
            local l_Offset_0 = v66.X.Offset;
            local l_Scale_1 = v66.Y.Scale;
            local l_Offset_1 = v66.Y.Offset;
            local v71 = v61 * l_Scale_0 + l_Offset_0;
            local v72 = v61 - v71;
            local v73 = v62 * l_Scale_1 + l_Offset_1;
            local v74 = v62 - v73;
            if v52 + v72 >= v56.Max then
                v52 = v56.Max - v72;
            elseif v52 - v71 <= v56.Min then
                v52 = v56.Min + v71;
            end;
            if v53 + v74 >= v57.Max then
                v53 = v57.Max - v74;
            elseif v53 - v73 <= v57.Min then
                v53 = v57.Min + v73;
            end;
            v52 = v52 - v71;
            v53 = v53 - v73;
        else
            if l_X_0 <= v52 + v61 then
                v52 = l_X_0 - v61;
            end;
            if l_Y_0 <= v53 + v62 then
                v53 = l_Y_0 - v62;
            end;
        end;
        local v75 = {
            BackgroundTransparency = 1, 
            Position = UDim2.fromOffset(v52, v53), 
            Size = UDim2.fromOffset(v61, v62)
        };
        local v76 = {};
        if l_props_0.Content then
            v76.Content = v3.createFragment(l_props_0.Content);
            l_assign_0(v75, {
                [v3.Event.MouseEnter] = v37.tooltipMouseEnter, 
                [v3.Event.MouseMoved] = v37.tooltipMouseMoved, 
                [v3.Event.MouseLeave] = v37.tooltipMouseLeave
            });
        else
            v76.Label = v3.createElement(v14, if v7 then {
                Text = l_Text_0, 
                TextXAlignment = l_props_0.TextXAlignment, 
                [v6.Tag] = "X-Fill X-Top X-Left Wrap", 
                ZIndex = if v20 then l_props_0.ZIndex else nil
            } else {
                Size = UDim2.new(1, 0, 1, 0), 
                Text = l_Text_0, 
                TextWrapped = true, 
                TextXAlignment = l_props_0.TextXAlignment, 
                ZIndex = if v20 then l_props_0.ZIndex else nil
            });
        end;
        if v7 then
            v75[v6.Tag] = v8("Component-Tooltip", l_props_0[v6.Tag]);
        end;
        v50.TooltipContainer = v3.createElement(v11, {
            Priority = l_Priority_0
        }, {
            Tooltip = v3.createElement("Frame", v75, {
                DropShadow = v3.createElement(v12, {
                    Style = if v7 then nil else v40.DropShadow
                }, {
                    ContentPane = v3.createElement(v13, if v7 then {
                        [v6.Tag] = "X-PadS X-Stroke X-Corner Main", 
                        ZIndex = if v20 then l_props_0.ZIndex else nil
                    } else {
                        Padding = v41, 
                        Style = "Box", 
                        ZIndex = if v20 then l_props_0.ZIndex else nil
                    }, v76)
                })
            })
        });
    end;
    return v3.createElement("Frame", {
        Size = l_props_0.Child and UDim2.fromScale(0, 0) or UDim2.fromScale(1, 1), 
        AutomaticSize = l_props_0.Child and Enum.AutomaticSize.XY or nil, 
        BackgroundTransparency = 1, 
        [v3.Event.MouseEnter] = v37.mouseEnter, 
        [v3.Event.MouseMoved] = v37.mouseMoved, 
        [v3.Event.MouseLeave] = v37.mouseLeave
    }, v50);
end;
return (l_withContext_0({
    Focus = v4.Focus, 
    Stylizer = if v7 then nil else v4.Stylizer
})(v21));