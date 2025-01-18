local l_Util_0 = script:FindFirstAncestor("Toolbox").Core.Util;
local v1 = require(l_Util_0.DebugFlags);
return function(v2, v3, v4) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    if not v2 then
        if v1.shouldDebugWarnings() then
            warn("ixp was undefined");
        end;
        return nil;
    elseif not v2:isReady() then
        return nil;
    else
        local v5 = v2:getVariables()[v3];
        if v5 and v5[v4] then
            return true;
        else
            return false;
        end;
    end;
end;