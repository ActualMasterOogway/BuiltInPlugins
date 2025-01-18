local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local l_clearInterval_0 = v1.clearInterval;
local l_clearTimeout_0 = v1.clearTimeout;
local l_setInterval_0 = v1.setInterval;
local l_setTimeout_0 = v1.setTimeout;
local v9 = require(l_Parent_0.Promise);
local v10 = require(script.Parent.jsHelpers.isCallable);
local v11 = require(script.Parent.jsHelpers.typeError);
local _ = require(script.Parent.types["wait-for"]);
local v13 = {};
local v14 = require(script.Parent.helpers);
local _ = v14.getWindowFromNode;
local l_getDocument_0 = v14.getDocument;
local l_jestFakeTimersAreEnabled_0 = v14.jestFakeTimersAreEnabled;
local l_checkContainerType_0 = v14.checkContainerType;
local v19 = require(script.Parent.config);
local l_getConfig_0 = v19.getConfig;
local l_runWithExpensiveErrorDiagnosticsDisabled_0 = v19.runWithExpensiveErrorDiagnosticsDisabled;
local function _(v22, v23) --[[ Line: 37 ]] --[[ Name: copyStackTrace ]]
    v22.stack = if v23.stack then v23.stack:gsub(v23.message, v22.message) else v22.message;
end;
local function v90(v25, v26) --[[ Line: 41 ]] --[[ Name: waitFor ]]
    -- upvalues: l_getDocument_0 (copy), l_getConfig_0 (copy), v10 (copy), v11 (copy), v9 (copy), l_jestFakeTimersAreEnabled_0 (copy), l_clearTimeout_0 (copy), l_clearInterval_0 (copy), l_Boolean_0 (copy), l_Error_0 (copy), l_setTimeout_0 (copy), l_runWithExpensiveErrorDiagnosticsDisabled_0 (copy), l_Parent_0 (copy), l_checkContainerType_0 (copy), l_setInterval_0 (copy)
    local v27 = if v26.container == nil then l_getDocument_0() else v26.container;
    local v28 = if v26.timeout == nil then l_getConfig_0().asyncUtilTimeout else v26.timeout;
    local v29 = if v26.showOriginalStackTrace == nil then l_getConfig_0().showOriginalStackTrace else v26.showOriginalStackTrace;
    local l_stackTraceError_0 = v26.stackTraceError;
    local v31 = v26.interval == nil and 50 or v26.interval;
    local v33 = v26.onTimeout == nil and function(v32) --[[ Line: 49 ]]
        -- upvalues: l_getConfig_0 (ref), v27 (copy)
        v32.message = l_getConfig_0().getElementError(v32.message, v27).message;
        return v32;
    end or v26.onTimeout;
    local _ = if v26.mutationObserverOptions == nil then {
        subtree = true, 
        childList = true, 
        attributes = true, 
        characterData = true
    } else v26.mutationObserverOptions;
    if not v10(v25) then
        error(v11.new("Received `callback` arg must be a function"));
    end;
    return v9.new(function(v35, v36) --[[ Line: 61 ]]
        -- upvalues: l_jestFakeTimersAreEnabled_0 (ref), l_clearTimeout_0 (ref), l_clearInterval_0 (ref), l_Boolean_0 (ref), v29 (copy), l_stackTraceError_0 (copy), l_Error_0 (ref), v33 (copy), l_setTimeout_0 (ref), v28 (copy), l_runWithExpensiveErrorDiagnosticsDisabled_0 (ref), v25 (copy), v10 (ref), l_Parent_0 (ref), l_getConfig_0 (ref), v31 (copy), v9 (ref), l_checkContainerType_0 (ref), v27 (copy), l_setInterval_0 (ref)
        local v37 = nil;
        local v38 = nil;
        local _ = nil;
        local v40 = false;
        local v41 = "idle";
        local v42 = l_jestFakeTimersAreEnabled_0();
        local v43 = {};
        local v44 = nil;
        local function v48(v45, v46) --[[ Line: 74 ]] --[[ Name: onDone ]]
            -- upvalues: v40 (ref), l_clearTimeout_0 (ref), v44 (ref), v42 (copy), l_clearInterval_0 (ref), v38 (ref), v43 (ref), l_Boolean_0 (ref), v36 (copy), v35 (copy)
            v40 = true;
            l_clearTimeout_0(v44);
            if not v42 then
                l_clearInterval_0(v38);
                for v47 = 1, #v43 do
                    v43[v47]:Disconnect();
                end;
                v43 = {};
            end;
            if l_Boolean_0.toJSBoolean(v45) then
                v36(v45);
                return;
            else
                v35(v46);
                return;
            end;
        end;
        v44 = l_setTimeout_0(function() --[[ Line: 96 ]] --[[ Name: handleTimeout ]]
            -- upvalues: l_Boolean_0 (ref), v37 (ref), v29 (ref), l_stackTraceError_0 (ref), l_Error_0 (ref), v48 (copy), v33 (ref)
            local v49 = nil;
            if l_Boolean_0.toJSBoolean(v37) then
                v49 = v37;
                if not v29 and v49.name == "TestingLibraryElementError" then
                    local l_v49_0 = v49;
                    local l_l_stackTraceError_0_0 = l_stackTraceError_0;
                    l_v49_0.stack = if l_l_stackTraceError_0_0.stack then l_l_stackTraceError_0_0.stack:gsub(l_l_stackTraceError_0_0.message, l_v49_0.message) else l_v49_0.message;
                end;
            else
                v49 = l_Error_0.new("Timed out in waitFor.");
                if not v29 then
                    local l_v49_1 = v49;
                    local l_l_stackTraceError_0_1 = l_stackTraceError_0;
                    l_v49_1.stack = if l_l_stackTraceError_0_1.stack then l_l_stackTraceError_0_1.stack:gsub(l_l_stackTraceError_0_1.message, l_v49_1.message) else l_v49_1.message;
                end;
            end;
            v48(v33(v49), nil);
        end, v28);
        local function v59() --[[ Line: 114 ]] --[[ Name: checkCallback ]]
            -- upvalues: v41 (ref), l_runWithExpensiveErrorDiagnosticsDisabled_0 (ref), v25 (ref), v10 (ref), v48 (copy), v37 (ref)
            if v41 == "pending" then
                return;
            else
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 119 ]]
                    -- upvalues: l_runWithExpensiveErrorDiagnosticsDisabled_0 (ref), v25 (ref), v10 (ref), v41 (ref), v48 (ref), v37 (ref)
                    local v54 = l_runWithExpensiveErrorDiagnosticsDisabled_0(v25);
                    if v10(if typeof(v54) == "table" then v54.andThen else nil) then
                        v41 = "pending";
                        v54:andThen(function(v55) --[[ Line: 123 ]]
                            -- upvalues: v41 (ref), v48 (ref)
                            v41 = "resolved";
                            v48(nil, v55);
                        end, function(v56) --[[ Line: 126 ]]
                            -- upvalues: v41 (ref), v37 (ref)
                            v41 = "rejected";
                            v37 = v56;
                        end);
                        return;
                    else
                        v48(nil, v54);
                        return;
                    end;
                end);
                if not l_status_0 then
                    v37 = l_result_0;
                end;
                return;
            end;
        end;
        local function v62() --[[ Line: 141 ]] --[[ Name: checkRealTimersCallback ]]
            -- upvalues: l_jestFakeTimersAreEnabled_0 (ref), l_Error_0 (ref), v29 (ref), l_stackTraceError_0 (ref), v36 (copy), v59 (copy)
            if l_jestFakeTimersAreEnabled_0() then
                local v60 = l_Error_0.new("Changed from using real timers to fake timers while using waitFor. This is not allowed and will result in very strange behavior. Please ensure you're awaiting all async things your test is doing before changing to fake timers. For more info, please go to https://github.com/testing-library/dom-testing-library/issues/830");
                if not v29 then
                    local l_l_stackTraceError_0_2 = l_stackTraceError_0;
                    v60.stack = if l_l_stackTraceError_0_2.stack then l_l_stackTraceError_0_2.stack:gsub(l_l_stackTraceError_0_2.message, v60.message) else v60.message;
                end;
                return v36(v60);
            else
                return v59();
            end;
        end;
        if v42 then
            local l_jest_0 = require(l_Parent_0.JestGlobals).jest;
            local l_unstable_advanceTimersWrapper_0 = l_getConfig_0().unstable_advanceTimersWrapper;
            if v41 ~= "pending" then
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 119 ]]
                    -- upvalues: l_runWithExpensiveErrorDiagnosticsDisabled_0 (ref), v25 (ref), v10 (ref), v41 (ref), v48 (copy), v37 (ref)
                    local v65 = l_runWithExpensiveErrorDiagnosticsDisabled_0(v25);
                    if v10(if typeof(v65) == "table" then v65.andThen else nil) then
                        v41 = "pending";
                        v65:andThen(function(v66) --[[ Line: 123 ]]
                            -- upvalues: v41 (ref), v48 (ref)
                            v41 = "resolved";
                            v48(nil, v66);
                        end, function(v67) --[[ Line: 126 ]]
                            -- upvalues: v41 (ref), v37 (ref)
                            v41 = "rejected";
                            v37 = v67;
                        end);
                        return;
                    else
                        v48(nil, v65);
                        return;
                    end;
                end);
                if not l_status_1 then
                    v37 = l_result_1;
                end;
            end;
            while not v40 do
                if not l_jestFakeTimersAreEnabled_0() then
                    local v70 = l_Error_0.new("Changed from using fake timers to real timers while using waitFor. This is not allowed and will result in very strange behavior. Please ensure you're awaiting all async things your test is doing before changing to real timers. For more info, please go to https://github.com/testing-library/dom-testing-library/issues/830");
                    if not v29 then
                        local l_l_stackTraceError_0_3 = l_stackTraceError_0;
                        v70.stack = if l_l_stackTraceError_0_3.stack then l_l_stackTraceError_0_3.stack:gsub(l_l_stackTraceError_0_3.message, v70.message) else v70.message;
                    end;
                    v36(v70);
                    return;
                else
                    l_unstable_advanceTimersWrapper_0(function() --[[ Line: 183 ]]
                        -- upvalues: l_jest_0 (copy), v31 (ref)
                        l_jest_0.advanceTimersByTime(v31);
                        task.defer(coroutine.running());
                        coroutine.yield();
                    end);
                    if v41 ~= "pending" then
                        local l_status_2, l_result_2 = pcall(function() --[[ Line: 119 ]]
                            -- upvalues: l_runWithExpensiveErrorDiagnosticsDisabled_0 (ref), v25 (ref), v10 (ref), v41 (ref), v48 (copy), v37 (ref)
                            local v72 = l_runWithExpensiveErrorDiagnosticsDisabled_0(v25);
                            if v10(if typeof(v72) == "table" then v72.andThen else nil) then
                                v41 = "pending";
                                v72:andThen(function(v73) --[[ Line: 123 ]]
                                    -- upvalues: v41 (ref), v48 (ref)
                                    v41 = "resolved";
                                    v48(nil, v73);
                                end, function(v74) --[[ Line: 126 ]]
                                    -- upvalues: v41 (ref), v37 (ref)
                                    v41 = "rejected";
                                    v37 = v74;
                                end);
                                return;
                            else
                                v48(nil, v72);
                                return;
                            end;
                        end);
                        if not l_status_2 then
                            v37 = l_result_2;
                        end;
                    end;
                    if not v40 then
                        l_unstable_advanceTimersWrapper_0(function() --[[ Line: 207 ]]
                            -- upvalues: v9 (ref), l_setTimeout_0 (ref), l_jest_0 (copy)
                            return v9.resolve():andThen(function() --[[ Line: 208 ]]
                                -- upvalues: v9 (ref), l_setTimeout_0 (ref), l_jest_0 (ref)
                                v9.new(function(v77) --[[ Line: 209 ]]
                                    -- upvalues: l_setTimeout_0 (ref), l_jest_0 (ref)
                                    l_setTimeout_0(v77, 0);
                                    pcall(l_jest_0.advanceTimersByTime, 0);
                                end):expect();
                            end);
                        end):expect();
                    else
                        break;
                    end;
                end;
            end;
        else
            local l_status_3, l_result_3 = pcall(l_checkContainerType_0, v27);
            if not l_status_3 then
                v36(l_result_3);
                return;
            else
                v38 = l_setInterval_0(v62, v31);
                local function v80(v81, v82) --[[ Line: 237 ]] --[[ Name: observeDescendantsAddedRemoved ]]
                    -- upvalues: v43 (ref), v80 (copy)
                    table.insert(v43, v81.ChildAdded:Connect(function(v83) --[[ Line: 240 ]]
                        -- upvalues: v80 (ref), v82 (copy)
                        v80(v83, v82);
                        v82();
                    end));
                    table.insert(v43, v81.ChildRemoved:Connect(function(_) --[[ Line: 248 ]]
                        -- upvalues: v82 (copy)
                        v82();
                    end));
                end;
                v80(v27, v62);
                if v41 ~= "pending" then
                    local l_status_4, l_result_4 = pcall(function() --[[ Line: 119 ]]
                        -- upvalues: l_runWithExpensiveErrorDiagnosticsDisabled_0 (ref), v25 (ref), v10 (ref), v41 (ref), v48 (copy), v37 (ref)
                        local v85 = l_runWithExpensiveErrorDiagnosticsDisabled_0(v25);
                        if v10(if typeof(v85) == "table" then v85.andThen else nil) then
                            v41 = "pending";
                            v85:andThen(function(v86) --[[ Line: 123 ]]
                                -- upvalues: v41 (ref), v48 (ref)
                                v41 = "resolved";
                                v48(nil, v86);
                            end, function(v87) --[[ Line: 126 ]]
                                -- upvalues: v41 (ref), v37 (ref)
                                v41 = "rejected";
                                v37 = v87;
                            end);
                            return;
                        else
                            v48(nil, v85);
                            return;
                        end;
                    end);
                    if not l_status_4 then
                        v37 = l_result_4;
                    end;
                end;
            end;
        end;
    end);
end;
v13.waitFor = function(v91, v92) --[[ Line: 263 ]] --[[ Name: waitForWrapper ]]
    -- upvalues: l_Error_0 (copy), l_getConfig_0 (copy), v90 (copy), l_Object_0 (copy)
    local v93 = l_Error_0.new("STACK_TRACE_MESSAGE");
    return l_getConfig_0().asyncWrapper(function() --[[ Line: 267 ]]
        -- upvalues: v90 (ref), v91 (copy), l_Object_0 (ref), v93 (copy), v92 (copy)
        return v90(v91, l_Object_0.assign({}, {
            stackTraceError = v93
        }, v92));
    end);
end;
return v13;