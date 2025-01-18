return function(v0) --[[ Line: 10 ]] --[[ Name: createSpy ]]
    local v1 = {
        callCount = 0, 
        values = {}, 
        valuesLength = 0
    };
    v1.value = function(...) --[[ Line: 17 ]]
        -- upvalues: v1 (copy), v0 (copy)
        v1.callCount = v1.callCount + 1;
        v1.values = {
            ...
        };
        v1.valuesLength = select("#", ...);
        if v0 ~= nil then
            return v0(...);
        else
            return nil;
        end;
    end;
    v1.assertCalledWith = function(_, ...) --[[ Line: 28 ]]
        -- upvalues: v1 (copy)
        local v3 = select("#", ...);
        if v1.valuesLength ~= v3 then
            error(("Expected %d arguments, but was called with %d arguments"):format(v1.valuesLength, v3), 2);
        end;
        for v4 = 1, v3 do
            assert(select(v4, ...) == v1.values[v4], "value differs");
        end;
    end;
    v1.captureValues = function(_, ...) --[[ Line: 42 ]]
        -- upvalues: v1 (copy)
        local v6 = select("#", ...);
        local v7 = {};
        assert(v1.valuesLength == v6, "length of expected values differs from stored values");
        for v8 = 1, v6 do
            v7[select(v8, ...)] = v1.values[v8];
        end;
        return v7;
    end;
    setmetatable(v1, {
        __index = function(_, v10) --[[ Line: 57 ]] --[[ Name: __index ]]
            error(("%q is not a valid member of spy"):format(v10));
        end
    });
    return v1;
end;