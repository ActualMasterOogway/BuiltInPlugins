local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return function(v2) --[[ Line: 4 ]]
    local v3 = 1;
    if v2 and #v2 > 0 then
        table.sort(v2);
        for _, v5 in ipairs(v2) do
            if v3 >= v5 then
                v3 = v3 + 1;
            else
                break;
            end;
        end;
    end;
    return v3;
end;