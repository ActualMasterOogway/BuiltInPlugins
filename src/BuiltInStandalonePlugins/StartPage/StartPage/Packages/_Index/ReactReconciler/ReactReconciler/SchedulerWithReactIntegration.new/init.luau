local l_Parent_0 = script.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local _ = require(script.Parent.ReactInternalTypes);
local v3 = require(l_Parent_0.Scheduler);
local l_decoupleUpdatePriorityFromScheduler_0 = require(l_Parent_0.Shared).ReactFeatureFlags.decoupleUpdatePriorityFromScheduler;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local v7 = require(script.Parent.ReactFiberLane);
local l_SyncLanePriority_0 = v7.SyncLanePriority;
local l_getCurrentUpdateLanePriority_0 = v7.getCurrentUpdateLanePriority;
local l_setCurrentUpdateLanePriority_0 = v7.setCurrentUpdateLanePriority;
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
local v23 = require(script.Parent["ReactFiberSchedulerPriorities.roblox"]);
local l_ImmediatePriority_0 = v23.ImmediatePriority;
local l_UserBlockingPriority_0 = v23.UserBlockingPriority;
local l_NormalPriority_0 = v23.NormalPriority;
local l_LowPriority_0 = v23.LowPriority;
local l_IdlePriority_0 = v23.IdlePriority;
local l_NoPriority_0 = v23.NoPriority;
local v30 = nil;
local v31 = {};
local v32 = nil;
v32 = if l_unstable_requestPaint_0 ~= nil then l_unstable_requestPaint_0 else function() --[[ Line: 93 ]]

end;
local v33 = nil;
local v34 = nil;
local v35 = false;
local v36 = l_unstable_now_0();
local function v37() --[[ Line: 117 ]] --[[ Name: now ]]
    -- upvalues: l_unstable_now_0 (copy), v36 (copy)
    return l_unstable_now_0() - v36;
end;
local function v39() --[[ Line: 121 ]] --[[ Name: getCurrentPriorityLevel ]]
    -- upvalues: l_unstable_getCurrentPriorityLevel_0 (copy), l_unstable_ImmediatePriority_0 (copy), l_ImmediatePriority_0 (copy), l_unstable_UserBlockingPriority_0 (copy), l_UserBlockingPriority_0 (copy), l_unstable_NormalPriority_0 (copy), l_NormalPriority_0 (copy), l_unstable_LowPriority_0 (copy), l_LowPriority_0 (copy), l_unstable_IdlePriority_0 (copy), l_IdlePriority_0 (copy), l_invariant_0 (copy), l_NoPriority_0 (copy)
    local v38 = l_unstable_getCurrentPriorityLevel_0();
    if v38 == l_unstable_ImmediatePriority_0 then
        return l_ImmediatePriority_0;
    elseif v38 == l_unstable_UserBlockingPriority_0 then
        return l_UserBlockingPriority_0;
    elseif v38 == l_unstable_NormalPriority_0 then
        return l_NormalPriority_0;
    elseif v38 == l_unstable_LowPriority_0 then
        return l_LowPriority_0;
    elseif v38 == l_unstable_IdlePriority_0 then
        return l_IdlePriority_0;
    else
        l_invariant_0(false, "Unknown priority level.");
        return l_NoPriority_0;
    end;
end;
reactPriorityToSchedulerPriority = function(v40) --[[ Line: 140 ]] --[[ Name: reactPriorityToSchedulerPriority ]]
    -- upvalues: l_ImmediatePriority_0 (copy), l_unstable_ImmediatePriority_0 (copy), l_UserBlockingPriority_0 (copy), l_unstable_UserBlockingPriority_0 (copy), l_NormalPriority_0 (copy), l_unstable_NormalPriority_0 (copy), l_LowPriority_0 (copy), l_unstable_LowPriority_0 (copy), l_IdlePriority_0 (copy), l_unstable_IdlePriority_0 (copy), l_invariant_0 (copy)
    if v40 == l_ImmediatePriority_0 then
        return l_unstable_ImmediatePriority_0;
    elseif v40 == l_UserBlockingPriority_0 then
        return l_unstable_UserBlockingPriority_0;
    elseif v40 == l_NormalPriority_0 then
        return l_unstable_NormalPriority_0;
    elseif v40 == l_LowPriority_0 then
        return l_unstable_LowPriority_0;
    elseif v40 == l_IdlePriority_0 then
        return l_unstable_IdlePriority_0;
    else
        l_invariant_0(false, "Unknown priority level.");
        return nil;
    end;
end;
local function v44(v41, v42) --[[ Line: 159 ]] --[[ Name: runWithPriority ]]
    -- upvalues: l_unstable_runWithPriority_0 (copy)
    local v43 = reactPriorityToSchedulerPriority(v41);
    return l_unstable_runWithPriority_0(v43, v42);
end;
local function v49(v45, v46, v47) --[[ Line: 167 ]] --[[ Name: scheduleCallback ]]
    -- upvalues: l_unstable_scheduleCallback_0 (copy)
    local v48 = reactPriorityToSchedulerPriority(v45);
    return l_unstable_scheduleCallback_0(v48, v46, v47);
end;
local function v51(v50) --[[ Line: 176 ]] --[[ Name: scheduleSyncCallback ]]
    -- upvalues: v33 (ref), v34 (ref), l_unstable_scheduleCallback_0 (copy), l_unstable_ImmediatePriority_0 (copy), v30 (ref), v31 (copy)
    if v33 == nil then
        v33 = {
            v50
        };
        v34 = l_unstable_scheduleCallback_0(l_unstable_ImmediatePriority_0, v30);
    else
        table.insert(v33, v50);
    end;
    return v31;
end;
local function v53(v52) --[[ Line: 195 ]] --[[ Name: cancelCallback ]]
    -- upvalues: v31 (copy), l_unstable_cancelCallback_0 (copy)
    if v52 ~= v31 then
        l_unstable_cancelCallback_0(v52);
    end;
end;
local function v55() --[[ Line: 201 ]] --[[ Name: flushSyncCallbackQueue ]]
    -- upvalues: v34 (ref), l_unstable_cancelCallback_0 (copy), v30 (ref)
    if v34 ~= nil then
        local l_v34_0 = v34;
        v34 = nil;
        l_unstable_cancelCallback_0(l_v34_0);
    end;
    return v30();
end;
v30 = function() --[[ Line: 210 ]]
    -- upvalues: v35 (ref), v33 (ref), l_decoupleUpdatePriorityFromScheduler_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), l_SyncLanePriority_0 (copy), v44 (copy), l_describeError_0 (copy), l_ImmediatePriority_0 (copy), l_unstable_runWithPriority_0 (copy), l_Array_0 (copy), l_unstable_scheduleCallback_0 (copy), l_unstable_ImmediatePriority_0 (copy), v55 (copy)
    if not v35 and v33 ~= nil then
        v35 = true;
        local v56 = 1;
        if l_decoupleUpdatePriorityFromScheduler_0 then
            local v57 = l_getCurrentUpdateLanePriority_0();
            local v58 = true;
            local v59 = nil;
            if not _G.__YOLO__ then
                local l_v33_0 = v33;
                l_setCurrentUpdateLanePriority_0(l_SyncLanePriority_0);
                local v63, v64 = xpcall(v44, l_describeError_0, l_ImmediatePriority_0, function() --[[ Line: 231 ]]
                    -- upvalues: l_v33_0 (copy), v56 (ref)
                    for v61, v62 in l_v33_0 do
                        v56 = v61;
                        repeat
                            v62 = v62(true);
                        until v62 == nil;
                    end;
                end);
                v58 = v63;
                v59 = v64;
                v33 = nil;
            else
                v58 = true;
                local l_v33_1 = v33;
                l_setCurrentUpdateLanePriority_0(l_SyncLanePriority_0);
                local l_l_ImmediatePriority_0_0 = l_ImmediatePriority_0;
                local function v69() --[[ Line: 249 ]]
                    -- upvalues: l_v33_1 (copy), v56 (ref)
                    for v67, v68 in l_v33_1 do
                        v56 = v67;
                        repeat
                            v68 = v68(true);
                        until v68 == nil;
                        v56 = v56 + 1;
                    end;
                end;
                local v70 = reactPriorityToSchedulerPriority(l_l_ImmediatePriority_0_0);
                local _ = l_unstable_runWithPriority_0(v70, v69);
                v33 = nil;
            end;
            l_setCurrentUpdateLanePriority_0(v57);
            v35 = false;
            if not v58 then
                if v33 ~= nil then
                    v33 = l_Array_0.slice(v33, v56 + 1);
                end;
                l_unstable_scheduleCallback_0(l_unstable_ImmediatePriority_0, v55);
                error(v59);
            end;
        else
            local v72 = nil;
            local v73 = nil;
            if not _G.__YOLO__ then
                local l_v33_2 = v33;
                local v77, v78 = xpcall(v44, l_describeError_0, l_ImmediatePriority_0, function() --[[ Line: 291 ]]
                    -- upvalues: l_v33_2 (copy), v56 (ref)
                    for v75, v76 in l_v33_2 do
                        v56 = v75;
                        repeat
                            v76 = v76(true);
                        until v76 == nil;
                    end;
                end);
                v72 = v77;
                v73 = v78;
                v33 = nil;
            else
                v72 = true;
                local l_v33_3 = v33;
                local l_l_ImmediatePriority_0_1 = l_ImmediatePriority_0;
                local function v83() --[[ Line: 307 ]]
                    -- upvalues: l_v33_3 (copy), v56 (ref)
                    for v81, v82 in l_v33_3 do
                        v56 = v81;
                        repeat
                            v82 = v82(true);
                        until v82 == nil;
                    end;
                end;
                local v84 = reactPriorityToSchedulerPriority(l_l_ImmediatePriority_0_1);
                local _ = l_unstable_runWithPriority_0(v84, v83);
                v33 = nil;
            end;
            v35 = false;
            if not v72 then
                if v33 ~= nil then
                    v33 = l_Array_0.slice(v33, v56 + 1);
                end;
                l_unstable_scheduleCallback_0(l_unstable_ImmediatePriority_0, v55);
                error(v73);
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
    getCurrentPriorityLevel = v39, 
    flushSyncCallbackQueue = v55, 
    runWithPriority = v44, 
    scheduleCallback = v49, 
    scheduleSyncCallback = v51, 
    cancelCallback = v53, 
    now = v37, 
    requestPaint = v32, 
    shouldYield = l_unstable_shouldYield_0
};