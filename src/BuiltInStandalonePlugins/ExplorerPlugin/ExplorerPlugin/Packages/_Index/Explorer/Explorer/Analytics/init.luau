local v0 = require(script.AnalyticsContext);
local v1 = require(script.AnalyticsTelemetryServiceProvider);
local _ = require(script.AnalyticsTypes);
local v3 = require(script.TelemetryServiceInterface);
local v4 = require(script.createMockTelemetryInterface);
return {
    AnalyticsContext = v0, 
    TelemetryServiceInterface = v3, 
    AnalyticsTelemetryServiceProvider = v1, 
    createMockTelemetryInterface = v4
};