local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v1.Object;
local v3 = require(l_Parent_0.Shared);
local l_console_0 = v3.console;
local l_errorToString_0 = v3.errorToString;
local function v6() --[[ Line: 19 ]]
    return os.clock() * 1000;
end;
local l_setTimeout_0 = v1.setTimeout;
local l_clearTimeout_0 = v1.clearTimeout;
local v9 = false;
local v10 = nil;
local l_None_0 = l_Object_0.None;
local v12 = 15;
local v13 = 0;
local function v14() --[[ Line: 46 ]] --[[ Name: shouldYieldToHost ]]
    -- upvalues: v13 (ref)
    return os.clock() * 1000 >= v13;
end;
local function v15() --[[ Line: 51 ]] --[[ Name: requestPaint ]]

end;
local function v17(v16) --[[ Line: 54 ]] --[[ Name: forceFrameRate ]]
    -- upvalues: l_console_0 (copy), v12 (ref)
    if v16 < 0 or v16 > 125 then
        l_console_0.warn("forceFrameRate takes a positive int between 0 and 125, " .. "forcing frame rates higher than 125 fps is not supported");
        return;
    elseif v16 > 0 then
        v12 = math.floor(1000 / v16);
        return;
    else
        v12 = 5;
        return;
    end;
end;
local function v18() --[[ Line: 70 ]] --[[ Name: performWorkUntilDeadline ]]
    -- upvalues: v10 (ref), v13 (ref), v12 (ref), v9 (ref), v18 (copy), l_errorToString_0 (copy)
    if v10 ~= nil then
        local v19 = os.clock() * 1000;
        v13 = v19 + v12;
        local v20 = nil;
        local v21 = nil;
        local function v22() --[[ Line: 80 ]] --[[ Name: doWork ]]
            -- upvalues: v10 (ref), v19 (copy), v9 (ref), v18 (ref)
            if not v10(true, v19) then
                v9 = false;
                v10 = nil;
                return;
            else
                task.delay(0, v18);
                return;
            end;
        end;
        if not _G.__YOLO__ then
            local v23, v24 = xpcall(v22, l_errorToString_0);
            v20 = v23;
            v21 = v24;
        else
            if not v10(true, v19) then
                v9 = false;
                v10 = nil;
            else
                task.delay(0, v18);
            end;
            v21 = nil;
            v20 = true;
        end;
        if not v20 then
            task.delay(0, v18);
            error(v21);
            return;
        end;
    else
        v9 = false;
    end;
end;
local function v26(v25) --[[ Line: 122 ]] --[[ Name: requestHostCallback ]]
    -- upvalues: v10 (ref), v9 (ref), v18 (copy)
    v10 = v25;
    if not v9 then
        v9 = true;
        task.delay(0, v18);
    end;
end;
local function v27() --[[ Line: 131 ]] --[[ Name: cancelHostCallback ]]
    -- upvalues: v10 (ref)
    v10 = nil;
end;
local function v30(v28, v29) --[[ Line: 135 ]] --[[ Name: requestHostTimeout ]]
    -- upvalues: l_None_0 (ref), l_setTimeout_0 (copy)
    l_None_0 = l_setTimeout_0(function() --[[ Line: 136 ]]
        -- upvalues: v28 (copy)
        v28(os.clock() * 1000);
    end, v29);
end;
local function v31() --[[ Line: 141 ]] --[[ Name: cancelHostTimeout ]]
    -- upvalues: l_clearTimeout_0 (copy), l_None_0 (ref), l_Object_0 (copy)
    l_clearTimeout_0(l_None_0);
    l_None_0 = l_Object_0.None;
end;
return {
    requestHostCallback = v26, 
    cancelHostCallback = v27, 
    requestHostTimeout = v30, 
    cancelHostTimeout = v31, 
    shouldYieldToHost = v14, 
    requestPaint = v15, 
    getCurrentTime = v6, 
    forceFrameRate = v17
};