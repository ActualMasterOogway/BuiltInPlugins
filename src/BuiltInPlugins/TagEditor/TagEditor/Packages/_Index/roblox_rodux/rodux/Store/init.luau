local l_RunService_0 = game:GetService("RunService");
local v1 = require(script.Parent.Signal);
local v2 = require(script.Parent.NoYield);
local v10 = {
    reportReducerError = function(_, _, v5) --[[ Line: 9 ]] --[[ Name: reportReducerError ]]
        error(string.format("Received error: %s\n\n%s", v5.message, v5.thrownValue));
    end, 
    reportUpdateError = function(_, _, _, v9) --[[ Line: 12 ]] --[[ Name: reportUpdateError ]]
        error(string.format("Received error: %s\n\n%s", v9.message, v9.thrownValue));
    end
};
local function v12(v11) --[[ Line: 17 ]] --[[ Name: tracebackReporter ]]
    return debug.traceback((tostring(v11)));
end;
local v13 = {
    _flushEvent = l_RunService_0.Heartbeat
};
v13.__index = v13;
v13.new = function(v14, v15, v16, v17) --[[ Line: 41 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy), v12 (copy), v1 (copy), v13 (copy)
    assert(typeof(v14) == "function", "Bad argument #1 to Store.new, expected function.");
    local v18 = true;
    if v16 ~= nil then
        v18 = typeof(v16) == "table";
    end;
    assert(v18, "Bad argument #3 to Store.new, expected nil or table.");
    if v16 ~= nil then
        for v19 = 1, #v16 do
            assert(typeof(v16[v19]) == "function", ("Expected the middleware ('%s') at index %d to be a function."):format(tostring(v16[v19]), v19));
        end;
    end;
    local v20 = {
        _errorReporter = v17 or v10, 
        _isDispatching = false, 
        _reducer = v14
    };
    v18 = {
        type = "@@INIT"
    };
    v20._actionLog = {
        v18
    };
    local v21, v22 = xpcall(function() --[[ Line: 62 ]]
        -- upvalues: v20 (copy), v14 (copy), v15 (copy), v18 (copy)
        v20._state = v14(v15, v18);
    end, v12);
    if not v21 then
        v20._errorReporter.reportReducerError(v15, v18, {
            message = "Caught error in reducer with init", 
            thrownValue = v22
        });
        v20._state = v15;
    end;
    v20._lastState = v20._state;
    v20._mutatedSinceFlush = false;
    v20._connections = {};
    v20.changed = v1.new(v20);
    setmetatable(v20, v13);
    local v23 = v20._flushEvent:Connect(function() --[[ Line: 81 ]]
        -- upvalues: v20 (copy)
        v20:flush();
    end);
    table.insert(v20._connections, v23);
    if v16 then
        local l_dispatch_0 = v20.dispatch;
        local function v25(...) --[[ Line: 88 ]]
            -- upvalues: l_dispatch_0 (copy), v20 (copy)
            return l_dispatch_0(v20, ...);
        end;
        for v26 = #v16, 1, -1 do
            v25 = v16[v26](v25, v20);
        end;
        do
            local l_v25_0 = v25;
            v20.dispatch = function(_, ...) --[[ Line: 97 ]]
                -- upvalues: l_v25_0 (ref)
                return l_v25_0(...);
            end;
        end;
    end;
    return v20;
end;
v13.getState = function(v29) --[[ Line: 108 ]] --[[ Name: getState ]]
    if v29._isDispatching then
        error(("You may not call store:getState() while the reducer is executing. " .. "The reducer (%s) has already received the state as an argument. " .. "Pass it down from the top reducer instead of reading it from the store."):format((tostring(v29._reducer))));
    end;
    return v29._state;
end;
v13.dispatch = function(v30, v31) --[[ Line: 125 ]] --[[ Name: dispatch ]]
    if typeof(v31) ~= "table" then
        error(("Actions must be tables. " .. "Use custom middleware for %q actions."):format((typeof(v31))), 2);
    end;
    if v31.type == nil then
        error("Actions may not have an undefined 'type' property. " .. "Have you misspelled a constant? \n" .. tostring(v31), 2);
    end;
    if v30._isDispatching then
        error("Reducers may not dispatch actions.");
    end;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 143 ]]
        -- upvalues: v30 (copy), v31 (copy)
        v30._isDispatching = true;
        v30._state = v30._reducer(v30._state, v31);
        v30._mutatedSinceFlush = true;
    end);
    v30._isDispatching = false;
    if not l_status_0 then
        v30._errorReporter.reportReducerError(v30._state, v31, {
            message = "Caught error in reducer", 
            thrownValue = l_result_0
        });
    end;
    if #v30._actionLog == 3 then
        table.remove(v30._actionLog, 1);
    end;
    table.insert(v30._actionLog, v31);
end;
v13.destruct = function(v34) --[[ Line: 171 ]] --[[ Name: destruct ]]
    for _, v36 in ipairs(v34._connections) do
        v36:Disconnect();
    end;
    v34._connections = nil;
end;
v13.flush = function(v37) --[[ Line: 182 ]] --[[ Name: flush ]]
    -- upvalues: v2 (copy), v12 (copy)
    if not v37._mutatedSinceFlush then
        return;
    else
        v37._mutatedSinceFlush = false;
        local l__state_0 = v37._state;
        local v39, v40 = xpcall(function() --[[ Line: 194 ]]
            -- upvalues: v2 (ref), v37 (copy), l__state_0 (copy)
            v2(function() --[[ Line: 197 ]]
                -- upvalues: v37 (ref), l__state_0 (ref)
                v37.changed:fire(l__state_0, v37._lastState);
            end);
        end, v12);
        if not v39 then
            v37._errorReporter.reportUpdateError(v37._lastState, l__state_0, v37._actionLog, {
                message = "Caught error flushing store updates", 
                thrownValue = v40
            });
        end;
        v37._lastState = l__state_0;
        return;
    end;
end;
return v13;