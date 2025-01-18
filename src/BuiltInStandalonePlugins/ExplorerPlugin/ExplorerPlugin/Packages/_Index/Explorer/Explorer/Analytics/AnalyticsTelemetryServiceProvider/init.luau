local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(script.Parent.AnalyticsContext);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(script.Parent.TelemetryServiceInterface);
local l_createElement_0 = v2.createElement;
return function(v5) --[[ Line: 9 ]] --[[ Name: AnalyticsTelemetryServiceProvider ]]
    -- upvalues: v3 (copy), l_createElement_0 (copy), v1 (copy)
    local l_v3_0 = v3;
    return l_createElement_0(v1.Provider, {
        value = l_v3_0
    }, v5.children);
end;