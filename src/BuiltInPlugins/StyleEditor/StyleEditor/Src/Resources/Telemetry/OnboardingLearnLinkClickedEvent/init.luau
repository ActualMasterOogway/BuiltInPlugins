local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Contexts.Telemetry.TelemetryProtocol);
local l_EventTypes_0 = v1.EventTypes;
local l_Backends_0 = v1.Backends;
local l_StandardizedFields_0 = v1.StandardizedFields;
local _ = require(l_Parent_0.Src.Contexts.Telemetry.Types);
local l_Flags_0 = l_Parent_0.Src.Flags;
local v7 = require(l_Flags_0.getFFlagStyleEditorEnableTelemetry)();
local v8 = {
    eventName = "StyleEditor_OnboardingLearnLinkClicked", 
    backends = {
        l_Backends_0.Points
    }, 
    throttlingPercentage = if v7 then v1.ONE_HUNDRED_PERCENT else 0, 
    lastUpdated = {
        24, 
        2, 
        22
    }, 
    description = "Onboarding \"learn more\" link clicked", 
    links = ""
};
return function() --[[ Line: 29 ]]
    -- upvalues: l_EventTypes_0 (copy), v8 (copy), l_StandardizedFields_0 (copy)
    return {
        eventType = l_EventTypes_0.RobloxTelemetry, 
        config = v8, 
        data = {
            standardizedFields = {
                l_StandardizedFields_0.addPlaceId, 
                l_StandardizedFields_0.addSessionId
            }
        }
    };
end;