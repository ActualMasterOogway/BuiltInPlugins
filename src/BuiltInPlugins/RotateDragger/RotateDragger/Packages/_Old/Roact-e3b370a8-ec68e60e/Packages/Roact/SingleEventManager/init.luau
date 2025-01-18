local v0 = require(script.Parent.Logging);
local v1 = {
    Disabled = "Disabled", 
    Suspended = "Suspended", 
    Enabled = "Enabled"
};
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 23 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v2 (copy)
    return (setmetatable({
        _suspendedEventQueue = {}, 
        _connections = {}, 
        _listeners = {}, 
        _status = v1.Disabled, 
        _isResuming = false, 
        _instance = v3
    }, v2));
end;
v2.connectEvent = function(v4, v5, v6) --[[ Line: 51 ]] --[[ Name: connectEvent ]]
    v4:_connect(v5, v4._instance[v5], v6);
end;
v2.connectPropertyChange = function(v7, v8, v9) --[[ Line: 55 ]] --[[ Name: connectPropertyChange ]]
    local l_PropertyChangedSignal_0 = v7._instance:GetPropertyChangedSignal(v8);
    v7:_connect("Change." .. v8, l_PropertyChangedSignal_0, v9);
end;
v2._connect = function(v11, v12, v13, v14) --[[ Line: 60 ]] --[[ Name: _connect ]]
    -- upvalues: v1 (copy)
    if v14 == nil then
        if v11._connections[v12] ~= nil then
            v11._connections[v12]:Disconnect();
            v11._connections[v12] = nil;
        end;
        v11._listeners[v12] = nil;
        return;
    else
        if v11._connections[v12] == nil then
            v11._connections[v12] = v13:Connect(function(...) --[[ Line: 71 ]]
                -- upvalues: v11 (copy), v1 (ref), v12 (copy)
                if v11._status == v1.Enabled then
                    v11._listeners[v12](v11._instance, ...);
                    return;
                else
                    if v11._status == v1.Suspended then
                        local v15 = select("#", ...);
                        table.insert(v11._suspendedEventQueue, {
                            v12, 
                            v15, 
                            ...
                        });
                    end;
                    return;
                end;
            end);
        end;
        v11._listeners[v12] = v14;
        return;
    end;
end;
v2.suspend = function(v16) --[[ Line: 88 ]] --[[ Name: suspend ]]
    -- upvalues: v1 (copy)
    v16._status = v1.Suspended;
end;
v2.resume = function(v17) --[[ Line: 92 ]] --[[ Name: resume ]]
    -- upvalues: v0 (copy), v1 (copy)
    if v17._isResuming then
        return;
    else
        v17._isResuming = true;
        local v18 = 1;
        while v18 <= #v17._suspendedEventQueue do
            local v19 = v17._suspendedEventQueue[v18];
            local v20 = v17._listeners[v19[1]];
            local v21 = v19[2];
            if v20 ~= nil then
                local v22 = coroutine.create(v20);
                local v23, v24 = coroutine.resume(v22, v17._instance, unpack(v19, 3, 2 + v21));
                if not v23 then
                    v0.warn("%s", v24);
                end;
            end;
            v18 = v18 + 1;
        end;
        v17._isResuming = false;
        v17._status = v1.Enabled;
        v17._suspendedEventQueue = {};
        return;
    end;
end;
return v2;