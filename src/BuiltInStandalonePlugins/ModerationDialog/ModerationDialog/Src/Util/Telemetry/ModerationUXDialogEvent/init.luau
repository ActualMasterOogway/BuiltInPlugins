local v0 = require(script.Parent.TelemetryProtocol);
return {
    eventName = "ModerationUXDialogEvent", 
    backends = {
        v0.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v0.ONE_HUNDRED_PERCENT, 
    lastUpdated = {
        24, 
        10, 
        30
    }, 
    description = "Tracks displaying the moderation UX or the actions that users make on it.", 
    links = "https://roblox.atlassian.net/wiki/spaces/developer/pages/2551219533/Q2+-+Improved+Moderation+UX+in+Studio+-+Tech+One+Page"
};