local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.isArray);
return function(v2, ...) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    if _G.__DEV__ and not v1(v2) then
        error(string.format("Array.unshift called on non-array %s", (typeof(v2))));
    end;
    local v3 = select("#", ...);
    if v3 > 0 then
        for v4 = v3, 1, -1 do
            table.insert(v2, 1, (select(v4, ...)));
        end;
    end;
    return #v2;
end;