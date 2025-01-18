local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.ES7Types);
return function(v2) --[[ Line: 23 ]]
    if _G.__DEV__ then
        print("Luau now has a direct table.isfrozen call that can save the overhead of this library function call");
    end;
    return table.isfrozen(v2);
end;