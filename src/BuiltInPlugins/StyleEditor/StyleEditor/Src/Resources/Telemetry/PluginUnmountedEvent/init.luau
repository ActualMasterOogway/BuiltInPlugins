local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_t_0 = require(l_Parent_0.Packages.Framework).Util.Typecheck.t;
local v2 = require(l_Parent_0.Src.Contexts.Telemetry.TelemetryProtocol);
local l_EventTypes_0 = v2.EventTypes;
local l_Backends_0 = v2.Backends;
local l_StandardizedFields_0 = v2.StandardizedFields;
local _ = require(l_Parent_0.Src.Contexts.Telemetry.Types);
local _ = require(l_Parent_0.Src.Types);
local l_Flags_0 = l_Parent_0.Src.Flags;
local v9 = require(l_Flags_0.getFFlagStyleEditorEnableTelemetry)();
local v10 = l_t_0.interface({
    sessionLengthSeconds = l_t_0.number, 
    focusTimeSeconds = l_t_0.number, 
    unmatchedFocusEndCount = l_t_0.number, 
    buttonPressCounts = l_t_0.map(l_t_0.string, l_t_0.number)
});
local v11 = {
    eventName = "StyleEditor_PluginUnmounted", 
    backends = {
        l_Backends_0.Points
    }, 
    throttlingPercentage = if v9 then v2.ONE_HUNDRED_PERCENT else 0, 
    lastUpdated = {
        24, 
        3, 
        20
    }, 
    description = "Root Roact component unmounted.", 
    links = ""
};
return function(v12) --[[ Line: 48 ]]
    -- upvalues: v10 (copy), l_EventTypes_0 (copy), v11 (copy), l_StandardizedFields_0 (copy)
    assert(v10(v12));
    return {
        eventType = l_EventTypes_0.RobloxTelemetry, 
        config = v11, 
        data = {
            customFields = v12, 
            standardizedFields = {
                l_StandardizedFields_0.addPlaceId, 
                l_StandardizedFields_0.addSessionId
            }
        }
    };
end;