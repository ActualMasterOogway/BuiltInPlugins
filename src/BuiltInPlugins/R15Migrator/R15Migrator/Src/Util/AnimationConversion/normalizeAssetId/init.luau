local l_Util_0 = script:FindFirstAncestor("R15Migrator").Src.Util;
local v1 = require(l_Util_0.parseAssetURL);
return function(v2) --[[ Line: 6 ]] --[[ Name: normalizeAssetId ]]
    -- upvalues: v1 (copy)
    local _, _, _, v6 = v1(v2);
    return v6;
end;