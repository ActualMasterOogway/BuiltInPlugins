local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.isArray);
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.types);
local v4 = "Array.concat(...) only works with array-like tables but " .. "it received an object-like table.\nYou can avoid this error by wrapping the " .. "object-like table into an array. Example: `concat({1, 2}, {a = true})` should " .. "be `concat({1, 2}, { {a = true} }`";
return function(v5, ...) --[[ Line: 14 ]] --[[ Name: concat ]]
    -- upvalues: v1 (copy), v4 (copy)
    local v6 = nil;
    local v7 = 0;
    if v1(v5) then
        v6 = table.clone(v5);
        v7 = #v5;
    else
        v7 = v7 + 1;
        v6 = {
            [v7] = v5
        };
    end;
    for v8 = 1, select("#", ...) do
        local v9 = select(v8, ...);
        local v10 = typeof(v9);
        if v9 ~= nil then
            if v10 == "table" then
                if _G.__DEV__ and not v1(v9) then
                    error(v4);
                end;
                for v11 = 1, #v9 do
                    v7 = v7 + 1;
                    v6[v7] = v9[v11];
                end;
            else
                v7 = v7 + 1;
                v6[v7] = v9;
            end;
        end;
    end;
    return v6;
end;