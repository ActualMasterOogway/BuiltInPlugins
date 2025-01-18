local v0 = require(script.Parent.Promise);
return function(v1, v2) --[[ Line: 9 ]] --[[ Name: pollUntil ]]
    -- upvalues: v0 (copy)
    local v3 = os.time() + (v2 or 1);
    local v4 = nil;
    local v5 = nil;
    local v8 = v0.new(function(v6, v7) --[[ Line: 14 ]]
        -- upvalues: v4 (ref), v5 (ref)
        v4 = v6;
        v5 = v7;
    end);
    spawn(function() --[[ Line: 18 ]]
        -- upvalues: v1 (copy), v3 (copy), v4 (ref), v5 (ref)
        local v9 = v1();
        while os.time() < v3 and not v9 do
            wait();
            v9 = v1();
        end;
        if v9 then
            v4(v9);
            return;
        else
            v5();
            return;
        end;
    end);
    return v8;
end;