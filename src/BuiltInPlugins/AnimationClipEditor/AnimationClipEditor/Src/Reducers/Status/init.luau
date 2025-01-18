local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_join_0 = v2.Dictionary.join;
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagAnimationConstraints);
local _ = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
local v7 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
return v1.createReducer({
    Active = false, 
    AnimationFromVideoErroredOut = false, 
    AnimationFromVideoUploadStartTime = nil, 
    AnimationImportProgress = 0, 
    AnimationImportStatus = v4.ANIMATION_FROM_VIDEO_STATUS.Initializing, 
    AutoFocusFaceEnabled = false, 
    Clipboard = {}, 
    ClipboardType = nil, 
    CreatingAnimationFromVideo = false, 
    DefaultEulerAnglesOrder = Enum.RotationOrder.XYZ, 
    DefaultRotationType = v4.DEFAULT_ROTATION_TYPE, 
    EditingLength = 0, 
    EditorMode = v4.EDITOR_MODE.DopeSheet, 
    EditorModeSwitchTime = nil, 
    EventEditingTick = nil, 
    FaceControlsEditorOpenedTimestamp = nil, 
    FrameRate = v4.DEFAULT_FRAMERATE, 
    GridSpeed = 0, 
    haveToSetBackToNotLooping = false, 
    HorizontalScroll = 0, 
    HorizontalZoom = 0, 
    IKEnabled = false, 
    IKMode = v4.IK_MODE.FullBody, 
    IKOpenedTimestamp = nil, 
    inReviewState = false, 
    IsDirty = false, 
    IsLegacyAnimSaves = false, 
    LastSelectedPath = nil, 
    LegacyAnimationInstances = {}, 
    PinnedParts = {}, 
    PlaybackSpeed = 1, 
    PlaybackStartInfo = {}, 
    Playhead = 0, 
    PlayState = v4.PLAY_STATE.Pause, 
    ReadOnly = false, 
    ReduceKeyframesDialogMode = v4.REDUCE_KEYFRAMES_DIALOG_MODE.Hidden, 
    RightClickContextInfo = {}, 
    RootInstance = nil, 
    SelectedEvents = {}, 
    SelectedKeyframes = {}, 
    SelectedTracks = nil, 
    ShowAsSeconds = not v7() or nil, 
    ShowEvents = true, 
    ShowFaceControlsEditorPanel = false, 
    ShowTree = false, 
    SnapMode = v4.SNAP_MODES.Frames, 
    SymmetryEnabled = false, 
    TimelineUnit = v4.TIMELINE_UNITS.SecondsDecimal, 
    Tool = Enum.RibbonTool.Rotate, 
    TopTrackIndex = 1, 
    Tracks = {}, 
    UnusedFacs = {}, 
    UnusedTracks = {}, 
    VerticalScroll = 0, 
    VerticalZoom = 0, 
    VisualizeBones = true, 
    VisualizeGrid = true, 
    WorldSpace = false
}, {
    SetActive = function(v8, v9) --[[ Line: 73 ]] --[[ Name: SetActive ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v8, {
            Active = v9.active
        });
    end, 
    SetAnimationFromVideoErroredOut = function(v10, v11) --[[ Line: 79 ]] --[[ Name: SetAnimationFromVideoErroredOut ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v10, {
            AnimationFromVideoErroredOut = v11.animationFromVideoErroredOut
        });
    end, 
    SetAnimationFromVideoUploadStartTime = function(v12, v13) --[[ Line: 85 ]] --[[ Name: SetAnimationFromVideoUploadStartTime ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v12, {
            AnimationFromVideoUploadStartTime = v13.animationFromVideoUploadStartTime
        });
    end, 
    SetAnimationImportProgress = function(v14, v15) --[[ Line: 91 ]] --[[ Name: SetAnimationImportProgress ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v14, {
            AnimationImportProgress = v15.animationImportProgress
        });
    end, 
    SetAnimationImportStatus = function(v16, v17) --[[ Line: 97 ]] --[[ Name: SetAnimationImportStatus ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v16, {
            AnimationImportStatus = v17.animationImportStatus
        });
    end, 
    SetAutoFocusFaceEnabled = function(v18, v19) --[[ Line: 103 ]] --[[ Name: SetAutoFocusFaceEnabled ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v18, {
            AutoFocusFaceEnabled = v19.autoFocusFaceEnabled
        });
    end, 
    SetBoneVisualization = function(v20, v21) --[[ Line: 109 ]] --[[ Name: SetBoneVisualization ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v20, {
            VisualizeBones = v21.visualizeBones
        });
    end, 
    SetClipboard = function(v22, v23) --[[ Line: 115 ]] --[[ Name: SetClipboard ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v22, {
            Clipboard = v23.clipboard, 
            ClipboardType = v23.clipboardType
        });
    end, 
    SetCreatingAnimationFromVideo = function(v24, v25) --[[ Line: 122 ]] --[[ Name: SetCreatingAnimationFromVideo ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v24, {
            CreatingAnimationFromVideo = v25.creatingAnimationFromVideo
        });
    end, 
    SetDefaultEulerAnglesOrder = function(v26, v27) --[[ Line: 128 ]] --[[ Name: SetDefaultEulerAnglesOrder ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v26, {
            DefaultEulerAnglesOrder = v27.defaultEulerAnglesOrder
        });
    end, 
    SetDefaultRotationType = function(v28, v29) --[[ Line: 134 ]] --[[ Name: SetDefaultRotationType ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v28, {
            DefaultRotationType = v29.defaultRotationType
        });
    end, 
    SetEditingLength = function(v30, v31) --[[ Line: 140 ]] --[[ Name: SetEditingLength ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v30, {
            EditingLength = v31.editingLength
        });
    end, 
    SetEditorMode = function(v32, v33) --[[ Line: 146 ]] --[[ Name: SetEditorMode ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v32, {
            EditorMode = v33.editorMode, 
            EditorModeSwitchTime = v33.editorModeSwitchTime
        });
    end, 
    SetEventEditingTick = function(v34, v35) --[[ Line: 153 ]]
        -- upvalues: l_join_0 (copy), v2 (copy)
        return l_join_0(v34, {
            EventEditingTick = v35.eventEditingTick or v2.None
        });
    end or nil, 
    SetFaceControlsEditorOpenedTimestamp = function(v36, v37) --[[ Line: 159 ]] --[[ Name: SetFaceControlsEditorOpenedTimestamp ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v36, {
            FaceControlsEditorOpenedTimestamp = v37.FaceControlsEditorOpenedTimestamp
        });
    end, 
    SetFrameRate = function(v38, v39) --[[ Line: 165 ]] --[[ Name: SetFrameRate ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v38, {
            FrameRate = v39.frameRate
        });
    end, 
    SetGridSpeed = function(v40, v41) --[[ Line: 171 ]] --[[ Name: SetGridSpeed ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v40, {
            GridSpeed = v41.gridSpeed
        });
    end, 
    SetGridVisualization = function(v42, v43) --[[ Line: 177 ]] --[[ Name: SetGridVisualization ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v42, {
            VisualizeGrid = v43.visualizeGrid
        });
    end, 
    SetHaveToSetBackToNotLooping = function(v44, v45) --[[ Line: 183 ]] --[[ Name: SetHaveToSetBackToNotLooping ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v44, {
            haveToSetBackToNotLooping = v45.haveToSetBackToNotLooping
        });
    end, 
    SetHorizontalScrollZoom = function(v46, v47) --[[ Line: 189 ]] --[[ Name: SetHorizontalScrollZoom ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v46, {
            HorizontalScroll = v47.horizontalScroll, 
            HorizontalZoom = v47.horizontalZoom
        });
    end, 
    SetIKEnabled = function(v48, v49) --[[ Line: 196 ]] --[[ Name: SetIKEnabled ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v48, {
            IKEnabled = v49.ikEnabled
        });
    end, 
    SetIKMode = function(v50, v51) --[[ Line: 202 ]] --[[ Name: SetIKMode ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v50, {
            IKMode = v51.ikMode
        });
    end, 
    SetIKOpenedTimestamp = function(v52, v53) --[[ Line: 208 ]] --[[ Name: SetIKOpenedTimestamp ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v52, {
            IKOpenedTimestamp = v53.iKOpenedTimestamp
        });
    end, 
    SetInReviewState = function(v54, v55) --[[ Line: 214 ]] --[[ Name: SetInReviewState ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v54, {
            inReviewState = v55.inReviewState
        });
    end, 
    SetIsDirty = function(v56, v57) --[[ Line: 220 ]] --[[ Name: SetIsDirty ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v56, {
            IsDirty = v57.isDirty
        });
    end, 
    SetIsLegacyAnimSaves = function(v58, v59) --[[ Line: 226 ]] --[[ Name: SetIsLegacyAnimSaves ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v58, {
            IsLegacyAnimSaves = v59.isLegacyAnimSaves
        });
    end, 
    SetLastSelectedPath = function(v60, v61) --[[ Line: 232 ]] --[[ Name: SetLastSelectedPath ]]
        -- upvalues: l_join_0 (copy), v2 (copy)
        return l_join_0(v60, {
            LastSelectedPath = v61.lastSelectedPath or v2.None
        });
    end, 
    SetLegacyAnimationInstances = function(v62, v63) --[[ Line: 238 ]] --[[ Name: SetLegacyAnimationInstances ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v62, {
            LegacyAnimationInstances = v63.legacyAnimationInstances
        });
    end, 
    SetMotorData = if v5() then nil else function(v64, v65) --[[ Line: 246 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v64, {
            MotorData = v65.motorData
        });
    end, 
    SetPinnedParts = function(v66, v67) --[[ Line: 252 ]] --[[ Name: SetPinnedParts ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v66, {
            PinnedParts = v67.pinnedParts
        });
    end, 
    SetPlaybackSpeed = function(v68, v69) --[[ Line: 258 ]] --[[ Name: SetPlaybackSpeed ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v68, {
            PlaybackSpeed = v69.playbackSpeed
        });
    end, 
    SetPlaybackStartInfo = function(v70, v71) --[[ Line: 264 ]] --[[ Name: SetPlaybackStartInfo ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v70, {
            PlaybackStartInfo = v71.playbackStartInfo
        });
    end, 
    SetPlayhead = function(v72, v73) --[[ Line: 270 ]] --[[ Name: SetPlayhead ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v72, {
            Playhead = v73.playhead
        });
    end, 
    SetPlayState = function(v74, v75) --[[ Line: 276 ]] --[[ Name: SetPlayState ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v74, {
            PlayState = v75.playState
        });
    end, 
    SetReadOnly = function(v76, v77) --[[ Line: 282 ]] --[[ Name: SetReadOnly ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v76, {
            ReadOnly = v77.readOnly
        });
    end, 
    SetReduceKeyframesDialogMode = function(v78, v79) --[[ Line: 288 ]] --[[ Name: SetReduceKeyframesDialogMode ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v78, {
            ReduceKeyframesDialogMode = v79.reduceKeyframesDialogMode
        });
    end, 
    SetRightClickContextInfo = function(v80, v81) --[[ Line: 294 ]] --[[ Name: SetRightClickContextInfo ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v80, {
            RightClickContextInfo = v81.rightClickContextInfo
        });
    end, 
    SetRootInstance = function(v82, v83) --[[ Line: 300 ]] --[[ Name: SetRootInstance ]]
        -- upvalues: l_join_0 (copy), v2 (copy)
        return l_join_0(v82, {
            RootInstance = v83.rootInstance or v2.None
        });
    end, 
    SetSelectedEvents = function(v84, v85) --[[ Line: 306 ]] --[[ Name: SetSelectedEvents ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v84, {
            SelectedEvents = v85.selected
        });
    end, 
    SetSelectedKeyframes = function(v86, v87) --[[ Line: 312 ]] --[[ Name: SetSelectedKeyframes ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v86, {
            SelectedKeyframes = v87.selected
        });
    end, 
    SetSelectedTrackInstances = function(v88, v89) --[[ Line: 318 ]] --[[ Name: SetSelectedTrackInstances ]]
        -- upvalues: l_join_0 (copy), v2 (copy)
        return l_join_0(v88, {
            SelectedTrackInstances = v89.selectedTrackInstances or v2.None
        });
    end, 
    SetSelectedTracks = function(v90, v91) --[[ Line: 324 ]] --[[ Name: SetSelectedTracks ]]
        -- upvalues: l_join_0 (copy), v2 (copy)
        return l_join_0(v90, {
            SelectedTracks = v91.selectedTracks or v2.None
        });
    end, 
    SetShowAsSeconds = if v7() then nil else function(v92, v93) --[[ Line: 332 ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v92, {
            ShowAsSeconds = v93.showAsSeconds
        });
    end, 
    SetShowEvents = function(v94, v95) --[[ Line: 338 ]] --[[ Name: SetShowEvents ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v94, {
            ShowEvents = v95.showEvents
        });
    end, 
    SetShowFaceControlsEditorPanel = function(v96, v97) --[[ Line: 344 ]] --[[ Name: SetShowFaceControlsEditorPanel ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v96, {
            ShowFaceControlsEditorPanel = v97.showFaceControlsEditorPanel
        });
    end, 
    SetShowTree = function(v98, v99) --[[ Line: 350 ]] --[[ Name: SetShowTree ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v98, {
            ShowTree = v99.showTree
        });
    end, 
    SetSnapMode = function(v100, v101) --[[ Line: 356 ]] --[[ Name: SetSnapMode ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v100, {
            SnapMode = v101.snapMode
        });
    end, 
    SetStartingPose = function(v102, v103) --[[ Line: 362 ]] --[[ Name: SetStartingPose ]]
        -- upvalues: l_join_0 (copy), v2 (copy)
        return l_join_0(v102, {
            StartingPose = v103.startingPose or v2.None
        });
    end, 
    SetSymmetryEnabled = function(v104, v105) --[[ Line: 368 ]] --[[ Name: SetSymmetryEnabled ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v104, {
            SymmetryEnabled = v105.symmetryEnabled
        });
    end, 
    SetTimelineUnit = function(v106, v107) --[[ Line: 374 ]] --[[ Name: SetTimelineUnit ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v106, {
            TimelineUnit = v107.timelineUnit
        });
    end, 
    SetTool = function(v108, v109) --[[ Line: 380 ]] --[[ Name: SetTool ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v108, {
            Tool = v109.tool
        });
    end, 
    SetTopTrackIndex = function(v110, v111) --[[ Line: 386 ]] --[[ Name: SetTopTrackIndex ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v110, {
            TopTrackIndex = v111.topTrackIndex
        });
    end, 
    SetTracks = function(v112, v113) --[[ Line: 392 ]] --[[ Name: SetTracks ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v112, {
            Tracks = v113.tracks, 
            UnusedTracks = v113.unusedTracks, 
            UnusedFacs = v113.unusedFacs
        });
    end, 
    SetVerticalScrollZoom = function(v114, v115) --[[ Line: 400 ]] --[[ Name: SetVerticalScrollZoom ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v114, {
            VerticalScroll = v115.verticalScroll, 
            VerticalZoom = v115.verticalZoom
        });
    end, 
    ToggleWorldSpace = function(v116, _) --[[ Line: 407 ]] --[[ Name: ToggleWorldSpace ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v116, {
            WorldSpace = not v116.WorldSpace
        });
    end
});