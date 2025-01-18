local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.isArray);
local v2 = "Array.concat(...) only works with array-like tables but " .. "it received an object-like table.\nYou can avoid this error by wrapping the " .. "object-like table into an array. Example: `concat({1, 2}, {a = true})` should " .. "be `concat({1, 2}, { {a = true} }`";
return function(...) --[[ Line: 9 ]] --[[ Name: concat ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3 = {};
    local v4 = 0;
    for v5 = 1, select("#", ...) do
        local v6 = select(v5, ...);
        local v7 = typeof(v6);
        if v6 ~= nil then
            if v7 == "table" then
                if _G.__DEV__ and not v1(v6) then
                    error(v2);
                end;
                for v8 = 1, #v6 do
                    v4 = v4 + 1;
                    v3[v4] = v6[v8];
                end;
            else
                v4 = v4 + 1;
                v3[v4] = v6;
            end;
        end;
    end;
    return v3;
end;