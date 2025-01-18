return function(v0, v1) --[[ Line: 2 ]] --[[ Name: createCallThrottler ]]
    local v2 = nil;
    local v3 = false;
    local v4 = -1e999;
    return function(v5) --[[ Line: 7 ]]
        -- upvalues: v3 (ref), v4 (ref), v0 (copy), v2 (ref), v1 (copy)
        local function v6() --[[ Line: 8 ]] --[[ Name: execute ]]
            -- upvalues: v3 (ref), v4 (ref), v0 (ref), v2 (ref)
            v3 = false;
            v4 = os.clock();
            v0(v2);
            v2 = nil;
        end;
        v2 = v5;
        if v3 then
            return;
        elseif os.clock() > v4 + v1 then
            v3 = false;
            v4 = os.clock();
            v0(v2);
            v2 = nil;
            return;
        else
            v3 = true;
            task.delay(v1, v6);
            return;
        end;
    end;
end;