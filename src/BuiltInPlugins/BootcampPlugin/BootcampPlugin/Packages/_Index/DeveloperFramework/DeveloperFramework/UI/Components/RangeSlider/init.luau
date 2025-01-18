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
local v18 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkPaneSizeFromStyleAgain);
local v19 = v1.PureComponent:extend("RangeSlider");
v8.wrap(v19, script);
local v20 = if v18() then nil else 6;
v19.defaultProps = {
    Disabled = false, 
    Layout = Enum.FillDirection.Horizontal, 
    SnapIncrement = 0, 
    HorizontalDragTolerance = 300, 
    VerticalDragTolerance = 300
};
v19.KnobType = v6("KnobType", {
    "Lower", 
    "Upper"
});
local l_isInputMainPress_0 = v7.isInputMainPress;
v19.init = function(v22) --[[ Line: 82 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v16 (copy), l_isInputMainPress_0 (copy)
    v22.currentlySelectedKnob = nil;
    v22.sliderFrameRef = v1.createRef();
    v22.state = {
        pressed = false, 
        rotation = nil, 
        width = nil, 
        centerPoint = nil, 
        unit = nil
    };
    v22.isSwitchingKnob = function(v23) --[[ Line: 96 ]]
        -- upvalues: v22 (copy)
        local v24 = false;
        if v22.currentlySelectedKnob ~= nil then
            v24 = v22.currentlySelectedKnob ~= v23;
        end;
        return v24;
    end;
    v22.getTotalRange = function() --[[ Line: 100 ]]
        -- upvalues: v22 (copy)
        local v25 = v22.props.Max - v22.props.Min;
        assert(v25 >= 0, "Range must be >= 0");
        return v25;
    end;
    v22.getSnappedValue = function(v26) --[[ Line: 106 ]]
        -- upvalues: v22 (copy)
        local l_SnapIncrement_0 = v22.props.SnapIncrement;
        local l_Min_0 = v22.props.Min;
        local l_Max_0 = v22.props.Max;
        if l_SnapIncrement_0 > 0 then
            local v30 = math.max(l_SnapIncrement_0 * math.floor(v26 / l_SnapIncrement_0), l_Min_0);
            local v31 = math.min(v30 + l_SnapIncrement_0, l_Max_0);
            return math.abs(v30 - v26) < math.abs(v31 - v26) and v30 or v31;
        else
            return (math.clamp(v26, l_Min_0, l_Max_0));
        end;
    end;
    v22.GetPercentage = function(v32, v33) --[[ Line: 121 ]]
        -- upvalues: v22 (copy)
        if v22.props.Layout == Enum.FillDirection.Horizontal then
            if not v22.state.width or v22.state.width ~= v32.AbsoluteSize.X or not v22.state.rotation or v22.state.rotation ~= v32.AbsoluteRotation then
                local l_AbsoluteRotation_0 = v32.AbsoluteRotation;
                local v35 = math.rad(l_AbsoluteRotation_0);
                local v36 = v32.AbsolutePosition + 0.5 * v32.AbsoluteSize;
                local l_X_0 = v32.AbsoluteSize.X;
                v22:setState({
                    rotation = l_AbsoluteRotation_0, 
                    width = l_X_0, 
                    centerPoint = v36, 
                    unit = Vector2.new(math.cos(v35), (math.sin(v35)))
                });
            end;
            return (v33 - v22.state.centerPoint):Dot(v22.state.unit) / v22.state.width + 0.5;
        else
            if not v22.state.height or v22.state.height ~= v32.AbsoluteSize.Y or not v22.state.rotation or v22.state.rotation ~= v32.AbsoluteRotation then
                local l_AbsoluteRotation_1 = v32.AbsoluteRotation;
                local v39 = math.rad(l_AbsoluteRotation_1);
                local v40 = v32.AbsolutePosition + 0.5 * v32.AbsoluteSize;
                local l_Y_0 = v32.AbsoluteSize.Y;
                v22:setState({
                    rotation = l_AbsoluteRotation_1, 
                    height = l_Y_0, 
                    centerPoint = v40, 
                    unit = Vector2.new(math.sin(v39), (math.cos(v39)))
                });
            end;
            return (v33 - v22.state.centerPoint):Dot(v22.state.unit) / v22.state.height + 0.5;
        end;
    end;
    v22.getMouseClickValue = function(v42) --[[ Line: 167 ]]
        -- upvalues: v22 (copy)
        local l_current_0 = v22.sliderFrameRef.current;
        local v44 = 0;
        if l_current_0.AbsoluteRotation ~= 0 then
            local v45 = Vector2.new(v42.Position.X, v42.Position.Y);
            v44 = math.clamp(v22.GetPercentage(l_current_0, v45), 0, 1) * v22.getTotalRange();
            if v22.props.Layout == Enum.FillDirection.Vertical then
                v44 = 1 - v44;
            end;
        elseif v22.props.Layout == Enum.FillDirection.Horizontal then
            local v46 = math.clamp((v42.Position.X - l_current_0.AbsolutePosition.X) / l_current_0.AbsoluteSize.X, 0, 1);
            v44 = v22.props.Min + v46 * v22.getTotalRange();
        else
            local v47 = 1 - math.clamp((v42.Position.Y - l_current_0.AbsolutePosition.Y) / l_current_0.AbsoluteSize.Y, 0, 1);
            v44 = v22.props.Min + v47 * v22.getTotalRange();
        end;
        return v22.getSnappedValue(v44);
    end;
    v22.setValuesFromInput = function(v48) --[[ Line: 206 ]]
        -- upvalues: v22 (copy), v16 (ref)
        local v49 = v22.getStaticRangeValueDuringInput(v48);
        if not v49 then
            return;
        else
            local v50 = v22.getMouseClickValue(v48);
            local v51 = math.min(v50, v49);
            v51 = v22.getSnappedValue(v51);
            local v52 = if v22.props.UpperRangeValue <= v22.props.Min then v22.props.Min else math.clamp(v51, v22.props.Min, v22.props.UpperRangeValue);
            local v53 = math.max(v50, v49);
            v53 = v22.getSnappedValue(v53);
            local v54 = if v22.props.Max <= v22.props.LowerRangeValue then v22.props.Max else math.clamp(v53, v22.props.LowerRangeValue, v22.props.Max);
            if v16 then
                if v52 ~= v22.props.LowerRangeValue or v54 ~= v22.props.UpperRangeValue then
                    v22.props.OnValuesChanged(v52, v54);
                    return;
                end;
            else
                v22.props.OnValuesChanged(v52, v54);
            end;
            return;
        end;
    end;
    v22.getStaticRangeValueDuringInput = function(v55) --[[ Line: 236 ]]
        -- upvalues: v22 (copy)
        if v22.props.HideLowerKnob and v22.props.HideUpperKnob then
            return nil;
        elseif v22.props.HideUpperKnob then
            return v22.props.UpperRangeValue;
        elseif v22.props.HideLowerKnob then
            return v22.props.LowerRangeValue;
        else
            local v56 = v22.getMouseClickValue(v55);
            if v56 < v22.props.LowerRangeValue then
                v22.currentlySelectedKnob = v22.KnobType.Lower;
                return v22.props.UpperRangeValue;
            elseif v22.props.UpperRangeValue < v56 then
                v22.currentlySelectedKnob = v22.KnobType.Upper;
                return v22.props.LowerRangeValue;
            elseif math.abs(v56 - v22.props.LowerRangeValue) < math.abs(v56 - v22.props.UpperRangeValue) then
                if v22.isSwitchingKnob(v22.KnobType.Lower) then
                    return v22.props.UpperRangeValue - v22.props.SnapIncrement;
                else
                    v22.currentlySelectedKnob = v22.KnobType.Lower;
                    return v22.props.UpperRangeValue;
                end;
            elseif v22.isSwitchingKnob(v22.KnobType.Upper) then
                return v22.props.LowerRangeValue + v22.props.SnapIncrement;
            else
                v22.currentlySelectedKnob = v22.KnobType.Upper;
                return v22.props.LowerRangeValue;
            end;
        end;
    end;
    v22.onInputBegan = function(_, v58) --[[ Line: 277 ]]
        -- upvalues: l_isInputMainPress_0 (ref), v22 (copy)
        local v59 = l_isInputMainPress_0(v58);
        if v22.props.Disabled then
            return;
        else
            if v59 then
                v22:setState({
                    pressed = true
                });
                if v22.props.OnChangeBegan then
                    v22.props.OnChangeBegan();
                end;
                v22.setValuesFromInput(v58);
            end;
            return;
        end;
    end;
    v22.onInputChanged = function(_, v61) --[[ Line: 292 ]]
        -- upvalues: v22 (copy)
        if v22.props.Disabled then
            return;
        else
            if v22.state.pressed and v61.UserInputType == Enum.UserInputType.MouseMovement then
                v22.setValuesFromInput(v61);
            end;
            return;
        end;
    end;
    v22.onInputEnded = function(_, v63) --[[ Line: 300 ]]
        -- upvalues: l_isInputMainPress_0 (ref), v22 (copy)
        local v64 = l_isInputMainPress_0(v63);
        if not v22.props.Disabled and v64 then
            if v22.props.OnInputEnded then
                v22.props.OnInputEnded();
            end;
            v22.currentlySelectedKnob = nil;
            v22:setState({
                pressed = false
            });
        end;
    end;
end;
getMidPoint = function(v65, v66) --[[ Line: 314 ]] --[[ Name: getMidPoint ]]
    return (v65 + v66) * 0.5;
end;
v19.render = function(v67) --[[ Line: 318 ]] --[[ Name: render ]]
    -- upvalues: l_prioritize_0 (copy), v10 (copy), v18 (copy), v15 (copy), v20 (copy), l_join_0 (copy), v4 (copy), v1 (copy), v13 (copy), v17 (copy), v14 (copy), v12 (copy)
    local l_props_0 = v67.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v70 = l_props_0.Tooltip or nil;
    local v71 = false;
    if v70 ~= nil then
        v71 = v70 ~= "";
    end;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_Disabled_0 = l_props_0.Disabled;
    local l_Max_1 = l_props_0.Max;
    local l_Min_1 = l_props_0.Min;
    local l_Layout_0 = l_props_0.Layout;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v78 = math.clamp(l_props_0.LowerRangeValue, l_Min_1, l_Max_1);
    local l_Position_0 = l_props_0.Position;
    local v80 = math.clamp(l_props_0.UpperRangeValue, l_Min_1, l_Max_1);
    local v81 = l_prioritize_0(l_props_0.Size, l_Stylizer_0.Size, UDim2.fromScale(1, 1));
    local l_HorizontalDragTolerance_0 = l_props_0.HorizontalDragTolerance;
    local l_VerticalDragTolerance_0 = l_props_0.VerticalDragTolerance;
    local l_HideBackground_0 = l_props_0.HideBackground;
    local l_HideLowerKnob_0 = l_props_0.HideLowerKnob;
    local l_HideUpperKnob_0 = l_props_0.HideUpperKnob;
    local l_FillFromCenter_0 = l_props_0.FillFromCenter;
    local l_BackgroundStyle_0 = l_Stylizer_0.BackgroundStyle;
    local l_ForegroundStyle_0 = l_Stylizer_0.ForegroundStyle;
    local v90 = l_Stylizer_0.KnobSize or Vector2.new();
    local v91 = (v78 - l_Min_1) / v67.getTotalRange();
    local v92 = (v80 - l_Min_1) / v67.getTotalRange();
    local v93 = v92 - v91;
    if l_FillFromCenter_0 then
        v93 = (v92 - (getMidPoint(v67.props.Min, v67.props.Max) - l_Min_1) / v67.getTotalRange()) * -1;
    end;
    local v94 = if l_FillFromCenter_0 then v92 else v91;
    local v95 = nil;
    if l_Disabled_0 then
        v95 = v10.Disabled;
    end;
    local l_OnRightClick_0 = l_props_0.OnRightClick;
    local v97 = if not not v18() or v15() then nil else UDim2.new(1, 0, 0, v20);
    local v98 = l_Layout_0 == Enum.FillDirection.Horizontal;
    if v18() and l_BackgroundStyle_0 then
        l_BackgroundStyle_0 = l_join_0(l_BackgroundStyle_0, {
            Background = if l_HideBackground_0 then v4.None else nil, 
            Size = if not v98 and l_BackgroundStyle_0.Size then UDim2.new(l_BackgroundStyle_0.Size.Y, l_BackgroundStyle_0.Size.X) else nil
        });
    end;
    return v1.createElement("Frame", {
        AnchorPoint = l_AnchorPoint_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Position = l_Position_0, 
        Size = if l_Layout_0 == Enum.FillDirection.Horizontal then UDim2.new(UDim.new(v81.X.Scale, v81.X.Offset - v90.X), v81.Y) else UDim2.new(v81.X, UDim.new(v81.Y.Scale, v81.Y.Offset - v90.Y)), 
        [v1.Ref] = v67.sliderFrameRef
    }, {
        Background = v1.createElement(v13, {
            Style = if not v18() and l_HideBackground_0 then l_join_0(l_BackgroundStyle_0, {
                Background = v4.None
            }) else l_BackgroundStyle_0, 
            StyleModifier = v95, 
            AnchorPoint = if v98 then Vector2.new(0, 0.5) else Vector2.new(0.5, 0), 
            Position = if v98 then UDim2.fromScale(0, 0.5) else UDim2.fromScale(0.5, 0), 
            Size = if v18() then nil else if v98 then v97 else UDim2.new(0, v20, 1, 0)
        }, {
            Foreground = v1.createElement(v13, {
                AnchorPoint = if v98 then nil else Vector2.new(0, 1), 
                Style = l_join_0(l_ForegroundStyle_0, {
                    Background = l_props_0.ImageColor3, 
                    Color = l_props_0.ImageColor3
                }), 
                StyleModifier = v95, 
                Size = if v98 then UDim2.new(v93, 0, 1, 0) else UDim2.new(1, 0, v93, 0), 
                Position = if v98 then UDim2.fromScale(v94, 0) else UDim2.fromScale(0, 1 - v94)
            })
        }), 
        LowerKnob = not l_HideLowerKnob_0 and v1.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundColor3 = if v95 == v10.Disabled then l_Stylizer_0.DisabledKnobColor else l_props_0.ImageColor3 or l_Stylizer_0.KnobColor, 
            Position = if v98 then UDim2.fromScale(v91, 0.5) else UDim2.fromScale(0.5, 1 - v91), 
            Size = if l_props_0.Precision then if v98 then UDim2.fromOffset(4, 16) else UDim2.fromOffset(16, 4) else UDim2.fromOffset(18, 18), 
            ZIndex = 3
        }, {
            UICorner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            })
        }), 
        UpperKnob = not l_HideUpperKnob_0 and v1.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundColor3 = if v95 == v10.Disabled then l_Stylizer_0.DisabledKnobColor else l_props_0.ImageColor3 or l_Stylizer_0.KnobColor, 
            Position = if v98 then UDim2.fromScale(v92, 0.5) else UDim2.fromScale(0.5, 1 - v92), 
            Size = if l_props_0.Precision then if v98 then UDim2.fromOffset(4, 16) else UDim2.fromOffset(16, 4) else if v17 and l_Stylizer_0.UpperKnobBackgroundStyle and l_Stylizer_0.UpperKnobBackgroundStyle.Size then l_Stylizer_0.UpperKnobBackgroundStyle.Size else UDim2.fromOffset(18, 18), 
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
            Size = if v98 then UDim2.new(1, v90.X, 1, if v67.state.pressed then l_VerticalDragTolerance_0 else 0) else UDim2.new(1, if v67.state.pressed then l_HorizontalDragTolerance_0 else 0, 1, v90.Y), 
            ZIndex = 4, 
            [v1.Event.InputBegan] = v67.onInputBegan, 
            [v1.Event.InputChanged] = v67.onInputChanged, 
            [v1.Event.InputEnded] = v67.onInputEnded, 
            [v1.Event.MouseButton2Click] = l_OnRightClick_0
        }), 
        Tooltip = v71 and v1.createElement(v14, {
            MaxWidth = 1000, 
            Text = v70, 
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
})(v19));