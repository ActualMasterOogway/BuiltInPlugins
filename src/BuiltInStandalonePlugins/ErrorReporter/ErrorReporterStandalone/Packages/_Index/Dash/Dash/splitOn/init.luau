local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.assertEqual);
local l_insert_0 = table.insert;
return function(v3, v4) --[[ Line: 10 ]] --[[ Name: splitOn ]]
    -- upvalues: v1 (copy), l_insert_0 (copy)
    v1(typeof(v3), "string", "Attempted to call Dash.splitOn with argument #1 of type {left:?} not {right:?}");
    v1(typeof(v4), "string", "Attempted to call Dash.splitOn with argument #2 of type {left:?} not {right:?}");
    local v5 = {};
    local v6 = {};
    local v7 = 1;
    if not v4 then
        for v8 = 1, #v3 do
            l_insert_0(v5, v3:sub(v8, v8));
        end;
        return v5;
    else
        local v9, v10 = v3:find(v4, v7);
        while v9 do
            l_insert_0(v6, v3:sub(v9, v10));
            l_insert_0(v5, v3:sub(v7, v9 - 1));
            v7 = v10 + 1;
            local v11, v12 = v3:find(v4, v7);
            v9 = v11;
            v10 = v12;
        end;
        l_insert_0(v5, v3:sub(v7));
        return v5, v6;
    end;
end;