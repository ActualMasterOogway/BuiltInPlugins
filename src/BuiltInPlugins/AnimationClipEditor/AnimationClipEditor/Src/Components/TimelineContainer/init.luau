local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Button_0 = v4.UI.Button;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_KeyboardListener_0 = v4.UI.KeyboardListener;
local v9 = require(l_script_FirstAncestor_0.Src.Util.Input);
local v10 = require(l_script_FirstAncestor_0.Src.Components.Timeline.Timeline);
local v11 = require(l_script_FirstAncestor_0.Src.Components.Tooltip);
local v12 = require(l_script_FirstAncestor_0.Src.Components.TeachingCallout);
local v13 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
local v14 = v1.PureComponent:extend("TimelineContainer");
local function _(v15) --[[ Line: 35 ]] --[[ Name: getExponent ]]
    local v16 = -1;
    while v15 > 1 do
        v16 = v16 + 1;
        v15 = v15 / 10;
    end;
    return v16;
end;
local function _(v18, v19, v20) --[[ Line: 44 ]] --[[ Name: calculateIntervals ]]
    -- upvalues: v3 (copy)
    local v21 = v20 - v19;
    local v22 = v3.TICK_SPACING * v21 / v18;
    local v23 = 10;
    local l_v22_0 = v22;
    local v25 = -1;
    while l_v22_0 > 1 do
        v25 = v25 + 1;
        l_v22_0 = l_v22_0 / 10;
    end;
    local v26 = math.pow(v23, v25);
    v23 = 3 * v26;
    if v22 < v23 then
        return v26, (math.max(v26 / v3.NUM_TICKS, 1));
    else
        return v23, (math.max(v23 / v3.NUM_TICKS, 1));
    end;
end;
v14.init = function(v28) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v2 (copy)
    v28.moveToTick = function(v29) --[[ Line: 58 ]]
        -- upvalues: v28 (copy), v3 (ref)
        local l_props_0 = v28.props;
        if l_props_0.SnapMode == v3.SNAP_MODES.Keyframes then
            l_props_0.SnapToNearestKeyframe(v29, l_props_0.ParentSize.X - l_props_0.TrackPadding);
            return;
        elseif l_props_0.SnapMode == v3.SNAP_MODES.Frames then
            l_props_0.SnapToNearestFrame(v29);
            return;
        else
            l_props_0.StepAnimation(v29);
            return;
        end;
    end;
    v28.onScrubberMoved = function(v31) --[[ Line: 70 ]]
        -- upvalues: v28 (copy), v2 (ref)
        if v28.props.StepAnimation then
            local v32 = math.clamp(v2.getKeyframeFromPosition(v31.Position, v28.props.StartTick, v28.props.EndTick, v28.props.ParentPosition.X + v28.props.TrackPadding / 2, v28.props.ParentSize.X - v28.props.TrackPadding), v28.props.StartTick, v28.props.EndTick);
            v28.moveToTick(v32);
        end;
    end;
    v28.onTimelineClicked = function(_, v34) --[[ Line: 85 ]]
        -- upvalues: v28 (copy)
        if v34.UserInputType == Enum.UserInputType.MouseButton1 then
            v28.onScrubberMoved(v34);
        end;
    end;
    v28.moveScrubberForward = function() --[[ Line: 91 ]]
        -- upvalues: v28 (copy)
        local v35 = math.clamp(v28.props.Playhead + 5, v28.props.StartTick, v28.props.EndTick);
        v28.moveToTick(v35);
    end;
    v28.moveScrubberBackward = function() --[[ Line: 97 ]]
        -- upvalues: v28 (copy)
        local v36 = math.clamp(v28.props.Playhead - 5, v28.props.StartTick, v28.props.EndTick);
        v28.moveToTick(v36);
    end;
end;
v14.render = function(v37) --[[ Line: 104 ]] --[[ Name: render ]]
    -- upvalues: v13 (copy), v3 (copy), v1 (copy), v10 (copy), l_Button_0 (copy), v11 (copy), v12 (copy), l_KeyboardListener_0 (copy), v9 (copy)
    local l_props_1 = v37.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_StartTick_0 = l_props_1.StartTick;
    local l_EndTick_0 = l_props_1.EndTick;
    local l_LastTick_0 = l_props_1.LastTick;
    local l_FrameRate_0 = l_props_1.FrameRate;
    local v44 = if v13() then nil else l_props_1.ShowAsSeconds;
    local l_TimelineUnit_0 = l_props_1.TimelineUnit;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_ParentSize_0 = l_props_1.ParentSize;
    local l_AnimationData_0 = l_props_1.AnimationData;
    local v49 = l_props_1.EditorMode == v3.EDITOR_MODE.CurveCanvas;
    l_StartTick_0 = l_StartTick_0 * l_FrameRate_0 / v3.TICK_FREQUENCY;
    l_EndTick_0 = l_EndTick_0 * l_FrameRate_0 / v3.TICK_FREQUENCY;
    l_LastTick_0 = l_LastTick_0 and l_LastTick_0 * l_FrameRate_0 / v3.TICK_FREQUENCY or nil;
    local v50 = l_ParentSize_0.X - v37.props.TrackPadding;
    local v51 = l_EndTick_0 - l_StartTick_0;
    local v52 = v3.TICK_SPACING * v51 / v50;
    local v53 = 10;
    local l_v52_0 = v52;
    local v55 = -1;
    while l_v52_0 > 1 do
        v55 = v55 + 1;
        l_v52_0 = l_v52_0 / 10;
    end;
    local v56 = math.pow(v53, v55);
    v53 = 3 * v56;
    local v57, v58;
    if v52 < v53 then
        v57 = v56;
        v58 = math.max(v56 / v3.NUM_TICKS, 1);
    else
        v57 = v53;
        v58 = math.max(v53 / v3.NUM_TICKS, 1);
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v3.TIMELINE_HEIGHT + 1), 
        LayoutOrder = l_LayoutOrder_0, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Stylizer_0.timelineTheme.backgroundColor, 
        BorderColor3 = l_Stylizer_0.borderColor, 
        ZIndex = l_props_1.ZIndex
    }, {
        Timeline = v1.createElement(v10, {
            StartTick = l_StartTick_0, 
            EndTick = l_EndTick_0, 
            LastTick = l_LastTick_0, 
            MajorInterval = v57, 
            MinorInterval = v58, 
            Position = UDim2.new(0, v37.props.TrackPadding / 2, 0, 0), 
            Height = v3.TIMELINE_HEIGHT, 
            Width = l_ParentSize_0.X - v37.props.TrackPadding, 
            TickHeightScale = 0.7, 
            SmallTickHeightScale = 0.3, 
            ShowAsTime = if v13() then nil else v44, 
            TimelineUnit = l_TimelineUnit_0, 
            OnInputBegan = v37.onTimelineClicked, 
            OnDragMoved = v37.onScrubberMoved, 
            AnimationData = l_AnimationData_0, 
            FrameRate = l_FrameRate_0, 
            ZIndex = 2
        }), 
        ToggleEditorButton = v1.createElement(l_Button_0, {
            ZIndex = 1, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromOffset(v3.TOGGLE_EDITOR_BUTTON_WIDTH, v3.TOGGLE_EDITOR_BUTTON_HEIGHT), 
            Position = UDim2.fromOffset(v37.props.TrackPadding / 4, v3.TIMELINE_HEIGHT / 2), 
            Style = l_Stylizer_0.button.MediaControl, 
            OnClick = l_props_1.OnToggleEditorClicked
        }, {
            Image = v1.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, v3.TOGGLE_EDITOR_BUTTON_WIDTH, 0, v3.TOGGLE_EDITOR_BUTTON_HEIGHT), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = if v49 then l_Stylizer_0.curveTheme.dopesheetButton else l_Stylizer_0.curveTheme.curveEditorButton, 
                ImageColor3 = l_Stylizer_0.playbackTheme.iconColor
            }), 
            Tooltip = v1.createElement(v11, {
                TextKey = v49 and "GoToDopesheetEditor" or "GoToCurveEditor"
            }), 
            TeachingCallout = v1.createElement(v12, {
                Offset = Vector2.new(0, 6), 
                DefinitionId = "CurveEditorCallout", 
                LocationId = "ToggleEditorButton"
            })
        }), 
        KeyboardListener = v1.createElement(l_KeyboardListener_0, {
            OnKeyPressed = function(v59) --[[ Line: 178 ]] --[[ Name: OnKeyPressed ]]
                -- upvalues: v9 (ref), v37 (copy)
                if v9.isLeftBracket(v59.KeyCode) then
                    v37.moveScrubberBackward();
                end;
                if v9.isRightBracket(v59.KeyCode) then
                    v37.moveScrubberForward();
                end;
            end
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v14));