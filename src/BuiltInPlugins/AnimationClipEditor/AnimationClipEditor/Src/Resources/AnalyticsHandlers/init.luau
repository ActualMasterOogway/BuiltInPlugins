local l_StudioService_0 = game:GetService("StudioService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local function _(v3) --[[ Line: 7 ]] --[[ Name: safeLower ]]
    if v3 then
        return (string.lower(v3));
    else
        return nil;
    end;
end;
return function(v5) --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_StudioService_0 (copy)
    local function v9(v6, v7) --[[ Line: 12 ]] --[[ Name: sendEvent ]]
        -- upvalues: v2 (ref), v5 (copy), l_StudioService_0 (ref)
        local v8 = v7 or {};
        v8 = v2.Dictionary.join({
            studioSid = v5:GetSessionId(), 
            clientId = v5:GetClientId(), 
            placeId = game.PlaceId, 
            userId = l_StudioService_0:GetUserId()
        }, v8);
        v5:SendEventDeferred("studio", "animationEditor", v6, v8);
    end;
    local function _(v10, v11) --[[ Line: 25 ]] --[[ Name: reportCounter ]]
        -- upvalues: v5 (copy)
        v5:ReportCounter(v10, v11 or 1);
    end;
    local function _(v13, v14) --[[ Line: 29 ]] --[[ Name: reportStats ]]
        -- upvalues: v5 (copy)
        v5:ReportStats(v13, v14 or 1);
    end;
    local function _(v16) --[[ Line: 33 ]] --[[ Name: makeStatName ]]
        return "studio" .. "." .. "animationEditor" .. "." .. v16;
    end;
    return {
        onEditorOpened = function(_, v19, v20, v21) --[[ Line: 38 ]] --[[ Name: onEditorOpened ]]
            -- upvalues: v9 (copy), v5 (copy)
            v9("toolOpened", {
                method = 1, 
                timelineUnit = v19, 
                keyframeSnap = v20, 
                snapMode = v21
            });
            local v22 = "studio" .. "." .. "animationEditor" .. "." .. "EditorOpened";
            v5:ReportCounter(v22, 1);
            v9("EditorOpened");
        end, 
        onEditorClosed = function(_, v24) --[[ Line: 49 ]] --[[ Name: onEditorClosed ]]
            -- upvalues: v9 (copy)
            v9("toolClosed", {
                timeOpen = v24, 
                method = 1
            });
        end, 
        onImportAnimation = function(_, v26, v27) --[[ Line: 56 ]] --[[ Name: onImportAnimation ]]
            -- upvalues: v9 (copy)
            v9("importAnimation", {
                animationId = v26, 
                guid = if v27 then string.lower(v27) else nil
            });
        end, 
        onImportFbxAnimation = function(_, v29) --[[ Line: 63 ]] --[[ Name: onImportFbxAnimation ]]
            -- upvalues: v9 (copy), v5 (copy)
            v9("importFbxAnimation", {
                guid = if v29 then string.lower(v29) else nil
            });
            local v30 = "studio" .. "." .. "animationEditor" .. "." .. "FBXAnimationImported";
            v5:ReportCounter(v30, 1);
            v9("FBXAnimationImported");
        end, 
        onUserChoseFBXModelForAnimImport = function(_, v32) --[[ Line: 71 ]] --[[ Name: onUserChoseFBXModelForAnimImport ]]
            -- upvalues: v5 (copy), v9 (copy)
            local v33 = "studio" .. "." .. "animationEditor" .. "." .. "UserChoseFBXModelForAnimImport";
            v5:ReportCounter(v33, 1);
            v9("userChoseFBXModelForAnimImport", {
                guid = if v32 then string.lower(v32) else nil
            });
        end, 
        onUserChoseSelectedModelForAnimImport = function(_, v35) --[[ Line: 78 ]] --[[ Name: onUserChoseSelectedModelForAnimImport ]]
            -- upvalues: v5 (copy), v9 (copy)
            local v36 = "studio" .. "." .. "animationEditor" .. "." .. "UserChoseSelectedModelForAnimImport";
            v5:ReportCounter(v36, 1);
            v9("userChoseSelectedModelForAnimImport", {
                guid = if v35 then string.lower(v35) else nil
            });
        end, 
        onExportAnimation = function(_, v38, v39, v40, v41) --[[ Line: 85 ]] --[[ Name: onExportAnimation ]]
            -- upvalues: v9 (copy)
            v9("exportAnimation", {
                animationType = v39, 
                hasFacs = v38, 
                assetId = v40, 
                guid = if v41 then string.lower(v41) else nil
            });
        end, 
        onLoadAnimation = function(_, v43, v44, v45, v46, v47, v48) --[[ Line: 94 ]] --[[ Name: onLoadAnimation ]]
            -- upvalues: v9 (copy)
            v9("loadAnimation", {
                animationType = v47, 
                name = v43, 
                numKeyframes = v44, 
                numPoses = v45, 
                numEvents = v46, 
                guid = if v48 then string.lower(v48) else nil
            });
        end, 
        onSaveAnimation = function(_, v50, v51, v52, v53, v54, v55) --[[ Line: 105 ]] --[[ Name: onSaveAnimation ]]
            -- upvalues: v9 (copy), v5 (copy)
            v9("saveAnimation", {
                animationType = v54, 
                name = v50, 
                numKeyframes = v51, 
                numPoses = v52, 
                numEvents = v53, 
                guid = if v55 then string.lower(v55) else nil
            });
            local v56 = "studio" .. "." .. "animationEditor" .. "." .. "ExportedKeyframes";
            v5:ReportStats(v56, v51 or 1);
            v56 = "studio" .. "." .. "animationEditor" .. "." .. "ExportedPoses";
            v5:ReportStats(v56, v52 or 1);
            v56 = "studio" .. "." .. "animationEditor" .. "." .. "ExportedEvents";
            v5:ReportStats(v56, v53 or 1);
        end, 
        onCreateNewAnimation = function(_, v58, v59) --[[ Line: 119 ]] --[[ Name: onCreateNewAnimation ]]
            -- upvalues: v9 (copy)
            v9("createNewAnimation", {
                name = v58, 
                guid = if v59 then string.lower(v59) else nil
            });
        end, 
        onQuantizeSelection = function(_, v61) --[[ Line: 126 ]] --[[ Name: onQuantizeSelection ]]
            -- upvalues: v9 (copy)
            v9("quantizeSelection", {
                didQuantize = v61
            });
        end, 
        onTimeUnitChanged = function(_, v63) --[[ Line: 132 ]] --[[ Name: onTimeUnitChanged ]]
            -- upvalues: v9 (copy)
            v9("timeUnitChanged", {
                timeUnit = v63
            });
        end, 
        onKeyframeSnapChanged = function(_, v65) --[[ Line: 138 ]] --[[ Name: onKeyframeSnapChanged ]]
            -- upvalues: v9 (copy)
            v9("keyframeSnapChanged", {
                keyframeSnap = v65
            });
        end, 
        onToolChanged = function(_, v67) --[[ Line: 144 ]] --[[ Name: onToolChanged ]]
            -- upvalues: v9 (copy)
            v9("toolChanged", {
                tool = v67
            });
        end, 
        onIkEnabled = function(_, v69) --[[ Line: 150 ]] --[[ Name: onIkEnabled ]]
            -- upvalues: v9 (copy), v5 (copy)
            v9("ikEnabled", {
                guid = if v69 then string.lower(v69) else nil
            });
            local v70 = "studio" .. "." .. "animationEditor" .. "." .. "IKEnabled";
            v5:ReportCounter(v70, 1);
            v9("IKEnabled");
        end, 
        onIkDisabled = function(_, v72, v73) --[[ Line: 158 ]] --[[ Name: onIkDisabled ]]
            -- upvalues: v9 (copy)
            v9("ikDisabled", {
                timeOpen = v72, 
                guid = if v73 then string.lower(v73) else nil
            });
        end, 
        onControlPressed = function(_, v75) --[[ Line: 165 ]] --[[ Name: onControlPressed ]]
            -- upvalues: v9 (copy)
            v9("controlPressed", {
                control = v75
            });
        end, 
        onTrackAdded = function(_, v77, v78, v79) --[[ Line: 171 ]] --[[ Name: onTrackAdded ]]
            -- upvalues: v9 (copy)
            v9("trackAdded", {
                trackName = v77, 
                editorMode = v78, 
                guid = if v79 then string.lower(v79) else nil
            });
        end, 
        onTrackDeleted = function(_, v81, v82, v83, v84) --[[ Line: 179 ]] --[[ Name: onTrackDeleted ]]
            -- upvalues: v9 (copy)
            v9("trackDeleted", {
                trackName = v81, 
                hadKeyframes = v82, 
                editorMode = v83, 
                guid = if v84 then string.lower(v84) else nil
            });
        end, 
        onTrackSelected = function(_, v86, v87, v88, v89) --[[ Line: 188 ]] --[[ Name: onTrackSelected ]]
            -- upvalues: v9 (copy)
            v9("trackSelected", {
                trackName = v86, 
                source = v87, 
                editorMode = v88, 
                guid = if v89 then string.lower(v89) else nil
            });
        end, 
        onRenameKeyframe = function(_, v91, v92) --[[ Line: 197 ]] --[[ Name: onRenameKeyframe ]]
            -- upvalues: v9 (copy)
            v9("renameKeyframe", {
                name = v91, 
                guid = if v92 then string.lower(v92) else nil
            });
        end, 
        onAddEvent = function(_, v94, v95, v96, v97) --[[ Line: 204 ]] --[[ Name: onAddEvent ]]
            -- upvalues: v9 (copy), v5 (copy)
            v9("addEvent", {
                name = v94, 
                parameter = v95, 
                editorMode = v96, 
                guid = if v97 then string.lower(v97) else nil
            });
            local v98 = "studio" .. "." .. "animationEditor" .. "." .. "EventAdded";
            v5:ReportCounter(v98, 1);
            v9("EventAdded");
        end, 
        onAddKeyframe = function(_, v100, v101, v102) --[[ Line: 215 ]] --[[ Name: onAddKeyframe ]]
            -- upvalues: v9 (copy), v5 (copy)
            v9("addKeyframe", {
                trackName = v100, 
                editorMode = v101, 
                guid = if v102 then string.lower(v102) else nil
            });
            local v103 = "studio" .. "." .. "animationEditor" .. "." .. "KeyframeAdded";
            v5:ReportCounter(v103, 1);
            v9("KeyframeAdded");
        end, 
        onDeleteKeyframe = function(_, v105, v106, v107) --[[ Line: 225 ]] --[[ Name: onDeleteKeyframe ]]
            -- upvalues: v9 (copy)
            v9("deleteKeyframe", {
                trackName = v105, 
                editorMode = v106, 
                guid = if v107 then string.lower(v107) else nil
            });
        end, 
        onPromoteAnimation = function(_, v109, v110, v111, v112, v113) --[[ Line: 233 ]] --[[ Name: onPromoteAnimation ]]
            -- upvalues: v9 (copy)
            v9("promoteAnimation", {
                name = v109, 
                numKeyframes = v111, 
                numTracks = v110, 
                numEvents = v112, 
                guid = if v113 then string.lower(v113) else nil
            });
        end, 
        onAnimationEditorImportVideoCreate = function(_) --[[ Line: 243 ]] --[[ Name: onAnimationEditorImportVideoCreate ]]
            -- upvalues: v9 (copy)
            v9("animationEditorImportVideoCreate", {});
        end, 
        onAnimationEditorImportVideoUploadCancel = function(_, v116) --[[ Line: 247 ]] --[[ Name: onAnimationEditorImportVideoUploadCancel ]]
            -- upvalues: v9 (copy)
            v9("animationEditorImportVideoUploadCancel", {
                duration = v116
            });
        end, 
        onAnimationEditorImportVideoUploadSucceed = function(_, v118) --[[ Line: 253 ]] --[[ Name: onAnimationEditorImportVideoUploadSucceed ]]
            -- upvalues: v9 (copy)
            v9("animationEditorImportVideoUploadSucceed", {
                duration = v118
            });
        end, 
        onAnimationEditorImportVideoError = function(_, v120, v121) --[[ Line: 259 ]] --[[ Name: onAnimationEditorImportVideoError ]]
            -- upvalues: v9 (copy)
            v9("animationEditorImportVideoError", {
                errorMsg = v120, 
                duration = v121
            });
        end, 
        onFacialAnimationRecordingEnabled = function(_) --[[ Line: 266 ]] --[[ Name: onFacialAnimationRecordingEnabled ]]
            -- upvalues: v9 (copy)
            v9("facialAnimationRecordingEnabled", {});
        end, 
        onFacialAnimationRecordingStartRecording = function(_) --[[ Line: 270 ]] --[[ Name: onFacialAnimationRecordingStartRecording ]]
            -- upvalues: v9 (copy)
            v9("facialAnimationRecordingStartRecording", {});
        end, 
        onFacialAnimationRecordingEndRecording = function(_, v125) --[[ Line: 274 ]] --[[ Name: onFacialAnimationRecordingEndRecording ]]
            -- upvalues: v9 (copy)
            v9("facialAnimationRecordingEndRecording", {
                duration = v125
            });
        end, 
        onFacialAnimationRecordingReRecordPressed = function(_) --[[ Line: 280 ]] --[[ Name: onFacialAnimationRecordingReRecordPressed ]]
            -- upvalues: v9 (copy)
            v9("facialAnimationRecordingReRecordPressed", {});
        end, 
        onEditorModeSwitch = function(_, v128, v129, v130, v131) --[[ Line: 284 ]] --[[ Name: onEditorModeSwitch ]]
            -- upvalues: v9 (copy)
            v9("editorModeSwitch", {
                oldMode = v128, 
                newMode = v129, 
                duration = v130, 
                guid = if v131 then string.lower(v131) else nil
            });
        end, 
        onKeyframeReductionApply = function(_, v133, v134, v135, v136, v137, v138) --[[ Line: 293 ]] --[[ Name: onKeyframeReductionApply ]]
            -- upvalues: v9 (copy)
            v9("keyframeReductionApply", {
                isChannelAnimation = v134, 
                tracks = v133, 
                before = v135, 
                after = v136, 
                hasMoved = v137, 
                guid = if v138 then string.lower(v138) else nil
            });
        end, 
        onKeyframeReductionCancel = function(_, v140, v141, v142, v143) --[[ Line: 304 ]] --[[ Name: onKeyframeReductionCancel ]]
            -- upvalues: v9 (copy)
            v9("keyframeReductionCancel", {
                isChannelAnimation = v141, 
                tracks = v140, 
                hasMoved = v142, 
                guid = if v143 then string.lower(v143) else nil
            });
        end, 
        onCreateFromVideo = function(_, v145) --[[ Line: 313 ]] --[[ Name: onCreateFromVideo ]]
            -- upvalues: v9 (copy)
            v9("createFromVideo", {
                guid = if v145 then string.lower(v145) else nil
            });
        end, 
        onClipboardOperation = function(_, v147) --[[ Line: 319 ]] --[[ Name: onClipboardOperation ]]
            -- upvalues: v9 (copy)
            v9("clipboardOperation", {
                operation = v147
            });
        end, 
        onMigrateAnimations = function(_, v149, v150, v151, v152) --[[ Line: 325 ]] --[[ Name: onMigrateAnimations ]]
            -- upvalues: v9 (copy)
            v9("migrateAnimations", {
                migrate = v149, 
                delete = v150, 
                ignore = v151, 
                skipped = v152
            });
        end
    };
end;