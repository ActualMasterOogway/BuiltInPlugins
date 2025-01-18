local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Array);
local v2 = require(l_Parent_0.Object);
local v3 = require(l_Parent_0.instanceof);
local v4 = {};
v4.new = function(v5) --[[ Line: 27 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v4 (copy)
    local v6 = {};
    local v7 = {};
    if v5 ~= nil then
        local v8 = nil;
        local v9 = typeof(v5);
        if v9 == "table" then
            v8 = v1.from(v5);
        else
            error(("cannot create array from value of type `%s`"):format(v9));
        end;
        for _, v11 in ipairs(v8) do
            local v12 = v11[1];
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
v4.set = function(v14, v15, v16) --[[ Line: 58 ]] --[[ Name: set ]]
    if v14._map[v15] == nil then
        v14.size = v14.size + 1;
        table.insert(v14._array, v15);
    end;
    v14._map[v15] = v16;
    return v14;
end;
v4.get = function(v17, v18) --[[ Line: 69 ]] --[[ Name: get ]]
    return v17._map[v18];
end;
v4.clear = function(v19) --[[ Line: 73 ]] --[[ Name: clear ]]
    local l_table_0 = table;
    v19.size = 0;
    l_table_0.clear(v19._map);
    l_table_0.clear(v19._array);
end;
v4.delete = function(v21, v22) --[[ Line: 80 ]] --[[ Name: delete ]]
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
v4.has = function(v24, v25) --[[ Line: 93 ]] --[[ Name: has ]]
    return v24._map[v25] ~= nil;
end;
v4.keys = function(v26) --[[ Line: 97 ]] --[[ Name: keys ]]
    return v26._array;
end;
v4.values = function(v27) --[[ Line: 101 ]] --[[ Name: values ]]
    -- upvalues: v1 (copy)
    return v1.map(v27._array, function(v28) --[[ Line: 102 ]]
        -- upvalues: v27 (copy)
        return v27._map[v28];
    end);
end;
v4.entries = function(v29) --[[ Line: 107 ]] --[[ Name: entries ]]
    -- upvalues: v1 (copy)
    return v1.map(v29._array, function(v30) --[[ Line: 108 ]]
        -- upvalues: v29 (copy)
        return {
            v30, 
            v29._map[v30]
        };
    end);
end;
v4.ipairs = function(v31) --[[ Line: 113 ]] --[[ Name: ipairs ]]
    return ipairs(v31:entries());
end;
v4.__index = function(v32, v33) --[[ Line: 117 ]] --[[ Name: __index ]]
    -- upvalues: v4 (copy)
    local v34 = rawget(v4, v33);
    if v34 ~= nil then
        return v34;
    else
        return v4.get(v32, v33);
    end;
end;
v4.__newindex = function(v35, v36, v37) --[[ Line: 126 ]] --[[ Name: __newindex ]]
    v35:set(v36, v37);
end;
return {
    Map = v4, 
    coerceToMap = function(v38) --[[ Line: 130 ]] --[[ Name: coerceToMap ]]
        -- upvalues: v3 (copy), v4 (copy), v2 (copy)
        return v3(v38, v4) and v38 or v4.new(v2.entries(v38));
    end, 
    coerceToTable = function(v39) --[[ Line: 135 ]] --[[ Name: coerceToTable ]]
        -- upvalues: v3 (copy), v4 (copy), v1 (copy)
        if not v3(v39, v4) then
            return v39;
        else
            return v1.reduce(v39:entries(), function(v40, v41) --[[ Line: 141 ]]
                v40[v41[1]] = v41[2];
                return v40;
            end, {});
        end;
    end
};