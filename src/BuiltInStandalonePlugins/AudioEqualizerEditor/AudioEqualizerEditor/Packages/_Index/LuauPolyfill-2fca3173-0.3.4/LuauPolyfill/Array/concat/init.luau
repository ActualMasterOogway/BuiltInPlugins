local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.isArray);
local v2 = "Array.concat(...) only works with array-like tables but " .. "it received an object-like table.\nYou can avoid this error by wrapping the " .. "object-like table into an array. Example: `concat({1, 2}, {a = true})` should " .. "be `concat({1, 2}, { {a = true} }`";
return function(v3, ...) --[[ Line: 12 ]] --[[ Name: concat ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4 = {};
    local v5 = 0;
    if v1(v3) then
        for _, v7 in ipairs(v3) do
            v5 = v5 + 1;
            v4[v5] = v7;
        end;
    else
        v5 = v5 + 1;
        v4[v5] = v3;
    end;
    for v8 = 1, select("#", ...) do
        local v9 = select(v8, ...);
        local v10 = typeof(v9);
        if v9 ~= nil then
            if v10 == "table" then
                if _G.__DEV__ and not v1(v9) then
                    error(v2);
                end;
                for v11 = 1, #v9 do
                    v5 = v5 + 1;
                    v4[v5] = v9[v11];
                end;
            else
                v5 = v5 + 1;
                v4[v5] = v9;
            end;
        end;
    end;
    return v4;
end;