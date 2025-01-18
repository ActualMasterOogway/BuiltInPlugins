local v0 = {};
v0.__index = v0;
local function v5(v1, v2) --[[ Line: 13 ]] --[[ Name: RemoveFromList ]]
    local v3 = {};
    for v4 = 1, #v1 do
        if v4 ~= v2 then
            table.insert(v3, v1[v4]);
        end;
    end;
    return v3;
end;
local function v11(v6, ...) --[[ Line: 25 ]] --[[ Name: Append ]]
    local v7 = {};
    local v8 = #v6;
    for v9 = 1, v8 do
        v7[v9] = v6[v9];
    end;
    for v10 = 1, select("#", ...) do
        v7[v8 + v10] = select(v10, ...);
    end;
    return v7;
end;
v0.new = function() --[[ Line: 40 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v12 = {
        _listeners = {}
    };
    setmetatable(v12, v0);
    return v12;
end;
v0.Connect = function(v13, v14) --[[ Line: 50 ]] --[[ Name: Connect ]]
    -- upvalues: v11 (copy), v5 (copy)
    local v15 = {
        callback = v14, 
        isConnected = true
    };
    v13._listeners = v11(v13._listeners, v15);
    return {
        Disconnect = function() --[[ Line: 57 ]] --[[ Name: disconnect ]]
            -- upvalues: v15 (copy), v13 (copy), v5 (ref)
            v15.isConnected = false;
            v13._listeners = v5(v13._listeners, v15);
        end
    };
end;
v0.Fire = function(v16, ...) --[[ Line: 67 ]] --[[ Name: Fire ]]
    for _, v18 in ipairs(v16._listeners) do
        if v18.isConnected then
            v18.callback(...);
        end;
    end;
end;
return v0;