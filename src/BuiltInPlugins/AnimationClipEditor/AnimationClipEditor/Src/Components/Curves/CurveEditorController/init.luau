local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_KeyboardListener_0 = v4.UI.KeyboardListener;
local l_DragListener_0 = v4.UI.DragListener;
local v9 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v10 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v11 = require(l_script_FirstAncestor_0.Src.Util.CurveUtils);
local v12 = require(l_script_FirstAncestor_0.Src.Util.DragContext);
local v13 = require(l_script_FirstAncestor_0.Src.Util.Input);
local v14 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v15 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local v17 = require(l_script_FirstAncestor_0.Src.Util.StringUtils);
local v18 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v19 = require(l_script_FirstAncestor_0.Src.Actions.SetPlayState);
local v20 = require(l_script_FirstAncestor_0.Src.Actions.SetRightClickContextInfo);
local v21 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedEvents);
local v22 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v23 = require(l_script_FirstAncestor_0.Src.Actions.SetVerticalScrollZoom);
local v24 = require(l_script_FirstAncestor_0.Src.Components.Curves.CurveCanvas);
local v25 = require(l_script_FirstAncestor_0.Src.Components.Curves.KeyframeActions);
local v26 = require(l_script_FirstAncestor_0.Src.Components.Curves.TangentActions);
local v27 = require(l_script_FirstAncestor_0.Src.Components.EventsController);
local v28 = require(l_script_FirstAncestor_0.Src.Components.Curves.Scale);
local v29 = require(l_script_FirstAncestor_0.Src.Components.ScaleControls.ScaleControls);
local v30 = require(l_script_FirstAncestor_0.Src.Components.SelectionBox);
local v31 = require(l_script_FirstAncestor_0.Src.Components.TextEntryPrompt);
local v32 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local v33 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.DeselectKeyframe);
local v34 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.GenerateCurve);
local v35 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.MoveSelectedKeyframes);
local v36 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.ScaleSelectedKeyframes);
local v37 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.SelectKeyframeRange);
local v38 = require(l_script_FirstAncestor_0.Src.Thunks.SetKeyframeTangent);
local v39 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.SetSelectedKeyframeData);
local v40 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
local v41 = v1.Component:extend("CurveEditorController");
v41.init = function(v42) --[[ Line: 133 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy), v1 (copy), v3 (copy), v17 (copy), v9 (copy), v12 (copy), v15 (copy), v14 (copy)
    v42.state = {
        AbsolutePosition = Vector2.new(), 
        AbsoluteSize = Vector2.new(), 
        CanvasSize = Vector2.new(), 
        ChangingDuration = false, 
        Dragging = false, 
        DraggingScale = false, 
        DraggingSelection = false, 
        DragTick = false, 
        HasDragWaypoint = false, 
        MinValue = 0, 
        MaxValue = v10.CURVE_CANVAS_MIN_RANGE, 
        ShowKeyframeMenu = false, 
        ShotTangentMenu = false, 
        Tracks = {}
    };
    v42.isMounted = false;
    v42.dragContext = nil;
    v42.isMultiSelecting = false;
    v42.dragMode = nil;
    v42.mouseDown = false;
    v42.mouseDownInCanvas = false;
    v42.ctrlHeld = false;
    local v43, v44 = v1.createBinding(nil);
    v42.selectDragStart = v43;
    v42.updateSelectDragStart = v44;
    v43, v44 = v1.createBinding(nil);
    v42.selectDragEnd = v43;
    v42.updateSelectDragEnd = v44;
    v42.recalculateExtents = function(v45) --[[ Line: 162 ]]
        -- upvalues: v42 (copy)
        v42:setState({
            AbsoluteSize = v45.AbsoluteSize, 
            CanvasSize = v45.AbsoluteSize - Vector2.new(v42.props.TrackPadding, 0), 
            AbsolutePosition = v45.AbsolutePosition
        });
    end;
    v42.onClearTangentsSelected = function() --[[ Line: 170 ]]
        -- upvalues: v3 (ref), v42 (copy)
        local v46 = {
            LeftSlope = v3.None, 
            RightSlope = v3.None
        };
        v42.props.SetSelectedKeyframeData(v46);
    end;
    v42.setChangingDuration = function(v47) --[[ Line: 178 ]]
        -- upvalues: v42 (copy)
        v42:setState({
            ChangingDuration = v47 or false
        });
    end;
    v42.onChangeDuration = function() --[[ Line: 184 ]]
        -- upvalues: v42 (copy)
        spawn(function() --[[ Line: 185 ]]
            -- upvalues: v42 (ref)
            v42.setChangingDuration(true);
        end);
    end;
    v42.showKeyframeMenu = function() --[[ Line: 190 ]]
        -- upvalues: v42 (copy), v10 (ref)
        v42.props.SetPlayState(v10.PLAY_STATE.Pause);
        v42:setState({
            ShowKeyframeMenu = true, 
            ShowTangentMenu = false
        });
    end;
    v42.hideKeyframeMenu = function() --[[ Line: 198 ]]
        -- upvalues: v42 (copy)
        v42:setState({
            ShowKeyframeMenu = false
        });
    end;
    v42.showTangentMenu = function() --[[ Line: 204 ]]
        -- upvalues: v42 (copy), v10 (ref)
        v42.props.SetPlayState(v10.PLAY_STATE.Pause);
        v42:setState({
            ShowKeyframeMenu = false, 
            ShowTangentMenu = true
        });
    end;
    v42.hideTangentMenu = function() --[[ Line: 212 ]]
        -- upvalues: v42 (copy)
        v42:setState({
            ShowTangentMenu = false
        });
    end;
    v42.onInterpolationSelected = function(v48) --[[ Line: 218 ]]
        -- upvalues: v42 (copy)
        local v49 = {
            InterpolationMode = v48
        };
        v42.props.SetSelectedKeyframeData(v49);
    end;
    v42.toCurveSpace = function(v50) --[[ Line: 225 ]]
        -- upvalues: v42 (copy), v10 (ref)
        local l_props_0 = v42.props;
        local l_state_0 = v42.state;
        local l_MinValue_0 = l_state_0.MinValue;
        local l_MaxValue_0 = l_state_0.MaxValue;
        local l_VerticalScroll_0 = l_props_0.VerticalScroll;
        local v56 = math.min(l_props_0.VerticalZoom, 0.99);
        local v57 = 1 / (1 - v56);
        local l_X_0 = v50.X;
        local l_Y_0 = v50.Y;
        l_X_0 = l_X_0 - v42.state.AbsolutePosition.X - v42.props.TrackPadding / 2;
        l_Y_0 = l_Y_0 - v42.state.AbsolutePosition.Y;
        l_X_0 = l_props_0.StartTick + l_X_0 * (l_props_0.EndTick - l_props_0.StartTick) / v42.state.CanvasSize.X;
        l_Y_0 = l_MaxValue_0 - (l_MaxValue_0 - l_MinValue_0) * (l_VerticalScroll_0 * v56 + (l_Y_0 - v42.state.CanvasSize.Y * v10.CURVE_CANVAS_PADDING) / (v42.state.CanvasSize.Y * (1 - 2 * v10.CURVE_CANVAS_PADDING) * v57));
        return Vector2.new(l_X_0, l_Y_0);
    end;
    v42.setSelectedKeyframeDuration = function(v60) --[[ Line: 252 ]]
        -- upvalues: v42 (copy), v17 (ref), v9 (ref)
        v42.setChangingDuration();
        local v61 = v17.parseTime(v60, v42.props.FrameRate, v42.props.TimelineUnit);
        if v61 ~= nil then
            local v62, v63 = v9.getSelectionBounds(v42.props.AnimationData, v42.props.SelectedKeyframes);
            local v64 = v61 / (v63 - v62);
            v42.props.ScaleSelectedKeyframes(v62, v64);
        end;
    end;
    v42.addDragWaypoint = function() --[[ Line: 264 ]]
        -- upvalues: v42 (copy)
        if not v42.state.HasDragWaypoint then
            v42.props.AddWaypoint();
            v42:setState({
                HasDragWaypoint = true
            });
        end;
    end;
    v42.onScaleHandleDragStarted = function(v65) --[[ Line: 273 ]]
        -- upvalues: v42 (copy), v12 (ref)
        local l_SelectedKeyframes_0 = v42.props.SelectedKeyframes;
        local l_AnimationData_0 = v42.props.AnimationData;
        v42.dragContext = v12.new(l_AnimationData_0, l_SelectedKeyframes_0, v65, nil);
        v42:setState({
            DraggingScale = true, 
            DragTick = v65, 
            HasDragWaypoint = false
        });
    end;
    v42.onScaleHandleDragMoved = function(v68) --[[ Line: 284 ]]
        -- upvalues: v42 (copy), v15 (ref), v10 (ref)
        local v69 = v42.toCurveSpace(v68.Position);
        local v70 = v15.getNearestTick(v69.X);
        if v42.props.SnapMode ~= v10.SNAP_MODES.None then
            v70 = v15.getNearestFrame(v70, v42.props.FrameRate);
        end;
        if v42.state.DragTick ~= v70 and v42.dragContext then
            v42.addDragWaypoint();
            v42.dragContext:scaleKeyframes(v70, v42.props.StartTick);
            v42.props.ScaleSelectedKeyframes(v42.dragContext.pivotTick, v42.dragContext.scale, v42.dragContext);
            v42:setState({
                DragTick = v70
            });
        end;
    end;
    v42.onScaleHandleDragEnded = function() --[[ Line: 302 ]]
        -- upvalues: v42 (copy), v1 (ref)
        v42.dragContext = nil;
        v42:setState({
            DraggingScale = false, 
            DragTick = v1.None, 
            HasDragWaypoint = false
        });
    end;
    v42.onSelectDragStarted = function(v71) --[[ Line: 311 ]]
        -- upvalues: v42 (copy)
        if not v42.state.ShowKeyframeMenu and not v42.state.ShowTangentMenu and not v42.props.ReadOnly then
            v42.updateSelectDragStart(v71.Position);
            v42.updateSelectDragEnd(v71.Position);
            v42:setState({
                DraggingSelection = true
            });
        end;
    end;
    v42.onSetTangent = function(v72, v73, v74, v75, v76) --[[ Line: 321 ]]
        -- upvalues: v42 (copy), v3 (ref)
        v42.props.AddWaypoint();
        v42.props.SetKeyframeTangent(v72, v73, v74, v75, v76 or v3.None);
    end;
    v42.onSelectDragMoved = function(v77) --[[ Line: 332 ]]
        -- upvalues: v42 (copy), v10 (ref)
        local l_state_1 = v42.state;
        local l_props_1 = v42.props;
        local l_Position_0 = v77.Position;
        v42.updateSelectDragEnd(l_Position_0);
        local v81 = v42.selectDragStart:getValue();
        local l_Tracks_0 = l_state_1.Tracks;
        local v83 = v42.toCurveSpace(Vector2.new(math.min(l_Position_0.X, v81.X), (math.max(l_Position_0.Y, v81.Y))));
        local v84 = v42.toCurveSpace(Vector2.new(math.max(l_Position_0.X, v81.X), (math.min(l_Position_0.Y, v81.Y))));
        local v85 = {};
        for _, v87 in ipairs(l_Tracks_0) do
            local l_Instance_0 = v87.Instance;
            for v89, v90 in pairs(v87.Data) do
                local v91 = false;
                if v87.Type == v10.TRACK_TYPES.Quaternion then
                    v91 = v83.Y <= 1 and v84.Y >= 1 or v83.Y <= 0 and v84.Y >= 0;
                else
                    local v92 = false;
                    if v90.Value >= v83.Y then
                        v92 = v90.Value <= v84.Y;
                    end;
                    v91 = v92;
                end;
                if v83.X <= v89 and v89 <= v84.X and v91 then
                    if not v85[l_Instance_0] then
                        v85[l_Instance_0] = {};
                    end;
                    local v93 = v85[l_Instance_0];
                    local v94 = nil;
                    for _, v96 in ipairs(v87.Path) do
                        if v94 then
                            v94.Components = v94.Components or {};
                            v93 = v94.Components;
                        end;
                        if v93 then
                            v93[v96] = v93[v96] or {};
                            v94 = v93[v96];
                        end;
                    end;
                    if v94 then
                        if v94.Selection then
                            v94.Selection[v89] = true;
                        else
                            v94.Selection = {
                                [v89] = true
                            };
                        end;
                    end;
                end;
            end;
        end;
        l_props_1.SetSelectedKeyframes(v85);
    end;
    v42.onSelectDragEnded = function() --[[ Line: 395 ]]
        -- upvalues: v42 (copy), v1 (ref)
        v42:setState({
            DraggingSelection = v1.None
        });
        v42.updateSelectDragStart(nil);
        v42.updateSelectDragEnd(nil);
    end;
    v42.onKeyframeDragStarted = function(v97, v98) --[[ Line: 403 ]]
        -- upvalues: v42 (copy), v12 (ref)
        local l_SelectedKeyframes_1 = v42.props.SelectedKeyframes;
        local l_AnimationData_1 = v42.props.AnimationData;
        v42.dragContext = v12.new(l_AnimationData_1, l_SelectedKeyframes_1, v97, v98);
        v42:setState({
            Dragging = true, 
            DragTick = v97, 
            HasDragWaypoint = false
        });
    end;
    v42.onTangentDragStarted = function(v101, v102, v103, v104) --[[ Line: 416 ]]
        -- upvalues: v42 (copy), v12 (ref)
        local l_AnimationData_2 = v42.props.AnimationData;
        v42.dragContext = v12.newTangentContext(l_AnimationData_2, v101, v102, v103, v104);
        v42:setState({
            Dragging = true, 
            DragTick = v103, 
            HasDragWaypoint = false
        });
    end;
    v42.onDragMoved = function(v106) --[[ Line: 428 ]]
        -- upvalues: v42 (copy), v10 (ref), v15 (ref)
        local l_dragContext_0 = v42.dragContext;
        if not l_dragContext_0 then
            return;
        else
            local v108 = v42.toCurveSpace(v106.Position);
            local l_X_1 = v108.X;
            local l_y_0 = v108.y;
            if l_dragContext_0.dragMode == v10.DRAG_MODE.Keyframe then
                l_X_1 = v15.getNearestTick(l_X_1);
                if v42.props.SnapMode ~= v10.SNAP_MODES.None then
                    l_X_1 = v15.getNearestFrame(l_X_1, v42.props.FrameRate);
                end;
                if l_X_1 ~= l_dragContext_0.newTick or l_y_0 ~= l_dragContext_0.newValue then
                    v42.addDragWaypoint();
                    l_dragContext_0:moveKeyframes(l_X_1, l_y_0);
                    v42.props.MoveSelectedKeyframes(v42.dragContext.pivotTick, v42.dragContext.newTick, v42.dragContext.pivotValue, v42.dragContext.newValue, v42.dragContext);
                    v42:setState({
                        DragTick = l_X_1
                    });
                    return;
                end;
            elseif l_dragContext_0.dragMode == v10.DRAG_MODE.Tangent then
                local l_value_0 = l_dragContext_0.value;
                if l_dragContext_0.side == v10.SLOPES.Left then
                    if l_dragContext_0.tck <= l_X_1 then
                        return;
                    elseif l_dragContext_0.trackType == v10.TRACK_TYPES.Quaternion then
                        l_value_0 = 1;
                    end;
                elseif l_dragContext_0.side == v10.SLOPES.Right then
                    if l_X_1 <= l_dragContext_0.tck then
                        return;
                    elseif l_dragContext_0.trackType == v10.TRACK_TYPES.Quaternion then
                        l_value_0 = 0;
                    end;
                end;
                local v112 = (l_y_0 - l_value_0) / (l_X_1 - l_dragContext_0.tck);
                v42.addDragWaypoint();
                v42.props.SetKeyframeTangent(l_dragContext_0.instance, l_dragContext_0.path, l_dragContext_0.tck, l_dragContext_0.side, v112);
            end;
            return;
        end;
    end;
    v42.onDragEnded = function() --[[ Line: 491 ]]
        -- upvalues: v42 (copy), v1 (ref)
        v42.mouseDown = false;
        v42.dragContext = nil;
        v42:setState({
            Dragging = false, 
            DragTick = v1.None, 
            HasDragWaypoint = false
        });
    end;
    v42.handleKeyframeRightClick = function(v113, v114, v115) --[[ Line: 501 ]]
        -- upvalues: v14 (ref), v42 (copy)
        if v14(v42.props.SelectedKeyframes) then
            v42.props.SelectKeyframeRange(v113, v114, v115, v115, false);
        end;
        v42.showKeyframeMenu();
    end;
    v42.handleKeyframeInputBegan = function(v116, v117, v118, v119, v120) --[[ Line: 508 ]]
        -- upvalues: v42 (copy)
        if not v42.props.ReadOnly and v120.UserInputType == Enum.UserInputType.MouseButton1 then
            v42.mouseDown = true;
            if v119 then
                if v42.isMultiSelecting then
                    v42.props.DeselectKeyframe(v116, v117, v118);
                    return;
                end;
            else
                v42.props.SelectKeyframeRange(v116, v117, v118, v118, v42.isMultiSelecting);
            end;
        end;
    end;
    v42.handleKeyframeInputEnded = function(v121, v122, v123, v124) --[[ Line: 530 ]]
        -- upvalues: v42 (copy)
        if v124.UserInputType == Enum.UserInputType.MouseMovement and v123 and v42.mouseDown then
            v42.onKeyframeDragStarted(v121, v122);
            v42.onDragMoved(v124);
            v42.mouseDown = false;
        end;
        if v124.UserInputType == Enum.UserInputType.MouseButton1 then
            v42.mouseDown = false;
        end;
    end;
    v42.handleTangentRightClick = function(v125, v126, v127, v128) --[[ Line: 545 ]]
        -- upvalues: v42 (copy)
        v42.props.SetRightClickContextInfo({
            InstanceName = v125, 
            Path = v126, 
            Tick = v127, 
            Side = v128
        });
        v42.showTangentMenu();
    end;
    v42.handleTangentInputBegan = function(v129) --[[ Line: 555 ]]
        -- upvalues: v42 (copy)
        if not v42.props.ReadOnly and v129.UserInputType == Enum.UserInputType.MouseButton1 then
            v42.mouseDown = true;
        end;
    end;
    v42.handleTangentInputEnded = function(v130, v131, v132, v133, v134) --[[ Line: 561 ]]
        -- upvalues: v42 (copy)
        if v134.UserInputType == Enum.UserInputType.MouseMovement and v42.mouseDown then
            v42.onTangentDragStarted(v130, v131, v132, v133);
            v42.onDragMoved(v134);
            v42.mouseDown = false;
        end;
        if v134.UserInputType == Enum.UserInputType.MouseButton1 then
            v42.mouseDown = false;
        end;
    end;
end;
v41.updateCanvasExtents = function(v135, v136) --[[ Line: 582 ]] --[[ Name: updateCanvasExtents ]]
    -- upvalues: v18 (copy), v14 (copy), v10 (copy), v15 (copy), v11 (copy)
    local v137 = nil;
    local v138 = nil;
    if v136 then
        for _, v140 in pairs(v136) do
            v18.traverseTracks(nil, v140, function(v141, _, _) --[[ Line: 587 ]]
                -- upvalues: v14 (ref), v10 (ref), v15 (ref), v11 (ref), v137 (ref), v138 (ref)
                local v144 = nil;
                local v145 = nil;
                if v141.Keyframes and not v14(v141.Keyframes) then
                    for _, v147 in ipairs(v141.Keyframes) do
                        local v148 = v141.Data[v147];
                        local v149 = nil;
                        local v150 = nil;
                        if not v144 then
                            if v141.Type == v10.TRACK_TYPES.Quaternion then
                                v149 = 0;
                                v150 = 1;
                            else
                                local l_Value_0 = v148.Value;
                                v149 = l_Value_0;
                                v150 = l_Value_0;
                            end;
                        else
                            local v152 = v15.getSlope(v141, v144, v10.SLOPES.Right);
                            local v153 = v15.getSlope(v141, v147, v10.SLOPES.Left);
                            if v141.Type == v10.TRACK_TYPES.Quaternion then
                                local v154, v155 = v11.getYExtents(v144, 0, v152, v147, 1, v153);
                                v149 = v154;
                                v150 = v155;
                            else
                                local l_Value_1 = v145.Value;
                                local l_Value_2 = v148.Value;
                                local v158, v159 = v11.getYExtents(v144, l_Value_1, v152, v147, l_Value_2, v153);
                                v149 = v158;
                                v150 = v159;
                                if v141.Type == v10.TRACK_TYPES.Facs then
                                    v149 = math.clamp(v149, 0, 1);
                                    v150 = math.clamp(v150, 0, 1);
                                end;
                            end;
                        end;
                        v137 = if v137 then math.min(v137, v149) else v149;
                        v138 = if v138 then math.max(v138, v150) else v150;
                        v145 = v148;
                        v144 = v147;
                    end;
                end;
            end, true);
        end;
    end;
    v137 = v137 or 0;
    v138 = v138 or 1;
    if v137 == v138 then
        v137 = v137 - 0.5;
        v138 = v138 + 0.5;
    end;
    v135:setState({
        MinValue = v137, 
        MaxValue = v138
    });
end;
v41.updateTracks = function(v160, v161) --[[ Line: 642 ]] --[[ Name: updateTracks ]]
    -- upvalues: v9 (copy), v18 (copy), v3 (copy)
    local l_props_2 = v160.props;
    local v163 = {};
    if l_props_2.SelectedTracks and l_props_2.AnimationData and l_props_2.AnimationData.Instances then
        local v164 = {};
        for _, v166 in pairs(l_props_2.SelectedTracks) do
            local v167 = v9.getTrack(l_props_2.AnimationData, "Root", v166);
            if v167 then
                v18.traverseTracks(nil, v167, function(v168, _, v170) --[[ Line: 653 ]]
                    -- upvalues: v3 (ref), v166 (copy), v164 (copy), v163 (copy)
                    local v171 = v3.List.join(v166, v170);
                    local v172 = table.concat(v171, ".");
                    if not v164[v172] then
                        table.insert(v163, v3.Dictionary.join(v168, {
                            Path = v171, 
                            Instance = "Root"
                        }));
                        v164[v172] = true;
                    end;
                end, true);
            end;
        end;
        v160:setState({
            Tracks = v163
        });
    end;
    if l_props_2.SelectedTracks ~= v161.SelectedTracks then
        v160:updateCanvasExtents(v163);
    end;
end;
v41.didUpdate = function(v173, v174) --[[ Line: 673 ]] --[[ Name: didUpdate ]]
    local l_props_3 = v173.props;
    if v174.AnimationData ~= l_props_3.AnimationData or v174.SelectedTracks ~= l_props_3.SelectedTracks then
        v173:updateTracks(v174);
    end;
end;
v41.addAction = function(v176, v177, v178) --[[ Line: 680 ]] --[[ Name: addAction ]]
    if v177 then
        v177.Enabled = true;
        table.insert(v176.Actions, v177);
        table.insert(v176.Connections, v177.Triggered:Connect(v178));
    end;
end;
v41.didMount = function(v179) --[[ Line: 688 ]] --[[ Name: didMount ]]
    v179.isMounted = true;
    v179:updateTracks({});
    local l_PluginActions_0 = v179.props.PluginActions;
    v179.Connections = {};
    v179.Actions = {};
    v179:addAction(l_PluginActions_0:get("ResizeCanvas"), function() --[[ Line: 696 ]]
        -- upvalues: v179 (copy)
        v179:updateCanvasExtents(v179.state.Tracks);
        v179.props.SetVerticalScrollZoom(0, 0);
    end);
end;
v41.willUnmount = function(v181) --[[ Line: 702 ]] --[[ Name: willUnmount ]]
    v181.isMounted = false;
    if v181.Connections then
        for _, v183 in ipairs(v181.Connections) do
            v183:Disconnect();
        end;
        v181.Connections = {};
    end;
    if v181.Actions then
        for _, v185 in ipairs(v181.Actions) do
            v185.Enabled = false;
        end;
    end;
end;
v41.hasSelectedKeyframes = function(v186) --[[ Line: 718 ]] --[[ Name: hasSelectedKeyframes ]]
    -- upvalues: v14 (copy)
    local v187 = v186.dragContext and v186.dragContext.selectedKeyframe or v186.props.SelectedKeyframes;
    local v188 = false;
    if v187 ~= nil then
        v188 = not v14(v187);
    end;
    return v188;
end;
v41.multipleFramesSelected = function(v189) --[[ Line: 723 ]] --[[ Name: multipleFramesSelected ]]
    -- upvalues: v9 (copy)
    local v190 = v189.dragContext and v189.dragContext.animationData or v189.props.AnimationData;
    local v191 = v189.dragContext and v189.dragContext.selectedKeyframes or v189.props.SelectedKeyframes;
    local v192, v193 = v9.getSelectionBounds(v190, v191);
    return v191 and v192 ~= v193;
end;
v41.handleCanvasInputBegan = function(v194, v195, _) --[[ Line: 732 ]] --[[ Name: handleCanvasInputBegan ]]
    -- upvalues: v13 (copy)
    if v195.UserInputType == Enum.UserInputType.Keyboard then
        if v13.isMultiSelectKey(v195.KeyCode) then
            v194.isMultiSelecting = true;
        end;
        if v13.isControl(v195.KeyCode) then
            v194.ctrlHeld = true;
            return;
        end;
    elseif v195.UserInputType == Enum.UserInputType.MouseButton1 then
        v194.props.DeselectAllKeyframes();
        v194.mouseDownInCanvas = true;
        v194.onSelectDragStarted(v195);
    end;
end;
v41.handleCanvasInputChanged = function(v197, v198) --[[ Line: 748 ]] --[[ Name: handleCanvasInputChanged ]]
    -- upvalues: v10 (copy)
    if v198.UserInputType == Enum.UserInputType.MouseWheel and not v197.ctrlHeld then
        local l_Y_1 = v197.toCurveSpace(Vector2.new(0, v198.Position.Y)).Y;
        local v200 = 1 + v10.CANVAS_ZOOM_INCREMENT;
        if v198.Position.Z > 0 then
            v197:setState({
                MinValue = l_Y_1 + (v197.state.MinValue - l_Y_1) / v200, 
                MaxValue = l_Y_1 + (v197.state.MaxValue - l_Y_1) / v200
            });
            return;
        elseif v198.Position.Z < 0 then
            v197:setState({
                MinValue = l_Y_1 + (v197.state.MinValue - l_Y_1) * v200, 
                MaxValue = l_Y_1 + (v197.state.MaxValue - l_Y_1) * v200
            });
            return;
        end;
    elseif v197.props.OnInputChanged then
        v197.props.OnInputChanged(nil, v198);
    end;
end;
v41.handleCanvasInputEnded = function(v201, v202) --[[ Line: 779 ]] --[[ Name: handleCanvasInputEnded ]]
    -- upvalues: v13 (copy)
    if v202.UserInputType == Enum.UserInputType.Keyboard then
        if v13.isMultiSelectKey(v202.KeyCode) then
            v201.isMultiSelecting = false;
        end;
        if v13.isControl(v202.KeyCode) then
            v201.ctrlHeld = false;
            return;
        end;
    elseif v202.UserInputType == Enum.UserInputType.MouseButton1 then
        v201.mouseDownInCanvas = false;
        return;
    elseif v202.UserInputType == Enum.UserInputType.MouseButton2 then
        v201.showKeyframeMenu();
    end;
end;
v41.render = function(v203) --[[ Line: 795 ]] --[[ Name: render ]]
    -- upvalues: v40 (copy), v9 (copy), v10 (copy), v1 (copy), v27 (copy), l_KeyboardListener_0 (copy), v25 (copy), v26 (copy), v28 (copy), v24 (copy), v29 (copy), l_DragListener_0 (copy), v30 (copy), v31 (copy)
    local l_props_4 = v203.props;
    local l_state_2 = v203.state;
    local l_AnimationData_3 = l_props_4.AnimationData;
    local l_isMounted_0 = v203.isMounted;
    local l_AbsoluteSize_0 = l_state_2.AbsoluteSize;
    local l_CanvasSize_0 = l_state_2.CanvasSize;
    local l_AbsolutePosition_0 = l_state_2.AbsolutePosition;
    local l_StartTick_0 = l_props_4.StartTick;
    local l_EndTick_0 = l_props_4.EndTick;
    local l_TrackPadding_0 = l_props_4.TrackPadding;
    local l_ShowEvents_0 = l_props_4.ShowEvents;
    local l_Active_0 = l_props_4.Active;
    local l_SelectedKeyframes_2 = l_props_4.SelectedKeyframes;
    local l_ShowKeyframeMenu_0 = l_state_2.ShowKeyframeMenu;
    local l_ShowTangentMenu_0 = l_state_2.ShowTangentMenu;
    local l_ChangingDuration_0 = l_state_2.ChangingDuration;
    local v220 = v203:hasSelectedKeyframes() and v203:multipleFramesSelected();
    local l_Localization_0 = l_props_4.Localization;
    local l_FrameRate_0 = l_props_4.FrameRate;
    local v223 = if v40() then nil else l_props_4.ShowAsSeconds;
    local l_TimelineUnit_0 = l_props_4.TimelineUnit;
    local l_Dragging_0 = l_state_2.Dragging;
    local l_DraggingScale_0 = l_state_2.DraggingScale;
    local l_Tracks_1 = l_state_2.Tracks;
    local l_MinValue_1 = l_state_2.MinValue;
    local l_MaxValue_1 = l_state_2.MaxValue;
    local l_DraggingSelection_0 = l_state_2.DraggingSelection;
    local v231 = l_AnimationData_3 and l_AnimationData_3.Events and l_AnimationData_3.Events.NamedKeyframes or {};
    local v232 = nil;
    if l_ChangingDuration_0 then
        local v233, v234 = v9.getSelectionBounds(v203.props.AnimationData, v203.props.SelectedKeyframes);
        v232 = (v234 - v233) * l_FrameRate_0 / v10.TICK_FREQUENCY;
    end;
    return v1.createElement("Frame", {
        Size = l_props_4.Size, 
        Position = l_props_4.Position, 
        BackgroundTransparency = 1, 
        ZIndex = l_props_4.ZIndex
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Events = l_ShowEvents_0 and v1.createElement(v27, {
            AbsolutePosition = l_AbsolutePosition_0 - Vector2.new(0, v10.TRACK_HEIGHT), 
            AbsoluteSize = Vector2.new(l_AbsoluteSize_0.X, v10.TRACK_HEIGHT), 
            AnimationData = l_AnimationData_3, 
            StartTick = l_StartTick_0, 
            EndTick = l_EndTick_0, 
            TrackPadding = l_TrackPadding_0
        }), 
        CanvasContainer = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, l_ShowEvents_0 and -v10.TRACK_HEIGHT or 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            [v1.Change.AbsoluteSize] = v203.recalculateExtents, 
            [v1.Event.InputBegan] = function(_, v236) --[[ Line: 860 ]]
                -- upvalues: v203 (copy)
                if v236.UserInputType ~= Enum.UserInputType.Keyboard then
                    v203:handleCanvasInputBegan(v236);
                end;
            end, 
            [v1.Event.InputEnded] = function(_, v238) --[[ Line: 865 ]]
                -- upvalues: v203 (copy)
                if v238.UserInputType ~= Enum.UserInputType.Keyboard then
                    v203:handleCanvasInputEnded(v238);
                end;
            end, 
            [v1.Event.InputChanged] = function(_, v240) --[[ Line: 870 ]]
                -- upvalues: v203 (copy)
                v203:handleCanvasInputChanged(v240);
            end
        }, {
            KeyboardListener = v1.createElement(l_KeyboardListener_0, {
                OnKeyPressed = function(v241, v242) --[[ Line: 875 ]] --[[ Name: OnKeyPressed ]]
                    -- upvalues: v203 (copy)
                    v203:handleCanvasInputBegan(v241, v242);
                end, 
                OnKeyReleased = function(v243) --[[ Line: 878 ]] --[[ Name: OnKeyReleased ]]
                    -- upvalues: v203 (copy)
                    v203:handleCanvasInputEnded(v243);
                end
            }), 
            KeyframeActions = l_Active_0 and v1.createElement(v25, {
                ShowMenu = l_ShowKeyframeMenu_0, 
                MultipleSelected = v220, 
                OnMenuOpened = v203.hideKeyframeMenu, 
                OnClearTangentsSelected = v203.onClearTangentsSelected, 
                OnGenerateCurve = v203.props.GenerateCurve, 
                OnChangeDuration = v203.onChangeDuration, 
                OnInterpolationSelected = v203.onInterpolationSelected
            }) or nil, 
            TangentActions = l_Active_0 and v1.createElement(v26, {
                ShowMenu = l_ShowTangentMenu_0, 
                OnMenuOpened = v203.hideTangentMenu, 
                OnSetTangent = v203.onSetTangent
            }) or nil, 
            PositionScale = v1.createElement(v28, {
                Size = UDim2.new(0, l_props_4.TrackPadding / 2, 1, 0), 
                Width = l_props_4.TrackPadding / 2, 
                ParentSize = l_CanvasSize_0, 
                Position = UDim2.new(0, 0, 0, 0), 
                TickWidthScale = 0.7, 
                SmallTickWidthScale = 0.3, 
                MinValue = l_MinValue_1, 
                MaxValue = l_MaxValue_1, 
                VerticalScroll = l_props_4.VerticalScroll, 
                VerticalZoom = l_props_4.VerticalZoom, 
                ScaleType = v10.SCALE_TYPE.Number, 
                ZIndex = 3
            }), 
            CurveCanvas = l_isMounted_0 and v1.createElement(v24, {
                Size = UDim2.new(1, -l_props_4.TrackPadding, 1, 0), 
                Position = UDim2.new(0, l_props_4.TrackPadding / 2, 0, 0), 
                AbsoluteSize = l_CanvasSize_0, 
                StartTick = l_StartTick_0, 
                EndTick = l_EndTick_0, 
                MinValue = l_MinValue_1, 
                MaxValue = l_MaxValue_1, 
                Tracks = l_Tracks_1, 
                VerticalScroll = l_props_4.VerticalScroll, 
                VerticalZoom = l_props_4.VerticalZoom, 
                SelectedKeyframes = l_SelectedKeyframes_2, 
                NamedKeyframes = v231, 
                Playhead = l_props_4.Playhead, 
                ShowTooltips = not l_Dragging_0, 
                ZIndex = 1, 
                OnKeyRightClick = v203.handleKeyframeRightClick, 
                OnKeyInputBegan = v203.handleKeyframeInputBegan, 
                OnKeyInputEnded = v203.handleKeyframeInputEnded, 
                OnTangentRightClick = v203.handleTangentRightClick, 
                OnTangentInputBegan = v203.handleTangentInputBegan, 
                OnTangentInputEnded = v203.handleTangentInputEnded
            }) or nil, 
            RotationScale = v1.createElement(v28, {
                Size = UDim2.new(0, l_props_4.TrackPadding / 2, 1, 0), 
                Width = l_props_4.TrackPadding / 2, 
                ParentSize = l_CanvasSize_0, 
                Position = UDim2.new(1, -l_props_4.TrackPadding / 2, 0, 0), 
                TickWidthScale = 0.7, 
                SmallTickWidthScale = 0.3, 
                MinValue = math.deg(l_MinValue_1), 
                MaxValue = math.deg(l_MaxValue_1), 
                VerticalScroll = l_props_4.VerticalScroll, 
                VerticalZoom = l_props_4.VerticalZoom, 
                ScaleType = v10.SCALE_TYPE.Angle, 
                ZIndex = 4
            }) or nil, 
            ScaleControls = v220 and not l_DraggingSelection_0 and v1.createElement(v29, {
                SelectedKeyframes = l_SelectedKeyframes_2, 
                StartTick = l_StartTick_0, 
                EndTick = l_EndTick_0, 
                UseFullHeight = true, 
                TrackPadding = l_TrackPadding_0, 
                Dragging = l_DraggingScale_0 or l_Dragging_0, 
                ShowAsSeconds = v223, 
                TimelineUnit = l_TimelineUnit_0, 
                FrameRate = l_FrameRate_0, 
                DopeSheetWidth = l_CanvasSize_0.X, 
                ZIndex = 2, 
                ShowSelectionArea = true, 
                IsChannelAnimation = true, 
                OnScaleHandleDragStart = v203.onScaleHandleDragStarted, 
                OnScaleHandleDragEnd = v203.onScaleHandleDragEnded, 
                OnScaleHandleDragMoved = v203.onScaleHandleDragMoved
            }), 
            DragTarget = l_Dragging_0 and v1.createElement(l_DragListener_0, {
                OnDragMoved = v203.onDragMoved, 
                OnDragEnded = v203.onDragEnded
            }), 
            MultiSelectBox = l_DraggingSelection_0 and v1.createElement(v30, {
                OnDragMoved = v203.onSelectDragMoved, 
                OnDragEnded = v203.onSelectDragEnded, 
                SelectionStart = v203.selectDragStart, 
                SelectionEnd = v203.selectDragEnd, 
                SourceExtents = Rect.new(l_AbsolutePosition_0, l_AbsolutePosition_0 + l_AbsoluteSize_0)
            }), 
            ChangeDurationPrompt = v232 and v1.createElement(v31, {
                PromptText = l_Localization_0:getText("Title", "ChangeDuration"), 
                InputText = l_Localization_0:getText("Title", "NewDuration"), 
                NoticeText = l_Localization_0:getText("Title", "CurrentDuration_Migrated", {
                    currentDuration = v232
                }), 
                Text = v232, 
                Buttons = {
                    {
                        Key = false, 
                        Text = l_Localization_0:getText("Dialog", "Cancel"), 
                        Style = "Round"
                    }, 
                    {
                        Key = true, 
                        Text = l_Localization_0:getText("Dialog", "Save"), 
                        Style = "RoundPrimary"
                    }
                }, 
                OnTextSubmitted = v203.setSelectedKeyframeDuration, 
                OnClose = v203.setChangingDuration
            })
        })
    });
end;
v41 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    PluginActions = l_ContextServices_0.PluginActions, 
    Stylizer = l_ContextServices_0.Stylizer
})(v41);
return v2.connect(function(v244) --[[ Line: 1012 ]] --[[ Name: mapStateToProps ]]
    local l_Status_0 = v244.Status;
    return {
        AnimationData = v244.AnimationData, 
        Active = l_Status_0.Active, 
        FrameRate = l_Status_0.FrameRate, 
        ReadOnly = l_Status_0.ReadOnly, 
        SelectedKeyframes = l_Status_0.SelectedKeyframes, 
        SelectedTracks = l_Status_0.SelectedTracks, 
        SnapMode = l_Status_0.SnapMode, 
        VerticalScroll = l_Status_0.VerticalScroll, 
        VerticalZoom = l_Status_0.VerticalZoom
    };
end, function(v246) --[[ Line: 1030 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v32 (copy), v22 (copy), v21 (copy), v33 (copy), v20 (copy), v34 (copy), v35 (copy), v36 (copy), v37 (copy), v38 (copy), v19 (copy), v39 (copy), v23 (copy)
    return {
        AddWaypoint = function() --[[ Line: 1032 ]] --[[ Name: AddWaypoint ]]
            -- upvalues: v246 (copy), v32 (ref)
            v246(v32());
        end, 
        DeselectAllKeyframes = function() --[[ Line: 1036 ]] --[[ Name: DeselectAllKeyframes ]]
            -- upvalues: v246 (copy), v22 (ref), v21 (ref)
            v246(v22({}));
            v246(v21({}));
        end, 
        DeselectKeyframe = function(v247, v248, v249) --[[ Line: 1041 ]] --[[ Name: DeselectKeyframe ]]
            -- upvalues: v246 (copy), v32 (ref), v33 (ref), v20 (ref)
            v246(v32());
            v246(v33(v247, v248, v249));
            v246(v20({}));
        end, 
        GenerateCurve = function(v250, v251) --[[ Line: 1047 ]] --[[ Name: GenerateCurve ]]
            -- upvalues: v246 (copy), v32 (ref), v34 (ref)
            v246(v32());
            v246(v34(v250, v251));
        end, 
        MoveSelectedKeyframes = function(v252, v253, v254, v255, v256) --[[ Line: 1052 ]] --[[ Name: MoveSelectedKeyframes ]]
            -- upvalues: v246 (copy), v35 (ref)
            v246(v35(v252, v253, v254, v255, v256));
        end, 
        ScaleSelectedKeyframes = function(v257, v258, v259) --[[ Line: 1062 ]] --[[ Name: ScaleSelectedKeyframes ]]
            -- upvalues: v246 (copy), v36 (ref)
            v246(v36(v257, v258, v259));
        end, 
        SelectKeyframeRange = function(v260, v261, v262, v263, v264) --[[ Line: 1066 ]] --[[ Name: SelectKeyframeRange ]]
            -- upvalues: v246 (copy), v21 (ref), v37 (ref)
            v246(v21({}));
            v246(v37(v260, v261, v262, v263, v264));
        end, 
        SetKeyframeTangent = function(v265, v266, v267, v268, v269) --[[ Line: 1077 ]] --[[ Name: SetKeyframeTangent ]]
            -- upvalues: v246 (copy), v38 (ref)
            v246(v38(v265, v266, v267, v268, v269));
        end, 
        SetPlayState = function(v270) --[[ Line: 1087 ]] --[[ Name: SetPlayState ]]
            -- upvalues: v246 (copy), v19 (ref)
            v246(v19(v270));
        end, 
        SetRightClickContextInfo = function(v271) --[[ Line: 1091 ]] --[[ Name: SetRightClickContextInfo ]]
            -- upvalues: v246 (copy), v20 (ref)
            v246(v20(v271));
        end, 
        SetSelectedKeyframes = function(v272) --[[ Line: 1095 ]] --[[ Name: SetSelectedKeyframes ]]
            -- upvalues: v246 (copy), v22 (ref)
            v246(v22(v272));
        end, 
        SetSelectedKeyframeData = function(v273) --[[ Line: 1099 ]] --[[ Name: SetSelectedKeyframeData ]]
            -- upvalues: v246 (copy), v32 (ref), v39 (ref)
            v246(v32());
            v246(v39(v273));
        end, 
        SetVerticalScrollZoom = function(v274, v275) --[[ Line: 1104 ]] --[[ Name: SetVerticalScrollZoom ]]
            -- upvalues: v246 (copy), v23 (ref)
            v246(v23(v274, v275));
        end
    };
end)(v41);