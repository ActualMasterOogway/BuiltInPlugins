local l_Parent_0 = script.Parent.Parent;
local l_NaN_0 = require(l_Parent_0.Number).NaN;
return function(v2, v3) --[[ Line: 9 ]]
    -- upvalues: l_NaN_0 (copy)
    if typeof(v3) ~= "number" then
        v3 = 1;
    end;
    if utf8.len(v2) < v3 or v3 < 1 then
        return l_NaN_0;
    else
        local v4 = utf8.offset(v2, v3);
        local v5 = utf8.codepoint(v2, v4, v4);
        if v5 == nil then
            return l_NaN_0;
        else
            return v5;
        end;
    end;
end;