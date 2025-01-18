local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Resources.Telemetry.PluginMountedEvent);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v3 = require(l_Actions_0.SessionStats.SetSessionStartTimestamp);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local _ = require(l_Parent_0.Src.Thunks.Types);
return function(v7) --[[ Line: 21 ]] --[[ Name: SendPluginMountedEvent ]]
    -- upvalues: v1 (copy), v3 (copy)
    return function(v8, v9) --[[ Line: 22 ]]
        -- upvalues: v1 (ref), v7 (copy), v3 (ref)
        v9.Telemetry:logTelemetryEvent(v1({
            loadTimeMillis = v7
        }));
        local v10 = os.time();
        v8:dispatch(v3(v10));
    end;
end;