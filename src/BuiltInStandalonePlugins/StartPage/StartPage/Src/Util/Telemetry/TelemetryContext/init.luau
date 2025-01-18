local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local l_RbxAnalyticsService_0 = require(l_script_FirstAncestor_0.Src.Util.Services).RbxAnalyticsService;
local _ = require(script.Parent.TelemetryProtocolTypes);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Dash).join;
local v5 = v3.ContextServices.ContextItem:extend("Telemetry");
v5.new = function(v6) --[[ Line: 21 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    assert(v6, "TelemetryContext.new expects a Telemetry instance.");
    local v7 = {
        telemetry = v6
    };
    setmetatable(v7, v5);
    return v7;
end;
v5.get = function(v8) --[[ Line: 31 ]] --[[ Name: get ]]
    return v8.telemetry;
end;
v5.log = function(v9, v10, v11) --[[ Line: 35 ]] --[[ Name: log ]]
    -- upvalues: l_join_0 (copy), l_RbxAnalyticsService_0 (copy)
    return v9.telemetry:logRobloxTelemetryEvent(v10, nil, l_join_0({
        studioSessionId = l_RbxAnalyticsService_0:GetSessionId(), 
        clientId = l_RbxAnalyticsService_0:GetClientId()
    }, v11));
end;
v5.mock = function(v12) --[[ Line: 46 ]] --[[ Name: mock ]]
    -- upvalues: v5 (copy)
    return (v5.new({
        logRobloxTelemetryEvent = v12 or function() --[[ Line: 48 ]]

        end
    }));
end;
return v5;