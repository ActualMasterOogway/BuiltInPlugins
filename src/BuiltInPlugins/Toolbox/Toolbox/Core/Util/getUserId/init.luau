local l_StudioService_0 = game:GetService("StudioService");
local v1 = require(script.Parent.isCli);
return function() --[[ Line: 6 ]]
    -- upvalues: v1 (copy), l_StudioService_0 (copy)
    local v2 = 0;
    if v1() then
        return 1;
    else
        pcall(function() --[[ Line: 13 ]]
            -- upvalues: v2 (ref), l_StudioService_0 (ref)
            v2 = l_StudioService_0:GetUserId();
        end);
        return v2;
    end;
end;