local v0 = nil;
local function v3(v1, ...) --[[ Line: 35 ]] --[[ Name: acquireRunnerThreadAndCallEventHandler ]]
    -- upvalues: v0 (ref)
    local l_v0_0 = v0;
    v0 = nil;
    v1(...);
    v0 = l_v0_0;
end;
local function v4() --[[ Line: 46 ]] --[[ Name: runEventHandlerInFreeThread ]]
    -- upvalues: v3 (copy)
    while true do
        v3(coroutine.yield());
    end;
end;
local v5 = {};
v5.__index = v5;
v5.new = function(v6, v7) --[[ Line: 61 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy)
    return (setmetatable({
        _connected = true, 
        _signal = v6, 
        _fn = v7, 
        _next = false
    }, v5));
end;
v5.Disconnect = function(v8) --[[ Line: 70 ]] --[[ Name: Disconnect ]]
    v8._connected = false;
    if v8._signal._handlerListHead == v8 then
        v8._signal._handlerListHead = v8._next;
        return;
    else
        local l__handlerListHead_0 = v8._signal._handlerListHead;
        while l__handlerListHead_0 and l__handlerListHead_0._next ~= v8 do
            l__handlerListHead_0 = l__handlerListHead_0._next;
        end;
        if l__handlerListHead_0 then
            l__handlerListHead_0._next = v8._next;
        end;
        return;
    end;
end;
setmetatable(v5, {
    __index = function(_, v11) --[[ Line: 92 ]] --[[ Name: __index ]]
        error(("Attempt to get Connection::%s (not a valid member)"):format((tostring(v11))), 2);
    end, 
    __newindex = function(_, v13) --[[ Line: 95 ]] --[[ Name: __newindex ]]
        error(("Attempt to set Connection::%s (not a valid member)"):format((tostring(v13))), 2);
    end
});
local v14 = {};
v14.__index = v14;
v14.new = function() --[[ Line: 115 ]] --[[ Name: new ]]
    -- upvalues: v14 (copy)
    return (setmetatable({
        _handlerListHead = false
    }, v14));
end;
v14.Connect = function(v15, v16) --[[ Line: 121 ]] --[[ Name: Connect ]]
    -- upvalues: v5 (copy)
    local v17 = v5.new(v15, v16);
    if v15._handlerListHead then
        v17._next = v15._handlerListHead;
        v15._handlerListHead = v17;
        return v17;
    else
        v15._handlerListHead = v17;
        return v17;
    end;
end;
v14.DisconnectAll = function(v18) --[[ Line: 134 ]] --[[ Name: DisconnectAll ]]
    v18._handlerListHead = false;
end;
v14.Fire = function(v19, ...) --[[ Line: 142 ]] --[[ Name: Fire ]]
    -- upvalues: v0 (ref), v4 (copy)
    local l__handlerListHead_1 = v19._handlerListHead;
    while l__handlerListHead_1 do
        if l__handlerListHead_1._connected then
            if not v0 then
                v0 = coroutine.create(v4);
                coroutine.resume(v0);
            end;
            task.spawn(v0, l__handlerListHead_1._fn, ...);
        end;
        l__handlerListHead_1 = l__handlerListHead_1._next;
    end;
end;
v14.Wait = function(v21) --[[ Line: 159 ]] --[[ Name: Wait ]]
    local v22 = coroutine.running();
    local v23 = nil;
    v23 = v21:Connect(function(...) --[[ Line: 162 ]]
        -- upvalues: v23 (ref), v22 (copy)
        v23:Disconnect();
        task.spawn(v22, ...);
    end);
    return coroutine.yield();
end;
v14.Once = function(v24, v25) --[[ Line: 171 ]] --[[ Name: Once ]]
    local v26 = nil;
    v26 = v24:Connect(function(...) --[[ Line: 173 ]]
        -- upvalues: v26 (ref), v25 (copy)
        if v26._connected then
            v26:Disconnect();
        end;
        v25(...);
    end);
    return v26;
end;
setmetatable(v14, {
    __index = function(_, v28) --[[ Line: 184 ]] --[[ Name: __index ]]
        error(("Attempt to get Signal::%s (not a valid member)"):format((tostring(v28))), 2);
    end, 
    __newindex = function(_, v30) --[[ Line: 187 ]] --[[ Name: __newindex ]]
        error(("Attempt to set Signal::%s (not a valid member)"):format((tostring(v30))), 2);
    end
});
return v14;