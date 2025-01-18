local l_StudioService_0 = game:GetService("StudioService");
local l_Players_0 = game:GetService("Players");
local v2 = require(script.Parent.isCli);
return function() --[[ Line: 6 ]]
    -- upvalues: v2 (copy), l_StudioService_0 (copy), l_Players_0 (copy)
    local v3 = "";
    if v2() then
        return 1;
    else
        pcall(function() --[[ Line: 13 ]]
            -- upvalues: l_StudioService_0 (ref), v3 (ref), l_Players_0 (ref)
            local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
            v3 = l_Players_0:GetNameFromUserIdAsync(l_l_StudioService_0_UserId_0);
        end);
        return v3;
    end;
end;