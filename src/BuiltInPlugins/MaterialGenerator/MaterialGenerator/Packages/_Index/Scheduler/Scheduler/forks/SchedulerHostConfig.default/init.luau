local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v1.Object;
local v3 = require(l_Parent_0.Shared);
local l_console_0 = v3.console;
local l_errorToString_0 = v3.errorToString;
local l_describeError_0 = v3.describeError;
local function v7() --[[ Line: 20 ]]
    return os.clock() * 1000;
end;
local l_setTimeout_0 = v1.setTimeout;
local l_clearTimeout_0 = v1.clearTimeout;
local v10 = false;
local v11 = nil;
local l_None_0 = l_Object_0.None;
local v13 = 15;
local v14 = 0;
local function v15() --[[ Line: 47 ]] --[[ Name: shouldYieldToHost ]]
    -- upvalues: v14 (ref)
    return os.clock() * 1000 >= v14;
end;
local function v16() --[[ Line: 52 ]] --[[ Name: requestPaint ]]

end;
local function v18(v17) --[[ Line: 54 ]] --[[ Name: forceFrameRate ]]
    -- upvalues: l_console_0 (copy), v13 (ref)
    if v17 < 0 or v17 > 125 then
        l_console_0.warn("forceFrameRate takes a positive int between 0 and 125, " .. "forcing frame rates higher than 125 fps is not supported");
        return;
    elseif v17 > 0 then
        v13 = math.floor(1000 / v17);
        return;
    else
        v13 = 5;
        return;
    end;
end;
local function v19() --[[ Line: 70 ]] --[[ Name: performWorkUntilDeadline ]]
    -- upvalues: v11 (ref), v14 (ref), v13 (ref), v10 (ref), v19 (ref), l_describeError_0 (copy), l_errorToString_0 (copy)
    if v11 ~= nil then
        local v20 = os.clock() * 1000;
        v14 = v20 + v13;
        local v21 = nil;
        local v22 = nil;
        local function v23() --[[ Line: 80 ]] --[[ Name: doWork ]]
            -- upvalues: v11 (ref), v20 (copy), v10 (ref), v19 (ref)
            if not v11(true, v20) then
                v10 = false;
                v11 = nil;
            else
                task.delay(0, v19);
            end;
            return nil;
        end;
        if not _G.__YOLO__ then
            local v24, v25 = xpcall(v23, l_describeError_0);
            v21 = v24;
            v22 = v25;
        else
            if not v11(true, v20) then
                v10 = false;
                v11 = nil;
            else
                task.delay(0, v19);
            end;
            v22 = nil;
            v21 = true;
        end;
        if not v21 then
            task.delay(0, v19);
            error(l_errorToString_0(v22));
            return;
        end;
    else
        v10 = false;
    end;
end;
local _ = function(v26) --[[ Line: 125 ]] --[[ Name: wrapPerformWorkWithCoroutine ]]
    local v30 = coroutine.create(function() --[[ Line: 126 ]]
        -- upvalues: v26 (copy)
        while true do
            local v27 = coroutine.wrap(v26);
            local l_status_0, l_result_0 = pcall(v27);
            coroutine.yield(l_status_0, l_result_0);
        end;
    end);
    return function() --[[ Line: 136 ]]
        -- upvalues: v30 (copy)
        local _, v32, v33 = coroutine.resume(v30);
        if not v32 then
            error(v33);
        end;
    end;
end;
local l_v19_0 = v19;
local l_l_v19_0_0 = l_v19_0 --[[ copy: 20 -> 24 ]];
local v40 = coroutine.create(function() --[[ Line: 126 ]]
    -- upvalues: l_l_v19_0_0 (copy)
    while true do
        local v37 = coroutine.wrap(l_l_v19_0_0);
        local l_status_1, l_result_1 = pcall(v37);
        coroutine.yield(l_status_1, l_result_1);
    end;
end);
local l_v40_0 = v40 --[[ copy: 21 -> 25 ]];
v19 = function() --[[ Line: 136 ]]
    -- upvalues: l_v40_0 (copy)
    local _, v43, v44 = coroutine.resume(l_v40_0);
    if not v43 then
        error(v44);
    end;
end;
l_v19_0 = function(v45) --[[ Line: 146 ]] --[[ Name: requestHostCallback ]]
    -- upvalues: v11 (ref), v10 (ref), v19 (ref)
    v11 = v45;
    if not v10 then
        v10 = true;
        task.delay(0, v19);
    end;
end;
v40 = function() --[[ Line: 155 ]] --[[ Name: cancelHostCallback ]]
    -- upvalues: v11 (ref)
    v11 = nil;
end;
local function v48(v46, v47) --[[ Line: 159 ]] --[[ Name: requestHostTimeout ]]
    -- upvalues: l_None_0 (ref), l_setTimeout_0 (copy)
    l_None_0 = l_setTimeout_0(function() --[[ Line: 160 ]]
        -- upvalues: v46 (copy)
        v46(os.clock() * 1000);
    end, v47);
end;
local function v49() --[[ Line: 165 ]] --[[ Name: cancelHostTimeout ]]
    -- upvalues: l_clearTimeout_0 (copy), l_None_0 (ref), l_Object_0 (copy)
    l_clearTimeout_0(l_None_0);
    l_None_0 = l_Object_0.None;
end;
return {
    requestHostCallback = l_v19_0, 
    cancelHostCallback = v40, 
    requestHostTimeout = v48, 
    cancelHostTimeout = v49, 
    shouldYieldToHost = v15, 
    requestPaint = v16, 
    getCurrentTime = v7, 
    forceFrameRate = v18
};