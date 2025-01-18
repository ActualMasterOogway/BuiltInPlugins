local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(script.Parent.AnalyticsTypes);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = {
    logCounter = function() --[[ Line: 9 ]] --[[ Name: logCounter ]]

    end, 
    logEvent = function() --[[ Line: 10 ]] --[[ Name: logEvent ]]

    end, 
    logStat = function() --[[ Line: 11 ]] --[[ Name: logStat ]]

    end
};
return (v2.createContext(v3));