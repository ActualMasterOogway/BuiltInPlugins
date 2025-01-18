local function _(v0) --[[ Line: 12 ]] --[[ Name: unimplemented ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. v0);
    error("FIXME (roblox): " .. v0 .. " is unimplemented");
end;
local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v4.Array;
local l_Error_0 = v4.Error;
local l_Object_0 = v4.Object;
local l_createRef_0 = require(l_Parent_0.React).createRef;
local l_createBinding_0 = require(l_Parent_0.React).createBinding;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactInternalTypes);
local v13 = require(script.Parent.ReactFiberLane);
local v14 = require(script.Parent.ReactHookEffectTags);
local l_ReactSharedInternals_0 = require(l_Parent_0.Shared).ReactSharedInternals;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableDebugTracing_0 = l_ReactFeatureFlags_0.enableDebugTracing;
local l_enableSchedulingProfiler_0 = l_ReactFeatureFlags_0.enableSchedulingProfiler;
local l_enableNewReconciler_0 = l_ReactFeatureFlags_0.enableNewReconciler;
local l_enableDoubleInvokingEffects_0 = l_ReactFeatureFlags_0.enableDoubleInvokingEffects;
local l_DebugTracingMode_0 = require(script.Parent.ReactTypeOfMode).DebugTracingMode;
local l_NoLane_0 = v13.NoLane;
local l_NoLanes_0 = v13.NoLanes;
local l_isSubsetOfLanes_0 = v13.isSubsetOfLanes;
local l_mergeLanes_0 = v13.mergeLanes;
local l_removeLanes_0 = v13.removeLanes;
local l_markRootEntangled_0 = v13.markRootEntangled;
local l_markRootMutableRead_0 = v13.markRootMutableRead;
local l_readContext_0 = require(script.Parent["ReactFiberNewContext.new"]).readContext;
local v30 = require(script.Parent.ReactFiberFlags);
local l_Update_0 = v30.Update;
local l_Passive_0 = v30.Passive;
local l_PassiveStatic_0 = v30.PassiveStatic;
local l_MountLayoutDev_0 = v30.MountLayoutDev;
local l_MountPassiveDev_0 = v30.MountPassiveDev;
local l_HasEffect_0 = v14.HasEffect;
local l_Layout_0 = v14.Layout;
local l_Passive_1 = v14.Passive;
local v39 = require(script.Parent["ReactFiberWorkLoop.new"]);
local l_warnIfNotCurrentlyActingUpdatesInDEV_0 = v39.warnIfNotCurrentlyActingUpdatesInDEV;
local l_scheduleUpdateOnFiber_0 = v39.scheduleUpdateOnFiber;
local l_warnIfNotScopedWithMatchingAct_0 = v39.warnIfNotScopedWithMatchingAct;
local l_requestEventTime_0 = v39.requestEventTime;
local l_requestUpdateLane_0 = v39.requestUpdateLane;
local l_markSkippedUpdateLanes_0 = v39.markSkippedUpdateLanes;
local l_getWorkInProgressRoot_0 = v39.getWorkInProgressRoot;
local l_warnIfNotCurrentlyActingEffectsInDEV_0 = v39.warnIfNotCurrentlyActingEffectsInDEV;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local function _(v50, v51) --[[ Line: 115 ]] --[[ Name: is ]]
    return v50 == v51 and (v50 ~= 0 or 1 / v50 == 1 / v51) or v50 ~= v50 and v51 ~= v51;
end;
local l_markWorkInProgressReceivedUpdate_0 = require(script.Parent["ReactFiberBeginWork.new"]).markWorkInProgressReceivedUpdate;
local l_getIsHydrating_0 = require(script.Parent["ReactFiberHydrationContext.new"]).getIsHydrating;
local l_makeClientId_0 = require(script.Parent.ReactFiberHostConfig).makeClientId;
local v56 = require(script.Parent["ReactMutableSource.new"]);
local l_warnAboutMultipleRenderersDEV_0 = v56.warnAboutMultipleRenderersDEV;
local l_getWorkInProgressVersion_0 = v56.getWorkInProgressVersion;
local l_setWorkInProgressVersion_0 = v56.setWorkInProgressVersion;
local l_markSourceAsDirty_0 = v56.markSourceAsDirty;
local l_logStateUpdateScheduled_0 = require(script.Parent.DebugTracing).logStateUpdateScheduled;
local l_markStateUpdateScheduled_0 = require(script.Parent.SchedulingProfiler).markStateUpdateScheduled;
local l_ReactCurrentDispatcher_0 = l_ReactSharedInternals_0.ReactCurrentDispatcher;
local v64 = nil;
local v65 = nil;
if l___DEV___0 then
    v65 = {};
    v64 = {};
end;
local v66 = {};
local l_l_NoLanes_0_0 = l_NoLanes_0;
local v68 = nil;
local v69 = nil;
local v70 = nil;
local v71 = false;
local v72 = false;
local v73 = nil;
local v74 = nil;
local v75 = 0;
local v76 = nil;
local v77 = nil;
local v78 = nil;
local v79 = nil;
local v80 = nil;
local v81 = nil;
local v82 = nil;
local _ = function(v83) --[[ Line: 260 ]] --[[ Name: getHighestIndex ]]
    local v84 = 0;
    for v85, _ in v83 do
        if v84 < v85 then
            v84 = v85;
        end;
    end;
    return v84;
end;
local _ = function(v88) --[[ Line: 270 ]] --[[ Name: isArrayOrSparseArray ]]
    if type(v88) ~= "table" then
        return false;
    else
        for v89, _ in v88 do
            if type(v89) ~= "number" then
                return false;
            end;
        end;
        return true;
    end;
end;
local function _() --[[ Line: 282 ]] --[[ Name: mountHookTypesDev ]]
    -- upvalues: l___DEV___0 (copy), v73 (ref), v74 (ref)
    if l___DEV___0 then
        local l_v73_0 = v73;
        if v74 == nil then
            v74 = {
                l_v73_0
            };
            return;
        else
            table.insert(v74, l_v73_0);
        end;
    end;
end;
updateHookTypesDev = function() --[[ Line: 295 ]] --[[ Name: updateHookTypesDev ]]
    -- upvalues: l___DEV___0 (copy), v73 (ref), v74 (ref), v75 (ref)
    if l___DEV___0 then
        local l_v73_1 = v73;
        if v74 ~= nil then
            v75 = v75 + 1;
            if v74[v75] ~= l_v73_1 then
                warnOnHookMismatchInDev(l_v73_1);
            end;
        end;
    end;
end;
local _ = function(v95) --[[ Line: 309 ]] --[[ Name: checkDepsAreArrayDev ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), v73 (ref)
    local v96 = false;
    if l___DEV___0 and v95 ~= nil then
        local v97;
        if type(v95) ~= "table" then
            v97 = false;
        else
            for v98, _ in v95 do
                if type(v98) ~= "number" then
                    v97 = false;
                    v96 = true;
                end;
                if v96 then
                    break;
                end;
            end;
            if not v96 then
                v97 = true;
            end;
        end;
        v96 = false;
        if not v97 then
            l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (type(v95)));
        end;
    end;
end;
warnOnHookMismatchInDev = function(v101) --[[ Line: 324 ]] --[[ Name: warnOnHookMismatchInDev ]]
    -- upvalues: l___DEV___0 (copy), l_getComponentName_0 (copy), v68 (ref), v64 (ref), v74 (ref), v75 (ref), l_console_0 (copy)
    if l___DEV___0 then
        local v102 = l_getComponentName_0(v68.type) or "Component";
        if not v64[v102] then
            v64[v102] = true;
            if v74 ~= nil then
                local v103 = "";
                for v104 = 1, v75 do
                    local v105 = v74[v104];
                    local v106 = nil;
                    v106 = if v104 == v75 then v101 else v105;
                    local v107 = tostring(v104) .. ". " .. (v105 or "undefined");
                    while string.len(v107) < 30 do
                        v107 = v107 .. " ";
                    end;
                    v103 = v103 .. v107 .. v106 .. "\n";
                end;
                l_console_0.error("React has detected a change in the order of Hooks called by %s. " .. "This will lead to bugs and errors if not fixed. " .. "For more information, read the Rules of Hooks: https://reactjs.org/link/rules-of-hooks\n\n" .. "   Previous render            Next render\n" .. "   ------------------------------------------------------\n" .. "%s" .. "   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n", v102, v103);
            end;
        end;
    end;
end;
local function v108() --[[ Line: 376 ]] --[[ Name: throwInvalidHookError ]]
    -- upvalues: l_Error_0 (copy)
    error(l_Error_0.new("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for" .. " one of the following reasons:\n" .. "1. You might have mismatching versions of React and the renderer (such as React DOM)\n" .. "2. You might be breaking the Rules of Hooks\n" .. "3. You might have more than one copy of React in the same app\n" .. "See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem."));
end;
local function v121(v109, v110) --[[ Line: 391 ]] --[[ Name: areHookInputsEqual ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), v73 (ref)
    if l___DEV___0 then

    end;
    if v110 == nil then
        if l___DEV___0 then
            l_console_0.error("%s received a final argument during this render, but not during " .. "the previous render. Even though the final argument is optional, " .. "its type cannot change between renders.", v73);
        end;
        return false;
    else
        local v111 = 0;
        for v112, _ in v109 do
            if v111 < v112 then
                v111 = v112;
            end;
        end;
        local l_v111_0 = v111;
        local v115 = 0;
        for v116, _ in v110 do
            if v115 < v116 then
                v115 = v116;
            end;
        end;
        v111 = v115;
        if l_v111_0 ~= v111 then
            return false;
        else
            for v118 = 1, math.min(v111, l_v111_0) do
                local v119 = v109[v118];
                local v120 = v110[v118];
                if not (v119 == v120 and (v119 ~= 0 or 1 / v119 == 1 / v120) or v119 ~= v119 and v120 ~= v120) then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v66.bailoutHooks = function(v122, v123, v124) --[[ Line: 455 ]]
    -- upvalues: l___DEV___0 (copy), l_enableDoubleInvokingEffects_0 (copy), l_MountPassiveDev_0 (copy), l_Passive_0 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy), l_removeLanes_0 (copy)
    v123.updateQueue = v122.updateQueue;
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
        v123.flags = bit32.band(v123.flags, (bit32.bnot((bit32.bor(l_MountPassiveDev_0, l_Passive_0, l_MountLayoutDev_0, l_Update_0)))));
    else
        v123.flags = bit32.band(v123.flags, (bit32.bnot((bit32.bor(l_Passive_0, l_Update_0)))));
    end;
    v122.lanes = l_removeLanes_0(v122.lanes, v124);
end;
local v125 = false;
v66.resetHooksAfterThrow = function() --[[ Line: 480 ]]
    -- upvalues: l_ReactCurrentDispatcher_0 (copy), v66 (copy), v71 (ref), v68 (ref), l_l_NoLanes_0_0 (ref), l_NoLanes_0 (copy), v69 (ref), v70 (ref), l___DEV___0 (copy), v74 (ref), v75 (ref), v73 (ref), v125 (ref), v72 (ref)
    l_ReactCurrentDispatcher_0.current = v66.ContextOnlyDispatcher;
    if v71 then
        local l_memoizedState_0 = v68.memoizedState;
        while l_memoizedState_0 ~= nil do
            local l_queue_0 = l_memoizedState_0.queue;
            if l_queue_0 ~= nil then
                l_queue_0.pending = nil;
            end;
            l_memoizedState_0 = l_memoizedState_0.next;
        end;
        v71 = false;
    end;
    l_l_NoLanes_0_0 = l_NoLanes_0;
    v68 = nil;
    v69 = nil;
    v70 = nil;
    if l___DEV___0 then
        v74 = nil;
        v75 = 0;
        v73 = nil;
        v125 = false;
    end;
    v72 = false;
end;
local function _() --[[ Line: 525 ]] --[[ Name: mountWorkInProgressHook ]]
    -- upvalues: v70 (ref), v68 (ref)
    local v128 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v128;
        v70 = v128;
    else
        v70.next = v128;
        v70 = v128;
    end;
    return v70;
end;
local function v134() --[[ Line: 548 ]] --[[ Name: updateWorkInProgressHook ]]
    -- upvalues: v69 (ref), v68 (ref), v70 (ref), l_Error_0 (copy)
    local v130 = nil;
    if v69 == nil then
        local l_alternate_0 = v68.alternate;
        v130 = if l_alternate_0 ~= nil then l_alternate_0.memoizedState else nil;
    else
        v130 = v69.next;
    end;
    local v132 = nil;
    v132 = if v70 == nil then v68.memoizedState else v70.next;
    if v132 ~= nil then
        v70 = v132;
        v132 = v70.next;
        v69 = v130;
    else
        if v130 == nil then
            error(l_Error_0.new("Rendered more hooks than during the previous render."));
        end;
        v69 = v130;
        local v133 = {
            memoizedState = v69.memoizedState, 
            baseState = v69.baseState, 
            baseQueue = v69.baseQueue, 
            queue = v69.queue, 
            next = nil
        };
        if v70 == nil then
            v70 = v133;
            v68.memoizedState = v133;
        else
            v70.next = v133;
            v70 = v133;
        end;
    end;
    return v70;
end;
basicStateReducer = function(v135, v136) --[[ Line: 623 ]] --[[ Name: basicStateReducer ]]
    if type(v136) == "function" then
        return v136(v135);
    else
        return v136;
    end;
end;
mountReducer = function(v137, v138, v139) --[[ Line: 632 ]] --[[ Name: mountReducer ]]
    -- upvalues: v70 (ref), v68 (ref)
    local v140 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v140;
        v70 = v140;
    else
        v70.next = v140;
        v70 = v140;
    end;
    local l_v70_0 = v70;
    v140 = nil;
    v140 = if v139 ~= nil then v139(v138) else v138;
    l_v70_0.baseState = v140;
    l_v70_0.memoizedState = l_v70_0.baseState;
    local v142 = {
        pending = nil, 
        dispatch = nil, 
        lastRenderedReducer = v137, 
        lastRenderedState = v140
    };
    l_v70_0.queue = v142;
    local l_v68_0 = v68;
    local function v145(v144, ...) --[[ Line: 659 ]]
        -- upvalues: l_v68_0 (copy), v142 (copy)
        dispatchAction(l_v68_0, v142, v144, ...);
    end;
    v142.dispatch = v145;
    return l_v70_0.memoizedState, v145;
end;
updateReducer = function(v146, _, _) --[[ Line: 669 ]] --[[ Name: updateReducer ]]
    -- upvalues: v134 (copy), v69 (ref), l_l_NoLanes_0_0 (ref), v68 (ref), l_mergeLanes_0 (copy), l_markSkippedUpdateLanes_0 (copy), l_NoLane_0 (copy), l_markWorkInProgressReceivedUpdate_0 (copy)
    local v149 = v134();
    local l_queue_1 = v149.queue;
    assert(l_queue_1 ~= nil, "Should have a queue. This is likely a bug in React. Please file an issue.");
    l_queue_1.lastRenderedReducer = v146;
    local l_v69_0 = v69;
    local l_baseQueue_0 = l_v69_0.baseQueue;
    local l_pending_0 = l_queue_1.pending;
    if l_pending_0 ~= nil then
        if l_baseQueue_0 ~= nil then
            local l_next_0 = l_baseQueue_0.next;
            l_baseQueue_0.next = l_pending_0.next;
            l_pending_0.next = l_next_0;
        end;
        l_baseQueue_0 = l_pending_0;
        l_v69_0.baseQueue = l_baseQueue_0;
        l_queue_1.pending = nil;
    end;
    if l_baseQueue_0 ~= nil then
        local l_next_1 = l_baseQueue_0.next;
        local l_baseState_0 = l_v69_0.baseState;
        local v157 = nil;
        local v158 = nil;
        local v159 = nil;
        local l_l_next_1_0 = l_next_1;
        repeat
            local l_lane_0 = l_l_next_1_0.lane;
            if bit32.band(l_l_NoLanes_0_0, l_lane_0) ~= l_lane_0 then
                local v162 = {
                    lane = l_lane_0, 
                    action = l_l_next_1_0.action, 
                    eagerReducer = l_l_next_1_0.eagerReducer, 
                    eagerState = l_l_next_1_0.eagerState, 
                    next = nil
                };
                if v159 == nil then
                    v159 = v162;
                    v158 = v159;
                    v157 = l_baseState_0;
                else
                    v159.next = v162;
                    v159 = v159.next;
                end;
                v68.lanes = l_mergeLanes_0(v68.lanes, l_lane_0);
                l_markSkippedUpdateLanes_0(l_lane_0);
            else
                if v159 ~= nil then
                    v159.next = {
                        lane = l_NoLane_0, 
                        action = l_l_next_1_0.action, 
                        eagerReducer = l_l_next_1_0.eagerReducer, 
                        eagerState = l_l_next_1_0.eagerState, 
                        next = nil
                    };
                    v159 = v159.next;
                end;
                if l_l_next_1_0.eagerReducer == v146 then
                    l_baseState_0 = l_l_next_1_0.eagerState;
                else
                    l_baseState_0 = v146(l_baseState_0, l_l_next_1_0.action);
                end;
            end;
            l_l_next_1_0 = l_l_next_1_0.next;
        until l_l_next_1_0 == nil or l_l_next_1_0 == l_next_1;
        if v159 == nil then
            v157 = l_baseState_0;
        else
            v159.next = v158;
        end;
        local l_l_baseState_0_0 = l_baseState_0;
        local l_memoizedState_1 = v149.memoizedState;
        if not (l_l_baseState_0_0 == l_memoizedState_1 and (l_l_baseState_0_0 ~= 0 or 1 / l_l_baseState_0_0 == 1 / l_memoizedState_1) or l_l_baseState_0_0 ~= l_l_baseState_0_0 and l_memoizedState_1 ~= l_memoizedState_1) then
            l_markWorkInProgressReceivedUpdate_0();
        end;
        v149.memoizedState = l_baseState_0;
        v149.baseState = v157;
        v149.baseQueue = v159;
        l_queue_1.lastRenderedState = l_baseState_0;
    end;
    local l_dispatch_0 = l_queue_1.dispatch;
    return v149.memoizedState, l_dispatch_0;
end;
rerenderReducer = function(v166, _, _) --[[ Line: 810 ]] --[[ Name: rerenderReducer ]]
    -- upvalues: v134 (copy), l_markWorkInProgressReceivedUpdate_0 (copy)
    local v169 = v134();
    local l_queue_2 = v169.queue;
    assert(l_queue_2 ~= nil, "Should have a queue. This is likely a bug in React. Please file an issue.");
    l_queue_2.lastRenderedReducer = v166;
    local l_dispatch_1 = l_queue_2.dispatch;
    local l_pending_1 = l_queue_2.pending;
    local l_memoizedState_2 = v169.memoizedState;
    if l_pending_1 ~= nil then
        l_queue_2.pending = nil;
        local l_next_2 = l_pending_1.next;
        local l_l_next_2_0 = l_next_2;
        repeat
            l_memoizedState_2 = v166(l_memoizedState_2, l_l_next_2_0.action);
            l_l_next_2_0 = l_l_next_2_0.next;
        until l_l_next_2_0 == l_next_2;
        local l_l_memoizedState_2_0 = l_memoizedState_2;
        local l_memoizedState_3 = v169.memoizedState;
        if not (l_l_memoizedState_2_0 == l_memoizedState_3 and (l_l_memoizedState_2_0 ~= 0 or 1 / l_l_memoizedState_2_0 == 1 / l_memoizedState_3) or l_l_memoizedState_2_0 ~= l_l_memoizedState_2_0 and l_memoizedState_3 ~= l_memoizedState_3) then
            l_markWorkInProgressReceivedUpdate_0();
        end;
        v169.memoizedState = l_memoizedState_2;
        if v169.baseQueue == nil then
            v169.baseState = l_memoizedState_2;
        end;
        l_queue_2.lastRenderedState = l_memoizedState_2;
    end;
    return l_memoizedState_2, l_dispatch_1;
end;
readFromUnsubcribedMutableSource = function(v178, v179, v180) --[[ Line: 875 ]] --[[ Name: readFromUnsubcribedMutableSource ]]
    -- upvalues: l___DEV___0 (copy), l_warnAboutMultipleRenderersDEV_0 (copy), l_getWorkInProgressVersion_0 (copy), l_isSubsetOfLanes_0 (copy), l_l_NoLanes_0_0 (ref), l_setWorkInProgressVersion_0 (copy), l_console_0 (copy), l_markSourceAsDirty_0 (copy), l_Error_0 (copy)
    if l___DEV___0 then
        l_warnAboutMultipleRenderersDEV_0(v179);
    end;
    local v181 = v179._getVersion(v179._source);
    local v182 = false;
    local v183 = l_getWorkInProgressVersion_0(v179);
    if v183 ~= nil then
        v182 = v183 == v181;
    else
        v182 = l_isSubsetOfLanes_0(l_l_NoLanes_0_0, v178.mutableReadLanes);
        if v182 then
            l_setWorkInProgressVersion_0(v179, v181);
        end;
    end;
    if v182 then
        local v184 = v180(v179._source);
        if l___DEV___0 and type(v184) == "function" then
            l_console_0.error("Mutable source should not return a function as the snapshot value. " .. "Functions may close over mutable values and cause tearing.");
        end;
        return v184;
    else
        l_markSourceAsDirty_0(v179);
        error(l_Error_0.new("Cannot read from mutable source during the current render without tearing. This is a bug in React. Please file an issue."));
        return;
    end;
end;
useMutableSource = function(v185, v186, v187, v188) --[[ Line: 958 ]] --[[ Name: useMutableSource ]]
    -- upvalues: l_getWorkInProgressRoot_0 (copy), l_invariant_0 (copy), l_ReactCurrentDispatcher_0 (copy), v70 (ref), v68 (ref), l___DEV___0 (copy), l_console_0 (copy), l_requestUpdateLane_0 (copy), l_markRootMutableRead_0 (copy), l_markRootEntangled_0 (copy)
    local v189 = l_getWorkInProgressRoot_0();
    l_invariant_0(v189 ~= nil, "Expected a work-in-progress root. This is a bug in React. Please file an issue.");
    local l__getVersion_0 = v186._getVersion;
    local v191 = l__getVersion_0(v186._source);
    local l_current_0 = l_ReactCurrentDispatcher_0.current;
    assert(l_current_0 ~= nil, "dispatcher was nil, this is a bug in React");
    local v193, v194 = l_current_0.useState(function() --[[ Line: 983 ]]
        -- upvalues: v189 (copy), v186 (copy), v187 (copy)
        return readFromUnsubcribedMutableSource(v189, v186, v187);
    end);
    local l_v193_0 = v193;
    local l_v70_1 = v70;
    local l_memoizedState_4 = v185.memoizedState;
    if l_memoizedState_4.refs == nil then
        error((tostring(debug.traceback())));
    end;
    local l_refs_0 = l_memoizedState_4.refs;
    local l_getSnapshot_0 = l_refs_0.getSnapshot;
    local l_source_0 = l_memoizedState_4.source;
    local l_subscribe_0 = l_memoizedState_4.subscribe;
    local l_v68_1 = v68;
    v185.memoizedState = {
        refs = l_refs_0, 
        source = v186, 
        subscribe = v188
    };
    l_current_0.useEffect(function() --[[ Line: 1012 ]]
        -- upvalues: l_refs_0 (copy), v187 (copy), v194 (ref), l__getVersion_0 (copy), v186 (copy), v191 (copy), l___DEV___0 (ref), l_console_0 (ref), l_v193_0 (ref), l_requestUpdateLane_0 (ref), l_v68_1 (copy), l_markRootMutableRead_0 (ref), v189 (copy), l_markRootEntangled_0 (ref)
        l_refs_0.getSnapshot = v187;
        l_refs_0.setSnapshot = v194;
        local v203 = l__getVersion_0(v186._source);
        local l_v191_0 = v191;
        if not (l_v191_0 == v203 and (l_v191_0 ~= 0 or 1 / l_v191_0 == 1 / v203) or l_v191_0 ~= l_v191_0 and v203 ~= v203) then
            local v205 = v187(v186._source);
            if l___DEV___0 and type(v205) == "function" then
                l_console_0.error("Mutable source should not return a function as the snapshot value. " .. "Functions may close over mutable values and cause tearing.");
            end;
            local l_l_v193_0_0 = l_v193_0;
            if not (l_l_v193_0_0 == v205 and (l_l_v193_0_0 ~= 0 or 1 / l_l_v193_0_0 == 1 / v205) or l_l_v193_0_0 ~= l_l_v193_0_0 and v205 ~= v205) then
                v194(v205);
                l_v191_0 = l_requestUpdateLane_0(l_v68_1);
                l_markRootMutableRead_0(v189, l_v191_0);
            end;
            l_markRootEntangled_0(v189, v189.mutableReadLanes);
        end;
    end, {
        v187, 
        v186, 
        v188
    });
    l_current_0.useEffect(function() --[[ Line: 1050 ]]
        -- upvalues: l_refs_0 (copy), v186 (copy), l_requestUpdateLane_0 (ref), l_v68_1 (copy), l_markRootMutableRead_0 (ref), v189 (copy), v188 (copy), l___DEV___0 (ref), l_console_0 (ref)
        local function v212() --[[ Line: 1051 ]]
            -- upvalues: l_refs_0 (ref), v186 (ref), l_requestUpdateLane_0 (ref), l_v68_1 (ref), l_markRootMutableRead_0 (ref), v189 (ref)
            local l_getSnapshot_1 = l_refs_0.getSnapshot;
            local l_setSnapshot_0 = l_refs_0.setSnapshot;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 1056 ]]
                -- upvalues: l_setSnapshot_0 (copy), l_getSnapshot_1 (copy), v186 (ref), l_requestUpdateLane_0 (ref), l_v68_1 (ref), l_markRootMutableRead_0 (ref), v189 (ref)
                l_setSnapshot_0(l_getSnapshot_1(v186._source));
                local v209 = l_requestUpdateLane_0(l_v68_1);
                l_markRootMutableRead_0(v189, v209);
            end);
            if not l_status_0 then
                l_setSnapshot_0(function() --[[ Line: 1070 ]]
                    -- upvalues: l_result_0 (copy)
                    error(l_result_0);
                end);
            end;
        end;
        local v213 = v188(v186._source, v212);
        if l___DEV___0 and type(v213) ~= "function" then
            l_console_0.error("Mutable source subscribe function must return an unsubscribe function.");
        end;
        return v213;
    end, {
        v186, 
        v188
    });
    if (l_getSnapshot_0 ~= v187 or l_getSnapshot_0 == 0 and 1 / l_getSnapshot_0 ~= 1 / v187) and (l_getSnapshot_0 == l_getSnapshot_0 or v187 == v187) or (l_source_0 ~= v186 or l_source_0 == 0 and 1 / l_source_0 ~= 1 / v186) and (l_source_0 == l_source_0 or v186 == v186) or not (l_subscribe_0 == v188 and (l_subscribe_0 ~= 0 or 1 / l_subscribe_0 == 1 / v188) or l_subscribe_0 ~= l_subscribe_0 and v188 ~= v188) then
        local v214 = {
            pending = nil, 
            dispatch = nil, 
            lastRenderedReducer = basicStateReducer, 
            lastRenderedState = l_v193_0
        };
        local l_v68_2 = v68;
        v194 = function(...) --[[ Line: 1119 ]]
            -- upvalues: l_v68_2 (copy), v214 (copy)
            dispatchAction(l_v68_2, v214, ...);
        end;
        v214.dispatch = v194;
        l_v70_1.queue = v214;
        l_v70_1.baseQueue = nil;
        l_v193_0 = readFromUnsubcribedMutableSource(v189, v186, v187);
        l_v70_1.baseState = l_v193_0;
        l_v70_1.memoizedState = l_v70_1.baseState;
    end;
    return l_v193_0;
end;
mountMutableSource = function(v216, v217, v218) --[[ Line: 1133 ]] --[[ Name: mountMutableSource ]]
    -- upvalues: v70 (ref), v68 (ref)
    local v219 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v219;
        v70 = v219;
    else
        v70.next = v219;
        v70 = v219;
    end;
    local l_v70_2 = v70;
    l_v70_2.memoizedState = {
        refs = {
            getSnapshot = v217, 
            setSnapshot = nil
        }, 
        source = v216, 
        subscribe = v218
    };
    return useMutableSource(l_v70_2, v216, v217, v218);
end;
updateMutableSource = function(v221, v222, v223) --[[ Line: 1156 ]] --[[ Name: updateMutableSource ]]
    -- upvalues: v134 (copy)
    local v224 = v134();
    return useMutableSource(v224, v221, v222, v223);
end;
mountState = function(v225) --[[ Line: 1171 ]] --[[ Name: mountState ]]
    -- upvalues: v70 (ref), v68 (ref)
    local v226 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v226;
        v70 = v226;
    else
        v70.next = v226;
        v70 = v226;
    end;
    local l_v70_3 = v70;
    if type(v225) == "function" then
        v225 = v225();
    end;
    l_v70_3.baseState = v225;
    l_v70_3.memoizedState = l_v70_3.baseState;
    v226 = {
        pending = nil, 
        dispatch = nil, 
        lastRenderedReducer = nil, 
        lastRenderedState = v225, 
        lastRenderedReducer = basicStateReducer
    };
    l_v70_3.queue = v226;
    local l_v68_3 = v68;
    local function v230(v229, ...) --[[ Line: 1193 ]]
        -- upvalues: l_v68_3 (copy), v226 (copy)
        dispatchAction(l_v68_3, v226, v229, ...);
    end;
    v226.dispatch = v230;
    return l_v70_3.memoizedState, v230;
end;
updateState = function(v231) --[[ Line: 1202 ]] --[[ Name: updateState ]]
    return updateReducer(basicStateReducer, v231);
end;
rerenderState = function(v232) --[[ Line: 1206 ]] --[[ Name: rerenderState ]]
    return rerenderReducer(basicStateReducer, v232);
end;
local function v241(v233, v234, v235, v236) --[[ Line: 1210 ]] --[[ Name: pushEffect ]]
    -- upvalues: v68 (ref)
    local v237 = {
        tag = v233, 
        create = v234, 
        destroy = v235, 
        deps = v236, 
        next = nil
    };
    local l_updateQueue_0 = v68.updateQueue;
    if l_updateQueue_0 == nil then
        l_updateQueue_0 = {
            lastEffect = nil
        };
        v68.updateQueue = l_updateQueue_0;
        v237.next = v237;
        l_updateQueue_0.lastEffect = v237;
        return v237;
    else
        local l_lastEffect_0 = l_updateQueue_0.lastEffect;
        if l_lastEffect_0 == nil then
            l_updateQueue_0.lastEffect = v237;
            v237.next = v237;
            return v237;
        else
            local l_next_3 = l_lastEffect_0.next;
            l_lastEffect_0.next = v237;
            v237.next = l_next_3;
            l_updateQueue_0.lastEffect = v237;
            return v237;
        end;
    end;
end;
mountBinding = function(v242) --[[ Line: 1246 ]] --[[ Name: mountBinding ]]
    -- upvalues: v70 (ref), v68 (ref), l_createBinding_0 (copy)
    local v243 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v243;
        v70 = v243;
    else
        v70.next = v243;
        v70 = v243;
    end;
    local l_v70_4 = v70;
    local v245;
    v243, v245 = l_createBinding_0(v242);
    l_v70_4.memoizedState = {
        v243, 
        v245
    };
    return v243, v245;
end;
updateBinding = function(_) --[[ Line: 1255 ]] --[[ Name: updateBinding ]]
    -- upvalues: v134 (copy)
    return unpack(v134().memoizedState);
end;
mountRef = function(v247) --[[ Line: 1260 ]] --[[ Name: mountRef ]]
    -- upvalues: v70 (ref), v68 (ref), l_createRef_0 (copy)
    local v248 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v248;
        v70 = v248;
    else
        v70.next = v248;
        v70 = v248;
    end;
    local l_v70_5 = v70;
    v248 = l_createRef_0();
    v248.current = v247;
    l_v70_5.memoizedState = v248;
    return v248;
end;
updateRef = function(_) --[[ Line: 1272 ]] --[[ Name: updateRef ]]
    -- upvalues: v134 (copy)
    return v134().memoizedState;
end;
local function v257(v251, v252, v253, v254) --[[ Line: 1277 ]] --[[ Name: mountEffectImpl ]]
    -- upvalues: v70 (ref), v68 (ref), v241 (copy), l_HasEffect_0 (copy)
    local v255 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v255;
        v70 = v255;
    else
        v70.next = v255;
        v70 = v255;
    end;
    local l_v70_6 = v70;
    v68.flags = bit32.bor(v68.flags, v251);
    l_v70_6.memoizedState = v241(bit32.bor(l_HasEffect_0, v252), v253, nil, v254);
end;
updateEffectImpl = function(v258, v259, v260, v261) --[[ Line: 1289 ]] --[[ Name: updateEffectImpl ]]
    -- upvalues: v134 (copy), v69 (ref), v121 (copy), v241 (copy), v68 (ref), l_HasEffect_0 (copy)
    local v262 = v134();
    local v263 = nil;
    if v69 ~= nil then
        local l_memoizedState_5 = v69.memoizedState;
        v263 = l_memoizedState_5.destroy;
        if v261 ~= nil then
            local l_deps_0 = l_memoizedState_5.deps;
            if v121(v261, l_deps_0) then
                v262.memoizedState = v241(v259, v260, v263, v261);
                return;
            end;
        end;
    end;
    v68.flags = bit32.bor(v68.flags, v258);
    v262.memoizedState = v241(bit32.bor(l_HasEffect_0, v259), v260, v263, v261);
end;
local function v276(v266, v267) --[[ Line: 1315 ]] --[[ Name: mountEffect ]]
    -- upvalues: l___DEV___0 (copy), l_warnIfNotCurrentlyActingEffectsInDEV_0 (copy), v68 (ref), l_enableDoubleInvokingEffects_0 (copy), l_MountPassiveDev_0 (copy), l_Passive_0 (copy), l_PassiveStatic_0 (copy), l_Passive_1 (copy), v70 (ref), v241 (copy), l_HasEffect_0 (copy)
    if l___DEV___0 and (type(_G.jest) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__) then
        l_warnIfNotCurrentlyActingEffectsInDEV_0(v68);
    end;
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
        local v268 = bit32.bor(l_MountPassiveDev_0, l_Passive_0, l_PassiveStatic_0);
        local l_l_Passive_1_0 = l_Passive_1;
        local v270 = {
            memoizedState = nil, 
            baseState = nil, 
            baseQueue = nil, 
            queue = nil, 
            next = nil
        };
        if v70 == nil then
            v68.memoizedState = v270;
            v70 = v270;
        else
            v70.next = v270;
            v70 = v270;
        end;
        local l_v70_7 = v70;
        v68.flags = bit32.bor(v68.flags, v268);
        l_v70_7.memoizedState = v241(bit32.bor(l_HasEffect_0, l_l_Passive_1_0), v266, nil, v267);
        return;
    else
        local v272 = bit32.bor(l_Passive_0, l_PassiveStatic_0);
        local l_l_Passive_1_1 = l_Passive_1;
        local v274 = {
            memoizedState = nil, 
            baseState = nil, 
            baseQueue = nil, 
            queue = nil, 
            next = nil
        };
        if v70 == nil then
            v68.memoizedState = v274;
            v70 = v274;
        else
            v70.next = v274;
            v70 = v274;
        end;
        local l_v70_8 = v70;
        v68.flags = bit32.bor(v68.flags, v272);
        l_v70_8.memoizedState = v241(bit32.bor(l_HasEffect_0, l_l_Passive_1_1), v266, nil, v267);
        return;
    end;
end;
local function v279(v277, v278) --[[ Line: 1345 ]] --[[ Name: updateEffect ]]
    -- upvalues: l___DEV___0 (copy), l_warnIfNotCurrentlyActingEffectsInDEV_0 (copy), v68 (ref), l_Passive_0 (copy), l_Passive_1 (copy)
    if l___DEV___0 and (type(_G.jest) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__) then
        l_warnIfNotCurrentlyActingEffectsInDEV_0(v68);
    end;
    updateEffectImpl(l_Passive_0, l_Passive_1, v277, v278);
end;
local function v290(v280, v281) --[[ Line: 1360 ]] --[[ Name: mountLayoutEffect ]]
    -- upvalues: l___DEV___0 (copy), l_enableDoubleInvokingEffects_0 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy), l_Layout_0 (copy), v70 (ref), v68 (ref), v241 (copy), l_HasEffect_0 (copy)
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
        local v282 = bit32.bor(l_MountLayoutDev_0, l_Update_0);
        local l_l_Layout_0_0 = l_Layout_0;
        local v284 = {
            memoizedState = nil, 
            baseState = nil, 
            baseQueue = nil, 
            queue = nil, 
            next = nil
        };
        if v70 == nil then
            v68.memoizedState = v284;
            v70 = v284;
        else
            v70.next = v284;
            v70 = v284;
        end;
        local l_v70_9 = v70;
        v68.flags = bit32.bor(v68.flags, v282);
        l_v70_9.memoizedState = v241(bit32.bor(l_HasEffect_0, l_l_Layout_0_0), v280, nil, v281);
        return;
    else
        local l_l_Update_0_0 = l_Update_0;
        local l_l_Layout_0_1 = l_Layout_0;
        local v288 = {
            memoizedState = nil, 
            baseState = nil, 
            baseQueue = nil, 
            queue = nil, 
            next = nil
        };
        if v70 == nil then
            v68.memoizedState = v288;
            v70 = v288;
        else
            v70.next = v288;
            v70 = v288;
        end;
        local l_v70_10 = v70;
        v68.flags = bit32.bor(v68.flags, l_l_Update_0_0);
        l_v70_10.memoizedState = v241(bit32.bor(l_HasEffect_0, l_l_Layout_0_1), v280, nil, v281);
        return;
    end;
end;
local function v293(v291, v292) --[[ Line: 1377 ]] --[[ Name: updateLayoutEffect ]]
    -- upvalues: l_Update_0 (copy), l_Layout_0 (copy)
    updateEffectImpl(l_Update_0, l_Layout_0, v291, v292);
end;
imperativeHandleEffect = function(v294, v295) --[[ Line: 1385 ]] --[[ Name: imperativeHandleEffect ]]
    -- upvalues: l___DEV___0 (copy), l_Object_0 (copy), l_console_0 (copy), l_Array_0 (copy)
    if v295 ~= nil and type(v295) == "function" then
        v295((v294()));
        return function() --[[ Line: 1394 ]]
            -- upvalues: v295 (copy)
            return v295(nil);
        end;
    elseif v295 ~= nil then
        if l___DEV___0 then
            local v296 = false;
            if getmetatable(v295) ~= nil then
                v296 = #l_Object_0.keys(v295) == 0;
            end;
            if not v296 then
                l_console_0.error("Expected useImperativeHandle() first argument to either be a " .. "ref callback or React.createRef() object. Instead received: %s.", "an object with keys {" .. l_Array_0.join(l_Object_0.keys(v295), ", ") .. "}");
            end;
        end;
        v295.current = v294();
        return function() --[[ Line: 1419 ]]
            -- upvalues: v295 (copy)
            v295.current = nil;
        end;
    else
        return nil;
    end;
end;
mountImperativeHandle = function(v297, v298, v299) --[[ Line: 1428 ]] --[[ Name: mountImperativeHandle ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), l_Array_0 (copy), l_enableDoubleInvokingEffects_0 (copy), v257 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy), l_Layout_0 (copy)
    if l___DEV___0 and type(v298) ~= "function" then
        l_console_0.error("Expected useImperativeHandle() second argument to be a function " .. "that creates a handle. Instead received: %s.", if v298 ~= nil then type(v298) else "nil");
    end;
    local v300 = if v299 ~= nil then l_Array_0.concat(v299, {
        v297
    }) else nil;
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
        return v257(bit32.bor(l_MountLayoutDev_0, l_Update_0), l_Layout_0, function() --[[ Line: 1451 ]]
            -- upvalues: v298 (copy), v297 (copy)
            return imperativeHandleEffect(v298, v297);
        end, v300);
    else
        return v257(l_Update_0, l_Layout_0, function() --[[ Line: 1457 ]]
            -- upvalues: v298 (copy), v297 (copy)
            return imperativeHandleEffect(v298, v297);
        end, v300);
    end;
end;
updateImperativeHandle = function(v301, v302, v303) --[[ Line: 1463 ]] --[[ Name: updateImperativeHandle ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), l_Update_0 (copy), l_Layout_0 (copy)
    if l___DEV___0 and type(v302) ~= "function" then
        local v304 = "nil";
        if v302 then
            v304 = type(v302);
        end;
        l_console_0.error("Expected useImperativeHandle() second argument to be a function " .. "that creates a handle. Instead received: %s.", v304);
    end;
    local v305 = nil;
    if v303 ~= nil then
        v305 = table.clone(v303);
        table.insert(v305, v301);
    end;
    return updateEffectImpl(l_Update_0, l_Layout_0, function() --[[ Line: 1490 ]]
        -- upvalues: v302 (copy), v301 (copy)
        return imperativeHandleEffect(v302, v301);
    end, v305);
end;
mountDebugValue = function(_, _) --[[ Line: 1495 ]] --[[ Name: mountDebugValue ]]

end;
local l_mountDebugValue_0 = mountDebugValue;
mountCallback = function(v309, v310) --[[ Line: 1503 ]] --[[ Name: mountCallback ]]
    -- upvalues: v70 (ref), v68 (ref)
    local v311 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v311;
        v70 = v311;
    else
        v70.next = v311;
        v70 = v311;
    end;
    v70.memoizedState = {
        v309, 
        v310
    };
    return v309;
end;
updateCallback = function(v312, v313) --[[ Line: 1511 ]] --[[ Name: updateCallback ]]
    -- upvalues: v134 (copy), v121 (copy)
    local v314 = v134();
    local l_memoizedState_6 = v314.memoizedState;
    if l_memoizedState_6 ~= nil and v313 ~= nil then
        local v316 = l_memoizedState_6[2];
        if v121(v313, v316) then
            return l_memoizedState_6[1];
        end;
    end;
    v314.memoizedState = {
        v312, 
        v313
    };
    return v312;
end;
mountMemo = function(v317, v318) --[[ Line: 1530 ]] --[[ Name: mountMemo ]]
    -- upvalues: v70 (ref), v68 (ref)
    local v319 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v319;
        v70 = v319;
    else
        v70.next = v319;
        v70 = v319;
    end;
    local l_v70_11 = v70;
    v319 = {
        v317()
    };
    l_v70_11.memoizedState = {
        v319, 
        v318
    };
    return unpack(v319);
end;
updateMemo = function(v321, v322) --[[ Line: 1542 ]] --[[ Name: updateMemo ]]
    -- upvalues: v134 (copy), v121 (copy)
    local v323 = v134();
    local l_memoizedState_7 = v323.memoizedState;
    if l_memoizedState_7 ~= nil and v322 ~= nil then
        local v325 = l_memoizedState_7[2];
        if v121(v322, v325) then
            return unpack(l_memoizedState_7[1]);
        end;
    end;
    local v326 = {
        v321()
    };
    v323.memoizedState = {
        v326, 
        v322
    };
    return unpack(v326);
end;
v66.getIsUpdatingOpaqueValueInRenderPhaseInDEV = function() --[[ Line: 1692 ]]
    -- upvalues: l___DEV___0 (copy)
    if l___DEV___0 then
        return false;
    else
        return nil;
    end;
end;
mountOpaqueIdentifier = function() --[[ Line: 1714 ]] --[[ Name: mountOpaqueIdentifier ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), l_makeClientId_0 (copy), l_getIsHydrating_0 (copy)
    local v327 = nil;
    if l___DEV___0 then
        l_console_0.warn("!!! unimplemented: warnOnOpaqueIdentifierAccessInDEV");
    else
        v327 = l_makeClientId_0;
    end;
    if l_getIsHydrating_0() then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("UNIMPLEMENTED ERROR: " .. "ReactFiberHooks: getIsHydrating() true");
        error("FIXME (roblox): " .. "ReactFiberHooks: getIsHydrating() true" .. " is unimplemented");
        return nil;
    else
        local v328 = v327();
        mountState(v328);
        return v328;
    end;
end;
updateOpaqueIdentifier = function() --[[ Line: 1781 ]] --[[ Name: updateOpaqueIdentifier ]]
    local v329, _ = updateState(nil);
    return v329;
end;
rerenderOpaqueIdentifier = function() --[[ Line: 1786 ]] --[[ Name: rerenderOpaqueIdentifier ]]
    local v331, _ = rerenderState(nil);
    return v331;
end;
dispatchAction = function(v333, v334, v335, ...) --[[ Line: 1791 ]] --[[ Name: dispatchAction ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), v68 (ref), v71 (ref), v72 (ref), l_NoLanes_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref), l_warnIfNotScopedWithMatchingAct_0 (copy), l_warnIfNotCurrentlyActingUpdatesInDEV_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_enableDebugTracing_0 (copy), l_DebugTracingMode_0 (copy), l_getComponentName_0 (copy), l_logStateUpdateScheduled_0 (copy), l_enableSchedulingProfiler_0 (copy), l_markStateUpdateScheduled_0 (copy)
    if l___DEV___0 then
        local v336 = select("#", ...);
        local v337 = nil;
        if v336 == 1 then
            v337 = select(1, ...);
        end;
        if type(v337) == "function" then
            l_console_0.error("State updates from the useState() and useReducer() Hooks don't support the " .. "second callback argument. To execute a side effect after " .. "rendering, declare it in the component body with useEffect().");
        end;
    end;
    local v338 = l_requestEventTime_0();
    local v339 = l_requestUpdateLane_0(v333);
    local v340 = {
        lane = v339, 
        action = v335, 
        eagerReducer = nil, 
        eagerState = nil, 
        next = nil
    };
    local l_pending_2 = v334.pending;
    if l_pending_2 == nil then
        v340.next = v340;
    else
        v340.next = l_pending_2.next;
        l_pending_2.next = v340;
    end;
    v334.pending = v340;
    local l_alternate_1 = v333.alternate;
    if v333 == v68 or l_alternate_1 ~= nil and l_alternate_1 == v68 then
        v71 = true;
        v72 = true;
    else
        if v333.lanes == l_NoLanes_0 and (l_alternate_1 == nil or l_alternate_1.lanes == l_NoLanes_0) then
            local l_lastRenderedReducer_0 = v334.lastRenderedReducer;
            if l_lastRenderedReducer_0 ~= nil then
                local v344 = nil;
                if l___DEV___0 then
                    v344 = l_ReactCurrentDispatcher_0.current;
                    l_ReactCurrentDispatcher_0.current = v81;
                end;
                local l_lastRenderedState_0 = v334.lastRenderedState;
                local l_status_1, l_result_1 = pcall(l_lastRenderedReducer_0, l_lastRenderedState_0, v335);
                if l_status_1 then
                    v340.eagerReducer = l_lastRenderedReducer_0;
                    v340.eagerState = l_result_1;
                end;
                if l___DEV___0 then
                    l_ReactCurrentDispatcher_0.current = v344;
                end;
                if l_result_1 == l_lastRenderedState_0 and (l_result_1 ~= 0 or 1 / l_result_1 == 1 / l_lastRenderedState_0) or l_result_1 ~= l_result_1 and l_lastRenderedState_0 ~= l_lastRenderedState_0 then
                    return;
                elseif not l_status_1 then

                end;
            end;
        end;
        if l___DEV___0 and (type(_G.jest) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__) then
            l_warnIfNotScopedWithMatchingAct_0(v333);
            l_warnIfNotCurrentlyActingUpdatesInDEV_0(v333);
        end;
        l_scheduleUpdateOnFiber_0(v333, v339, v338);
    end;
    if l___DEV___0 and l_enableDebugTracing_0 and bit32.band(v333.mode, l_DebugTracingMode_0) ~= 0 then
        local v348 = l_getComponentName_0(v333.type) or "Unknown";
        l_logStateUpdateScheduled_0(v348, v339, v335);
    end;
    if l_enableSchedulingProfiler_0 then
        l_markStateUpdateScheduled_0(v333, v339);
    end;
end;
local v349 = {
    readContext = l_readContext_0, 
    useCallback = v108, 
    useContext = v108, 
    useEffect = v108, 
    useImperativeHandle = v108, 
    useLayoutEffect = v108, 
    useMemo = v108, 
    useReducer = v108, 
    useRef = v108, 
    useBinding = v108, 
    useState = v108, 
    useDebugValue = v108, 
    useMutableSource = v108, 
    useOpaqueIdentifier = v108, 
    unstable_isNewReconciler = l_enableNewReconciler_0
};
v66.ContextOnlyDispatcher = v349;
local v350 = {
    readContext = l_readContext_0, 
    useCallback = mountCallback, 
    useContext = l_readContext_0, 
    useEffect = v276, 
    useImperativeHandle = mountImperativeHandle, 
    useLayoutEffect = v290, 
    useMemo = mountMemo, 
    useReducer = mountReducer, 
    useRef = mountRef, 
    useBinding = mountBinding, 
    useState = mountState, 
    useDebugValue = mountDebugValue, 
    useMutableSource = mountMutableSource, 
    useOpaqueIdentifier = mountOpaqueIdentifier, 
    unstable_isNewReconciler = l_enableNewReconciler_0
};
local v351 = {
    readContext = l_readContext_0, 
    useCallback = updateCallback, 
    useContext = l_readContext_0, 
    useEffect = v279, 
    useImperativeHandle = updateImperativeHandle, 
    useLayoutEffect = v293, 
    useMemo = updateMemo, 
    useReducer = updateReducer, 
    useRef = updateRef, 
    useBinding = updateBinding, 
    useState = updateState, 
    useDebugValue = l_mountDebugValue_0, 
    useMutableSource = updateMutableSource, 
    useOpaqueIdentifier = updateOpaqueIdentifier, 
    unstable_isNewReconciler = l_enableNewReconciler_0
};
local v352 = {
    readContext = l_readContext_0, 
    useCallback = updateCallback, 
    useContext = l_readContext_0, 
    useEffect = v279, 
    useImperativeHandle = updateImperativeHandle, 
    useLayoutEffect = v293, 
    useMemo = updateMemo, 
    useReducer = rerenderReducer, 
    useRef = updateRef, 
    useBinding = updateBinding, 
    useState = rerenderState, 
    useDebugValue = l_mountDebugValue_0, 
    useMutableSource = updateMutableSource, 
    useOpaqueIdentifier = rerenderOpaqueIdentifier, 
    unstable_isNewReconciler = l_enableNewReconciler_0
};
if l___DEV___0 then
    local function _() --[[ Line: 2006 ]]
        -- upvalues: l_console_0 (copy)
        l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
    end;
    local function _() --[[ Line: 2015 ]]
        -- upvalues: l_console_0 (copy)
        l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
    end;
    v76 = {
        readContext = function(v355, v356) --[[ Line: 2025 ]] --[[ Name: readContext ]]
            -- upvalues: l_readContext_0 (copy)
            return l_readContext_0(v355, v356);
        end, 
        useCallback = function(v357, v358) --[[ Line: 2028 ]] --[[ Name: useCallback ]]
            -- upvalues: v73 (ref), l___DEV___0 (copy), v74 (ref), l_console_0 (copy)
            local v359 = false;
            v73 = "useCallback";
            if l___DEV___0 then
                local l_v73_2 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_2
                    };
                else
                    table.insert(v74, l_v73_2);
                end;
            end;
            if l___DEV___0 and v358 ~= nil then
                local v361;
                if type(v358) ~= "table" then
                    v361 = false;
                else
                    for v362, _ in v358 do
                        if type(v362) ~= "number" then
                            v361 = false;
                            v359 = true;
                        end;
                        if v359 then
                            break;
                        end;
                    end;
                    if not v359 then
                        v361 = true;
                    end;
                end;
                v359 = false;
                if not v361 then
                    l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (type(v358)));
                end;
            end;
            return mountCallback(v357, v358);
        end, 
        useContext = function(v364, v365) --[[ Line: 2034 ]] --[[ Name: useContext ]]
            -- upvalues: v73 (ref), l___DEV___0 (copy), v74 (ref), l_readContext_0 (copy)
            v73 = "useContext";
            if l___DEV___0 then
                local l_v73_3 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_3
                    };
                else
                    table.insert(v74, l_v73_3);
                end;
            end;
            return l_readContext_0(v364, v365);
        end, 
        useEffect = function(v367, v368) --[[ Line: 2039 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), l___DEV___0 (copy), v74 (ref), l_console_0 (copy), v276 (copy)
            local v369 = false;
            v73 = "useEffect";
            if l___DEV___0 then
                local l_v73_4 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_4
                    };
                else
                    table.insert(v74, l_v73_4);
                end;
            end;
            if l___DEV___0 and v368 ~= nil then
                local v371;
                if type(v368) ~= "table" then
                    v371 = false;
                else
                    for v372, _ in v368 do
                        if type(v372) ~= "number" then
                            v371 = false;
                            v369 = true;
                        end;
                        if v369 then
                            break;
                        end;
                    end;
                    if not v369 then
                        v371 = true;
                    end;
                end;
                v369 = false;
                if not v371 then
                    l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (type(v368)));
                end;
            end;
            return v276(v367, v368);
        end, 
        useImperativeHandle = function(v374, v375, v376) --[[ Line: 2049 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v73 (ref), l___DEV___0 (copy), v74 (ref), l_console_0 (copy)
            local v377 = false;
            v73 = "useImperativeHandle";
            if l___DEV___0 then
                local l_v73_5 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_5
                    };
                else
                    table.insert(v74, l_v73_5);
                end;
            end;
            if l___DEV___0 and v376 ~= nil then
                local v379;
                if type(v376) ~= "table" then
                    v379 = false;
                else
                    for v380, _ in v376 do
                        if type(v380) ~= "number" then
                            v379 = false;
                            v377 = true;
                        end;
                        if v377 then
                            break;
                        end;
                    end;
                    if not v377 then
                        v379 = true;
                    end;
                end;
                v377 = false;
                if not v379 then
                    l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (type(v376)));
                end;
            end;
            return mountImperativeHandle(v374, v375, v376);
        end, 
        useLayoutEffect = function(v382, v383) --[[ Line: 2059 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), l___DEV___0 (copy), v74 (ref), l_console_0 (copy), v290 (copy)
            local v384 = false;
            v73 = "useLayoutEffect";
            if l___DEV___0 then
                local l_v73_6 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_6
                    };
                else
                    table.insert(v74, l_v73_6);
                end;
            end;
            if l___DEV___0 and v383 ~= nil then
                local v386;
                if type(v383) ~= "table" then
                    v386 = false;
                else
                    for v387, _ in v383 do
                        if type(v387) ~= "number" then
                            v386 = false;
                            v384 = true;
                        end;
                        if v384 then
                            break;
                        end;
                    end;
                    if not v384 then
                        v386 = true;
                    end;
                end;
                v384 = false;
                if not v386 then
                    l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (type(v383)));
                end;
            end;
            return v290(v382, v383);
        end, 
        useMemo = function(v389, v390) --[[ Line: 2070 ]]
            -- upvalues: v73 (ref), l___DEV___0 (copy), v74 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            local v391 = false;
            v73 = "useMemo";
            if l___DEV___0 then
                local l_v73_7 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_7
                    };
                else
                    table.insert(v74, l_v73_7);
                end;
            end;
            if l___DEV___0 and v390 ~= nil then
                local v393;
                if type(v390) ~= "table" then
                    v393 = false;
                else
                    for v394, _ in v390 do
                        if type(v394) ~= "number" then
                            v393 = false;
                            v391 = true;
                        end;
                        if v391 then
                            break;
                        end;
                    end;
                    if not v391 then
                        v393 = true;
                    end;
                end;
                v391 = false;
                if not v393 then
                    l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (type(v390)));
                end;
            end;
            local l_current_1 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v397 = {
                pcall(mountMemo, v389, v390)
            };
            l_ReactCurrentDispatcher_0.current = l_current_1;
            if not v397[1] then
                error(v397[2]);
            end;
            return unpack(v397, 2);
        end, 
        useReducer = function(v398, v399, v400) --[[ Line: 2088 ]] --[[ Name: useReducer ]]
            -- upvalues: v73 (ref), l___DEV___0 (copy), v74 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useReducer";
            if l___DEV___0 then
                local l_v73_8 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_8
                    };
                else
                    table.insert(v74, l_v73_8);
                end;
            end;
            local l_current_2 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v403, v404, v405 = pcall(mountReducer, v398, v399, v400);
            l_ReactCurrentDispatcher_0.current = l_current_2;
            if not v403 then
                error(v404);
            end;
            return v404, v405;
        end, 
        useRef = function(v406) --[[ Line: 2106 ]] --[[ Name: useRef ]]
            -- upvalues: v73 (ref), l___DEV___0 (copy), v74 (ref)
            v73 = "useRef";
            if l___DEV___0 then
                local l_v73_9 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_9
                    };
                else
                    table.insert(v74, l_v73_9);
                end;
            end;
            return mountRef(v406);
        end, 
        useBinding = function(v408) --[[ Line: 2112 ]] --[[ Name: useBinding ]]
            -- upvalues: v73 (ref), l___DEV___0 (copy), v74 (ref)
            v73 = "useBinding";
            if l___DEV___0 then
                local l_v73_10 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_10
                    };
                else
                    table.insert(v74, l_v73_10);
                end;
            end;
            return mountBinding(v408);
        end, 
        useState = function(v410) --[[ Line: 2117 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), l___DEV___0 (copy), v74 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useState";
            if l___DEV___0 then
                local l_v73_11 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_11
                    };
                else
                    table.insert(v74, l_v73_11);
                end;
            end;
            local l_current_3 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v413, v414, v415 = pcall(mountState, v410);
            l_ReactCurrentDispatcher_0.current = l_current_3;
            if not v413 then
                error(v414);
            end;
            return v414, v415;
        end, 
        useDebugValue = function(v416, v417) --[[ Line: 2131 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref), l___DEV___0 (copy), v74 (ref)
            v73 = "useDebugValue";
            if l___DEV___0 then
                local l_v73_12 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_12
                    };
                else
                    table.insert(v74, l_v73_12);
                end;
            end;
            return mountDebugValue(v416, v417);
        end, 
        useMutableSource = function(v419, v420, v421) --[[ Line: 2146 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref), l___DEV___0 (copy), v74 (ref)
            v73 = "useMutableSource";
            if l___DEV___0 then
                local l_v73_13 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_13
                    };
                else
                    table.insert(v74, l_v73_13);
                end;
            end;
            return mountMutableSource(v419, v420, v421);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2161 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref), l___DEV___0 (copy), v74 (ref)
            v73 = "useOpaqueIdentifier";
            if l___DEV___0 then
                local l_v73_14 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_14
                    };
                else
                    table.insert(v74, l_v73_14);
                end;
            end;
            return mountOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v77 = {
        readContext = function(v424, v425) --[[ Line: 2171 ]] --[[ Name: readContext ]]
            -- upvalues: l_readContext_0 (copy)
            return l_readContext_0(v424, v425);
        end, 
        useCallback = function(v426, v427) --[[ Line: 2174 ]] --[[ Name: useCallback ]]
            -- upvalues: v73 (ref), l___DEV___0 (copy), l_console_0 (copy)
            local v428 = false;
            v73 = "useCallback";
            updateHookTypesDev();
            if l___DEV___0 and v427 ~= nil then
                local v429;
                if type(v427) ~= "table" then
                    v429 = false;
                else
                    for v430, _ in v427 do
                        if type(v430) ~= "number" then
                            v429 = false;
                            v428 = true;
                        end;
                        if v428 then
                            break;
                        end;
                    end;
                    if not v428 then
                        v429 = true;
                    end;
                end;
                v428 = false;
                if not v429 then
                    l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (type(v427)));
                end;
            end;
            return mountCallback(v426, v427);
        end, 
        useContext = function(v432, v433) --[[ Line: 2180 ]] --[[ Name: useContext ]]
            -- upvalues: v73 (ref), l_readContext_0 (copy)
            v73 = "useContext";
            updateHookTypesDev();
            return l_readContext_0(v432, v433);
        end, 
        useEffect = function(v434, v435) --[[ Line: 2185 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), v276 (copy)
            v73 = "useEffect";
            updateHookTypesDev();
            return v276(v434, v435);
        end, 
        useImperativeHandle = function(v436, v437, v438) --[[ Line: 2194 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v73 (ref)
            v73 = "useImperativeHandle";
            updateHookTypesDev();
            return mountImperativeHandle(v436, v437, v438);
        end, 
        useLayoutEffect = function(v439, v440) --[[ Line: 2203 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), v290 (copy)
            v73 = "useLayoutEffect";
            updateHookTypesDev();
            return v290(v439, v440);
        end, 
        useMemo = function(v441, v442) --[[ Line: 2213 ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useMemo";
            updateHookTypesDev();
            local l_current_4 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v444 = {
                pcall(mountMemo, v441, v442)
            };
            l_ReactCurrentDispatcher_0.current = l_current_4;
            if not v444[1] then
                error(v444[2]);
            end;
            return unpack(v444, 2);
        end, 
        useReducer = function(v445, v446, v447) --[[ Line: 2229 ]] --[[ Name: useReducer ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useReducer";
            updateHookTypesDev();
            local l_current_5 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v449, v450, v451 = pcall(mountReducer, v445, v446, v447);
            l_ReactCurrentDispatcher_0.current = l_current_5;
            if not v449 then
                error(v450);
            end;
            return v450, v451;
        end, 
        useRef = function(v452) --[[ Line: 2247 ]] --[[ Name: useRef ]]
            -- upvalues: v73 (ref)
            v73 = "useRef";
            updateHookTypesDev();
            return mountRef(v452);
        end, 
        useBinding = function(v453) --[[ Line: 2253 ]] --[[ Name: useBinding ]]
            -- upvalues: v73 (ref)
            v73 = "useBinding";
            updateHookTypesDev();
            return mountBinding(v453);
        end, 
        useState = function(v454) --[[ Line: 2258 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useState";
            updateHookTypesDev();
            local l_current_6 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v456, v457, v458 = pcall(mountState, v454);
            l_ReactCurrentDispatcher_0.current = l_current_6;
            if not v456 then
                error(v457);
            end;
            return v457, v458;
        end, 
        useDebugValue = function(v459, v460) --[[ Line: 2272 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref)
            v73 = "useDebugValue";
            updateHookTypesDev();
            return mountDebugValue(v459, v460);
        end, 
        useMutableSource = function(v461, v462, v463) --[[ Line: 2287 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref)
            v73 = "useMutableSource";
            updateHookTypesDev();
            return mountMutableSource(v461, v462, v463);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2302 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref)
            v73 = "useOpaqueIdentifier";
            updateHookTypesDev();
            return mountOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v78 = {
        readContext = function(v464, v465) --[[ Line: 2312 ]] --[[ Name: readContext ]]
            -- upvalues: l_readContext_0 (copy)
            return l_readContext_0(v464, v465);
        end, 
        useCallback = function(v466, v467) --[[ Line: 2315 ]] --[[ Name: useCallback ]]
            -- upvalues: v73 (ref)
            v73 = "useCallback";
            updateHookTypesDev();
            return updateCallback(v466, v467);
        end, 
        useContext = function(v468, v469) --[[ Line: 2320 ]] --[[ Name: useContext ]]
            -- upvalues: v73 (ref), l_readContext_0 (copy)
            v73 = "useContext";
            updateHookTypesDev();
            return l_readContext_0(v468, v469);
        end, 
        useEffect = function(v470, v471) --[[ Line: 2325 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), v279 (copy)
            v73 = "useEffect";
            updateHookTypesDev();
            return v279(v470, v471);
        end, 
        useImperativeHandle = function(v472, v473, v474) --[[ Line: 2334 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v73 (ref)
            v73 = "useImperativeHandle";
            updateHookTypesDev();
            return updateImperativeHandle(v472, v473, v474);
        end, 
        useLayoutEffect = function(v475, v476) --[[ Line: 2343 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), v293 (copy)
            v73 = "useLayoutEffect";
            updateHookTypesDev();
            return v293(v475, v476);
        end, 
        useMemo = function(v477, v478) --[[ Line: 2353 ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useMemo";
            updateHookTypesDev();
            local l_current_7 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v480 = {
                pcall(updateMemo, v477, v478)
            };
            l_ReactCurrentDispatcher_0.current = l_current_7;
            if not v480[1] then
                error(v480[2]);
            end;
            return unpack(v480, 2);
        end, 
        useReducer = function(v481, v482, v483) --[[ Line: 2369 ]] --[[ Name: useReducer ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useReducer";
            updateHookTypesDev();
            local l_current_8 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v485, v486, v487 = pcall(updateReducer, v481, v482, v483);
            l_ReactCurrentDispatcher_0.current = l_current_8;
            if not v485 then
                error(v486);
            end;
            return v486, v487;
        end, 
        useRef = function(v488) --[[ Line: 2387 ]] --[[ Name: useRef ]]
            -- upvalues: v73 (ref)
            v73 = "useRef";
            updateHookTypesDev();
            return updateRef(v488);
        end, 
        useBinding = function(v489) --[[ Line: 2393 ]] --[[ Name: useBinding ]]
            -- upvalues: v73 (ref)
            v73 = "useBinding";
            updateHookTypesDev();
            return updateBinding(v489);
        end, 
        useState = function(v490) --[[ Line: 2398 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useState";
            updateHookTypesDev();
            local l_current_9 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v492, v493, v494 = pcall(updateState, v490);
            l_ReactCurrentDispatcher_0.current = l_current_9;
            if not v492 then
                error(v493);
            end;
            return v493, v494;
        end, 
        useDebugValue = function(v495, v496) --[[ Line: 2412 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref), l_mountDebugValue_0 (copy)
            v73 = "useDebugValue";
            updateHookTypesDev();
            return l_mountDebugValue_0(v495, v496);
        end, 
        useMutableSource = function(v497, v498, v499) --[[ Line: 2427 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref)
            v73 = "useMutableSource";
            updateHookTypesDev();
            return updateMutableSource(v497, v498, v499);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2442 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref)
            v73 = "useOpaqueIdentifier";
            updateHookTypesDev();
            return updateOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v79 = {
        readContext = function(v500, v501) --[[ Line: 2452 ]] --[[ Name: readContext ]]
            -- upvalues: l_readContext_0 (copy)
            return l_readContext_0(v500, v501);
        end, 
        useCallback = function(v502, v503) --[[ Line: 2455 ]] --[[ Name: useCallback ]]
            -- upvalues: v73 (ref)
            v73 = "useCallback";
            updateHookTypesDev();
            return mountCallback(v502, v503);
        end, 
        useContext = function(v504, v505) --[[ Line: 2460 ]] --[[ Name: useContext ]]
            -- upvalues: v73 (ref), l_readContext_0 (copy)
            v73 = "useContext";
            updateHookTypesDev();
            return l_readContext_0(v504, v505);
        end, 
        useEffect = function(v506, v507) --[[ Line: 2465 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), v279 (copy)
            v73 = "useEffect";
            updateHookTypesDev();
            return v279(v506, v507);
        end, 
        useImperativeHandle = function(v508, v509, v510) --[[ Line: 2474 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v73 (ref)
            v73 = "useImperativeHandle";
            updateHookTypesDev();
            return updateImperativeHandle(v508, v509, v510);
        end, 
        useLayoutEffect = function(v511, v512) --[[ Line: 2483 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), v293 (copy)
            v73 = "useLayoutEffect";
            updateHookTypesDev();
            return v293(v511, v512);
        end, 
        useMemo = function(v513, v514) --[[ Line: 2493 ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v82 (ref)
            v73 = "useMemo";
            updateHookTypesDev();
            local l_current_10 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v516 = {
                pcall(updateMemo, v513, v514)
            };
            l_ReactCurrentDispatcher_0.current = l_current_10;
            if not v516[1] then
                error(v516[2]);
            end;
            return unpack(v516, 2);
        end, 
        useReducer = function(v517, v518, v519) --[[ Line: 2509 ]] --[[ Name: useReducer ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v82 (ref)
            v73 = "useReducer";
            updateHookTypesDev();
            local l_current_11 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v521, v522, v523 = pcall(rerenderReducer, v517, v518, v519);
            l_ReactCurrentDispatcher_0.current = l_current_11;
            if not v521 then
                error(v522);
            end;
            return v522, v523;
        end, 
        useRef = function(v524) --[[ Line: 2528 ]] --[[ Name: useRef ]]
            -- upvalues: v73 (ref)
            v73 = "useRef";
            updateHookTypesDev();
            return updateRef(v524);
        end, 
        useBinding = function(v525) --[[ Line: 2534 ]] --[[ Name: useBinding ]]
            -- upvalues: v73 (ref)
            v73 = "useBinding";
            updateHookTypesDev();
            return updateBinding(v525);
        end, 
        useState = function(v526) --[[ Line: 2539 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v82 (ref)
            v73 = "useState";
            updateHookTypesDev();
            local l_current_12 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v528, v529, v530 = pcall(rerenderState, v526);
            l_ReactCurrentDispatcher_0.current = l_current_12;
            if not v528 then
                error(v529);
            end;
            return v529, v530;
        end, 
        useDebugValue = function(v531, v532) --[[ Line: 2553 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref), l_mountDebugValue_0 (copy)
            v73 = "useDebugValue";
            updateHookTypesDev();
            return l_mountDebugValue_0(v531, v532);
        end, 
        useMutableSource = function(v533, v534, v535) --[[ Line: 2568 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref)
            v73 = "useMutableSource";
            updateHookTypesDev();
            return updateMutableSource(v533, v534, v535);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2583 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref)
            v73 = "useOpaqueIdentifier";
            updateHookTypesDev();
            return rerenderOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v80 = {
        readContext = function(v536, v537) --[[ Line: 2593 ]] --[[ Name: readContext ]]
            -- upvalues: l_console_0 (copy), l_readContext_0 (copy)
            l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
            return l_readContext_0(v536, v537);
        end, 
        useCallback = function(v538, v539) --[[ Line: 2597 ]] --[[ Name: useCallback ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l___DEV___0 (copy), v74 (ref)
            v73 = "useCallback";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v73_15 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_15
                    };
                else
                    table.insert(v74, l_v73_15);
                end;
            end;
            return mountCallback(v538, v539);
        end, 
        useContext = function(v541, v542) --[[ Line: 2603 ]] --[[ Name: useContext ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l___DEV___0 (copy), v74 (ref), l_readContext_0 (copy)
            v73 = "useContext";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v73_16 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_16
                    };
                else
                    table.insert(v74, l_v73_16);
                end;
            end;
            return l_readContext_0(v541, v542);
        end, 
        useEffect = function(v544, v545) --[[ Line: 2609 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l___DEV___0 (copy), v74 (ref), v276 (copy)
            v73 = "useEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v73_17 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_17
                    };
                else
                    table.insert(v74, l_v73_17);
                end;
            end;
            return v276(v544, v545);
        end, 
        useImperativeHandle = function(v547, v548, v549) --[[ Line: 2619 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l___DEV___0 (copy), v74 (ref)
            v73 = "useImperativeHandle";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v73_18 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_18
                    };
                else
                    table.insert(v74, l_v73_18);
                end;
            end;
            return mountImperativeHandle(v547, v548, v549);
        end, 
        useLayoutEffect = function(v551, v552) --[[ Line: 2629 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l___DEV___0 (copy), v74 (ref), v290 (copy)
            v73 = "useLayoutEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v73_19 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_19
                    };
                else
                    table.insert(v74, l_v73_19);
                end;
            end;
            return v290(v551, v552);
        end, 
        useMemo = function(v554, v555) --[[ Line: 2640 ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l___DEV___0 (copy), v74 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useMemo";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v73_20 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_20
                    };
                else
                    table.insert(v74, l_v73_20);
                end;
            end;
            local l_current_13 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v558 = {
                pcall(mountMemo, v554, v555)
            };
            l_ReactCurrentDispatcher_0.current = l_current_13;
            if not v558[1] then
                error(v558[2]);
            end;
            return unpack(v558, 2);
        end, 
        useReducer = function(v559, v560, v561) --[[ Line: 2657 ]] --[[ Name: useReducer ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l___DEV___0 (copy), v74 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useReducer";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v73_21 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_21
                    };
                else
                    table.insert(v74, l_v73_21);
                end;
            end;
            local l_current_14 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v564, v565, v566 = pcall(mountReducer, v559, v560, v561);
            l_ReactCurrentDispatcher_0.current = l_current_14;
            if not v564 then
                error(v565);
            end;
            return v565, v566;
        end, 
        useRef = function(v567) --[[ Line: 2676 ]] --[[ Name: useRef ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l___DEV___0 (copy), v74 (ref)
            v73 = "useRef";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v73_22 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_22
                    };
                else
                    table.insert(v74, l_v73_22);
                end;
            end;
            return mountRef(v567);
        end, 
        useBinding = function(v569) --[[ Line: 2683 ]] --[[ Name: useBinding ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l___DEV___0 (copy), v74 (ref)
            v73 = "useBinding";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v73_23 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_23
                    };
                else
                    table.insert(v74, l_v73_23);
                end;
            end;
            return mountBinding(v569);
        end, 
        useState = function(v571) --[[ Line: 2689 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l___DEV___0 (copy), v74 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useState";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v73_24 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_24
                    };
                else
                    table.insert(v74, l_v73_24);
                end;
            end;
            local l_current_15 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v574, v575, v576 = pcall(mountState, v571);
            l_ReactCurrentDispatcher_0.current = l_current_15;
            if not v574 then
                error(v575);
            end;
            return v575, v576;
        end, 
        useDebugValue = function(v577, v578) --[[ Line: 2704 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l___DEV___0 (copy), v74 (ref)
            v73 = "useDebugValue";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v73_25 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_25
                    };
                else
                    table.insert(v74, l_v73_25);
                end;
            end;
            return mountDebugValue(v577, v578);
        end, 
        useMutableSource = function(v580, v581, v582) --[[ Line: 2722 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l___DEV___0 (copy), v74 (ref)
            v73 = "useMutableSource";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v73_26 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_26
                    };
                else
                    table.insert(v74, l_v73_26);
                end;
            end;
            return mountMutableSource(v580, v581, v582);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2738 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l___DEV___0 (copy), v74 (ref)
            v73 = "useOpaqueIdentifier";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if l___DEV___0 then
                local l_v73_27 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_27
                    };
                else
                    table.insert(v74, l_v73_27);
                end;
            end;
            return mountOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v81 = {
        readContext = function(v585, v586) --[[ Line: 2749 ]] --[[ Name: readContext ]]
            -- upvalues: l_console_0 (copy), l_readContext_0 (copy)
            l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
            return l_readContext_0(v585, v586);
        end, 
        useCallback = function(v587, v588) --[[ Line: 2753 ]] --[[ Name: useCallback ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useCallback";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return mountCallback(v587, v588);
        end, 
        useContext = function(v589, v590) --[[ Line: 2759 ]] --[[ Name: useContext ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_readContext_0 (copy)
            v73 = "useContext";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_readContext_0(v589, v590);
        end, 
        useEffect = function(v591, v592) --[[ Line: 2765 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v279 (copy)
            v73 = "useEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v279(v591, v592);
        end, 
        useImperativeHandle = function(v593, v594, v595) --[[ Line: 2775 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useImperativeHandle";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateImperativeHandle(v593, v594, v595);
        end, 
        useLayoutEffect = function(v596, v597) --[[ Line: 2785 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v293 (copy)
            v73 = "useLayoutEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v293(v596, v597);
        end, 
        useMemo = function(v598, v599) --[[ Line: 2796 ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useMemo";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_16 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v601 = {
                pcall(updateMemo, v598, v599)
            };
            l_ReactCurrentDispatcher_0.current = l_current_16;
            if not v601[1] then
                error(v601[2]);
            end;
            return unpack(v601, 2);
        end, 
        useReducer = function(v602, v603, v604) --[[ Line: 2813 ]] --[[ Name: useReducer ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useReducer";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_17 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v606, v607, v608 = pcall(updateReducer, v602, v603, v604);
            l_ReactCurrentDispatcher_0.current = l_current_17;
            if not v606 then
                error(v607);
            end;
            return v607, v608;
        end, 
        useRef = function(v609) --[[ Line: 2833 ]] --[[ Name: useRef ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useRef";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateRef(v609);
        end, 
        useBinding = function(v610) --[[ Line: 2840 ]] --[[ Name: useBinding ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useBinding";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateBinding(v610);
        end, 
        useState = function(v611) --[[ Line: 2846 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useState";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_18 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v613, v614, v615 = pcall(updateState, v611);
            l_ReactCurrentDispatcher_0.current = l_current_18;
            if not v613 then
                error(v614);
            end;
            return v614, v615;
        end, 
        useDebugValue = function(v616, v617) --[[ Line: 2861 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_mountDebugValue_0 (copy)
            v73 = "useDebugValue";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_mountDebugValue_0(v616, v617);
        end, 
        useMutableSource = function(v618, v619, v620) --[[ Line: 2879 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useMutableSource";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateMutableSource(v618, v619, v620);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2895 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useOpaqueIdentifier";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v82 = {
        readContext = function(v621, v622) --[[ Line: 2906 ]] --[[ Name: readContext ]]
            -- upvalues: l_console_0 (copy), l_readContext_0 (copy)
            l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
            return l_readContext_0(v621, v622);
        end, 
        useCallback = function(v623, v624) --[[ Line: 2910 ]] --[[ Name: useCallback ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useCallback";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateCallback(v623, v624);
        end, 
        useContext = function(v625, v626) --[[ Line: 2916 ]] --[[ Name: useContext ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_readContext_0 (copy)
            v73 = "useContext";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_readContext_0(v625, v626);
        end, 
        useEffect = function(v627, v628) --[[ Line: 2922 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v279 (copy)
            v73 = "useEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v279(v627, v628);
        end, 
        useImperativeHandle = function(v629, v630, v631) --[[ Line: 2932 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useImperativeHandle";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateImperativeHandle(v629, v630, v631);
        end, 
        useLayoutEffect = function(v632, v633) --[[ Line: 2942 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v293 (copy)
            v73 = "useLayoutEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v293(v632, v633);
        end, 
        useMemo = function(v634, v635) --[[ Line: 2953 ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useMemo";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_19 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v637 = {
                pcall(updateMemo, v634, v635)
            };
            l_ReactCurrentDispatcher_0.current = l_current_19;
            if not v637[1] then
                error(v637[2]);
            end;
            return unpack(v637, 2);
        end, 
        useReducer = function(v638, v639, v640) --[[ Line: 2970 ]] --[[ Name: useReducer ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useReducer";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_20 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v642, v643, v644 = pcall(rerenderReducer, v638, v639, v640);
            l_ReactCurrentDispatcher_0.current = l_current_20;
            if not v642 then
                error(v643);
            end;
            return v643, v644;
        end, 
        useRef = function(v645) --[[ Line: 2990 ]] --[[ Name: useRef ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useRef";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateRef(v645);
        end, 
        useBinding = function(v646) --[[ Line: 2997 ]] --[[ Name: useBinding ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useBinding";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateBinding(v646);
        end, 
        useState = function(v647) --[[ Line: 3003 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useState";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_21 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v649, v650, v651 = pcall(rerenderState, v647);
            l_ReactCurrentDispatcher_0.current = l_current_21;
            if not v649 then
                error(v650);
            end;
            return v650, v651;
        end, 
        useDebugValue = function(v652, v653) --[[ Line: 3018 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_mountDebugValue_0 (copy)
            v73 = "useDebugValue";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_mountDebugValue_0(v652, v653);
        end, 
        useMutableSource = function(v654, v655, v656) --[[ Line: 3036 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useMutableSource";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateMutableSource(v654, v655, v656);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 3052 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useOpaqueIdentifier";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return rerenderOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
end;
v66.renderWithHooks = function(v657, v658, v659, v660, v661, v662) --[[ Line: 3063 ]] --[[ Name: renderWithHooks ]]
    -- upvalues: l_l_NoLanes_0_0 (ref), v68 (ref), l___DEV___0 (copy), v74 (ref), v75 (ref), l_NoLanes_0 (copy), l_ReactCurrentDispatcher_0 (copy), v78 (ref), v77 (ref), v76 (ref), v350 (copy), v351 (copy), v72 (ref), l_Error_0 (copy), v69 (ref), v70 (ref), v79 (ref), v352 (copy), v349 (copy), v73 (ref), v71 (ref)
    l_l_NoLanes_0_0 = v662;
    v68 = v658;
    if l___DEV___0 then
        v74 = if v657 ~= nil then v657._debugHookTypes else nil;
        v75 = 0;
    end;
    v658.memoizedState = nil;
    v658.updateQueue = nil;
    v658.lanes = l_NoLanes_0;
    if l___DEV___0 then
        if v657 ~= nil and v657.memoizedState ~= nil then
            l_ReactCurrentDispatcher_0.current = v78;
        elseif v74 ~= nil then
            l_ReactCurrentDispatcher_0.current = v77;
        else
            l_ReactCurrentDispatcher_0.current = v76;
        end;
    else
        l_ReactCurrentDispatcher_0.current = (not (v657 ~= nil) or v657.memoizedState == nil) and v350 or v351;
    end;
    local v663 = v659(v660, v661);
    if v72 then
        local v664 = 0;
        repeat
            v72 = false;
            if v664 >= 25 then
                error(l_Error_0.new("Too many re-renders. React limits the number of renders to prevent " .. "an infinite loop."));
            end;
            v664 = v664 + 1;
            v69 = nil;
            v70 = nil;
            v658.updateQueue = nil;
            if l___DEV___0 then
                v75 = 0;
            end;
            l_ReactCurrentDispatcher_0.current = l___DEV___0 and v79 or v352;
            v663 = v659(v660, v661);
        until not v72;
    end;
    l_ReactCurrentDispatcher_0.current = v349;
    if l___DEV___0 then
        v658._debugHookTypes = v74;
    end;
    local v665 = false;
    if v69 ~= nil then
        v665 = v69.next ~= nil;
    end;
    l_l_NoLanes_0_0 = l_NoLanes_0;
    v68 = nil;
    v69 = nil;
    v70 = nil;
    if l___DEV___0 then
        v73 = nil;
        v74 = nil;
        v75 = 0;
    end;
    v71 = false;
    if v665 then
        error(l_Error_0.new("Rendered fewer hooks than expected. This may be caused by an accidental " .. "early return statement."));
    end;
    return v663;
end;
return v66;