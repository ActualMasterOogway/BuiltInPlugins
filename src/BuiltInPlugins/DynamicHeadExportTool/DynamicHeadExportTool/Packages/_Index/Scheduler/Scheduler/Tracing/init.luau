local l_Parent_0 = script.Parent.Parent;
local l_Set_0 = require(l_Parent_0.LuauPolyfill).Set;
local v2 = {};
local l_enableSchedulerTracing_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableSchedulerTracing;
local v4 = 0;
local v5 = 0;
local v6 = nil;
local v7 = nil;
if l_enableSchedulerTracing_0 then
    v6 = {
        current = l_Set_0.new()
    };
    v7 = {
        current = nil
    };
end;
v2.__interactionsRef = v6;
v2.__subscriberRef = v7;
v2.unstable_clear = function(v8) --[[ Line: 91 ]]
    -- upvalues: l_enableSchedulerTracing_0 (copy), v6 (ref), l_Set_0 (copy)
    if not l_enableSchedulerTracing_0 then
        return v8();
    else
        local l_current_0 = v6.current;
        v6.current = l_Set_0.new();
        local l_status_0, l_result_0 = pcall(v8);
        v6.current = l_current_0;
        if not l_status_0 then
            error(l_result_0);
        end;
        return l_result_0;
    end;
end;
v2.unstable_getCurrent = function() --[[ Line: 111 ]]
    -- upvalues: l_enableSchedulerTracing_0 (copy), v6 (ref)
    if not l_enableSchedulerTracing_0 then
        return nil;
    else
        return v6.current;
    end;
end;
v2.unstable_getThreadID = function() --[[ Line: 119 ]]
    -- upvalues: v5 (ref)
    v5 = v5 + 1;
    return v5;
end;
local _ = function(v12) --[[ Line: 124 ]] --[[ Name: copySet ]]
    -- upvalues: l_Set_0 (copy)
    local v13 = l_Set_0.new();
    if v12 == nil then
        return v13;
    else
        for _, v15 in v12 do
            v13:add(v15);
        end;
        return v13;
    end;
end;
v2.unstable_trace = function(v17, v18, v19, v20) --[[ Line: 136 ]]
    -- upvalues: l_enableSchedulerTracing_0 (copy), v4 (ref), v6 (ref), l_Set_0 (copy), v7 (ref)
    if v20 == nil then
        v20 = 0;
    end;
    if not l_enableSchedulerTracing_0 then
        return v19();
    else
        local v21 = {
            __count = 1, 
            id = v4, 
            name = v17, 
            timestamp = v18
        };
        v4 = v4 + 1;
        local l_current_1 = v6.current;
        local v23 = l_Set_0.new();
        local v24;
        if l_current_1 == nil then
            v24 = v23;
        else
            for _, v26 in l_current_1 do
                v23:add(v26);
            end;
            v24 = v23;
        end;
        v24:add(v21);
        v6.current = v24;
        v23 = v7.current;
        local v27 = nil;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 168 ]]
            -- upvalues: v23 (copy), v21 (copy)
            if v23 ~= nil then
                v23.onInteractionTraced(v21);
            end;
        end);
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 175 ]]
            -- upvalues: v23 (copy), v24 (copy), v20 (ref)
            if v23 ~= nil then
                v23.onWorkStarted(v24, v20);
            end;
        end);
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 183 ]]
            -- upvalues: v27 (ref), v19 (copy)
            v27 = v19();
        end);
        v6.current = l_current_1;
        local l_status_4, l_result_4 = pcall(function() --[[ Line: 189 ]]
            -- upvalues: v23 (copy), v24 (copy), v20 (ref)
            if v23 ~= nil then
                v23.onWorkStopped(v24, v20);
            end;
        end);
        v21.__count = v21.__count - 1;
        if v23 ~= nil and v21.__count == 0 then
            v23.onInteractionScheduledWorkCompleted(v21);
        end;
        if not l_status_4 then
            error(l_result_4);
        end;
        if not l_status_3 then
            error(l_result_3);
        end;
        if not l_status_2 then
            error(l_result_2);
        end;
        if not l_status_1 then
            error(l_result_1);
        end;
        return v27;
    end;
end;
v2.unstable_wrap = function(v36, v37) --[[ Line: 223 ]]
    -- upvalues: l_enableSchedulerTracing_0 (copy), v6 (ref), v7 (ref)
    if v37 == nil then
        v37 = 0;
    end;
    if not l_enableSchedulerTracing_0 then
        return v36;
    else
        local l_current_2 = v6.current;
        local l_current_3 = v7.current;
        if l_current_3 ~= nil then
            l_current_3.onWorkScheduled(l_current_2, v37);
        end;
        for _, v41 in l_current_2 do
            v41.__count = v41.__count + 1;
        end;
        local v42 = false;
        local function v54(_, ...) --[[ Line: 248 ]] --[[ Name: _wrapped ]]
            -- upvalues: v6 (ref), l_current_2 (copy), l_current_3 (ref), v7 (ref), v37 (ref), v36 (copy), v42 (ref)
            local l_current_4 = v6.current;
            v6.current = l_current_2;
            l_current_3 = v7.current;
            local l_status_7, l_result_7 = pcall(function(...) --[[ Line: 255 ]]
                -- upvalues: l_current_3 (ref), l_current_2 (ref), v37 (ref), v36 (ref), v6 (ref), l_current_4 (copy)
                local v45 = nil;
                local l_status_5, l_result_5 = pcall(function() --[[ Line: 259 ]]
                    -- upvalues: l_current_3 (ref), l_current_2 (ref), v37 (ref)
                    if l_current_3 ~= nil then
                        l_current_3.onWorkStarted(l_current_2, v37);
                    end;
                end);
                local l_status_6, l_result_6 = pcall(function(...) --[[ Line: 266 ]]
                    -- upvalues: v45 (ref), v36 (ref)
                    v45 = v36(...);
                end, ...);
                v6.current = l_current_4;
                if l_current_3 ~= nil then
                    l_current_3.onWorkStopped(l_current_2, v37);
                end;
                if not l_status_6 then
                    error(l_result_6);
                end;
                if not l_status_5 then
                    error(l_result_5);
                end;
                return v45;
            end, ...);
            if not v42 then
                v42 = true;
                for _, v53 in l_current_2 do
                    v53.__count = v53.__count - 1;
                    if l_current_3 ~= nil and v53.__count == 0 then
                        l_current_3.onInteractionScheduledWorkCompleted(v53);
                    end;
                end;
            end;
            if not l_status_7 then
                error(l_result_7);
            end;
            return l_result_7;
        end;
        local function v59() --[[ Line: 313 ]]
            -- upvalues: l_current_3 (ref), v7 (ref), l_current_2 (copy), v37 (ref)
            l_current_3 = v7.current;
            local l_status_8, l_result_8 = pcall(function() --[[ Line: 316 ]]
                -- upvalues: l_current_3 (ref), l_current_2 (ref), v37 (ref)
                if l_current_3 ~= nil then
                    l_current_3.onWorkCanceled(l_current_2, v37);
                end;
            end);
            for _, v58 in l_current_2 do
                v58.__count = v58.__count - 1;
                if l_current_3 and v58.__count == 0 then
                    l_current_3.onInteractionScheduledWorkCompleted(v58);
                end;
            end;
            if not l_status_8 then
                error(l_result_8);
            end;
        end;
        local v60 = {};
        setmetatable(v60, {
            __call = v54
        });
        v60.cancel = v59;
        return v60;
    end;
end;
return v2;