local _ = script.Parent.Parent;
local function v7(v1, ...) --[[ Line: 15 ]] --[[ Name: RemoveFromDictionary ]]
    local v2 = {};
    for v3, v4 in pairs(v1) do
        local v5 = false;
        for v6 = 1, select("#", ...) do
            if v3 == select(v6, ...) then
                v5 = true;
                break;
            end;
        end;
        if not v5 then
            v2[v3] = v4;
        end;
    end;
    return v2;
end;
local function v13(v8, ...) --[[ Line: 34 ]] --[[ Name: Append ]]
    local v9 = {};
    local v10 = #v8;
    for v11 = 1, v10 do
        v9[v11] = v8[v11];
    end;
    for v12 = 1, select("#", ...) do
        v9[v10 + v12] = select(v12, ...);
    end;
    return v9;
end;
local v14 = {};
v14.__index = v14;
v14.new = function() --[[ Line: 53 ]] --[[ Name: new ]]
    -- upvalues: v14 (copy)
    local v15 = {
        _listeners = {}
    };
    setmetatable(v15, v14);
    return v15;
end;
v14.Connect = function(v16, v17) --[[ Line: 63 ]] --[[ Name: Connect ]]
    -- upvalues: v13 (copy), v7 (copy)
    local v18 = {
        callback = v17, 
        isConnected = true
    };
    v16._listeners = v13(v16._listeners, v18);
    return {
        Disconnect = function() --[[ Line: 70 ]] --[[ Name: disconnect ]]
            -- upvalues: v18 (copy), v16 (copy), v7 (ref)
            v18.isConnected = false;
            v16._listeners = v7(v16._listeners, v18);
        end
    };
end;
v14.Fire = function(v19, ...) --[[ Line: 80 ]] --[[ Name: Fire ]]
    for _, v21 in ipairs(v19._listeners) do
        if v21.isConnected then
            v21.callback(...);
        end;
    end;
end;
return v14;