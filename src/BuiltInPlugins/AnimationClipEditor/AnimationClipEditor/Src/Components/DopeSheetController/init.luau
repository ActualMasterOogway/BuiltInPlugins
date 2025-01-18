local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v4 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v5 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v6 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_DragListener_0 = v6.UI.DragListener;
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_KeyboardListener_0 = v6.UI.KeyboardListener;
local v11 = require(l_script_FirstAncestor_0.Src.Actions.SetNotification);
local v12 = require(l_script_FirstAncestor_0.Src.Actions.SetPlayState);
local v13 = require(l_script_FirstAncestor_0.Src.Actions.SetRightClickContextInfo);
local v14 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local v15 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedEvents);
local v16 = require(l_script_FirstAncestor_0.Src.Components.DopeSheet);
local v17 = require(l_script_FirstAncestor_0.Src.Components.TrackList.TrackColors);
local v18 = require(l_script_FirstAncestor_0.Src.Components.EventsController);
local v19 = require(l_script_FirstAncestor_0.Src.Components.SelectionBox);
local v20 = require(l_script_FirstAncestor_0.Src.Components.TimelineActions);
local v21 = require(l_script_FirstAncestor_0.Src.Components.ScaleControls.ScaleControls);
local v22 = require(l_script_FirstAncestor_0.Src.Components.TextEntryPrompt);
local v23 = require(l_script_FirstAncestor_0.Src.Components.Toast.NoticeToast);
local v24 = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local v25 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.SelectKeyframeRange);
local v26 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.DeselectKeyframe);
local v27 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.SelectKeyframesAtTick);
local v28 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.DeselectKeyframesAtTick);
local v29 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.MoveSelectedKeyframes);
local v30 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.ScaleSelectedKeyframes);
local v31 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.SetSelectedKeyframeData);
local v32 = require(l_script_FirstAncestor_0.Src.Thunks.Selection.GenerateCurve);
local v33 = require(l_script_FirstAncestor_0.Src.Thunks.RenameKeyframe);
local _ = require(l_script_FirstAncestor_0.Src.Thunks.QuantizeKeyframes);
local v35 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v36 = require(l_script_FirstAncestor_0.Src.Util.DragContext);
local v37 = require(l_script_FirstAncestor_0.Src.Util.Input);
local v38 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v39 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local v40 = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local v41 = require(l_script_FirstAncestor_0.Src.Util.StringUtils);
local v42 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v43 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
local v44 = v1.Component:extend("DopeSheetController");
v44.init = function(v45) --[[ Line: 67 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v42 (copy), v35 (copy), v39 (copy), v40 (copy), v36 (copy), v38 (copy), v3 (copy), v41 (copy), v5 (copy)
    v45.state = {
        AbsoluteSize = Vector2.new(), 
        AbsolutePosition = Vector2.new(), 
        dragging = false, 
        draggingScale = false, 
        draggingSelection = false, 
        dragTick = nil, 
        showContextMenu = false, 
        renamingKeyframe = nil, 
        changingDuration = nil, 
        hasDragWaypoint = false
    };
    v45.DragContext = nil;
    v45.isMultiSelecting = false;
    v45.mouseDownOnKeyframe = false;
    v45.mouseDownInTimeline = false;
    v45.tracks = {};
    local v46, v47 = v1.createBinding(nil);
    v45.selectDragStart = v46;
    v45.updateSelectDragStart = v47;
    v46, v47 = v1.createBinding(nil);
    v45.selectDragEnd = v46;
    v45.updateSelectDragEnd = v47;
    v45.lastMinTick = nil;
    v45.lastMinTrack = nil;
    v45.lastMaxTick = nil;
    v45.lastMaxTrack = nil;
    v45.getTickFromPosition = function(v48, v49) --[[ Line: 95 ]]
        -- upvalues: v42 (ref), v45 (copy), v35 (ref), v39 (ref)
        local v50 = v42.getKeyframeFromPosition(v48, v45.props.StartTick, v45.props.EndTick, v45.state.AbsolutePosition.X + v45.props.TrackPadding / 2, v45.state.AbsoluteSize.X - v45.props.TrackPadding);
        if v49 and v45.props.SnapMode ~= v35.SNAP_MODES.None then
            v50 = v39.getNearestFrame(v50, v45.props.FrameRate);
        end;
        return v50;
    end;
    v45.getTrackFromPosition = function(v51) --[[ Line: 111 ]]
        -- upvalues: v45 (copy), v42 (ref), v40 (ref)
        local l_TopTrackIndex_0 = v45.props.TopTrackIndex;
        local v53 = v51.Y - v45.state.AbsolutePosition.Y;
        if v45.props.IsChannelAnimation then
            local v54, v55 = v42.getTrackInfoFromPosition(v45.tracks, l_TopTrackIndex_0, v53);
            return v54 + v40.getPathValue(v40.getRelativePath(v55));
        else
            return v42.getTrackFromPosition(v45.tracks, l_TopTrackIndex_0, v53);
        end;
    end;
    v45.getTrackInfoFromPosition = function(v56) --[[ Line: 124 ]]
        -- upvalues: v45 (copy), v42 (ref)
        local l_TopTrackIndex_1 = v45.props.TopTrackIndex;
        local v58 = v56.Y - v45.state.AbsolutePosition.Y;
        return v42.getTrackInfoFromPosition(v45.tracks, l_TopTrackIndex_1, v58);
    end;
    v45.addDragWaypoint = function() --[[ Line: 131 ]]
        -- upvalues: v45 (copy)
        if not v45.state.hasDragWaypoint then
            v45.props.AddWaypoint();
            v45:setState({
                hasDragWaypoint = true
            });
        end;
    end;
    v45.onScaleHandleDragStarted = function(v59) --[[ Line: 140 ]]
        -- upvalues: v45 (copy), v36 (ref)
        local l_SelectedKeyframes_0 = v45.props.SelectedKeyframes;
        local l_AnimationData_0 = v45.props.AnimationData;
        v45.DragContext = v36.new(l_AnimationData_0, l_SelectedKeyframes_0, v59);
        v45:setState({
            draggingScale = true, 
            dragTick = v59, 
            hasDragWaypoint = false
        });
    end;
    v45.onKeyframeDragStarted = function(v62) --[[ Line: 151 ]]
        -- upvalues: v45 (copy), v36 (ref)
        local l_SelectedKeyframes_1 = v45.props.SelectedKeyframes;
        local l_AnimationData_1 = v45.props.AnimationData;
        v45.DragContext = v36.new(l_AnimationData_1, l_SelectedKeyframes_1, v62);
        v45:setState({
            dragging = true, 
            dragTick = v62, 
            hasDragWaypoint = false
        });
    end;
    v45.onScaleHandleDragMoved = function(v65) --[[ Line: 162 ]]
        -- upvalues: v45 (copy)
        local v66 = v45.getTickFromPosition(v65.Position, true);
        if v45.state.dragTick ~= v66 and v45.DragContext then
            v45.addDragWaypoint();
            v45.DragContext:scaleKeyframes(v66, v45.props.StartTick);
            v45.props.ScaleSelectedKeyframes(v45.DragContext.pivotTick, v45.DragContext.scale, v45.DragContext);
            v45:setState({
                dragTick = v66
            });
        end;
    end;
    v45.onKeyframeDragMoved = function(v67) --[[ Line: 175 ]]
        -- upvalues: v45 (copy)
        local v68 = v45.getTickFromPosition(v67.Position, true);
        if v45.state.dragTick ~= v68 and v45.DragContext then
            v45.addDragWaypoint();
            v45.DragContext:moveKeyframes(v68);
            v45.props.MoveSelectedKeyframes(v45.DragContext.pivotTick, v45.DragContext.newTick, v45.DragContext);
            v45:setState({
                dragTick = v68
            });
        end;
    end;
    v45.onKeyframeDragEnded = function() --[[ Line: 187 ]]
        -- upvalues: v45 (copy), v1 (ref)
        v45.DragContext = nil;
        v45:setState({
            dragging = false, 
            dragTick = v1.None, 
            hasDragWaypoint = false
        });
    end;
    v45.onScaleHandleDragEnded = function() --[[ Line: 196 ]]
        -- upvalues: v45 (copy), v1 (ref)
        v45.DragContext = nil;
        v45:setState({
            draggingScale = false, 
            dragTick = v1.None, 
            hasDragWaypoint = false
        });
    end;
    v45.onSelectDragStarted = function(v69) --[[ Line: 205 ]]
        -- upvalues: v45 (copy)
        if not v45.state.showContextMenu and not v45.props.ReadOnly then
            v45.updateSelectDragStart(v69.Position);
            v45.updateSelectDragEnd(v69.Position);
            v45:setState({
                draggingSelection = true
            });
        end;
    end;
    v45.onSelectDragMoved = function(v70) --[[ Line: 213 ]]
        -- upvalues: v45 (copy), v35 (ref), v38 (ref), v42 (ref), v40 (ref)
        local l_props_0 = v45.props;
        local l_Position_0 = v70.Position;
        v45.updateSelectDragEnd(l_Position_0);
        local v73 = v45.selectDragStart:getValue();
        local l_SelectedKeyframes_2 = l_props_0.SelectedKeyframes;
        local l_IsChannelAnimation_0 = l_props_0.IsChannelAnimation;
        local v76 = Vector2.new(math.min(l_Position_0.X, v73.X), (math.min(l_Position_0.Y, v73.Y)));
        local v77 = Vector2.new(math.max(l_Position_0.X, v73.X), (math.max(l_Position_0.Y, v73.Y)));
        local l_StartTick_0 = l_props_0.StartTick;
        local l_EndTick_0 = l_props_0.EndTick;
        local v80 = (v45.state.AbsoluteSize.X - l_props_0.TrackPadding) / (l_EndTick_0 - l_StartTick_0);
        local v81 = Vector2.new(v80 / 2, v35.TRACK_HEIGHT / 2);
        local v82 = v45.getTickFromPosition(v76 + v81, false);
        local v83 = v45.getTrackFromPosition(v76 + v81);
        local v84 = v45.getTickFromPosition(v77 - v81, false);
        local v85 = v45.getTrackFromPosition(v77 - v81);
        local v86 = v45.lastMinTick or v82;
        local v87 = v45.lastMinTrack or v83;
        local v88 = v45.lastMaxTick or v84;
        local v89 = v45.lastMaxTrack or v85;
        if not v38(l_SelectedKeyframes_2) and (v86 < v82 or v87 < v83 or v84 < v88 or v85 < v89) then
            l_props_0.DeselectAllKeyframes();
        end;
        for v90, v91 in ipairs(v45.tracks) do
            if l_IsChannelAnimation_0 then
                local v92 = {};
                v42.traverseTracks(v91.Name, v91, function(_, _, v95) --[[ Line: 254 ]]
                    -- upvalues: v40 (ref), v90 (copy), v92 (copy), v83 (copy), v85 (copy), l_props_0 (copy), v91 (copy), v82 (copy), v84 (copy)
                    local v96 = v40.getPathValue(v40.getRelativePath(v95));
                    local v97 = v90 + v96;
                    if v92[v96] or v97 < v83 or v85 < v97 then
                        return;
                    else
                        v92[v96] = true;
                        l_props_0.SelectKeyframeRange(v91.Instance, v95, v82, v84, true);
                        return;
                    end;
                end);
            elseif v83 <= v90 and v90 <= v85 then
                l_props_0.SelectKeyframeRange(v91.Instance, {
                    v91.Name
                }, v82, v84, true);
            end;
        end;
        if v83 == 0 then
            local v98 = v42.getSummaryKeyframes(v45.tracks, v82, v84);
            if #v98 > 0 then
                v42.traverseKeyframeRange(v98, v82, v84, function(v99) --[[ Line: 274 ]]
                    -- upvalues: l_props_0 (copy)
                    l_props_0.SelectKeyframesAtTick(v99, true);
                end);
            end;
        end;
        v45.lastMinTick = v82;
        v45.lastMinTrack = v83;
        v45.lastMaxTick = v84;
        v45.lastMaxTrack = v85;
    end;
    v45.onSelectDragEnded = function() --[[ Line: 286 ]]
        -- upvalues: v45 (copy), v1 (ref)
        v45:setState({
            draggingSelection = v1.None
        });
        v45.updateSelectDragStart(nil);
        v45.updateSelectDragEnd(nil);
        v45.lastMinTick = nil;
        v45.lastMinTrack = nil;
        v45.lastMaxTick = nil;
        v45.lastMaxTrack = nil;
    end;
    v45.recalculateExtents = function(v100) --[[ Line: 298 ]]
        -- upvalues: v45 (copy)
        v45:setState({
            AbsoluteSize = v100.AbsoluteSize, 
            AbsolutePosition = v100.AbsolutePosition
        });
    end;
    v45.onEasingItemSelected = function(v101, v102) --[[ Line: 305 ]]
        -- upvalues: v45 (copy)
        local v103 = {
            [v101] = v102
        };
        v45.props.SetSelectedKeyframeData(v103);
    end;
    v45.onClearTangentsSelected = function(_, _) --[[ Line: 312 ]]
        -- upvalues: v3 (ref), v45 (copy)
        local v106 = {
            LeftSlope = v3.None, 
            RightSlope = v3.None
        };
        v45.props.SetSelectedKeyframeData(v106);
    end;
    v45.showMenu = function() --[[ Line: 320 ]]
        -- upvalues: v45 (copy), v35 (ref)
        v45.props.SetPlayState(v35.PLAY_STATE.Pause);
        v45:setState({
            showContextMenu = true
        });
    end;
    v45.hideMenu = function() --[[ Line: 327 ]]
        -- upvalues: v45 (copy)
        v45:setState({
            showContextMenu = false
        });
    end;
    v45.setRenamingKeyframe = function(v107) --[[ Line: 333 ]]
        -- upvalues: v45 (copy), v1 (ref)
        v45:setState({
            renamingKeyframe = v107 or v1.None
        });
    end;
    v45.setChangingDuration = function(v108) --[[ Line: 339 ]]
        -- upvalues: v45 (copy), v1 (ref)
        v45:setState({
            changingDuration = v108 or v1.None
        });
    end;
    v45.setSelectedKeyframeDuration = function(v109) --[[ Line: 345 ]]
        -- upvalues: v45 (copy), v41 (ref), v5 (ref)
        v45.setChangingDuration();
        local v110 = v41.parseTime(v109, v45.props.FrameRate, v45.props.TimelineUnit);
        if v110 ~= nil then
            local v111, v112 = v5.getSelectionBounds(v45.props.AnimationData, v45.props.SelectedKeyframes);
            local v113 = v110 / (v112 - v111);
            v45.props.ScaleSelectedKeyframes(v111, v113);
        end;
    end;
end;
v44.hasSelectedKeyframes = function(v114) --[[ Line: 358 ]] --[[ Name: hasSelectedKeyframes ]]
    -- upvalues: v38 (copy)
    local v115 = v114.DragContext and v114.DragContext.selectedKeyframe or v114.props.SelectedKeyframes;
    local v116 = false;
    if v115 ~= nil then
        v116 = not v38(v115);
    end;
    return v116;
end;
v44.multipleFramesSelected = function(v117) --[[ Line: 363 ]] --[[ Name: multipleFramesSelected ]]
    -- upvalues: v5 (copy)
    local v118 = v117.DragContext and v117.DragContext.animationData or v117.props.AnimationData;
    local v119 = v117.DragContext and v117.DragContext.selectedKeyframes or v117.props.SelectedKeyframes;
    local v120, v121 = v5.getSelectionBounds(v118, v119);
    return v119 and v120 ~= v121;
end;
v44.handleTimelineInputBegan = function(v122, v123, _) --[[ Line: 372 ]] --[[ Name: handleTimelineInputBegan ]]
    -- upvalues: v37 (copy)
    if v123.UserInputType == Enum.UserInputType.Keyboard then
        if v37.isMultiSelectKey(v123.KeyCode) then
            v122.isMultiSelecting = true;
            return;
        end;
    elseif v123.UserInputType == Enum.UserInputType.MouseButton1 then
        v122.props.DeselectAllKeyframes();
        v122.mouseDownInTimeline = true;
        v122.onSelectDragStarted(v123);
    end;
end;
v44.handleTimelineInputEnded = function(v125, v126) --[[ Line: 385 ]] --[[ Name: handleTimelineInputEnded ]]
    -- upvalues: v37 (copy), v42 (copy)
    if v126.UserInputType == Enum.UserInputType.Keyboard then
        if v37.isMultiSelectKey(v126.KeyCode) then
            v125.isMultiSelecting = false;
            return;
        end;
    elseif v126.UserInputType == Enum.UserInputType.MouseButton1 then
        v125.mouseDownInTimeline = false;
        return;
    elseif v126.UserInputType == Enum.UserInputType.MouseButton2 then
        local v127 = nil;
        local v128 = nil;
        local v129 = nil;
        local v130 = nil;
        local v131 = nil;
        if v125.props.IsChannelAnimation then
            local v132, v133, v134, v135 = v125.getTrackInfoFromPosition(v126.Position);
            v129 = v132;
            v127 = v133;
            v130 = v134;
            v131 = v135;
            v128 = v125.tracks[v129];
        else
            v129 = v125.getTrackFromPosition(v126.Position);
            v128 = v125.tracks[v129];
            if v128 then
                v127 = {
                    v128.Name
                };
                v130 = v128.Type;
                v131 = v42.getRotationType(v128);
            end;
        end;
        v125.props.SetRightClickContextInfo({
            Tick = v125.getTickFromPosition(v126.Position, true), 
            Path = v127, 
            TrackType = v130, 
            RotationType = v131, 
            InstanceName = v128 and v128.Instance or nil
        });
        v125.showMenu();
    end;
end;
v44.handleKeyframeRightClick = function(v136, v137, v138, v139, _) --[[ Line: 422 ]] --[[ Name: handleKeyframeRightClick ]]
    -- upvalues: v38 (copy)
    local v141 = {
        Tick = v139, 
        OnKeyframe = true
    };
    if v38(v136.props.SelectedKeyframes) then
        if v137 == nil then
            v136.props.SelectKeyframesAtTick(v139);
        else
            v136.props.SelectKeyframeRange(v137, v138, v139, v139, false);
        end;
    end;
    if v137 == nil then
        v141.SummaryKeyframe = v139;
    end;
    v136.props.SetRightClickContextInfo(v141);
    v136.showMenu();
end;
v44.handleKeyframeInputBegan = function(v142, v143, v144, v145, v146, v147) --[[ Line: 442 ]] --[[ Name: handleKeyframeInputBegan ]]
    if not v142.props.ReadOnly and v147.UserInputType == Enum.UserInputType.MouseButton1 then
        v142.mouseDownOnKeyframe = true;
        if v146 then
            if v142.isMultiSelecting then
                if v143 then
                    v142.props.DeselectKeyframe(v143, v144, v145);
                    return;
                else
                    v142.props.DeselectKeyframesAtTick(v145, v142.isMultiSelecting);
                    return;
                end;
            end;
        elseif v143 then
            v142.props.SelectKeyframeRange(v143, v144, v145, v145, v142.isMultiSelecting);
            return;
        else
            v142.props.SelectKeyframesAtTick(v145, v142.isMultiSelecting);
        end;
    end;
end;
v44.handleKeyframeInputEnded = function(v148, v149, v150, v151) --[[ Line: 466 ]] --[[ Name: handleKeyframeInputEnded ]]
    if v151.UserInputType == Enum.UserInputType.MouseMovement and v150 and v148.mouseDownOnKeyframe then
        v148.onKeyframeDragStarted(v149);
        v148.onKeyframeDragMoved(v151);
        v148.mouseDownOnKeyframe = false;
    end;
    if v151.UserInputType == Enum.UserInputType.MouseButton1 then
        v148.mouseDownOnKeyframe = false;
    end;
end;
v44.makeTracks = function(v152) --[[ Line: 481 ]] --[[ Name: makeTracks ]]
    -- upvalues: v4 (copy)
    local l_props_1 = v152.props;
    local l_AnimationData_2 = l_props_1.AnimationData;
    local l_Tracks_0 = l_props_1.Tracks;
    local v156 = {};
    local function v157(v158, v159) --[[ Line: 490 ]] --[[ Name: mergeTrackIntoTrackEntry ]]
        -- upvalues: v157 (copy)
        v158.Keyframes = v159.Keyframes;
        v158.Data = v159.Data;
        v158.IsCurveTrack = v159.IsCurveTrack;
        v158.EulerAnglesOrder = v159.EulerAnglesOrder;
        local l_pairs_0 = pairs;
        local v161 = v159.Components or {};
        for v162, v163 in l_pairs_0(v161) do
            if v158.Components then
                local v164 = v158.Components[v162];
                if v164 then
                    v157(v164, v163);
                end;
            end;
        end;
    end;
    for v165, v166 in ipairs(l_Tracks_0) do
        v156[v165] = v4(v166);
        if l_AnimationData_2 then
            for _, v168 in pairs(l_AnimationData_2.Instances) do
                for v169, v170 in pairs(v168.Tracks) do
                    if v166.Name == v169 then
                        v157(v156[v165], v170);
                    end;
                end;
            end;
        end;
    end;
    return v156;
end;
v44.shouldUpdate = function(v171, v172, v173) --[[ Line: 523 ]] --[[ Name: shouldUpdate ]]
    if v173 ~= v171.state then
        return true;
    else
        for v174, _ in pairs(v172) do
            if v172[v174] ~= v171.props[v174] then
                return true;
            end;
        end;
        return false;
    end;
end;
v44.render = function(v176) --[[ Line: 535 ]] --[[ Name: render ]]
    -- upvalues: v43 (copy), v5 (copy), v35 (copy), v1 (copy), v18 (copy), l_KeyboardListener_0 (copy), v16 (copy), l_DragListener_0 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), v23 (copy), v17 (copy)
    local l_props_2 = v176.props;
    local l_state_0 = v176.state;
    local l_dragging_0 = l_state_0.dragging;
    local l_draggingScale_0 = l_state_0.draggingScale;
    local l_draggingSelection_0 = l_state_0.draggingSelection;
    local l_AbsoluteSize_0 = l_state_0.AbsoluteSize;
    local l_AbsolutePosition_0 = l_state_0.AbsolutePosition;
    local l_showContextMenu_0 = l_state_0.showContextMenu;
    local l_renamingKeyframe_0 = l_state_0.renamingKeyframe;
    local l_changingDuration_0 = l_state_0.changingDuration;
    local l_Active_0 = l_props_2.Active;
    local l_AnimationData_3 = l_props_2.AnimationData;
    local l_SelectedKeyframes_3 = l_props_2.SelectedKeyframes;
    local l_StartTick_1 = l_props_2.StartTick;
    local l_EndTick_1 = l_props_2.EndTick;
    local l_TrackPadding_0 = l_props_2.TrackPadding;
    local l_TopTrackIndex_2 = l_props_2.TopTrackIndex;
    local l_ShowEvents_0 = l_props_2.ShowEvents;
    local l_Localization_0 = l_props_2.Localization;
    local l_FrameRate_0 = l_props_2.FrameRate;
    local v197 = if v43() then nil else l_props_2.ShowAsSeconds;
    local l_TimelineUnit_0 = l_props_2.TimelineUnit;
    local l_IsChannelAnimation_1 = l_props_2.IsChannelAnimation;
    local v200 = l_props_2.ColorsPosition or 0;
    local l_Tracks_1 = l_props_2.Tracks;
    local v202 = l_AnimationData_3 and l_AnimationData_3.Events and l_AnimationData_3.Events.NamedKeyframes or {};
    local _ = l_Localization_0:getText("Toast", "QuantizeWarning");
    local l_Loaded_0 = l_props_2.Loaded;
    local l_Saved_0 = l_props_2.Saved;
    local l_ClippedWarning_0 = l_props_2.ClippedWarning;
    local l_InvalidIdWarning_0 = l_props_2.InvalidIdWarning;
    local v208 = not l_ClippedWarning_0;
    local l_Size_0 = l_props_2.Size;
    local l_Position_1 = l_props_2.Position;
    local v211 = v176:hasSelectedKeyframes() and v176:multipleFramesSelected();
    local v212 = nil;
    if l_changingDuration_0 then
        local v213, v214 = v5.getSelectionBounds(v176.props.AnimationData, v176.props.SelectedKeyframes);
        v212 = (v214 - v213) * l_props_2.FrameRate / v35.TICK_FREQUENCY;
    end;
    v176.tracks = v176:makeTracks();
    if l_AnimationData_3 and l_AnimationData_3.Instances.Root then
        local l_createElement_0 = v1.createElement;
        local v216 = "Frame";
        local v217 = {
            Size = l_Size_0, 
            Position = l_Position_1, 
            BackgroundTransparency = 1, 
            ZIndex = l_props_2.ZIndex, 
            [v1.Event.InputChanged] = v176.props.OnInputChanged
        };
        local v218 = {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Events = l_ShowEvents_0 and v1.createElement(v18, {
                AbsolutePosition = l_AbsolutePosition_0 - Vector2.new(0, v35.TRACK_HEIGHT), 
                AbsoluteSize = Vector2.new(l_AbsoluteSize_0.X, v35.TRACK_HEIGHT), 
                AnimationData = l_AnimationData_3, 
                StartTick = l_StartTick_1, 
                EndTick = l_EndTick_1, 
                TrackPadding = l_TrackPadding_0
            })
        };
        local l_createElement_1 = v1.createElement;
        local v220 = "Frame";
        local v225 = {
            Size = l_ShowEvents_0 and UDim2.new(1, 0, 1, -v35.TRACK_HEIGHT) or UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            ClipsDescendants = true, 
            [v1.Change.AbsoluteSize] = v176.recalculateExtents, 
            [v1.Event.InputBegan] = function(_, v222) --[[ Line: 613 ]]
                -- upvalues: v176 (copy)
                if v222.UserInputType ~= Enum.UserInputType.Keyboard then
                    v176:handleTimelineInputBegan(v222);
                end;
            end, 
            [v1.Event.InputEnded] = function(_, v224) --[[ Line: 618 ]]
                -- upvalues: v176 (copy)
                if v224.UserInputType ~= Enum.UserInputType.Keyboard then
                    v176:handleTimelineInputEnded(v224);
                end;
            end
        };
        local v242 = {
            KeyboardListener = v1.createElement(l_KeyboardListener_0, {
                OnKeyPressed = function(v226, v227) --[[ Line: 625 ]] --[[ Name: OnKeyPressed ]]
                    -- upvalues: v176 (copy)
                    v176:handleTimelineInputBegan(v226, v227);
                end, 
                OnKeyReleased = function(v228) --[[ Line: 628 ]] --[[ Name: OnKeyReleased ]]
                    -- upvalues: v176 (copy)
                    v176:handleTimelineInputEnded(v228);
                end
            }), 
            DopeSheet = v1.createElement(v16, {
                Size = UDim2.new(1, 0, 1, 0), 
                ParentSize = l_AbsoluteSize_0, 
                Padding = l_props_2.TrackPadding, 
                StartTick = l_StartTick_1, 
                EndTick = l_EndTick_1, 
                TopTrackIndex = l_TopTrackIndex_2, 
                SelectedKeyframes = l_props_2.SelectedKeyframes, 
                SelectedEvents = l_props_2.SelectedEvents, 
                Tracks = v176.tracks, 
                IsChannelAnimation = l_IsChannelAnimation_1, 
                NamedKeyframes = v202, 
                TrackHeight = v35.TRACK_HEIGHT, 
                SummaryTrackHeight = v35.SUMMARY_TRACK_HEIGHT, 
                ZIndex = 1, 
                OnKeyRightClick = function(v229, v230, v231, v232) --[[ Line: 649 ]] --[[ Name: OnKeyRightClick ]]
                    -- upvalues: v176 (copy)
                    v176:handleKeyframeRightClick(v229, v230, v231, v232);
                end, 
                OnKeyInputBegan = function(v233, v234, v235, v236, v237) --[[ Line: 653 ]] --[[ Name: OnKeyInputBegan ]]
                    -- upvalues: v176 (copy)
                    v176:handleKeyframeInputBegan(v233, v234, v235, v236, v237);
                end, 
                OnKeyInputEnded = function(v238, v239, v240) --[[ Line: 657 ]] --[[ Name: OnKeyInputEnded ]]
                    -- upvalues: v176 (copy)
                    v176:handleKeyframeInputEnded(v238, v239, v240);
                end
            }), 
            DragTarget = l_dragging_0 and v1.createElement(l_DragListener_0, {
                OnDragMoved = v176.onKeyframeDragMoved, 
                OnDragEnded = v176.onKeyframeDragEnded
            }), 
            MultiSelectBox = l_draggingSelection_0 and v1.createElement(v19, {
                OnDragMoved = v176.onSelectDragMoved, 
                OnDragEnded = v176.onSelectDragEnded, 
                SelectionStart = v176.selectDragStart, 
                SelectionEnd = v176.selectDragEnd, 
                SourceExtents = Rect.new(l_AbsolutePosition_0, l_AbsolutePosition_0 + l_AbsoluteSize_0)
            }), 
            TimelineActions = l_Active_0 and v1.createElement(v20, {
                ShowMenu = l_showContextMenu_0, 
                MultipleSelected = v211, 
                IsChannelAnimation = l_IsChannelAnimation_1, 
                OnMenuOpened = v176.hideMenu, 
                OnItemSelected = v176.onEasingItemSelected, 
                OnClearTangentsSelected = v176.onClearTangentsSelected, 
                OnGenerateCurve = v176.props.GenerateCurve, 
                OnRenameKeyframe = function(v241) --[[ Line: 683 ]] --[[ Name: OnRenameKeyframe ]]
                    -- upvalues: v176 (copy)
                    spawn(function() --[[ Line: 685 ]]
                        -- upvalues: v176 (ref), v241 (copy)
                        v176.setRenamingKeyframe(v241);
                    end);
                end, 
                OnChangeDuration = function() --[[ Line: 689 ]] --[[ Name: OnChangeDuration ]]
                    -- upvalues: v176 (copy)
                    spawn(function() --[[ Line: 690 ]]
                        -- upvalues: v176 (ref)
                        v176.setChangingDuration(true);
                    end);
                end
            }), 
            ScaleControls = v211 and not l_draggingSelection_0 and v1.createElement(v21, {
                SelectedKeyframes = l_SelectedKeyframes_3, 
                StartTick = l_StartTick_1, 
                EndTick = l_EndTick_1, 
                TopTrackIndex = l_TopTrackIndex_2, 
                Tracks = v176.tracks, 
                TrackPadding = l_TrackPadding_0, 
                Dragging = l_draggingScale_0 or l_dragging_0, 
                ShowAsSeconds = if v43() then nil else v197, 
                TimelineUnit = l_TimelineUnit_0, 
                FrameRate = l_FrameRate_0, 
                DopeSheetWidth = l_AbsoluteSize_0.X - l_props_2.TrackPadding, 
                ZIndex = 2, 
                ShowSelectionArea = true, 
                IsChannelAnimation = l_IsChannelAnimation_1, 
                OnScaleHandleDragStart = v176.onScaleHandleDragStarted, 
                OnScaleHandleDragEnd = v176.onScaleHandleDragEnded, 
                OnScaleHandleDragMoved = v176.onScaleHandleDragMoved
            })
        };
        local v243 = false;
        if l_renamingKeyframe_0 ~= nil then
            v243 = v1.createElement(v22, {
                PromptText = l_Localization_0:getText("ContextMenu", "RenameKeyframe"), 
                InputText = l_Localization_0:getText("Menu", "RenameKeyframePrompt"), 
                Text = v202[l_renamingKeyframe_0] or v35.DEFAULT_KEYFRAME_NAME, 
                Buttons = {
                    {
                        Key = "Delete", 
                        Text = l_Localization_0:getText("Dialog", "Delete"), 
                        Style = "Round"
                    }, 
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
                OnButtonClicked = function(v244) --[[ Line: 725 ]] --[[ Name: OnButtonClicked ]]
                    -- upvalues: v176 (copy), l_props_2 (copy), l_renamingKeyframe_0 (copy), v35 (ref)
                    if v244 == "Delete" then
                        v176.setRenamingKeyframe();
                        l_props_2.RenameKeyframe(l_renamingKeyframe_0, v35.DEFAULT_KEYFRAME_NAME, l_props_2.Analytics);
                    end;
                end, 
                OnTextSubmitted = function(v245) --[[ Line: 731 ]] --[[ Name: OnTextSubmitted ]]
                    -- upvalues: v176 (copy), l_props_2 (copy), l_renamingKeyframe_0 (copy)
                    v176.setRenamingKeyframe();
                    l_props_2.RenameKeyframe(l_renamingKeyframe_0, v245, l_props_2.Analytics);
                end, 
                OnClose = v176.setRenamingKeyframe
            });
        end;
        v242.RenameKeyframePrompt = v243;
        v242.ChangeDurationPrompt = v212 and v1.createElement(v22, {
            PromptText = l_Localization_0:getText("Title", "ChangeDuration"), 
            InputText = l_Localization_0:getText("Title", "NewDuration"), 
            NoticeText = l_Localization_0:getText("Title", "CurrentDuration_Migrated", {
                currentDuration = v212
            }), 
            Text = v212, 
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
            OnTextSubmitted = v176.setSelectedKeyframeDuration, 
            OnClose = v176.setChangingDuration
        });
        v242.ClippedToast = l_ClippedWarning_0 and v1.createElement(v23, {
            Text = l_Localization_0:getText("Toast", "ClippedWarning"), 
            OnClose = l_props_2.CloseClippedToast
        });
        v242.SavedToast = l_Saved_0 and v1.createElement(v23, {
            Text = l_Localization_0:getText("Toast", "Saved_Migrated", {
                savedAnimName = l_Saved_0
            }), 
            OnClose = l_props_2.CloseSavedToast
        });
        v242.LoadedToast = v208 and l_Loaded_0 and v1.createElement(v23, {
            Text = l_Localization_0:getText("Toast", "Loaded_Migrated", {
                loadedAnimName = l_Loaded_0
            }), 
            OnClose = l_props_2.CloseLoadedToast
        });
        v242.InvalidId = l_InvalidIdWarning_0 and v1.createElement(v23, {
            Text = l_Localization_0:getText("Toast", "InvalidAnimation"), 
            OnClose = l_props_2.CloseInvalidAnimationToast
        });
        v218.DopeSheetContainer = l_createElement_1(v220, v225, v242);
        v218.IgnoreLayout = v1.createElement("Folder", {}, {
            TrackColors = v1.createElement(v17, {
                Tracks = l_Tracks_1, 
                TopTrackIndex = l_TopTrackIndex_2, 
                Position = UDim2.new(0, 0, 0, v200), 
                MaxHeight = l_AbsoluteSize_0.Y - v200
            })
        });
        return l_createElement_0(v216, v217, v218);
    else
        return v1.createElement("Frame", {
            Size = l_Size_0, 
            Position = l_Position_1, 
            BackgroundTransparency = 1, 
            [v1.Change.AbsoluteSize] = v176.recalculateExtents
        });
    end;
end;
v44 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Analytics = l_ContextServices_0.Analytics
})(v44);
return v2.connect(function(v246, _) --[[ Line: 800 ]] --[[ Name: mapStateToProps ]]
    local l_Status_0 = v246.Status;
    return {
        Active = l_Status_0.Active, 
        SelectedKeyframes = l_Status_0.SelectedKeyframes, 
        Clipboard = l_Status_0.Clipboard, 
        AnimationData = v246.AnimationData, 
        QuantizeWarning = v246.Notifications.QuantizeWarning, 
        Saved = v246.Notifications.Saved, 
        Loaded = v246.Notifications.Loaded, 
        ClippedWarning = v246.Notifications.ClippedWarning, 
        FrameRate = l_Status_0.FrameRate, 
        SnapMode = l_Status_0.SnapMode, 
        InvalidIdWarning = v246.Notifications.InvalidAnimation, 
        Tracks = l_Status_0.Tracks, 
        ReadOnly = l_Status_0.ReadOnly
    };
end, function(v249) --[[ Line: 822 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v24 (copy), v29 (copy), v30 (copy), v26 (copy), v15 (copy), v25 (copy), v27 (copy), v28 (copy), v14 (copy), v13 (copy), v31 (copy), v33 (copy), v11 (copy), v32 (copy), v12 (copy)
    return {
        AddWaypoint = function() --[[ Line: 824 ]] --[[ Name: AddWaypoint ]]
            -- upvalues: v249 (copy), v24 (ref)
            v249(v24());
        end, 
        MoveSelectedKeyframes = function(v250, v251, v252) --[[ Line: 828 ]] --[[ Name: MoveSelectedKeyframes ]]
            -- upvalues: v249 (copy), v29 (ref)
            v249(v29(v250, v251, nil, nil, v252));
        end, 
        ScaleSelectedKeyframes = function(v253, v254, v255) --[[ Line: 832 ]] --[[ Name: ScaleSelectedKeyframes ]]
            -- upvalues: v249 (copy), v30 (ref)
            v249(v30(v253, v254, v255));
        end, 
        DeselectKeyframe = function(v256, v257, v258) --[[ Line: 836 ]] --[[ Name: DeselectKeyframe ]]
            -- upvalues: v249 (copy), v26 (ref)
            v249(v26(v256, v257, v258));
        end, 
        SelectKeyframeRange = function(v259, v260, v261, v262, v263) --[[ Line: 840 ]] --[[ Name: SelectKeyframeRange ]]
            -- upvalues: v249 (copy), v15 (ref), v25 (ref)
            v249(v15({}));
            v249(v25(v259, v260, v261, v262, v263));
        end, 
        SelectKeyframesAtTick = function(v264, v265) --[[ Line: 845 ]] --[[ Name: SelectKeyframesAtTick ]]
            -- upvalues: v249 (copy), v15 (ref), v27 (ref)
            v249(v15({}));
            v249(v27(v264, v265));
        end, 
        DeselectKeyframesAtTick = function(v266, v267) --[[ Line: 850 ]] --[[ Name: DeselectKeyframesAtTick ]]
            -- upvalues: v249 (copy), v28 (ref)
            v249(v28(v266, v267));
        end, 
        DeselectAllKeyframes = function() --[[ Line: 854 ]] --[[ Name: DeselectAllKeyframes ]]
            -- upvalues: v249 (copy), v14 (ref), v15 (ref)
            v249(v14({}));
            v249(v15({}));
        end, 
        SetRightClickContextInfo = function(v268) --[[ Line: 859 ]] --[[ Name: SetRightClickContextInfo ]]
            -- upvalues: v249 (copy), v13 (ref)
            v249(v13(v268));
        end, 
        SetSelectedKeyframeData = function(v269) --[[ Line: 863 ]] --[[ Name: SetSelectedKeyframeData ]]
            -- upvalues: v249 (copy), v24 (ref), v31 (ref)
            v249(v24());
            v249(v31(v269));
        end, 
        RenameKeyframe = function(v270, v271, v272) --[[ Line: 868 ]] --[[ Name: RenameKeyframe ]]
            -- upvalues: v249 (copy), v24 (ref), v33 (ref)
            v249(v24());
            v249(v33(v270, v271, v272));
        end, 
        CloseSavedToast = function() --[[ Line: 873 ]] --[[ Name: CloseSavedToast ]]
            -- upvalues: v249 (copy), v11 (ref)
            v249(v11("Saved", false));
        end, 
        CloseLoadedToast = function() --[[ Line: 877 ]] --[[ Name: CloseLoadedToast ]]
            -- upvalues: v249 (copy), v11 (ref)
            v249(v11("Loaded", false));
        end, 
        CloseClippedToast = function() --[[ Line: 881 ]] --[[ Name: CloseClippedToast ]]
            -- upvalues: v249 (copy), v11 (ref)
            v249(v11("ClippedWarning", false));
        end, 
        CloseInvalidAnimationToast = function() --[[ Line: 885 ]] --[[ Name: CloseInvalidAnimationToast ]]
            -- upvalues: v249 (copy), v11 (ref)
            v249(v11("InvalidAnimation", false));
        end, 
        GenerateCurve = function(v273, v274) --[[ Line: 889 ]] --[[ Name: GenerateCurve ]]
            -- upvalues: v249 (copy), v24 (ref), v32 (ref)
            v249(v24());
            v249(v32(v273, v274));
        end, 
        SetPlayState = function(v275) --[[ Line: 894 ]] --[[ Name: SetPlayState ]]
            -- upvalues: v249 (copy), v12 (ref)
            v249(v12(v275));
        end
    };
end)(v44);