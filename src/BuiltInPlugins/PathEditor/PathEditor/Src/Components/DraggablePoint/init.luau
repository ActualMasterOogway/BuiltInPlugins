local l_UserInputService_0 = game:GetService("UserInputService");
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v3 = require(l_Parent_0.Packages.React);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Packages.Framework);
local v6 = require(l_Parent_0.Packages.Dash);
local l_withContext_0 = v5.ContextServices.withContext;
local l_Stylizer_0 = v5.Style.Stylizer;
local v9 = require(l_Parent_0.Src.Thunks.MapScreenToSurfacePos);
local l_Util_0 = v5.Util;
local l_DoubleClickDetector_0 = l_Util_0.DoubleClickDetector;
local l_prioritize_0 = l_Util_0.prioritize;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local v14 = require(l_Parent_0.Src.Resources.Constants);
local l_Components_0 = l_Parent_0.Src.Components;
local v16 = require(l_Components_0.SignalListener);
local v17 = require(l_Components_0.ControlPointVisual);
local v18 = game:DefineFastFlag("PathEditorControlPointVisualImprovements2", false);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
local v20 = game:DefineFastFlag("PathEditorSurfaceGuiInput", false);
local v21 = v3.Component:extend("DraggablePoint");
v21.defaultProps = {
    Style = "ControlPoint", 
    ZIndex = 0, 
    AbsolutePosition = Vector2.new(0, 0), 
    FollowCursorOnDrag = true, 
    OnSelected = function() --[[ Line: 76 ]] --[[ Name: OnSelected ]]

    end, 
    OnMouse1Down = function() --[[ Line: 77 ]] --[[ Name: OnMouse1Down ]]

    end, 
    OnHover = function() --[[ Line: 78 ]] --[[ Name: OnHover ]]

    end, 
    OnHoverMoved = nil, 
    OnHoverEnd = function() --[[ Line: 80 ]] --[[ Name: OnHoverEnd ]]

    end, 
    OnDeselected = function() --[[ Line: 81 ]] --[[ Name: OnDeselected ]]

    end, 
    OnDragStart = function() --[[ Line: 82 ]] --[[ Name: OnDragStart ]]

    end, 
    OnDragMoved = function() --[[ Line: 83 ]] --[[ Name: OnDragMoved ]]

    end, 
    OnDragEnd = function() --[[ Line: 84 ]] --[[ Name: OnDragEnd ]]

    end, 
    OnDoubleClicked = function() --[[ Line: 85 ]] --[[ Name: OnDoubleClicked ]]

    end, 
    OnRightClicked = function() --[[ Line: 86 ]] --[[ Name: OnRightClicked ]]

    end
};
v21.init = function(v22) --[[ Line: 89 ]] --[[ Name: init ]]
    -- upvalues: l_DoubleClickDetector_0 (copy), v20 (copy), l_PathEditorRotation_0 (copy)
    v22.state = {
        isHovered = false, 
        isDragging = false, 
        isDragStarting = false, 
        mouseStart = Vector2.zero, 
        mousePos = Vector2.zero, 
        mouseOffset = Vector2.zero
    };
    v22.DoubleClickDetector = l_DoubleClickDetector_0.new();
    v22.onMouseEnter = function() --[[ Line: 101 ]]
        -- upvalues: v22 (copy)
        local l_props_0 = v22.props;
        local l_state_0 = v22.state;
        if l_state_0.isDragging or l_state_0.isDragStarting then
            return;
        else
            v22:setState({
                isHovered = true
            });
            l_props_0.OnHover();
            return;
        end;
    end;
    v22.onMouseLeave = function() --[[ Line: 113 ]]
        -- upvalues: v22 (copy)
        local l_props_1 = v22.props;
        local l_state_1 = v22.state;
        if l_state_1.isDragging or l_state_1.isDragStarting then
            return;
        else
            v22:setState({
                isHovered = false
            });
            l_props_1.OnHoverEnd();
            return;
        end;
    end;
    v22.onInputBegan = function(_, v28) --[[ Line: 125 ]]
        -- upvalues: v22 (copy)
        local l_props_2 = v22.props;
        local l_state_2 = v22.state;
        local v31 = if l_state_2.isDragging then l_state_2.mousePos + l_state_2.mouseOffset else l_props_2.AbsolutePosition;
        if v28.UserInputType == Enum.UserInputType.MouseButton1 then
            if l_state_2.isDragging or l_state_2.isDragStarting then
                return;
            else
                v28.UserInputState = Enum.UserInputState.Cancel;
                if v22.DoubleClickDetector:isDoubleClick() then
                    l_props_2.OnDoubleClicked();
                    return;
                else
                    local v32 = Vector2.new(v28.Position.X, v28.Position.Y);
                    v22:setState({
                        isDragStarting = true, 
                        mouseStart = v32, 
                        mouseOffset = v31 - v32, 
                        mousePos = v32
                    });
                    l_props_2.OnSelected(v32);
                    return;
                end;
            end;
        elseif v28.UserInputType == Enum.UserInputType.MouseButton2 then
            l_props_2.OnRightClicked();
            v28.UserInputState = Enum.UserInputState.Cancel;
            return;
        else
            v22:setState({
                mousePos = Vector2.new(v28.Position.X, v28.Position.Y)
            });
            return;
        end;
    end;
    v22.onInputEnded = function(_, v34) --[[ Line: 161 ]]
        -- upvalues: v22 (copy)
        local l_props_3 = v22.props;
        local l_state_3 = v22.state;
        local v37 = if l_state_3.isDragging then l_state_3.mousePos + l_state_3.mouseOffset else l_props_3.AbsolutePosition;
        if v34.UserInputType == Enum.UserInputType.MouseButton1 then
            if not l_state_3.isDragging and not l_state_3.isDragStarting then
                return;
            else
                local _ = Vector2.new(v34.Position.X, v34.Position.Y);
                v22:setState({
                    isDragging = false, 
                    isDragStarting = false, 
                    mouseStart = Vector2.zero, 
                    mouseOffset = Vector2.zero, 
                    mousePos = Vector2.zero
                });
                l_props_3.OnDragEnd(l_props_3.AbsolutePosition, v37);
            end;
        end;
    end;
    v22.onInputChanged = function(v39) --[[ Line: 185 ]]
        -- upvalues: v22 (copy), v20 (ref), l_PathEditorRotation_0 (ref)
        local l_props_4 = v22.props;
        local l_state_4 = v22.state;
        if v39.UserInputType == Enum.UserInputType.MouseMovement then
            local v42 = if v20 then l_props_4.dispatchMapScreenToSurfacePos(Vector2.new(v39.Position.X, v39.Position.Y)) else Vector2.new(v39.Position.X, v39.Position.Y);
            if v42 == nil then
                return;
            else
                v22:setState({
                    mousePos = v42
                });
                if l_props_4.OnHoverMoved then
                    if l_PathEditorRotation_0 then
                        l_props_4.OnHoverMoved(v42, l_state_4.isDragging or l_state_4.isDragStarting);
                        return;
                    else
                        l_props_4.OnHoverMoved(v42, false);
                    end;
                end;
            end;
        end;
    end;
end;
v21.didUpdate = function(v43) --[[ Line: 209 ]] --[[ Name: didUpdate ]]
    -- upvalues: v14 (copy)
    local l_props_5 = v43.props;
    local l_state_5 = v43.state;
    if l_state_5.isDragStarting and (l_state_5.mouseStart - l_state_5.mousePos).Magnitude > v14.DragEpsilon then
        l_props_5.OnDragStart(l_state_5.mousePos);
        v43:setState({
            isDragStarting = false, 
            isDragging = true
        });
    end;
end;
v21.render = function(v46) --[[ Line: 224 ]] --[[ Name: render ]]
    -- upvalues: l_StyleModifier_0 (copy), v6 (copy), l_prioritize_0 (copy), v3 (copy), v18 (copy), v17 (copy), v16 (copy), l_UserInputService_0 (copy)
    local l_props_6 = v46.props;
    local l_state_6 = v46.state;
    local l_Stylizer_1 = v46.props.Stylizer;
    local v50 = if l_state_6.isDragging then l_StyleModifier_0.Selected else if l_props_6.IsSelected then l_StyleModifier_0.Selected else if l_state_6.isHovered then l_StyleModifier_0.Hover else nil;
    if v50 ~= nil and l_Stylizer_1[v50] ~= nil then
        l_Stylizer_1 = v6.join(l_Stylizer_1, l_Stylizer_1[v50]);
    end;
    local v51 = l_prioritize_0(l_Stylizer_1.Disabled, l_props_6.Disabled);
    local l_BackgroundColor_0 = l_Stylizer_1.BackgroundColor;
    local l_AbsolutePosition_0 = l_props_6.AbsolutePosition;
    local l_BackgroundImage_0 = l_Stylizer_1.BackgroundImage;
    local v55 = l_prioritize_0(l_props_6.AbsoluteSize, l_Stylizer_1.PointSize);
    local v56 = l_prioritize_0(l_props_6.Size, UDim2.fromOffset(v55.X, v55.Y));
    local l_StrokeWidth_0 = l_Stylizer_1.StrokeWidth;
    local _ = l_StrokeWidth_0 ~= nil;
    if l_props_6.IsSelected and l_Stylizer_1.SelectedColor ~= nil then
        l_BackgroundColor_0 = l_Stylizer_1.SelectedColor;
    end;
    if l_state_6.isDragging then
        if l_Stylizer_1.DragColor ~= nil then
            l_BackgroundColor_0 = l_Stylizer_1.DragColor;
        end;
        local v59 = l_state_6.mousePos + l_state_6.mouseOffset;
        if l_props_6.FollowCursorOnDrag then
            l_AbsolutePosition_0 = v59;
        end;
        l_props_6.OnDragMoved(l_props_6.AbsolutePosition, v59);
    end;
    local v60 = {};
    if l_props_6.children ~= nil then
        v60 = l_props_6.children;
    end;
    if l_StrokeWidth_0 ~= nil then
        table.insert(v60, v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = v56
        }, {
            v3.createElement("UIStroke", {
                Thickness = l_Stylizer_1.StrokeWidth, 
                Color = l_Stylizer_1.StrokeColor
            })
        }));
    end;
    local l_Padding_0 = l_Stylizer_1.Padding;
    local l_v56_0 = v56;
    local v63 = UDim2.new(0, l_AbsolutePosition_0.X, 0, l_AbsolutePosition_0.Y);
    if l_Padding_0 ~= nil then
        l_v56_0 = v56 - UDim2.fromOffset(l_Padding_0, l_Padding_0);
    end;
    if v18 and l_Stylizer_1.HasControlPointVisual then
        l_BackgroundImage_0 = nil;
        table.insert(v60, v3.createElement(v17, {
            Style = l_props_6.Style, 
            StyleModifier = v50
        }));
    end;
    if l_BackgroundImage_0 ~= nil and not v51 then
        table.insert(v60, v3.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = l_v56_0, 
            Image = l_BackgroundImage_0, 
            BackgroundTransparency = l_Stylizer_1.BackgroundTransparency, 
            ImageTransparency = l_Stylizer_1.ImageTransparency, 
            ScaleType = Enum.ScaleType.Crop
        }));
    end;
    local _ = nil;
    if v51 then
        if not l_BackgroundImage_0 then
            return (v3.createElement("Frame", {
                AnchorPoint = l_Stylizer_1.AnchorPoint, 
                Position = v63, 
                Size = v56, 
                BackgroundColor3 = l_BackgroundColor_0, 
                Active = true, 
                ZIndex = l_props_6.ZIndex, 
                BackgroundTransparency = if v18 then l_Stylizer_1.BackgroundTransparency else nil
            }, v60));
        else
            return (v3.createElement("ImageLabel", {
                AnchorPoint = l_Stylizer_1.AnchorPoint, 
                Position = v63, 
                Size = l_v56_0 or v56, 
                BackgroundColor3 = l_BackgroundColor_0, 
                Image = l_BackgroundImage_0, 
                Active = true, 
                ZIndex = l_props_6.ZIndex, 
                BackgroundTransparency = l_Stylizer_1.BackgroundTransparency, 
                ImageTransparency = l_Stylizer_1.ImageTransparency, 
                ScaleType = Enum.ScaleType.Crop
            }, v60));
        end;
    else
        return (v3.createElement(v3.Fragment, {}, {
            Point = v3.createElement("ImageButton", {
                AnchorPoint = l_Stylizer_1.AnchorPoint, 
                Position = v63, 
                Size = v56, 
                BackgroundColor3 = l_BackgroundColor_0, 
                Active = true, 
                ZIndex = l_props_6.ZIndex, 
                BackgroundTransparency = l_Stylizer_1.BackgroundTransparency, 
                [v3.Event.MouseEnter] = v46.onMouseEnter, 
                [v3.Event.MouseLeave] = v46.onMouseLeave, 
                [v3.Event.InputBegan] = v46.onInputBegan, 
                [v3.Event.InputEnded] = v46.onInputEnded
            }, v60), 
            InputListener = (not not l_state_6.isDragging or l_state_6.isDragStarting or l_props_6.OnHoverMoved) and v3.createElement(v16, {
                signal = l_UserInputService_0.InputChanged, 
                callback = v46.onInputChanged
            })
        }));
    end;
end;
v21 = l_withContext_0({
    Stylizer = l_Stylizer_0
})(v21);
if v20 then
    return v4.connect(nil, function(v65) --[[ Line: 382 ]]
        -- upvalues: v9 (copy)
        return {
            dispatchMapScreenToSurfacePos = function(v66) --[[ Line: 384 ]] --[[ Name: dispatchMapScreenToSurfacePos ]]
                -- upvalues: v65 (copy), v9 (ref)
                return v65(v9(v66));
            end
        };
    end)(v21);
else
    return v21;
end;