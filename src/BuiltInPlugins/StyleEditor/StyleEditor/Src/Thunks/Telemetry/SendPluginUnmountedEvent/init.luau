local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Resources.Telemetry.PluginUnmountedEvent);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function() --[[ Line: 18 ]] --[[ Name: SendPluginUnmountedEvent ]]
    -- upvalues: v1 (copy)
    return function(v5, v6) --[[ Line: 19 ]]
        -- upvalues: v1 (ref)
        local v7 = v5:getState();
        local v8 = os.time() - v7.SessionStats.SessionStartTimestamp;
        v6.Telemetry:logTelemetryEvent(v1({
            sessionLengthSeconds = v8, 
            focusTimeSeconds = v7.SessionStats.TotalPluginFocusTimeSeconds, 
            unmatchedFocusEndCount = v7.SessionStats.PluginFocusEndWithoutStartCount, 
            buttonPressCounts = v7.SessionStats.ButtonPressCounts
        }));
    end;
end;