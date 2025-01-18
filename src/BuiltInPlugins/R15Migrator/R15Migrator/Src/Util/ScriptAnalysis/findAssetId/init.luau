local l_Util_0 = script:FindFirstAncestor("R15Migrator").Src.Util;
local v1 = require(l_Util_0.parseAssetURL);
local l_Parent_0 = script.Parent;
local v3 = require(l_Parent_0.StringUtil);
return function(v4, v5, v6) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v7, v8, v9 = v1(v4);
    if not v7 then
        return false;
    elseif not v3.MatchBeforeAndAfter(v4, v7, v8, "[\"]", "[\"]") and not v3.MatchBeforeAndAfter(v4, v7, v8, "[']", "[']") then
        return false;
    else
        if v6 then
            v6(v7, v8, v9, v4, v5);
        end;
        return v9;
    end;
end;