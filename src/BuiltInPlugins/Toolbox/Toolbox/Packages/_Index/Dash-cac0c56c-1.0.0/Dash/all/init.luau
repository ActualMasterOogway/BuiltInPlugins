local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.Types);
local function v3(v2) --[[ Line: 6 ]]
    return v2;
end;
return function(v4, v5) --[[ Line: 10 ]] --[[ Name: all ]]
    -- upvalues: v3 (copy)
    local v6 = v5 or v3;
    for v7, v8 in v4 do
        if not v6(v8, v7) then
            return false;
        end;
    end;
    return true;
end;