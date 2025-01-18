local l_status_0, l_result_0 = pcall(function() --[[ Line: 7 ]]
    return game:GetService("StudioService"):HasInternalPermission();
end);
if not l_status_0 then
    l_result_0 = false;
end;
if not l_result_0 then
    return;
else
    local l_Parent_0 = script.Parent.Parent;
    local l_Common_0 = l_Parent_0.Common;
    require(l_Common_0.commonInit)();
    local v4 = require(l_Parent_0.Src.Util.DebugFlags);
    if v4.RunningUnderCLI() then
        return;
    else
        local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
        local l_StudioDeviceEmulatorService_0 = game:GetService("StudioDeviceEmulatorService");
        local l_HttpService_0 = game:GetService("HttpService");
        local l_CoreGui_0 = game:GetService("CoreGui");
        local l_UserInputService_0 = game:GetService("UserInputService");
        local l_MultipleDocumentInterfaceInstance_0 = plugin.MultipleDocumentInterfaceInstance;
        local v11 = require(l_Parent_0.Src.Util.DMBridge);
        local _ = require(l_Parent_0.Src.Types);
        local v13 = require(l_Parent_0.Src.Util.Enums);
        local v14 = nil;
        local v15 = nil;
        local v16 = nil;
        local v17 = nil;
        local v18 = nil;
        local v19 = nil;
        local v20 = nil;
        v11.setPluginObject(plugin);
        local v21 = nil;
        local function v27(v22) --[[ Line: 46 ]] --[[ Name: setInputTypesToIgnore ]]
            -- upvalues: v15 (ref), l_Parent_0 (copy), l_VirtualInputManager_0 (copy)
            v15 = require(l_Parent_0.Packages.Cryo);
            local v23 = {
                mouseButton = {
                    Enum.UserInputType.MouseButton1, 
                    Enum.UserInputType.MouseButton2, 
                    Enum.UserInputType.MouseButton3
                }, 
                mouseMove = {
                    Enum.UserInputType.MouseMovement
                }, 
                touch = {
                    Enum.UserInputType.Touch
                }, 
                keyboard = {
                    Enum.UserInputType.Keyboard
                }, 
                gamepad = {
                    Enum.UserInputType.Gamepad1, 
                    Enum.UserInputType.Gamepad2, 
                    Enum.UserInputType.Gamepad3, 
                    Enum.UserInputType.Gamepad4, 
                    Enum.UserInputType.Gamepad5, 
                    Enum.UserInputType.Gamepad6, 
                    Enum.UserInputType.Gamepad7, 
                    Enum.UserInputType.Gamepad8
                }
            };
            local v24 = {};
            for v25, v26 in pairs(v22) do
                if not v26 then
                    v24 = v15.List.join(v24, v23[v25]);
                end;
            end;
            l_VirtualInputManager_0:SetInputTypesToIgnore(v24);
        end;
        local function v34() --[[ Line: 80 ]] --[[ Name: setStudioEmulationDevice ]]
            -- upvalues: v11 (copy), l_StudioDeviceEmulatorService_0 (copy)
            local v28 = v11.getRoduxState();
            assert(v28, "Access rodux state");
            if v28.playbackTab.shouldSetEmulationDevice then
                local v29 = v11.getCurrentPlaybackRecordingDataObj();
                assert(v29, "Could not get recording data");
                local l_additionalMetadata_0 = v29.additionalMetadata;
                local l_resolution_0 = l_additionalMetadata_0.resolution;
                local l_deviceId_0 = l_additionalMetadata_0.deviceId;
                local l_orientation_0 = l_additionalMetadata_0.orientation;
                if l_deviceId_0 == "default" then
                    l_StudioDeviceEmulatorService_0:EmulatePCDeviceWithResolution("Test Computer Device", Vector2.new(l_resolution_0[1], l_resolution_0[2]));
                    return;
                else
                    l_StudioDeviceEmulatorService_0:SetCurrentDeviceId(l_deviceId_0);
                    l_StudioDeviceEmulatorService_0:SetCurrentOrientation(l_orientation_0);
                end;
            end;
        end;
        local v35 = nil;
        local function _() --[[ Line: 108 ]] --[[ Name: disconnectStopPlaybackConnection ]]
            -- upvalues: v35 (ref)
            if v35 then
                v35:Disconnect();
                v35 = nil;
            end;
        end;
        local v37 = nil;
        local function v39() --[[ Line: 116 ]] --[[ Name: setupInputVisualizer ]]
            -- upvalues: v14 (ref), l_Parent_0 (copy), v16 (ref), v17 (ref), v18 (ref), v19 (ref), v20 (ref), v37 (ref), l_CoreGui_0 (copy)
            v14 = require(l_Parent_0.Src.Components.InputVisualizer);
            v16 = require(l_Parent_0.Packages.Roact);
            v17 = require(l_Parent_0.Packages.Framework);
            v18 = v17.ContextServices;
            v19 = v18.Plugin;
            v20 = require(l_Parent_0.Src.Resources.MakeTheme);
            local v38 = v18.provide({
                v19.new(plugin), 
                v20()
            }, {
                InputVisualizer = v16.createElement("ScreenGui", {
                    DisplayOrder = 1000, 
                    Enabled = true
                }, {
                    InputVisualizer = v16.createElement(v14)
                })
            });
            assert(v37 == nil);
            v37 = v16.mount(v38, l_CoreGui_0);
        end;
        local function _() --[[ Line: 140 ]] --[[ Name: teardownInputVisualizer ]]
            -- upvalues: v16 (ref), l_Parent_0 (copy), v37 (ref)
            v16 = require(l_Parent_0.Packages.Roact);
            if v37 then
                v16.unmount(v37);
                v37 = nil;
            end;
        end;
        local function v41() --[[ Line: 149 ]] --[[ Name: onPlaybackEnded ]]
            -- upvalues: v35 (ref), v11 (copy), v13 (copy), v16 (ref), l_Parent_0 (copy), v37 (ref), l_UserInputService_0 (copy)
            assert(plugin.HostDataModelType == Enum.StudioDataModelType.PlayClient, "Correct datamodel game state type");
            if v35 then
                v35:Disconnect();
                v35 = nil;
            end;
            assert(v11.getPluginState() == v13.PluginState.Playing);
            v11.setPluginState(v13.PluginState.Default);
            v16 = require(l_Parent_0.Packages.Roact);
            if v37 then
                v16.unmount(v37);
                v37 = nil;
            end;
            l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
        end;
        local function v42() --[[ Line: 160 ]] --[[ Name: stopPlayback ]]
            -- upvalues: v11 (copy), v13 (copy), l_VirtualInputManager_0 (copy)
            assert(v11.getPluginState() == v13.PluginState.Playing);
            assert(plugin.HostDataModelType == Enum.StudioDataModelType.PlayClient, "Correct datamodel game state type");
            l_VirtualInputManager_0:StopPlaying();
        end;
        local function v46() --[[ Line: 167 ]] --[[ Name: startPlayback ]]
            -- upvalues: v11 (copy), v13 (copy), v27 (copy), v39 (copy), v34 (copy), v35 (ref), l_VirtualInputManager_0 (copy), v41 (copy)
            local v43 = v11.getPluginState();
            local v44 = true;
            if v43 ~= v13.PluginState.Default then
                v44 = v43 == v13.PluginState.ShouldStartPlayback;
            end;
            assert(v44);
            assert(plugin.HostDataModelType == Enum.StudioDataModelType.PlayClient, "Correct datamodel game state type");
            local v45 = v11.getRoduxState();
            assert(v45, "Access rodux state");
            v44 = v11.getCurrentPlaybackRecordingDataStr();
            assert(v44, "Recording data string not found");
            v11.setPluginState(v13.PluginState.Disabled);
            v27({
                mouseMove = v45.playbackTabFilter.mouseMove, 
                mouseButton = v45.playbackTabFilter.mouseClick, 
                keyboard = v45.playbackTabFilter.keyboard, 
                gamepad = v45.playbackTabFilter.gamepad, 
                touch = v45.playbackTabFilter.touch
            });
            v39();
            while game.Players.LocalPlayer == nil do
                wait();
            end;
            if not game:IsLoaded() then
                game.Loaded:Wait();
            end;
            v11.setPluginState(v13.PluginState.Playing);
            v34();
            if v35 then
                v35:Disconnect();
                v35 = nil;
            end;
            v35 = l_VirtualInputManager_0.PlaybackCompleted:Connect(v41);
            l_VirtualInputManager_0:StartPlayingJSON(v44);
        end;
        local function v52() --[[ Line: 207 ]] --[[ Name: startRecording ]]
            -- upvalues: v11 (copy), v13 (copy), l_VirtualInputManager_0 (copy), l_StudioDeviceEmulatorService_0 (copy), v21 (ref), v27 (copy)
            local v47 = v11.getPluginState();
            local v48 = true;
            if v47 ~= v13.PluginState.Default then
                v48 = v47 == v13.PluginState.ShouldStartRecording;
            end;
            assert(v48);
            assert(plugin.HostDataModelType == Enum.StudioDataModelType.PlayClient, "Correct datamodel game state type");
            local v49 = v11.getRoduxState();
            assert(v49, "Access rodux state");
            l_VirtualInputManager_0:StopRecording();
            v11.setPluginState(v13.PluginState.Disabled);
            if not game:IsLoaded() then
                game.Loaded:Wait();
            end;
            while game.Players.LocalPlayer == nil do
                game.Players.PlayerAdded:Wait();
            end;
            v11.setPluginState(v13.PluginState.Recording);
            v48 = game.Workspace.CurrentCamera.ViewportSize;
            assert(v48, "Get viewport resolution");
            local l_l_StudioDeviceEmulatorService_0_CurrentDeviceId_0 = l_StudioDeviceEmulatorService_0:GetCurrentDeviceId();
            assert(l_l_StudioDeviceEmulatorService_0_CurrentDeviceId_0);
            local l_Name_0 = l_StudioDeviceEmulatorService_0:GetCurrentOrientation().Name;
            assert(l_Name_0);
            v21 = {
                resolution = {
                    math.floor(v48.x), 
                    (math.floor(v48.y))
                }, 
                deviceId = l_l_StudioDeviceEmulatorService_0_CurrentDeviceId_0, 
                orientation = l_Name_0
            };
            v27({
                mouseMove = v49.recordTabFilter.mouseMove, 
                mouseButton = v49.recordTabFilter.mouseClick, 
                keyboard = v49.recordTabFilter.keyboard, 
                gamepad = v49.recordTabFilter.gamepad, 
                touch = v49.recordTabFilter.touch
            });
            l_VirtualInputManager_0:StartRecording();
        end;
        local function v56() --[[ Line: 253 ]] --[[ Name: stopRecording ]]
            -- upvalues: v11 (copy), v13 (copy), l_VirtualInputManager_0 (copy), l_HttpService_0 (copy), v21 (ref)
            assert(v11.getPluginState() == v13.PluginState.Recording);
            local v53 = nil;
            v53 = l_VirtualInputManager_0.RecordingCompleted:Connect(function(v54) --[[ Line: 257 ]]
                -- upvalues: l_HttpService_0 (ref), v21 (ref), v11 (ref), v13 (ref), v53 (ref)
                local v55 = l_HttpService_0:JSONDecode(v54);
                v55.additionalMetadata = v21;
                if not v55.additionalLuaState then
                    v55.additionalLuaState = {
                        "dummy state"
                    };
                end;
                v11.saveRecordingDataToDM(v55);
                v11.setPluginState(v13.PluginState.Default);
                if v53 then
                    v53:Disconnect();
                end;
            end);
            l_VirtualInputManager_0:StopRecording();
        end;
        local function _() --[[ Line: 276 ]] --[[ Name: startRecordingOrPlayingIfRequested ]]
            -- upvalues: v11 (copy), v13 (copy), v52 (copy), v46 (copy)
            local v57 = v11.getPluginState();
            if v57 == v13.PluginState.ShouldStartRecording then
                v52();
                return;
            else
                if v57 == v13.PluginState.ShouldStartPlayback then
                    v46();
                end;
                return;
            end;
        end;
        local function v61() --[[ Line: 286 ]] --[[ Name: setupPlayClientDMEventListeners ]]
            -- upvalues: v11 (copy), v52 (copy), v56 (copy), v46 (copy), v42 (copy), l_MultipleDocumentInterfaceInstance_0 (copy), v13 (copy), l_VirtualInputManager_0 (copy)
            v11.setupPlayClientDMEventListeners();
            v11.connectToStartRecordButtonClicked(v52);
            v11.connectToStopRecordButtonClicked(v56);
            v11.connectToStartPlaybackButtonClicked(v46);
            v11.connectToStopPlaybackButtonClicked(v42);
            l_MultipleDocumentInterfaceInstance_0.FocusedDataModelSession.CurrentDataModelTypeAboutToChange:Connect(function(v59) --[[ Line: 294 ]]
                -- upvalues: v11 (ref), v13 (ref), v56 (ref), l_VirtualInputManager_0 (ref)
                if plugin.HostDataModelTypeIsCurrent and v59 == Enum.StudioDataModelType.Edit then
                    v11.setIsPlayMode(false);
                    local v60 = v11.getPluginState();
                    if v60 == v13.PluginState.Recording then
                        v56();
                        return;
                    elseif v60 == v13.PluginState.Playing then
                        assert(v11.getPluginState() == v13.PluginState.Playing);
                        assert(plugin.HostDataModelType == Enum.StudioDataModelType.PlayClient, "Correct datamodel game state type");
                        l_VirtualInputManager_0:StopPlaying();
                        return;
                    elseif v60 == v13.PluginState.Disabled then
                        v11.setPluginState(v13.PluginState.Default);
                    end;
                end;
            end);
        end;
        local function _() --[[ Line: 310 ]] --[[ Name: setupPlayClientDM ]]
            -- upvalues: v11 (copy), v61 (copy)
            v11.setIsPlayMode(true);
            v61();
            v11.onPlayClientSessionStarted();
        end;
        local v63 = nil;
        local function v65() --[[ Line: 317 ]] --[[ Name: initializeDataModel ]]
            -- upvalues: v4 (copy), l_Parent_0 (copy), v63 (ref), v11 (copy), v61 (copy), v13 (copy), v52 (copy), v46 (copy)
            if plugin.HostDataModelType == Enum.StudioDataModelType.PlayClient and v4.EnableDeveloperTools() then
                v63 = require(l_Parent_0.Packages.Framework).DeveloperTools.forPlugin(l_Parent_0.Name, plugin);
                v63:addPluginRouter(plugin);
            end;
            if plugin.HostDataModelType == Enum.StudioDataModelType.Edit then
                v11.setupEditDMEventListeners();
                return;
            else
                if plugin.HostDataModelType == Enum.StudioDataModelType.PlayClient and v11.getPluginEnabled() then
                    v11.setIsPlayMode(true);
                    v61();
                    v11.onPlayClientSessionStarted();
                    local v64 = v11.getPluginState();
                    if v64 == v13.PluginState.ShouldStartRecording then
                        v52();
                        return;
                    elseif v64 == v13.PluginState.ShouldStartPlayback then
                        v46();
                    end;
                end;
                return;
            end;
        end;
        local function _() --[[ Line: 334 ]] --[[ Name: init ]]
            -- upvalues: l_MultipleDocumentInterfaceInstance_0 (copy), v63 (ref), v65 (copy)
            l_MultipleDocumentInterfaceInstance_0.FocusedDataModelSession.CurrentDataModelTypeAboutToChange:Connect(function() --[[ Line: 337 ]]
                -- upvalues: v63 (ref)
                if v63 then
                    v63:destroy();
                    v63 = nil;
                end;
            end);
            v65();
        end;
        l_MultipleDocumentInterfaceInstance_0.FocusedDataModelSession.CurrentDataModelTypeAboutToChange:Connect(function() --[[ Line: 337 ]]
            -- upvalues: v63 (ref)
            if v63 then
                v63:destroy();
                v63 = nil;
            end;
        end);
        v65();
        return;
    end;
end;