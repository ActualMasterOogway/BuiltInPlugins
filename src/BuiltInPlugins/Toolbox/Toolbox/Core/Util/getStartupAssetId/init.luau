local l_StudioService_0 = game:GetService("StudioService");
local v1 = require(script.Parent.isCli);
return function() --[[ Line: 5 ]]
    -- upvalues: v1 (copy), l_StudioService_0 (copy)
    if v1() then
        return "";
    else
        return l_StudioService_0:getStartupAssetId();
    end;
end;