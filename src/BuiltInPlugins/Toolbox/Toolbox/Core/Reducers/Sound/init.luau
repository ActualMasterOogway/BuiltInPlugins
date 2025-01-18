local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local v4 = require(l_Parent_0.Core.Util.DebugFlags);
local v5 = require(l_Parent_0.Core.Actions.PlayPreviewSound);
local v6 = require(l_Parent_0.Core.Actions.PausePreviewSound);
local v7 = require(l_Parent_0.Core.Actions.StopPreviewSound);
local v8 = require(l_Parent_0.Core.Actions.ResumePreviewSound);
local v9 = require(l_Parent_0.Core.Actions.StopAllSounds);
local v10 = require(l_Parent_0.Core.Actions.SetSoundLoading);
local v11 = require(l_Parent_0.Core.Actions.SetSoundElapsedTime);
local v12 = require(l_Parent_0.Core.Actions.SetSoundTotalTime);
return v3.createReducer({
    currentSoundId = 0, 
    elapsedTime = 0, 
    isPlaying = false, 
    isLoading = false, 
    totalTime = 0
}, {
    [v5.name] = function(v13, v14) --[[ Line: 25 ]]
        -- upvalues: v4 (copy), v2 (copy)
        if v13.currentSoundId == v14.currentSoundId and v4.shouldDebugWarnings() then
            warn("Trying to play the same sound instead of resuming it. Current SoundId : ", v14.currentSoundId);
        end;
        return v2.Dictionary.join(v13, {
            currentSoundId = v14.currentSoundId, 
            isPlaying = true
        });
    end, 
    [v6.name] = function(v15, _) --[[ Line: 36 ]]
        -- upvalues: v4 (copy), v2 (copy)
        if not v15.isPlaying and v4.shouldDebugWarnings() then
            warn(("Trying to pause a sound that is not playing! Current SoundId : %d"):format(v15.currentSoundId));
        end;
        return v2.Dictionary.join(v15, {
            isPlaying = false
        });
    end, 
    [v7.name] = function(v17, _) --[[ Line: 46 ]]
        -- upvalues: v4 (copy), v2 (copy)
        if not v17.isPlaying and v4.shouldDebugWarnings() then
            warn(("Trying to stop a sound that is not playing! Current SoundId : %d"):format(v17.currentSoundId));
        end;
        return v2.Dictionary.join(v17, {
            currentSoundId = 0, 
            elapsedTime = 0, 
            isPlaying = false
        });
    end, 
    [v8.name] = function(v19, _) --[[ Line: 58 ]]
        -- upvalues: v4 (copy), v2 (copy)
        if v19.isPlaying and v4.shouldDebugWarnings() then
            warn(("Trying to resume a sound which is playing! Current SoundId : %d"):format(v19.currentSoundId));
        end;
        return v2.Dictionary.join(v19, {
            isPlaying = true
        });
    end, 
    [v9.name] = function(v21, _) --[[ Line: 68 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v21, {
            currentSoundId = 0, 
            isPlaying = false
        });
    end, 
    [v10.name] = function(v23, v24) --[[ Line: 75 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v23, {
            isLoading = v24.isLoading
        });
    end, 
    [v11.name] = function(v25, v26) --[[ Line: 81 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v25, {
            elapsedTime = v26.elapsedTime
        });
    end, 
    [v12.name] = function(v27, v28) --[[ Line: 87 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v27, {
            elapsedTime = 0, 
            totalTime = v28.totalTime
        });
    end
});