local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Array);
local v2 = require(l_Parent_0.util.inspect);
local v3 = {};
v3.__index = v3;
v3.__tostring = function(v4) --[[ Line: 11 ]]
    -- upvalues: v2 (copy)
    local v5 = "Set ";
    if #v4._array > 0 then
        v5 = v5 .. "(" .. tostring(#v4._array) .. ") ";
    end;
    return v5 .. v2(v4._array);
end;
v3.new = function(v6) --[[ Line: 36 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v7 = {};
    local v8 = {};
    if v6 ~= nil then
        local v9 = nil;
        if typeof(v6) == "table" then
            if v1.isArray(v6) then
                v9 = v1.from(v6);
            elseif typeof(v6.ipairs) ~= "function" and _G.__DEV__ then
                error("cannot create array from an object-like table");
            end;
        elseif typeof(v6) == "string" then
            v9 = v1.from(v6);
        else
            error(("cannot create array from value of type `%s`"):format((typeof(v6))));
        end;
        if v9 then
            for _, v11 in ipairs(v9) do
                if not v8[v11] then
                    v8[v11] = true;
                    table.insert(v7, v11);
                end;
            end;
        elseif typeof(v6) == "table" and typeof(v6.ipairs) == "function" then
            for _, v13 in v6:ipairs() do
                if not v8[v13] then
                    v8[v13] = true;
                    table.insert(v7, v13);
                end;
            end;
        end;
    end;
    return (setmetatable({
        size = #v7, 
        _map = v8, 
        _array = v7
    }, v3));
end;
v3.add = function(v14, v15) --[[ Line: 80 ]] --[[ Name: add ]]
    if not v14._map[v15] then
        v14.size = v14.size + 1;
        v14._map[v15] = true;
        table.insert(v14._array, v15);
    end;
    return v14;
end;
v3.clear = function(v16) --[[ Line: 90 ]] --[[ Name: clear ]]
    v16.size = 0;
    table.clear(v16._map);
    table.clear(v16._array);
end;
v3.delete = function(v17, v18) --[[ Line: 96 ]] --[[ Name: delete ]]
    if not v17._map[v18] then
        return false;
    else
        v17.size = v17.size - 1;
        v17._map[v18] = nil;
        local v19 = table.find(v17._array, v18);
        if v19 then
            table.remove(v17._array, v19);
        end;
        return true;
    end;
end;
v3.forEach = function(v20, v21, v22) --[[ Line: 112 ]] --[[ Name: forEach ]]
    -- upvalues: v1 (copy)
    if typeof(v21) ~= "function" then
        error("callback is not a function");
    end;
    return v1.forEach(v20._array, function(v23) --[[ Line: 117 ]]
        -- upvalues: v22 (copy), v21 (copy), v20 (copy)
        if v22 ~= nil then
            v21(v22, v23, v23, v20);
            return;
        else
            v21(v23, v23, v20);
            return;
        end;
    end);
end;
v3.has = function(v24, v25) --[[ Line: 126 ]] --[[ Name: has ]]
    return v24._map[v25] ~= nil;
end;
v3.ipairs = function(v26) --[[ Line: 130 ]] --[[ Name: ipairs ]]
    return ipairs(v26._array);
end;
return v3;