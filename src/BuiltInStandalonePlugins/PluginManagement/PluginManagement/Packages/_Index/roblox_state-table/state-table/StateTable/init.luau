local v0 = {};
v0.__index = v0;
local function _(v1, v2) --[[ Line: 5 ]] --[[ Name: validateStateTableItem ]]
    local v3 = typeof(v1);
    local v4 = true;
    if v3 ~= "string" then
        v4 = v3 == "userdata";
    end;
    assert(v4, string.format("%s '%s' must be a string or userdata but is a %s", v2, tostring(v1), v3));
end;
v0.new = function(v6, v7, v8, v9) --[[ Line: 68 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    assert(typeof(v6) == "string", "name must be a string");
    assert(#v6 > 0, "name must not be an empty string");
    local v10 = typeof(v7);
    local v11 = true;
    if v10 ~= "string" then
        v11 = v10 == "userdata";
    end;
    assert(v11, string.format("%s '%s' must be a string or userdata but is a %s", "initialState", tostring(v7), v10));
    v11 = true;
    if v8 ~= nil then
        v11 = typeof(v8) == "table";
    end;
    assert(v11, "initialContext must be a table or nil");
    assert(typeof(v9) == "table", "transitionTable must be a table");
    assert(typeof(v9[v7]) == "table", "initialState must be present in transitionTable");
    v10 = {};
    setmetatable(v10, v0);
    v10.name = v6;
    v10.currentState = v7;
    v10.currentContext = v8 or {};
    v10.transitionTable = {};
    v10.events = {};
    for v12, v13 in pairs(v9) do
        local v14 = typeof(v12);
        local v15 = true;
        if v14 ~= "string" then
            v15 = v14 == "userdata";
        end;
        assert(v15, string.format("%s '%s' must be a string or userdata but is a %s", "state", tostring(v12), v14));
        assert(typeof(v13) == "table", string.format("state '%s' must map to a table", (tostring(v12))));
        v14 = {};
        for v16, v17 in pairs(v13) do
            local v18 = typeof(v16);
            local v19 = true;
            if v18 ~= "string" then
                v19 = v18 == "userdata";
            end;
            assert(v19, string.format("%s '%s' must be a string or userdata but is a %s", "event", tostring(v16), v18));
            assert(typeof(v17) == "table", string.format("event '%s' must map to a table", (tostring(v16))));
            v18 = v17.nextState;
            v19 = v17.action;
            if v18 ~= nil then
                local v20 = typeof(v18);
                local v21 = true;
                if v20 ~= "string" then
                    v21 = v20 == "userdata";
                end;
                assert(v21, string.format("%s '%s' must be a string or userdata but is a %s", "nextState", tostring(v18), v20));
                assert(v9[v18] ~= nil, string.format("nextState '%s' does not exist in transitionTable", (tostring(v18))));
            end;
            local v22 = true;
            if v19 ~= nil then
                v22 = typeof(v19) == "function";
            end;
            assert(v22, "action must be a function");
            v14[v16] = v17;
            if v10.events[v16] == nil then
                v10.events[v16] = function(v23) --[[ Line: 113 ]]
                    -- upvalues: v10 (copy), v16 (copy)
                    return v10:handleEvent(v16, v23);
                end;
            end;
        end;
        v10.transitionTable[v12] = v14;
    end;
    setmetatable(v10.events, {
        __index = function(_, v25) --[[ Line: 124 ]] --[[ Name: __index ]]
            -- upvalues: v10 (copy)
            error(string.format("'%s' is not a valid event in StateTable '%s'", tostring(v25), v10.name), 2);
        end
    });
    return v10;
end;
v0.handleEvent = function(v26, v27, v28) --[[ Line: 145 ]] --[[ Name: handleEvent ]]
    local v29 = typeof(v27);
    local v30 = true;
    if v29 ~= "string" then
        v30 = v29 == "userdata";
    end;
    assert(v30, string.format("%s '%s' must be a string or userdata but is a %s", "event", tostring(v27), v29));
    v30 = true;
    if v28 ~= nil then
        v30 = typeof(v28) == "table";
    end;
    assert(v30, "args must be nil or valid table");
    v29 = v26.currentState;
    v30 = v26.transitionTable[v29];
    assert(v30 ~= nil, "no transition events for current state");
    if v30[v27] ~= nil then
        local v31 = v30[v27];
        local v32 = v31.nextState or v29;
        local l_action_0 = v31.action;
        local l_currentContext_0 = v26.currentContext;
        if l_action_0 ~= nil then
            local v35 = l_action_0(v29, v32, v28, v26.currentContext) or {};
            l_currentContext_0 = {};
            for v36, v37 in pairs(v26.currentContext) do
                l_currentContext_0[v36] = v37;
            end;
            for v38, v39 in pairs(v35) do
                l_currentContext_0[v38] = v39;
            end;
            v26.currentContext = l_currentContext_0;
        end;
        v26.currentState = v32;
        if v26.stateChangeHandler ~= nil then
            v26.stateChangeHandler(v29, v32, l_currentContext_0);
        end;
    end;
end;
v0.onStateChange = function(v40, v41) --[[ Line: 196 ]] --[[ Name: onStateChange ]]
    local v42 = true;
    if v41 ~= nil then
        v42 = typeof(v41) == "function";
    end;
    assert(v42, "stateChangeHandler must be nil or a function");
    v40.stateChangeHandler = v41;
end;
return v0;