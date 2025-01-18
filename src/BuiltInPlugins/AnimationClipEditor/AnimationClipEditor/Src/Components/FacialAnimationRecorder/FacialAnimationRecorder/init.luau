local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Focus_0 = l_ContextServices_0.Focus;
local l_CoreGui_0 = game:GetService("CoreGui");
local v7 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v8 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v9 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v10 = require(l_script_FirstAncestor_0.Src.Thunks.Recording.LoadRecorderFrames);
local v11 = require(l_script_FirstAncestor_0.Src.Thunks.Recording.SetFacialRecordingMode);
local v12 = require(l_script_FirstAncestor_0.Src.Actions.SetHaveToSetBackToNotLooping);
local v13 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationData);
local v14 = require(l_script_FirstAncestor_0.Src.Components.FacialAnimationRecorder.CameraSelectionDialog);
local v15 = require(l_script_FirstAncestor_0.Src.Components.FacialAnimationRecorder.ShowStyledDialog);
local v16 = require(l_script_FirstAncestor_0.Src.Components.FacialAnimationRecorder.WarningDialog);
local v17 = require(l_script_FirstAncestor_0.Src.Components.FacialAnimationRecorder.WarningOverlay);
local v18 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v19 = require(l_script_FirstAncestor_0.Src.Util.RTAnimationUtil);
local l_RunService_0 = game:GetService("RunService");
local l_VideoCaptureService_0 = game:GetService("VideoCaptureService");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local v23 = v1.PureComponent:extend("FacialAnimationRecorder");
local v24 = game:DefineFastInt("FacialAnimationRecorderMaxRecordingTimeInSeconds", 60);
local v25 = game:DefineFastString("ACEFaceRecorderBiometricsLink", "https://en.help.roblox.com/hc/articles/8064749848980");
local v26 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_StyleModifier_0 = v26.Util.StyleModifier;
local _ = v26.Util.StyleValue;
local l_UI_0 = v26.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Button_0 = v26.UI.Button;
local _ = l_UI_0.TextLabel;
local l_Container_0 = l_UI_0.Container;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local v37 = require(script.Parent.FlashingDot);
local v38 = require(l_script_FirstAncestor_0.Src.Actions.SetPlayState);
local v39 = require(l_script_FirstAncestor_0.Src.Actions.SetInReviewState);
local v40 = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
local l_Selection_0 = game:GetService("Selection");
local l_RealTimeAnimationEnableRefactor_0 = game:GetFastFlag("RealTimeAnimationEnableRefactor");
local v43 = false;
local v44 = false;
v23.init = function(v45) --[[ Line: 57 ]] --[[ Name: init ]]
    -- upvalues: l_CoreGui_0 (copy), l_Focus_0 (copy), v18 (copy), v43 (ref), v9 (copy), l_Selection_0 (copy), v44 (ref), v15 (copy), v16 (copy), v25 (copy), l_VideoCaptureService_0 (copy)
    v45.presentationGui = l_CoreGui_0.RobloxGui;
    v45.focus = l_Focus_0.new(v45.presentationGui);
    v45:setState({
        remainingSeconds = 0, 
        shouldShowCameraSelectionDialog = false, 
        isAgeRestricted = false, 
        shouldShowNoCamerasWarning = false, 
        deniedCameraPermission = false
    });
    v45.startRecording = function() --[[ Line: 69 ]]
        -- upvalues: v45 (copy)
        v45.timeAtStartOfRecording = os.clock();
        v45.props.Analytics:report("onFacialAnimationRecordingStartRecording");
        v45:setState({
            isRecording = true
        });
    end;
    v45.resetLooping = function() --[[ Line: 79 ]]
        -- upvalues: v45 (copy), v18 (ref)
        local l_props_0 = v45.props;
        if not l_props_0.haveToSetBackToNotLooping then
            return;
        else
            l_props_0.haveToSetBackToNotLooping = false;
            local l_AnimationData_0 = l_props_0.AnimationData;
            if l_AnimationData_0 and l_AnimationData_0.Metadata.Looping then
                v18.setLooping(l_AnimationData_0, false);
                l_props_0:SetAnimationData(l_AnimationData_0);
            end;
            return;
        end;
    end;
    v45.endRecording = function() --[[ Line: 95 ]]
        -- upvalues: v45 (copy), v43 (ref), v18 (ref), v9 (ref), l_Selection_0 (ref)
        v45.timeAtEndOfRecording = os.clock();
        local l_props_1 = v45.props;
        l_props_1.Analytics:report("onFacialAnimationRecordingEndRecording", v45.timeAtStartOfRecording and v45.timeAtEndOfRecording - v45.timeAtStartOfRecording or 0);
        l_props_1.SetInReviewState(true);
        v45:setState({
            isRecording = false
        });
        v43 = v18.hasFacsData(v45.props.AnimationData);
        l_props_1:LoadRecorderFrames(v45.RecordedFrames, l_props_1.Analytics);
        l_props_1.SetFacialRecordingMode(false);
        v45:disconnect();
        l_props_1.StepAnimation(0);
        l_props_1.SetPlayState(v9.PLAY_STATE.Play);
        local v49 = nil;
        v49 = l_Selection_0.SelectionChanged:Connect(function(_) --[[ Line: 127 ]]
            -- upvalues: v49 (ref), l_props_1 (copy)
            v49:Disconnect();
            l_props_1.SetInReviewState(false);
        end);
    end;
    v45.showCameraSelectionDialog = function() --[[ Line: 133 ]]
        -- upvalues: v45 (copy)
        v45:setState({
            shouldShowCameraSelectionDialog = true
        });
    end;
    v45.hideCameraSelectionDialog = function() --[[ Line: 139 ]]
        -- upvalues: v45 (copy)
        v45:setState({
            shouldShowCameraSelectionDialog = false
        });
    end;
    v45.movePlayheadToBeginning = function() --[[ Line: 145 ]]
        -- upvalues: v45 (copy)
        wait(0.1);
        if v45.props.RootInstance then
            v45.props.StepAnimation(0);
        end;
    end;
    v45.dismissSelf = function() --[[ Line: 155 ]]
        -- upvalues: v45 (copy)
        local l_props_2 = v45.props;
        l_props_2.SetInReviewState(false);
        l_props_2.SetFacialRecordingMode(false);
        v45.movePlayheadToBeginning();
    end;
    v45.toggleRecording = function() --[[ Line: 162 ]]
        -- upvalues: v45 (copy)
        if v45.state.isRecording then
            v45.endRecording();
            return;
        else
            v45.startRecording();
            return;
        end;
    end;
    v45.triggerReRecording = function() --[[ Line: 171 ]]
        -- upvalues: v45 (copy), v44 (ref), v9 (ref)
        local l_props_3 = v45.props;
        l_props_3.Analytics:report("onFacialAnimationRecordingReRecordPressed");
        v44 = true;
        v45.resetLooping();
        l_props_3.SetPlayState(v9.PLAY_STATE.Pause);
        v45.movePlayheadToBeginning();
        v45.props.SetInReviewState(false);
        v45.props.SetFacialRecordingMode(true);
        v45:InitializeRecordingMode();
    end;
    v45.showAgeRestrictionError = function() --[[ Line: 186 ]]
        -- upvalues: v45 (copy), v15 (ref), v16 (ref)
        local l_props_4 = v45.props;
        local l_Localization_0 = l_props_4.Localization;
        v45:setState({
            isAgeRestricted = true
        });
        v15(l_props_4.Plugin, l_props_4.Localization, l_props_4.Stylizer, l_props_4.Mouse, v16, {
            Title = l_Localization_0:getText("FaceCapture", "WarningTitle"), 
            TitleText = l_Localization_0:getText("FaceCapture", "AgeRestrictedTitle"), 
            BodyText = l_Localization_0:getText("FaceCapture", "AgeRestrictedBody"), 
            Buttons = {
                {
                    Key = "Ok", 
                    Text = l_props_4.Localization:getText("FaceCapture", "WarningDialogOk"), 
                    Style = "RoundPrimary"
                }
            }, 
            OnButtonPressed = v45.dismissSelf, 
            OnClose = v45.dismissSelf
        });
    end;
    v45.showBiometricDataCollectionDialog = function() --[[ Line: 208 ]]
        -- upvalues: v45 (copy), v15 (ref), v16 (ref), v25 (ref)
        local l_props_5 = v45.props;
        local l_Localization_1 = l_props_5.Localization;
        local l_FacialAnimationRecordingService_0 = game:GetService("FacialAnimationRecordingService");
        v15(l_props_5.Plugin, l_props_5.Localization, l_props_5.Stylizer, l_props_5.Mouse, v16, {
            Title = l_Localization_1:getText("FaceCapture", "WarningTitle"), 
            TitleText = l_Localization_1:getText("FaceCapture", "BioDataCollectionTitle"), 
            BodyText = l_Localization_1:getText("FaceCapture", "BioDataCollectionBody"), 
            Buttons = {
                {
                    Key = "Disagree", 
                    Text = l_Localization_1:getText("FaceCapture", "BioDataCollectionDisagree"), 
                    Style = "Round"
                }, 
                {
                    Key = "Agree", 
                    Text = l_Localization_1:getText("FaceCapture", "BioDataCollectionAgree"), 
                    Style = "Round"
                }
            }, 
            OnButtonPressed = function(v58) --[[ Line: 230 ]] --[[ Name: OnButtonPressed ]]
                -- upvalues: l_FacialAnimationRecordingService_0 (copy), v45 (ref)
                if v58 == "Agree" then
                    l_FacialAnimationRecordingService_0.BiometricDataConsent = true;
                    v45:StartupInitialize();
                    return;
                else
                    v45.dismissSelf();
                    return;
                end;
            end, 
            OnClose = v45.dismissSelf, 
            learnMoreUrl = v25, 
            learnMoreLabel = l_Localization_1:getText("FaceCapture", "LearnMoreLabel")
        });
    end;
    v45.numberOfCameras = function() --[[ Line: 244 ]]
        -- upvalues: l_VideoCaptureService_0 (ref)
        local l_l_VideoCaptureService_0_CameraDevices_0 = l_VideoCaptureService_0:GetCameraDevices();
        local v60 = 0;
        for _ in pairs(l_l_VideoCaptureService_0_CameraDevices_0) do
            v60 = v60 + 1;
        end;
        return v60;
    end;
    v45.checkAndShowCameraWarning = function() --[[ Line: 253 ]]
        -- upvalues: v45 (copy)
        local v62 = v45.numberOfCameras() == 0;
        v45:setState({
            shouldShowNoCamerasWarning = v62
        });
    end;
    v45.checkOrRequestCameraPermission = function() --[[ Line: 261 ]]
        -- upvalues: v45 (copy)
        local l_FacialAnimationRecordingService_1 = game:GetService("FacialAnimationRecordingService");
        local v64 = {
            AUTHORIZED = "AUTHORIZED", 
            DENIED = "DENIED"
        };
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 268 ]]
            -- upvalues: l_FacialAnimationRecordingService_1 (copy)
            return l_FacialAnimationRecordingService_1:CheckOrRequestCameraPermission();
        end);
        if not l_status_0 then
            return;
        else
            local v67 = l_result_0 == v64.DENIED;
            v45:setState({
                deniedCameraPermission = v67
            });
            return;
        end;
    end;
end;
v23.updateAvatarData = function(v68) --[[ Line: 285 ]] --[[ Name: updateAvatarData ]]
    -- upvalues: v8 (copy)
    local l_RootInstance_0 = v68.props.RootInstance;
    if not v68.Animator then
        v68.Animator = v8.getAnimationController(l_RootInstance_0):FindFirstChildOfClass("Animator");
    end;
end;
v23.InitializeRecordingMode = function(v70) --[[ Line: 296 ]] --[[ Name: InitializeRecordingMode ]]
    -- upvalues: l_RealTimeAnimationEnableRefactor_0 (copy), v19 (copy), l_CoreGui_0 (copy), l_FaceAnimatorService_0 (copy), v7 (copy), l_RunService_0 (copy), v24 (copy), v9 (copy)
    if l_RealTimeAnimationEnableRefactor_0 then
        if not v19 then
            return;
        elseif not v70.graph then
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Parent = l_CoreGui_0;
            l_Folder_0.Name = "RTAnimation";
            v70.graph = v19.new(0, l_Folder_0);
            v70.faceTracker = v70.graph:createLocalTracker();
            v70.faceTracker.SessionName = "StudioFaceRecording";
            v70.faceTracker.TrackerType = Enum.TrackerType.Face;
        end;
    elseif not l_FaceAnimatorService_0 then
        return;
    else
        l_FaceAnimatorService_0.FlipHeadOrientation = false;
        if not l_FaceAnimatorService_0:IsStarted() then
            l_FaceAnimatorService_0:Init(true, false);
        end;
    end;
    task.defer(v70.checkOrRequestCameraPermission);
    v70.RecordInfo = {};
    v70.RecordedFrames = {};
    v70.HeartbeatCount = 0;
    local l_RootInstance_1 = v70.props.Status.RootInstance;
    v7.clearPose(l_RootInstance_1);
    v7.focusCameraOnFace(v70.props.RootInstance);
    v70:updateAvatarData();
    if l_RealTimeAnimationEnableRefactor_0 then
        if not v70.graph then
            return;
        else
            if not v70.track then
                local v73, v74 = v70.graph:createStreamAnimationAndTrack(v70.Animator, nil, false, false);
                v70.track = v74;
                v70.graph:connectToLocalTrackerOutput(v73);
                v70.graph:setTracking(true);
            end;
            if not v70.track then
                return;
            else
                v70.track:Play();
                v70.graph:setCameraEnabled(true);
                assert(v70.graph:getTracking(), "Local tracking must have started once animation output is connected!");
            end;
        end;
    else
        v70.animation = Instance.new("TrackerStreamAnimation");
        if game:GetEngineFeature("UseNewLoadStreamAnimationAPI") then
            v70.track = v70.Animator:LoadStreamAnimationV2(v70.animation, nil, false, false);
        else
            v70.track = v70.Animator:LoadStreamAnimation(v70.animation);
        end;
        if not v70.track then
            return;
        else
            v70.track:Play();
        end;
    end;
    v70.heartbeatSignal = l_RunService_0.Heartbeat:Connect(function(v75) --[[ Line: 371 ]]
        -- upvalues: v70 (copy), l_RealTimeAnimationEnableRefactor_0 (ref), l_FaceAnimatorService_0 (ref), v24 (ref), v9 (ref)
        local l_v70_0 = v70;
        l_v70_0.HeartbeatCount = l_v70_0.HeartbeatCount + 1;
        l_v70_0 = v70.state.isRecording;
        if math.fmod(v70.HeartbeatCount, 30) == 0 then
            v70.checkAndShowCameraWarning();
        end;
        v70:updateAvatarData();
        if l_RealTimeAnimationEnableRefactor_0 then
            if v70.faceTracker then
                v70.faceTracker:Step();
            end;
        else
            l_FaceAnimatorService_0:Step();
        end;
        v70.Animator:StepAnimations(v75);
        local l_TrackerData_0, v78, v79 = v70.track:GetTrackerData();
        local v80 = v79 > 0;
        v70:setState({
            isCameraReady = v80
        });
        if l_v70_0 and v80 then
            if not v70.RecordInfo.startTime then
                v70.RecordInfo.startTime = v79;
            end;
            local l_v24_0 = v24;
            local v82 = v79 - v70.RecordInfo.startTime;
            local v83 = l_v24_0 - v82;
            if v83 < 0 then
                v70.endRecording();
            end;
            local v84 = math.floor(v82 * v9.TICK_FREQUENCY + 0.5);
            local v85 = {};
            for v86, v87 in pairs(l_TrackerData_0) do
                v85[v86] = v87;
            end;
            v85.Head = v78;
            v70.RecordedFrames[v84] = v85;
            local v88 = math.floor(v83);
            if v70.state.remainingSeconds ~= v88 then
                v70:setState({
                    remainingSeconds = v88
                });
            end;
        end;
    end);
end;
v23.StartupInitialize = function(v89) --[[ Line: 436 ]] --[[ Name: StartupInitialize ]]
    -- upvalues: v44 (ref), v43 (ref)
    local l_FacialAnimationRecordingService_2 = game:GetService("FacialAnimationRecordingService");
    v44 = false;
    v43 = false;
    v89.props.SetInReviewState(false);
    v89.resetLooping();
    if l_FacialAnimationRecordingService_2:IsAgeRestricted() then
        v89.showAgeRestrictionError();
        return;
    elseif not l_FacialAnimationRecordingService_2.BiometricDataConsent then
        v89.showBiometricDataCollectionDialog();
        return;
    else
        v89:InitializeRecordingMode();
        return;
    end;
end;
v23.didMount = function(v91) --[[ Line: 457 ]] --[[ Name: didMount ]]
    v91:StartupInitialize();
end;
v23.render = function(v92) --[[ Line: 461 ]] --[[ Name: render ]]
    -- upvalues: v44 (ref), v43 (ref), l_ContextServices_0 (copy), v1 (copy), l_Container_0 (copy), l_Pane_0 (copy), l_Button_0 (copy), l_StyleModifier_0 (copy), l_Tooltip_0 (copy), l_HoverArea_0 (copy), v37 (copy), l_LoadingIndicator_0 (copy), v17 (copy), v14 (copy)
    local l_props_6 = v92.props;
    local l_Stylizer_0 = l_props_6.Stylizer;
    local l_Localization_2 = v92.props.Localization;
    local l_isRecording_0 = v92.state.isRecording;
    local l_inReviewState_0 = l_props_6.inReviewState;
    local _ = l_props_6.haveToSetBackToNotLooping;
    local l_isCameraReady_0 = v92.state.isCameraReady;
    local l_isAgeRestricted_0 = v92.state.isAgeRestricted;
    local l_remainingSeconds_0 = v92.state.remainingSeconds;
    local l_deniedCameraPermission_0 = v92.state.deniedCameraPermission;
    local l_shouldShowCameraSelectionDialog_0 = v92.state.shouldShowCameraSelectionDialog;
    local l_shouldShowNoCamerasWarning_0 = v92.state.shouldShowNoCamerasWarning;
    local _ = l_props_6.StepAnimation;
    local _ = v92.state.AnimationData;
    local l_faceCaptureDefaultButtonIconColor_0 = l_Stylizer_0.faceCaptureTheme.faceCaptureDefaultButtonIconColor;
    local l_stopRecordingButtonImage_0 = l_Stylizer_0.faceCaptureTheme.stopRecordingButtonImage;
    local l_errorIcon_0 = l_Stylizer_0.faceCaptureTheme.errorIcon;
    local l_TextColor_0 = l_props_6.Stylizer.TextColor;
    local v111 = os.clock();
    local v112 = not v44 and v43 and v92.timeAtEndOfRecording and v111 - v92.timeAtEndOfRecording <= 5;
    return l_ContextServices_0.provide({
        v92.focus
    }, {
        RecordingPanelPortal = not l_isAgeRestricted_0 and v1.createElement(v1.Portal, {
            target = v92.presentationGui
        }, {
            RecordingPanelContainer = v1.createElement(l_Container_0, {
                Size = UDim2.new(0, 160, 0, 38), 
                Position = UDim2.new(0.5, 0, 1, -5), 
                AnchorPoint = Vector2.new(0.5, 1), 
                Padding = {
                    Left = 5, 
                    Right = 5
                }
            }, {
                RecordingPanel = v1.createElement(l_Pane_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Padding = {
                        Left = 40, 
                        Right = 40
                    }, 
                    Layout = Enum.FillDirection.Horizontal, 
                    Spacing = 3, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    ZIndex = 1, 
                    Style = "RoundBox", 
                    Image = "", 
                    BackgroundColor3 = l_props_6.Stylizer.Color, 
                    BackgroundTransparency = 0.1, 
                    ImageTransparency = 0.1
                }, {
                    Corner = v1.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 8)
                    }), 
                    RecordButton = not l_inReviewState_0 and v1.createElement(l_Button_0, {
                        Size = UDim2.new(0, 30, 0, 30), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        ImageTransparency = 1, 
                        BackgroundTransparency = 0.5, 
                        BorderSizePixel = 1, 
                        OnClick = v92.toggleRecording, 
                        Text = "", 
                        LayoutOrder = 1, 
                        Style = {
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0
                        }, 
                        StyleModifier = not l_isCameraReady_0 and l_StyleModifier_0.Disabled or nil
                    }, {
                        Image = v1.createElement("ImageLabel", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, 30, 0, 30), 
                            Position = UDim2.new(0, 0, 0, 0), 
                            Image = l_isRecording_0 and l_stopRecordingButtonImage_0 or "rbxasset://textures/AnimationEditor/FaceCaptureUI/button_control_record.png"
                        }), 
                        Tooltip = v1.createElement(l_Tooltip_0, {
                            Text = l_isRecording_0 and l_Localization_2:getText("FaceCapture", "TooltipStopRecording") or l_Localization_2:getText("FaceCapture", "TooltipStartRecording")
                        }); 
                        v1.createElement(l_HoverArea_0, {
                            Cursor = "PointingHand"
                        })
                    }), 
                    ReRecordButton = l_inReviewState_0 and v1.createElement(l_Button_0, {
                        Size = UDim2.new(0, 30, 0, 30), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        ImageTransparency = 1, 
                        BackgroundTransparency = 0.5, 
                        BorderSizePixel = 1, 
                        OnClick = v92.triggerReRecording, 
                        Text = "", 
                        LayoutOrder = 1, 
                        Style = {
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0
                        }, 
                        StyleModifier = not l_isCameraReady_0 and l_StyleModifier_0.Disabled or nil
                    }, {
                        Image = v1.createElement("ImageLabel", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, 30, 0, 30), 
                            Position = UDim2.new(0, 0, 0, 0), 
                            Image = "rbxasset://textures/AnimationEditor/FaceCaptureUI/ReRecordButton.png", 
                            ImageColor3 = l_faceCaptureDefaultButtonIconColor_0
                        }), 
                        Tooltip = v1.createElement(l_Tooltip_0, {
                            Text = l_Localization_2:getText("FaceCapture", "TooltipReRecording")
                        }); 
                        v1.createElement(l_HoverArea_0, {
                            Cursor = "PointingHand"
                        })
                    }), 
                    FlashingDot = l_isRecording_0 and v1.createElement(v37, {
                        Size = UDim2.new(0, 20, 0, 7), 
                        PaddingLeft = 30, 
                        LayoutOrder = 2
                    }), 
                    TextLabelButton = l_isCameraReady_0 and v1.createElement(l_Button_0, {
                        Size = l_isRecording_0 and l_remainingSeconds_0 and UDim2.new(0, 68, 1, 0) or UDim2.new(0, 60, 1, 0), 
                        Position = UDim2.new(0, 0, 0, 0), 
                        ImageTransparency = 1, 
                        BackgroundTransparency = 0.5, 
                        BorderSizePixel = 1, 
                        OnClick = l_inReviewState_0 and v92.triggerReRecording or not (l_inReviewState_0 or l_isRecording_0) and v92.toggleRecording or not l_inReviewState_0 and l_isRecording_0 and v92.toggleRecording, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextTruncate = Enum.TextTruncate.None, 
                        TextSize = 15, 
                        Text = l_inReviewState_0 and l_Localization_2:getText("FaceCapture", "PanelReRecording") or not l_inReviewState_0 and (l_isRecording_0 and l_remainingSeconds_0 .. " sec   " or l_Localization_2:getText("FaceCapture", "PanelReady")), 
                        LayoutOrder = 3, 
                        Style = {
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            TextColor = l_TextColor_0
                        }
                    }), 
                    LoadingIndicator = not l_inReviewState_0 and not l_isCameraReady_0 and v1.createElement(l_LoadingIndicator_0, {
                        Size = UDim2.new(0, 60, 0, 15), 
                        LayoutOrder = 2
                    }), 
                    CameraSelectionButton = not l_inReviewState_0 and not l_isRecording_0 and v1.createElement(l_Button_0, {
                        Size = UDim2.fromOffset(30, 30), 
                        Style = {
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0
                        }, 
                        Text = "", 
                        TextSize = 30, 
                        OnClick = v92.showCameraSelectionDialog, 
                        LayoutOrder = 4
                    }, {
                        Image = v1.createElement("ImageLabel", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, 30, 0, 30), 
                            Position = UDim2.new(0, 0, 0, 0), 
                            Image = "rbxasset://textures/AnimationEditor/FaceCaptureUI/MoreButton.png", 
                            ImageColor3 = l_faceCaptureDefaultButtonIconColor_0
                        }), 
                        Tooltip = v1.createElement(l_Tooltip_0, {
                            Text = l_Localization_2:getText("FaceCapture", "TooltipCameraSettings"), 
                            Position = UDim2.new(0, 50, 0, 50)
                        }); 
                        v1.createElement(l_HoverArea_0, {
                            Cursor = "PointingHand"
                        })
                    })
                }), 
                DismissButton = v1.createElement(l_Button_0, {
                    Style = {
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0
                    }, 
                    Size = UDim2.new(0, 16, 0, 16), 
                    Position = UDim2.new(1, 0, 0, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    ZIndex = 10, 
                    OnClick = function() --[[ Line: 652 ]] --[[ Name: OnClick ]]
                        -- upvalues: v92 (copy)
                        v92.dismissSelf();
                    end
                }, {
                    Image = v1.createElement("ImageLabel", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 16, 0, 16), 
                        Image = "rbxasset://textures/AnimationEditor/FaceCaptureUI/CloseButton.png"
                    })
                })
            }), 
            WarningsPane = v1.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Position = UDim2.new(0.5, 0, 1, -50), 
                AnchorPoint = Vector2.new(0.5, 1), 
                Layout = Enum.FillDirection.Vertical, 
                Spacing = 8, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                ZIndex = 1, 
                Style = "RoundBox", 
                ImageTransparency = 1
            }, {
                NoCameraWarningOverlay = l_shouldShowNoCamerasWarning_0 and v1.createElement(v17, {
                    TitleText = l_Localization_2:getText("FaceCapture", "NoCameraWarningText"), 
                    Image = l_errorIcon_0, 
                    LayoutOrder = 1
                }), 
                CameraPermissionDeniedWarningOverlay = l_deniedCameraPermission_0 and v1.createElement(v17, {
                    TitleText = l_Localization_2:getText("FaceCapture", "CameraPermissionDeniedWarningText"), 
                    Image = l_errorIcon_0, 
                    LayoutOrder = 2
                }), 
                DetectingCameraOverlay = not l_inReviewState_0 and not l_isCameraReady_0 and not l_isRecording_0 and not l_shouldShowNoCamerasWarning_0 and not l_deniedCameraPermission_0 and v1.createElement(v17, {
                    TitleText = l_Localization_2:getText("FaceCapture", "DetectingCameraTitle"), 
                    Image = "", 
                    LayoutOrder = 3
                }), 
                PreviousFacsWillBeOverwrittenInfoOverlay = l_inReviewState_0 and l_isCameraReady_0 and not l_isRecording_0 and v112 and v1.createElement(v17, {
                    TitleText = l_Localization_2:getText("FaceCapture", "OverwritingPreviousFacsTracksBody"), 
                    Image = "", 
                    LayoutOrder = 4
                })
            })
        }), 
        CameraSelectionDialog = l_shouldShowCameraSelectionDialog_0 and v1.createElement(v14, {
            OnClose = v92.hideCameraSelectionDialog
        })
    });
end;
v23.disconnect = function(v113) --[[ Line: 715 ]] --[[ Name: disconnect ]]
    if v113.heartbeatSignal then
        v113.heartbeatSignal:Disconnect();
    end;
    if v113.track then
        v113.track:Stop(0);
    end;
    if v113.Animator then
        v113.Animator:StepAnimations(0);
    end;
    if v113.graph then
        v113.graph:setCameraEnabled(false);
    end;
end;
v23.willUnmount = function(v114) --[[ Line: 733 ]] --[[ Name: willUnmount ]]
    -- upvalues: v44 (ref)
    v44 = false;
    v114.resetLooping();
    v114.props.SetInReviewState(false);
    v114:disconnect();
    if v114.graph then
        v114.graph:teardown();
    end;
end;
v23 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse, 
    Plugin = l_ContextServices_0.Plugin
})(v23);
return v2.connect(function(v115, _) --[[ Line: 752 ]] --[[ Name: mapStateToProps ]]
    return {
        AnimationData = v115.AnimationData, 
        PlayState = v115.Status.PlayState, 
        RootInstance = v115.Status.RootInstance, 
        Status = v115.Status, 
        inReviewState = v115.Status.inReviewState, 
        haveToSetBackToNotLooping = v115.Status.haveToSetBackToNotLooping
    };
end, function(v117) --[[ Line: 763 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v10 (copy), v11 (copy), v39 (copy), v38 (copy), v40 (copy), v12 (copy), v13 (copy)
    return {
        LoadRecorderFrames = function(v118, v119, v120) --[[ Line: 766 ]] --[[ Name: LoadRecorderFrames ]]
            -- upvalues: v117 (copy), v10 (ref)
            v117(v10(v118, v119, v120));
        end, 
        SetFacialRecordingMode = function(v121) --[[ Line: 769 ]] --[[ Name: SetFacialRecordingMode ]]
            -- upvalues: v117 (copy), v11 (ref)
            v117(v11(v121));
        end, 
        SetInReviewState = function(v122) --[[ Line: 772 ]] --[[ Name: SetInReviewState ]]
            -- upvalues: v117 (copy), v39 (ref)
            v117(v39(v122));
        end, 
        SetPlayState = function(v123) --[[ Line: 775 ]] --[[ Name: SetPlayState ]]
            -- upvalues: v117 (copy), v38 (ref)
            v117(v38(v123));
        end, 
        StepAnimation = function(v124) --[[ Line: 778 ]] --[[ Name: StepAnimation ]]
            -- upvalues: v117 (copy), v40 (ref)
            v117(v40(v124));
        end, 
        SetHaveToSetBackToNotLooping = function(v125) --[[ Line: 781 ]] --[[ Name: SetHaveToSetBackToNotLooping ]]
            -- upvalues: v117 (copy), v12 (ref)
            v117(v12(v125));
        end, 
        SetAnimationData = function(_, v127) --[[ Line: 784 ]] --[[ Name: SetAnimationData ]]
            -- upvalues: v117 (copy), v13 (ref), v40 (ref)
            v117(v13(v127));
            local _ = v127.Metadata.Looping;
            v117(v40(0));
        end
    };
end)(v23);