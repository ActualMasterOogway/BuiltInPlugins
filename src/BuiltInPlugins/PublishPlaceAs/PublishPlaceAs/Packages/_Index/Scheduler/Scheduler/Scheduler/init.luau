return function(v0) --[[ Line: 12 ]]
    local l_Parent_0 = script.Parent.Parent;
    local l_describeError_0 = require(l_Parent_0.Shared).describeError;
    local v3 = require(script.Parent.SchedulerFeatureFlags);
    local l_enableSchedulerDebugging_0 = v3.enableSchedulerDebugging;
    local l_enableProfiling_0 = v3.enableProfiling;
    local v6 = v0 or require(script.Parent.SchedulerHostConfig);
    local l_requestHostCallback_0 = v6.requestHostCallback;
    local l_requestHostTimeout_0 = v6.requestHostTimeout;
    local l_cancelHostTimeout_0 = v6.cancelHostTimeout;
    local l_shouldYieldToHost_0 = v6.shouldYieldToHost;
    local l_getCurrentTime_0 = v6.getCurrentTime;
    local l_forceFrameRate_0 = v6.forceFrameRate;
    local l_requestPaint_0 = v6.requestPaint;
    local v14 = nil;
    local v15 = nil;
    local v16 = nil;
    local function _(v17, v18) --[[ Line: 43 ]]
        -- upvalues: v15 (ref)
        local v19 = #v17 + 1;
        v17[v19] = v18;
        v15(v17, v18, v19);
    end;
    local function _(v21) --[[ Line: 50 ]]
        return v21[1];
    end;
    local function _(v23) --[[ Line: 54 ]]
        -- upvalues: v16 (ref)
        local v24 = v23[1];
        if v24 ~= nil then
            local v25 = v23[#v23];
            v23[#v23] = nil;
            if v25 ~= v24 then
                v23[1] = v25;
                v16(v23, v25, 1);
            end;
            return v24;
        else
            return nil;
        end;
    end;
    v15 = function(v27, v28, v29) --[[ Line: 70 ]]
        -- upvalues: v14 (ref)
        while true do
            local v30 = math.floor(v29 / 2);
            local v31 = v27[v30];
            if v31 ~= nil and v14(v31, v28) > 0 then
                v27[v30] = v28;
                v27[v29] = v31;
                v29 = v30;
            else
                break;
            end;
        end;
    end;
    v16 = function(v32, v33, v34) --[[ Line: 86 ]]
        -- upvalues: v14 (ref)
        local v35 = #v32;
        while true do
            if v34 < v35 then
                local v36 = v34 * 2;
                local v37 = v32[v36];
                local v38 = v36 + 1;
                local v39 = v32[v38];
                if v37 ~= nil and v14(v37, v33) < 0 then
                    if v39 ~= nil and v14(v39, v37) < 0 then
                        v32[v34] = v39;
                        v32[v38] = v33;
                        v34 = v38;
                    else
                        v32[v34] = v37;
                        v32[v36] = v33;
                        v34 = v36;
                    end;
                elseif v39 ~= nil and v14(v39, v33) < 0 then
                    v32[v34] = v39;
                    v32[v38] = v33;
                    v34 = v38;
                else
                    return;
                end;
            else
                return;
            end;
        end;
    end;
    v14 = function(v40, v41) --[[ Line: 116 ]]
        local v42 = v40.sortIndex - v41.sortIndex;
        if v42 == 0 then
            return v40.id - v41.id;
        else
            return v42;
        end;
    end;
    local v43 = require(script.Parent.SchedulerPriorities);
    local l_ImmediatePriority_0 = v43.ImmediatePriority;
    local l_UserBlockingPriority_0 = v43.UserBlockingPriority;
    local l_NormalPriority_0 = v43.NormalPriority;
    local l_LowPriority_0 = v43.LowPriority;
    local l_IdlePriority_0 = v43.IdlePriority;
    local v49 = require(script.Parent.SchedulerProfiling);
    local l_markTaskRun_0 = v49.markTaskRun;
    local l_markTaskYield_0 = v49.markTaskYield;
    local l_markTaskCompleted_0 = v49.markTaskCompleted;
    local l_markTaskCanceled_0 = v49.markTaskCanceled;
    local l_markTaskErrored_0 = v49.markTaskErrored;
    local l_markSchedulerSuspended_0 = v49.markSchedulerSuspended;
    local l_markSchedulerUnsuspended_0 = v49.markSchedulerUnsuspended;
    local l_markTaskStart_0 = v49.markTaskStart;
    local l_stopLoggingProfilingEvents_0 = v49.stopLoggingProfilingEvents;
    local l_startLoggingProfilingEvents_0 = v49.startLoggingProfilingEvents;
    local v60 = {};
    local v61 = {};
    local v62 = 1;
    local v63 = false;
    local v64 = nil;
    local l_l_NormalPriority_0_0 = l_NormalPriority_0;
    local v66 = false;
    local v67 = false;
    local v68 = false;
    local v69 = nil;
    local v70 = nil;
    local v71 = nil;
    local function v81(v72) --[[ Line: 183 ]] --[[ Name: advanceTimers ]]
        -- upvalues: v61 (copy), v16 (ref), v60 (copy), v15 (ref), l_enableProfiling_0 (copy), l_markTaskStart_0 (copy)
        local v73 = v61[1];
        while true do
            if v73 ~= nil then
                if v73.callback == nil then
                    local l_v61_0 = v61;
                    local v75 = l_v61_0[1];
                    if v75 ~= nil then
                        local v76 = l_v61_0[#l_v61_0];
                        l_v61_0[#l_v61_0] = nil;
                        if v76 ~= v75 then
                            l_v61_0[1] = v76;
                            v16(l_v61_0, v76, 1);
                        end;
                    end;
                elseif v73.startTime <= v72 then
                    local l_v61_1 = v61;
                    local v78 = l_v61_1[1];
                    if v78 ~= nil then
                        local v79 = l_v61_1[#l_v61_1];
                        l_v61_1[#l_v61_1] = nil;
                        if v79 ~= v78 then
                            l_v61_1[1] = v79;
                            v16(l_v61_1, v79, 1);
                        end;
                    end;
                    v73.sortIndex = v73.expirationTime;
                    l_v61_1 = v60;
                    v78 = v73;
                    local v80 = #l_v61_1 + 1;
                    l_v61_1[v80] = v78;
                    v15(l_v61_1, v78, v80);
                    if l_enableProfiling_0 then
                        l_markTaskStart_0(v73, v72);
                        v73.isQueued = true;
                    end;
                else
                    return;
                end;
                v73 = v61[1];
            else
                return;
            end;
        end;
    end;
    v69 = function(v82) --[[ Line: 209 ]]
        -- upvalues: v68 (ref), v81 (copy), v67 (ref), v60 (copy), l_requestHostCallback_0 (copy), v70 (ref), v61 (copy), l_requestHostTimeout_0 (copy), v69 (ref)
        v68 = false;
        v81(v82);
        if not v67 then
            if v60[1] ~= nil then
                v67 = true;
                l_requestHostCallback_0(v70);
                return;
            else
                local v83 = v61[1];
                if v83 ~= nil then
                    l_requestHostTimeout_0(v69, v83.startTime - v82);
                end;
            end;
        end;
    end;
    v70 = function(v84, v85) --[[ Line: 226 ]]
        -- upvalues: l_enableProfiling_0 (copy), l_markSchedulerUnsuspended_0 (copy), v67 (ref), v68 (ref), l_cancelHostTimeout_0 (copy), v66 (ref), l_l_NormalPriority_0_0 (ref), v71 (ref), l_describeError_0 (copy), v64 (ref), l_getCurrentTime_0 (copy), l_markTaskErrored_0 (copy), l_markSchedulerSuspended_0 (copy)
        if l_enableProfiling_0 then
            l_markSchedulerUnsuspended_0(v85);
        end;
        v67 = false;
        if v68 then
            v68 = false;
            l_cancelHostTimeout_0();
        end;
        v66 = true;
        local l_l_l_NormalPriority_0_0_0 = l_l_NormalPriority_0_0;
        local v87 = nil;
        local v88 = nil;
        if not _G.__YOLO__ then
            if l_enableProfiling_0 then
                local v89, v90 = xpcall(v71, l_describeError_0, v84, v85);
                v87 = v89;
                v88 = v90;
                if not v87 and v64 ~= nil then
                    v89 = l_getCurrentTime_0();
                    l_markTaskErrored_0(v64, v89);
                    v64.isQueued = false;
                end;
            else
                v87 = true;
                v88 = v71(v84, v85);
            end;
        else
            v87 = true;
            v88 = v71(v84, v85);
        end;
        v64 = nil;
        l_l_NormalPriority_0_0 = l_l_l_NormalPriority_0_0_0;
        v66 = false;
        if l_enableProfiling_0 then
            local v91 = l_getCurrentTime_0();
            l_markSchedulerSuspended_0(v91);
        end;
        if not v87 then
            error(v88);
        end;
        return v88;
    end;
    v71 = function(v92, v93) --[[ Line: 283 ]]
        -- upvalues: v81 (copy), v64 (ref), v60 (copy), l_enableSchedulerDebugging_0 (copy), v63 (ref), l_shouldYieldToHost_0 (copy), l_l_NormalPriority_0_0 (ref), l_markTaskRun_0 (copy), l_getCurrentTime_0 (copy), l_markTaskYield_0 (copy), l_enableProfiling_0 (copy), l_markTaskCompleted_0 (copy), v16 (ref), v61 (copy), l_requestHostTimeout_0 (copy), v69 (ref)
        local l_v93_0 = v93;
        v81(l_v93_0);
        v64 = v60[1];
        while v64 ~= nil and (not l_enableSchedulerDebugging_0 or not v63) and (l_v93_0 >= v64.expirationTime or v92 and not l_shouldYieldToHost_0()) do
            local l_callback_0 = v64.callback;
            if typeof(l_callback_0) == "function" then
                v64.callback = nil;
                l_l_NormalPriority_0_0 = v64.priorityLevel;
                local v96 = v64.expirationTime <= l_v93_0;
                l_markTaskRun_0(v64, l_v93_0);
                local v97 = l_callback_0(v96);
                l_v93_0 = l_getCurrentTime_0();
                if typeof(v97) == "function" then
                    v64.callback = v97;
                    l_markTaskYield_0(v64, l_v93_0);
                else
                    if l_enableProfiling_0 then
                        l_markTaskCompleted_0(v64, l_v93_0);
                        v64.isQueued = false;
                    end;
                    if v64 == v60[1] then
                        local l_v60_0 = v60;
                        local v99 = l_v60_0[1];
                        if v99 ~= nil then
                            local v100 = l_v60_0[#l_v60_0];
                            l_v60_0[#l_v60_0] = nil;
                            if v100 ~= v99 then
                                l_v60_0[1] = v100;
                                v16(l_v60_0, v100, 1);
                            end;
                        end;
                    end;
                end;
                v81(l_v93_0);
            else
                local l_v60_1 = v60;
                local v102 = l_v60_1[1];
                if v102 ~= nil then
                    local v103 = l_v60_1[#l_v60_1];
                    l_v60_1[#l_v60_1] = nil;
                    if v103 ~= v102 then
                        l_v60_1[1] = v103;
                        v16(l_v60_1, v103, 1);
                    end;
                end;
            end;
            v64 = v60[1];
        end;
        if v64 ~= nil then
            return true;
        else
            local v104 = v61[1];
            if v104 ~= nil then
                l_requestHostTimeout_0(v69, v104.startTime - l_v93_0);
            end;
            return false;
        end;
    end;
    local function v112(v105, v106) --[[ Line: 340 ]] --[[ Name: unstable_runWithPriority ]]
        -- upvalues: l_ImmediatePriority_0 (copy), l_UserBlockingPriority_0 (copy), l_NormalPriority_0 (copy), l_LowPriority_0 (copy), l_IdlePriority_0 (copy), l_l_NormalPriority_0_0 (ref), l_describeError_0 (copy)
        if v105 ~= l_ImmediatePriority_0 and v105 ~= l_UserBlockingPriority_0 and v105 ~= l_NormalPriority_0 and v105 ~= l_LowPriority_0 and v105 ~= l_IdlePriority_0 then
            v105 = l_NormalPriority_0;
        end;
        local l_l_l_NormalPriority_0_0_1 = l_l_NormalPriority_0_0;
        l_l_NormalPriority_0_0 = v105;
        local v108 = nil;
        local v109 = nil;
        if not _G.__YOLO__ then
            local v110, v111 = xpcall(v106, l_describeError_0);
            v108 = v110;
            v109 = v111;
        else
            v108 = true;
            v109 = v106();
        end;
        l_l_NormalPriority_0_0 = l_l_l_NormalPriority_0_0_1;
        if not v108 then
            error(v109);
        end;
        return v109;
    end;
    local function v120(v113) --[[ Line: 375 ]] --[[ Name: unstable_next ]]
        -- upvalues: l_l_NormalPriority_0_0 (ref), l_ImmediatePriority_0 (copy), l_UserBlockingPriority_0 (copy), l_NormalPriority_0 (copy), l_describeError_0 (copy)
        local v114 = nil;
        v114 = if not (l_l_NormalPriority_0_0 ~= l_ImmediatePriority_0 and l_l_NormalPriority_0_0 ~= l_UserBlockingPriority_0) or l_l_NormalPriority_0_0 == l_NormalPriority_0 then l_NormalPriority_0 else l_l_NormalPriority_0_0;
        local l_l_l_NormalPriority_0_0_2 = l_l_NormalPriority_0_0;
        l_l_NormalPriority_0_0 = v114;
        local v116 = nil;
        local v117 = nil;
        if not _G.__YOLO__ then
            local v118, v119 = xpcall(v113, l_describeError_0);
            v116 = v118;
            v117 = v119;
        else
            v116 = true;
            v117 = v113();
        end;
        l_l_NormalPriority_0_0 = l_l_l_NormalPriority_0_0_2;
        if not v116 then
            error(v117);
        end;
        return v117;
    end;
    local function v128(v121) --[[ Line: 411 ]] --[[ Name: unstable_wrapCallback ]]
        -- upvalues: l_l_NormalPriority_0_0 (ref), l_describeError_0 (copy)
        local l_l_l_NormalPriority_0_0_3 = l_l_NormalPriority_0_0;
        return function(...) --[[ Line: 414 ]]
            -- upvalues: l_l_NormalPriority_0_0 (ref), l_l_l_NormalPriority_0_0_3 (copy), v121 (copy), l_describeError_0 (ref)
            local l_l_l_NormalPriority_0_0_4 = l_l_NormalPriority_0_0;
            l_l_NormalPriority_0_0 = l_l_l_NormalPriority_0_0_3;
            local v124 = nil;
            local v125 = nil;
            if not _G.__YOLO__ then
                local v126, v127 = xpcall(v121, l_describeError_0, ...);
                v124 = v126;
                v125 = v127;
            else
                v124 = true;
                v125 = v121(...);
            end;
            l_l_NormalPriority_0_0 = l_l_l_NormalPriority_0_0_4;
            if not v124 then
                error(v125);
            end;
            return v125;
        end;
    end;
    local function v142(v129, v130, v131) --[[ Line: 439 ]] --[[ Name: unstable_scheduleCallback ]]
        -- upvalues: l_getCurrentTime_0 (copy), l_ImmediatePriority_0 (copy), l_UserBlockingPriority_0 (copy), l_IdlePriority_0 (copy), l_LowPriority_0 (copy), v62 (ref), l_enableProfiling_0 (copy), v61 (copy), v15 (ref), v60 (copy), v68 (ref), l_cancelHostTimeout_0 (copy), l_requestHostTimeout_0 (copy), v69 (ref), l_markTaskStart_0 (copy), v67 (ref), v66 (ref), l_requestHostCallback_0 (copy), v70 (ref)
        local v132 = l_getCurrentTime_0();
        local v133 = nil;
        if typeof(v131) == "table" then
            local l_delay_0 = v131.delay;
            v133 = if typeof(l_delay_0) == "number" and l_delay_0 > 0 then v132 + l_delay_0 else v132;
        else
            v133 = v132;
        end;
        local _ = nil;
        local v136 = v133 + (v129 == l_ImmediatePriority_0 and -1 or v129 == l_UserBlockingPriority_0 and 250 or v129 == l_IdlePriority_0 and 1073741823 or v129 == l_LowPriority_0 and 10000 or 5000);
        local v137 = {
            id = v62, 
            callback = v130, 
            priorityLevel = v129, 
            startTime = v133, 
            expirationTime = v136, 
            sortIndex = -1
        };
        v62 = v62 + 1;
        if l_enableProfiling_0 then
            v137.isQueued = false;
        end;
        if v132 < v133 then
            v137.sortIndex = v133;
            local l_v61_2 = v61;
            local v139 = #l_v61_2 + 1;
            l_v61_2[v139] = v137;
            v15(l_v61_2, v137, v139);
            if #v60 == 0 and v137 == v61[1] then
                if v68 then
                    l_cancelHostTimeout_0();
                else
                    v68 = true;
                end;
                l_requestHostTimeout_0(v69, v133 - v132);
                return v137;
            end;
        else
            v137.sortIndex = v136;
            local l_v60_2 = v60;
            local v141 = #l_v60_2 + 1;
            l_v60_2[v141] = v137;
            v15(l_v60_2, v137, v141);
            if l_enableProfiling_0 then
                l_markTaskStart_0(v137, v132);
                v137.isQueued = true;
            end;
            if not v67 and not v66 then
                v67 = true;
                l_requestHostCallback_0(v70);
            end;
        end;
        return v137;
    end;
    local function v143() --[[ Line: 519 ]] --[[ Name: unstable_pauseExecution ]]
        -- upvalues: v63 (ref)
        v63 = true;
    end;
    local function v144() --[[ Line: 523 ]] --[[ Name: unstable_continueExecution ]]
        -- upvalues: v63 (ref), v67 (ref), v66 (ref), l_requestHostCallback_0 (copy), v70 (ref)
        v63 = false;
        if not v67 and not v66 then
            v67 = true;
            l_requestHostCallback_0(v70);
        end;
    end;
    local function v145() --[[ Line: 531 ]] --[[ Name: unstable_getFirstCallbackNode ]]
        -- upvalues: v60 (copy)
        return v60[1];
    end;
    local function v148(v146) --[[ Line: 535 ]] --[[ Name: unstable_cancelCallback ]]
        -- upvalues: l_enableProfiling_0 (copy), l_getCurrentTime_0 (copy), l_markTaskCanceled_0 (copy)
        if l_enableProfiling_0 and v146.isQueued then
            local v147 = l_getCurrentTime_0();
            l_markTaskCanceled_0(v146, v147);
            v146.isQueued = false;
        end;
        v146.callback = nil;
    end;
    local function v149() --[[ Line: 550 ]] --[[ Name: unstable_getCurrentPriorityLevel ]]
        -- upvalues: l_l_NormalPriority_0_0 (ref)
        return l_l_NormalPriority_0_0;
    end;
    return {
        unstable_ImmediatePriority = l_ImmediatePriority_0, 
        unstable_UserBlockingPriority = l_UserBlockingPriority_0, 
        unstable_NormalPriority = l_NormalPriority_0, 
        unstable_IdlePriority = l_IdlePriority_0, 
        unstable_LowPriority = l_LowPriority_0, 
        unstable_runWithPriority = v112, 
        unstable_next = v120, 
        unstable_scheduleCallback = v142, 
        unstable_cancelCallback = v148, 
        unstable_wrapCallback = v128, 
        unstable_getCurrentPriorityLevel = v149, 
        unstable_shouldYield = l_shouldYieldToHost_0, 
        unstable_requestPaint = l_requestPaint_0, 
        unstable_continueExecution = v144, 
        unstable_pauseExecution = v143, 
        unstable_getFirstCallbackNode = v145, 
        unstable_now = l_getCurrentTime_0, 
        unstable_forceFrameRate = l_forceFrameRate_0, 
        unstable_Profiling = if l_enableProfiling_0 then {
            startLoggingProfilingEvents = l_startLoggingProfilingEvents_0, 
            stopLoggingProfilingEvents = l_stopLoggingProfilingEvents_0
        } else nil
    };
end;