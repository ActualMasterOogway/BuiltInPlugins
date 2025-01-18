local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Src.Util.Constants);
local l_StudioDeviceEmulatorService_0 = game:GetService("StudioDeviceEmulatorService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_HttpService_0 = game:GetService("HttpService");
local v6 = {};
local v7 = {
    PluginEnabled = "PluginEnabled", 
    RequestDevicePropertiesUpdate = "RequestDevicePropertiesUpdate", 
    ConnectToStudioDeviceEmulatorServiceEvents = "ConnectToStudioDeviceEmulatorServiceEvents", 
    DisconnectStudioDeviceEmulatorServiceEvents = "DisconnectStudioDeviceEmulatorServiceEvents", 
    EmulationDeviceIdChanged = "EmulationDeviceIdChanged", 
    EmulationDeviceOrientationChanged = "EmulationDeviceOrientationChanged", 
    ViewportResolutionChanged = "ViewportResolutionChanged", 
    IsPlayMode = "IsPlayMode", 
    StartRecordingButtonClicked = "StartRecordingButtonClicked", 
    StopRecordingButtonClicked = "StopRecordingButtonClicked", 
    StartPlaybackButtonClicked = "StartPlaybackButtonClicked", 
    StopPlaybackButtonClicked = "StopPlaybackButtonClicked", 
    SetPluginState = "SetPluginState", 
    RoduxState = "RoduxState", 
    SaveRecordingDataToDM = "SaveRecordingDataToDM", 
    OpenSaveRecordingDialog = "OpenSaveRecordingDialog", 
    SetSavedRecordingName = "SetSavedRecordingName", 
    SearchForUserInputRecordings = "SearchForUserInputRecordings", 
    SetPlayableRecordings = "SetPlayableRecordings", 
    LoadRecordingWithName = "LoadRecordingWithName", 
    CurrentPlaybackRecordingDataStr = "CurrentPlaybackRecordingDataStr", 
    CurrentPlaybackRecordingDataObj = "CurrentPlaybackRecordingDataObj", 
    PlaybackInfoChanged = "PlaybackInfoChanged"
};
local v8 = nil;
v6.setPluginObject = function(v9) --[[ Line: 38 ]] --[[ Name: setPluginObject ]]
    -- upvalues: v8 (ref)
    assert(v9, "Plugin object must exist");
    v8 = v9;
end;
local v10 = nil;
v6.setLocalizationObject = function(v11) --[[ Line: 45 ]] --[[ Name: setLocalizationObject ]]
    -- upvalues: v10 (ref)
    assert(v11, "Localization object must exist");
    v10 = v11;
end;
v6.setIsPlayMode = function(v12) --[[ Line: 50 ]] --[[ Name: setIsPlayMode ]]
    -- upvalues: v8 (ref), v7 (copy)
    v8:SetItem(v7.IsPlayMode, v12);
end;
v6.getIsPlayMode = function() --[[ Line: 54 ]] --[[ Name: getIsPlayMode ]]
    -- upvalues: v8 (ref), v7 (copy)
    return v8:GetItem(v7.IsPlayMode, false);
end;
v6.setPluginEnabled = function(v13) --[[ Line: 58 ]] --[[ Name: setPluginEnabled ]]
    -- upvalues: v8 (ref), v7 (copy)
    v8:SetItem(v7.PluginEnabled, v13);
end;
v6.getPluginEnabled = function() --[[ Line: 62 ]] --[[ Name: getPluginEnabled ]]
    -- upvalues: v8 (ref), v7 (copy)
    return v8:GetItem(v7.PluginEnabled, false);
end;
v6.setRoduxState = function(v14) --[[ Line: 66 ]] --[[ Name: setRoduxState ]]
    -- upvalues: v8 (ref), v7 (copy)
    v8:SetItem(v7.RoduxState, v14);
end;
v6.getRoduxState = function() --[[ Line: 70 ]] --[[ Name: getRoduxState ]]
    -- upvalues: v8 (ref), v7 (copy)
    return v8:GetItem(v7.RoduxState, nil);
end;
v6.setPluginState = function(v15) --[[ Line: 74 ]] --[[ Name: setPluginState ]]
    -- upvalues: v8 (ref), v7 (copy)
    v8:Invoke(v7.SetPluginState, v15);
end;
v6.getPluginState = function() --[[ Line: 78 ]] --[[ Name: getPluginState ]]
    -- upvalues: v6 (copy)
    local v16 = v6.getRoduxState();
    if v16 == nil then
        return nil;
    else
        return v16.common.pluginState;
    end;
end;
v6.setPluginStateRoduxActionHandler = function(v17) --[[ Line: 87 ]] --[[ Name: setPluginStateRoduxActionHandler ]]
    -- upvalues: v8 (ref), v7 (copy)
    v8:OnInvoke(v7.SetPluginState, v17);
end;
v6.saveRecordingDataToDM = function(v18) --[[ Line: 92 ]] --[[ Name: saveRecordingDataToDM ]]
    -- upvalues: v8 (ref), v7 (copy)
    v8:Invoke(v7.SaveRecordingDataToDM, v18);
end;
local function _() --[[ Line: 96 ]] --[[ Name: getRecordingsFolder ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v2 (copy)
    local l_l_ReplicatedStorage_0_FirstChild_0 = l_ReplicatedStorage_0:FindFirstChild("User Input Recordings");
    if l_l_ReplicatedStorage_0_FirstChild_0 == nil then
        l_l_ReplicatedStorage_0_FirstChild_0 = Instance.new("Folder");
        l_l_ReplicatedStorage_0_FirstChild_0.Name = v2.RecordingsFolderName;
        l_l_ReplicatedStorage_0_FirstChild_0.Parent = l_ReplicatedStorage_0;
    end;
    assert(l_l_ReplicatedStorage_0_FirstChild_0);
    assert(l_l_ReplicatedStorage_0_FirstChild_0:IsA("Folder"), "ReplicatedStorage.User Input Recordings must be a folder!");
    return l_l_ReplicatedStorage_0_FirstChild_0;
end;
local v21 = nil;
local function v27(v22) --[[ Line: 109 ]] --[[ Name: saveRecordingData ]]
    -- upvalues: v8 (ref), l_HttpService_0 (copy), v7 (copy), l_ReplicatedStorage_0 (copy), v2 (copy)
    assert(v8.HostDataModelType == Enum.StudioDataModelType.Edit);
    assert(v22, "Must have recording data");
    local v23 = l_HttpService_0:JSONEncode(v22);
    v8:Invoke(v7.OpenSaveRecordingDialog, "EnterNameForRecordingMessage", {
        (string.len(v23))
    });
    local v24 = coroutine.yield();
    if v24 then
        local l_StringValue_0 = Instance.new("StringValue");
        l_StringValue_0.Value = v23;
        l_StringValue_0.Name = tostring(os.date("%x %X"));
        local l_l_ReplicatedStorage_0_FirstChild_1 = l_ReplicatedStorage_0:FindFirstChild("User Input Recordings");
        if l_l_ReplicatedStorage_0_FirstChild_1 == nil then
            l_l_ReplicatedStorage_0_FirstChild_1 = Instance.new("Folder");
            l_l_ReplicatedStorage_0_FirstChild_1.Name = v2.RecordingsFolderName;
            l_l_ReplicatedStorage_0_FirstChild_1.Parent = l_ReplicatedStorage_0;
        end;
        assert(l_l_ReplicatedStorage_0_FirstChild_1);
        assert(l_l_ReplicatedStorage_0_FirstChild_1:IsA("Folder"), "ReplicatedStorage.User Input Recordings must be a folder!");
        l_StringValue_0.Parent = l_l_ReplicatedStorage_0_FirstChild_1;
        if string.len(v24) > 0 then
            l_StringValue_0.Name = v24;
        end;
    end;
end;
v6.onSaveRecordingDialogCancel = function() --[[ Line: 133 ]] --[[ Name: onSaveRecordingDialogCancel ]]
    -- upvalues: v8 (ref), v7 (copy)
    v8:Invoke(v7.SetSavedRecordingName, nil);
end;
v6.onSaveRecordingDialogSave = function(v28) --[[ Line: 137 ]] --[[ Name: onSaveRecordingDialogSave ]]
    -- upvalues: v8 (ref), v7 (copy)
    v8:Invoke(v7.SetSavedRecordingName, v28);
end;
local function v39(v29) --[[ Line: 142 ]] --[[ Name: loadRecordingWithName ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v2 (copy), v10 (ref), v8 (ref), v7 (copy), l_HttpService_0 (copy)
    local l_l_ReplicatedStorage_0_FirstChild_2 = l_ReplicatedStorage_0:FindFirstChild("User Input Recordings");
    if l_l_ReplicatedStorage_0_FirstChild_2 == nil then
        l_l_ReplicatedStorage_0_FirstChild_2 = Instance.new("Folder");
        l_l_ReplicatedStorage_0_FirstChild_2.Name = v2.RecordingsFolderName;
        l_l_ReplicatedStorage_0_FirstChild_2.Parent = l_ReplicatedStorage_0;
    end;
    assert(l_l_ReplicatedStorage_0_FirstChild_2);
    assert(l_l_ReplicatedStorage_0_FirstChild_2:IsA("Folder"), "ReplicatedStorage.User Input Recordings must be a folder!");
    l_l_ReplicatedStorage_0_FirstChild_2 = l_l_ReplicatedStorage_0_FirstChild_2:FindFirstChild(v29, false);
    if not l_l_ReplicatedStorage_0_FirstChild_2 then
        error(v10:getText("AssetDM", "CouldNotFindRecordingMessage", {
            name = v29
        }));
    end;
    assert(l_l_ReplicatedStorage_0_FirstChild_2:IsA("StringValue"));
    local l_Value_0 = l_l_ReplicatedStorage_0_FirstChild_2.Value;
    assert(l_Value_0);
    v8:Invoke(v7.PlaybackInfoChanged, nil, 0, 0);
    v8:SetItem(v7.CurrentPlaybackRecordingDataObj, nil);
    v8:SetItem(v7.CurrentPlaybackRecordingDataStr, nil);
    local v32 = l_HttpService_0:JSONDecode(l_Value_0);
    local l_additionalMetadata_0 = v32.additionalMetadata;
    assert(l_additionalMetadata_0, "metaData key not found");
    local l_resolution_0 = l_additionalMetadata_0.resolution;
    assert(l_resolution_0, "resolution key not found");
    assert(#l_resolution_0 == 2, "resolution key invalid");
    assert(l_additionalMetadata_0.deviceId, "deviceId key not found");
    assert(l_additionalMetadata_0.orientation, "orientation key not found");
    local l_events_0 = v32.events;
    assert(l_events_0, "events not found");
    local l_duration_0 = v32.duration;
    assert(l_duration_0, "duration not found");
    assert(l_duration_0 >= 0, "recording duration cannot be negative");
    local v37 = #l_events_0;
    local v38 = l_duration_0 / 1000;
    v8:Invoke(v7.PlaybackInfoChanged, l_additionalMetadata_0, v38, v37);
    v8:SetItem(v7.CurrentPlaybackRecordingDataObj, v32);
    v8:SetItem(v7.CurrentPlaybackRecordingDataStr, l_Value_0);
end;
local function v44() --[[ Line: 184 ]] --[[ Name: searchForUserInputRecordingsInEditDM ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v2 (copy), v8 (ref), v7 (copy)
    local v40 = {};
    local l_l_ReplicatedStorage_0_FirstChild_3 = l_ReplicatedStorage_0:FindFirstChild("User Input Recordings");
    if l_l_ReplicatedStorage_0_FirstChild_3 == nil then
        l_l_ReplicatedStorage_0_FirstChild_3 = Instance.new("Folder");
        l_l_ReplicatedStorage_0_FirstChild_3.Name = v2.RecordingsFolderName;
        l_l_ReplicatedStorage_0_FirstChild_3.Parent = l_ReplicatedStorage_0;
    end;
    assert(l_l_ReplicatedStorage_0_FirstChild_3);
    assert(l_l_ReplicatedStorage_0_FirstChild_3:IsA("Folder"), "ReplicatedStorage.User Input Recordings must be a folder!");
    l_l_ReplicatedStorage_0_FirstChild_3 = l_l_ReplicatedStorage_0_FirstChild_3:GetChildren();
    for _, v43 in ipairs(l_l_ReplicatedStorage_0_FirstChild_3) do
        if v43:IsA("StringValue") then
            table.insert(v40, v43.Name);
        end;
    end;
    v8:Invoke(v7.SetPlayableRecordings, v40);
end;
local v45 = {};
local function v46() --[[ Line: 198 ]] --[[ Name: connectToStudioDeviceEmulatorServiceEvents ]]
    -- upvalues: l_StudioDeviceEmulatorService_0 (copy), v45 (ref), v8 (ref), v7 (copy)
    if l_StudioDeviceEmulatorService_0 then
        table.insert(v45, l_StudioDeviceEmulatorService_0.CurrentDeviceIdChanged:Connect(function() --[[ Line: 202 ]]
            -- upvalues: v8 (ref), v7 (ref), l_StudioDeviceEmulatorService_0 (ref)
            v8:Invoke(v7.EmulationDeviceIdChanged, l_StudioDeviceEmulatorService_0:GetCurrentDeviceId());
        end));
        table.insert(v45, l_StudioDeviceEmulatorService_0.OrientationChanged:Connect(function() --[[ Line: 208 ]]
            -- upvalues: v8 (ref), v7 (ref), l_StudioDeviceEmulatorService_0 (ref)
            v8:Invoke(v7.EmulationDeviceOrientationChanged, l_StudioDeviceEmulatorService_0:GetCurrentOrientation().Name);
        end));
    end;
    table.insert(v45, workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 218 ]]
        -- upvalues: v8 (ref), v7 (ref)
        v8:Invoke(v7.ViewportResolutionChanged, workspace.CurrentCamera.ViewportSize);
    end));
end;
local function v49() --[[ Line: 224 ]] --[[ Name: disconnectStudioDeviceEmulatorServiceEvents ]]
    -- upvalues: v45 (ref)
    for _, v48 in ipairs(v45) do
        v48:Disconnect();
    end;
    v45 = {};
end;
local v50 = false;
v6.setupEditDMEventListeners = function() --[[ Line: 232 ]] --[[ Name: setupEditDMEventListeners ]]
    -- upvalues: v50 (ref), v8 (ref), v7 (copy), l_StudioDeviceEmulatorService_0 (copy), v46 (copy), v49 (copy), v21 (ref), v27 (copy), v44 (copy), v39 (copy)
    assert(not v50, "Should only setup once per DM");
    v50 = true;
    v8:OnInvoke(v7.RequestDevicePropertiesUpdate, function() --[[ Line: 235 ]]
        -- upvalues: l_StudioDeviceEmulatorService_0 (ref), v8 (ref), v7 (ref)
        if l_StudioDeviceEmulatorService_0 then
            v8:Invoke(v7.EmulationDeviceIdChanged, l_StudioDeviceEmulatorService_0:GetCurrentDeviceId());
            v8:Invoke(v7.EmulationDeviceOrientationChanged, l_StudioDeviceEmulatorService_0:GetCurrentOrientation().Name);
            v8:Invoke(v7.ViewportResolutionChanged, workspace.CurrentCamera.ViewportSize);
        end;
    end);
    v8:OnInvoke(v7.ConnectToStudioDeviceEmulatorServiceEvents, v46);
    v8:OnInvoke(v7.DisconnectStudioDeviceEmulatorServiceEvents, v49);
    v8:OnInvoke(v7.SaveRecordingDataToDM, function(v51) --[[ Line: 248 ]]
        -- upvalues: v21 (ref), v27 (ref)
        v21 = coroutine.create(v27);
        coroutine.resume(v21, v51);
    end);
    v8:OnInvoke(v7.SetSavedRecordingName, function(v52) --[[ Line: 252 ]]
        -- upvalues: v21 (ref)
        coroutine.resume(v21, v52);
    end);
    v8:OnInvoke(v7.SearchForUserInputRecordings, v44);
    v8:OnInvoke(v7.LoadRecordingWithName, v39);
end;
local v53 = false;
v6.setupPlayClientDMEventListeners = function() --[[ Line: 261 ]] --[[ Name: setupPlayClientDMEventListeners ]]
    -- upvalues: v53 (ref), v8 (ref), v7 (copy), v46 (copy), v49 (copy)
    assert(not v53, "Should only setup once per DM");
    v53 = true;
    v8:OnInvoke(v7.ConnectToStudioDeviceEmulatorServiceEvents, v46);
    v8:OnInvoke(v7.DisconnectStudioDeviceEmulatorServiceEvents, v49);
end;
v6.connectToStartRecordButtonClicked = function(v54) --[[ Line: 269 ]] --[[ Name: connectToStartRecordButtonClicked ]]
    -- upvalues: v8 (ref), v7 (copy)
    v8:OnInvoke(v7.StartRecordingButtonClicked, v54);
end;
v6.onStartRecordingButtonClicked = function() --[[ Line: 273 ]] --[[ Name: onStartRecordingButtonClicked ]]
    -- upvalues: v8 (ref), v7 (copy)
    v8:Invoke(v7.StartRecordingButtonClicked);
end;
v6.connectToStopRecordButtonClicked = function(v55) --[[ Line: 277 ]] --[[ Name: connectToStopRecordButtonClicked ]]
    -- upvalues: v8 (ref), v7 (copy)
    v8:OnInvoke(v7.StopRecordingButtonClicked, v55);
end;
v6.onStopRecordingButtonClicked = function() --[[ Line: 281 ]] --[[ Name: onStopRecordingButtonClicked ]]
    -- upvalues: v8 (ref), v7 (copy)
    v8:Invoke(v7.StopRecordingButtonClicked);
end;
v6.connectToStartPlaybackButtonClicked = function(v56) --[[ Line: 285 ]] --[[ Name: connectToStartPlaybackButtonClicked ]]
    -- upvalues: v8 (ref), v7 (copy)
    v8:OnInvoke(v7.StartPlaybackButtonClicked, v56);
end;
v6.onStartPlaybackButtonClicked = function() --[[ Line: 289 ]] --[[ Name: onStartPlaybackButtonClicked ]]
    -- upvalues: v8 (ref), v7 (copy)
    v8:Invoke(v7.StartPlaybackButtonClicked);
end;
v6.connectToStopPlaybackButtonClicked = function(v57) --[[ Line: 293 ]] --[[ Name: connectToStopPlaybackButtonClicked ]]
    -- upvalues: v8 (ref), v7 (copy)
    v8:OnInvoke(v7.StopPlaybackButtonClicked, v57);
end;
v6.onStopPlaybackButtonClicked = function() --[[ Line: 297 ]] --[[ Name: onStopPlaybackButtonClicked ]]
    -- upvalues: v8 (ref), v7 (copy)
    v8:Invoke(v7.StopPlaybackButtonClicked);
end;
v6.onPlayClientSessionStarted = function() --[[ Line: 301 ]] --[[ Name: onPlayClientSessionStarted ]]
    -- upvalues: v46 (copy), v8 (ref), v7 (copy)
    v46();
    v8:Invoke(v7.RequestDevicePropertiesUpdate);
end;
v6.getCurrentPlaybackRecordingDataStr = function() --[[ Line: 307 ]] --[[ Name: getCurrentPlaybackRecordingDataStr ]]
    -- upvalues: v8 (ref), v7 (copy)
    return v8:GetItem(v7.CurrentPlaybackRecordingDataStr, nil);
end;
v6.getCurrentPlaybackRecordingDataObj = function() --[[ Line: 311 ]] --[[ Name: getCurrentPlaybackRecordingDataObj ]]
    -- upvalues: v8 (ref), v7 (copy)
    return v8:GetItem(v7.CurrentPlaybackRecordingDataObj, nil);
end;
local v58 = {};
v6.connectRecordTabEventListenersWithActions = function(v59) --[[ Line: 323 ]] --[[ Name: connectRecordTabEventListenersWithActions ]]
    -- upvalues: v58 (ref), v8 (ref), v7 (copy)
    table.insert(v58, (v8:OnInvoke(v7.EmulationDeviceIdChanged, function(v60) --[[ Line: 326 ]]
        -- upvalues: v59 (copy)
        v59.SetEmulationDeviceId(v60);
    end)));
    table.insert(v58, (v8:OnInvoke(v7.EmulationDeviceOrientationChanged, function(v61) --[[ Line: 332 ]]
        -- upvalues: v59 (copy)
        v59.SetEmulationDeviceOrientation((tostring(v61)));
    end)));
    table.insert(v58, (v8:OnInvoke(v7.ViewportResolutionChanged, function(v62) --[[ Line: 338 ]]
        -- upvalues: v59 (copy)
        v59.SetCurrentScreenSize(v62);
    end)));
    table.insert(v58, (v8:OnInvoke(v7.OpenSaveRecordingDialog, function(v63, v64) --[[ Line: 344 ]]
        -- upvalues: v59 (copy)
        v59.SetSaveRecordingDialogVisible(v63, v64);
    end)));
end;
v6.disconnectRecordTabEventListeners = function() --[[ Line: 350 ]] --[[ Name: disconnectRecordTabEventListeners ]]
    -- upvalues: v58 (ref)
    for _, v66 in ipairs(v58) do
        v66:Disconnect();
    end;
    v58 = {};
end;
v6.onRecordTabShown = function() --[[ Line: 357 ]] --[[ Name: onRecordTabShown ]]
    -- upvalues: v8 (ref), v7 (copy)
    v8:Invoke(v7.RequestDevicePropertiesUpdate);
    v8:Invoke(v7.ConnectToStudioDeviceEmulatorServiceEvents);
end;
v6.onRecordTabHidden = function() --[[ Line: 362 ]] --[[ Name: onRecordTabHidden ]]
    -- upvalues: v8 (ref), v7 (copy)
    v8:Invoke(v7.DisconnectStudioDeviceEmulatorServiceEvents);
end;
local v67 = nil;
v6.disconnectSetPlayableRecordingsCallback = function() --[[ Line: 368 ]] --[[ Name: disconnectSetPlayableRecordingsCallback ]]
    -- upvalues: v67 (ref)
    if v67 then
        v67:Disconnect();
        v67 = nil;
    end;
end;
v6.connectSetPlayableRecordingsCallback = function(v68) --[[ Line: 375 ]] --[[ Name: connectSetPlayableRecordingsCallback ]]
    -- upvalues: v6 (copy), v67 (ref), v8 (ref), v7 (copy)
    v6.disconnectSetPlayableRecordingsCallback();
    v67 = v8:OnInvoke(v7.SetPlayableRecordings, v68);
end;
v6.searchForUserInputRecordings = function() --[[ Line: 380 ]] --[[ Name: searchForUserInputRecordings ]]
    -- upvalues: v8 (ref), v7 (copy)
    v8:Invoke(v7.SearchForUserInputRecordings);
end;
v6.loadRecordingWithName = function(v69) --[[ Line: 384 ]] --[[ Name: loadRecordingWithName ]]
    -- upvalues: v8 (ref), v7 (copy)
    v8:Invoke(v7.LoadRecordingWithName, v69);
end;
local v70 = nil;
v6.connectPlaybackInfoChangedCallback = function(v71) --[[ Line: 389 ]] --[[ Name: connectPlaybackInfoChangedCallback ]]
    -- upvalues: v70 (ref), v8 (ref), v7 (copy)
    v70 = v8:OnInvoke(v7.PlaybackInfoChanged, v71);
end;
v6.disconnectPlaybackInfoChangedCallback = function() --[[ Line: 393 ]] --[[ Name: disconnectPlaybackInfoChangedCallback ]]
    -- upvalues: v70 (ref)
    if v70 then
        v70:Disconnect();
        v70 = nil;
    end;
end;
return v6;