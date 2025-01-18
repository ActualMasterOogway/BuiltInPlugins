local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_console_0 = v1.console;
local v4 = require(l_Parent_0.Promise);
local v5 = {};
local v6 = require(l_Parent_0.Shared);
local l_ReactSharedInternals_0 = v6.ReactSharedInternals;
local l_enqueueTask_0 = v6.enqueueTask;
local v9 = require(l_Parent_0.Scheduler);
local v10 = require(l_Parent_0.ReactRoblox);
local l_Events_0 = v10.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED.Events;
local l_IsThisRendererActing_0 = l_Events_0.IsThisRendererActing;
local l_flushPassiveEffects_0 = l_Events_0.flushPassiveEffects;
local l_unstable_batchedUpdates_0 = v10.unstable_batchedUpdates;
local l_IsSomeRendererActing_0 = l_ReactSharedInternals_0.IsSomeRendererActing;
local v16 = require(script.Parent["realTaskDelay.roblox.global"]);
local v17 = typeof(v9.unstable_flushAllWithoutAsserting) == "function";
local function _() --[[ Line: 60 ]]
    -- upvalues: l_flushPassiveEffects_0 (copy)
    local v18 = false;
    while l_flushPassiveEffects_0() do
        v18 = true;
    end;
    return v18;
end;
local function v20(v21) --[[ Line: 68 ]] --[[ Name: flushWorkAndMicroTasks ]]
    -- upvalues: l_flushPassiveEffects_0 (copy), l_enqueueTask_0 (copy), v16 (copy), v20 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 69 ]]
        -- upvalues: l_flushPassiveEffects_0 (ref), l_enqueueTask_0 (ref), v16 (ref), v20 (ref), v21 (copy)
        local v22 = false;
        while l_flushPassiveEffects_0() do
            v22 = true;
        end;
        v22 = l_enqueueTask_0;
        if type(task.delay) == "table" then
            v22 = function(v23) --[[ Line: 84 ]]
                -- upvalues: v16 (ref)
                return v16(0, v23);
            end;
        end;
        v22(function() --[[ Line: 88 ]]
            -- upvalues: l_flushPassiveEffects_0 (ref), v20 (ref), v21 (ref)
            local v24 = false;
            while l_flushPassiveEffects_0() do
                v24 = true;
            end;
            if v24 then
                v20(v21);
                return;
            else
                v21();
                return;
            end;
        end);
    end);
    if not l_status_0 then
        v21(l_result_0);
    end;
end;
local v27 = 0;
local v28 = false;
v5.default = function(v29) --[[ Line: 110 ]] --[[ Name: act ]]
    -- upvalues: v28 (ref), l_console_0 (copy), v27 (ref), l_IsSomeRendererActing_0 (copy), l_IsThisRendererActing_0 (copy), l_unstable_batchedUpdates_0 (copy), v4 (copy), v17 (copy), l_Boolean_0 (copy), l_flushPassiveEffects_0 (copy), l_enqueueTask_0 (copy), v16 (copy), v20 (copy)
    if not _G.__DEV__ and v28 == false then
        v28 = true;
        l_console_0.error("act(...) is not supported in production builds of React, and might not behave as expected.");
    end;
    local l_v27_0 = v27;
    v27 = v27 + 1;
    local l_current_0 = l_IsSomeRendererActing_0.current;
    local l_current_1 = l_IsThisRendererActing_0.current;
    l_IsSomeRendererActing_0.current = true;
    l_IsThisRendererActing_0.current = true;
    local function _() --[[ Line: 125 ]] --[[ Name: onDone ]]
        -- upvalues: v27 (ref), l_IsSomeRendererActing_0 (ref), l_current_0 (copy), l_IsThisRendererActing_0 (ref), l_current_1 (copy), l_v27_0 (copy), l_console_0 (ref)
        v27 = v27 - 1;
        l_IsSomeRendererActing_0.current = l_current_0;
        l_IsThisRendererActing_0.current = l_current_1;
        if _G.__DEV__ and l_v27_0 < v27 then
            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
        end;
    end;
    local v34 = nil;
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 141 ]]
        -- upvalues: v34 (ref), l_unstable_batchedUpdates_0 (ref), v29 (copy)
        v34 = l_unstable_batchedUpdates_0(v29);
    end);
    if not l_status_1 then
        v27 = v27 - 1;
        l_IsSomeRendererActing_0.current = l_current_0;
        l_IsThisRendererActing_0.current = l_current_1;
        if _G.__DEV__ and l_v27_0 < v27 then
            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
        end;
        error(l_result_1);
    end;
    if v34 ~= nil and typeof(v34) == "table" and typeof(v34.andThen) == "function" then
        local v37 = false;
        if _G.__DEV__ and typeof(v4) ~= "nil" then
            v4.delay(0):andThen(function() --[[ Line: 156 ]]
                -- upvalues: v37 (ref), l_console_0 (ref)
                if v37 == false then
                    l_console_0.error("You called act(async () => ...) without await. " .. "This could lead to unexpected testing behaviour, interleaving multiple act " .. "calls and mixing their scopes. You should - await act(async () => ...);");
                end;
            end);
        end;
        return v4.new(function(v38, v39) --[[ Line: 171 ]]
            -- upvalues: v37 (ref), v34 (ref), v27 (ref), v17 (ref), l_current_0 (copy), l_IsSomeRendererActing_0 (ref), l_IsThisRendererActing_0 (ref), l_current_1 (copy), l_v27_0 (copy), l_console_0 (ref), l_Boolean_0 (ref), l_flushPassiveEffects_0 (ref), l_enqueueTask_0 (ref), v16 (ref), v20 (ref)
            v37 = true;
            v34:andThen(function() --[[ Line: 173 ]]
                -- upvalues: v27 (ref), v17 (ref), l_current_0 (ref), l_IsSomeRendererActing_0 (ref), l_IsThisRendererActing_0 (ref), l_current_1 (ref), l_v27_0 (ref), l_console_0 (ref), v38 (copy), l_Boolean_0 (ref), v39 (copy), l_flushPassiveEffects_0 (ref), l_enqueueTask_0 (ref), v16 (ref), v20 (ref)
                if v27 > 1 or v17 == true and l_current_0 == true then
                    v27 = v27 - 1;
                    l_IsSomeRendererActing_0.current = l_current_0;
                    l_IsThisRendererActing_0.current = l_current_1;
                    if _G.__DEV__ and l_v27_0 < v27 then
                        l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                    end;
                    v38();
                    return;
                else
                    local function v41(v40) --[[ Line: 184 ]]
                        -- upvalues: v27 (ref), l_IsSomeRendererActing_0 (ref), l_current_0 (ref), l_IsThisRendererActing_0 (ref), l_current_1 (ref), l_v27_0 (ref), l_console_0 (ref), l_Boolean_0 (ref), v39 (ref), v38 (ref)
                        v27 = v27 - 1;
                        l_IsSomeRendererActing_0.current = l_current_0;
                        l_IsThisRendererActing_0.current = l_current_1;
                        if _G.__DEV__ and l_v27_0 < v27 then
                            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                        end;
                        if l_Boolean_0.toJSBoolean(v40) then
                            v39(v40);
                            return;
                        else
                            v38();
                            return;
                        end;
                    end;
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 69 ]]
                        -- upvalues: l_flushPassiveEffects_0 (ref), l_enqueueTask_0 (ref), v16 (ref), v20 (ref), v41 (copy)
                        local v42 = false;
                        while l_flushPassiveEffects_0() do
                            v42 = true;
                        end;
                        v42 = l_enqueueTask_0;
                        if type(task.delay) == "table" then
                            v42 = function(v43) --[[ Line: 84 ]]
                                -- upvalues: v16 (ref)
                                return v16(0, v43);
                            end;
                        end;
                        v42(function() --[[ Line: 88 ]]
                            -- upvalues: l_flushPassiveEffects_0 (ref), v20 (ref), v41 (ref)
                            local v44 = false;
                            while l_flushPassiveEffects_0() do
                                v44 = true;
                            end;
                            if v44 then
                                v20(v41);
                                return;
                            else
                                v41();
                                return;
                            end;
                        end);
                    end);
                    if not l_status_2 then
                        v41(l_result_2);
                    end;
                    return;
                end;
            end, function(v47) --[[ Line: 192 ]]
                -- upvalues: v27 (ref), l_IsSomeRendererActing_0 (ref), l_current_0 (ref), l_IsThisRendererActing_0 (ref), l_current_1 (ref), l_v27_0 (ref), l_console_0 (ref), v39 (copy)
                v27 = v27 - 1;
                l_IsSomeRendererActing_0.current = l_current_0;
                l_IsThisRendererActing_0.current = l_current_1;
                if _G.__DEV__ and l_v27_0 < v27 then
                    l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                end;
                v39(v47);
            end);
        end);
    else
        if _G.__DEV__ and v34 ~= nil then
            l_console_0.error("The callback passed to act(...) function " .. "must return undefined, or a Promise. You returned %s", v34);
        end;
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 210 ]]
            -- upvalues: v27 (ref), v17 (ref), l_current_0 (copy), l_flushPassiveEffects_0 (ref), l_IsSomeRendererActing_0 (ref), l_IsThisRendererActing_0 (ref), l_current_1 (copy), l_v27_0 (copy), l_console_0 (ref)
            if v27 == 1 and (v17 == false or l_current_0 == false) then
                local v48 = false;
                while l_flushPassiveEffects_0() do
                    v48 = true;
                end;
            end;
            v27 = v27 - 1;
            l_IsSomeRendererActing_0.current = l_current_0;
            l_IsThisRendererActing_0.current = l_current_1;
            if _G.__DEV__ and l_v27_0 < v27 then
                l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
            end;
        end);
        if not l_status_3 then
            v27 = v27 - 1;
            l_IsSomeRendererActing_0.current = l_current_0;
            l_IsThisRendererActing_0.current = l_current_1;
            if _G.__DEV__ and l_v27_0 < v27 then
                l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
            end;
            error(l_result_3);
        end;
        return {
            andThen = function(_, v52) --[[ Line: 228 ]] --[[ Name: andThen ]]
                -- upvalues: l_console_0 (ref)
                if _G.__DEV__ then
                    l_console_0.error("Do not await the result of calling act(...) with sync logic, it is not a Promise.");
                end;
                v52();
            end
        };
    end;
end;
return v5;