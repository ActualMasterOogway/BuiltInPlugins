local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.inspect);
local v3 = require(l_Parent_0.Array.isArray);
local v4 = require(l_Parent_0.Array.forEach);
local v5 = require(l_Parent_0.Array.from.fromString);
local _ = require(l_Parent_1.ES7Types);
local v10 = {
    __iter = function(v7) --[[ Line: 38 ]] --[[ Name: __iter ]]
        return next, v7._array;
    end, 
    __tostring = function(v8) --[[ Line: 41 ]] --[[ Name: __tostring ]]
        -- upvalues: v2 (copy)
        local v9 = "Set ";
        if #v8._array > 0 then
            v9 = v9 .. "(" .. tostring(#v8._array) .. ") ";
        end;
        return v9 .. v2(v8._array);
    end
};
v10.__index = v10;
v10.new = function(v11) --[[ Line: 53 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v5 (copy), v10 (copy)
    local v12 = nil;
    local v13 = {};
    if v11 ~= nil then
        local v14 = nil;
        if typeof(v11) == "table" then
            if v3(v11) then
                v14 = table.clone(v11);
            else
                local v15 = getmetatable(v11);
                if v15 and rawget(v15, "__iter") then
                    v14 = v11;
                elseif _G.__DEV__ then
                    error("cannot create array from an object-like table");
                end;
            end;
        elseif typeof(v11) == "string" then
            v14 = v5(v11);
        else
            error(("cannot create array from value of type `%s`"):format((typeof(v11))));
        end;
        if v14 then
            v12 = table.create(#v14);
            for _, v17 in v14 do
                if not v13[v17] then
                    v13[v17] = true;
                    table.insert(v12, v17);
                end;
            end;
        else
            v12 = {};
        end;
    else
        v12 = {};
    end;
    return (setmetatable({
        size = #v12, 
        _map = v13, 
        _array = v12
    }, v10));
end;
v10.add = function(v18, v19) --[[ Line: 99 ]] --[[ Name: add ]]
    if not v18._map[v19] then
        v18.size = v18.size + 1;
        v18._map[v19] = true;
        table.insert(v18._array, v19);
    end;
    return v18;
end;
v10.clear = function(v20) --[[ Line: 109 ]] --[[ Name: clear ]]
    v20.size = 0;
    table.clear(v20._map);
    table.clear(v20._array);
end;
v10.delete = function(v21, v22) --[[ Line: 115 ]] --[[ Name: delete ]]
    if not v21._map[v22] then
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
v10.forEach = function(v24, v25, v26) --[[ Line: 131 ]] --[[ Name: forEach ]]
    -- upvalues: v4 (copy)
    if typeof(v25) ~= "function" then
        error("callback is not a function");
    end;
    v4(v24._array, function(v27) --[[ Line: 137 ]]
        -- upvalues: v26 (copy), v25 (copy), v24 (copy)
        if v26 ~= nil then
            v25(v26, v27, v27, v24);
            return;
        else
            v25(v27, v27, v24);
            return;
        end;
    end);
end;
v10.has = function(v28, v29) --[[ Line: 146 ]] --[[ Name: has ]]
    return v28._map[v29] ~= nil;
end;
v10.ipairs = function(v30) --[[ Line: 150 ]] --[[ Name: ipairs ]]
    if _G.__DEV__ then
        warn(debug.traceback("`for _,_ in mySet:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in mySet do` instead\n", 2));
    end;
    return ipairs(v30._array);
end;
return v10;