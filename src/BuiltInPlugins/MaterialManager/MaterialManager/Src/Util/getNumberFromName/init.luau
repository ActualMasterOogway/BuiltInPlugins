local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local l_Util_0 = l_Parent_0.Src.Util;
local v3 = require(l_Util_0.getNumberFromText);
return function(v4, v5) --[[ Line: 7 ]]
    -- upvalues: v3 (copy)
    local v6 = string.sub(v4, 1, #v5) == v5;
    local v7 = string.sub(v4, string.len(v5) + 1);
    local v8 = v3(v7);
    local v9 = v8 and true or false;
    if v6 and v9 then
        return v8;
    else
        return nil;
    end;
end;