local v0 = require(script.Parent.TelemetryProtocol);
return {
    eventName = "StartPageTelemetryEvent", 
    backends = {
        v0.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v0.ONE_HUNDRED_PERCENT, 
    lastUpdated = {
        24, 
        8, 
        15
    }, 
    description = "Base message for all the telemetry on the Studio start page.", 
    links = "https://roblox.atlassian.net/l/cp/Q1L7rmc1"
};