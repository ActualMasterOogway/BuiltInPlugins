local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Signal);
local v2 = require(script.Parent.NoYield);
local v3 = {
    _flushEvent = l_RunService_0.Heartbeat
};
v3.__index = v3;
v3.new = function(v4, v5, v6) --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v3 (copy)
    assert(typeof(v4) == "function", "Bad argument #1 to Store.new, expected function.");
    local v7 = true;
    if v6 ~= nil then
        v7 = typeof(v6) == "table";
    end;
    assert(v7, "Bad argument #3 to Store.new, expected nil or table.");
    local v8 = {
        _reducer = v4, 
        _state = v4(v5, {
            type = "@@INIT"
        })
    };
    v8._lastState = v8._state;
    v8._mutatedSinceFlush = false;
    v8._connections = {};
    v8.changed = v1.new();
    setmetatable(v8, v3);
    v7 = v8._flushEvent:Connect(function() --[[ Line: 45 ]]
        -- upvalues: v8 (copy)
        v8:flush();
    end);
    table.insert(v8._connections, v7);
    if v6 then
        local l_dispatch_0 = v8.dispatch;
        local function v10(...) --[[ Line: 52 ]]
            -- upvalues: l_dispatch_0 (copy), v8 (copy)
            return l_dispatch_0(v8, ...);
        end;
        for v11 = #v6, 1, -1 do
            v10 = v6[v11](v10, v8);
        end;
        do
            local l_v10_0 = v10;
            v8.dispatch = function(_, ...) --[[ Line: 61 ]]
                -- upvalues: l_v10_0 (ref)
                return l_v10_0(...);
            end;
        end;
    end;
    return v8;
end;
v3.getState = function(v14) --[[ Line: 72 ]] --[[ Name: getState ]]
    return v14._state;
end;
v3.dispatch = function(v15, v16) --[[ Line: 83 ]] --[[ Name: dispatch ]]
    if typeof(v16) == "table" then
        if v16.type == nil then
            error("action does not have a type field", 2);
        end;
        v15._state = v15._reducer(v15._state, v16);
        v15._mutatedSinceFlush = true;
        return;
    else
        error(("actions of type %q are not permitted"):format((typeof(v16))), 2);
        return;
    end;
end;
v3.destruct = function(v17) --[[ Line: 99 ]] --[[ Name: destruct ]]
    for _, v19 in ipairs(v17._connections) do
        v19:Disconnect();
    end;
    v17._connections = nil;
end;
v3.flush = function(v20) --[[ Line: 110 ]] --[[ Name: flush ]]
    -- upvalues: v2 (copy)
    if not v20._mutatedSinceFlush then
        return;
    else
        v20._mutatedSinceFlush = false;
        local l__state_0 = v20._state;
        v2(function() --[[ Line: 124 ]]
            -- upvalues: v20 (copy), l__state_0 (copy)
            v20.changed:fire(l__state_0, v20._lastState);
        end);
        v20._lastState = l__state_0;
        return;
    end;
end;
return v3;