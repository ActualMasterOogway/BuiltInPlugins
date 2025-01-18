local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        eventCount = 0, 
        lastEvent = nil, 
        _clientId = "", 
        _sessionId = ""
    }, v0));
end;
v0.Destroy = function(_) --[[ Line: 16 ]] --[[ Name: Destroy ]]

end;
v0.GetClientId = function(v2) --[[ Line: 18 ]] --[[ Name: GetClientId ]]
    return v2._clientId;
end;
v0.GetSessionId = function(v3) --[[ Line: 22 ]] --[[ Name: GetSessionId ]]
    return v3._sessionId;
end;
v0.SendEventDeferred = function(v4, v5, v6, v7, v8) --[[ Line: 26 ]] --[[ Name: SendEventDeferred ]]
    local v9 = {
        target = v5, 
        ctx = v6, 
        evt = v7
    };
    assert(type(v8) == "table", "expected table, argsTable was " .. type(v8));
    for v10, v11 in pairs(v8) do
        if v9[v10] ~= nil then
            warn("Overriding base keyword " .. v10 .. " in via argsTable in SendEventDeferred().");
        end;
        v9[v10] = v11;
    end;
    v4.lastEvent = v9;
    v4.eventCount = v4.eventCount + 1;
end;
return v0;