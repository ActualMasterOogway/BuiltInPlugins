local v0 = require(script.Parent.Parent.Cryo);
local v1 = require(script.Parent.NavigationEvents);
local v2 = require(script.Parent.utils.createSubscriberEventsStateTable);
local v3 = require(script.Parent.utils.validate);
return function(v4, v5, v6) --[[ Line: 15 ]]
    -- upvalues: v1 (copy), v0 (copy), v2 (copy), v3 (copy)
    v6 = v6 or "Blurred";
    local v7 = {};
    local v8 = {
        [v1.Action] = {}, 
        [v1.WillFocus] = {}, 
        [v1.DidFocus] = {}, 
        [v1.WillBlur] = {}, 
        [v1.DidBlur] = {}, 
        [v1.Refocus] = {}
    };
    local function v15(v9, v10) --[[ Line: 29 ]] --[[ Name: emit ]]
        -- upvalues: v0 (ref), v8 (copy)
        local v11 = v0.Dictionary.join(v10 or {}, {
            type = v9
        });
        local v12 = v8[v9];
        if v12 then
            for _, v14 in ipairs(v12) do
                v14(v11);
            end;
        end;
    end;
    local v21 = v2(v5, v6, v15, function() --[[ Line: 39 ]] --[[ Name: disconnectAll ]]
        -- upvalues: v8 (copy), v7 (copy)
        for _, v17 in pairs(v8) do
            for v18 in pairs(v17) do
                v17[v18] = nil;
            end;
        end;
        for _, v20 in pairs(v7) do
            if v20 then
                v20.disconnect();
            end;
        end;
    end);
    for v22 in pairs(v8) do
        v7[v22] = v4(v22, function(v23) --[[ Line: 60 ]]
            -- upvalues: v22 (copy), v1 (ref), v21 (copy), v5 (copy)
            if v22 == v1.Refocus then
                v21:handleEvent(tostring(v1.Refocus), v23);
                return;
            else
                local l_state_0 = v23.state;
                local l_lastState_0 = v23.lastState;
                local l_action_0 = v23.action;
                local v27 = l_state_0 and l_state_0.routes;
                local v28 = l_lastState_0 and l_lastState_0.routes;
                local v29 = (v27 and v27[l_state_0.index].key or nil) == v5;
                local v30 = l_state_0 and l_state_0.isTransitioning or false;
                local v31 = nil;
                if v28 then
                    for _, v33 in ipairs(v28) do
                        if v33.key == v5 then
                            v31 = v33;
                            break;
                        end;
                    end;
                end;
                local v34 = nil;
                if v27 then
                    for _, v36 in ipairs(v27) do
                        if v36.key == v5 then
                            v34 = v36;
                            break;
                        end;
                    end;
                end;
                local v37 = {
                    context = string.format("%s:%s_%s", v5, tostring(l_action_0.type), v23.context or "Root"), 
                    state = v34, 
                    lastState = v31, 
                    action = l_action_0, 
                    type = v22
                };
                local v38 = v29 and "A" or "";
                local v39 = v30 and "T" or "";
                local v40 = tostring(v22) .. v38 .. v39;
                v21:handleEvent(v40, v37);
                if not v34 then
                    v21.events.shutdown();
                end;
                return;
            end;
        end);
    end;
    return {
        addListener = function(v41, v42) --[[ Line: 125 ]] --[[ Name: addListener ]]
            -- upvalues: v8 (copy), v3 (ref)
            local v43 = v8[v41];
            v3(v43 ~= nil, "Invalid event type '%s'", (tostring(v41)));
            v3(type(v42) == "function", "eventHandler for '%s' must be a function", (tostring(v41)));
            table.insert(v43, v42);
            return {
                disconnect = function() --[[ Line: 132 ]] --[[ Name: disconnect ]]
                    -- upvalues: v43 (copy), v42 (copy)
                    for v44, v45 in ipairs(v43) do
                        if v45 == v42 then
                            table.remove(v43, v44);
                            return;
                        end;
                    end;
                end
            };
        end, 
        emit = function(v46, v47) --[[ Line: 142 ]] --[[ Name: emit ]]
            -- upvalues: v3 (ref), v1 (ref), v15 (copy)
            v3(v46 == v1.Refocus, "navigation.emit only supports NavigationEvents.Refocus currently.");
            local l_v3_0 = v3;
            local v49 = true;
            if v47 ~= nil then
                v49 = type(v47) == "table";
            end;
            l_v3_0(v49, "navigation.emit payloads must be a table or nil");
            v15(v46, v47);
        end
    };
end;