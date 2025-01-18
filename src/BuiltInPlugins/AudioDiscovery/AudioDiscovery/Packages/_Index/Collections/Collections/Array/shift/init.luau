local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_0.isArray);
local _ = require(l_Parent_1.ES7Types);
return function(v4) --[[ Line: 22 ]]
    -- upvalues: v2 (copy)
    if _G.__DEV__ and not v2(v4) then
        error(string.format("Array.shift called on non-array %s", (typeof(v4))));
    end;
    if #v4 > 0 then
        return table.remove(v4, 1);
    else
        return nil;
    end;
end;