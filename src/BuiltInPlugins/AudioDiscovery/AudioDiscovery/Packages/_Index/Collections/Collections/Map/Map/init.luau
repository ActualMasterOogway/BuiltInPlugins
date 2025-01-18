local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.Array.forEach);
local v3 = require(l_Parent_0.Array.map);
local _ = require(l_Parent_1.ES7Types);
local v5 = {};
v5.new = function(v6) --[[ Line: 36 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    local v7 = nil;
    local v8 = {};
    if v6 ~= nil then
        if _G.__DEV__ then
            local v9 = typeof(v6);
            if v9 == "table" then
                if #v6 > 0 and typeof(v6[1]) ~= "table" then
                    error("cannot create Map from {K, V} form, it must be { {K, V}... }");
                end;
            else
                error(("cannot create array from value of type `%s`"):format(v9));
            end;
        end;
        local v10 = table.clone(v6);
        v7 = table.create(#v10);
        for _, v12 in v10 do
            local v13 = v12[1];
            if _G.__DEV__ and v13 == nil then
                error("cannot create Map from a table that isn't an array.");
            end;
            local v14 = v12[2];
            if v8[v13] == nil then
                table.insert(v7, v13);
            end;
            v8[v13] = v14;
        end;
    else
        v7 = {};
    end;
    return (setmetatable({
        size = #v7, 
        _map = v8, 
        _array = v7
    }, v5));
end;
v5.set = function(v15, v16, v17) --[[ Line: 80 ]] --[[ Name: set ]]
    if v15._map[v16] == nil then
        v15.size = v15.size + 1;
        table.insert(v15._array, v16);
    end;
    v15._map[v16] = v17;
    return v15;
end;
v5.get = function(v18, v19) --[[ Line: 92 ]] --[[ Name: get ]]
    return v18._map[v19];
end;
v5.clear = function(v20) --[[ Line: 96 ]] --[[ Name: clear ]]
    local l_table_0 = table;
    v20.size = 0;
    l_table_0.clear(v20._map);
    l_table_0.clear(v20._array);
end;
v5.delete = function(v22, v23) --[[ Line: 103 ]] --[[ Name: delete ]]
    if v22._map[v23] == nil then
        return false;
    else
        v22.size = v22.size - 1;
        v22._map[v23] = nil;
        local v24 = table.find(v22._array, v23);
        if v24 then
            table.remove(v22._array, v24);
        end;
        return true;
    end;
end;
v5.forEach = function(v25, v26, v27) --[[ Line: 119 ]] --[[ Name: forEach ]]
    -- upvalues: v2 (copy)
    if _G.__DEV__ and typeof(v26) ~= "function" then
        error("callback is not a function");
    end;
    v2(v25._array, function(v28) --[[ Line: 126 ]]
        -- upvalues: v25 (copy), v27 (copy), v26 (copy)
        local v29 = v25._map[v28];
        if v27 ~= nil then
            v26(v27, v29, v28, v25);
            return;
        else
            v26(v29, v28, v25);
            return;
        end;
    end);
end;
v5.has = function(v30, v31) --[[ Line: 137 ]] --[[ Name: has ]]
    return v30._map[v31] ~= nil;
end;
v5.keys = function(v32) --[[ Line: 141 ]] --[[ Name: keys ]]
    return v32._array;
end;
v5.values = function(v33) --[[ Line: 145 ]] --[[ Name: values ]]
    -- upvalues: v3 (copy)
    return v3(v33._array, function(v34) --[[ Line: 146 ]]
        -- upvalues: v33 (copy)
        return v33._map[v34];
    end);
end;
v5.entries = function(v35) --[[ Line: 151 ]] --[[ Name: entries ]]
    -- upvalues: v3 (copy)
    return v3(v35._array, function(v36) --[[ Line: 152 ]]
        -- upvalues: v35 (copy)
        return {
            v36, 
            v35._map[v36]
        };
    end);
end;
v5.ipairs = function(v37) --[[ Line: 157 ]] --[[ Name: ipairs ]]
    if _G.__DEV__ then
        warn(debug.traceback("`for _,_ in myMap:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in myMap do` instead\n", 2));
    end;
    return ipairs(v37:entries());
end;
v5.__iter = function(v38) --[[ Line: 169 ]] --[[ Name: __iter ]]
    return next, v38:entries();
end;
v5.__index = function(v39, v40) --[[ Line: 173 ]] --[[ Name: __index ]]
    -- upvalues: v5 (copy)
    local v41 = rawget(v5, v40);
    if v41 ~= nil then
        return v41;
    else
        return v5.get(v39, v40);
    end;
end;
v5.__newindex = function(v42, v43, v44) --[[ Line: 182 ]] --[[ Name: __newindex ]]
    v42:set(v43, v44);
end;
return v5;