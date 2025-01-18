local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return function(v2) --[[ Line: 8 ]]
    table.sort(v2, function(v3, v4) --[[ Line: 9 ]]
        return v3.Label:lower() < v4.Label:lower();
    end);
    return v2;
end;