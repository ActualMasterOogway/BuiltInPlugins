local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.assertEqual);
local v2 = require(l_Parent_0.formatValue);
local v3 = require(l_Parent_0.splitOn);
local v4 = require(l_Parent_0.startsWith);
local l_concat_0 = table.concat;
local l_insert_0 = table.insert;
return function(v7, ...) --[[ Line: 38 ]] --[[ Name: format ]]
    -- upvalues: v1 (copy), v3 (copy), l_insert_0 (copy), v4 (copy), v2 (copy), l_concat_0 (copy)
    v1(typeof(v7), "string", "Attempted to call Dash.format with argument #1 of type {left:?} not {right:?}");
    local v8 = {
        ...
    };
    local v9 = 1;
    local v10, v11 = v3(v7, "{[^{}]*}");
    local v12 = {};
    for v13, v14 in pairs(v10) do
        l_insert_0(v12, (v14:gsub("{{", "{"):gsub("}}", "}")));
        local v15 = v11[v13] and v11[v13]:sub(2, -2);
        if v15 then
            local v16 = v14:gmatch("{+$")();
            if not (v16 and #v16 % 2 == 1) then
                local v17 = v3(v15, ":");
                local v18 = v4(v17[1], "#");
                local v19 = v18 and v17[1]:sub(2) or v17[1];
                local v20 = tonumber(v19);
                local v21 = v17[2];
                local v22 = "nil";
                if v20 then
                    v22 = v8[v20];
                elseif v19:len() > 0 then
                    local v23 = v8[1] and v8[1][v19];
                    if v23 ~= nil then
                        v22 = v23;
                    end;
                else
                    v22 = v8[v9];
                    v9 = v9 + 1;
                end;
                if v18 then
                    v22 = #v22;
                end;
                l_insert_0(v12, v2(v22, v21 or ""));
            else
                l_insert_0(v12, v15);
            end;
        end;
    end;
    return l_concat_0(v12, "");
end;