local v0 = require(script.Parent.TelemetryProtocol);
local v1 = game:DefineFastInt("PathEditorToolUsageEventsThrottleHundredthsPercent", 0);
return {
    eventName = "Path2DToolUsage", 
    backends = {
        v0.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v1, 
    lastUpdated = {
        24, 
        3, 
        15
    }, 
    description = "Reports aggregate counts of our main interactions with the PathEditor tool", 
    links = "https://roblox.atlassian.net/wiki/x/jwG0gw"
};