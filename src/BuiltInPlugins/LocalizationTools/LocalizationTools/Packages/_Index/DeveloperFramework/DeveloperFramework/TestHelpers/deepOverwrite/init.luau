local l_Parent_0 = script.Parent.Parent;
local l_deepCopy_0 = require(l_Parent_0.Util).deepCopy;
deepOverwrite = function(v2, v3, v4) --[[ Line: 11 ]] --[[ Name: deepOverwrite ]]
    for v5, v6 in pairs(v2) do
        if tostring(v6):find(v3) then
            v2[v5] = v4;
        elseif type(v6) == "table" then
            v2[v5] = deepOverwrite(v6, v3, v4);
        end;
    end;
    return v2;
end;
return function(v7, v8, v9) --[[ Line: 25 ]]
    -- upvalues: l_deepCopy_0 (copy)
    return deepOverwrite(l_deepCopy_0(v7), v8, v9);
end;