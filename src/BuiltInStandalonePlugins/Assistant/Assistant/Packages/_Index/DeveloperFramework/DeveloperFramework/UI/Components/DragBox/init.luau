local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util);
local v5 = require(l_Parent_0.Util.Typecheck);
local l_prioritize_0 = v4.prioritize;
local v7 = require(l_Parent_0.Util.StyleModifier);
local v8 = require(l_Parent_0.SharedFlags.getFFlagACEFaceAnimationEditorUIFixes);
local l_UI_0 = l_Parent_0.UI;
local v10 = require(l_UI_0.Components.Container);
local v11 = require(l_UI_0.Components.Pane);
local v12 = require(l_UI_0.Components.HoverArea);
local v13 = require(l_UI_0.Components.Tooltip);
local v14 = v1.PureComponent:extend("DragBox");
v5.wrap(v14, script);
v14.defaultProps = {
    Disabled = false, 
    MinX = -1, 
    MinY = -1, 
    MaxX = 1, 
    MaxY = 1, 
    HorizontalDragTolerance = 300, 
    VerticalDragTolerance = 300
};
local l_isInputMainPress_0 = v4.isInputMainPress;
v14.init = function(v16) --[[ Line: 63 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_isInputMainPress_0 (copy)
    v16.dragBoxFrameRef = v1.createRef();
    v16.state = {
        pressed = false
    };
    v16.getTotalRange = function() --[[ Line: 70 ]]
        -- upvalues: v16 (copy)
        return (Vector2.new(v16.props.MaxX - v16.props.MinX, v16.props.MaxY - v16.props.MinY));
    end;
    v16.getClampedValue = function(v17) --[[ Line: 75 ]]
        -- upvalues: v16 (copy)
        local l_MinX_0 = v16.props.MinX;
        local l_MaxX_0 = v16.props.MaxX;
        local l_MinY_0 = v16.props.MinY;
        local l_MaxY_0 = v16.props.MaxY;
        return Vector2.new(math.clamp(v17.X, l_MinX_0, l_MaxX_0), (math.clamp(v17.Y, l_MinY_0, l_MaxY_0)));
    end;
    v16.getMouseClickValue = function(v22) --[[ Line: 83 ]]
        -- upvalues: v16 (copy)
        local v23 = v16.dragBoxFrameRef:getValue();
        local v24 = 0;
        local v25 = 0;
        local v26 = Vector2.new(0, 0);
        local v27 = math.clamp((v22.Position.X - v23.AbsolutePosition.X) / v23.AbsoluteSize.X, 0, 1);
        v24 = v16.props.MinX + v27 * v16.getTotalRange().X;
        local v28 = math.clamp((v22.Position.Y - v23.AbsolutePosition.Y) / v23.AbsoluteSize.Y, 0, 1);
        v25 = v16.props.MinY + v28 * v16.getTotalRange().Y;
        v26 = Vector2.new(v24, v25);
        return v16.getClampedValue(v26);
    end;
    v16.setValuesFromInput = function(v29) --[[ Line: 105 ]]
        -- upvalues: v16 (copy)
        local v30 = v16.getMouseClickValue(v29);
        v16.props.OnValueChanged(v30);
    end;
    v16.onInputBegan = function(_, v32) --[[ Line: 110 ]]
        -- upvalues: l_isInputMainPress_0 (ref), v16 (copy)
        local v33 = l_isInputMainPress_0(v32);
        if v16.props.Disabled then
            return;
        else
            if v33 then
                v16:setState({
                    pressed = true
                });
                if v16.props.OnChangeBegan then
                    v16.props.OnChangeBegan();
                end;
                v16.setValuesFromInput(v32);
            end;
            return;
        end;
    end;
    v16.onInputChanged = function(_, v35) --[[ Line: 125 ]]
        -- upvalues: v16 (copy)
        if v16.props.Disabled then
            return;
        else
            if v16.state.pressed and v35.UserInputType == Enum.UserInputType.MouseMovement then
                v16.setValuesFromInput(v35);
            end;
            return;
        end;
    end;
    v16.onInputEnded = function(_, v37) --[[ Line: 133 ]]
        -- upvalues: l_isInputMainPress_0 (ref), v16 (copy)
        local v38 = l_isInputMainPress_0(v37);
        if not v16.props.Disabled and v38 then
            v16:setState({
                pressed = false
            });
        end;
    end;
end;
v14.render = function(v39) --[[ Line: 143 ]] --[[ Name: render ]]
    -- upvalues: l_prioritize_0 (copy), v7 (copy), v1 (copy), v11 (copy), v10 (copy), v13 (copy), v8 (copy), v12 (copy)
    local l_props_0 = v39.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v42 = l_props_0.Tooltip or nil;
    local v43 = false;
    if v42 ~= nil then
        v43 = v42 ~= "";
    end;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_Disabled_0 = l_props_0.Disabled;
    local l_MinX_1 = l_props_0.MinX;
    local l_MinY_1 = l_props_0.MinY;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Position_0 = l_props_0.Position;
    local l_Value_0 = l_props_0.Value;
    local v51 = l_prioritize_0(l_props_0.Size, l_Stylizer_0.Size, UDim2.new(1, 0, 1, 0));
    local l_HorizontalDragTolerance_0 = l_props_0.HorizontalDragTolerance;
    local l_VerticalDragTolerance_0 = l_props_0.VerticalDragTolerance;
    local l_BackgroundStyle_0 = l_Stylizer_0.BackgroundStyle;
    local l_OutlineStyle_0 = l_Stylizer_0.OutlineStyle;
    local v56 = l_Stylizer_0.KnobSize or Vector2.new();
    local l_KnobBackground_0 = l_Stylizer_0.KnobBackground;
    local v58 = l_Stylizer_0.KnobBackgroundStyle or {};
    local v59 = l_Stylizer_0.KnobBackgroundStyle or {};
    local v60 = (l_Value_0.X - l_MinX_1) / v39.getTotalRange().X;
    local v61 = (l_Value_0.Y - l_MinY_1) / v39.getTotalRange().Y;
    local v62 = nil;
    if l_Disabled_0 then
        v62 = v7.Disabled;
    end;
    local l_OnRightClick_0 = l_props_0.OnRightClick;
    local l_ForegroundStyle_0 = l_Stylizer_0.ForegroundStyle;
    local v65 = false;
    if l_ForegroundStyle_0 ~= nil then
        v65 = true;
        if v60 == 0.5 then
            v65 = v61 ~= 0.5;
        end;
    end;
    return v1.createElement("Frame", {
        AnchorPoint = l_AnchorPoint_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Position = l_Position_0, 
        Size = UDim2.new(UDim.new(v51.X.Scale, v51.X.Offset - v56.X), v51.Y), 
        [v1.Ref] = v39.dragBoxFrameRef
    }, {
        Border = v1.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = l_OutlineStyle_0.Color
        }), 
        Background = v1.createElement(v11, {
            Style = l_BackgroundStyle_0, 
            StyleModifier = v62, 
            Size = UDim2.new(1, 0, 1, 0)
        }), 
        Knob = v1.createElement(v10, {
            Background = l_KnobBackground_0, 
            BackgroundStyle = v58, 
            BackgroundStyleModifier = v62, 
            Position = UDim2.new(v60, 0, v61, 0), 
            Size = UDim2.new(0, v56.X, 0, v56.Y), 
            ZIndex = 3, 
            ImageColor3 = if v65 then l_ForegroundStyle_0.Color else v59.Color
        }), 
        Tooltip = v43 and v1.createElement(v13, {
            MaxWidth = 1000, 
            Text = v42, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            ZIndex = v8 and 5 or nil
        }), 
        ClickHandler = not l_Disabled_0 and v1.createElement("ImageButton", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = UDim2.new(1, v39.state.pressed and l_HorizontalDragTolerance_0 or v56.X, 1, v39.state.pressed and l_VerticalDragTolerance_0 or 0), 
            ZIndex = 4, 
            [v1.Event.InputBegan] = v39.onInputBegan, 
            [v1.Event.InputChanged] = v39.onInputChanged, 
            [v1.Event.InputEnded] = v39.onInputEnded, 
            [v1.Event.MouseButton2Click] = l_OnRightClick_0
        }), 
        HoverArea = not l_Disabled_0 and v1.createElement(v12, {
            Cursor = "PointingHand"
        })
    });
end;
return (l_withContext_0({
    Mouse = v2.Mouse, 
    Stylizer = v2.Stylizer
})(v14));