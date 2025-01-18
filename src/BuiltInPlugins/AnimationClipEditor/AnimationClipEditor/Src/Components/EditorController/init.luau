local _ = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_KeyboardListener_0 = v5.UI.KeyboardListener;
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_script_FirstAncestor_0.Src.Context.Signals);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v11 = require(l_Actions_0.SetCreatingAnimationFromVideo);
local v12 = require(l_Actions_0.SetEditorMode);
local v13 = require(l_Actions_0.SetEventEditingTick);
local v14 = require(l_Actions_0.SetFrameRate);
local v15 = require(l_Actions_0.SetGridSpeed);
local v16 = require(l_Actions_0.SetIsDirty);
local v17 = require(l_Actions_0.SetIsLegacyAnimSaves);
local v18 = require(l_Actions_0.SetLastSelectedPath);
local v19 = require(l_Actions_0.SetMotorData);
local v20 = require(l_Actions_0.SetPlayState);
local v21 = require(l_Actions_0.SetReduceKeyframesDialogMode);
local v22 = require(l_Actions_0.SetRightClickContextInfo);
local v23 = require(l_Actions_0.SetSelectedTracks);
local v24 = require(l_Actions_0.SetSelectedTrackInstances);
local v25 = require(l_Actions_0.SetTopTrackIndex);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v27 = require(l_Components_0.AnimationControlPanel.AnimationControlPanel);
local v28 = require(l_Components_0.TrackList.AnimationEventsTrack);
local v29 = require(l_Components_0.ChangeFPSPrompt);
local v30 = require(l_Components_0.ChangeGridSpeedPrompt);
local v31 = require(l_Components_0.ChangePlaybackSpeedPrompt);
local v32 = require(l_Components_0.FacialAnimationRecorder.FacialAnimationRecorder);
local v33 = require(l_Components_0.FloorGrid);
local v34 = require(l_Components_0.InactiveCover);
local v35 = require(l_Components_0.InstanceSelector);
local v36 = require(l_Components_0.MigrationDialog);
local v37 = require(l_Components_0.Playback);
local v38 = require(l_Components_0.ProgressScreen);
local v39 = require(l_Components_0.PromoteToCurvesPrompt);
local v40 = require(l_Components_0.RecordingModeCover);
local v41 = require(l_Components_0.ReduceKeyframesDialog);
local v42 = require(l_Components_0.SettingsButton);
local v43 = require(l_Components_0.StartScreen);
local v44 = require(l_Components_0.TrackActions);
local v45 = require(l_Components_0.TrackList.TrackColors);
local v46 = require(l_Components_0.TrackEditor);
local v47 = require(l_Components_0.TrackList.TrackList);
local v48 = require(l_Components_0.TrackList.TrackListBorder);
local v49 = require(l_Components_0.TrackList.TrackScrollbar);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v51 = require(l_Thunks_0.AddTrack);
local v52 = require(l_Thunks_0.History.AddWaypoint);
local v53 = require(l_Thunks_0.AttachEditor);
local v54 = require(l_Thunks_0.CancelAnimationFromVideoImport);
local v55 = require(l_Thunks_0.LoadAnimationData);
local v56 = require(l_Thunks_0.MoveSelectedTrack);
local v57 = require(l_Thunks_0.PromoteKeyframeSequence);
local v58 = require(l_Thunks_0.ReleaseEditor);
local v59 = require(l_Thunks_0.Playback.SetPlaybackSpeed);
local v60 = require(l_Thunks_0.SetSelectedTracks);
local v61 = require(l_Thunks_0.SetTopTrackIndex);
local v62 = require(l_Thunks_0.SetTracksExpanded);
local v63 = require(l_Thunks_0.SortAndSetSelectedTrackInstances);
local v64 = require(l_Thunks_0.SwitchEditorMode);
local v65 = require(l_Thunks_0.ValueChanged);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v67 = require(l_Util_0.AnimationData);
local v68 = require(l_Util_0.Constants);
local v69 = require(l_Util_0.Input);
local v70 = require(l_Util_0.PathUtils);
local v71 = require(l_Util_0.RigInfo);
local v72 = require(l_Util_0.RigUtils);
local v73 = require(l_Util_0.TrackUtils);
local v74 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagFacialAnimationRecordingInStudio);
local v75 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local v76 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagMultiSelectionTransform);
local v77 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
local v78 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagResetTopTrackIndex);
local v79 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagGridSpeed);
local v80 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
local v81 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagRenameClip);
local v82 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagGridVisualization);
local v83 = v3.PureComponent:extend("EditorController");
v83.init = function(v84) --[[ Line: 103 ]] --[[ Name: init ]]
    -- upvalues: v77 (copy), v68 (copy), v78 (copy), v70 (copy), v2 (copy), v71 (copy), v76 (copy), v67 (copy), v81 (copy), v73 (copy)
    v84.state = {
        TopTrackIndex = not v77() and 1 or nil, 
        AbsoluteSize = Vector2.new(), 
        TrackListWidth = v68.TRACK_LIST_START_WIDTH, 
        showContextMenu = false, 
        showChangeFPSPrompt = false, 
        showChangeGridSpeedPrompt = false, 
        showChangePlaybackSpeedPrompt = false, 
        showPromotePrompt = false
    };
    v84.nameToPart = {};
    v84.showChangeFPSPrompt = function() --[[ Line: 117 ]]
        -- upvalues: v84 (copy)
        v84:setState({
            showChangeFPSPrompt = true
        });
    end;
    v84.hideChangeFPSPrompt = function() --[[ Line: 123 ]]
        -- upvalues: v84 (copy)
        v84:setState({
            showChangeFPSPrompt = false
        });
    end;
    v84.showChangeGridSpeedPrompt = function() --[[ Line: 129 ]]
        -- upvalues: v84 (copy)
        v84:setState({
            showChangeGridSpeedPrompt = true
        });
    end;
    v84.hideChangeGridSpeedPrompt = function() --[[ Line: 135 ]]
        -- upvalues: v84 (copy)
        v84:setState({
            showChangeGridSpeedPrompt = false
        });
    end;
    v84.showChangePlaybackSpeedPrompt = function() --[[ Line: 141 ]]
        -- upvalues: v84 (copy)
        v84:setState({
            showChangePlaybackSpeedPrompt = true
        });
    end;
    v84.hideChangePlaybackSpeedPrompt = function() --[[ Line: 147 ]]
        -- upvalues: v84 (copy)
        v84:setState({
            showChangePlaybackSpeedPrompt = false
        });
    end;
    v84.hideReduceKeyframesDialog = function() --[[ Line: 153 ]]
        -- upvalues: v84 (copy), v68 (ref)
        v84.props.SetReduceKeyframesDialogMode(v68.REDUCE_KEYFRAMES_DIALOG_MODE.Hidden);
    end;
    v84.setTopTrackIndex = not v78() and function(v85) --[[ Line: 158 ]]
        -- upvalues: v84 (copy), v77 (ref)
        local l_Tracks_0 = v84.props.Tracks;
        if #l_Tracks_0 > 0 then
            if v77() then
                v84.props.SetTopTrackIndex_ACTION((math.clamp(v85, 1, #l_Tracks_0)));
                return;
            else
                v84:setState({
                    TopTrackIndex = math.clamp(v85, 1, #l_Tracks_0)
                });
            end;
        end;
    end or nil;
    v84.onScroll = function(v87) --[[ Line: 172 ]]
        -- upvalues: v77 (ref), v78 (ref), v84 (copy)
        local v88 = if not not v77() or v78() then v84.props.TopTrackIndex else v84.state.TopTrackIndex;
        if v78() then
            v84.props.SetTopTrackIndex(v88 - (v87 > 0 and 1 or -1));
            return;
        else
            v84.setTopTrackIndex(v88 - (v87 > 0 and 1 or -1));
            return;
        end;
    end;
    v84.onSizeUpdate = function(v89) --[[ Line: 183 ]]
        -- upvalues: v84 (copy), v68 (ref)
        local v90 = math.min(v84.state.TrackListWidth, v89.AbsoluteSize.X - v68.TIMELINE_MIN_WIDTH);
        v84:setState({
            AbsoluteSize = v89.AbsoluteSize, 
            TrackListWidth = v90
        });
    end;
    v84.showMenu = function(v91, v92, v93, v94) --[[ Line: 191 ]]
        -- upvalues: v84 (copy), v68 (ref)
        v84.props.SetPlayState(v68.PLAY_STATE.Pause);
        v84.props.SetRightClickContextInfo({
            Path = v92, 
            TrackType = v93, 
            RotationType = v94, 
            InstanceName = v91
        });
        v84:setState({
            showContextMenu = true
        });
    end;
    v84.hideMenu = function() --[[ Line: 204 ]]
        -- upvalues: v84 (copy)
        v84:setState({
            showContextMenu = false
        });
    end;
    v84.showPromotePrompt = function() --[[ Line: 210 ]]
        -- upvalues: v84 (copy)
        v84:setState({
            showPromotePrompt = true
        });
    end;
    v84.hidePromotePrompt = function() --[[ Line: 216 ]]
        -- upvalues: v84 (copy)
        v84:setState({
            showPromotePrompt = false
        });
    end;
    v84.cancelCreateFromVideo = function() --[[ Line: 222 ]]
        -- upvalues: v84 (copy)
        v84.props.CancelAnimationFromVideoImport(v84.props.Analytics);
    end;
    v84.updateTrackListWidth = function(v95) --[[ Line: 226 ]]
        -- upvalues: v68 (ref), v84 (copy)
        local v96 = math.clamp(v95.Position.X, v68.TRACK_LIST_MIN_WIDTH, v84.state.AbsoluteSize.X - v68.TIMELINE_MIN_WIDTH);
        v84:setState({
            TrackListWidth = v96
        });
    end;
    v84.controlSelectTrack = function(v97) --[[ Line: 235 ]]
        -- upvalues: v84 (copy), v70 (ref), v2 (ref)
        local l_props_0 = v84.props;
        local l_SelectedTracks_0 = l_props_0.SelectedTracks;
        local l_SetSelectedTracks_0 = l_props_0.SetSelectedTracks;
        if l_SelectedTracks_0 and v70.findPath(l_SelectedTracks_0, v97) then
            l_SetSelectedTracks_0(v70.removePath(l_SelectedTracks_0, v97));
            return;
        else
            l_props_0.SetLastSelectedPath(v97);
            l_SetSelectedTracks_0(v2.List.join(l_SelectedTracks_0 or {}, {
                v97
            }));
            return;
        end;
    end;
    v84.shiftSelectTrack = function(v101) --[[ Line: 248 ]]
        -- upvalues: v84 (copy)
        local l_props_1 = v84.props;
        local l_Tracks_1 = l_props_1.Tracks;
        local l_SetSelectedTracks_1 = l_props_1.SetSelectedTracks;
        local v105 = nil;
        local v106 = nil;
        local l_LastSelectedPath_0 = v84.props.LastSelectedPath;
        for v108, v109 in ipairs(l_Tracks_1) do
            if l_LastSelectedPath_0 and v109.Name == l_LastSelectedPath_0[1] then
                v106 = v108;
            elseif v109.Name == v101[1] then
                v105 = v108;
            end;
        end;
        if v105 ~= nil and v106 ~= nil then
            local v110 = math.min(v105, v106);
            local v111 = math.max(v105, v106);
            local v112 = {};
            for v113 = v110, v111 do
                table.insert(v112, {
                    l_Tracks_1[v113].Name
                });
            end;
            l_SetSelectedTracks_1(v112);
            return;
        else
            v84.props.SetLastSelectedPath(v101);
            l_SetSelectedTracks_1({
                v101
            });
            return;
        end;
    end;
    v84.findCurrentParts = not v77() and function(v114, v115) --[[ Line: 277 ]]
        -- upvalues: v71 (ref), v84 (copy), v76 (ref)
        local v116 = {};
        if v115 == nil then
            return;
        else
            local v117 = v71.getRigInfo(v115);
            v84.KinematicParts = v117.Parts;
            v84.PartsToMotors = v117.PartNameToMotor;
            if v114 and v115 and v84.KinematicParts and #v84.KinematicParts > 0 then
                for _, v119 in ipairs(v114) do
                    local v120 = v119[1];
                    local v121 = v71.getBoneByName(v115, v120);
                    if v121 then
                        table.insert(v116, v121);
                    else
                        table.insert(v116, v84.nameToPart[v120]);
                    end;
                end;
            end;
            if v76() then
                if v116 and #v116 > 0 then
                    v84.props.SortAndSetSelectedTrackInstances(v116);
                    return;
                end;
            else
                local l_SetSelectedTrackInstances_0 = v84.props.SetSelectedTrackInstances;
                if v116 and #v116 > 0 then
                    l_SetSelectedTrackInstances_0(v116);
                end;
            end;
            return;
        end;
    end or nil;
    v84.onTrackSelected = function(v123) --[[ Line: 312 ]]
        -- upvalues: v84 (copy), v67 (ref), v77 (ref)
        local l_props_2 = v84.props;
        local l_SetSelectedTracks_2 = l_props_2.SetSelectedTracks;
        local l_AnimationData_0 = v84.props.AnimationData;
        local l_EditorMode_0 = v84.props.EditorMode;
        if v84.controlDown then
            v84.controlSelectTrack(v123);
        elseif not v67.isChannelAnimation(l_AnimationData_0) and v84.shiftDown then
            v84.shiftSelectTrack(v123);
        else
            l_props_2.SetLastSelectedPath(v123);
            l_SetSelectedTracks_2({
                v123
            });
        end;
        if not v77() then
            v84.findCurrentParts({
                v123
            }, l_props_2.RootInstance);
        end;
        l_props_2.Analytics:report("onTrackSelected", v123[1], "TrackList", l_EditorMode_0, if l_AnimationData_0 and l_AnimationData_0.Metadata then l_AnimationData_0.Metadata.Guid else nil);
    end;
    v84.addTrackWrapper = function(v128, v129, v130) --[[ Line: 339 ]]
        -- upvalues: v84 (copy)
        v84.props.AddTrack(v128, v129, v130, nil, nil, v84.props.Analytics);
    end;
    v84.createAnimationWrapper = if v81() then nil else function(v131) --[[ Line: 345 ]]
        -- upvalues: v84 (copy)
        v84.props.CreateAnimation(v131, v84.props.Analytics);
    end;
    v84.attachEditorWrapper = function() --[[ Line: 349 ]]
        -- upvalues: v84 (copy)
        v84.props.AttachEditor(v84.props.Analytics);
    end;
    v84.applyValueToFacsSliderPartners = function(v132, v133, v134, v135, v136) --[[ Line: 353 ]]
        -- upvalues: v68 (ref), v84 (copy)
        if v134 ~= v68.TRACK_TYPES.Facs then
            return;
        else
            local v137 = v133[1];
            local v138 = v68.FacsCrossMappings[v137];
            if v136 ~= 0 then
                local v139 = {
                    [v68.FacsNames.EyesLookLeft] = v68.FacsNames.EyesLookRight, 
                    [v68.FacsNames.EyesLookRight] = v68.FacsNames.EyesLookLeft, 
                    [v68.FacsNames.EyesLookUp] = v68.FacsNames.EyesLookUp, 
                    [v68.FacsNames.EyesLookDown] = v68.FacsNames.EyesLookDown
                };
                if v139[v137] then
                    v84.props.ValueChanged(v132, {
                        v139[v137]
                    }, v68.TRACK_TYPES.Facs, nil, v135, 0, v84.props.Analytics);
                end;
            end;
            if v138 ~= nil then
                local l_sliderGroup_0 = v138.sliderGroup;
                if l_sliderGroup_0 and v136 > 0 then
                    local v141 = nil;
                    v141 = if v138.indexInGroup == 1 then l_sliderGroup_0[2] else l_sliderGroup_0[1];
                    v84.props.ValueChanged(v132, {
                        v141
                    }, v68.TRACK_TYPES.Facs, nil, v135, 0, v84.props.Analytics);
                end;
                if v84.props.SymmetryEnabled then
                    local l_symmetryPartner_0 = v138.symmetryPartner;
                    if l_symmetryPartner_0 then
                        v84.applyValueToSymmetryPartner(v132, l_symmetryPartner_0, v134, v135, v136);
                    end;
                end;
            end;
            return;
        end;
    end;
    v84.applyValueToSymmetryPartner = function(v143, v144, v145, v146, v147) --[[ Line: 417 ]]
        -- upvalues: v84 (copy), v68 (ref)
        v84.props.ValueChanged(v143, {
            v144
        }, v145, nil, v146, v147, v84.props.Analytics);
        if v147 == nil or v147 <= 0 then
            return;
        else
            local v148 = v68.FacsCrossMappings[v144];
            local l_sliderGroup_1 = v148.sliderGroup;
            if not l_sliderGroup_1 then
                return;
            else
                local v150 = nil;
                v150 = if v148.indexInGroup == 1 then l_sliderGroup_1[2] else l_sliderGroup_1[1];
                v84.props.ValueChanged(v143, {
                    v150
                }, v145, nil, v146, 0, v84.props.Analytics);
                return;
            end;
        end;
    end;
    v84.onValueChanged = function(v151, v152, v153, v154, v155, v156) --[[ Line: 439 ]]
        -- upvalues: v84 (copy), v67 (ref), v68 (ref), v73 (ref), v2 (ref)
        local l_AnimationData_1 = v84.props.AnimationData;
        if not v67.isChannelAnimation(l_AnimationData_1) then
            v84.props.ValueChanged(v151, v152, v153, v154, v155, v156, v84.props.Analytics);
        else
            local l_DefaultEulerAnglesOrder_0 = v84.props.DefaultEulerAnglesOrder;
            local v159 = v152[1];
            local v160 = v67.getTrack(l_AnimationData_1, v151, {
                v159
            });
            if v160 and v160.Components and v160.Components[v68.PROPERTY_KEYS.Rotation] then
                v154 = v160.Components[v68.PROPERTY_KEYS.Rotation].Type;
                if v154 == v68.TRACK_TYPES.EulerAngles then
                    l_DefaultEulerAnglesOrder_0 = v160.EulerAnglesOrder;
                end;
            end;
            v73.traverseValue(v153, v156, function(v161, v162, v163) --[[ Line: 455 ]]
                -- upvalues: v84 (ref), v151 (copy), v2 (ref), v152 (copy), v154 (ref), v155 (copy)
                v84.props.ValueChanged(v151, v2.List.join(v152, v162), v161, v154, v155, v163, v84.props.Analytics);
            end, v154, l_DefaultEulerAnglesOrder_0);
        end;
        if v153 == v68.TRACK_TYPES.Facs then
            v84.applyValueToFacsSliderPartners(v151, v152, v153, v155, v156);
        end;
    end;
    v84.promoteKeyframeSequence = function() --[[ Line: 472 ]]
        -- upvalues: v84 (copy), v68 (ref)
        v84.props.PromoteKeyframeSequence(v84.props.Analytics);
        v84.props.SwitchEditorMode(v68.EDITOR_MODE.CurveCanvas, v84.props.Analytics);
    end;
end;
v83.didUpdate = function(v164, v165) --[[ Line: 478 ]] --[[ Name: didUpdate ]]
    -- upvalues: v77 (copy), v71 (copy), v68 (copy)
    if (v165.RootInstance ~= v164.props.RootInstance or next(v164.nameToPart) == nil) and v164.props.RootInstance ~= nil then
        if v77() then
            local l_Parts_0 = v71.getRigInfo(v164.props.RootInstance).Parts;
            for _, v168 in ipairs(l_Parts_0) do
                v164.nameToPart[v168.Name] = v168;
            end;
        else
            local v169 = v71.getRigInfo(v164.props.RootInstance);
            v164.KinematicParts = v169.Parts;
            v164.PartsToMotors = v169.PartNameToMotor;
            for _, v171 in ipairs(v164.KinematicParts) do
                v164.nameToPart[v171.Name] = v171;
            end;
        end;
    end;
    if not v77() and v165.SelectedTracks ~= v164.props.SelectedTracks then
        v164.findCurrentParts(v164.props.SelectedTracks, v164.props.RootInstance);
    end;
    if v165.Playhead ~= v164.props.Playhead then
        v164.props.Signals:get(v68.SIGNAL_KEYS.ScrubberChanged):Fire();
    end;
end;
v83.render = function(v172) --[[ Line: 512 ]] --[[ Name: render ]]
    -- upvalues: v80 (copy), v77 (copy), v78 (copy), v68 (copy), v67 (copy), v73 (copy), v79 (copy), v3 (copy), v27 (copy), v76 (copy), v28 (copy), v47 (copy), v49 (copy), l_KeyboardListener_0 (copy), v69 (copy), v45 (copy), v48 (copy), v46 (copy), v42 (copy), v43 (copy), v81 (copy), v37 (copy), v74 (copy), v32 (copy), v40 (copy), v35 (copy), v82 (copy), v33 (copy), v44 (copy), v34 (copy), v38 (copy), v29 (copy), v30 (copy), v31 (copy), v39 (copy), v41 (copy), v36 (copy)
    local l_props_3 = v172.props;
    local l_state_0 = v172.state;
    local l_Stylizer_0 = l_props_3.Stylizer;
    local v176 = 0;
    local v177 = 0;
    local v178 = 0;
    local l_Active_0 = l_props_3.Active;
    local l_Playhead_0 = l_props_3.Playhead;
    local v181 = if v80() then nil else l_props_3.ShowAsSeconds;
    local l_TimelineUnit_0 = l_props_3.TimelineUnit;
    local l_EditingLength_0 = l_props_3.EditingLength;
    local v184 = if not not v77() or v78() then l_props_3.TopTrackIndex else l_state_0.TopTrackIndex;
    local l_TrackListWidth_0 = l_state_0.TrackListWidth;
    local l_Tracks_2 = l_props_3.Tracks;
    local l_UnusedTracks_0 = l_props_3.UnusedTracks;
    local l_UnusedFacs_0 = l_props_3.UnusedFacs;
    local l_HorizontalScroll_0 = l_props_3.HorizontalScroll;
    local l_HorizontalZoom_0 = l_props_3.HorizontalZoom;
    local l_VerticalScroll_0 = l_props_3.VerticalScroll;
    local l_VerticalZoom_0 = l_props_3.VerticalZoom;
    local l_AnimationData_2 = l_props_3.AnimationData;
    local l_ShowEvents_0 = l_props_3.ShowEvents;
    local l_SelectedTracks_1 = l_props_3.SelectedTracks;
    local l_RootInstance_0 = l_props_3.RootInstance;
    local l_AbsoluteSize_0 = l_state_0.AbsoluteSize;
    local v198 = l_props_3.PlayState == v68.PLAY_STATE.Record;
    local l_inReviewState_0 = l_props_3.inReviewState;
    local l_showChangeFPSPrompt_0 = l_state_0.showChangeFPSPrompt;
    local l_showChangeGridSpeedPrompt_0 = l_state_0.showChangeGridSpeedPrompt;
    local l_showChangePlaybackSpeedPrompt_0 = l_state_0.showChangePlaybackSpeedPrompt;
    local v203 = l_AnimationData_2 ~= nil;
    local l_VisualizeGrid_0 = l_props_3.VisualizeGrid;
    local l_showPromotePrompt_0 = l_state_0.showPromotePrompt;
    local v206 = v67.isChannelAnimation(l_AnimationData_2);
    local l_CreatingAnimationFromVideo_0 = l_props_3.CreatingAnimationFromVideo;
    local l_AnimationImportProgress_0 = l_props_3.AnimationImportProgress;
    local l_AnimationImportStatus_0 = l_props_3.AnimationImportStatus;
    if l_AnimationData_2 then
        local v210 = v73.getZoomRange(l_props_3.AnimationData, l_HorizontalScroll_0, l_HorizontalZoom_0, l_EditingLength_0);
        v176 = v210.Start;
        v177 = v210.End;
        v178 = l_AnimationData_2.Metadata.EndTick;
    end;
    l_ShowEvents_0 = l_ShowEvents_0 and v203;
    local v211 = nil;
    v211 = if l_props_3.RootInstance and l_props_3.RootInstance.Name then l_props_3.RootInstance.Name else "";
    local v212 = l_props_3.ZIndex or 1;
    local l_Position_0 = l_props_3.Position;
    local l_Size_0 = l_props_3.Size;
    local v215 = (l_ShowEvents_0 and v68.TRACK_HEIGHT or 0) + v68.SUMMARY_TRACK_HEIGHT;
    local v216 = l_props_3.EditorMode == v68.EDITOR_MODE.DopeSheet;
    local v217 = l_props_3.ReduceKeyframesDialogMode ~= v68.REDUCE_KEYFRAMES_DIALOG_MODE.Hidden;
    local v218 = l_props_3.LegacyAnimationInstances and #l_props_3.LegacyAnimationInstances > 0;
    local l_GridSpeed_0 = l_props_3.GridSpeed;
    if v79() and l_GridSpeed_0 == v68.GRIDSPEEDS.FromRig then
        local v220 = l_props_3.RootInstance and l_props_3.RootInstance:FindFirstChildOfClass("Humanoid");
        l_GridSpeed_0 = if v220 then v220.WalkSpeed else 0;
    end;
    return v3.createElement("Frame", {
        BackgroundTransparency = 1, 
        ZIndex = v212, 
        Position = l_Position_0, 
        Size = l_Size_0, 
        [v3.Change.AbsoluteSize] = v172.onSizeUpdate
    }, {
        Layout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        TrackListAndControlContainer = v3.createElement("Frame", {
            BackgroundTransparency = 0, 
            BackgroundColor3 = l_Stylizer_0.backgroundColor, 
            BorderSizePixel = 0, 
            Size = UDim2.new(0, l_TrackListWidth_0, 1, 0), 
            LayoutOrder = 0, 
            ZIndex = 2
        }, {
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            AnimationControlPanel = v3.createElement(v27, {
                StartTick = v176, 
                EndTick = v177, 
                Playhead = l_Playhead_0, 
                EditingLength = l_EditingLength_0, 
                AnimationData = l_props_3.AnimationData, 
                IsLegacyAnimSaves = l_props_3.IsLegacyAnimSaves, 
                ShowAsSeconds = if v80() then nil else v181, 
                TimelineUnit = l_TimelineUnit_0, 
                IsChannelAnimation = v206, 
                LayoutOrder = 0
            }), 
            EventsAndTracks = v3.createElement("ImageButton", {
                Size = UDim2.new(0, l_TrackListWidth_0, 1, -v68.TIMELINE_HEIGHT), 
                BackgroundTransparency = 1, 
                ImageTransparency = 1, 
                LayoutOrder = 1, 
                [v3.Event.Activated] = function() --[[ Line: 632 ]]
                    -- upvalues: v76 (ref), l_props_3 (copy), v77 (ref)
                    if v76() then
                        l_props_3.ClearSelectedTrackInstances();
                        l_props_3.SetLastSelectedPath(nil);
                        return;
                    else
                        l_props_3.SetLastSelectedPath(nil);
                        l_props_3.SetSelectedTracks({});
                        if not v77() then
                            l_props_3.SetSelectedTrackInstances({});
                        end;
                        return;
                    end;
                end
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                EventsTitle = l_ShowEvents_0 and v3.createElement(v28, {
                    LayoutOrder = 0, 
                    Indent = 1, 
                    OnButtonClick = function() --[[ Line: 654 ]] --[[ Name: OnButtonClick ]]
                        -- upvalues: l_props_3 (copy), l_Playhead_0 (copy)
                        l_props_3.SetEventEditingTick(l_Playhead_0);
                    end
                }), 
                TrackListAndScrollBar = v3.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, l_ShowEvents_0 and -v68.TRACK_HEIGHT or 0), 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0
                }, {
                    TrackList = v3.createElement(v47, {
                        Size = UDim2.new(1, -v68.SCROLL_BAR_SIZE - 1, 1, 0), 
                        TopTrackIndex = v184, 
                        Tracks = l_Tracks_2, 
                        SelectedTracks = l_SelectedTracks_1, 
                        UnusedTracks = l_UnusedTracks_0, 
                        UnusedFacs = l_UnusedFacs_0, 
                        AnimationData = l_AnimationData_2, 
                        Playhead = l_Playhead_0, 
                        RootName = v211, 
                        OnScroll = v172.onScroll, 
                        OpenContextMenu = v172.showMenu, 
                        ToggleTrackExpanded = l_props_3.SetTracksExpanded, 
                        OnTrackAdded = v172.addTrackWrapper, 
                        OnValueChanged = v172.onValueChanged, 
                        OnChangeBegan = l_props_3.AddWaypoint, 
                        OnTrackSelected = v172.onTrackSelected
                    }), 
                    TrackScrollbarFrame = v3.createElement("Frame", {
                        Size = UDim2.new(0, v68.SCROLL_BAR_SIZE, 1, 0), 
                        Position = UDim2.new(1, -v68.SCROLL_BAR_SIZE, 0, 0), 
                        BackgroundColor3 = l_Stylizer_0.scrollBarTheme.backgroundColor
                    }, {
                        TrackScrollbar = v3.createElement(v49, {
                            Size = UDim2.new(1, 0, 1, -v68.SCROLL_BAR_SIZE - 1), 
                            TopTrackIndex = v184, 
                            NumTracks = l_Tracks_2 and #l_Tracks_2 or 0, 
                            SetTopTrackIndex = if v78() then v172.props.SetTopTrackIndex else v172.setTopTrackIndex, 
                            OnScroll = v172.onScroll
                        })
                    })
                }), 
                KeyboardListener = v3.createElement(l_KeyboardListener_0, {
                    OnKeyPressed = function(v221) --[[ Line: 703 ]] --[[ Name: OnKeyPressed ]]
                        -- upvalues: v69 (ref), l_props_3 (copy), l_SelectedTracks_1 (copy), v172 (copy)
                        if v69.isUp(v221.KeyCode) then
                            l_props_3.MoveSelectedTrack(-1);
                            return;
                        elseif v69.isDown(v221.KeyCode) then
                            l_props_3.MoveSelectedTrack(1);
                            return;
                        elseif v69.isLeft(v221.KeyCode) then
                            l_props_3.CloseSelectedTracks(l_SelectedTracks_1);
                            return;
                        elseif v69.isRight(v221.KeyCode) then
                            l_props_3.ExpandSelectedTracks(l_SelectedTracks_1);
                            return;
                        elseif v69.isControl(v221.KeyCode) then
                            v172.controlDown = true;
                            return;
                        else
                            if v69.isShift(v221.KeyCode) then
                                v172.shiftDown = true;
                            end;
                            return;
                        end;
                    end, 
                    OnKeyReleased = function(v222) --[[ Line: 718 ]] --[[ Name: OnKeyReleased ]]
                        -- upvalues: v69 (ref), v172 (copy)
                        if v69.isControl(v222.KeyCode) then
                            v172.controlDown = false;
                            return;
                        else
                            if v69.isShift(v222.KeyCode) then
                                v172.shiftDown = false;
                            end;
                            return;
                        end;
                    end
                }), 
                IgnoreLayout = v203 and v3.createElement("Folder", {}, {
                    TrackColors = v3.createElement(v45, {
                        Tracks = l_Tracks_2, 
                        TopTrackIndex = v184, 
                        Position = UDim2.new(0, 0, 0, v215), 
                        MaxHeight = l_AbsoluteSize_0.Y - v215
                    })
                }) or nil
            })
        }), 
        TrackListBorder = v3.createElement(v48, {
            OnDragMoved = v172.updateTrackListWidth, 
            ZIndex = 3
        }), 
        TrackEditor = v203 and v3.createElement(v46, {
            ZIndex = v212, 
            TopTrackIndex = v184, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, -l_TrackListWidth_0 - v68.SCROLL_BAR_SIZE - v68.SCROLL_BAR_PADDING, 1, 0), 
            StartTick = v176, 
            EndTick = v177, 
            LastTick = v178, 
            Playhead = l_Playhead_0, 
            FrameRate = l_props_3.FrameRate, 
            ShowAsSeconds = if v80() then nil else v181, 
            TimelineUnit = l_TimelineUnit_0, 
            ShowEvents = l_ShowEvents_0, 
            HorizontalScroll = l_HorizontalScroll_0, 
            HorizontalZoom = l_HorizontalZoom_0, 
            VerticalScroll = l_VerticalScroll_0, 
            VerticalZoom = l_VerticalZoom_0, 
            OnScroll = v172.onScroll, 
            IsChannelAnimation = v206, 
            ColorsPosition = v215, 
            OnPromoteRequested = v172.showPromotePrompt
        }), 
        SettingsAndVerticalScrollBar = v203 and v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v68.SCROLL_BAR_SIZE, 1, 0), 
            LayoutOrder = 3
        }, {
            SettingsButton = v3.createElement(v42, {
                OnChangeFPS = v172.showChangeFPSPrompt, 
                OnChangeGridSpeed = v172.showChangeGridSpeedPrompt, 
                OnChangePlaybackSpeed = v172.showChangePlaybackSpeedPrompt
            }), 
            TrackScrollbar = v216 and v3.createElement(v49, {
                Size = UDim2.new(1, 0, 1, -v68.SCROLL_BAR_SIZE - v68.TIMELINE_HEIGHT - 1), 
                Position = UDim2.new(0, 0, 0, v68.TIMELINE_HEIGHT), 
                TopTrackIndex = v184, 
                NumTracks = l_Tracks_2 and #l_Tracks_2 or 0, 
                SetTopTrackIndex = if v78() then v172.props.SetTopTrackIndex else v172.setTopTrackIndex, 
                OnScroll = v172.onScroll
            }) or nil
        }), 
        StartScreen = not v203 and not v218 and v3.createElement(v43, {
            RootInstance = l_RootInstance_0, 
            Size = UDim2.new(1, -l_TrackListWidth_0, 1, 0), 
            LayoutOrder = 2, 
            OnCreateAnimation = if v81() then nil else v172.createAnimationWrapper, 
            PlayState = l_props_3.PlayState, 
            inReviewState = l_props_3.inReviewState
        }), 
        Playback = l_Active_0 and v203 and v3.createElement(v37), 
        FacialAnimationRecorder = l_Active_0 and v74() and (v198 or l_inReviewState_0) and v3.createElement(v32), 
        RecordingModeCover = l_Active_0 and v74() and v198 and v3.createElement(v40), 
        InstanceSelector = l_Active_0 and v3.createElement(v35), 
        FloorGrid = l_Active_0 and v203 and (not v82() or l_VisualizeGrid_0) and v3.createElement(v33, {
            Playhead = l_props_3.Playhead, 
            RootInstance = l_props_3.RootInstance, 
            Speed = l_GridSpeed_0
        }), 
        TrackActions = l_Active_0 and v203 and v3.createElement(v44, {
            ShowMenu = l_state_0.showContextMenu, 
            OnMenuOpened = v172.hideMenu, 
            IsChannelAnimation = v206
        }), 
        InactiveCover = not l_Active_0 and v3.createElement(v34, {
            OnFocused = v172.attachEditorWrapper
        }), 
        ProgressScreen = l_CreatingAnimationFromVideo_0 and v3.createElement(v38, {
            OnCancelled = v172.cancelCreateFromVideo, 
            Progress = l_AnimationImportProgress_0, 
            Status = l_AnimationImportStatus_0
        }), 
        ChangeFPSPrompt = l_showChangeFPSPrompt_0 and v3.createElement(v29, {
            FrameRate = l_props_3.FrameRate, 
            SetFrameRate = l_props_3.SetFrameRate, 
            OnClose = v172.hideChangeFPSPrompt
        }), 
        ChangeGridSpeedPrompt = if v79() and l_showChangeGridSpeedPrompt_0 then v3.createElement(v30, {
            GridSpeed = l_GridSpeed_0, 
            SetGridSpeed = l_props_3.SetGridSpeed, 
            OnClose = v172.hideChangeGridSpeedPrompt
        }) else nil, 
        ChangePlaybackSpeedPrompt = l_showChangePlaybackSpeedPrompt_0 and v3.createElement(v31, {
            PlaybackSpeed = l_props_3.PlaybackSpeed, 
            SetPlaybackSpeed = l_props_3.SetPlaybackSpeed, 
            OnClose = v172.hideChangePlaybackSpeedPrompt
        }), 
        PromotePrompt = if l_showPromotePrompt_0 then v3.createElement(v39, {
            OnPromote = v172.promoteKeyframeSequence, 
            OnClose = v172.hidePromotePrompt
        }) else nil, 
        ReduceKeyframesDialog = if v217 then v3.createElement(v41, {
            OnClose = v172.hideReduceKeyframesDialog
        }) else nil, 
        MigrationDialog = if v218 then v3.createElement(v36) else nil
    });
end;
v83.didMount = function(v223) --[[ Line: 872 ]] --[[ Name: didMount ]]
    -- upvalues: v80 (copy), v68 (copy)
    local l_props_4 = v223.props;
    local l_SnapMode_0 = l_props_4.SnapMode;
    if v80() then
        l_props_4.Analytics:report("onEditorOpened", l_props_4.TimelineUnit, false, l_SnapMode_0);
    else
        local v226 = l_props_4.ShowAsSeconds and "Seconds" or "Frames";
        l_props_4.Analytics:report("onEditorOpened", v226, false, l_SnapMode_0);
    end;
    l_props_4.AttachEditor(l_props_4.Analytics);
    v223.props.SetEditorMode(v68.EDITOR_MODE.DopeSheet);
    v223.openedTimestamp = os.time();
end;
v83.willUnmount = function(v227) --[[ Line: 887 ]] --[[ Name: willUnmount ]]
    -- upvalues: v72 (copy)
    local l_props_5 = v227.props;
    v72.resetAllFacsValuesInFaceControls(l_props_5.RootInstance);
    l_props_5.Analytics:report("onEditorModeSwitch", l_props_5.EditorMode, nil, os.time() - l_props_5.EditorModeSwitchTime, if l_props_5.AnimationData and l_props_5.AnimationData.Metadata then l_props_5.AnimationData.Metadata.Guid else nil);
    l_props_5.ReleaseEditor(l_props_5.Analytics);
    l_props_5.Analytics:report("onEditorClosed", os.time() - v227.openedTimestamp);
end;
local function v231(v229) --[[ Line: 902 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v80 (copy)
    local l_Status_0 = v229.Status;
    return {
        Active = l_Status_0.Active, 
        Analytics = v229.Analytics, 
        AnimationData = v229.AnimationData, 
        AnimationImportProgress = l_Status_0.AnimationImportProgress, 
        AnimationImportStatus = l_Status_0.AnimationImportStatus, 
        CreatingAnimationFromVideo = l_Status_0.CreatingAnimationFromVideo, 
        DefaultEulerAnglesOrder = l_Status_0.DefaultEulerAnglesOrder, 
        DefaultRotationType = l_Status_0.DefaultRotationType, 
        EditingLength = l_Status_0.EditingLength, 
        EditorMode = l_Status_0.EditorMode, 
        EditorModeSwitchTime = l_Status_0.EditorModeSwitchTime, 
        FrameRate = l_Status_0.FrameRate, 
        GridSpeed = l_Status_0.GridSpeed, 
        HorizontalScroll = l_Status_0.HorizontalScroll, 
        HorizontalZoom = l_Status_0.HorizontalZoom, 
        IKEnabled = l_Status_0.IKEnabled, 
        IKMode = l_Status_0.IKMode, 
        inReviewState = l_Status_0.inReviewState, 
        IsLegacyAnimSaves = l_Status_0.IsLegacyAnimSaves, 
        LastSelectedPath = l_Status_0.LastSelectedPath, 
        LegacyAnimationInstances = l_Status_0.LegacyAnimationInstances, 
        MotorData = l_Status_0.MotorData, 
        PinnedParts = l_Status_0.PinnedParts, 
        PlaybackSpeed = l_Status_0.PlaybackSpeed, 
        Playhead = l_Status_0.Playhead, 
        PlayState = l_Status_0.PlayState, 
        ReduceKeyframesDialogMode = l_Status_0.ReduceKeyframesDialogMode, 
        RootInstance = l_Status_0.RootInstance, 
        SelectedTracks = l_Status_0.SelectedTracks, 
        ShowAsSeconds = if v80() then nil else l_Status_0.ShowAsSeconds, 
        ShowEvents = l_Status_0.ShowEvents, 
        SnapMode = l_Status_0.SnapMode, 
        SymmetryEnabled = l_Status_0.SymmetryEnabled, 
        TimelineUnit = l_Status_0.TimelineUnit, 
        TopTrackIndex = l_Status_0.TopTrackIndex, 
        Tracks = l_Status_0.Tracks, 
        UnusedFacs = l_Status_0.UnusedFacs, 
        UnusedTracks = l_Status_0.UnusedTracks, 
        VerticalScroll = l_Status_0.VerticalScroll, 
        VerticalZoom = l_Status_0.VerticalZoom, 
        VisualizeGrid = l_Status_0.VisualizeGrid
    };
end;
local function v276(v232) --[[ Line: 949 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v18 (copy), v62 (copy), v76 (copy), v77 (copy), v24 (copy), v60 (copy), v23 (copy), v63 (copy), v56 (copy), v52 (copy), v51 (copy), v22 (copy), v65 (copy), v53 (copy), v58 (copy), v13 (copy), v75 (copy), v19 (copy), v81 (copy), v67 (copy), v55 (copy), v16 (copy), v17 (copy), v14 (copy), v15 (copy), v59 (copy), v57 (copy), v12 (copy), v20 (copy), v21 (copy), v64 (copy), v11 (copy), v54 (copy), v25 (copy), v61 (copy)
    return {
        SetLastSelectedPath = function(v233) --[[ Line: 951 ]] --[[ Name: SetLastSelectedPath ]]
            -- upvalues: v232 (copy), v18 (ref)
            v232(v18(v233));
        end, 
        SetTracksExpanded = function(v234, v235) --[[ Line: 955 ]] --[[ Name: SetTracksExpanded ]]
            -- upvalues: v232 (copy), v62 (ref)
            v232(v62(v234, v235, false));
        end, 
        SetSelectedTrackInstances = if not not v76() or v77() then nil else function(v236) --[[ Line: 960 ]]
            -- upvalues: v232 (copy), v24 (ref)
            v232(v24(v236));
        end, 
        ClearSelectedTrackInstances = function() --[[ Line: 965 ]] --[[ Name: ClearSelectedTrackInstances ]]
            -- upvalues: v77 (ref), v232 (copy), v60 (ref), v24 (ref), v23 (ref)
            if v77() then
                v232(v60({}));
                return;
            else
                v232(v24({}));
                v232(v23({}));
                return;
            end;
        end, 
        SortAndSetSelectedTrackInstances = function(v237) --[[ Line: 974 ]] --[[ Name: SortAndSetSelectedTrackInstances ]]
            -- upvalues: v232 (copy), v63 (ref)
            v232(v63(v237));
        end, 
        SetSelectedTracks = function(v238) --[[ Line: 978 ]] --[[ Name: SetSelectedTracks ]]
            -- upvalues: v77 (ref), v232 (copy), v60 (ref), v23 (ref)
            if v77() then
                v232(v60(v238));
                return;
            else
                v232(v23(v238));
                return;
            end;
        end, 
        MoveSelectedTrack = function(v239) --[[ Line: 986 ]] --[[ Name: MoveSelectedTrack ]]
            -- upvalues: v232 (copy), v56 (ref)
            v232(v56(v239));
        end, 
        ExpandSelectedTracks = function(v240) --[[ Line: 990 ]] --[[ Name: ExpandSelectedTracks ]]
            -- upvalues: v232 (copy), v62 (ref)
            v232(v62(v240, true, true));
        end, 
        CloseSelectedTracks = function(v241) --[[ Line: 994 ]] --[[ Name: CloseSelectedTracks ]]
            -- upvalues: v232 (copy), v62 (ref)
            v232(v62(v241, false, true));
        end, 
        AddTrack = function(v242, v243, v244, v245, v246, v247) --[[ Line: 998 ]] --[[ Name: AddTrack ]]
            -- upvalues: v232 (copy), v52 (ref), v51 (ref)
            v232(v52());
            v232(v51(v242, v243, v244, v245, v246, v247));
        end, 
        SetRightClickContextInfo = function(v248) --[[ Line: 1003 ]] --[[ Name: SetRightClickContextInfo ]]
            -- upvalues: v232 (copy), v22 (ref)
            v232(v22(v248));
        end, 
        ValueChanged = function(v249, v250, v251, v252, v253, v254, v255) --[[ Line: 1007 ]] --[[ Name: ValueChanged ]]
            -- upvalues: v232 (copy), v65 (ref)
            v232(v65(v249, v250, v251, v252, v253, v254, v255));
        end, 
        AddWaypoint = function() --[[ Line: 1011 ]] --[[ Name: AddWaypoint ]]
            -- upvalues: v232 (copy), v52 (ref)
            v232(v52());
        end, 
        AttachEditor = function(v256) --[[ Line: 1015 ]] --[[ Name: AttachEditor ]]
            -- upvalues: v232 (copy), v53 (ref)
            v232(v53(v256));
        end, 
        ReleaseEditor = function(v257) --[[ Line: 1019 ]] --[[ Name: ReleaseEditor ]]
            -- upvalues: v232 (copy), v58 (ref)
            v232(v58(v257));
        end, 
        SetEventEditingTick = function(v258) --[[ Line: 1023 ]] --[[ Name: SetEventEditingTick ]]
            -- upvalues: v232 (copy), v13 (ref)
            v232(v13(v258));
        end, 
        SetMotorData = if v75() then nil else function(v259) --[[ Line: 1029 ]]
            -- upvalues: v232 (copy), v19 (ref)
            v232(v19(v259));
        end, 
        CreateAnimation = if v81() then nil else function(v260, v261) --[[ Line: 1035 ]]
            -- upvalues: v67 (ref), v232 (copy), v55 (ref), v16 (ref), v17 (ref)
            local v262 = v67.newRigAnimation(v260);
            v232(v55(v262, v261));
            v232(v16(false));
            v232(v17(false));
            v261:report("onCreateNewAnimation", v260, if v262.Metadata then v262.Metadata.Guid else nil);
        end, 
        SetFrameRate = function(v263) --[[ Line: 1045 ]] --[[ Name: SetFrameRate ]]
            -- upvalues: v232 (copy), v14 (ref)
            v232(v14(v263));
        end, 
        SetGridSpeed = function(v264) --[[ Line: 1049 ]] --[[ Name: SetGridSpeed ]]
            -- upvalues: v232 (copy), v15 (ref)
            v232(v15(v264));
        end, 
        SetPlaybackSpeed = function(v265) --[[ Line: 1053 ]] --[[ Name: SetPlaybackSpeed ]]
            -- upvalues: v232 (copy), v59 (ref)
            v232(v59(v265));
        end, 
        PromoteKeyframeSequence = function(v266) --[[ Line: 1057 ]] --[[ Name: PromoteKeyframeSequence ]]
            -- upvalues: v232 (copy), v57 (ref)
            v232(v57(v266));
        end, 
        SetEditorMode = function(v267) --[[ Line: 1061 ]] --[[ Name: SetEditorMode ]]
            -- upvalues: v232 (copy), v12 (ref)
            v232(v12(v267));
        end, 
        SetPlayState = function(v268) --[[ Line: 1065 ]] --[[ Name: SetPlayState ]]
            -- upvalues: v232 (copy), v20 (ref)
            v232(v20(v268));
        end, 
        SetReduceKeyframesDialogMode = function(v269) --[[ Line: 1069 ]] --[[ Name: SetReduceKeyframesDialogMode ]]
            -- upvalues: v232 (copy), v21 (ref)
            v232(v21(v269));
        end, 
        SwitchEditorMode = function(v270, v271) --[[ Line: 1073 ]] --[[ Name: SwitchEditorMode ]]
            -- upvalues: v232 (copy), v64 (ref)
            v232(v64(v270, v271));
        end, 
        SetCreatingAnimationFromVideo = function(v272) --[[ Line: 1077 ]] --[[ Name: SetCreatingAnimationFromVideo ]]
            -- upvalues: v232 (copy), v11 (ref)
            v232(v11(v272));
        end, 
        CancelAnimationFromVideoImport = function(v273) --[[ Line: 1081 ]] --[[ Name: CancelAnimationFromVideoImport ]]
            -- upvalues: v232 (copy), v54 (ref)
            v232(v54(v273));
        end, 
        SetTopTrackIndex_ACTION = function(v274) --[[ Line: 1085 ]] --[[ Name: SetTopTrackIndex_ACTION ]]
            -- upvalues: v232 (copy), v25 (ref)
            v232(v25(v274));
        end, 
        SetTopTrackIndex = function(v275) --[[ Line: 1089 ]] --[[ Name: SetTopTrackIndex ]]
            -- upvalues: v232 (copy), v61 (ref)
            v232(v61(v275));
        end
    };
end;
v83 = l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Signals = v9, 
    Stylizer = l_ContextServices_0.Stylizer
})(v83);
return v4.connect(v231, v276)(v83);