local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Flags.getFFlagDraggerShouldBufferSelectionSignals);
local v2 = {};
v2.__index = v2;
v2.Connect = function(v3, v4) --[[ Line: 12 ]] --[[ Name: Connect ]]
    local v5 = nil;
    local v6 = nil;
    v5 = v3._signal:Connect(function(...) --[[ Line: 15 ]]
        -- upvalues: v3 (copy), v6 (ref)
        local v7 = os.clock();
        if v3:_isBuffered() or v7 - v3._lastCalled < v3._delaySeconds then
            v3:_bufferCall(v6, v7, ...);
            return;
        else
            v3:_fireNow(v6, ...);
            return;
        end;
    end);
    local v8 = nil;
    v8 = {
        Disconnect = function() --[[ Line: 28 ]] --[[ Name: Disconnect ]]
            -- upvalues: v8 (ref), v5 (ref)
            v8.Connected = false;
            v5:Disconnect();
        end, 
        Connected = true
    };
    v6 = {
        callback = v4, 
        connection = v8
    };
    return v8;
end;
v2._bufferCall = function(v9, v10, v11, ...) --[[ Line: 44 ]] --[[ Name: _bufferCall ]]
    v9._lastArguments = table.pack(...);
    if v9:_isBuffered() then
        return;
    else
        local v12 = v9._delaySeconds - (v11 - v9._lastCalled);
        local v13 = false;
        if v12 > 0 then
            v13 = v12 < v9._delaySeconds;
        end;
        assert(v13, (("timeToWait (%*) was out of range (must be under %*)"):format(v12, v9._delaySeconds)));
        local v14 = false;
        v9._flush = function() --[[ Line: 59 ]]
            -- upvalues: v14 (ref), v10 (copy), v9 (copy)
            if v14 then
                return;
            else
                v14 = true;
                if not v10.connection.Connected then
                    return;
                else
                    assert(v9._lastArguments ~= nil, "_lastArguments not set after delay, another buffer must have overridden it");
                    local l__lastArguments_0 = v9._lastArguments;
                    v9._lastArguments = nil;
                    v9:_fireNow(v10, table.unpack(l__lastArguments_0));
                    return;
                end;
            end;
        end;
        task.delay(v12, function() --[[ Line: 78 ]]
            -- upvalues: v14 (ref), v9 (copy)
            if v14 then
                return;
            else
                v9:flush();
                return;
            end;
        end);
        return;
    end;
end;
v2._fireNow = function(v16, v17, ...) --[[ Line: 87 ]] --[[ Name: _fireNow ]]
    v16._lastCalled = os.clock();
    debug.profilebegin(v16._profileLabel);
    v17.callback(...);
    debug.profileend();
end;
v2._isBuffered = function(v18) --[[ Line: 100 ]] --[[ Name: _isBuffered ]]
    return v18._flush ~= nil;
end;
v2.flush = function(v19) --[[ Line: 104 ]] --[[ Name: flush ]]
    if not v19:_isBuffered() then
        return;
    else
        assert(v19._flush ~= nil, "Buffering assumes a flush is set");
        task.spawn(v19._flush);
        v19._flush = nil;
        return;
    end;
end;
v2.new = function(v20, v21) --[[ Line: 114 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v2 (copy)
    assert(v1());
    return (setmetatable({
        _delaySeconds = v21, 
        _signal = v20, 
        _flush = nil, 
        _lastArguments = nil, 
        _lastCalled = 0, 
        _profileLabel = ("BufferedSignal(%*)"):format(v20)
    }, v2));
end;
return v2;