local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Array);
local v2 = require(l_Parent_0.Object);
local v3 = require(l_Parent_0.instanceof);
local v4 = {};
v4.new = function(v5) --[[ Line: 34 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v4 (copy)
    local v6 = {};
    local v7 = {};
    if v5 ~= nil then
        local v8 = nil;
        local v9 = typeof(v5);
        if v9 == "table" then
            if #v5 > 0 and typeof(v5[1]) ~= "table" then
                error("cannot create Map from {K, V} form, it must be { {K, V}... }");
            end;
            v8 = v1.from(v5);
        else
            error(("cannot create array from value of type `%s`"):format(v9));
        end;
        for _, v11 in ipairs(v8) do
            local v12 = v11[1];
            if _G.__DEV__ and v12 == nil then
                error("cannot create Map from a table that isn't an array.");
            end;
            local v13 = v11[2];
            if v7[v12] == nil then
                table.insert(v6, v12);
            end;
            v7[v12] = v13;
        end;
    end;
    return (setmetatable({
        size = #v6, 
        _map = v7, 
        _array = v6
    }, v4));
end;
v4.set = function(v14, v15, v16) --[[ Line: 74 ]] --[[ Name: set ]]
    if v14._map[v15] == nil then
        v14.size = v14.size + 1;
        table.insert(v14._array, v15);
    end;
    v14._map[v15] = v16;
    return v14;
end;
v4.get = function(v17, v18) --[[ Line: 86 ]] --[[ Name: get ]]
    return v17._map[v18];
end;
v4.clear = function(v19) --[[ Line: 90 ]] --[[ Name: clear ]]
    local l_table_0 = table;
    v19.size = 0;
    l_table_0.clear(v19._map);
    l_table_0.clear(v19._array);
end;
v4.delete = function(v21, v22) --[[ Line: 97 ]] --[[ Name: delete ]]
    if v21._map[v22] == nil then
        return false;
    else
        v21.size = v21.size - 1;
        v21._map[v22] = nil;
        local v23 = table.find(v21._array, v22);
        if v23 then
            table.remove(v21._array, v23);
        end;
        return true;
    end;
end;
v4.forEach = function(v24, v25, v26) --[[ Line: 113 ]] --[[ Name: forEach ]]
    -- upvalues: v1 (copy)
    if typeof(v25) ~= "function" then
        error("callback is not a function");
    end;
    return v1.forEach(v24._array, function(v27) --[[ Line: 118 ]]
        -- upvalues: v24 (copy), v26 (copy), v25 (copy)
        local v28 = v24._map[v27];
        if v26 ~= nil then
            v25(v26, v28, v27, v24);
            return;
        else
            v25(v28, v27, v24);
            return;
        end;
    end);
end;
v4.has = function(v29, v30) --[[ Line: 129 ]] --[[ Name: has ]]
    return v29._map[v30] ~= nil;
end;
v4.keys = function(v31) --[[ Line: 133 ]] --[[ Name: keys ]]
    return v31._array;
end;
v4.values = function(v32) --[[ Line: 137 ]] --[[ Name: values ]]
    -- upvalues: v1 (copy)
    return v1.map(v32._array, function(v33) --[[ Line: 138 ]]
        -- upvalues: v32 (copy)
        return v32._map[v33];
    end);
end;
v4.entries = function(v34) --[[ Line: 143 ]] --[[ Name: entries ]]
    -- upvalues: v1 (copy)
    return v1.map(v34._array, function(v35) --[[ Line: 144 ]]
        -- upvalues: v34 (copy)
        return {
            v35, 
            v34._map[v35]
        };
    end);
end;
v4.ipairs = function(v36) --[[ Line: 149 ]] --[[ Name: ipairs ]]
    return ipairs(v36:entries());
end;
v4.__index = function(v37, v38) --[[ Line: 153 ]] --[[ Name: __index ]]
    -- upvalues: v4 (copy)
    local v39 = rawget(v4, v38);
    if v39 ~= nil then
        return v39;
    else
        return v4.get(v37, v38);
    end;
end;
v4.__newindex = function(v40, v41, v42) --[[ Line: 162 ]] --[[ Name: __newindex ]]
    v40:set(v41, v42);
end;
return {
    Map = v4, 
    coerceToMap = function(v43) --[[ Line: 166 ]] --[[ Name: coerceToMap ]]
        -- upvalues: v3 (copy), v4 (copy), v2 (copy)
        return v3(v43, v4) and v43 or v4.new(v2.entries(v43));
    end, 
    coerceToTable = function(v44) --[[ Line: 171 ]] --[[ Name: coerceToTable ]]
        -- upvalues: v3 (copy), v4 (copy), v1 (copy)
        if not v3(v44, v4) then
            return v44;
        else
            return v1.reduce(v44:entries(), function(v45, v46) --[[ Line: 177 ]]
                v45[v46[1]] = v46[2];
                return v45;
            end, {});
        end;
    end
};