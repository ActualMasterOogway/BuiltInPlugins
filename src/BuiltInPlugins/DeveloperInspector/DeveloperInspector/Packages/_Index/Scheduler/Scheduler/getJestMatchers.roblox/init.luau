local function v5(v0) --[[ Line: 9 ]] --[[ Name: captureAssertion ]]
    local l_status_0, l_result_0 = pcall(v0);
    if not l_status_0 then
        local v3 = tostring(l_result_0);
        local v4 = string.sub(v3, string.find(v3, " ") + 1);
        return {
            pass = false, 
            message = function() --[[ Line: 25 ]] --[[ Name: message ]]
                -- upvalues: v4 (copy)
                return v4;
            end
        };
    else
        return {
            pass = true
        };
    end;
end;
return function(v6) --[[ Line: 34 ]]
    -- upvalues: v5 (copy)
    local function _(v7) --[[ Line: 35 ]] --[[ Name: assertYieldsWereCleared ]]
        if #v7.unstable_clearYields() ~= 0 then
            error("Log of yielded values is not empty. " .. "Call expectToHaveYielded(scheduler, ...) first.", 3);
        end;
    end;
    local function v13(_, v10, v11) --[[ Line: 46 ]] --[[ Name: expectToFlushAndYield ]]
        -- upvalues: v5 (ref), v6 (copy)
        if #v10.unstable_clearYields() ~= 0 then
            error("Log of yielded values is not empty. " .. "Call expectToHaveYielded(scheduler, ...) first.", 3);
        end;
        v10.unstable_flushAllWithoutAsserting();
        local v12 = v10.unstable_clearYields();
        return (v5(function() --[[ Line: 51 ]]
            -- upvalues: v6 (ref), v12 (copy), v11 (copy)
            v6(v12).toEqual(v11);
        end));
    end;
    local function v18(_, v15, v16) --[[ Line: 56 ]] --[[ Name: expectToFlushAndYieldThrough ]]
        -- upvalues: v5 (ref), v6 (copy)
        if #v15.unstable_clearYields() ~= 0 then
            error("Log of yielded values is not empty. " .. "Call expectToHaveYielded(scheduler, ...) first.", 3);
        end;
        v15.unstable_flushNumberOfYields(#v16);
        local v17 = v15.unstable_clearYields();
        return (v5(function() --[[ Line: 65 ]]
            -- upvalues: v6 (ref), v17 (copy), v16 (copy)
            v6(v17).toEqual(v16);
        end));
    end;
    local function v23(_, v20, v21) --[[ Line: 70 ]] --[[ Name: toFlushUntilNextPaint ]]
        -- upvalues: v5 (ref), v6 (copy)
        if #v20.unstable_clearYields() ~= 0 then
            error("Log of yielded values is not empty. " .. "Call expectToHaveYielded(scheduler, ...) first.", 3);
        end;
        v20.unstable_flushUntilNextPaint();
        local v22 = v20.unstable_clearYields();
        return (v5(function() --[[ Line: 74 ]]
            -- upvalues: v6 (ref), v22 (copy), v21 (copy)
            v6(v22).toEqual(v21);
        end));
    end;
    local function v28(_, v25) --[[ Line: 79 ]] --[[ Name: expectToFlushWithoutYielding ]]
        -- upvalues: v5 (ref), v6 (copy)
        local v26 = {};
        if #v25.unstable_clearYields() ~= 0 then
            error("Log of yielded values is not empty. " .. "Call expectToHaveYielded(scheduler, ...) first.", 3);
        end;
        v25.unstable_flushAllWithoutAsserting();
        local v27 = v25.unstable_clearYields();
        return (v5(function() --[[ Line: 51 ]]
            -- upvalues: v6 (ref), v27 (copy), v26 (copy)
            v6(v27).toEqual(v26);
        end));
    end;
    local function v33(_, v30, v31) --[[ Line: 83 ]] --[[ Name: expectToFlushExpired ]]
        -- upvalues: v5 (ref), v6 (copy)
        if #v30.unstable_clearYields() ~= 0 then
            error("Log of yielded values is not empty. " .. "Call expectToHaveYielded(scheduler, ...) first.", 3);
        end;
        v30.unstable_flushExpired();
        local v32 = v30.unstable_clearYields();
        return (v5(function() --[[ Line: 88 ]]
            -- upvalues: v6 (ref), v32 (copy), v31 (copy)
            v6(v32).toEqual(v31);
        end));
    end;
    local function v38(_, v35, v36) --[[ Line: 93 ]] --[[ Name: expectToHaveYielded ]]
        -- upvalues: v5 (ref), v6 (copy)
        local v37 = v35.unstable_clearYields();
        return (v5(function() --[[ Line: 96 ]]
            -- upvalues: v6 (ref), v37 (copy), v36 (copy)
            v6(v37).toEqual(v36);
        end));
    end;
    local function v42(_, v40, v41) --[[ Line: 101 ]] --[[ Name: expectToFlushAndThrow ]]
        -- upvalues: v5 (ref), v6 (copy)
        if #v40.unstable_clearYields() ~= 0 then
            error("Log of yielded values is not empty. " .. "Call expectToHaveYielded(scheduler, ...) first.", 3);
        end;
        return (v5(function() --[[ Line: 103 ]]
            -- upvalues: v6 (ref), v40 (copy), v41 (copy)
            v6(function() --[[ Line: 104 ]]
                -- upvalues: v40 (ref)
                v40.unstable_flushAllWithoutAsserting();
            end).toThrow(v41);
        end));
    end;
    return {
        toFlushAndYield = v13, 
        toFlushAndYieldThrough = v18, 
        toFlushWithoutYielding = v28, 
        toFlushUntilNextPaint = v23, 
        toFlushExpired = v33, 
        toHaveYielded = v38, 
        toFlushAndThrow = v42
    };
end;