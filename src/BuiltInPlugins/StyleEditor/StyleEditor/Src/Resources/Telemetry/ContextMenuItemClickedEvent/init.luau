local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_t_0 = require(l_Parent_0.Packages.Framework).Util.Typecheck.t;
local v2 = require(l_Parent_0.Src.Contexts.Telemetry.TelemetryProtocol);
local l_EventTypes_0 = v2.EventTypes;
local l_Backends_0 = v2.Backends;
local l_StandardizedFields_0 = v2.StandardizedFields;
local _ = require(l_Parent_0.Src.Contexts.Telemetry.Types);
local l_Flags_0 = l_Parent_0.Src.Flags;
local v8 = require(l_Flags_0.getFFlagStyleEditorEnableTelemetry)();
local v9 = l_t_0.interface({
    path = l_t_0.string, 
    data = l_t_0.optional(l_t_0.table)
});
local v10 = {
    eventName = "StyleEditor_ContextMenuItemClicked", 
    backends = {
        l_Backends_0.Points
    }, 
    throttlingPercentage = if v8 then v2.ONE_HUNDRED_PERCENT else 0, 
    lastUpdated = {
        24, 
        2, 
        22
    }, 
    description = "Context menu item clicked.", 
    links = ""
};
return function(v11) --[[ Line: 41 ]]
    -- upvalues: v9 (copy), l_EventTypes_0 (copy), v10 (copy), l_StandardizedFields_0 (copy)
    assert(v9(v11));
    return {
        eventType = l_EventTypes_0.RobloxTelemetry, 
        config = v10, 
        data = {
            customFields = v11, 
            standardizedFields = {
                l_StandardizedFields_0.addPlaceId, 
                l_StandardizedFields_0.addSessionId
            }
        }
    };
end;