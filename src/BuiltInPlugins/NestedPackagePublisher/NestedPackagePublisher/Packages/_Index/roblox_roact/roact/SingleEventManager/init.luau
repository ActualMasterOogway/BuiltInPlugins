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
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 56 ]]
        -- upvalues: v7 (copy), v8 (copy)
        return v7._instance:GetPropertyChangedSignal(v8);
    end);
    if not l_status_0 then
        error(("Cannot get changed signal on property %q: %s"):format(tostring(v8), l_result_0), 0);
    end;
    v7:_connect("Change." .. v8, l_result_0, v9);
end;
v2._connect = function(v12, v13, v14, v15) --[[ Line: 70 ]] --[[ Name: _connect ]]
    -- upvalues: v1 (copy)
    if v15 == nil then
        if v12._connections[v13] ~= nil then
            v12._connections[v13]:Disconnect();
            v12._connections[v13] = nil;
        end;
        v12._listeners[v13] = nil;
        return;
    else
        if v12._connections[v13] == nil then
            v12._connections[v13] = v14:Connect(function(...) --[[ Line: 81 ]]
                -- upvalues: v12 (copy), v1 (ref), v13 (copy)
                if v12._status == v1.Enabled then
                    v12._listeners[v13](v12._instance, ...);
                    return;
                else
                    if v12._status == v1.Suspended then
                        local v16 = select("#", ...);
                        table.insert(v12._suspendedEventQueue, {
                            v13, 
                            v16, 
                            ...
                        });
                    end;
                    return;
                end;
            end);
        end;
        v12._listeners[v13] = v15;
        return;
    end;
end;
v2.suspend = function(v17) --[[ Line: 98 ]] --[[ Name: suspend ]]
    -- upvalues: v1 (copy)
    v17._status = v1.Suspended;
end;
v2.resume = function(v18) --[[ Line: 102 ]] --[[ Name: resume ]]
    -- upvalues: v0 (copy), v1 (copy)
    if v18._isResuming then
        return;
    else
        v18._isResuming = true;
        local v19 = 1;
        while v19 <= #v18._suspendedEventQueue do
            local v20 = v18._suspendedEventQueue[v19];
            local v21 = v18._listeners[v20[1]];
            local v22 = v20[2];
            if v21 ~= nil then
                local v23 = coroutine.create(v21);
                local v24, v25 = coroutine.resume(v23, v18._instance, unpack(v20, 3, 2 + v22));
                if not v24 then
                    v0.warn("%s", v25);
                end;
            end;
            v19 = v19 + 1;
        end;
        v18._isResuming = false;
        v18._status = v1.Enabled;
        v18._suspendedEventQueue = {};
        return;
    end;
end;
return v2;