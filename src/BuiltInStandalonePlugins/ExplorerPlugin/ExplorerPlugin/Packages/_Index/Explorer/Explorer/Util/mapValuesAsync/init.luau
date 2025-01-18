return function(v0, v1) --[[ Line: 3 ]] --[[ Name: mapValuesAsync ]]
    local v2 = coroutine.running();
    local v3 = {};
    local v4 = 0;
    for _ in v0 do
        v4 = v4 + 1;
    end;
    local v6 = nil;
    local v7 = {};
    for v8, v9 in v0 do
        table.insert(v3, task.spawn(function() --[[ Line: 19 ]]
            -- upvalues: v1 (copy), v9 (copy), v8 (copy), v6 (ref), v3 (copy), v2 (copy), v7 (copy), v4 (ref)
            local v10 = nil;
            if not xpcall(function() --[[ Line: 22 ]]
                -- upvalues: v10 (ref), v1 (ref), v9 (ref), v8 (ref)
                v10 = v1(v9, v8);
            end, function(v11) --[[ Line: 24 ]]
                -- upvalues: v6 (ref), v3 (ref), v2 (ref)
                v6 = v11;
                for _, v13 in v3 do
                    if v13 ~= coroutine.running() then
                        task.cancel(v13);
                    end;
                end;
                if coroutine.status(v2) == "suspended" then
                    coroutine.resume(v2);
                end;
            end) then
                return;
            else
                if v10 ~= nil then
                    v7[v8] = v10;
                end;
                v4 = v4 - 1;
                if v4 == 0 and coroutine.status(v2) == "suspended" then
                    coroutine.resume(v2);
                end;
                return;
            end;
        end));
    end;
    if v6 ~= nil then
        error(v6);
    end;
    if v4 ~= 0 then
        coroutine.yield();
    end;
    if v6 ~= nil then
        error(v6);
    end;
    return v7;
end;