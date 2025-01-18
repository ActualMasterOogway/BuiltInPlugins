local v0 = {};
v0.__index = v0;
v0.new = function(v1) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        __running = false, 
        __finished = false, 
        __success = nil, 
        __results = nil, 
        __callback = v1, 
        __event = Instance.new("BindableEvent")
    }, v0));
end;
v0.start = function(v2, ...) --[[ Line: 17 ]] --[[ Name: start ]]
    if v2.__running or v2.__finished then
        return;
    else
        v2.__running = true;
        local v3 = {
            ...
        };
        coroutine.wrap(function() --[[ Line: 24 ]]
            -- upvalues: v2 (copy), v3 (copy)
            local v4 = {
                pcall(v2.__callback, unpack(v3))
            };
            v2.__success = v4[1];
            v2.__results = table.move(v4, 2, #v4, 1, {});
            v2.__running = false;
            v2.__finished = true;
            v2.__event:Fire();
        end)();
        if v2.__finished and not v2.__success then
            error(v2.__results[1], 2);
        end;
        return;
    end;
end;
v0.join = function(v5) --[[ Line: 39 ]] --[[ Name: join ]]
    if not v5.__finished and not v5.__running then
        error("Attempt to join on unstarted thread", 2);
    end;
    if not v5.__finished then
        v5.__event.Event:Wait();
    end;
    if v5.__success then
        return unpack(v5.__results);
    else
        error(v5.__results[1], 2);
        return;
    end;
end;
v0.isAlive = function(v6) --[[ Line: 54 ]] --[[ Name: isAlive ]]
    return v6.__running;
end;
return v0;