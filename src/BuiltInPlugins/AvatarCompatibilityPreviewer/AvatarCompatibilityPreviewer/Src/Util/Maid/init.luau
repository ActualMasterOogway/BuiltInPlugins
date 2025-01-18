local v0 = {};
v0.new = function() --[[ Line: 45 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _tasks = {}
    }, v0));
end;
v0.isMaid = function(v1) --[[ Line: 62 ]] --[[ Name: isMaid ]]
    local v2 = false;
    if type(v1) == "table" then
        v2 = v1.ClassName == "Maid";
    end;
    return v2;
end;
v0.__index = function(v3, v4) --[[ Line: 81 ]] --[[ Name: __index ]]
    -- upvalues: v0 (copy)
    if v0[v4] then
        return v0[v4];
    else
        return v3._tasks[v4];
    end;
end;
v0.__newindex = function(v5, v6, v7) --[[ Line: 108 ]] --[[ Name: __newindex ]]
    -- upvalues: v0 (copy)
    if v0[v6] ~= nil then
        error(string.format("Cannot use '%s' as a Maid key", (tostring(v6))), 2);
    end;
    local l__tasks_0 = v5._tasks;
    local v9 = l__tasks_0[v6];
    if v9 == v7 then
        return;
    else
        l__tasks_0[v6] = v7;
        if v9 then
            if type(v9) == "function" then
                v9();
                return;
            elseif type(v9) == "thread" then
                local v10 = nil;
                if coroutine.running() ~= v9 then
                    v10 = pcall(function() --[[ Line: 128 ]]
                        -- upvalues: v9 (copy)
                        task.cancel(v9);
                    end);
                end;
                if not v10 then
                    task.defer(function() --[[ Line: 134 ]]
                        -- upvalues: v9 (copy)
                        task.cancel(v9);
                    end);
                    return;
                end;
            elseif typeof(v9) == "RBXScriptConnection" then
                v9:Disconnect();
                return;
            elseif typeof(v9) == "Instance" then
                v9:Destroy();
                return;
            elseif v9.destroy then
                v9:destroy();
                return;
            elseif v9.Destroy then
                v9:Destroy();
            end;
        end;
        return;
    end;
end;
v0.addNamed = function(v11, v12, v13) --[[ Line: 156 ]] --[[ Name: addNamed ]]
    v11[v12] = v13;
end;
v0.add = function(v14, v15) --[[ Line: 166 ]] --[[ Name: add ]]
    if not v15 then
        error("Task cannot be false or nil", 2);
    end;
    v14[#v14._tasks + 1] = v15;
    if type(v15) == "table" and not v15.destroy and not v15.Destroy then
        warn("[Maid.giveTask] - Gave table task without .Destroy\n\n" .. debug.traceback());
    end;
    return v15;
end;
v0.giveTask = function(v16, v17) --[[ Line: 186 ]] --[[ Name: giveTask ]]
    if not v17 then
        error("Task cannot be false or nil", 2);
    end;
    local v18 = #v16._tasks + 1;
    v16[v18] = v17;
    if type(v17) == "table" and not v17.destroy and not v17.Destroy then
        warn("[Maid.giveTask] - Gave table task without .Destroy\n\n" .. debug.traceback());
    end;
    return v18;
end;
v0.destroy = function(v19) --[[ Line: 217 ]] --[[ Name: destroy ]]
    local l__tasks_1 = v19._tasks;
    for v21, v22 in l__tasks_1 do
        if typeof(v22) == "RBXScriptConnection" then
            l__tasks_1[v21] = nil;
            v22:Disconnect();
        end;
    end;
    local v23, v24 = next(l__tasks_1);
    while v24 ~= nil do
        l__tasks_1[v23] = nil;
        if type(v24) == "function" then
            v24();
        elseif type(v24) == "thread" then
            local v25 = nil;
            if coroutine.running() ~= v24 then
                v25 = pcall(function() --[[ Line: 237 ]]
                    -- upvalues: v24 (ref)
                    task.cancel(v24);
                end);
            end;
            if not v25 then
                local l_v24_0 = v24;
                local l_l_v24_0_0 = l_v24_0 --[[ copy: 5 -> 7 ]];
                task.defer(function() --[[ Line: 244 ]]
                    -- upvalues: l_l_v24_0_0 (copy)
                    task.cancel(l_l_v24_0_0);
                end);
            end;
        elseif typeof(v24) == "RBXScriptConnection" then
            v24:Disconnect();
        elseif typeof(v24) == "Instance" then
            v24:Destroy();
        elseif v24.destroy then
            v24:destroy();
        elseif v24.Destroy then
            v24:Destroy();
        end;
        local v28, v29 = next(l__tasks_1);
        v23 = v28;
        v24 = v29;
    end;
end;
return v0;