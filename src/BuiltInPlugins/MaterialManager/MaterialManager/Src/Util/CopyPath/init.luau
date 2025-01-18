local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return function(v2) --[[ Line: 4 ]]
    local v3 = {};
    for _, v5 in ipairs(v2) do
        table.insert(v3, v5);
    end;
    return v3;
end;