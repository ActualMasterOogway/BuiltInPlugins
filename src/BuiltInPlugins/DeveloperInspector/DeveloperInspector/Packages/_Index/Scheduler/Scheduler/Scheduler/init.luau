return function(v0) --[[ Line: 12 ]]
    local v1 = require(script.Parent.SchedulerFeatureFlags);
    local l_enableSchedulerDebugging_0 = v1.enableSchedulerDebugging;
    local l_enableProfiling_0 = v1.enableProfiling;
    local v4 = v0 or require(script.Parent.SchedulerHostConfig);
    local l_requestHostCallback_0 = v4.requestHostCallback;
    local l_requestHostTimeout_0 = v4.requestHostTimeout;
    local l_cancelHostTimeout_0 = v4.cancelHostTimeout;
    local l_shouldYieldToHost_0 = v4.shouldYieldToHost;
    local l_getCurrentTime_0 = v4.getCurrentTime;
    local l_forceFrameRate_0 = v4.forceFrameRate;
    local l_requestPaint_0 = v4.requestPaint;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local function _(v15, v16) --[[ Line: 40 ]]
        -- upvalues: v13 (ref)
        local v17 = #v15 + 1;
        v15[v17] = v16;
        v13(v15, v16, v17);
    end;
    local function _(v19) --[[ Line: 47 ]]
        return v19[1];
    end;
    local function _(v21) --[[ Line: 51 ]]
        -- upvalues: v14 (ref)
        local v22 = v21[1];
        if v22 ~= nil then
            local v23 = v21[#v21];
            v21[#v21] = nil;
            if v23 ~= v22 then
                v21[1] = v23;
                v14(v21, v23, 1);
            end;
            return v22;
        else
            return nil;
        end;
    end;
    v13 = function(v25, v26, v27) --[[ Line: 67 ]]
        -- upvalues: v12 (ref)
        while true do
            local v28 = math.floor(v27 / 2);
            local v29 = v25[v28];
            if v29 ~= nil and v12(v29, v26) > 0 then
                v25[v28] = v26;
                v25[v27] = v29;
                v27 = v28;
            else
                break;
            end;
        end;
    end;
    v14 = function(v30, v31, v32) --[[ Line: 83 ]]
        -- upvalues: v12 (ref)
        local v33 = #v30;
        while true do
            if v32 < v33 then
                local v34 = v32 * 2;
                local v35 = v30[v34];
                local v36 = v34 + 1;
                local v37 = v30[v36];
                if v35 ~= nil and v12(v35, v31) < 0 then
                    if v37 ~= nil and v12(v37, v35) < 0 then
                        v30[v32] = v37;
                        v30[v36] = v31;
                        v32 = v36;
                    else
                        v30[v32] = v35;
                        v30[v34] = v31;
                        v32 = v34;
                    end;
                elseif v37 ~= nil and v12(v37, v31) < 0 then
                    v30[v32] = v37;
                    v30[v36] = v31;
                    v32 = v36;
                else
                    return;
                end;
            else
                return;
            end;
        end;
    end;
    v12 = function(v38, v39) --[[ Line: 113 ]]
        local v40 = v38.sortIndex - v39.sortIndex;
        if v40 == 0 then
            return v38.id - v39.id;
        else
            return v40;
        end;
    end;
    local v41 = require(script.Parent.SchedulerPriorities);
    local l_ImmediatePriority_0 = v41.ImmediatePriority;
    local l_UserBlockingPriority_0 = v41.UserBlockingPriority;
    local l_NormalPriority_0 = v41.NormalPriority;
    local l_LowPriority_0 = v41.LowPriority;
    local l_IdlePriority_0 = v41.IdlePriority;
    local v47 = require(script.Parent.SchedulerProfiling);
    local l_markTaskRun_0 = v47.markTaskRun;
    local l_markTaskYield_0 = v47.markTaskYield;
    local l_markTaskCompleted_0 = v47.markTaskCompleted;
    local l_markTaskCanceled_0 = v47.markTaskCanceled;
    local l_markTaskErrored_0 = v47.markTaskErrored;
    local l_markSchedulerSuspended_0 = v47.markSchedulerSuspended;
    local l_markSchedulerUnsuspended_0 = v47.markSchedulerUnsuspended;
    local l_markTaskStart_0 = v47.markTaskStart;
    local l_stopLoggingProfilingEvents_0 = v47.stopLoggingProfilingEvents;
    local l_startLoggingProfilingEvents_0 = v47.startLoggingProfilingEvents;
    local v58 = {};
    local v59 = {};
    local v60 = 1;
    local v61 = false;
    local v62 = nil;
    local l_l_NormalPriority_0_0 = l_NormalPriority_0;
    local v64 = false;
    local v65 = false;
    local v66 = false;
    local v67 = nil;
    local v68 = nil;
    local v69 = nil;
    local function v79(v70) --[[ Line: 180 ]] --[[ Name: advanceTimers ]]
        -- upvalues: v59 (copy), v14 (ref), v58 (copy), v13 (ref), l_enableProfiling_0 (copy), l_markTaskStart_0 (copy)
        local v71 = v59[1];
        while true do
            if v71 ~= nil then
                if v71.callback == nil then
                    local l_v59_0 = v59;
                    local v73 = l_v59_0[1];
                    if v73 ~= nil then
                        local v74 = l_v59_0[#l_v59_0];
                        l_v59_0[#l_v59_0] = nil;
                        if v74 ~= v73 then
                            l_v59_0[1] = v74;
                            v14(l_v59_0, v74, 1);
                        end;
                    end;
                elseif v71.startTime <= v70 then
                    local l_v59_1 = v59;
                    local v76 = l_v59_1[1];
                    if v76 ~= nil then
                        local v77 = l_v59_1[#l_v59_1];
                        l_v59_1[#l_v59_1] = nil;
                        if v77 ~= v76 then
                            l_v59_1[1] = v77;
                            v14(l_v59_1, v77, 1);
                        end;
                    end;
                    v71.sortIndex = v71.expirationTime;
                    l_v59_1 = v58;
                    v76 = v71;
                    local v78 = #l_v59_1 + 1;
                    l_v59_1[v78] = v76;
                    v13(l_v59_1, v76, v78);
                    if l_enableProfiling_0 then
                        l_markTaskStart_0(v71, v70);
                        v71.isQueued = true;
                    end;
                else
                    return;
                end;
                v71 = v59[1];
            else
                return;
            end;
        end;
    end;
    v67 = function(v80) --[[ Line: 206 ]]
        -- upvalues: v66 (ref), v79 (copy), v65 (ref), v58 (copy), l_requestHostCallback_0 (copy), v68 (ref), v59 (copy), l_requestHostTimeout_0 (copy), v67 (ref)
        v66 = false;
        v79(v80);
        if not v65 then
            if v58[1] ~= nil then
                v65 = true;
                l_requestHostCallback_0(v68);
                return;
            else
                local v81 = v59[1];
                if v81 ~= nil then
                    l_requestHostTimeout_0(v67, v81.startTime - v80);
                end;
            end;
        end;
    end;
    v68 = function(v82, v83) --[[ Line: 223 ]]
        -- upvalues: l_enableProfiling_0 (copy), l_markSchedulerUnsuspended_0 (copy), v65 (ref), v66 (ref), l_cancelHostTimeout_0 (copy), v64 (ref), l_l_NormalPriority_0_0 (ref), v69 (ref), v62 (ref), l_getCurrentTime_0 (copy), l_markTaskErrored_0 (copy), l_markSchedulerSuspended_0 (copy)
        if l_enableProfiling_0 then
            l_markSchedulerUnsuspended_0(v83);
        end;
        v65 = false;
        if v66 then
            v66 = false;
            l_cancelHostTimeout_0();
        end;
        v64 = true;
        local l_l_l_NormalPriority_0_0_0 = l_l_NormalPriority_0_0;
        local v85 = nil;
        local v86 = nil;
        if not _G.__YOLO__ then
            if l_enableProfiling_0 then
                local l_status_0, l_result_0 = pcall(v69, v82, v83);
                v85 = l_status_0;
                v86 = l_result_0;
                if not v85 and v62 ~= nil then
                    l_status_0 = l_getCurrentTime_0();
                    l_markTaskErrored_0(v62, l_status_0);
                    v62.isQueued = false;
                end;
            else
                v85 = true;
                v86 = v69(v82, v83);
            end;
        else
            v85 = true;
            v86 = v69(v82, v83);
        end;
        v62 = nil;
        l_l_NormalPriority_0_0 = l_l_l_NormalPriority_0_0_0;
        v64 = false;
        if l_enableProfiling_0 then
            local v89 = l_getCurrentTime_0();
            l_markSchedulerSuspended_0(v89);
        end;
        if not v85 then
            error(v86);
        end;
        return v86;
    end;
    v69 = function(v90, v91) --[[ Line: 279 ]]
        -- upvalues: v79 (copy), v62 (ref), v58 (copy), l_enableSchedulerDebugging_0 (copy), v61 (ref), l_shouldYieldToHost_0 (copy), l_l_NormalPriority_0_0 (ref), l_markTaskRun_0 (copy), l_getCurrentTime_0 (copy), l_markTaskYield_0 (copy), l_enableProfiling_0 (copy), l_markTaskCompleted_0 (copy), v14 (ref), v59 (copy), l_requestHostTimeout_0 (copy), v67 (ref)
        local l_v91_0 = v91;
        v79(l_v91_0);
        v62 = v58[1];
        while v62 ~= nil and (not l_enableSchedulerDebugging_0 or not v61) and (l_v91_0 >= v62.expirationTime or v90 and not l_shouldYieldToHost_0()) do
            local l_callback_0 = v62.callback;
            if typeof(l_callback_0) == "function" then
                v62.callback = nil;
                l_l_NormalPriority_0_0 = v62.priorityLevel;
                local v94 = v62.expirationTime <= l_v91_0;
                l_markTaskRun_0(v62, l_v91_0);
                local v95 = l_callback_0(v94);
                l_v91_0 = l_getCurrentTime_0();
                if typeof(v95) == "function" then
                    v62.callback = v95;
                    l_markTaskYield_0(v62, l_v91_0);
                else
                    if l_enableProfiling_0 then
                        l_markTaskCompleted_0(v62, l_v91_0);
                        v62.isQueued = false;
                    end;
                    if v62 == v58[1] then
                        local l_v58_0 = v58;
                        local v97 = l_v58_0[1];
                        if v97 ~= nil then
                            local v98 = l_v58_0[#l_v58_0];
                            l_v58_0[#l_v58_0] = nil;
                            if v98 ~= v97 then
                                l_v58_0[1] = v98;
                                v14(l_v58_0, v98, 1);
                            end;
                        end;
                    end;
                end;
                v79(l_v91_0);
            else
                local l_v58_1 = v58;
                local v100 = l_v58_1[1];
                if v100 ~= nil then
                    local v101 = l_v58_1[#l_v58_1];
                    l_v58_1[#l_v58_1] = nil;
                    if v101 ~= v100 then
                        l_v58_1[1] = v101;
                        v14(l_v58_1, v101, 1);
                    end;
                end;
            end;
            v62 = v58[1];
        end;
        if v62 ~= nil then
            return true;
        else
            local v102 = v59[1];
            if v102 ~= nil then
                l_requestHostTimeout_0(v67, v102.startTime - l_v91_0);
            end;
            return false;
        end;
    end;
    local function v110(v103, v104) --[[ Line: 337 ]] --[[ Name: unstable_runWithPriority ]]
        -- upvalues: l_ImmediatePriority_0 (copy), l_UserBlockingPriority_0 (copy), l_NormalPriority_0 (copy), l_LowPriority_0 (copy), l_IdlePriority_0 (copy), l_l_NormalPriority_0_0 (ref)
        if v103 ~= l_ImmediatePriority_0 and v103 ~= l_UserBlockingPriority_0 and v103 ~= l_NormalPriority_0 and v103 ~= l_LowPriority_0 and v103 ~= l_IdlePriority_0 then
            v103 = l_NormalPriority_0;
        end;
        local l_l_l_NormalPriority_0_0_1 = l_l_NormalPriority_0_0;
        l_l_NormalPriority_0_0 = v103;
        local v106 = nil;
        local v107 = nil;
        if not _G.__YOLO__ then
            local l_status_1, l_result_1 = pcall(v104);
            v106 = l_status_1;
            v107 = l_result_1;
        else
            v106 = true;
            v107 = v104();
        end;
        l_l_NormalPriority_0_0 = l_l_l_NormalPriority_0_0_1;
        if not v106 then
            error(v107);
        end;
        return v107;
    end;
    local function v118(v111) --[[ Line: 372 ]] --[[ Name: unstable_next ]]
        -- upvalues: l_l_NormalPriority_0_0 (ref), l_ImmediatePriority_0 (copy), l_UserBlockingPriority_0 (copy), l_NormalPriority_0 (copy)
        local v112 = nil;
        v112 = if not (l_l_NormalPriority_0_0 ~= l_ImmediatePriority_0 and l_l_NormalPriority_0_0 ~= l_UserBlockingPriority_0) or l_l_NormalPriority_0_0 == l_NormalPriority_0 then l_NormalPriority_0 else l_l_NormalPriority_0_0;
        local l_l_l_NormalPriority_0_0_2 = l_l_NormalPriority_0_0;
        l_l_NormalPriority_0_0 = v112;
        local v114 = nil;
        local v115 = nil;
        if not _G.__YOLO__ then
            local l_status_2, l_result_2 = pcall(v111);
            v114 = l_status_2;
            v115 = l_result_2;
        else
            v114 = true;
            v115 = v111();
        end;
        l_l_NormalPriority_0_0 = l_l_l_NormalPriority_0_0_2;
        if not v114 then
            error(v115);
        end;
        return v115;
    end;
    local function v126(v119) --[[ Line: 408 ]] --[[ Name: unstable_wrapCallback ]]
        -- upvalues: l_l_NormalPriority_0_0 (ref)
        local l_l_l_NormalPriority_0_0_3 = l_l_NormalPriority_0_0;
        return function(...) --[[ Line: 411 ]]
            -- upvalues: l_l_NormalPriority_0_0 (ref), l_l_l_NormalPriority_0_0_3 (copy), v119 (copy)
            local l_l_l_NormalPriority_0_0_4 = l_l_NormalPriority_0_0;
            l_l_NormalPriority_0_0 = l_l_l_NormalPriority_0_0_3;
            local v122 = nil;
            local v123 = nil;
            if not _G.__YOLO__ then
                local l_status_3, l_result_3 = pcall(v119, ...);
                v122 = l_status_3;
                v123 = l_result_3;
            else
                v122 = true;
                v123 = v119(...);
            end;
            l_l_NormalPriority_0_0 = l_l_l_NormalPriority_0_0_4;
            if not v122 then
                error(v123);
            end;
            return v123;
        end;
    end;
    local function v140(v127, v128, v129) --[[ Line: 436 ]] --[[ Name: unstable_scheduleCallback ]]
        -- upvalues: l_getCurrentTime_0 (copy), l_ImmediatePriority_0 (copy), l_UserBlockingPriority_0 (copy), l_IdlePriority_0 (copy), l_LowPriority_0 (copy), v60 (ref), l_enableProfiling_0 (copy), v59 (copy), v13 (ref), v58 (copy), v66 (ref), l_cancelHostTimeout_0 (copy), l_requestHostTimeout_0 (copy), v67 (ref), l_markTaskStart_0 (copy), v65 (ref), v64 (ref), l_requestHostCallback_0 (copy), v68 (ref)
        local v130 = l_getCurrentTime_0();
        local v131 = nil;
        if typeof(v129) == "table" then
            local l_delay_0 = v129.delay;
            v131 = if typeof(l_delay_0) == "number" and l_delay_0 > 0 then v130 + l_delay_0 else v130;
        else
            v131 = v130;
        end;
        local _ = nil;
        local v134 = v131 + (v127 == l_ImmediatePriority_0 and -1 or v127 == l_UserBlockingPriority_0 and 250 or v127 == l_IdlePriority_0 and 1073741823 or v127 == l_LowPriority_0 and 10000 or 5000);
        local v135 = {
            id = v60, 
            callback = v128, 
            priorityLevel = v127, 
            startTime = v131, 
            expirationTime = v134, 
            sortIndex = -1
        };
        v60 = v60 + 1;
        if l_enableProfiling_0 then
            v135.isQueued = false;
        end;
        if v130 < v131 then
            v135.sortIndex = v131;
            local l_v59_2 = v59;
            local v137 = #l_v59_2 + 1;
            l_v59_2[v137] = v135;
            v13(l_v59_2, v135, v137);
            if #v58 == 0 and v135 == v59[1] then
                if v66 then
                    l_cancelHostTimeout_0();
                else
                    v66 = true;
                end;
                l_requestHostTimeout_0(v67, v131 - v130);
                return v135;
            end;
        else
            v135.sortIndex = v134;
            local l_v58_2 = v58;
            local v139 = #l_v58_2 + 1;
            l_v58_2[v139] = v135;
            v13(l_v58_2, v135, v139);
            if l_enableProfiling_0 then
                l_markTaskStart_0(v135, v130);
                v135.isQueued = true;
            end;
            if not v65 and not v64 then
                v65 = true;
                l_requestHostCallback_0(v68);
            end;
        end;
        return v135;
    end;
    local function v141() --[[ Line: 516 ]] --[[ Name: unstable_pauseExecution ]]
        -- upvalues: v61 (ref)
        v61 = true;
    end;
    local function v142() --[[ Line: 520 ]] --[[ Name: unstable_continueExecution ]]
        -- upvalues: v61 (ref), v65 (ref), v64 (ref), l_requestHostCallback_0 (copy), v68 (ref)
        v61 = false;
        if not v65 and not v64 then
            v65 = true;
            l_requestHostCallback_0(v68);
        end;
    end;
    local function v143() --[[ Line: 528 ]] --[[ Name: unstable_getFirstCallbackNode ]]
        -- upvalues: v58 (copy)
        return v58[1];
    end;
    local function v146(v144) --[[ Line: 532 ]] --[[ Name: unstable_cancelCallback ]]
        -- upvalues: l_enableProfiling_0 (copy), l_getCurrentTime_0 (copy), l_markTaskCanceled_0 (copy)
        if l_enableProfiling_0 and v144.isQueued then
            local v145 = l_getCurrentTime_0();
            l_markTaskCanceled_0(v144, v145);
            v144.isQueued = false;
        end;
        v144.callback = nil;
    end;
    local function v147() --[[ Line: 547 ]] --[[ Name: unstable_getCurrentPriorityLevel ]]
        -- upvalues: l_l_NormalPriority_0_0 (ref)
        return l_l_NormalPriority_0_0;
    end;
    return {
        getJestMatchers = require(script.Parent["getJestMatchers.roblox"]), 
        unstable_ImmediatePriority = l_ImmediatePriority_0, 
        unstable_UserBlockingPriority = l_UserBlockingPriority_0, 
        unstable_NormalPriority = l_NormalPriority_0, 
        unstable_IdlePriority = l_IdlePriority_0, 
        unstable_LowPriority = l_LowPriority_0, 
        unstable_runWithPriority = v110, 
        unstable_next = v118, 
        unstable_scheduleCallback = v140, 
        unstable_cancelCallback = v146, 
        unstable_wrapCallback = v126, 
        unstable_getCurrentPriorityLevel = v147, 
        unstable_shouldYield = l_shouldYieldToHost_0, 
        unstable_requestPaint = l_requestPaint_0, 
        unstable_continueExecution = v142, 
        unstable_pauseExecution = v141, 
        unstable_getFirstCallbackNode = v143, 
        unstable_now = l_getCurrentTime_0, 
        unstable_forceFrameRate = l_forceFrameRate_0, 
        unstable_Profiling = if l_enableProfiling_0 then {
            startLoggingProfilingEvents = l_startLoggingProfilingEvents_0, 
            stopLoggingProfilingEvents = l_stopLoggingProfilingEvents_0
        } else nil
    };
end;