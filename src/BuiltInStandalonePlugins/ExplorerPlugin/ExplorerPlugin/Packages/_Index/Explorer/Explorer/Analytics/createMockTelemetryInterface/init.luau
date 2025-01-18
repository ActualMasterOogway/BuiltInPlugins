local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(script.Parent.AnalyticsContext);
local _ = require(script.Parent.AnalyticsTypes);
local l_createElement_0 = require(l_script_FirstAncestor_0.Parent.React).createElement;
return function() --[[ Line: 32 ]] --[[ Name: createMockTelemetryInterface ]]
    -- upvalues: l_createElement_0 (copy), v1 (copy)
    local v4 = {};
    local v5 = {};
    local v6 = {};
    local v15 = {
        logCounter = function(v7, v8, v9) --[[ Line: 41 ]] --[[ Name: logCounter ]]
            -- upvalues: v4 (copy)
            table.insert(v4, {
                config = v7, 
                customFields = v8, 
                value = v9 or 1
            });
        end, 
        logEvent = function(v10, v11) --[[ Line: 53 ]] --[[ Name: logEvent ]]
            -- upvalues: v5 (copy)
            table.insert(v5, {
                config = v10, 
                customFields = v11
            });
        end, 
        logStat = function(v12, v13, v14) --[[ Line: 60 ]] --[[ Name: logStat ]]
            -- upvalues: v6 (copy)
            table.insert(v6, {
                config = v12, 
                customFields = v13, 
                stat = v14
            });
        end
    };
    return v15, function(v16) --[[ Line: 74 ]] --[[ Name: MockAnalyticsProvider ]]
        -- upvalues: v15 (copy), l_createElement_0 (ref), v1 (ref)
        local l_v15_0 = v15;
        return l_createElement_0(v1.Provider, {
            value = l_v15_0
        }, v16.children);
    end, {
        countersSent = v4, 
        eventsSent = v5, 
        statsSent = v6
    };
end;