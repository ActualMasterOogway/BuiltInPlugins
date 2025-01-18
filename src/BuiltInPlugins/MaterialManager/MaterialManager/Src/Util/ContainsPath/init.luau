local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return function(v2, v3) --[[ Line: 5 ]]
    if #v2 > #v3 then
        return false;
    else
        for v4, v5 in ipairs(v2) do
            if v5 ~= v3[v4] then
                return false;
            end;
        end;
        return true;
    end;
end;