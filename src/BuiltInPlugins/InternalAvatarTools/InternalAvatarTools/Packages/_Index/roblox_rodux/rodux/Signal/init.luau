local function v5(v0, ...) --[[ Line: 8 ]] --[[ Name: immutableAppend ]]
    local v1 = {};
    local v2 = #v0;
    for v3 = 1, v2 do
        v1[v3] = v0[v3];
    end;
    for v4 = 1, select("#", ...) do
        v1[v2 + v4] = select(v4, ...);
    end;
    return v1;
end;
local function v10(v6, v7) --[[ Line: 23 ]] --[[ Name: immutableRemoveValue ]]
    local v8 = {};
    for v9 = 1, #v6 do
        if v6[v9] ~= v7 then
            table.insert(v8, v6[v9]);
        end;
    end;
    return v8;
end;
local v11 = {};
v11.__index = v11;
v11.new = function() --[[ Line: 39 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy)
    local v12 = {
        _listeners = {}
    };
    setmetatable(v12, v11);
    return v12;
end;
v11.connect = function(v13, v14) --[[ Line: 49 ]] --[[ Name: connect ]]
    -- upvalues: v5 (copy), v10 (copy)
    local v15 = {
        callback = v14, 
        disconnected = false
    };
    v13._listeners = v5(v13._listeners, v15);
    return {
        disconnect = function() --[[ Line: 57 ]] --[[ Name: disconnect ]]
            -- upvalues: v15 (copy), v13 (copy), v10 (ref)
            v15.disconnected = true;
            v13._listeners = v10(v13._listeners, v15);
        end
    };
end;
v11.fire = function(v16, ...) --[[ Line: 67 ]] --[[ Name: fire ]]
    for _, v18 in ipairs(v16._listeners) do
        if not v18.disconnected then
            v18.callback(...);
        end;
    end;
end;
return v11;