local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_KeyboardListener_0 = v3.UI.KeyboardListener;
local l_Separator_0 = v3.UI.Separator;
local v8 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v9 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v10 = require(l_script_FirstAncestor_0.Src.Util.Input);
local v11 = require(l_script_FirstAncestor_0.Src.Components.DopeSheetController);
local v12 = require(l_script_FirstAncestor_0.Src.Components.Curves.CurveEditorController);
local v13 = require(l_script_FirstAncestor_0.Src.Components.TimelineContainer);
local v14 = require(l_script_FirstAncestor_0.Src.Components.ZoomBar);
local v15 = require(l_script_FirstAncestor_0.Src.Components.Timeline.Scrubber);
local v16 = require(l_script_FirstAncestor_0.Src.Components.Toast.NoticeToast);
local v17 = require(l_script_FirstAncestor_0.Src.Actions.SetEditorMode);
local v18 = require(l_script_FirstAncestor_0.Src.Actions.SetHorizontalScrollZoom);
local v19 = require(l_script_FirstAncestor_0.Src.Actions.SetNotification);
local v20 = require(l_script_FirstAncestor_0.Src.Actions.SetVerticalScrollZoom);
local v21 = require(l_script_FirstAncestor_0.Src.Thunks.SnapToNearestFrame);
local v22 = require(l_script_FirstAncestor_0.Src.Thunks.SnapToNearestKeyframe);
local v23 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
local v24 = require(l_script_FirstAncestor_0.Src.Thunks.SwitchEditorMode);
local v25 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
local v26 = v1.PureComponent:extend("TrackEditor");
v26.init = function(v27) --[[ Line: 51 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), v9 (copy)
    v27.ctrlHeld = false;
    v27.dragging = false;
    v27.updateSize = function(v28) --[[ Line: 55 ]]
        -- upvalues: v27 (copy)
        v27:setState({
            AbsoluteSize = v28.AbsoluteSize, 
            AbsolutePosition = v28.AbsolutePosition
        });
    end;
    v27.inputChanged = function(_, v30) --[[ Line: 62 ]]
        -- upvalues: v27 (copy), v8 (ref)
        local l_props_0 = v27.props;
        local l_HorizontalZoom_0 = l_props_0.HorizontalZoom;
        local l_HorizontalScroll_0 = l_props_0.HorizontalScroll;
        local l_X_0 = v27.state.AbsoluteSize.X;
        local l_X_1 = v27.state.AbsolutePosition.X;
        if v30.UserInputType == Enum.UserInputType.MouseWheel then
            local v36 = math.clamp(l_HorizontalScroll_0 + ((v30.Position.X - l_X_1) / l_X_0 - l_HorizontalScroll_0) * (1 - l_HorizontalZoom_0), 0, 1);
            if v27.ctrlHeld then
                if v30.Position.Z > 0 then
                    l_props_0.SetHorizontalScrollZoom(v36, (math.clamp(l_HorizontalZoom_0 + v8.ZOOM_INCREMENT, 0, 1)));
                    return;
                elseif v30.Position.Z < 0 then
                    l_props_0.SetHorizontalScrollZoom(v36, (math.clamp(l_HorizontalZoom_0 - v8.ZOOM_INCREMENT, 0, 1)));
                    return;
                end;
            else
                l_props_0.OnScroll(v30.Position.Z);
                return;
            end;
        elseif v30.UserInputType == Enum.UserInputType.MouseMovement and v27.dragging then
            local v37 = math.clamp(l_HorizontalScroll_0 + -v30.Delta.X / l_X_0 * (1 / math.max(0.01, l_HorizontalZoom_0)), 0, 1);
            l_props_0.SetHorizontalScrollZoom(v37, l_HorizontalZoom_0);
        end;
    end;
    v27.startDragging = function() --[[ Line: 91 ]]
        -- upvalues: v27 (copy)
        v27.dragging = true;
    end;
    v27.stopDragging = function() --[[ Line: 95 ]]
        -- upvalues: v27 (copy)
        v27.dragging = false;
    end;
    v27.getPlayheadPositionX = function() --[[ Line: 99 ]]
        -- upvalues: v27 (copy), v9 (ref)
        local l_props_1 = v27.props;
        local v39 = v27.state.AbsoluteSize or Vector2.new();
        local l_Playhead_0 = l_props_1.Playhead;
        return v27.getTrackPadding() * 0.5 + v9.getScaledKeyframePosition(l_Playhead_0, l_props_1.StartTick, l_props_1.EndTick, v39.X - v27.getTrackPadding());
    end;
    v27.stepAnimation = function(v41) --[[ Line: 112 ]]
        -- upvalues: v27 (copy), v8 (ref)
        local l_props_2 = v27.props;
        if l_props_2.PlayState == v8.PLAY_STATE.Pause then
            l_props_2.StepAnimation(v41);
        end;
    end;
    v27.inputBegan = function(_, v44) --[[ Line: 119 ]]
        -- upvalues: v27 (copy)
        if v27.props.Mouse and v44.UserInputType == Enum.UserInputType.MouseButton3 then
            v27.props.Mouse:__pushCursor("ClosedHand");
            v27.startDragging();
        end;
    end;
    v27.inputEnded = function(_, v46) --[[ Line: 126 ]]
        -- upvalues: v27 (copy)
        if v27.props.Mouse and v27.dragging and v46.UserInputType == Enum.UserInputType.MouseMovement or v46.UserInputType == Enum.UserInputType.MouseButton3 then
            v27.props.Mouse:__popCursor();
            v27.stopDragging();
        end;
    end;
    v27.getTrackPadding = function() --[[ Line: 136 ]]
        -- upvalues: v27 (copy), v8 (ref)
        local l_FrameRate_0 = v27.props.FrameRate;
        local v48 = math.max(v27.props.LastTick, v27.props.EndTick) * l_FrameRate_0 / v8.TICK_FREQUENCY;
        if v48 < 100 then
            return v8.TRACK_PADDING_SMALL;
        elseif v48 < 1000 then
            return v8.TRACK_PADDING_MEDIUM;
        else
            return v8.TRACK_PADDING_LARGE;
        end;
    end;
    v27.toggleEditorClicked = function() --[[ Line: 150 ]]
        -- upvalues: v27 (copy), v8 (ref)
        if v27.props.IsChannelAnimation then
            if v27.props.EditorMode == v8.EDITOR_MODE.CurveCanvas then
                v27.props.SwitchEditorMode(v8.EDITOR_MODE.DopeSheet, v27.props.Analytics);
                return;
            else
                v27.props.SwitchEditorMode(v8.EDITOR_MODE.CurveCanvas, v27.props.Analytics);
                return;
            end;
        else
            if not v27.props.ReadOnly then
                v27.props.OnPromoteRequested();
            end;
            return;
        end;
    end;
end;
v26.render = function(v49) --[[ Line: 163 ]] --[[ Name: render ]]
    -- upvalues: v25 (copy), v8 (copy), v1 (copy), v13 (copy), v11 (copy), v12 (copy), v16 (copy), l_Separator_0 (copy), v15 (copy), v14 (copy), l_KeyboardListener_0 (copy), v10 (copy)
    local l_props_3 = v49.props;
    local l_state_0 = v49.state;
    local l_StartTick_0 = l_props_3.StartTick;
    local l_EndTick_0 = l_props_3.EndTick;
    local l_LastTick_0 = l_props_3.LastTick;
    local l_SnapMode_0 = l_props_3.SnapMode;
    local l_FrameRate_1 = l_props_3.FrameRate;
    local v57 = if v25() then nil else l_props_3.ShowAsSeconds;
    local l_TimelineUnit_0 = l_props_3.TimelineUnit;
    local l_HorizontalScroll_1 = l_props_3.HorizontalScroll;
    local l_HorizontalZoom_1 = l_props_3.HorizontalZoom;
    local l_VerticalScroll_0 = l_props_3.VerticalScroll;
    local l_VerticalZoom_0 = l_props_3.VerticalZoom;
    local l_LayoutOrder_0 = l_props_3.LayoutOrder;
    local l_ZIndex_0 = l_props_3.ZIndex;
    local l_Size_0 = l_props_3.Size;
    local l_TopTrackIndex_0 = l_props_3.TopTrackIndex;
    local l_ShowEvents_0 = l_props_3.ShowEvents;
    local l_Playhead_1 = l_props_3.Playhead;
    local l_IsChannelAnimation_0 = l_props_3.IsChannelAnimation;
    local l_ColorsPosition_0 = l_props_3.ColorsPosition;
    local l_Localization_0 = l_props_3.Localization;
    local l_SnapToNearestKeyframe_0 = l_props_3.SnapToNearestKeyframe;
    local l_SnapToNearestFrame_0 = l_props_3.SnapToNearestFrame;
    local v74 = l_state_0.AbsoluteSize or Vector2.new();
    local v75 = l_state_0.AbsolutePosition or Vector2.new();
    local v76 = v49.getTrackPadding();
    local v77 = false;
    if l_StartTick_0 <= l_Playhead_1 then
        v77 = l_Playhead_1 <= l_EndTick_0;
    end;
    local v78 = l_props_3.EditorMode == v8.EDITOR_MODE.DopeSheet;
    local v79 = l_props_3.EditorMode == v8.EDITOR_MODE.CurveCanvas;
    local l_CannotPasteError_0 = l_props_3.CannotPasteError;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        ZIndex = l_ZIndex_0, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = l_Size_0, 
        [v1.Change.AbsoluteSize] = v49.updateSize, 
        [v1.Event.InputBegan] = v49.inputBegan, 
        [v1.Event.InputEnded] = v49.inputEnded, 
        [v1.Event.MouseLeave] = v49.stopDragging
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        TimelineContainer = v1.createElement(v13, {
            StartTick = l_StartTick_0, 
            EndTick = l_EndTick_0, 
            LastTick = l_LastTick_0, 
            SnapMode = l_SnapMode_0, 
            TrackPadding = v76, 
            FrameRate = l_FrameRate_1, 
            ShowAsSeconds = if v25() then nil else v57, 
            TimelineUnit = l_TimelineUnit_0, 
            LayoutOrder = 0, 
            ParentSize = v74, 
            ParentPosition = v75, 
            StepAnimation = v49.stepAnimation, 
            SnapToNearestKeyframe = l_SnapToNearestKeyframe_0, 
            SnapToNearestFrame = l_SnapToNearestFrame_0, 
            AnimationData = l_props_3.AnimationData, 
            Playhead = l_Playhead_1, 
            ZIndex = 2, 
            EditorMode = l_props_3.EditorMode, 
            OnToggleEditorClicked = v49.toggleEditorClicked
        }), 
        DopeSheetController = v78 and v1.createElement(v11, {
            ShowEvents = l_ShowEvents_0, 
            StartTick = l_StartTick_0, 
            EndTick = l_EndTick_0, 
            TrackPadding = v76, 
            TopTrackIndex = l_TopTrackIndex_0, 
            Size = UDim2.new(1, 0, 1, -v8.TIMELINE_HEIGHT - v8.SCROLL_BAR_SIZE), 
            ShowAsSeconds = if v25() then nil else v57, 
            TimelineUnit = l_TimelineUnit_0, 
            IsChannelAnimation = l_IsChannelAnimation_0, 
            ColorsPosition = l_ColorsPosition_0, 
            ZIndex = 1, 
            OnInputChanged = v49.inputChanged
        }) or nil, 
        CurveEditorController = v79 and v1.createElement(v12, {
            ShowEvents = l_ShowEvents_0, 
            StartTick = l_StartTick_0, 
            EndTick = l_EndTick_0, 
            TrackPadding = v76, 
            Size = UDim2.new(1, 0, 1, -v8.TIMELINE_HEIGHT - v8.SCROLL_BAR_SIZE), 
            ShowAsSeconds = if v25() then nil else v57, 
            TimelineUnit = l_TimelineUnit_0, 
            Playhead = l_Playhead_1, 
            ZIndex = 1, 
            OnInputChanged = v49.inputChanged
        }) or nil, 
        CannotPasteToast = l_CannotPasteError_0 and v1.createElement(v16, {
            Text = l_Localization_0:getText("Toast", "CannotPasteError"), 
            OnClose = l_props_3.CloseCannotPasteToast
        }) or nil, 
        IgnoreLayout = v1.createElement("Folder", {}, {
            TimelineBorder = v1.createElement(l_Separator_0, {
                Position = UDim2.new(0.5, 0, 0, v8.TIMELINE_HEIGHT), 
                DominantAxis = Enum.DominantAxis.Width, 
                Weight = 1, 
                Padding = 0, 
                ZIndex = 2
            }), 
            Scrubber = v77 and v1.createElement(v15, {
                Position = UDim2.new(0, v49.getPlayheadPositionX(), 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Height = v74.Y, 
                ShowHead = true, 
                HeadSize = UDim2.new(0, 5, 0, 5), 
                ZIndex = 3, 
                Thickness = 1
            }), 
            HorizontalZoomBar = v1.createElement(v14, {
                Size = UDim2.new(0, v74.X - v8.SCROLL_BAR_PADDING + 1, 0, v8.SCROLL_BAR_SIZE), 
                Position = UDim2.new(0, 0, 1, -v8.SCROLL_BAR_SIZE), 
                Direction = v14.HORIZONTAL, 
                ZIndex = 4, 
                LayoutOrder = 2, 
                ContainerSize = Vector2.new(v74.X, v74.Y), 
                AdjustScrollZoom = l_props_3.SetHorizontalScrollZoom, 
                Scroll = l_HorizontalScroll_1, 
                Zoom = l_HorizontalZoom_1, 
                Min = v75.X + 1
            }), 
            VerticalZoomBar = v79 and v1.createElement(v14, {
                Size = UDim2.new(0, v8.SCROLL_BAR_SIZE, 0, v74.Y - v8.SCROLL_BAR_SIZE - v8.SCROLL_BAR_PADDING - v8.TIMELINE_HEIGHT + 1), 
                Position = UDim2.new(1, 0, 0, v8.TIMELINE_HEIGHT), 
                Direction = v14.VERTICAL, 
                ZIndex = 4, 
                LayoutOrder = 2, 
                ContainerSize = Vector2.new(v74.X, v74.Y - v8.SCROLL_BAR_SIZE - v8.TIMELINE_HEIGHT), 
                AdjustScrollZoom = l_props_3.SetVerticalScrollZoom, 
                Scroll = l_VerticalScroll_0, 
                Zoom = l_VerticalZoom_0, 
                Min = v75.Y + v8.TIMELINE_HEIGHT + 1
            }), 
            KeyboardListener = v1.createElement(l_KeyboardListener_0, {
                OnKeyPressed = function(v81) --[[ Line: 331 ]] --[[ Name: OnKeyPressed ]]
                    -- upvalues: v10 (ref), v49 (copy)
                    if v10.isControl(v81.KeyCode) then
                        v49.ctrlHeld = true;
                    end;
                end, 
                OnKeyReleased = function(v82) --[[ Line: 336 ]] --[[ Name: OnKeyReleased ]]
                    -- upvalues: v10 (ref), v49 (copy)
                    if v10.isControl(v82.KeyCode) then
                        v49.ctrlHeld = false;
                    end;
                end
            })
        })
    });
end;
local function v84(v83) --[[ Line: 346 ]] --[[ Name: mapStateToProps ]]
    return {
        AnimationData = v83.AnimationData, 
        CannotPasteError = v83.Notifications.CannotPasteError, 
        EditorMode = v83.Status.EditorMode, 
        IsPlaying = v83.Status.IsPlaying, 
        PlayState = v83.Status.PlayState, 
        SnapMode = v83.Status.SnapMode, 
        ReadOnly = v83.Status.ReadOnly
    };
end;
local function v97(v85) --[[ Line: 358 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v19 (copy), v18 (copy), v20 (copy), v23 (copy), v22 (copy), v21 (copy), v17 (copy), v24 (copy)
    return {
        CloseCannotPasteToast = function() --[[ Line: 360 ]] --[[ Name: CloseCannotPasteToast ]]
            -- upvalues: v85 (copy), v19 (ref)
            v85(v19("CannotPasteError", false));
        end, 
        SetHorizontalScrollZoom = function(v86, v87) --[[ Line: 364 ]] --[[ Name: SetHorizontalScrollZoom ]]
            -- upvalues: v85 (copy), v18 (ref)
            v85(v18(v86, v87));
        end, 
        SetVerticalScrollZoom = function(v88, v89) --[[ Line: 368 ]] --[[ Name: SetVerticalScrollZoom ]]
            -- upvalues: v85 (copy), v20 (ref)
            v85(v20(v88, v89));
        end, 
        StepAnimation = function(v90) --[[ Line: 372 ]] --[[ Name: StepAnimation ]]
            -- upvalues: v85 (copy), v23 (ref)
            v85(v23(v90));
        end, 
        SnapToNearestKeyframe = function(v91, v92) --[[ Line: 376 ]] --[[ Name: SnapToNearestKeyframe ]]
            -- upvalues: v85 (copy), v22 (ref)
            v85(v22(v91, v92));
        end, 
        SnapToNearestFrame = function(v93) --[[ Line: 380 ]] --[[ Name: SnapToNearestFrame ]]
            -- upvalues: v85 (copy), v21 (ref)
            v85(v21(v93));
        end, 
        SetEditorMode = function(v94) --[[ Line: 384 ]] --[[ Name: SetEditorMode ]]
            -- upvalues: v85 (copy), v17 (ref)
            v85(v17(v94));
        end, 
        SwitchEditorMode = function(v95, v96) --[[ Line: 388 ]] --[[ Name: SwitchEditorMode ]]
            -- upvalues: v85 (copy), v24 (ref)
            v85(v24(v95, v96));
        end
    };
end;
v26 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse
})(v26);
return v2.connect(v84, v97)(v26);