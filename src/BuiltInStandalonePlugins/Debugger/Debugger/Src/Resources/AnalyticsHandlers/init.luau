local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Resources.AnalyticsEventNames);
local v2 = tonumber(settings():GetFVariable("DebuggerEventsThrottleHundredthPercent"));
return function(v3) --[[ Line: 11 ]]
    -- upvalues: v2 (copy), v1 (copy)
    local function _(v4) --[[ Line: 12 ]] --[[ Name: reportDebuggerUserEvent ]]
        -- upvalues: v3 (copy), v2 (ref)
        v4.studioSid = v3:GetSessionId();
        v4.placeid = game.PlaceId;
        v3:ReportInfluxSeries("DebuggerUserEvent", v4, v2);
        v3:SendEventDeferred("studio", "Debugger", "DebuggerUserEvent", v4);
    end;
    local function v9(v6, v7) --[[ Line: 22 ]] --[[ Name: reportEventWithActionSource ]]
        -- upvalues: v3 (copy), v2 (ref)
        local v8 = {
            eventName = v6, 
            actionSource = v7, 
            studioSid = v3:GetSessionId(), 
            placeid = game.PlaceId
        };
        v3:ReportInfluxSeries("DebuggerUserEvent", v8, v2);
        v3:SendEventDeferred("studio", "Debugger", "DebuggerUserEvent", v8);
    end;
    return {
        [v1.RemoveMetaBreakpoint] = v9, 
        [v1.RemoveAllMetaBreakpoints] = v9, 
        [v1.EnableMetaBreakpoint] = v9, 
        [v1.DisableMetaBreakpoint] = v9, 
        [v1.EnableBreakpoint] = v9, 
        [v1.DisableBreakpoint] = v9, 
        [v1.EnableAllMetaBreakpoints] = v9, 
        [v1.DisableAllMetaBreakpoints] = v9, 
        [v1.MetaBreakpointConditionChanged] = v9, 
        [v1.MetaBreakpointLogMessageChanged] = v9, 
        [v1.MetaBreakpointContinueExecutionChanged] = v9, 
        [v1.MetaBreakpointRemoveOnHitChanged] = v9, 
        [v1.CallstackStepInto] = v9, 
        [v1.CallstackStepOver] = v9, 
        [v1.CallstackStepOut] = v9, 
        [v1.CallstackChangeFrame] = v9, 
        [v1.WatchAdded] = v9, 
        [v1.WatchScopeEdited] = function(v10, v11) --[[ Line: 44 ]]
            -- upvalues: v3 (copy), v2 (ref)
            local v12 = {
                eventName = v10, 
                enabledScopes = v11, 
                studioSid = v3:GetSessionId(), 
                placeid = game.PlaceId
            };
            v3:ReportInfluxSeries("DebuggerUserEvent", v12, v2);
            v3:SendEventDeferred("studio", "Debugger", "DebuggerUserEvent", v12);
        end, 
        [v1.BreakpointsColumnsEdited] = function(v13, v14) --[[ Line: 47 ]]
            -- upvalues: v3 (copy), v2 (ref)
            local v15 = {
                eventName = v13, 
                enabledColumns = v14, 
                studioSid = v3:GetSessionId(), 
                placeid = game.PlaceId
            };
            v3:ReportInfluxSeries("DebuggerUserEvent", v15, v2);
            v3:SendEventDeferred("studio", "Debugger", "DebuggerUserEvent", v15);
        end, 
        [v1.CallstackColumnsEdited] = function(v16, v17) --[[ Line: 50 ]]
            -- upvalues: v3 (copy), v2 (ref)
            local v18 = {
                eventName = v16, 
                enabledColumns = v17, 
                studioSid = v3:GetSessionId(), 
                placeid = game.PlaceId
            };
            v3:ReportInfluxSeries("DebuggerUserEvent", v18, v2);
            v3:SendEventDeferred("studio", "Debugger", "DebuggerUserEvent", v18);
        end, 
        [v1.VariablesColumnsEdited] = function(v19, v20) --[[ Line: 53 ]]
            -- upvalues: v3 (copy), v2 (ref)
            local v21 = {
                eventName = v19, 
                enabledColumns = v20, 
                studioSid = v3:GetSessionId(), 
                placeid = game.PlaceId
            };
            v3:ReportInfluxSeries("DebuggerUserEvent", v21, v2);
            v3:SendEventDeferred("studio", "Debugger", "DebuggerUserEvent", v21);
        end, 
        [v1.MyWatchesColumnsEdited] = function(v22, v23) --[[ Line: 56 ]]
            -- upvalues: v3 (copy), v2 (ref)
            local v24 = {
                eventName = v22, 
                enabledColumns = v23, 
                studioSid = v3:GetSessionId(), 
                placeid = game.PlaceId
            };
            v3:ReportInfluxSeries("DebuggerUserEvent", v24, v2);
            v3:SendEventDeferred("studio", "Debugger", "DebuggerUserEvent", v24);
        end
    };
end;