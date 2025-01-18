local l_Parent_0 = script.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local _ = require(script.Parent.ReactInternalTypes);
local v3 = require(l_Parent_0.Scheduler);
local l_decoupleUpdatePriorityFromScheduler_0 = require(l_Parent_0.Shared).ReactFeatureFlags.decoupleUpdatePriorityFromScheduler;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local v6 = require(script.Parent.ReactFiberLane);
local l_SyncLanePriority_0 = v6.SyncLanePriority;
local l_getCurrentUpdateLanePriority_0 = v6.getCurrentUpdateLanePriority;
local l_setCurrentUpdateLanePriority_0 = v6.setCurrentUpdateLanePriority;
local l_unstable_runWithPriority_0 = v3.unstable_runWithPriority;
local l_unstable_scheduleCallback_0 = v3.unstable_scheduleCallback;
local l_unstable_cancelCallback_0 = v3.unstable_cancelCallback;
local l_unstable_shouldYield_0 = v3.unstable_shouldYield;
local l_unstable_requestPaint_0 = v3.unstable_requestPaint;
local l_unstable_now_0 = v3.unstable_now;
local l_unstable_getCurrentPriorityLevel_0 = v3.unstable_getCurrentPriorityLevel;
local l_unstable_ImmediatePriority_0 = v3.unstable_ImmediatePriority;
local l_unstable_UserBlockingPriority_0 = v3.unstable_UserBlockingPriority;
local l_unstable_NormalPriority_0 = v3.unstable_NormalPriority;
local l_unstable_LowPriority_0 = v3.unstable_LowPriority;
local l_unstable_IdlePriority_0 = v3.unstable_IdlePriority;
local v22 = require(script.Parent["ReactFiberSchedulerPriorities.roblox"]);
local l_ImmediatePriority_0 = v22.ImmediatePriority;
local l_UserBlockingPriority_0 = v22.UserBlockingPriority;
local l_NormalPriority_0 = v22.NormalPriority;
local l_LowPriority_0 = v22.LowPriority;
local l_IdlePriority_0 = v22.IdlePriority;
local l_NoPriority_0 = v22.NoPriority;
local v29 = nil;
local v30 = {};
local v31 = nil;
v31 = if l_unstable_requestPaint_0 ~= nil then l_unstable_requestPaint_0 else function() --[[ Line: 90 ]]

end;
local v32 = nil;
local v33 = nil;
local v34 = false;
local v35 = l_unstable_now_0();
local function v36() --[[ Line: 114 ]] --[[ Name: now ]]
    -- upvalues: l_unstable_now_0 (copy), v35 (copy)
    return l_unstable_now_0() - v35;
end;
local function v38() --[[ Line: 118 ]] --[[ Name: getCurrentPriorityLevel ]]
    -- upvalues: l_unstable_getCurrentPriorityLevel_0 (copy), l_unstable_ImmediatePriority_0 (copy), l_ImmediatePriority_0 (copy), l_unstable_UserBlockingPriority_0 (copy), l_UserBlockingPriority_0 (copy), l_unstable_NormalPriority_0 (copy), l_NormalPriority_0 (copy), l_unstable_LowPriority_0 (copy), l_LowPriority_0 (copy), l_unstable_IdlePriority_0 (copy), l_IdlePriority_0 (copy), l_invariant_0 (copy), l_NoPriority_0 (copy)
    local v37 = l_unstable_getCurrentPriorityLevel_0();
    if v37 == l_unstable_ImmediatePriority_0 then
        return l_ImmediatePriority_0;
    elseif v37 == l_unstable_UserBlockingPriority_0 then
        return l_UserBlockingPriority_0;
    elseif v37 == l_unstable_NormalPriority_0 then
        return l_NormalPriority_0;
    elseif v37 == l_unstable_LowPriority_0 then
        return l_LowPriority_0;
    elseif v37 == l_unstable_IdlePriority_0 then
        return l_IdlePriority_0;
    else
        l_invariant_0(false, "Unknown priority level.");
        return l_NoPriority_0;
    end;
end;
reactPriorityToSchedulerPriority = function(v39) --[[ Line: 137 ]] --[[ Name: reactPriorityToSchedulerPriority ]]
    -- upvalues: l_ImmediatePriority_0 (copy), l_unstable_ImmediatePriority_0 (copy), l_UserBlockingPriority_0 (copy), l_unstable_UserBlockingPriority_0 (copy), l_NormalPriority_0 (copy), l_unstable_NormalPriority_0 (copy), l_LowPriority_0 (copy), l_unstable_LowPriority_0 (copy), l_IdlePriority_0 (copy), l_unstable_IdlePriority_0 (copy), l_invariant_0 (copy)
    if v39 == l_ImmediatePriority_0 then
        return l_unstable_ImmediatePriority_0;
    elseif v39 == l_UserBlockingPriority_0 then
        return l_unstable_UserBlockingPriority_0;
    elseif v39 == l_NormalPriority_0 then
        return l_unstable_NormalPriority_0;
    elseif v39 == l_LowPriority_0 then
        return l_unstable_LowPriority_0;
    elseif v39 == l_IdlePriority_0 then
        return l_unstable_IdlePriority_0;
    else
        l_invariant_0(false, "Unknown priority level.");
        return nil;
    end;
end;
local function v43(v40, v41) --[[ Line: 156 ]] --[[ Name: runWithPriority ]]
    -- upvalues: l_unstable_runWithPriority_0 (copy)
    local v42 = reactPriorityToSchedulerPriority(v40);
    return l_unstable_runWithPriority_0(v42, v41);
end;
local function v48(v44, v45, v46) --[[ Line: 164 ]] --[[ Name: scheduleCallback ]]
    -- upvalues: l_unstable_scheduleCallback_0 (copy)
    local v47 = reactPriorityToSchedulerPriority(v44);
    return l_unstable_scheduleCallback_0(v47, v45, v46);
end;
local function v50(v49) --[[ Line: 173 ]] --[[ Name: scheduleSyncCallback ]]
    -- upvalues: v32 (ref), v33 (ref), l_unstable_scheduleCallback_0 (copy), l_unstable_ImmediatePriority_0 (copy), v29 (ref), v30 (copy)
    if v32 == nil then
        v32 = {
            v49
        };
        v33 = l_unstable_scheduleCallback_0(l_unstable_ImmediatePriority_0, v29);
    else
        table.insert(v32, v49);
    end;
    return v30;
end;
local function v52(v51) --[[ Line: 192 ]] --[[ Name: cancelCallback ]]
    -- upvalues: v30 (copy), l_unstable_cancelCallback_0 (copy)
    if v51 ~= v30 then
        l_unstable_cancelCallback_0(v51);
    end;
end;
local function v54() --[[ Line: 198 ]] --[[ Name: flushSyncCallbackQueue ]]
    -- upvalues: v33 (ref), l_unstable_cancelCallback_0 (copy), v29 (ref)
    if v33 ~= nil then
        local l_v33_0 = v33;
        v33 = nil;
        l_unstable_cancelCallback_0(l_v33_0);
    end;
    return v29();
end;
v29 = function() --[[ Line: 207 ]]
    -- upvalues: v34 (ref), v32 (ref), l_decoupleUpdatePriorityFromScheduler_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), l_SyncLanePriority_0 (copy), v43 (copy), l_ImmediatePriority_0 (copy), l_unstable_runWithPriority_0 (copy), l_Array_0 (copy), l_unstable_scheduleCallback_0 (copy), l_unstable_ImmediatePriority_0 (copy), v54 (copy)
    if not v34 and v32 ~= nil then
        v34 = true;
        local v55 = 1;
        if l_decoupleUpdatePriorityFromScheduler_0 then
            local v56 = l_getCurrentUpdateLanePriority_0();
            local v57 = true;
            local v58 = nil;
            if not _G.__YOLO__ then
                local l_v32_0 = v32;
                l_setCurrentUpdateLanePriority_0(l_SyncLanePriority_0);
                local l_status_0, l_result_0 = pcall(v43, l_ImmediatePriority_0, function() --[[ Line: 225 ]]
                    -- upvalues: l_v32_0 (copy), v55 (ref)
                    for v60, v61 in ipairs(l_v32_0) do
                        v55 = v60;
                        repeat
                            v61 = v61(true);
                        until v61 == nil;
                    end;
                end);
                v57 = l_status_0;
                v58 = l_result_0;
                v32 = nil;
            else
                v57 = true;
                local l_v32_1 = v32;
                l_setCurrentUpdateLanePriority_0(l_SyncLanePriority_0);
                local l_l_ImmediatePriority_0_0 = l_ImmediatePriority_0;
                local function v68() --[[ Line: 243 ]]
                    -- upvalues: l_v32_1 (copy), v55 (ref)
                    for v66, v67 in ipairs(l_v32_1) do
                        v55 = v66;
                        repeat
                            v67 = v67(true);
                        until v67 == nil;
                        v55 = v55 + 1;
                    end;
                end;
                local v69 = reactPriorityToSchedulerPriority(l_l_ImmediatePriority_0_0);
                local _ = l_unstable_runWithPriority_0(v69, v68);
                v32 = nil;
            end;
            l_setCurrentUpdateLanePriority_0(v56);
            v34 = false;
            if not v57 then
                if v32 ~= nil then
                    v32 = l_Array_0.slice(v32, v55 + 1);
                end;
                l_unstable_scheduleCallback_0(l_unstable_ImmediatePriority_0, v54);
                error(v58);
            end;
        else
            local v71 = nil;
            local v72 = nil;
            if not _G.__YOLO__ then
                local l_v32_2 = v32;
                local l_status_1, l_result_1 = pcall(v43, l_ImmediatePriority_0, function() --[[ Line: 282 ]]
                    -- upvalues: l_v32_2 (copy), v55 (ref)
                    for v74, v75 in ipairs(l_v32_2) do
                        v55 = v74;
                        repeat
                            v75 = v75(true);
                        until v75 == nil;
                    end;
                end);
                v71 = l_status_1;
                v72 = l_result_1;
                v32 = nil;
            else
                v71 = true;
                local l_v32_3 = v32;
                local l_l_ImmediatePriority_0_1 = l_ImmediatePriority_0;
                local function v82() --[[ Line: 298 ]]
                    -- upvalues: l_v32_3 (copy), v55 (ref)
                    for v80, v81 in ipairs(l_v32_3) do
                        v55 = v80;
                        repeat
                            v81 = v81(true);
                        until v81 == nil;
                    end;
                end;
                local v83 = reactPriorityToSchedulerPriority(l_l_ImmediatePriority_0_1);
                local _ = l_unstable_runWithPriority_0(v83, v82);
                v32 = nil;
            end;
            v34 = false;
            if not v71 then
                if v32 ~= nil then
                    v32 = l_Array_0.slice(v32, v55 + 1);
                end;
                l_unstable_scheduleCallback_0(l_unstable_ImmediatePriority_0, v54);
                error(v72);
            end;
        end;
        return true;
    else
        return false;
    end;
end;
return {
    ImmediatePriority = l_ImmediatePriority_0, 
    UserBlockingPriority = l_UserBlockingPriority_0, 
    NormalPriority = l_NormalPriority_0, 
    LowPriority = l_LowPriority_0, 
    IdlePriority = l_IdlePriority_0, 
    NoPriority = l_NoPriority_0, 
    getCurrentPriorityLevel = v38, 
    flushSyncCallbackQueue = v54, 
    runWithPriority = v43, 
    scheduleCallback = v48, 
    scheduleSyncCallback = v50, 
    cancelCallback = v52, 
    now = v36, 
    requestPaint = v31, 
    shouldYield = l_unstable_shouldYield_0
};