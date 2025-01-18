local function v6(v0) --[[ Line: 9 ]] --[[ Name: captureAssertion ]]
    local l_status_0, l_result_0 = pcall(v0);
    if not l_status_0 then
        local v3 = tostring(l_result_0);
        local v4 = string.find(v3, " ");
        assert(v4 ~= nil, "assertion failure text wasn't in expected format");
        local v5 = string.sub(v3, v4 + 1);
        return {
            pass = false, 
            message = function() --[[ Line: 26 ]] --[[ Name: message ]]
                -- upvalues: v5 (copy)
                return v5;
            end
        };
    else
        return {
            pass = true
        };
    end;
end;
return function(v7) --[[ Line: 36 ]]
    -- upvalues: v6 (copy)
    local function _(v8) --[[ Line: 37 ]] --[[ Name: assertYieldsWereCleared ]]
        if #v8.unstable_clearYields() ~= 0 then
            error("Log of yielded values is not empty. " .. "Call expectToHaveYielded(scheduler, ...) first.", 3);
        end;
    end;
    local function v14(_, v11, v12) --[[ Line: 49 ]] --[[ Name: expectToFlushAndYield ]]
        -- upvalues: v6 (ref), v7 (copy)
        if #v11.unstable_clearYields() ~= 0 then
            error("Log of yielded values is not empty. " .. "Call expectToHaveYielded(scheduler, ...) first.", 3);
        end;
        v11.unstable_flushAllWithoutAsserting();
        local v13 = v11.unstable_clearYields();
        return (v6(function() --[[ Line: 54 ]]
            -- upvalues: v7 (ref), v13 (copy), v12 (copy)
            v7(v13).toEqual(v12);
        end));
    end;
    local function v19(_, v16, v17) --[[ Line: 60 ]] --[[ Name: expectToFlushAndYieldThrough ]]
        -- upvalues: v6 (ref), v7 (copy)
        if #v16.unstable_clearYields() ~= 0 then
            error("Log of yielded values is not empty. " .. "Call expectToHaveYielded(scheduler, ...) first.", 3);
        end;
        v16.unstable_flushNumberOfYields(#v17);
        local v18 = v16.unstable_clearYields();
        return (v6(function() --[[ Line: 69 ]]
            -- upvalues: v7 (ref), v18 (copy), v17 (copy)
            v7(v18).toEqual(v17);
        end));
    end;
    local function v24(_, v21, v22) --[[ Line: 75 ]] --[[ Name: toFlushUntilNextPaint ]]
        -- upvalues: v6 (ref), v7 (copy)
        if #v21.unstable_clearYields() ~= 0 then
            error("Log of yielded values is not empty. " .. "Call expectToHaveYielded(scheduler, ...) first.", 3);
        end;
        v21.unstable_flushUntilNextPaint();
        local v23 = v21.unstable_clearYields();
        return (v6(function() --[[ Line: 79 ]]
            -- upvalues: v7 (ref), v23 (copy), v22 (copy)
            v7(v23).toEqual(v22);
        end));
    end;
    local function v29(_, v26) --[[ Line: 84 ]] --[[ Name: expectToFlushWithoutYielding ]]
        -- upvalues: v6 (ref), v7 (copy)
        local v27 = {};
        if #v26.unstable_clearYields() ~= 0 then
            error("Log of yielded values is not empty. " .. "Call expectToHaveYielded(scheduler, ...) first.", 3);
        end;
        v26.unstable_flushAllWithoutAsserting();
        local v28 = v26.unstable_clearYields();
        return (v6(function() --[[ Line: 54 ]]
            -- upvalues: v7 (ref), v28 (copy), v27 (copy)
            v7(v28).toEqual(v27);
        end));
    end;
    local function v34(_, v31, v32) --[[ Line: 89 ]] --[[ Name: expectToFlushExpired ]]
        -- upvalues: v6 (ref), v7 (copy)
        if #v31.unstable_clearYields() ~= 0 then
            error("Log of yielded values is not empty. " .. "Call expectToHaveYielded(scheduler, ...) first.", 3);
        end;
        v31.unstable_flushExpired();
        local v33 = v31.unstable_clearYields();
        return (v6(function() --[[ Line: 94 ]]
            -- upvalues: v7 (ref), v33 (copy), v32 (copy)
            v7(v33).toEqual(v32);
        end));
    end;
    local function v39(_, v36, v37) --[[ Line: 100 ]] --[[ Name: expectToHaveYielded ]]
        -- upvalues: v6 (ref), v7 (copy)
        local v38 = v36.unstable_clearYields();
        return (v6(function() --[[ Line: 103 ]]
            -- upvalues: v7 (ref), v38 (copy), v37 (copy)
            v7(v38).toEqual(v37);
        end));
    end;
    local function v43(_, v41, v42) --[[ Line: 108 ]] --[[ Name: expectToFlushAndThrow ]]
        -- upvalues: v6 (ref), v7 (copy)
        if #v41.unstable_clearYields() ~= 0 then
            error("Log of yielded values is not empty. " .. "Call expectToHaveYielded(scheduler, ...) first.", 3);
        end;
        return (v6(function() --[[ Line: 110 ]]
            -- upvalues: v7 (ref), v41 (copy), v42 (copy)
            v7(v41.unstable_flushAllWithoutAsserting).toThrow(v42);
        end));
    end;
    return {
        toFlushAndYield = v14, 
        toFlushAndYieldThrough = v19, 
        toFlushWithoutYielding = v29, 
        toFlushUntilNextPaint = v24, 
        toFlushExpired = v34, 
        toHaveYielded = v39, 
        toFlushAndThrow = v43
    };
end;