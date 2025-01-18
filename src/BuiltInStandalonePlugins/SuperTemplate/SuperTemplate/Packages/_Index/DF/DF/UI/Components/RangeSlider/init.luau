local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Parent.Dash);
local l_join_0 = v4.join;
local v6 = require(l_Parent_0.Util.enumerate);
local v7 = require(l_Parent_0.Util);
local v8 = require(l_Parent_0.Util.Typecheck);
local l_prioritize_0 = v7.prioritize;
local v10 = require(l_Parent_0.Util.StyleModifier);
local l_UI_0 = l_Parent_0.UI;
local v12 = require(l_UI_0.Components.HoverArea);
local v13 = require(l_UI_0.Components.Pane);
local v14 = require(l_UI_0.Components.Tooltip);
local v15 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkPaneSizeFromStyle);
local v16 = game:DefineFastFlag("DevFrameworkFixSliderOnChangeUpdate", false);
local v17 = require(l_Parent_0.SharedFlags.getFFlagACEFaceAnimationEditorUIFixes);
local v18 = v1.PureComponent:extend("RangeSlider");
v8.wrap(v18, script);
v18.defaultProps = {
    Disabled = false, 
    Layout = Enum.FillDirection.Horizontal, 
    SnapIncrement = 0, 
    HorizontalDragTolerance = 300, 
    VerticalDragTolerance = 300
};
v18.KnobType = v6("KnobType", {
    "Lower", 
    "Upper"
});
local l_isInputMainPress_0 = v7.isInputMainPress;
v18.init = function(v20) --[[ Line: 80 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v16 (copy), l_isInputMainPress_0 (copy)
    v20.currentlySelectedKnob = nil;
    v20.sliderFrameRef = v1.createRef();
    v20.state = {
        pressed = false, 
        rotation = nil, 
        width = nil, 
        centerPoint = nil, 
        unit = nil
    };
    v20.isSwitchingKnob = function(v21) --[[ Line: 94 ]]
        -- upvalues: v20 (copy)
        local v22 = false;
        if v20.currentlySelectedKnob ~= nil then
            v22 = v20.currentlySelectedKnob ~= v21;
        end;
        return v22;
    end;
    v20.getTotalRange = function() --[[ Line: 98 ]]
        -- upvalues: v20 (copy)
        local v23 = v20.props.Max - v20.props.Min;
        assert(v23 >= 0, "Range must be >= 0");
        return v23;
    end;
    v20.getSnappedValue = function(v24) --[[ Line: 104 ]]
        -- upvalues: v20 (copy)
        local l_SnapIncrement_0 = v20.props.SnapIncrement;
        local l_Min_0 = v20.props.Min;
        local l_Max_0 = v20.props.Max;
        if l_SnapIncrement_0 > 0 then
            local v28 = math.max(l_SnapIncrement_0 * math.floor(v24 / l_SnapIncrement_0), l_Min_0);
            local v29 = math.min(v28 + l_SnapIncrement_0, l_Max_0);
            return math.abs(v28 - v24) < math.abs(v29 - v24) and v28 or v29;
        else
            return (math.clamp(v24, l_Min_0, l_Max_0));
        end;
    end;
    v20.GetPercentage = function(v30, v31) --[[ Line: 119 ]]
        -- upvalues: v20 (copy)
        if v20.props.Layout == Enum.FillDirection.Horizontal then
            if not v20.state.width or v20.state.width ~= v30.AbsoluteSize.X or not v20.state.rotation or v20.state.rotation ~= v30.AbsoluteRotation then
                local l_AbsoluteRotation_0 = v30.AbsoluteRotation;
                local v33 = math.rad(l_AbsoluteRotation_0);
                local v34 = v30.AbsolutePosition + 0.5 * v30.AbsoluteSize;
                local l_X_0 = v30.AbsoluteSize.X;
                v20:setState({
                    rotation = l_AbsoluteRotation_0, 
                    width = l_X_0, 
                    centerPoint = v34, 
                    unit = Vector2.new(math.cos(v33), (math.sin(v33)))
                });
            end;
            return (v31 - v20.state.centerPoint):Dot(v20.state.unit) / v20.state.width + 0.5;
        else
            if not v20.state.height or v20.state.height ~= v30.AbsoluteSize.Y or not v20.state.rotation or v20.state.rotation ~= v30.AbsoluteRotation then
                local l_AbsoluteRotation_1 = v30.AbsoluteRotation;
                local v37 = math.rad(l_AbsoluteRotation_1);
                local v38 = v30.AbsolutePosition + 0.5 * v30.AbsoluteSize;
                local l_Y_0 = v30.AbsoluteSize.Y;
                v20:setState({
                    rotation = l_AbsoluteRotation_1, 
                    height = l_Y_0, 
                    centerPoint = v38, 
                    unit = Vector2.new(math.sin(v37), (math.cos(v37)))
                });
            end;
            return (v31 - v20.state.centerPoint):Dot(v20.state.unit) / v20.state.height + 0.5;
        end;
    end;
    v20.getMouseClickValue = function(v40) --[[ Line: 165 ]]
        -- upvalues: v20 (copy)
        local l_current_0 = v20.sliderFrameRef.current;
        local v42 = 0;
        if l_current_0.AbsoluteRotation ~= 0 then
            local v43 = Vector2.new(v40.Position.X, v40.Position.Y);
            v42 = math.clamp(v20.GetPercentage(l_current_0, v43), 0, 1) * v20.getTotalRange();
            if v20.props.Layout == Enum.FillDirection.Vertical then
                v42 = 1 - v42;
            end;
        elseif v20.props.Layout == Enum.FillDirection.Horizontal then
            local v44 = math.clamp((v40.Position.X - l_current_0.AbsolutePosition.X) / l_current_0.AbsoluteSize.X, 0, 1);
            v42 = v20.props.Min + v44 * v20.getTotalRange();
        else
            local v45 = 1 - math.clamp((v40.Position.Y - l_current_0.AbsolutePosition.Y) / l_current_0.AbsoluteSize.Y, 0, 1);
            v42 = v20.props.Min + v45 * v20.getTotalRange();
        end;
        return v20.getSnappedValue(v42);
    end;
    v20.setValuesFromInput = function(v46) --[[ Line: 204 ]]
        -- upvalues: v20 (copy), v16 (ref)
        local v47 = v20.getStaticRangeValueDuringInput(v46);
        if not v47 then
            return;
        else
            local v48 = v20.getMouseClickValue(v46);
            local v49 = math.min(v48, v47);
            v49 = v20.getSnappedValue(v49);
            local v50 = if v20.props.UpperRangeValue <= v20.props.Min then v20.props.Min else math.clamp(v49, v20.props.Min, v20.props.UpperRangeValue);
            local v51 = math.max(v48, v47);
            v51 = v20.getSnappedValue(v51);
            local v52 = if v20.props.Max <= v20.props.LowerRangeValue then v20.props.Max else math.clamp(v51, v20.props.LowerRangeValue, v20.props.Max);
            if v16 then
                if v50 ~= v20.props.LowerRangeValue or v52 ~= v20.props.UpperRangeValue then
                    v20.props.OnValuesChanged(v50, v52);
                    return;
                end;
            else
                v20.props.OnValuesChanged(v50, v52);
            end;
            return;
        end;
    end;
    v20.getStaticRangeValueDuringInput = function(v53) --[[ Line: 234 ]]
        -- upvalues: v20 (copy)
        if v20.props.HideLowerKnob and v20.props.HideUpperKnob then
            return nil;
        elseif v20.props.HideUpperKnob then
            return v20.props.UpperRangeValue;
        elseif v20.props.HideLowerKnob then
            return v20.props.LowerRangeValue;
        else
            local v54 = v20.getMouseClickValue(v53);
            if v54 < v20.props.LowerRangeValue then
                v20.currentlySelectedKnob = v20.KnobType.Lower;
                return v20.props.UpperRangeValue;
            elseif v20.props.UpperRangeValue < v54 then
                v20.currentlySelectedKnob = v20.KnobType.Upper;
                return v20.props.LowerRangeValue;
            elseif math.abs(v54 - v20.props.LowerRangeValue) < math.abs(v54 - v20.props.UpperRangeValue) then
                if v20.isSwitchingKnob(v20.KnobType.Lower) then
                    return v20.props.UpperRangeValue - v20.props.SnapIncrement;
                else
                    v20.currentlySelectedKnob = v20.KnobType.Lower;
                    return v20.props.UpperRangeValue;
                end;
            elseif v20.isSwitchingKnob(v20.KnobType.Upper) then
                return v20.props.LowerRangeValue + v20.props.SnapIncrement;
            else
                v20.currentlySelectedKnob = v20.KnobType.Upper;
                return v20.props.LowerRangeValue;
            end;
        end;
    end;
    v20.onInputBegan = function(_, v56) --[[ Line: 275 ]]
        -- upvalues: l_isInputMainPress_0 (ref), v20 (copy)
        local v57 = l_isInputMainPress_0(v56);
        if v20.props.Disabled then
            return;
        else
            if v57 then
                v20:setState({
                    pressed = true
                });
                if v20.props.OnChangeBegan then
                    v20.props.OnChangeBegan();
                end;
                v20.setValuesFromInput(v56);
            end;
            return;
        end;
    end;
    v20.onInputChanged = function(_, v59) --[[ Line: 290 ]]
        -- upvalues: v20 (copy)
        if v20.props.Disabled then
            return;
        else
            if v20.state.pressed and v59.UserInputType == Enum.UserInputType.MouseMovement then
                v20.setValuesFromInput(v59);
            end;
            return;
        end;
    end;
    v20.onInputEnded = function(_, v61) --[[ Line: 298 ]]
        -- upvalues: l_isInputMainPress_0 (ref), v20 (copy)
        local v62 = l_isInputMainPress_0(v61);
        if not v20.props.Disabled and v62 then
            if v20.props.OnInputEnded then
                v20.props.OnInputEnded();
            end;
            v20.currentlySelectedKnob = nil;
            v20:setState({
                pressed = false
            });
        end;
    end;
end;
getMidPoint = function(v63, v64) --[[ Line: 312 ]] --[[ Name: getMidPoint ]]
    return (v63 + v64) * 0.5;
end;
v18.render = function(v65) --[[ Line: 316 ]] --[[ Name: render ]]
    -- upvalues: l_prioritize_0 (copy), v10 (copy), v15 (copy), v1 (copy), v13 (copy), l_join_0 (copy), v4 (copy), v17 (copy), v14 (copy), v12 (copy)
    local l_props_0 = v65.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v68 = l_props_0.Tooltip or nil;
    local v69 = false;
    if v68 ~= nil then
        v69 = v68 ~= "";
    end;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_Disabled_0 = l_props_0.Disabled;
    local l_Max_1 = l_props_0.Max;
    local l_Min_1 = l_props_0.Min;
    local l_Layout_0 = l_props_0.Layout;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v76 = math.clamp(l_props_0.LowerRangeValue, l_Min_1, l_Max_1);
    local l_Position_0 = l_props_0.Position;
    local v78 = math.clamp(l_props_0.UpperRangeValue, l_Min_1, l_Max_1);
    local v79 = l_prioritize_0(l_props_0.Size, l_Stylizer_0.Size, UDim2.fromScale(1, 1));
    local l_HorizontalDragTolerance_0 = l_props_0.HorizontalDragTolerance;
    local l_VerticalDragTolerance_0 = l_props_0.VerticalDragTolerance;
    local l_HideBackground_0 = l_props_0.HideBackground;
    local l_HideLowerKnob_0 = l_props_0.HideLowerKnob;
    local l_HideUpperKnob_0 = l_props_0.HideUpperKnob;
    local l_FillFromCenter_0 = l_props_0.FillFromCenter;
    local l_BackgroundStyle_0 = l_Stylizer_0.BackgroundStyle;
    local l_ForegroundStyle_0 = l_Stylizer_0.ForegroundStyle;
    local v88 = l_Stylizer_0.KnobSize or Vector2.new();
    local v89 = (v76 - l_Min_1) / v65.getTotalRange();
    local v90 = (v78 - l_Min_1) / v65.getTotalRange();
    local v91 = v90 - v89;
    if l_FillFromCenter_0 then
        v91 = (v90 - (getMidPoint(v65.props.Min, v65.props.Max) - l_Min_1) / v65.getTotalRange()) * -1;
    end;
    local v92 = if l_FillFromCenter_0 then v90 else v89;
    local v93 = nil;
    if l_Disabled_0 then
        v93 = v10.Disabled;
    end;
    local l_OnRightClick_0 = l_props_0.OnRightClick;
    local v95 = if v15() then nil else UDim2.new(1, 0, 0, 6);
    local v96 = l_Layout_0 == Enum.FillDirection.Horizontal;
    return v1.createElement("Frame", {
        AnchorPoint = l_AnchorPoint_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Position = l_Position_0, 
        Size = if l_Layout_0 == Enum.FillDirection.Horizontal then UDim2.new(UDim.new(v79.X.Scale, v79.X.Offset - v88.X), v79.Y) else UDim2.new(v79.X, UDim.new(v79.Y.Scale, v79.Y.Offset - v88.Y)), 
        [v1.Ref] = v65.sliderFrameRef
    }, {
        Background = v1.createElement(v13, {
            Style = if not l_HideBackground_0 then l_BackgroundStyle_0 else l_join_0(l_BackgroundStyle_0, {
                Background = v4.None
            }), 
            StyleModifier = v93, 
            AnchorPoint = if v96 then Vector2.new(0, 0.5) else Vector2.new(0.5, 0), 
            Position = if v96 then UDim2.fromScale(0, 0.5) else UDim2.fromScale(0.5, 0), 
            Size = if v96 then v95 else UDim2.new(0, 6, 1, 0)
        }, {
            Foreground = v1.createElement(v13, {
                AnchorPoint = if v96 then nil else Vector2.new(0, 1), 
                Style = l_join_0(l_ForegroundStyle_0, {
                    Background = l_props_0.ImageColor3, 
                    Color = l_props_0.ImageColor3
                }), 
                StyleModifier = v93, 
                Size = if v96 then UDim2.new(v91, 0, 1, 0) else UDim2.new(1, 0, v91, 0), 
                Position = if v96 then UDim2.fromScale(v92, 0) else UDim2.fromScale(0, 1 - v92)
            })
        }), 
        LowerKnob = not l_HideLowerKnob_0 and v1.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundColor3 = if v93 == v10.Disabled then l_Stylizer_0.DisabledKnobColor else l_props_0.ImageColor3 or l_Stylizer_0.KnobColor, 
            Position = if v96 then UDim2.fromScale(v89, 0.5) else UDim2.fromScale(0.5, 1 - v89), 
            Size = if l_props_0.Precision then if v96 then UDim2.fromOffset(4, 16) else UDim2.fromOffset(16, 4) else UDim2.fromOffset(18, 18), 
            ZIndex = 3
        }, {
            UICorner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        }), 
        UpperKnob = not l_HideUpperKnob_0 and v1.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundColor3 = if v93 == v10.Disabled then l_Stylizer_0.DisabledKnobColor else l_props_0.ImageColor3 or l_Stylizer_0.KnobColor, 
            Position = if v96 then UDim2.fromScale(v90, 0.5) else UDim2.fromScale(0.5, 1 - v90), 
            Size = if l_props_0.Precision then if v96 then UDim2.fromOffset(4, 16) else UDim2.fromOffset(16, 4) else if v17 and l_Stylizer_0.UpperKnobBackgroundStyle and l_Stylizer_0.UpperKnobBackgroundStyle.Size then l_Stylizer_0.UpperKnobBackgroundStyle.Size else UDim2.fromOffset(18, 18), 
            ZIndex = 3
        }, {
            UICorner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        }), 
        ClickHandler = not l_Disabled_0 and v1.createElement("ImageButton", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            Size = if v96 then UDim2.new(1, v88.X, 1, if v65.state.pressed then l_VerticalDragTolerance_0 else 0) else UDim2.new(1, if v65.state.pressed then l_HorizontalDragTolerance_0 else 0, 1, v88.Y), 
            ZIndex = 4, 
            [v1.Event.InputBegan] = v65.onInputBegan, 
            [v1.Event.InputChanged] = v65.onInputChanged, 
            [v1.Event.InputEnded] = v65.onInputEnded, 
            [v1.Event.MouseButton2Click] = l_OnRightClick_0
        }), 
        Tooltip = v69 and v1.createElement(v14, {
            MaxWidth = 1000, 
            Text = v68, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            ZIndex = v17 and 5 or nil
        }), 
        HoverArea = not l_Disabled_0 and v1.createElement(v12, {
            Cursor = "PointingHand"
        })
    });
end;
return (l_withContext_0({
    Mouse = v2.Mouse, 
    Stylizer = v2.Stylizer
})(v18));