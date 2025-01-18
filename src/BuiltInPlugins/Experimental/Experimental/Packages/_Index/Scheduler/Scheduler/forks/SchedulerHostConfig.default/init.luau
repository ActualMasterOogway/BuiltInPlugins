local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local v2 = require(l_Parent_0.Shared);
local l_console_0 = v2.console;
local l_errorToString_0 = v2.errorToString;
local function v5() --[[ Line: 18 ]]
    return os.clock() * 1000;
end;
local l_setTimeout_0 = v1.setTimeout;
local l_clearTimeout_0 = v1.clearTimeout;
local v8 = false;
local v9 = nil;
local v10 = -1;
local v11 = 15;
local v12 = 0;
local function v13() --[[ Line: 45 ]] --[[ Name: shouldYieldToHost ]]
    -- upvalues: v12 (ref)
    return os.clock() * 1000 >= v12;
end;
local function v14() --[[ Line: 50 ]] --[[ Name: requestPaint ]]

end;
local function v16(v15) --[[ Line: 53 ]] --[[ Name: forceFrameRate ]]
    -- upvalues: l_console_0 (copy), v11 (ref)
    if v15 < 0 or v15 > 125 then
        l_console_0.warn("forceFrameRate takes a positive int between 0 and 125, " .. "forcing frame rates higher than 125 fps is not supported");
        return;
    elseif v15 > 0 then
        v11 = math.floor(1000 / v15);
        return;
    else
        v11 = 5;
        return;
    end;
end;
local function v17() --[[ Line: 69 ]] --[[ Name: performWorkUntilDeadline ]]
    -- upvalues: v9 (ref), v12 (ref), v11 (ref), v8 (ref), v17 (copy), l_errorToString_0 (copy)
    if v9 ~= nil then
        local v18 = os.clock() * 1000;
        v12 = v18 + v11;
        local v19 = nil;
        local v20 = nil;
        local function v21() --[[ Line: 79 ]] --[[ Name: doWork ]]
            -- upvalues: v9 (ref), v18 (copy), v8 (ref), v17 (ref)
            if not v9(true, v18) then
                v8 = false;
                v9 = nil;
                return;
            else
                task.delay(0, v17);
                return;
            end;
        end;
        if not _G.__YOLO__ then
            local v22, v23 = xpcall(v21, l_errorToString_0);
            v19 = v22;
            v20 = v23;
        else
            if not v9(true, v18) then
                v8 = false;
                v9 = nil;
            else
                task.delay(0, v17);
            end;
            v20 = nil;
            v19 = true;
        end;
        if not v19 then
            task.delay(0, v17);
            error(v20);
            return;
        end;
    else
        v8 = false;
    end;
end;
local function v25(v24) --[[ Line: 121 ]] --[[ Name: requestHostCallback ]]
    -- upvalues: v9 (ref), v8 (ref), v17 (copy)
    v9 = v24;
    if not v8 then
        v8 = true;
        task.delay(0, v17);
    end;
end;
local function v26() --[[ Line: 130 ]] --[[ Name: cancelHostCallback ]]
    -- upvalues: v9 (ref)
    v9 = nil;
end;
local function v29(v27, v28) --[[ Line: 134 ]] --[[ Name: requestHostTimeout ]]
    -- upvalues: v10 (ref), l_setTimeout_0 (copy)
    v10 = l_setTimeout_0(function() --[[ Line: 135 ]]
        -- upvalues: v27 (copy)
        v27(os.clock() * 1000);
    end, v28);
end;
local function v30() --[[ Line: 140 ]] --[[ Name: cancelHostTimeout ]]
    -- upvalues: l_clearTimeout_0 (copy), v10 (ref)
    l_clearTimeout_0(v10);
    v10 = -1;
end;
return {
    requestHostCallback = v25, 
    cancelHostCallback = v26, 
    requestHostTimeout = v29, 
    cancelHostTimeout = v30, 
    shouldYieldToHost = v13, 
    requestPaint = v14, 
    getCurrentTime = v5, 
    forceFrameRate = v16
};