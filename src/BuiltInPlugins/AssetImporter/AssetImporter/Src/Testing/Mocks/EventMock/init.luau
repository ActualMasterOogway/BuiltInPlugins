local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v3 = setmetatable({}, v0);
    v3.lambda = v1;
    v3.removeConnection = v2;
    return v3;
end;
v0._fire = function(v4, ...) --[[ Line: 35 ]] --[[ Name: _fire ]]
    v4.lambda(...);
end;
v0.Disconnect = function(v5) --[[ Line: 39 ]] --[[ Name: Disconnect ]]
    v5:removeConnection();
    v5.lambda = nil;
    v5.removeConnection = nil;
end;
local v6 = {};
v6.__index = v6;
v6.new = function() --[[ Line: 49 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    local v7 = setmetatable({}, v6);
    v7.connections = {};
    return v7;
end;
v6.Connect = function(v8, v9) --[[ Line: 57 ]] --[[ Name: Connect ]]
    -- upvalues: v0 (copy)
    local v11 = v0.new(v9, function(v10) --[[ Line: 58 ]]
        -- upvalues: v8 (copy)
        v8:_remove(v10);
    end);
    v8.connections[v11] = true;
    return v11;
end;
v6.Fire = function(v12, ...) --[[ Line: 65 ]] --[[ Name: Fire ]]
    for v13, _ in pairs(v12.connections) do
        v13:_fire(...);
    end;
end;
v6._remove = function(v15, v16) --[[ Line: 71 ]] --[[ Name: _remove ]]
    if v15.connections[v16] ~= nil then
        v15.connections[v16] = nil;
    end;
end;
v6.Destroy = function(v17) --[[ Line: 77 ]] --[[ Name: Destroy ]]
    for v18, _ in pairs(v17.connections) do
        v18:Disconnect();
    end;
    v17.connections = {};
end;
return v6;