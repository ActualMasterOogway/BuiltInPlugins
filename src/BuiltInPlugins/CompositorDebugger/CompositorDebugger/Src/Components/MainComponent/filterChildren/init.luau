local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v2(v3, v4, v5) --[[ Line: 8 ]] --[[ Name: filterChildren ]]
    -- upvalues: v2 (copy)
    local v6 = {};
    local v7 = false;
    for _, v9 in v3 do
        if v4[v9.className] or v5 and v9.weight == 0 then
            v7 = true;
        else
            local v10 = nil;
            local v11, v12 = v2(v9.children, v4, v5);
            v9.children = v11;
            v10 = v12;
            v7 = v7 or v10;
            table.insert(v6, v9);
        end;
    end;
    if v7 then
        v3 = v6;
    end;
    return v3, v7;
end;
return v2;