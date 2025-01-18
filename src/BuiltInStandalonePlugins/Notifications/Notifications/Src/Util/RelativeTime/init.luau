local v0 = require(script.Parent.TimeConstants);
local l_ELAPSED_TIME_TRANSLATION_SCOPE_0 = v0.ELAPSED_TIME_TRANSLATION_SCOPE;
local function v10(v2) --[[ Line: 8 ]] --[[ Name: calculateRelativeTime ]]
    -- upvalues: v0 (copy), l_ELAPSED_TIME_TRANSLATION_SCOPE_0 (copy)
    if not v2 then
        return {
            scope = "", 
            key = ""
        };
    else
        local v3 = DateTime.now().UnixTimestamp - v2;
        if v3 < v0.MINUTE_IN_SECONDS then
            return {
                scope = l_ELAPSED_TIME_TRANSLATION_SCOPE_0, 
                key = "Now"
            };
        elseif v3 < v0.HOUR_IN_SECONDS then
            local v4 = tostring((math.floor(v3 / v0.MINUTE_IN_SECONDS)));
            return {
                scope = l_ELAPSED_TIME_TRANSLATION_SCOPE_0, 
                key = "Minutes", 
                paramName = "minutes", 
                paramValue = v4
            };
        elseif v3 < v0.DAY_IN_SECONDS then
            local v5 = tostring((math.floor(v3 / v0.HOUR_IN_SECONDS)));
            return {
                scope = l_ELAPSED_TIME_TRANSLATION_SCOPE_0, 
                key = "Hours", 
                paramName = "hours", 
                paramValue = v5
            };
        elseif v3 < v0.WEEK_IN_SECONDS then
            local v6 = tostring((math.floor(v3 / v0.DAY_IN_SECONDS)));
            return {
                scope = l_ELAPSED_TIME_TRANSLATION_SCOPE_0, 
                key = "Days", 
                paramName = "days", 
                paramValue = v6
            };
        elseif v3 < v0.MONTH_IN_SECONDS then
            local v7 = tostring((math.floor(v3 / v0.WEEK_IN_SECONDS)));
            return {
                scope = l_ELAPSED_TIME_TRANSLATION_SCOPE_0, 
                key = "Weeks", 
                paramName = "weeks", 
                paramValue = v7
            };
        elseif v3 < v0.YEAR_IN_SECONDS then
            local v8 = tostring((math.floor(v3 / v0.MONTH_IN_SECONDS)));
            return {
                scope = l_ELAPSED_TIME_TRANSLATION_SCOPE_0, 
                key = "Months", 
                paramName = "months", 
                paramValue = v8
            };
        else
            local v9 = tostring((math.floor(v3 / v0.YEAR_IN_SECONDS)));
            return {
                scope = l_ELAPSED_TIME_TRANSLATION_SCOPE_0, 
                key = "Years", 
                paramName = "years", 
                paramValue = v9
            };
        end;
    end;
end;
local v11 = v0.MINUTE_IN_SECONDS * v0.SECONDS_IN_MS;
local v12 = v0.HOUR_IN_SECONDS * v0.SECONDS_IN_MS;
return {
    calculateRelativeTime = v10, 
    getRefreshIntervalInMS = function(v13) --[[ Line: 80 ]] --[[ Name: getRefreshIntervalInMS ]]
        -- upvalues: v0 (copy), v11 (copy), v12 (copy)
        if not v13 then
            return nil;
        else
            local v14 = DateTime.now().UnixTimestamp - v13;
            if v14 < v0.HOUR_IN_SECONDS then
                return v11;
            elseif v14 < v0.DAY_IN_SECONDS then
                return v12;
            else
                return nil;
            end;
        end;
    end
};