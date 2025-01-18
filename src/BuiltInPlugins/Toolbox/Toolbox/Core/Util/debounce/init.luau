return function(v0, v1) --[[ Line: 1 ]]
    local v2 = nil;
    local v3 = false;
    local v4 = nil;
    return function(...) --[[ Line: 5 ]]
        -- upvalues: v2 (ref), v3 (ref), v4 (ref), v1 (copy), v0 (copy)
        v2 = {
            ...
        };
        if v3 then
            if v4 ~= nil and coroutine.status(v4) == "suspended" then
                task.cancel(v4);
            end;
            v3 = false;
        end;
        if not v3 then
            v3 = true;
            v4 = task.delay(v1, function() --[[ Line: 22 ]]
                -- upvalues: v3 (ref), v0 (ref), v2 (ref)
                v3 = false;
                v0(unpack(v2));
            end);
        end;
    end;
end;