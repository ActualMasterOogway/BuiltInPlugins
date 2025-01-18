local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v2) --[[ Line: 10 ]] --[[ Name: getLocalDateTime ]]
    local function _(v3) --[[ Line: 11 ]] --[[ Name: convert24To12Hour ]]
        if v3 == 0 then
            return 12;
        elseif v3 > 12 then
            return v3 - 12;
        else
            return v3;
        end;
    end;
    local v5 = v2:ToLocalTime();
    local v6 = {
        year = tostring(v5.Year), 
        month = tostring(v5.Month), 
        day = tostring(v5.Day)
    };
    local l_Hour_0 = v5.Hour;
    v6.hour = tostring(l_Hour_0 == 0 and 12 or if l_Hour_0 > 12 then l_Hour_0 - 12 else l_Hour_0);
    v6.isPm = v5.Hour >= 12;
    v6.minute = if v5.Minute < 10 then "0" .. tostring(v5.Minute) else tostring(v5.Minute);
    return v6;
end;