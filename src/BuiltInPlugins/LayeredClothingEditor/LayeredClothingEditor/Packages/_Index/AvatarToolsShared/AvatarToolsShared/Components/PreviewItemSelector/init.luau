local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Focus_0 = l_ContextServices_0.Focus;
local l_RunService_0 = game:GetService("RunService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Selection_0 = game:GetService("Selection");
local v9 = v1.PureComponent:extend("PreviewItemSelector");
local l_Tooltip_0 = v2.UI.Tooltip;
v2.Util.Typecheck.wrap(v9, script);
v9.defaultProps = {
    SelectionDistance = 20
};
v9.getMouseTarget = function(v11) --[[ Line: 44 ]] --[[ Name: getMouseTarget ]]
    local l_Target_0 = v11.props.Mouse:get().Target;
    if not l_Target_0 or v11.props.IsSelectedInstanceValid(l_Target_0) or not l_Target_0.Parent:FindFirstChild("HumanoidRootPart") then
        return l_Target_0;
    else
        return l_Target_0.Parent;
    end;
end;
local function _(v13) --[[ Line: 56 ]] --[[ Name: getTargetCFrame ]]
    if v13:IsA("Model") then
        if v13.PrimaryPart then
            return v13:GetPrimaryPartCFrame();
        else
            warn("PreviewItemSelector: Model does not have a PrimaryPart set. Model will be ignored.");
            return;
        end;
    else
        return v13.CFrame;
    end;
end;
v9.selectValidInstance = function(v15, v16, v17) --[[ Line: 68 ]] --[[ Name: selectValidInstance ]]
    local l_props_0 = v15.props;
    local l_SelectionDistance_0 = l_props_0.SelectionDistance;
    local l_IsSelectedInstanceValid_0 = l_props_0.IsSelectedInstanceValid;
    local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
    local v22 = v15:getMouseTarget();
    if v22 ~= nil and l_IsSelectedInstanceValid_0(v22) then
        local v23;
        if v22:IsA("Model") then
            if v22.PrimaryPart then
                v23 = v22:GetPrimaryPartCFrame();
            else
                warn("PreviewItemSelector: Model does not have a PrimaryPart set. Model will be ignored.");
                v23 = nil;
            end;
        else
            v23 = v22.CFrame;
        end;
        if v23 and (v23.p - l_CurrentCamera_0.CFrame.p).Magnitude <= l_SelectionDistance_0 then
            v15:setState({
                isEquipped = v15.props.IsEquipped(v22)
            });
            v16(v22);
            return;
        end;
    end;
    v17(v22);
end;
v9.init = function(v24) --[[ Line: 91 ]] --[[ Name: init ]]
    -- upvalues: l_Selection_0 (copy), v1 (copy), l_CoreGui_0 (copy), l_Focus_0 (copy)
    v24.state = {
        hoverPart = nil, 
        isEquipped = false, 
        hovered = false
    };
    v24.selectedItem = nil;
    v24.selectInstance = function(v25) --[[ Line: 100 ]]
        -- upvalues: l_Selection_0 (ref)
        l_Selection_0:Set({
            v25
        });
    end;
    v24.deselect = function() --[[ Line: 104 ]]
        -- upvalues: l_Selection_0 (ref)
        l_Selection_0:Set({});
    end;
    v24.highlightInstance = function(v26) --[[ Line: 108 ]]
        -- upvalues: v24 (copy)
        v24:setState({
            hoverPart = v26
        });
    end;
    v24.removeHighlight = function() --[[ Line: 114 ]]
        -- upvalues: v24 (copy), v1 (ref)
        v24:setState({
            hoverPart = v1.None, 
            hovered = false
        });
    end;
    v24.cameraMoved = game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 121 ]]
        -- upvalues: v24 (copy)
        v24:setState({
            temp = {}
        });
    end);
    v24.ScreenGui = Instance.new("ScreenGui");
    v24.ScreenGui.Parent = l_CoreGui_0;
    v24.ScreenGui.Name = "PreviewSelectorGUI";
    v24.focus = l_Focus_0.new(v24.ScreenGui);
end;
v9.didMount = function(v27) --[[ Line: 134 ]] --[[ Name: didMount ]]
    -- upvalues: l_Selection_0 (copy), l_RunService_0 (copy)
    v27.SelectionChangedHandle = l_Selection_0.SelectionChanged:Connect(function() --[[ Line: 135 ]]
        -- upvalues: v27 (copy), l_Selection_0 (ref)
        if v27.buttonDown then
            l_Selection_0:Set({});
        end;
    end);
    v27.Heartbeat = l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 141 ]]
        -- upvalues: v27 (copy)
        v27:selectValidInstance(v27.highlightInstance, v27.removeHighlight);
    end);
end;
v9.getIconPosition = function(v29) --[[ Line: 146 ]] --[[ Name: getIconPosition ]]
    local l_hoverPart_0 = v29.state.hoverPart;
    local l_CurrentCamera_1 = game.Workspace.CurrentCamera;
    local v32 = nil;
    if l_hoverPart_0 then
        local v33;
        if l_hoverPart_0:IsA("Model") then
            if l_hoverPart_0.PrimaryPart then
                v33 = l_hoverPart_0:GetPrimaryPartCFrame();
            else
                warn("PreviewItemSelector: Model does not have a PrimaryPart set. Model will be ignored.");
                v33 = nil;
            end;
        else
            v33 = l_hoverPart_0.CFrame;
        end;
        if v33 then
            v32 = l_CurrentCamera_1:WorldToScreenPoint(v33.p);
        end;
    end;
    return v32;
end;
v9.getIconRadius = function(v34) --[[ Line: 162 ]] --[[ Name: getIconRadius ]]
    local l_props_1 = v34.props;
    local l_hoverPart_1 = v34.state.hoverPart;
    if not l_hoverPart_1 then
        return 0;
    else
        local v37;
        if l_hoverPart_1:IsA("Model") then
            if l_hoverPart_1.PrimaryPart then
                v37 = l_hoverPart_1:GetPrimaryPartCFrame();
            else
                warn("PreviewItemSelector: Model does not have a PrimaryPart set. Model will be ignored.");
                v37 = nil;
            end;
        else
            v37 = l_hoverPart_1.CFrame;
        end;
        if not v37 then
            return 0;
        else
            local l_Stylizer_0 = l_props_1.Stylizer;
            local l_SelectionDistance_1 = l_props_1.SelectionDistance;
            local l_MinRadius_0 = l_Stylizer_0.MinRadius;
            local l_MaxRadius_0 = l_Stylizer_0.MaxRadius;
            local l_CurrentCamera_2 = game.Workspace.CurrentCamera;
            local v43 = 1 - math.clamp((v37.p - l_CurrentCamera_2.CFrame.p).Magnitude / l_SelectionDistance_1, 0, 1);
            return l_MinRadius_0 + (l_MaxRadius_0 - l_MinRadius_0) * v43;
        end;
    end;
end;
v9.renderButton = function(v44) --[[ Line: 188 ]] --[[ Name: renderButton ]]
    -- upvalues: v1 (copy), l_Tooltip_0 (copy)
    local l_props_2 = v44.props;
    local l_state_0 = v44.state;
    local l_TooltipText_0 = l_props_2.TooltipText;
    local l_Stylizer_1 = l_props_2.Stylizer;
    local l_isEquipped_0 = l_state_0.isEquipped;
    local v50 = v44:getIconPosition();
    local v51 = v44:getIconRadius();
    local l_hoverPart_2 = l_state_0.hoverPart;
    local v53 = {};
    if l_TooltipText_0 then
        v53.Tooltip = v1.createElement(l_Tooltip_0, {
            Text = l_TooltipText_0
        });
    end;
    local v54 = nil;
    local v55 = nil;
    if l_isEquipped_0 then
        v54 = l_Stylizer_1.EquippedIcon;
        v55 = l_Stylizer_1.EquippedColor;
    else
        v54 = l_Stylizer_1.UnequippedIcon;
        v55 = l_Stylizer_1.UnequippedColor;
    end;
    local l_DefaultColor_0 = l_Stylizer_1.DefaultColor;
    return v1.createElement("ImageButton", {
        Size = UDim2.fromOffset(v51, v51), 
        Position = UDim2.fromOffset(v50.x, v50.y), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = v54, 
        ImageColor3 = if v44.state.hovered then v55 else l_DefaultColor_0, 
        [v1.Event.MouseButton1Click] = function() --[[ Line: 225 ]]
            -- upvalues: v44 (copy), l_hoverPart_2 (copy), l_isEquipped_0 (copy)
            v44.props.OnValidSelection(l_hoverPart_2, l_isEquipped_0);
        end, 
        [v1.Event.MouseEnter] = function() --[[ Line: 228 ]]
            -- upvalues: v44 (copy)
            v44:setState({
                hovered = true
            });
        end, 
        [v1.Event.MouseLeave] = function() --[[ Line: 233 ]]
            -- upvalues: v44 (copy)
            v44:setState({
                hovered = false
            });
        end
    }, v53);
end;
v9.render = function(v57) --[[ Line: 241 ]] --[[ Name: render ]]
    -- upvalues: l_ContextServices_0 (copy), v1 (copy)
    local l_hoverPart_3 = v57.state.hoverPart;
    local v59 = false;
    if l_hoverPart_3 ~= nil then
        v59 = l_ContextServices_0.provide({
            v57.focus
        }, {
            Child = v1.createElement(v1.Portal, {
                target = v57.ScreenGui
            }, {
                Button = v57:renderButton()
            })
        });
    end;
    return v59;
end;
v9.willUnmount = function(v60) --[[ Line: 258 ]] --[[ Name: willUnmount ]]
    if v60.cameraMoved then
        v60.cameraMoved:Disconnect();
    end;
    if v60.Heartbeat then
        v60.Heartbeat:Disconnect();
    end;
    if v60.SelectionChangedHandle then
        v60.SelectionChangedHandle:Disconnect();
    end;
    if v60.ScreenGui then
        v60.ScreenGui:Destroy();
    end;
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse, 
    Plugin = l_ContextServices_0.Plugin
})(v9));