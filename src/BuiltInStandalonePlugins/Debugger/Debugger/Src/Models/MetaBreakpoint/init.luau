local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Constants);
return {
    fromMetaBreakpoint = function(v2) --[[ Line: 19 ]] --[[ Name: fromMetaBreakpoint ]]
        -- upvalues: v1 (copy)
        return {
            id = v2.Id, 
            isEnabled = v2.Enabled, 
            isValid = v2.Valid, 
            lineNumber = v2.Line, 
            scriptName = v2.Script, 
            scriptLine = "", 
            condition = v2.Condition, 
            logMessage = v2.LogMessage, 
            continueExecution = v2.ContinueExecution, 
            debugpointType = v2.IsLogpoint and v1.DebugpointType.Logpoint or v1.DebugpointType.Breakpoint, 
            removeOnHit = v2.RemoveOnHit, 
            contextBreakpoints = v2:GetContextBreakpoints()
        };
    end, 
    mockMetaBreakpoint = function(v3, v4) --[[ Line: 39 ]] --[[ Name: mockMetaBreakpoint ]]
        -- upvalues: v1 (copy)
        if v3.isEnabled == nil then
            v3.isEnabled = math.random() > 0.5;
        end;
        if v3.isValid == nil then
            v3.isValid = true;
        end;
        if v3.continueExecution == nil then
            v3.continueExecution = math.random() > 0.5;
        end;
        if v3.removeOnHit == nil then
            v3.removeOnHit = math.random() > 0.5;
        end;
        return {
            id = v3.id or v4, 
            isEnabled = v3.isEnabled, 
            isValid = v3.isValid, 
            lineNumber = v3.lineNumber or v4, 
            scriptName = v3.scriptName or "script" .. tostring(v4), 
            scriptLine = v3.scriptLine or "local varNum" .. tostring(v4) .. " = 0", 
            condition = v3.condition or "varNum" .. tostring(v4) .. " == 0", 
            logMessage = v3.logMessage or "varNum" .. tostring(v4), 
            continueExecution = v3.continueExecution, 
            debugpointType = v3.debugpointType or math.fmod(v4, 2) == 0 and v1.DebugpointType.Breakpoint or v1.DebugpointType.Logpoint, 
            contextBreakpoints = v3.contextBreakpoints or {}, 
            removeOnHit = v3.removeOnHit
        };
    end
};