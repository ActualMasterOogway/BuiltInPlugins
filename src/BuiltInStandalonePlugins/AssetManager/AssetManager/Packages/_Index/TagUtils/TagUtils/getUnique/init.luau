local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.getAll);
return function(...) --[[ Line: 5 ]] --[[ Name: getUnique ]]
    -- upvalues: v1 (copy)
    local v2 = v1(...);
    local v3 = #v2;
    if v3 == 1 then
        return v2[1];
    else
        if v3 == 0 then
            error(("unable to find instance tagged with %s"):format(table.concat({
                ...
            }, ", ")));
        end;
        error(("expected to find only one instance tagged with %s, but found %d"):format(table.concat({
            ...
        }, ", "), #v2));
        return;
    end;
end;