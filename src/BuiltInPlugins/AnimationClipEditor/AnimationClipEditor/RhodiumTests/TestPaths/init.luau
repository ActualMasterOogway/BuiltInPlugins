local _ = script:FindFirstAncestor("AnimationClipEditor");
local v7 = {
    waitForDescendant = function(v1, v2) --[[ Line: 7 ]] --[[ Name: waitForDescendant ]]
        local l_v1_0 = v1;
        assert(l_v1_0, "waitForDescendant: instance cannot be nil.");
        for _, v5 in ipairs(v2) do
            local v6 = l_v1_0:WaitForChild(v5, 2);
            assert(v6, v5 .. " was not found under parent " .. l_v1_0:GetFullName() .. ".");
            l_v1_0 = v6;
        end;
        return l_v1_0;
    end
};
v7.getEditorController = function(v8) --[[ Line: 18 ]] --[[ Name: getEditorController ]]
    -- upvalues: v7 (copy)
    return v7.waitForDescendant(v8, {
        "AnimationClipEditor", 
        "EditorController"
    });
end;
v7.getDopeSheetController = function(v9) --[[ Line: 25 ]] --[[ Name: getDopeSheetController ]]
    -- upvalues: v7 (copy)
    local v10 = v7.getEditorController(v9);
    return v7.waitForDescendant(v10, {
        "TrackEditor", 
        "DopeSheetController"
    });
end;
v7.getDopeSheet = function(v11) --[[ Line: 33 ]] --[[ Name: getDopeSheet ]]
    -- upvalues: v7 (copy)
    local v12 = v7.getDopeSheetController(v11);
    return v7.waitForDescendant(v12, {
        "DopeSheetContainer", 
        "DopeSheet"
    });
end;
v7.getTrack = function(v13, v14) --[[ Line: 41 ]] --[[ Name: getTrack ]]
    -- upvalues: v7 (copy)
    local v15 = v7.getDopeSheet(v13);
    return v7.waitForDescendant(v15, {
        v14, 
        "KeyframeDisplayArea"
    });
end;
v7.getTrackList = function(v16) --[[ Line: 49 ]] --[[ Name: getTrackList ]]
    -- upvalues: v7 (copy)
    local v17 = v7.getEditorController(v16);
    return v7.waitForDescendant(v17, {
        "TrackListAndControlContainer", 
        "EventsAndTracks", 
        "TrackListAndScrollBar", 
        "TrackList", 
        "Canvas"
    });
end;
v7.getAnimationControlPanel = function(v18) --[[ Line: 60 ]] --[[ Name: getAnimationControlPanel ]]
    -- upvalues: v7 (copy)
    local v19 = v7.getEditorController(v18);
    return v7.waitForDescendant(v19, {
        "TrackListAndControlContainer", 
        "AnimationControlPanel"
    });
end;
v7.getMediaControls = function(v20) --[[ Line: 68 ]] --[[ Name: getMediaControls ]]
    -- upvalues: v7 (copy)
    local v21 = v7.getAnimationControlPanel(v20);
    return v7.waitForDescendant(v21, {
        "MediaControls"
    });
end;
v7.getMediaControlButton = function(v22, v23) --[[ Line: 76 ]] --[[ Name: getMediaControlButton ]]
    -- upvalues: v7 (copy)
    local v24 = v7.getMediaControls(v22);
    return v7.waitForDescendant(v24, {
        v23, 
        "Button", 
        "Contents", 
        "TextButton"
    });
end;
v7.getTimeDisplay = function(v25) --[[ Line: 86 ]] --[[ Name: getTimeDisplay ]]
    -- upvalues: v7 (copy)
    local v26 = v7.getAnimationControlPanel(v25);
    return v7.waitForDescendant(v26, {
        "TimeDisplay"
    });
end;
v7.getIKButton = function(v27) --[[ Line: 94 ]] --[[ Name: getIKButton ]]
    -- upvalues: v7 (copy)
    local v28 = v7.getTrackList(v27);
    return v7.waitForDescendant(v28, {
        "SummaryTrack", 
        "LeftButtonsListContainer", 
        "IKController", 
        "IKButton"
    });
end;
v7.getIKWindow = function(v29) --[[ Line: 104 ]] --[[ Name: getIKWindow ]]
    -- upvalues: v7 (copy)
    return v7.waitForDescendant(v29, {
        "Container"
    });
end;
v7.getIKEnableButton = function(v30) --[[ Line: 110 ]] --[[ Name: getIKEnableButton ]]
    -- upvalues: v7 (copy)
    local v31 = v7.getIKWindow(v30);
    return v7.waitForDescendant(v31, {
        "BottomFrame", 
        "EnableIKButton"
    });
end;
v7.getIKTreeView = function(v32) --[[ Line: 118 ]] --[[ Name: getIKTreeView ]]
    -- upvalues: v7 (copy)
    local v33 = v7.getIKWindow(v32);
    return v7.waitForDescendant(v33, {
        "TreeView", 
        "TreeView"
    });
end;
v7.getTreeViewJoint = function(v34, v35) --[[ Line: 126 ]] --[[ Name: getTreeViewJoint ]]
    -- upvalues: v7 (copy)
    local v36 = v7.getIKTreeView(v34);
    return v7.waitForDescendant(v36, {
        "Contents", 
        "List", 
        v35
    });
end;
v7.getTreeViewJointPin = function(v37, v38) --[[ Line: 135 ]] --[[ Name: getTreeViewJointPin ]]
    -- upvalues: v7 (copy)
    local v39 = v7.getTreeViewJoint(v37, v38);
    return v7.waitForDescendant(v39, {
        "Pin"
    });
end;
v7.getEventsTitleTrack = function(v40) --[[ Line: 142 ]] --[[ Name: getEventsTitleTrack ]]
    -- upvalues: v7 (copy)
    local v41 = v7.getEditorController(v40);
    return v7.waitForDescendant(v41, {
        "TrackListAndControlContainer", 
        "EventsAndTracks", 
        "EventsTitle"
    });
end;
v7.getEventsTrack = function(v42) --[[ Line: 151 ]] --[[ Name: getEventsTrack ]]
    -- upvalues: v7 (copy)
    local v43 = v7.getDopeSheetController(v42);
    return v7.waitForDescendant(v43, {
        "Events", 
        "Track", 
        "Markers", 
        "KeyframeDisplayArea"
    });
end;
v7.getEventsDialogContents = function(v44) --[[ Line: 161 ]] --[[ Name: getEventsDialogContents ]]
    -- upvalues: v7 (copy)
    return v7.waitForDescendant(v44, {
        "SolidBackground", 
        "Contents", 
        "Container"
    });
end;
v7.getEventEntry = function(v45, v46) --[[ Line: 169 ]] --[[ Name: getEventEntry ]]
    -- upvalues: v7 (copy)
    local v47 = v7.getEventsDialogContents(v45);
    return v7.waitForDescendant(v47, {
        "Event_" .. v46
    });
end;
v7.getAddEventEntry = function(v48) --[[ Line: 176 ]] --[[ Name: getAddEventEntry ]]
    -- upvalues: v7 (copy)
    local v49 = v7.getEventsDialogContents(v48);
    return v7.waitForDescendant(v49, {
        "AddNew", 
        "AddEventEntry"
    });
end;
v7.getStyledDialogContents = function(v50) --[[ Line: 184 ]] --[[ Name: getStyledDialogContents ]]
    -- upvalues: v7 (copy)
    return v7.waitForDescendant(v50, {
        "SolidBackground", 
        "Contents"
    });
end;
v7.getKFRKeyframesText = function(v51) --[[ Line: 191 ]] --[[ Name: getKFRKeyframesText ]]
    -- upvalues: v7 (copy)
    local v52 = v7.getStyledDialogContents(v51);
    return v7.waitForDescendant(v52, {
        "KeyframePane", 
        "KeyframesText"
    });
end;
v7.getKFRSlider = function(v53) --[[ Line: 199 ]] --[[ Name: getKFRSlider ]]
    -- upvalues: v7 (copy)
    local v54 = v7.getStyledDialogContents(v53);
    return v7.waitForDescendant(v54, {
        "Slider"
    });
end;
v7.getKFRCancel = function(v55) --[[ Line: 206 ]] --[[ Name: getKFRCancel ]]
    -- upvalues: v7 (copy)
    return v7.waitForDescendant(v55, {
        "SolidBackground", 
        "ButtonContainer"
    })[1];
end;
v7.getKFROk = function(v56) --[[ Line: 213 ]] --[[ Name: getKFROk ]]
    -- upvalues: v7 (copy)
    return v7.waitForDescendant(v56, {
        "SolidBackground", 
        "ButtonContainer"
    })[2];
end;
v7.getCurveEditorController = function(v57) --[[ Line: 220 ]] --[[ Name: getCurveEditorController ]]
    -- upvalues: v7 (copy)
    local v58 = v7.getEditorController(v57);
    return v7.waitForDescendant(v58, {
        "TrackEditor", 
        "CurveEditorController"
    });
end;
v7.getCurveCanvas = function(v59) --[[ Line: 228 ]] --[[ Name: getCurveCanvas ]]
    -- upvalues: v7 (copy)
    local v60 = v7.getCurveEditorController(v59);
    return v7.waitForDescendant(v60, {
        "CanvasContainer", 
        "CurveCanvas"
    });
end;
return v7;