local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.isArray);
return function(v2) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    if _G.__DEV__ and not v1(v2) then
        error(string.format("Array.shift called on non-array %s", (typeof(v2))));
    end;
    if #v2 > 0 then
        return table.remove(v2, 1);
    else
        return nil;
    end;
end;