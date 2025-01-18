local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_console_0 = require(l_Parent_0.Shared).console;
local v3 = require(script.Parent.events);
local _ = require(script.Parent.types);
local _ = require(script.Parent.backend.types);
local v6 = setmetatable({}, {
    __index = v3
});
local v7 = {
    __index = v6
};
v6.new = function(v8) --[[ Line: 225 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v7 (copy)
    local v9 = setmetatable(v3.new(), v7);
    v9._isShutdown = false;
    v9._messageQueue = {};
    v9._timeoutID = nil;
    v9._wallUnlisten = nil;
    v9._wall = v8;
    v9._wallUnlisten = v8.listen(function(v10) --[[ Line: 236 ]]
        -- upvalues: v9 (copy)
        v9:emit(v10.event, v10.payload);
    end) or nil;
    v9:addListener("overrideValueAtPath", v9.overrideValueAtPath);
    v9.wall = v8;
    return v9;
end;
v6.send = function(v11, v12, ...) --[[ Line: 251 ]] --[[ Name: send ]]
    -- upvalues: l_console_0 (copy), v1 (copy)
    local v13 = {
        ...
    };
    if v11._isShutdown then
        l_console_0.warn(string.format("Cannot send message \"%s\" through a Bridge that has been shutdown.", v12));
        return;
    else
        table.insert(v11._messageQueue, v12);
        table.insert(v11._messageQueue, v13);
        if not v11._timeoutID then
            v11._timeoutID = v1.setTimeout(function() --[[ Line: 275 ]]
                -- upvalues: v11 (copy)
                v11:_flush();
            end, 0);
        end;
        return;
    end;
end;
v6.shutdown = function(v14) --[[ Line: 281 ]] --[[ Name: shutdown ]]
    -- upvalues: l_console_0 (copy), v1 (copy)
    if v14._isShutdown then
        l_console_0.warn("Bridge was already shutdown.");
        return;
    else
        v14:send("shutdown");
        v14._isShutdown = true;
        v14.addListener = function() --[[ Line: 295 ]]

        end;
        v14.emit = function() --[[ Line: 297 ]]

        end;
        v14:removeAllListeners();
        local l__wallUnlisten_0 = v14._wallUnlisten;
        if l__wallUnlisten_0 then
            l__wallUnlisten_0();
        end;
        repeat
            v14:_flush();
        until #v14._messageQueue == 0;
        if v14._timeoutID ~= nil then
            v1.clearTimeout(v14._timeoutID);
            v14._timeoutID = nil;
        end;
        return;
    end;
end;
v6._flush = function(v16) --[[ Line: 324 ]] --[[ Name: _flush ]]
    -- upvalues: v1 (copy)
    if v16._timeoutID ~= nil then
        v1.clearTimeout(v16._timeoutID);
        v16._timeoutID = nil;
    end;
    if #v16._messageQueue > 0 then
        local v17 = 1;
        while v17 < #v16._messageQueue do
            v16._wall.send(v16._messageQueue[v17], table.unpack(v16._messageQueue[v17 + 1]));
            v17 = v17 + 2;
        end;
        table.clear(v16._messageQueue);
        v16._timeoutID = v1.setTimeout(function() --[[ Line: 349 ]]
            -- upvalues: v16 (copy)
            v16:_flush();
        end, 100);
    end;
end;
v6.overrideValueAtPath = function(v18, v19) --[[ Line: 357 ]] --[[ Name: overrideValueAtPath ]]
    local l_id_0 = v19.id;
    local l_path_0 = v19.path;
    local l_rendererID_0 = v19.rendererID;
    local l_type_0 = v19.type;
    local l_value_0 = v19.value;
    if l_type_0 == "context" then
        v18:send("overrideContext", {
            id = l_id_0, 
            path = l_path_0, 
            rendererID = l_rendererID_0, 
            wasForwarded = true, 
            value = l_value_0
        });
        return;
    elseif l_type_0 == "hooks" then
        v18:send("overrideHookState", {
            id = l_id_0, 
            path = l_path_0, 
            rendererID = l_rendererID_0, 
            wasForwarded = true, 
            value = l_value_0
        });
        return;
    elseif l_type_0 == "props" then
        v18:send("overrideProps", {
            id = l_id_0, 
            path = l_path_0, 
            rendererID = l_rendererID_0, 
            wasForwarded = true, 
            value = l_value_0
        });
        return;
    else
        if l_type_0 == "state" then
            v18:send("overrideState", {
                id = l_id_0, 
                path = l_path_0, 
                rendererID = l_rendererID_0, 
                wasForwarded = true, 
                value = l_value_0
            });
        end;
        return;
    end;
end;
return v6;