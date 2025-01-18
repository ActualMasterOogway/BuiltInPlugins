local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_join_0 = require(l_Parent_0.Packages.Cryo).Dictionary.join;
local _ = require(l_Parent_0.Src.Actions.PlaybackTab.SetShouldSetEmulationDevice);
local _ = require(l_Parent_0.Src.Actions.PlaybackTab.SetCurrentRecordingDurationSec);
local _ = require(l_Parent_0.Src.Actions.PlaybackTab.SetCurrentRecordingNumEvents);
local _ = require(l_Parent_0.Src.Actions.PlaybackTab.SetCurrentRecordingResolution);
local _ = require(l_Parent_0.Src.Actions.PlaybackTab.SetCurrentRecordingDeviceId);
local _ = require(l_Parent_0.Src.Actions.PlaybackTab.SetCurrentRecordingDeviceOrientation);
local v9 = {
    selectedRecordingIndex = 1, 
    playbackFileNameOptions = {}, 
    currentPlaybackRecordingDataValid = false, 
    currentRecordingDurationSec = 0, 
    currentRecordingNumEvents = 0, 
    currentRecordingResolution = Vector2.new(), 
    currentRecordingDeviceId = "Unknown", 
    currentRecordingDeviceOrientation = "Unknown", 
    shouldSetEmulationDevice = true
};
return v1.createReducer(v9, {
    SetCurrentRecordingDurationSec = function(v10, v11) --[[ Line: 39 ]] --[[ Name: SetCurrentRecordingDurationSec ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v10, {
            currentRecordingDurationSec = v11.currentRecordingDurationSec
        });
    end, 
    SetCurrentRecordingNumEvents = function(v12, v13) --[[ Line: 47 ]] --[[ Name: SetCurrentRecordingNumEvents ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v12, {
            currentRecordingNumEvents = v13.currentRecordingNumEvents
        });
    end, 
    SetCurrentRecordingResolution = function(v14, v15) --[[ Line: 55 ]] --[[ Name: SetCurrentRecordingResolution ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v14, {
            currentRecordingResolution = v15.currentRecordingResolution
        });
    end, 
    SetCurrentRecordingDeviceId = function(v16, v17) --[[ Line: 63 ]] --[[ Name: SetCurrentRecordingDeviceId ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v16, {
            currentRecordingDeviceId = v17.currentRecordingDeviceId
        });
    end, 
    SetCurrentRecordingDeviceOrientation = function(v18, v19) --[[ Line: 71 ]] --[[ Name: SetCurrentRecordingDeviceOrientation ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v18, {
            currentRecordingDeviceOrientation = v19.currentRecordingDeviceOrientation
        });
    end, 
    SetShouldSetEmulationDevice = function(v20, v21) --[[ Line: 79 ]] --[[ Name: SetShouldSetEmulationDevice ]]
        -- upvalues: l_join_0 (copy)
        return l_join_0(v20, {
            shouldSetEmulationDevice = v21.shouldSetEmulationDevice
        });
    end
});