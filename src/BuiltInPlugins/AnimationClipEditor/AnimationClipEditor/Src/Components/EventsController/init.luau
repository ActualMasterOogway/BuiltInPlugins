local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_DragListener_0 = v3.UI.DragListener;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_KeyboardListener_0 = v3.UI.KeyboardListener;
local l_Dash_0 = v3.Dash;
local l_copy_0 = l_Dash_0.copy;
local l_keys_0 = l_Dash_0.keys;
local v11 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v12 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v13 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v14 = require(l_script_FirstAncestor_0.Src.Util.Input);
local v15 = require(l_script_FirstAncestor_0.Src.Util.DoubleClickDetector);
local v16 = require(l_script_FirstAncestor_0.Src.Util.compare);
local v17 = require(l_script_FirstAncestor_0.Src.Util.DragContext);
local v18 = require(l_script_FirstAncestor_0.Src.Components.EventTrack);
local v19 = require(l_script_FirstAncestor_0.Src.Components.SelectionBox);
local v20 = require(l_script_FirstAncestor_0.Src.Components.EventActions);
local v21 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local v22 = require(l_script_FirstAncestor_0.Src.Thunks.Events.SetEvents);
local v23 = require(l_script_FirstAncestor_0.Src.Thunks.Events.SelectEvent);
local v24 = require(l_script_FirstAncestor_0.Src.Thunks.Events.DeselectEvent);
local _ = require(l_script_FirstAncestor_0.Src.Thunks.Events.DeleteSelectedEvents);
local v26 = require(l_script_FirstAncestor_0.Src.Thunks.Events.MoveSelectedEvents);
local v27 = require(l_script_FirstAncestor_0.Src.Actions.SetEventEditingTick);
local v28 = require(l_script_FirstAncestor_0.Src.Actions.SetPlayState);
local v29 = require(l_script_FirstAncestor_0.Src.Actions.SetRightClickContextInfo);
local v30 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedEvents);
local v31 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v32 = require(l_script_FirstAncestor_0.Src.Components.EditEventsDialog.EditEventsDialog);
local v33 = v1.PureComponent:extend("EventsController");
v33.init = function(v34) --[[ Line: 58 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v15 (copy), v12 (copy), v11 (copy), v13 (copy), v17 (copy), l_copy_0 (copy)
    v34.state = {
        dragging = false, 
        draggingSelection = nil, 
        dragTick = nil, 
        showContextMenu = false, 
        eventEditingTick = nil, 
        hasDragWaypoint = false, 
        availableEvents = {}, 
        eventFilters = {}
    };
    local v35, v36 = v1.createBinding(nil);
    v34.selectDragStart = v35;
    v34.updateSelectDragStart = v36;
    v35, v36 = v1.createBinding(nil);
    v34.selectDragEnd = v35;
    v34.updateSelectDragEnd = v36;
    v34.DragContext = nil;
    v34.isMultiSelecting = false;
    v34.mouseDownOnEvent = false;
    v34.mouseDownInTimeline = false;
    v34.doubleClickDetector = v15.new();
    v34.addDragWaypoint = function() --[[ Line: 82 ]]
        -- upvalues: v34 (copy)
        if not v34.state.hasDragWaypoint then
            v34.props.AddWaypoint();
            v34:setState({
                hasDragWaypoint = true
            });
        end;
    end;
    v34.getTickFromPosition = function(v37, v38) --[[ Line: 91 ]]
        -- upvalues: v12 (ref), v34 (copy), v11 (ref), v13 (ref)
        local v39 = v12.getKeyframeFromPosition(v37, v34.props.StartTick, v34.props.EndTick, v34.props.AbsolutePosition.X + v34.props.TrackPadding / 2, v34.props.AbsoluteSize.X - v34.props.TrackPadding);
        if v38 and v34.props.SnapMode ~= v11.SNAP_MODES.None then
            v39 = v13.getNearestFrame(v39, v34.props.FrameRate);
        end;
        return v39;
    end;
    v34.onEventDragStarted = function(v40) --[[ Line: 107 ]]
        -- upvalues: v34 (copy), v17 (ref)
        local l_SelectedEvents_0 = v34.props.SelectedEvents;
        local l_AnimationData_0 = v34.props.AnimationData;
        local l_eventFilters_0 = v34.state.eventFilters;
        v34.DragContext = v17.newEvents(l_AnimationData_0, l_SelectedEvents_0, l_eventFilters_0, v40);
        v34:setState({
            dragging = true, 
            dragTick = v40, 
            hasDragWaypoint = false
        });
    end;
    v34.onEventDragMoved = function(v44) --[[ Line: 119 ]]
        -- upvalues: v34 (copy)
        local v45 = v34.getTickFromPosition(v44.Position, true);
        if v34.state.dragTick ~= v45 and v34.DragContext then
            v34.addDragWaypoint();
            v34.DragContext:moveEvents(v45);
            v34.props.MoveSelectedEvents(v34.DragContext);
            v34:setState({
                dragTick = v45
            });
        end;
    end;
    v34.onEventDragEnded = function() --[[ Line: 131 ]]
        -- upvalues: v34 (copy), v1 (ref)
        v34:setState({
            dragging = false, 
            dragTick = v1.None, 
            hasDragWaypoint = false
        });
        v34.DragContext = nil;
    end;
    v34.onSelectDragStarted = function(v46) --[[ Line: 140 ]]
        -- upvalues: v34 (copy), v11 (ref)
        if not v34.state.showContextMenu then
            v34.updateSelectDragStart(Vector2.new(v46.Position.X, v11.TRACK_HEIGHT));
            v34.updateSelectDragEnd(Vector2.new(v46.Position.X, v11.TRACK_HEIGHT));
            v34:setState({
                draggingSelection = true
            });
        end;
    end;
    v34.onSelectDragMoved = function(v47) --[[ Line: 150 ]]
        -- upvalues: v34 (copy), v11 (ref)
        v34.props.DeselectAllEvents();
        local l_Position_0 = v47.Position;
        local v49 = v34.selectDragStart:getValue();
        local v50 = Vector2.new(math.min(l_Position_0.X, v49.X), 0);
        local v51 = Vector2.new(math.max(l_Position_0.X, v49.X), 0);
        local l_StartTick_0 = v34.props.StartTick;
        local l_EndTick_0 = v34.props.EndTick;
        local v54 = (v34.props.AbsoluteSize.X - v34.props.TrackPadding) / (l_EndTick_0 - l_StartTick_0);
        local v55 = Vector2.new(v54 / 2, 0);
        local v56 = v34.getTickFromPosition(v50 + v55, false);
        local v57 = v34.getTickFromPosition(v51 - v55, false);
        for _, v59 in ipairs(v34.props.AnimationData.Events.Keyframes) do
            if v56 <= v59 and v59 <= v57 then
                v34.props.SelectEvent(v59, true);
            end;
        end;
        v34.updateSelectDragEnd(Vector2.new(l_Position_0.X, v11.TRACK_HEIGHT * 2));
    end;
    v34.onSelectDragEnded = function() --[[ Line: 175 ]]
        -- upvalues: v34 (copy), v1 (ref)
        v34:setState({
            draggingSelection = v1.None
        });
        v34.updateSelectDragStart(nil);
        v34.updateSelectDragEnd(nil);
    end;
    v34.showMenu = function() --[[ Line: 183 ]]
        -- upvalues: v34 (copy), v11 (ref)
        v34.props.SetPlayState(v11.PLAY_STATE.Pause);
        v34:setState({
            showContextMenu = true
        });
    end;
    v34.hideMenu = function() --[[ Line: 190 ]]
        -- upvalues: v34 (copy)
        v34:setState({
            showContextMenu = false
        });
    end;
    v34.setEventEditingTick = function(v60) --[[ Line: 196 ]]
        -- upvalues: v34 (copy), v1 (ref)
        v34:setState({
            eventEditingTick = v60 or v1.None
        });
    end;
    v34.setEventsHandler = function(v61) --[[ Line: 202 ]]
        -- upvalues: v34 (copy)
        if v34.props.Analytics then
            return v34.props.SetEvents(v61, v34.props.Analytics);
        else
            return;
        end;
    end;
    v34.toggleEventFilter = function(v62) --[[ Line: 208 ]]
        -- upvalues: l_copy_0 (ref), v34 (copy)
        local v63 = nil;
        v63 = l_copy_0(v34.state.eventFilters);
        v63[v62] = not v63[v62] or nil;
        v34:setState({
            eventFilters = v63
        });
    end;
    v34.clearEventFilters = function() --[[ Line: 217 ]]
        -- upvalues: v34 (copy)
        v34:setState({
            eventFilters = {}
        });
    end;
    v34.setAllEventFilters = function() --[[ Line: 221 ]]
        -- upvalues: v34 (copy)
        local v64 = {};
        for _, v66 in v34.state.availableEvents do
            v64[v66] = true;
        end;
        v34:setState({
            eventFilters = v64
        });
    end;
end;
v33.handleTimelineInputBegan = function(v67, v68, _) --[[ Line: 231 ]] --[[ Name: handleTimelineInputBegan ]]
    -- upvalues: v14 (copy)
    if v68.UserInputType == Enum.UserInputType.Keyboard then
        if v14.isMultiSelectKey(v68.KeyCode) then
            v67.isMultiSelecting = true;
            return;
        end;
    elseif v68.UserInputType == Enum.UserInputType.MouseButton1 then
        v67.props.DeselectAllEvents();
        v67.mouseDownInTimeline = true;
        v67.onSelectDragStarted(v68);
    end;
end;
v33.handleTimelineInputEnded = function(v70, v71, _) --[[ Line: 244 ]] --[[ Name: handleTimelineInputEnded ]]
    -- upvalues: v14 (copy)
    if v71.UserInputType == Enum.UserInputType.Keyboard then
        if v14.isMultiSelectKey(v71.KeyCode) then
            v70.isMultiSelecting = false;
            return;
        end;
    elseif v71.UserInputType == Enum.UserInputType.MouseButton2 then
        local v73 = v70.getTickFromPosition(v71.Position, true);
        v70.props.SetRightClickContextInfo({
            Tick = v73
        });
        v70.props.SelectEvent(v73, false);
        v70.showMenu();
        return;
    elseif v71.UserInputType == Enum.UserInputType.MouseButton1 then
        local v74 = v70.getTickFromPosition(v71.Position, true);
        if v70.doubleClickDetector:isDoubleClick() then
            v70.props.DeselectAllEvents();
            v70.props.SelectEvent(v74, false);
            v70.props.SetEventEditingTick(v74);
        end;
    end;
end;
v33.handleEventRightClick = function(v75, v76) --[[ Line: 266 ]] --[[ Name: handleEventRightClick ]]
    v75.props.SelectEvent(v76, false);
    v75.props.SetRightClickContextInfo({
        OnEvent = true, 
        Tick = v76
    });
    v75.showMenu();
end;
v33.handleEventInputBegan = function(v77, v78, v79, v80) --[[ Line: 275 ]] --[[ Name: handleEventInputBegan ]]
    if v80.UserInputType == Enum.UserInputType.MouseButton1 then
        v77.mouseDownOnEvent = true;
        if v79 then
            if v77.isMultiSelecting then
                v77.props.DeselectEvent(v78);
                return;
            end;
        else
            v77.props.SelectEvent(v78, v77.isMultiSelecting);
        end;
    end;
end;
v33.handleEventInputEnded = function(v81, v82, v83, v84) --[[ Line: 291 ]] --[[ Name: handleEventInputEnded ]]
    if v84.UserInputType == Enum.UserInputType.MouseMovement and v83 and v81.mouseDownOnEvent then
        v81.onEventDragStarted(v82);
        v81.mouseDownOnEvent = false;
    end;
    if v84.UserInputType == Enum.UserInputType.MouseButton1 then
        v81.mouseDownOnEvent = false;
        if v83 and v81.doubleClickDetector:isDoubleClick() then
            v81.props.DeselectAllEvents();
            v81.props.SelectEvent(v82, false);
            v81.props.SetEventEditingTick(v82);
        end;
    end;
end;
v33.refreshEventNames = function(v85) --[[ Line: 311 ]] --[[ Name: refreshEventNames ]]
    -- upvalues: l_keys_0 (copy), v16 (copy), l_copy_0 (copy)
    local l_props_0 = v85.props;
    local l_state_0 = v85.state;
    local v88 = l_props_0.AnimationData and l_props_0.AnimationData.Events or nil;
    local v89 = {};
    if v88 then
        for _, v91 in v88.Data do
            for v92, _ in v91 do
                v89[v92] = true;
            end;
        end;
    end;
    local v94 = l_keys_0(v89);
    table.sort(v94);
    local v95, v96 = v16(l_state_0.availableEvents, v94);
    local v97 = l_copy_0(l_state_0.eventFilters);
    for _, v99 in v95 do
        v97[v99] = true;
    end;
    for _, v101 in v96 do
        v97[v101] = nil;
    end;
    v85:setState({
        availableEvents = v94, 
        eventFilters = v97
    });
end;
v33.didUpdate = function(v102, v103) --[[ Line: 349 ]] --[[ Name: didUpdate ]]
    local l_props_1 = v102.props;
    local l_state_1 = v102.state;
    if l_props_1.EventEditingTick ~= l_state_1.eventEditingTick then
        if l_props_1.EventEditingTick ~= nil then
            spawn(function() --[[ Line: 356 ]]
                -- upvalues: v102 (copy), l_props_1 (copy)
                v102.setEventEditingTick(l_props_1.EventEditingTick);
            end);
        else
            v102.setEventEditingTick(l_props_1.EventEditingTick);
        end;
    end;
    local v106 = l_props_1.AnimationData and l_props_1.AnimationData.Events or nil;
    local v107 = v103.AnimationData and v103.AnimationData.Events or nil;
    if v106 ~= v107 then
        v102:refreshEventNames(v107);
    end;
end;
v33.didMount = function(v108) --[[ Line: 373 ]] --[[ Name: didMount ]]
    v108:refreshEventNames();
end;
v33.render = function(v109) --[[ Line: 377 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v11 (copy), v18 (copy), l_KeyboardListener_0 (copy), l_DragListener_0 (copy), v19 (copy), v20 (copy), v32 (copy)
    local l_props_2 = v109.props;
    local l_state_2 = v109.state;
    local l_Active_0 = l_props_2.Active;
    local l_AbsolutePosition_0 = l_props_2.AbsolutePosition;
    local l_AbsoluteSize_0 = l_props_2.AbsoluteSize;
    local l_AnimationData_1 = l_props_2.AnimationData;
    local l_StartTick_1 = l_props_2.StartTick;
    local l_EndTick_1 = l_props_2.EndTick;
    local l_dragging_0 = l_state_2.dragging;
    local l_draggingSelection_0 = l_state_2.draggingSelection;
    local l_showContextMenu_0 = l_state_2.showContextMenu;
    local l_eventEditingTick_0 = l_state_2.eventEditingTick;
    return v1.createElement("Frame", {
        LayoutOrder = 0, 
        Size = UDim2.new(1, 0, 0, v11.TRACK_HEIGHT), 
        BackgroundTransparency = 1, 
        [v1.Event.InputBegan] = function(_, v123) --[[ Line: 396 ]]
            -- upvalues: v109 (copy)
            if v123.UserInputType ~= Enum.UserInputType.Keyboard then
                v109:handleTimelineInputBegan(v123);
            end;
        end, 
        [v1.Event.InputEnded] = function(_, v125) --[[ Line: 402 ]]
            -- upvalues: v109 (copy)
            if v125.UserInputType ~= Enum.UserInputType.Keyboard then
                v109:handleTimelineInputEnded(v125);
            end;
        end
    }, {
        Track = v1.createElement(v18, {
            Events = l_AnimationData_1 and l_AnimationData_1.Events or nil, 
            SelectedEvents = l_props_2.SelectedEvents, 
            EditingTick = l_eventEditingTick_0, 
            Size = UDim2.new(1, 0, 0, v11.TRACK_HEIGHT), 
            Width = l_AbsoluteSize_0.X - v109.props.TrackPadding, 
            TrackPadding = v109.props.TrackPadding, 
            StartTick = l_StartTick_1, 
            EndTick = l_EndTick_1, 
            ShowBackground = true, 
            ZIndex = 1, 
            AvailableEvents = v109.state.availableEvents, 
            EventFilters = v109.state.eventFilters, 
            ToggleEventFilter = v109.toggleEventFilter, 
            ClearEventFilters = v109.clearEventFilters, 
            SetAllEventFilters = v109.setAllEventFilters, 
            OnEventRightClick = function(v126) --[[ Line: 425 ]] --[[ Name: OnEventRightClick ]]
                -- upvalues: v109 (copy)
                v109:handleEventRightClick(v126);
            end, 
            OnEventInputBegan = function(v127, v128, v129) --[[ Line: 429 ]] --[[ Name: OnEventInputBegan ]]
                -- upvalues: v109 (copy)
                v109:handleEventInputBegan(v127, v128, v129);
            end, 
            OnEventInputEnded = function(v130, v131, v132) --[[ Line: 433 ]] --[[ Name: OnEventInputEnded ]]
                -- upvalues: v109 (copy)
                v109:handleEventInputEnded(v130, v131, v132);
            end
        }), 
        KeyboardListener = v1.createElement(l_KeyboardListener_0, {
            OnKeyPressed = function(v133, v134) --[[ Line: 439 ]] --[[ Name: OnKeyPressed ]]
                -- upvalues: v109 (copy)
                v109:handleTimelineInputBegan(v133, v134);
            end, 
            OnKeyReleased = function(v135) --[[ Line: 442 ]] --[[ Name: OnKeyReleased ]]
                -- upvalues: v109 (copy)
                v109:handleTimelineInputEnded(v135);
            end
        }), 
        DragTarget = l_dragging_0 and v1.createElement(l_DragListener_0, {
            OnDragMoved = v109.onEventDragMoved, 
            OnDragEnded = v109.onEventDragEnded
        }), 
        MultiSelectBox = l_draggingSelection_0 and v1.createElement(v19, {
            OnDragMoved = v109.onSelectDragMoved, 
            OnDragEnded = v109.onSelectDragEnded, 
            SelectionStart = v109.selectDragStart, 
            SelectionEnd = v109.selectDragEnd, 
            SourceExtents = Rect.new(l_AbsolutePosition_0, l_AbsolutePosition_0 + l_AbsoluteSize_0)
        }), 
        EventActions = l_Active_0 and l_AnimationData_1 and v1.createElement(v20, {
            ShowMenu = l_showContextMenu_0, 
            EventFilters = v109.state.eventFilters, 
            OnMenuOpened = v109.hideMenu, 
            OnEditEvents = l_props_2.SetEventEditingTick
        }), 
        EditEventsDialog = l_AnimationData_1 and l_eventEditingTick_0 and v1.createElement(v32, {
            Events = l_AnimationData_1.Events, 
            Tick = l_eventEditingTick_0, 
            OnSaved = v109.setEventsHandler, 
            OnClose = l_props_2.SetEventEditingTick
        })
    });
end;
local function v138(v136, _) --[[ Line: 476 ]] --[[ Name: mapStateToProps ]]
    return {
        AnimationData = v136.AnimationData, 
        Active = v136.Status.Active, 
        SelectedEvents = v136.Status.SelectedEvents, 
        EventEditingTick = v136.Status.EventEditingTick, 
        FrameRate = v136.Status.FrameRate, 
        SnapMode = v136.Status.SnapMode
    };
end;
local function v149(v139) --[[ Line: 487 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v21 (copy), v22 (copy), v31 (copy), v23 (copy), v24 (copy), v26 (copy), v30 (copy), v29 (copy), v27 (copy), v28 (copy)
    return {
        AddWaypoint = function() --[[ Line: 489 ]] --[[ Name: AddWaypoint ]]
            -- upvalues: v139 (copy), v21 (ref)
            v139(v21());
        end, 
        SetEvents = function(v140, v141) --[[ Line: 493 ]] --[[ Name: SetEvents ]]
            -- upvalues: v139 (copy), v21 (ref), v22 (ref)
            v139(v21());
            v139(v22(v140, v141));
        end, 
        SelectEvent = function(v142, v143) --[[ Line: 498 ]] --[[ Name: SelectEvent ]]
            -- upvalues: v139 (copy), v31 (ref), v23 (ref)
            v139(v31({}));
            v139(v23(v142, v143));
        end, 
        DeselectEvent = function(v144) --[[ Line: 503 ]] --[[ Name: DeselectEvent ]]
            -- upvalues: v139 (copy), v24 (ref)
            v139(v24(v144));
        end, 
        MoveSelectedEvents = function(v145) --[[ Line: 507 ]] --[[ Name: MoveSelectedEvents ]]
            -- upvalues: v139 (copy), v26 (ref)
            v139(v26(v145));
        end, 
        DeselectAllEvents = function() --[[ Line: 511 ]] --[[ Name: DeselectAllEvents ]]
            -- upvalues: v139 (copy), v31 (ref), v30 (ref)
            v139(v31({}));
            v139(v30({}));
        end, 
        SetRightClickContextInfo = function(v146) --[[ Line: 516 ]] --[[ Name: SetRightClickContextInfo ]]
            -- upvalues: v139 (copy), v29 (ref)
            v139(v29(v146));
        end, 
        SetEventEditingTick = function(v147) --[[ Line: 520 ]]
            -- upvalues: v139 (copy), v27 (ref)
            v139(v27(v147));
        end or nil, 
        SetPlayState = function(v148) --[[ Line: 524 ]] --[[ Name: SetPlayState ]]
            -- upvalues: v139 (copy), v28 (ref)
            v139(v28(v148));
        end
    };
end;
v33 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics
})(v33);
return (v2.connect(v138, v149)(v33));