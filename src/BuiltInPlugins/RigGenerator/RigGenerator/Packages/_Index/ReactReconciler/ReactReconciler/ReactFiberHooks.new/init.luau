local function _(v0) --[[ Line: 12 ]] --[[ Name: unimplemented ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. v0);
    error("FIXME (roblox): " .. v0 .. " is unimplemented");
end;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Error_0 = v3.Error;
local l_Object_0 = v3.Object;
local v7 = require(l_Parent_0.Cryo);
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
local function _(v50, v51) --[[ Line: 108 ]] --[[ Name: is ]]
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
if _G.__DEV__ then
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
local _ = function(v83) --[[ Line: 249 ]] --[[ Name: getHighestIndex ]]
    local v84 = 0;
    for v85, _ in v83 do
        if v84 < v85 then
            v84 = v85;
        end;
    end;
    return v84;
end;
local function _() --[[ Line: 257 ]] --[[ Name: mountHookTypesDev ]]
    -- upvalues: v73 (ref), v74 (ref)
    if _G.__DEV__ then
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
updateHookTypesDev = function() --[[ Line: 270 ]] --[[ Name: updateHookTypesDev ]]
    -- upvalues: v73 (ref), v74 (ref), v75 (ref)
    if _G.__DEV__ then
        local l_v73_1 = v73;
        if v74 ~= nil then
            v75 = v75 + 1;
            if v74[v75] ~= l_v73_1 then
                warnOnHookMismatchInDev(l_v73_1);
            end;
        end;
    end;
end;
local function _(v91) --[[ Line: 284 ]] --[[ Name: checkDepsAreArrayDev ]]
    -- upvalues: l_Array_0 (copy), l_console_0 (copy), v73 (ref)
    if _G.__DEV__ and v91 ~= nil and not l_Array_0.isArray(v91) then
        l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (typeof(v91)));
    end;
end;
warnOnHookMismatchInDev = function(v93) --[[ Line: 299 ]] --[[ Name: warnOnHookMismatchInDev ]]
    -- upvalues: l_getComponentName_0 (copy), v68 (ref), v64 (ref), v74 (ref), v75 (ref), l_console_0 (copy)
    if _G.__DEV__ then
        local v94 = l_getComponentName_0(v68.type) or "Component";
        if not v64[v94] then
            v64[v94] = true;
            if v74 ~= nil then
                local v95 = "";
                for v96 = 1, v75 do
                    local v97 = v74[v96];
                    local v98 = nil;
                    v98 = if v96 == v75 then v93 else v97;
                    local v99 = tostring(v96) .. ". " .. (v97 or "undefined");
                    while string.len(v99) < 30 do
                        v99 = v99 .. " ";
                    end;
                    v95 = v95 .. v99 .. v98 .. "\n";
                end;
                l_console_0.error("React has detected a change in the order of Hooks called by %s. " .. "This will lead to bugs and errors if not fixed. " .. "For more information, read the Rules of Hooks: https://reactjs.org/link/rules-of-hooks\n\n" .. "   Previous render            Next render\n" .. "   ------------------------------------------------------\n" .. "%s" .. "   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n", v94, v95);
            end;
        end;
    end;
end;
local function v100() --[[ Line: 350 ]] --[[ Name: throwInvalidHookError ]]
    -- upvalues: l_Error_0 (copy)
    error(l_Error_0.new("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for" .. " one of the following reasons:\n" .. "1. You might have mismatching versions of React and the renderer (such as React DOM)\n" .. "2. You might be breaking the Rules of Hooks\n" .. "3. You might have more than one copy of React in the same app\n" .. "See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem."));
end;
local function v113(v101, v102) --[[ Line: 363 ]] --[[ Name: areHookInputsEqual ]]
    -- upvalues: l_console_0 (copy), v73 (ref)
    if _G.__DEV__ then

    end;
    if v102 == nil then
        if _G.__DEV__ then
            l_console_0.error("%s received a final argument during this render, but not during " .. "the previous render. Even though the final argument is optional, " .. "its type cannot change between renders.", v73);
        end;
        return false;
    else
        local v103 = 0;
        for v104, _ in v101 do
            if v103 < v104 then
                v103 = v104;
            end;
        end;
        local l_v103_0 = v103;
        local v107 = 0;
        for v108, _ in v102 do
            if v107 < v108 then
                v107 = v108;
            end;
        end;
        v103 = v107;
        if l_v103_0 ~= v103 then
            return false;
        else
            for v110 = 1, math.min(v103, l_v103_0) do
                local v111 = v101[v110];
                local v112 = v102[v110];
                if not (v111 == v112 and (v111 ~= 0 or 1 / v111 == 1 / v112) or v111 ~= v111 and v112 ~= v112) then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v66.bailoutHooks = function(v114, v115, v116) --[[ Line: 430 ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), l_MountPassiveDev_0 (copy), l_Passive_0 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy), l_removeLanes_0 (copy)
    v115.updateQueue = v114.updateQueue;
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        v115.flags = bit32.band(v115.flags, (bit32.bnot((bit32.bor(l_MountPassiveDev_0, l_Passive_0, l_MountLayoutDev_0, l_Update_0)))));
    else
        v115.flags = bit32.band(v115.flags, (bit32.bnot((bit32.bor(l_Passive_0, l_Update_0)))));
    end;
    v114.lanes = l_removeLanes_0(v114.lanes, v116);
end;
local v117 = false;
v66.resetHooksAfterThrow = function() --[[ Line: 457 ]]
    -- upvalues: l_ReactCurrentDispatcher_0 (copy), v66 (copy), v71 (ref), v68 (ref), l_l_NoLanes_0_0 (ref), l_NoLanes_0 (copy), v69 (ref), v70 (ref), v74 (ref), v75 (ref), v73 (ref), v117 (ref), v72 (ref)
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
    if _G.__DEV__ then
        v74 = nil;
        v75 = 0;
        v73 = nil;
        v117 = false;
    end;
    v72 = false;
end;
local function _() --[[ Line: 502 ]] --[[ Name: mountWorkInProgressHook ]]
    -- upvalues: v70 (ref), v68 (ref)
    local v120 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v120;
        v70 = v120;
    else
        v70.next = v120;
        v70 = v120;
    end;
    return v70;
end;
local function v126() --[[ Line: 525 ]] --[[ Name: updateWorkInProgressHook ]]
    -- upvalues: v69 (ref), v68 (ref), v70 (ref), l_Error_0 (copy)
    local v122 = nil;
    if v69 == nil then
        local l_alternate_0 = v68.alternate;
        v122 = if l_alternate_0 ~= nil then l_alternate_0.memoizedState else nil;
    else
        v122 = v69.next;
    end;
    local v124 = nil;
    v124 = if v70 == nil then v68.memoizedState else v70.next;
    if v124 ~= nil then
        v70 = v124;
        v124 = v70.next;
        v69 = v122;
    else
        if v122 == nil then
            error(l_Error_0.new("Rendered more hooks than during the previous render."));
        end;
        v69 = v122;
        local v125 = {
            memoizedState = v69.memoizedState, 
            baseState = v69.baseState, 
            baseQueue = v69.baseQueue, 
            queue = v69.queue, 
            next = nil
        };
        if v70 == nil then
            v70 = v125;
            v68.memoizedState = v125;
        else
            v70.next = v125;
            v70 = v125;
        end;
    end;
    return v70;
end;
basicStateReducer = function(v127, v128) --[[ Line: 600 ]] --[[ Name: basicStateReducer ]]
    if typeof(v128) == "function" then
        return v128(v127);
    else
        return v128;
    end;
end;
mountReducer = function(v129, v130, v131) --[[ Line: 609 ]] --[[ Name: mountReducer ]]
    -- upvalues: v70 (ref), v68 (ref)
    local v132 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v132;
        v70 = v132;
    else
        v70.next = v132;
        v70 = v132;
    end;
    local l_v70_0 = v70;
    v132 = nil;
    v132 = if v131 ~= nil then v131(v130) else v130;
    l_v70_0.baseState = v132;
    l_v70_0.memoizedState = l_v70_0.baseState;
    local v134 = {
        pending = nil, 
        dispatch = nil, 
        lastRenderedReducer = v129, 
        lastRenderedState = v132
    };
    l_v70_0.queue = v134;
    local l_v68_0 = v68;
    local function v137(v136, ...) --[[ Line: 636 ]]
        -- upvalues: l_v68_0 (copy), v134 (copy)
        dispatchAction(l_v68_0, v134, v136, ...);
    end;
    v134.dispatch = v137;
    return l_v70_0.memoizedState, v137;
end;
updateReducer = function(v138, _, _) --[[ Line: 646 ]] --[[ Name: updateReducer ]]
    -- upvalues: v126 (copy), v69 (ref), l_l_NoLanes_0_0 (ref), v68 (ref), l_mergeLanes_0 (copy), l_markSkippedUpdateLanes_0 (copy), l_NoLane_0 (copy), l_markWorkInProgressReceivedUpdate_0 (copy)
    local v141 = v126();
    local l_queue_1 = v141.queue;
    assert(l_queue_1 ~= nil, "Should have a queue. This is likely a bug in React. Please file an issue.");
    l_queue_1.lastRenderedReducer = v138;
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
        local v149 = nil;
        local v150 = nil;
        local v151 = nil;
        local l_l_next_1_0 = l_next_1;
        repeat
            local l_lane_0 = l_l_next_1_0.lane;
            if bit32.band(l_l_NoLanes_0_0, l_lane_0) ~= l_lane_0 then
                local v154 = {
                    lane = l_lane_0, 
                    action = l_l_next_1_0.action, 
                    eagerReducer = l_l_next_1_0.eagerReducer, 
                    eagerState = l_l_next_1_0.eagerState, 
                    next = nil
                };
                if v151 == nil then
                    v151 = v154;
                    v150 = v151;
                    v149 = l_baseState_0;
                else
                    v151.next = v154;
                    v151 = v151.next;
                end;
                v68.lanes = l_mergeLanes_0(v68.lanes, l_lane_0);
                l_markSkippedUpdateLanes_0(l_lane_0);
            else
                if v151 ~= nil then
                    v151.next = {
                        lane = l_NoLane_0, 
                        action = l_l_next_1_0.action, 
                        eagerReducer = l_l_next_1_0.eagerReducer, 
                        eagerState = l_l_next_1_0.eagerState, 
                        next = nil
                    };
                    v151 = v151.next;
                end;
                if l_l_next_1_0.eagerReducer == v138 then
                    l_baseState_0 = l_l_next_1_0.eagerState;
                else
                    l_baseState_0 = v138(l_baseState_0, l_l_next_1_0.action);
                end;
            end;
            l_l_next_1_0 = l_l_next_1_0.next;
        until l_l_next_1_0 == nil or l_l_next_1_0 == l_next_1;
        if v151 == nil then
            v149 = l_baseState_0;
        else
            v151.next = v150;
        end;
        local l_l_baseState_0_0 = l_baseState_0;
        local l_memoizedState_1 = v141.memoizedState;
        if not (l_l_baseState_0_0 == l_memoizedState_1 and (l_l_baseState_0_0 ~= 0 or 1 / l_l_baseState_0_0 == 1 / l_memoizedState_1) or l_l_baseState_0_0 ~= l_l_baseState_0_0 and l_memoizedState_1 ~= l_memoizedState_1) then
            l_markWorkInProgressReceivedUpdate_0();
        end;
        v141.memoizedState = l_baseState_0;
        v141.baseState = v149;
        v141.baseQueue = v151;
        l_queue_1.lastRenderedState = l_baseState_0;
    end;
    local l_dispatch_0 = l_queue_1.dispatch;
    return v141.memoizedState, l_dispatch_0;
end;
rerenderReducer = function(v158, _, _) --[[ Line: 786 ]] --[[ Name: rerenderReducer ]]
    -- upvalues: v126 (copy), l_markWorkInProgressReceivedUpdate_0 (copy)
    local v161 = v126();
    local l_queue_2 = v161.queue;
    assert(l_queue_2 ~= nil, "Should have a queue. This is likely a bug in React. Please file an issue.");
    l_queue_2.lastRenderedReducer = v158;
    local l_dispatch_1 = l_queue_2.dispatch;
    local l_pending_1 = l_queue_2.pending;
    local l_memoizedState_2 = v161.memoizedState;
    if l_pending_1 ~= nil then
        l_queue_2.pending = nil;
        local l_next_2 = l_pending_1.next;
        local l_l_next_2_0 = l_next_2;
        repeat
            l_memoizedState_2 = v158(l_memoizedState_2, l_l_next_2_0.action);
            l_l_next_2_0 = l_l_next_2_0.next;
        until l_l_next_2_0 == l_next_2;
        local l_l_memoizedState_2_0 = l_memoizedState_2;
        local l_memoizedState_3 = v161.memoizedState;
        if not (l_l_memoizedState_2_0 == l_memoizedState_3 and (l_l_memoizedState_2_0 ~= 0 or 1 / l_l_memoizedState_2_0 == 1 / l_memoizedState_3) or l_l_memoizedState_2_0 ~= l_l_memoizedState_2_0 and l_memoizedState_3 ~= l_memoizedState_3) then
            l_markWorkInProgressReceivedUpdate_0();
        end;
        v161.memoizedState = l_memoizedState_2;
        if v161.baseQueue == nil then
            v161.baseState = l_memoizedState_2;
        end;
        l_queue_2.lastRenderedState = l_memoizedState_2;
    end;
    return l_memoizedState_2, l_dispatch_1;
end;
readFromUnsubcribedMutableSource = function(v170, v171, v172) --[[ Line: 851 ]] --[[ Name: readFromUnsubcribedMutableSource ]]
    -- upvalues: l_warnAboutMultipleRenderersDEV_0 (copy), l_getWorkInProgressVersion_0 (copy), l_isSubsetOfLanes_0 (copy), l_l_NoLanes_0_0 (ref), l_setWorkInProgressVersion_0 (copy), l_console_0 (copy), l_markSourceAsDirty_0 (copy), l_Error_0 (copy)
    if _G.__DEV__ then
        l_warnAboutMultipleRenderersDEV_0(v171);
    end;
    local v173 = v171._getVersion(v171._source);
    local v174 = false;
    local v175 = l_getWorkInProgressVersion_0(v171);
    if v175 ~= nil then
        v174 = v175 == v173;
    else
        v174 = l_isSubsetOfLanes_0(l_l_NoLanes_0_0, v170.mutableReadLanes);
        if v174 then
            l_setWorkInProgressVersion_0(v171, v173);
        end;
    end;
    if v174 then
        local v176 = v172(v171._source);
        if _G.__DEV__ and typeof(v176) == "function" then
            l_console_0.error("Mutable source should not return a function as the snapshot value. " .. "Functions may close over mutable values and cause tearing.");
        end;
        return v176;
    else
        l_markSourceAsDirty_0(v171);
        error(l_Error_0.new("Cannot read from mutable source during the current render without tearing. This is a bug in React. Please file an issue."));
        return;
    end;
end;
useMutableSource = function(v177, v178, v179, v180) --[[ Line: 932 ]] --[[ Name: useMutableSource ]]
    -- upvalues: l_getWorkInProgressRoot_0 (copy), l_invariant_0 (copy), l_ReactCurrentDispatcher_0 (copy), v70 (ref), v68 (ref), l_console_0 (copy), l_requestUpdateLane_0 (copy), l_markRootMutableRead_0 (copy), l_markRootEntangled_0 (copy)
    local v181 = l_getWorkInProgressRoot_0();
    l_invariant_0(v181 ~= nil, "Expected a work-in-progress root. This is a bug in React. Please file an issue.");
    local l__getVersion_0 = v178._getVersion;
    local v183 = l__getVersion_0(v178._source);
    local l_current_0 = l_ReactCurrentDispatcher_0.current;
    assert(l_current_0 ~= nil, "dispatcher was nil, this is a bug in React");
    local v185, v186 = l_current_0.useState(function() --[[ Line: 951 ]]
        -- upvalues: v181 (copy), v178 (copy), v179 (copy)
        return readFromUnsubcribedMutableSource(v181, v178, v179);
    end);
    local l_v185_0 = v185;
    local l_v70_1 = v70;
    local l_memoizedState_4 = v177.memoizedState;
    if l_memoizedState_4.refs == nil then
        error((tostring(debug.traceback())));
    end;
    local l_refs_0 = l_memoizedState_4.refs;
    local l_getSnapshot_0 = l_refs_0.getSnapshot;
    local l_source_0 = l_memoizedState_4.source;
    local l_subscribe_0 = l_memoizedState_4.subscribe;
    local l_v68_1 = v68;
    v177.memoizedState = {
        refs = l_refs_0, 
        source = v178, 
        subscribe = v180
    };
    l_current_0.useEffect(function() --[[ Line: 980 ]]
        -- upvalues: l_refs_0 (copy), v179 (copy), v186 (ref), l__getVersion_0 (copy), v178 (copy), v183 (copy), l_console_0 (ref), l_v185_0 (ref), l_requestUpdateLane_0 (ref), l_v68_1 (copy), l_markRootMutableRead_0 (ref), v181 (copy), l_markRootEntangled_0 (ref)
        l_refs_0.getSnapshot = v179;
        l_refs_0.setSnapshot = v186;
        local v195 = l__getVersion_0(v178._source);
        local l_v183_0 = v183;
        if not (l_v183_0 == v195 and (l_v183_0 ~= 0 or 1 / l_v183_0 == 1 / v195) or l_v183_0 ~= l_v183_0 and v195 ~= v195) then
            local v197 = v179(v178._source);
            if _G.__DEV__ and typeof(v197) == "function" then
                l_console_0.error("Mutable source should not return a function as the snapshot value. " .. "Functions may close over mutable values and cause tearing.");
            end;
            local l_l_v185_0_0 = l_v185_0;
            if not (l_l_v185_0_0 == v197 and (l_l_v185_0_0 ~= 0 or 1 / l_l_v185_0_0 == 1 / v197) or l_l_v185_0_0 ~= l_l_v185_0_0 and v197 ~= v197) then
                v186(v197);
                l_v183_0 = l_requestUpdateLane_0(l_v68_1);
                l_markRootMutableRead_0(v181, l_v183_0);
            end;
            l_markRootEntangled_0(v181, v181.mutableReadLanes);
        end;
    end, {
        v179, 
        v178, 
        v180
    });
    l_current_0.useEffect(function() --[[ Line: 1018 ]]
        -- upvalues: l_refs_0 (copy), v178 (copy), l_requestUpdateLane_0 (ref), l_v68_1 (copy), l_markRootMutableRead_0 (ref), v181 (copy), v180 (copy), l_console_0 (ref)
        local function v204() --[[ Line: 1019 ]]
            -- upvalues: l_refs_0 (ref), v178 (ref), l_requestUpdateLane_0 (ref), l_v68_1 (ref), l_markRootMutableRead_0 (ref), v181 (ref)
            local l_getSnapshot_1 = l_refs_0.getSnapshot;
            local l_setSnapshot_0 = l_refs_0.setSnapshot;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 1024 ]]
                -- upvalues: l_setSnapshot_0 (copy), l_getSnapshot_1 (copy), v178 (ref), l_requestUpdateLane_0 (ref), l_v68_1 (ref), l_markRootMutableRead_0 (ref), v181 (ref)
                l_setSnapshot_0(l_getSnapshot_1(v178._source));
                local v201 = l_requestUpdateLane_0(l_v68_1);
                l_markRootMutableRead_0(v181, v201);
            end);
            if not l_status_0 then
                l_setSnapshot_0(function() --[[ Line: 1039 ]]
                    -- upvalues: l_result_0 (copy)
                    error(l_result_0);
                end);
            end;
        end;
        local v205 = v180(v178._source, v204);
        if _G.__DEV__ and typeof(v205) ~= "function" then
            l_console_0.error("Mutable source subscribe function must return an unsubscribe function.");
        end;
        return v205;
    end, {
        v178, 
        v180
    });
    if (l_getSnapshot_0 ~= v179 or l_getSnapshot_0 == 0 and 1 / l_getSnapshot_0 ~= 1 / v179) and (l_getSnapshot_0 == l_getSnapshot_0 or v179 == v179) or (l_source_0 ~= v178 or l_source_0 == 0 and 1 / l_source_0 ~= 1 / v178) and (l_source_0 == l_source_0 or v178 == v178) or not (l_subscribe_0 == v180 and (l_subscribe_0 ~= 0 or 1 / l_subscribe_0 == 1 / v180) or l_subscribe_0 ~= l_subscribe_0 and v180 ~= v180) then
        local v206 = {
            pending = nil, 
            dispatch = nil, 
            lastRenderedReducer = basicStateReducer, 
            lastRenderedState = l_v185_0
        };
        local l_v68_2 = v68;
        v186 = function(...) --[[ Line: 1088 ]]
            -- upvalues: l_v68_2 (copy), v206 (copy)
            dispatchAction(l_v68_2, v206, ...);
        end;
        v206.dispatch = v186;
        l_v70_1.queue = v206;
        l_v70_1.baseQueue = nil;
        l_v185_0 = readFromUnsubcribedMutableSource(v181, v178, v179);
        l_v70_1.baseState = l_v185_0;
        l_v70_1.memoizedState = l_v70_1.baseState;
    end;
    return l_v185_0;
end;
mountMutableSource = function(v208, v209, v210) --[[ Line: 1102 ]] --[[ Name: mountMutableSource ]]
    -- upvalues: v70 (ref), v68 (ref)
    local v211 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v211;
        v70 = v211;
    else
        v70.next = v211;
        v70 = v211;
    end;
    local l_v70_2 = v70;
    l_v70_2.memoizedState = {
        refs = {
            getSnapshot = v209, 
            setSnapshot = nil
        }, 
        source = v208, 
        subscribe = v210
    };
    return useMutableSource(l_v70_2, v208, v209, v210);
end;
updateMutableSource = function(v213, v214, v215) --[[ Line: 1119 ]] --[[ Name: updateMutableSource ]]
    -- upvalues: v126 (copy)
    local v216 = v126();
    return useMutableSource(v216, v213, v214, v215);
end;
mountState = function(v217) --[[ Line: 1128 ]] --[[ Name: mountState ]]
    -- upvalues: v70 (ref), v68 (ref)
    local v218 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v218;
        v70 = v218;
    else
        v70.next = v218;
        v70 = v218;
    end;
    local l_v70_3 = v70;
    if typeof(v217) == "function" then
        v217 = v217();
    end;
    l_v70_3.baseState = v217;
    l_v70_3.memoizedState = l_v70_3.baseState;
    v218 = {
        pending = nil, 
        dispatch = nil, 
        lastRenderedReducer = nil, 
        lastRenderedState = v217, 
        lastRenderedReducer = basicStateReducer
    };
    l_v70_3.queue = v218;
    local l_v68_3 = v68;
    local function v222(v221, ...) --[[ Line: 1152 ]]
        -- upvalues: l_v68_3 (copy), v218 (copy)
        dispatchAction(l_v68_3, v218, v221, ...);
    end;
    v218.dispatch = v222;
    return l_v70_3.memoizedState, v222;
end;
updateState = function(v223) --[[ Line: 1161 ]] --[[ Name: updateState ]]
    return updateReducer(basicStateReducer, v223);
end;
rerenderState = function(v224) --[[ Line: 1167 ]] --[[ Name: rerenderState ]]
    return rerenderReducer(basicStateReducer, v224);
end;
local function v233(v225, v226, v227, v228) --[[ Line: 1173 ]] --[[ Name: pushEffect ]]
    -- upvalues: v68 (ref)
    local v229 = {
        tag = v225, 
        create = v226, 
        destroy = v227, 
        deps = v228, 
        next = nil
    };
    local l_updateQueue_0 = v68.updateQueue;
    if l_updateQueue_0 == nil then
        l_updateQueue_0 = {
            lastEffect = nil
        };
        v68.updateQueue = l_updateQueue_0;
        v229.next = v229;
        l_updateQueue_0.lastEffect = v229;
        return v229;
    else
        local l_lastEffect_0 = l_updateQueue_0.lastEffect;
        if l_lastEffect_0 == nil then
            l_updateQueue_0.lastEffect = v229;
            v229.next = v229;
            return v229;
        else
            local l_next_3 = l_lastEffect_0.next;
            l_lastEffect_0.next = v229;
            v229.next = l_next_3;
            l_updateQueue_0.lastEffect = v229;
            return v229;
        end;
    end;
end;
mountBinding = function(v234) --[[ Line: 1208 ]] --[[ Name: mountBinding ]]
    -- upvalues: v70 (ref), v68 (ref), l_createBinding_0 (copy)
    local v235 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v235;
        v70 = v235;
    else
        v70.next = v235;
        v70 = v235;
    end;
    local l_v70_4 = v70;
    local v237;
    v235, v237 = l_createBinding_0(v234);
    l_v70_4.memoizedState = {
        v235, 
        v237
    };
    return v235, v237;
end;
updateBinding = function(_) --[[ Line: 1218 ]] --[[ Name: updateBinding ]]
    -- upvalues: v126 (copy)
    return unpack(v126().memoizedState);
end;
mountRef = function(v239) --[[ Line: 1224 ]] --[[ Name: mountRef ]]
    -- upvalues: v70 (ref), v68 (ref), l_createRef_0 (copy)
    local v240 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v240;
        v70 = v240;
    else
        v70.next = v240;
        v70 = v240;
    end;
    local l_v70_5 = v70;
    v240 = l_createRef_0();
    v240.current = v239;
    l_v70_5.memoizedState = v240;
    return v240;
end;
updateRef = function(_) --[[ Line: 1237 ]] --[[ Name: updateRef ]]
    -- upvalues: v126 (copy)
    return v126().memoizedState;
end;
local function v249(v243, v244, v245, v246) --[[ Line: 1242 ]] --[[ Name: mountEffectImpl ]]
    -- upvalues: v70 (ref), v68 (ref), v233 (copy), l_HasEffect_0 (copy)
    local v247 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v247;
        v70 = v247;
    else
        v70.next = v247;
        v70 = v247;
    end;
    local l_v70_6 = v70;
    v68.flags = bit32.bor(v68.flags, v243);
    l_v70_6.memoizedState = v233(bit32.bor(l_HasEffect_0, v244), v245, nil, v246);
end;
updateEffectImpl = function(v250, v251, v252, v253) --[[ Line: 1258 ]] --[[ Name: updateEffectImpl ]]
    -- upvalues: v126 (copy), v69 (ref), v113 (copy), v233 (copy), v68 (ref), l_HasEffect_0 (copy)
    local v254 = v126();
    local v255 = nil;
    if v69 ~= nil then
        local l_memoizedState_5 = v69.memoizedState;
        v255 = l_memoizedState_5.destroy;
        if v253 ~= nil then
            local l_deps_0 = l_memoizedState_5.deps;
            if v113(v253, l_deps_0) then
                v254.memoizedState = v233(v251, v252, v255, v253);
                return;
            end;
        end;
    end;
    v68.flags = bit32.bor(v68.flags, v250);
    v254.memoizedState = v233(bit32.bor(l_HasEffect_0, v251), v252, v255, v253);
end;
local function v268(v258, v259) --[[ Line: 1288 ]] --[[ Name: mountEffect ]]
    -- upvalues: l_warnIfNotCurrentlyActingEffectsInDEV_0 (copy), v68 (ref), l_enableDoubleInvokingEffects_0 (copy), l_MountPassiveDev_0 (copy), l_Passive_0 (copy), l_PassiveStatic_0 (copy), l_Passive_1 (copy), v70 (ref), v233 (copy), l_HasEffect_0 (copy)
    if _G.__DEV__ and (typeof(_G.jest) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__) then
        l_warnIfNotCurrentlyActingEffectsInDEV_0(v68);
    end;
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        local v260 = bit32.bor(l_MountPassiveDev_0, l_Passive_0, l_PassiveStatic_0);
        local l_l_Passive_1_0 = l_Passive_1;
        local v262 = {
            memoizedState = nil, 
            baseState = nil, 
            baseQueue = nil, 
            queue = nil, 
            next = nil
        };
        if v70 == nil then
            v68.memoizedState = v262;
            v70 = v262;
        else
            v70.next = v262;
            v70 = v262;
        end;
        local l_v70_7 = v70;
        v68.flags = bit32.bor(v68.flags, v260);
        l_v70_7.memoizedState = v233(bit32.bor(l_HasEffect_0, l_l_Passive_1_0), v258, nil, v259);
        return;
    else
        local v264 = bit32.bor(l_Passive_0, l_PassiveStatic_0);
        local l_l_Passive_1_1 = l_Passive_1;
        local v266 = {
            memoizedState = nil, 
            baseState = nil, 
            baseQueue = nil, 
            queue = nil, 
            next = nil
        };
        if v70 == nil then
            v68.memoizedState = v266;
            v70 = v266;
        else
            v70.next = v266;
            v70 = v266;
        end;
        local l_v70_8 = v70;
        v68.flags = bit32.bor(v68.flags, v264);
        l_v70_8.memoizedState = v233(bit32.bor(l_HasEffect_0, l_l_Passive_1_1), v258, nil, v259);
        return;
    end;
end;
local function v271(v269, v270) --[[ Line: 1318 ]] --[[ Name: updateEffect ]]
    -- upvalues: l_warnIfNotCurrentlyActingEffectsInDEV_0 (copy), v68 (ref), l_Passive_0 (copy), l_Passive_1 (copy)
    if _G.__DEV__ and (typeof(_G.jest) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__) then
        l_warnIfNotCurrentlyActingEffectsInDEV_0(v68);
    end;
    updateEffectImpl(l_Passive_0, l_Passive_1, v269, v270);
end;
local function v282(v272, v273) --[[ Line: 1338 ]] --[[ Name: mountLayoutEffect ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy), l_Layout_0 (copy), v70 (ref), v68 (ref), v233 (copy), l_HasEffect_0 (copy)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        local v274 = bit32.bor(l_MountLayoutDev_0, l_Update_0);
        local l_l_Layout_0_0 = l_Layout_0;
        local v276 = {
            memoizedState = nil, 
            baseState = nil, 
            baseQueue = nil, 
            queue = nil, 
            next = nil
        };
        if v70 == nil then
            v68.memoizedState = v276;
            v70 = v276;
        else
            v70.next = v276;
            v70 = v276;
        end;
        local l_v70_9 = v70;
        v68.flags = bit32.bor(v68.flags, v274);
        l_v70_9.memoizedState = v233(bit32.bor(l_HasEffect_0, l_l_Layout_0_0), v272, nil, v273);
        return;
    else
        local l_l_Update_0_0 = l_Update_0;
        local l_l_Layout_0_1 = l_Layout_0;
        local v280 = {
            memoizedState = nil, 
            baseState = nil, 
            baseQueue = nil, 
            queue = nil, 
            next = nil
        };
        if v70 == nil then
            v68.memoizedState = v280;
            v70 = v280;
        else
            v70.next = v280;
            v70 = v280;
        end;
        local l_v70_10 = v70;
        v68.flags = bit32.bor(v68.flags, l_l_Update_0_0);
        l_v70_10.memoizedState = v233(bit32.bor(l_HasEffect_0, l_l_Layout_0_1), v272, nil, v273);
        return;
    end;
end;
local function v285(v283, v284) --[[ Line: 1355 ]] --[[ Name: updateLayoutEffect ]]
    -- upvalues: l_Update_0 (copy), l_Layout_0 (copy)
    updateEffectImpl(l_Update_0, l_Layout_0, v283, v284);
end;
imperativeHandleEffect = function(v286, v287) --[[ Line: 1363 ]] --[[ Name: imperativeHandleEffect ]]
    -- upvalues: l_Object_0 (copy), l_console_0 (copy), l_Array_0 (copy)
    if typeof(v287) == "function" then
        v287((v286()));
        return function() --[[ Line: 1372 ]]
            -- upvalues: v287 (copy)
            return v287(nil);
        end;
    elseif v287 ~= nil then
        if _G.__DEV__ then
            local v288 = false;
            if getmetatable(v287) ~= nil then
                v288 = #l_Object_0.keys(v287) == 0;
            end;
            if not v288 then
                l_console_0.error("Expected useImperativeHandle() first argument to either be a " .. "ref callback or React.createRef() object. Instead received: %s.", "an object with keys {" .. l_Array_0.join(l_Object_0.keys(v287), ", ") .. "}");
            end;
        end;
        v287.current = v286();
        return function() --[[ Line: 1394 ]]
            -- upvalues: v287 (copy)
            v287.current = nil;
        end;
    else
        return nil;
    end;
end;
mountImperativeHandle = function(v289, v290, v291) --[[ Line: 1403 ]] --[[ Name: mountImperativeHandle ]]
    -- upvalues: l_console_0 (copy), l_Array_0 (copy), l_enableDoubleInvokingEffects_0 (copy), v249 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy), l_Layout_0 (copy)
    if _G.__DEV__ and typeof(v290) ~= "function" then
        l_console_0.error("Expected useImperativeHandle() second argument to be a function " .. "that creates a handle. Instead received: %s.", if v290 ~= nil then typeof(v290) else "nil");
    end;
    local v292 = if v291 ~= nil then l_Array_0.concat(v291, {
        v289
    }) else nil;
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        return v249(bit32.bor(l_MountLayoutDev_0, l_Update_0), l_Layout_0, function() --[[ Line: 1426 ]]
            -- upvalues: v290 (copy), v289 (copy)
            return imperativeHandleEffect(v290, v289);
        end, v292);
    else
        return v249(l_Update_0, l_Layout_0, function() --[[ Line: 1435 ]]
            -- upvalues: v290 (copy), v289 (copy)
            return imperativeHandleEffect(v290, v289);
        end, v292);
    end;
end;
updateImperativeHandle = function(v293, v294, v295) --[[ Line: 1443 ]] --[[ Name: updateImperativeHandle ]]
    -- upvalues: l_console_0 (copy), v7 (copy), l_Update_0 (copy), l_Layout_0 (copy)
    if _G.__DEV__ and typeof(v294) ~= "function" then
        local v296 = "nil";
        if v294 then
            v296 = typeof(v294);
        end;
        l_console_0.error("Expected useImperativeHandle() second argument to be a function " .. "that creates a handle. Instead received: %s.", v296);
    end;
    local v297 = nil;
    if v295 ~= nil then
        v297 = v7.List.join(v295, {
            v293
        });
    end;
    return updateEffectImpl(l_Update_0, l_Layout_0, function() --[[ Line: 1472 ]]
        -- upvalues: v294 (copy), v293 (copy)
        return imperativeHandleEffect(v294, v293);
    end, v297);
end;
mountDebugValue = function(_, _) --[[ Line: 1479 ]] --[[ Name: mountDebugValue ]]

end;
local l_mountDebugValue_0 = mountDebugValue;
mountCallback = function(v301, v302) --[[ Line: 1487 ]] --[[ Name: mountCallback ]]
    -- upvalues: v70 (ref), v68 (ref)
    local v303 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v303;
        v70 = v303;
    else
        v70.next = v303;
        v70 = v303;
    end;
    v70.memoizedState = {
        v301, 
        v302
    };
    return v301;
end;
updateCallback = function(v304, v305) --[[ Line: 1495 ]] --[[ Name: updateCallback ]]
    -- upvalues: v126 (copy), v113 (copy)
    local v306 = v126();
    local l_memoizedState_6 = v306.memoizedState;
    if l_memoizedState_6 ~= nil and v305 ~= nil then
        local v308 = l_memoizedState_6[2];
        if v113(v305, v308) then
            return l_memoizedState_6[1];
        end;
    end;
    v306.memoizedState = {
        v304, 
        v305
    };
    return v304;
end;
mountMemo = function(v309, v310) --[[ Line: 1514 ]] --[[ Name: mountMemo ]]
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
    local l_v70_11 = v70;
    v311 = {
        v309()
    };
    l_v70_11.memoizedState = {
        v311, 
        v310
    };
    return unpack(v311);
end;
updateMemo = function(v313, v314) --[[ Line: 1529 ]] --[[ Name: updateMemo ]]
    -- upvalues: v126 (copy), v113 (copy)
    local v315 = v126();
    local l_memoizedState_7 = v315.memoizedState;
    if l_memoizedState_7 ~= nil and v314 ~= nil then
        local v317 = l_memoizedState_7[2];
        if v113(v314, v317) then
            return unpack(l_memoizedState_7[1]);
        end;
    end;
    local v318 = {
        v313()
    };
    v315.memoizedState = {
        v318, 
        v314
    };
    return unpack(v318);
end;
v66.getIsUpdatingOpaqueValueInRenderPhaseInDEV = function() --[[ Line: 1682 ]]
    if _G.__DEV__ then
        return false;
    else
        return nil;
    end;
end;
mountOpaqueIdentifier = function() --[[ Line: 1704 ]] --[[ Name: mountOpaqueIdentifier ]]
    -- upvalues: l_console_0 (copy), l_makeClientId_0 (copy), l_getIsHydrating_0 (copy)
    local v319 = nil;
    if _G.__DEV__ then
        l_console_0.warn("!!! unimplemented: warnOnOpaqueIdentifierAccessInDEV");
    else
        v319 = l_makeClientId_0;
    end;
    if l_getIsHydrating_0() then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("UNIMPLEMENTED ERROR: " .. "ReactFiberHooks: getIsHydrating() true");
        error("FIXME (roblox): " .. "ReactFiberHooks: getIsHydrating() true" .. " is unimplemented");
        return nil;
    else
        local v320 = v319();
        mountState(v320);
        return v320;
    end;
end;
updateOpaqueIdentifier = function() --[[ Line: 1771 ]] --[[ Name: updateOpaqueIdentifier ]]
    local v321, _ = updateState(nil);
    return v321;
end;
rerenderOpaqueIdentifier = function() --[[ Line: 1776 ]] --[[ Name: rerenderOpaqueIdentifier ]]
    local v323, _ = rerenderState(nil);
    return v323;
end;
dispatchAction = function(v325, v326, v327, ...) --[[ Line: 1781 ]] --[[ Name: dispatchAction ]]
    -- upvalues: l_console_0 (copy), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), v68 (ref), v71 (ref), v72 (ref), l_NoLanes_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref), l_warnIfNotScopedWithMatchingAct_0 (copy), l_warnIfNotCurrentlyActingUpdatesInDEV_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_enableDebugTracing_0 (copy), l_DebugTracingMode_0 (copy), l_getComponentName_0 (copy), l_logStateUpdateScheduled_0 (copy), l_enableSchedulingProfiler_0 (copy), l_markStateUpdateScheduled_0 (copy)
    if _G.__DEV__ then
        local v328 = select("#", ...);
        local v329 = nil;
        if v328 == 1 then
            v329 = select(1, ...);
        end;
        if typeof(v329) == "function" then
            l_console_0.error("State updates from the useState() and useReducer() Hooks don't support the " .. "second callback argument. To execute a side effect after " .. "rendering, declare it in the component body with useEffect().");
        end;
    end;
    local v330 = l_requestEventTime_0();
    local v331 = l_requestUpdateLane_0(v325);
    local v332 = {
        lane = v331, 
        action = v327, 
        eagerReducer = nil, 
        eagerState = nil, 
        next = nil
    };
    local l_pending_2 = v326.pending;
    if l_pending_2 == nil then
        v332.next = v332;
    else
        v332.next = l_pending_2.next;
        l_pending_2.next = v332;
    end;
    v326.pending = v332;
    local l_alternate_1 = v325.alternate;
    if v325 == v68 or l_alternate_1 ~= nil and l_alternate_1 == v68 then
        v71 = true;
        v72 = true;
    else
        if v325.lanes == l_NoLanes_0 and (l_alternate_1 == nil or l_alternate_1.lanes == l_NoLanes_0) then
            local l_lastRenderedReducer_0 = v326.lastRenderedReducer;
            if l_lastRenderedReducer_0 ~= nil then
                local v336 = nil;
                if _G.__DEV__ then
                    v336 = l_ReactCurrentDispatcher_0.current;
                    l_ReactCurrentDispatcher_0.current = v81;
                end;
                local l_lastRenderedState_0 = v326.lastRenderedState;
                local l_status_1, l_result_1 = pcall(l_lastRenderedReducer_0, l_lastRenderedState_0, v327);
                if l_status_1 then
                    v332.eagerReducer = l_lastRenderedReducer_0;
                    v332.eagerState = l_result_1;
                end;
                if _G.__DEV__ then
                    l_ReactCurrentDispatcher_0.current = v336;
                end;
                if l_result_1 == l_lastRenderedState_0 and (l_result_1 ~= 0 or 1 / l_result_1 == 1 / l_lastRenderedState_0) or l_result_1 ~= l_result_1 and l_lastRenderedState_0 ~= l_lastRenderedState_0 then
                    return;
                elseif not l_status_1 then

                end;
            end;
        end;
        if _G.__DEV__ and (typeof(_G.jest) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__) then
            l_warnIfNotScopedWithMatchingAct_0(v325);
            l_warnIfNotCurrentlyActingUpdatesInDEV_0(v325);
        end;
        l_scheduleUpdateOnFiber_0(v325, v331, v330);
    end;
    if _G.__DEV__ and l_enableDebugTracing_0 and bit32.band(v325.mode, l_DebugTracingMode_0) ~= 0 then
        local v340 = l_getComponentName_0(v325.type) or "Unknown";
        l_logStateUpdateScheduled_0(v340, v331, v327);
    end;
    if l_enableSchedulingProfiler_0 then
        l_markStateUpdateScheduled_0(v325, v331);
    end;
end;
local v341 = {
    readContext = l_readContext_0, 
    useCallback = v100, 
    useContext = v100, 
    useEffect = v100, 
    useImperativeHandle = v100, 
    useLayoutEffect = v100, 
    useMemo = v100, 
    useReducer = v100, 
    useRef = v100, 
    useBinding = v100, 
    useState = v100, 
    useDebugValue = v100, 
    useMutableSource = v100, 
    useOpaqueIdentifier = v100, 
    unstable_isNewReconciler = l_enableNewReconciler_0
};
v66.ContextOnlyDispatcher = v341;
local v342 = {
    readContext = l_readContext_0, 
    useCallback = mountCallback, 
    useContext = l_readContext_0, 
    useEffect = v268, 
    useImperativeHandle = mountImperativeHandle, 
    useLayoutEffect = v282, 
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
local v343 = {
    readContext = l_readContext_0, 
    useCallback = updateCallback, 
    useContext = l_readContext_0, 
    useEffect = v271, 
    useImperativeHandle = updateImperativeHandle, 
    useLayoutEffect = v285, 
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
local v344 = {
    readContext = l_readContext_0, 
    useCallback = updateCallback, 
    useContext = l_readContext_0, 
    useEffect = v271, 
    useImperativeHandle = updateImperativeHandle, 
    useLayoutEffect = v285, 
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
if _G.__DEV__ then
    local function _() --[[ Line: 2001 ]]
        -- upvalues: l_console_0 (copy)
        l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
    end;
    local function _() --[[ Line: 2010 ]]
        -- upvalues: l_console_0 (copy)
        l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
    end;
    v76 = {
        readContext = function(v347, v348) --[[ Line: 2020 ]] --[[ Name: readContext ]]
            -- upvalues: l_readContext_0 (copy)
            return l_readContext_0(v347, v348);
        end, 
        useCallback = function(v349, v350) --[[ Line: 2026 ]] --[[ Name: useCallback ]]
            -- upvalues: v73 (ref), v74 (ref), l_Array_0 (copy), l_console_0 (copy)
            v73 = "useCallback";
            if _G.__DEV__ then
                local l_v73_2 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_2
                    };
                else
                    table.insert(v74, l_v73_2);
                end;
            end;
            if _G.__DEV__ and v350 ~= nil and not l_Array_0.isArray(v350) then
                l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (typeof(v350)));
            end;
            return mountCallback(v349, v350);
        end, 
        useContext = function(v352, v353) --[[ Line: 2032 ]] --[[ Name: useContext ]]
            -- upvalues: v73 (ref), v74 (ref), l_readContext_0 (copy)
            v73 = "useContext";
            if _G.__DEV__ then
                local l_v73_3 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_3
                    };
                else
                    table.insert(v74, l_v73_3);
                end;
            end;
            return l_readContext_0(v352, v353);
        end, 
        useEffect = function(v355, v356) --[[ Line: 2040 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), v74 (ref), l_Array_0 (copy), l_console_0 (copy), v268 (copy)
            v73 = "useEffect";
            if _G.__DEV__ then
                local l_v73_4 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_4
                    };
                else
                    table.insert(v74, l_v73_4);
                end;
            end;
            if _G.__DEV__ and v356 ~= nil and not l_Array_0.isArray(v356) then
                l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (typeof(v356)));
            end;
            return v268(v355, v356);
        end, 
        useImperativeHandle = function(v358, v359, v360) --[[ Line: 2050 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v73 (ref), v74 (ref), l_Array_0 (copy), l_console_0 (copy)
            v73 = "useImperativeHandle";
            if _G.__DEV__ then
                local l_v73_5 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_5
                    };
                else
                    table.insert(v74, l_v73_5);
                end;
            end;
            if _G.__DEV__ and v360 ~= nil and not l_Array_0.isArray(v360) then
                l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (typeof(v360)));
            end;
            return mountImperativeHandle(v358, v359, v360);
        end, 
        useLayoutEffect = function(v362, v363) --[[ Line: 2060 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), v74 (ref), l_Array_0 (copy), l_console_0 (copy), v282 (copy)
            v73 = "useLayoutEffect";
            if _G.__DEV__ then
                local l_v73_6 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_6
                    };
                else
                    table.insert(v74, l_v73_6);
                end;
            end;
            if _G.__DEV__ and v363 ~= nil and not l_Array_0.isArray(v363) then
                l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (typeof(v363)));
            end;
            return v282(v362, v363);
        end, 
        useMemo = function(v365, v366) --[[ Line: 2071 ]]
            -- upvalues: v73 (ref), v74 (ref), l_Array_0 (copy), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useMemo";
            if _G.__DEV__ then
                local l_v73_7 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_7
                    };
                else
                    table.insert(v74, l_v73_7);
                end;
            end;
            if _G.__DEV__ and v366 ~= nil and not l_Array_0.isArray(v366) then
                l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (typeof(v366)));
            end;
            local l_current_1 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v369 = {
                pcall(mountMemo, v365, v366)
            };
            l_ReactCurrentDispatcher_0.current = l_current_1;
            if not v369[1] then
                error(v369[2]);
            end;
            return unpack(v369, 2);
        end, 
        useReducer = function(v370, v371, v372) --[[ Line: 2089 ]] --[[ Name: useReducer ]]
            -- upvalues: v73 (ref), v74 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useReducer";
            if _G.__DEV__ then
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
            local v375, v376, v377 = pcall(mountReducer, v370, v371, v372);
            l_ReactCurrentDispatcher_0.current = l_current_2;
            if not v375 then
                error(v376);
            end;
            return v376, v377;
        end, 
        useRef = function(v378) --[[ Line: 2108 ]] --[[ Name: useRef ]]
            -- upvalues: v73 (ref), v74 (ref)
            v73 = "useRef";
            if _G.__DEV__ then
                local l_v73_9 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_9
                    };
                else
                    table.insert(v74, l_v73_9);
                end;
            end;
            return mountRef(v378);
        end, 
        useBinding = function(v380) --[[ Line: 2114 ]] --[[ Name: useBinding ]]
            -- upvalues: v73 (ref), v74 (ref)
            v73 = "useBinding";
            if _G.__DEV__ then
                local l_v73_10 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_10
                    };
                else
                    table.insert(v74, l_v73_10);
                end;
            end;
            return mountBinding(v380);
        end, 
        useState = function(v382) --[[ Line: 2119 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), v74 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useState";
            if _G.__DEV__ then
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
            local v385, v386, v387 = pcall(mountState, v382);
            l_ReactCurrentDispatcher_0.current = l_current_3;
            if not v385 then
                error(v386);
            end;
            return v386, v387;
        end, 
        useDebugValue = function(v388, v389) --[[ Line: 2135 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref), v74 (ref)
            v73 = "useDebugValue";
            if _G.__DEV__ then
                local l_v73_12 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_12
                    };
                else
                    table.insert(v74, l_v73_12);
                end;
            end;
            return mountDebugValue(v388, v389);
        end, 
        useMutableSource = function(v391, v392, v393) --[[ Line: 2150 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref), v74 (ref)
            v73 = "useMutableSource";
            if _G.__DEV__ then
                local l_v73_13 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_13
                    };
                else
                    table.insert(v74, l_v73_13);
                end;
            end;
            return mountMutableSource(v391, v392, v393);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2159 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref), v74 (ref)
            v73 = "useOpaqueIdentifier";
            if _G.__DEV__ then
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
        readContext = function(v396, v397) --[[ Line: 2169 ]] --[[ Name: readContext ]]
            -- upvalues: l_readContext_0 (copy)
            return l_readContext_0(v396, v397);
        end, 
        useCallback = function(v398, v399) --[[ Line: 2175 ]] --[[ Name: useCallback ]]
            -- upvalues: v73 (ref), l_Array_0 (copy), l_console_0 (copy)
            v73 = "useCallback";
            updateHookTypesDev();
            if _G.__DEV__ and v399 ~= nil and not l_Array_0.isArray(v399) then
                l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (typeof(v399)));
            end;
            return mountCallback(v398, v399);
        end, 
        useContext = function(v400, v401) --[[ Line: 2181 ]] --[[ Name: useContext ]]
            -- upvalues: v73 (ref), l_readContext_0 (copy)
            v73 = "useContext";
            updateHookTypesDev();
            return l_readContext_0(v400, v401);
        end, 
        useEffect = function(v402, v403) --[[ Line: 2189 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), v268 (copy)
            v73 = "useEffect";
            updateHookTypesDev();
            return v268(v402, v403);
        end, 
        useImperativeHandle = function(v404, v405, v406) --[[ Line: 2198 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v73 (ref)
            v73 = "useImperativeHandle";
            updateHookTypesDev();
            return mountImperativeHandle(v404, v405, v406);
        end, 
        useLayoutEffect = function(v407, v408) --[[ Line: 2207 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), v282 (copy)
            v73 = "useLayoutEffect";
            updateHookTypesDev();
            return v282(v407, v408);
        end, 
        useMemo = function(v409, v410) --[[ Line: 2217 ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useMemo";
            updateHookTypesDev();
            local l_current_4 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v412 = {
                pcall(mountMemo, v409, v410)
            };
            l_ReactCurrentDispatcher_0.current = l_current_4;
            if not v412[1] then
                error(v412[2]);
            end;
            return unpack(v412, 2);
        end, 
        useReducer = function(v413, v414, v415) --[[ Line: 2233 ]] --[[ Name: useReducer ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useReducer";
            updateHookTypesDev();
            local l_current_5 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v417, v418, v419 = pcall(mountReducer, v413, v414, v415);
            l_ReactCurrentDispatcher_0.current = l_current_5;
            if not v417 then
                error(v418);
            end;
            return v418, v419;
        end, 
        useRef = function(v420) --[[ Line: 2252 ]] --[[ Name: useRef ]]
            -- upvalues: v73 (ref)
            v73 = "useRef";
            updateHookTypesDev();
            return mountRef(v420);
        end, 
        useBinding = function(v421) --[[ Line: 2258 ]] --[[ Name: useBinding ]]
            -- upvalues: v73 (ref)
            v73 = "useBinding";
            updateHookTypesDev();
            return mountBinding(v421);
        end, 
        useState = function(v422) --[[ Line: 2263 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useState";
            updateHookTypesDev();
            local l_current_6 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v424, v425, v426 = pcall(mountState, v422);
            l_ReactCurrentDispatcher_0.current = l_current_6;
            if not v424 then
                error(v425);
            end;
            return v425, v426;
        end, 
        useDebugValue = function(v427, v428) --[[ Line: 2279 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref)
            v73 = "useDebugValue";
            updateHookTypesDev();
            return mountDebugValue(v427, v428);
        end, 
        useMutableSource = function(v429, v430, v431) --[[ Line: 2294 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref)
            v73 = "useMutableSource";
            updateHookTypesDev();
            return mountMutableSource(v429, v430, v431);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2303 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref)
            v73 = "useOpaqueIdentifier";
            updateHookTypesDev();
            return mountOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v78 = {
        readContext = function(v432, v433) --[[ Line: 2313 ]] --[[ Name: readContext ]]
            -- upvalues: l_readContext_0 (copy)
            return l_readContext_0(v432, v433);
        end, 
        useCallback = function(v434, v435) --[[ Line: 2319 ]] --[[ Name: useCallback ]]
            -- upvalues: v73 (ref)
            v73 = "useCallback";
            updateHookTypesDev();
            return updateCallback(v434, v435);
        end, 
        useContext = function(v436, v437) --[[ Line: 2324 ]] --[[ Name: useContext ]]
            -- upvalues: v73 (ref), l_readContext_0 (copy)
            v73 = "useContext";
            updateHookTypesDev();
            return l_readContext_0(v436, v437);
        end, 
        useEffect = function(v438, v439) --[[ Line: 2332 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), v271 (copy)
            v73 = "useEffect";
            updateHookTypesDev();
            return v271(v438, v439);
        end, 
        useImperativeHandle = function(v440, v441, v442) --[[ Line: 2341 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v73 (ref)
            v73 = "useImperativeHandle";
            updateHookTypesDev();
            return updateImperativeHandle(v440, v441, v442);
        end, 
        useLayoutEffect = function(v443, v444) --[[ Line: 2350 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), v285 (copy)
            v73 = "useLayoutEffect";
            updateHookTypesDev();
            return v285(v443, v444);
        end, 
        useMemo = function(v445, v446) --[[ Line: 2360 ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useMemo";
            updateHookTypesDev();
            local l_current_7 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v448 = {
                pcall(updateMemo, v445, v446)
            };
            l_ReactCurrentDispatcher_0.current = l_current_7;
            if not v448[1] then
                error(v448[2]);
            end;
            return unpack(v448, 2);
        end, 
        useReducer = function(v449, v450, v451) --[[ Line: 2376 ]] --[[ Name: useReducer ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useReducer";
            updateHookTypesDev();
            local l_current_8 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v453, v454, v455 = pcall(updateReducer, v449, v450, v451);
            l_ReactCurrentDispatcher_0.current = l_current_8;
            if not v453 then
                error(v454);
            end;
            return v454, v455;
        end, 
        useRef = function(v456) --[[ Line: 2395 ]] --[[ Name: useRef ]]
            -- upvalues: v73 (ref)
            v73 = "useRef";
            updateHookTypesDev();
            return updateRef(v456);
        end, 
        useBinding = function(v457) --[[ Line: 2401 ]] --[[ Name: useBinding ]]
            -- upvalues: v73 (ref)
            v73 = "useBinding";
            updateHookTypesDev();
            return updateBinding(v457);
        end, 
        useState = function(v458) --[[ Line: 2406 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useState";
            updateHookTypesDev();
            local l_current_9 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v460, v461, v462 = pcall(updateState, v458);
            l_ReactCurrentDispatcher_0.current = l_current_9;
            if not v460 then
                error(v461);
            end;
            return v461, v462;
        end, 
        useDebugValue = function(v463, v464) --[[ Line: 2422 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref), l_mountDebugValue_0 (copy)
            v73 = "useDebugValue";
            updateHookTypesDev();
            return l_mountDebugValue_0(v463, v464);
        end, 
        useMutableSource = function(v465, v466, v467) --[[ Line: 2437 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref)
            v73 = "useMutableSource";
            updateHookTypesDev();
            return updateMutableSource(v465, v466, v467);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2446 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref)
            v73 = "useOpaqueIdentifier";
            updateHookTypesDev();
            return updateOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v79 = {
        readContext = function(v468, v469) --[[ Line: 2456 ]] --[[ Name: readContext ]]
            -- upvalues: l_readContext_0 (copy)
            return l_readContext_0(v468, v469);
        end, 
        useCallback = function(v470, v471) --[[ Line: 2462 ]] --[[ Name: useCallback ]]
            -- upvalues: v73 (ref)
            v73 = "useCallback";
            updateHookTypesDev();
            return mountCallback(v470, v471);
        end, 
        useContext = function(v472, v473) --[[ Line: 2467 ]] --[[ Name: useContext ]]
            -- upvalues: v73 (ref), l_readContext_0 (copy)
            v73 = "useContext";
            updateHookTypesDev();
            return l_readContext_0(v472, v473);
        end, 
        useEffect = function(v474, v475) --[[ Line: 2475 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), v271 (copy)
            v73 = "useEffect";
            updateHookTypesDev();
            return v271(v474, v475);
        end, 
        useImperativeHandle = function(v476, v477, v478) --[[ Line: 2484 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v73 (ref)
            v73 = "useImperativeHandle";
            updateHookTypesDev();
            return updateImperativeHandle(v476, v477, v478);
        end, 
        useLayoutEffect = function(v479, v480) --[[ Line: 2493 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), v285 (copy)
            v73 = "useLayoutEffect";
            updateHookTypesDev();
            return v285(v479, v480);
        end, 
        useMemo = function(v481, v482) --[[ Line: 2503 ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v82 (ref)
            v73 = "useMemo";
            updateHookTypesDev();
            local l_current_10 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v484 = {
                pcall(updateMemo, v481, v482)
            };
            l_ReactCurrentDispatcher_0.current = l_current_10;
            if not v484[1] then
                error(v484[2]);
            end;
            return unpack(v484, 2);
        end, 
        useReducer = function(v485, v486, v487) --[[ Line: 2519 ]] --[[ Name: useReducer ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v82 (ref)
            v73 = "useReducer";
            updateHookTypesDev();
            local l_current_11 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v489, v490, v491 = pcall(rerenderReducer, v485, v486, v487);
            l_ReactCurrentDispatcher_0.current = l_current_11;
            if not v489 then
                error(v490);
            end;
            return v490, v491;
        end, 
        useRef = function(v492) --[[ Line: 2538 ]] --[[ Name: useRef ]]
            -- upvalues: v73 (ref)
            v73 = "useRef";
            updateHookTypesDev();
            return updateRef(v492);
        end, 
        useBinding = function(v493) --[[ Line: 2544 ]] --[[ Name: useBinding ]]
            -- upvalues: v73 (ref)
            v73 = "useBinding";
            updateHookTypesDev();
            return updateBinding(v493);
        end, 
        useState = function(v494) --[[ Line: 2549 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v82 (ref)
            v73 = "useState";
            updateHookTypesDev();
            local l_current_12 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v496, v497, v498 = pcall(rerenderState, v494);
            l_ReactCurrentDispatcher_0.current = l_current_12;
            if not v496 then
                error(v497);
            end;
            return v497, v498;
        end, 
        useDebugValue = function(v499, v500) --[[ Line: 2565 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref), l_mountDebugValue_0 (copy)
            v73 = "useDebugValue";
            updateHookTypesDev();
            return l_mountDebugValue_0(v499, v500);
        end, 
        useMutableSource = function(v501, v502, v503) --[[ Line: 2580 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref)
            v73 = "useMutableSource";
            updateHookTypesDev();
            return updateMutableSource(v501, v502, v503);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2589 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref)
            v73 = "useOpaqueIdentifier";
            updateHookTypesDev();
            return rerenderOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v80 = {
        readContext = function(v504, v505) --[[ Line: 2599 ]] --[[ Name: readContext ]]
            -- upvalues: l_console_0 (copy), l_readContext_0 (copy)
            l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
            return l_readContext_0(v504, v505);
        end, 
        useCallback = function(v506, v507) --[[ Line: 2606 ]] --[[ Name: useCallback ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref)
            v73 = "useCallback";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v73_15 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_15
                    };
                else
                    table.insert(v74, l_v73_15);
                end;
            end;
            return mountCallback(v506, v507);
        end, 
        useContext = function(v509, v510) --[[ Line: 2612 ]] --[[ Name: useContext ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref), l_readContext_0 (copy)
            v73 = "useContext";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v73_16 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_16
                    };
                else
                    table.insert(v74, l_v73_16);
                end;
            end;
            return l_readContext_0(v509, v510);
        end, 
        useEffect = function(v512, v513) --[[ Line: 2621 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref), v268 (copy)
            v73 = "useEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v73_17 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_17
                    };
                else
                    table.insert(v74, l_v73_17);
                end;
            end;
            return v268(v512, v513);
        end, 
        useImperativeHandle = function(v515, v516, v517) --[[ Line: 2631 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref)
            v73 = "useImperativeHandle";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v73_18 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_18
                    };
                else
                    table.insert(v74, l_v73_18);
                end;
            end;
            return mountImperativeHandle(v515, v516, v517);
        end, 
        useLayoutEffect = function(v519, v520) --[[ Line: 2641 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref), v282 (copy)
            v73 = "useLayoutEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v73_19 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_19
                    };
                else
                    table.insert(v74, l_v73_19);
                end;
            end;
            return v282(v519, v520);
        end, 
        useMemo = function(v522, v523) --[[ Line: 2652 ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useMemo";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
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
            local v526 = {
                pcall(mountMemo, v522, v523)
            };
            l_ReactCurrentDispatcher_0.current = l_current_13;
            if not v526[1] then
                error(v526[2]);
            end;
            return unpack(v526, 2);
        end, 
        useReducer = function(v527, v528, v529) --[[ Line: 2669 ]] --[[ Name: useReducer ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useReducer";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
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
            local v532, v533, v534 = pcall(mountReducer, v527, v528, v529);
            l_ReactCurrentDispatcher_0.current = l_current_14;
            if not v532 then
                error(v533);
            end;
            return v533, v534;
        end, 
        useRef = function(v535) --[[ Line: 2689 ]] --[[ Name: useRef ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref)
            v73 = "useRef";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v73_22 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_22
                    };
                else
                    table.insert(v74, l_v73_22);
                end;
            end;
            return mountRef(v535);
        end, 
        useBinding = function(v537) --[[ Line: 2696 ]] --[[ Name: useBinding ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref)
            v73 = "useBinding";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v73_23 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_23
                    };
                else
                    table.insert(v74, l_v73_23);
                end;
            end;
            return mountBinding(v537);
        end, 
        useState = function(v539) --[[ Line: 2702 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useState";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
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
            local v542, v543, v544 = pcall(mountState, v539);
            l_ReactCurrentDispatcher_0.current = l_current_15;
            if not v542 then
                error(v543);
            end;
            return v543, v544;
        end, 
        useDebugValue = function(v545, v546) --[[ Line: 2719 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref)
            v73 = "useDebugValue";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v73_25 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_25
                    };
                else
                    table.insert(v74, l_v73_25);
                end;
            end;
            return mountDebugValue(v545, v546);
        end, 
        useMutableSource = function(v548, v549, v550) --[[ Line: 2737 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref)
            v73 = "useMutableSource";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v73_26 = v73;
                if v74 == nil then
                    v74 = {
                        l_v73_26
                    };
                else
                    table.insert(v74, l_v73_26);
                end;
            end;
            return mountMutableSource(v548, v549, v550);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2747 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref)
            v73 = "useOpaqueIdentifier";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
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
        readContext = function(v553, v554) --[[ Line: 2758 ]] --[[ Name: readContext ]]
            -- upvalues: l_console_0 (copy), l_readContext_0 (copy)
            l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
            return l_readContext_0(v553, v554);
        end, 
        useCallback = function(v555, v556) --[[ Line: 2765 ]] --[[ Name: useCallback ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useCallback";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return mountCallback(v555, v556);
        end, 
        useContext = function(v557, v558) --[[ Line: 2771 ]] --[[ Name: useContext ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_readContext_0 (copy)
            v73 = "useContext";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_readContext_0(v557, v558);
        end, 
        useEffect = function(v559, v560) --[[ Line: 2780 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v271 (copy)
            v73 = "useEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v271(v559, v560);
        end, 
        useImperativeHandle = function(v561, v562, v563) --[[ Line: 2790 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useImperativeHandle";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateImperativeHandle(v561, v562, v563);
        end, 
        useLayoutEffect = function(v564, v565) --[[ Line: 2800 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v285 (copy)
            v73 = "useLayoutEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v285(v564, v565);
        end, 
        useMemo = function(v566, v567) --[[ Line: 2811 ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useMemo";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_16 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v569 = {
                pcall(updateMemo, v566, v567)
            };
            l_ReactCurrentDispatcher_0.current = l_current_16;
            if not v569[1] then
                error(v569[2]);
            end;
            return unpack(v569, 2);
        end, 
        useReducer = function(v570, v571, v572) --[[ Line: 2828 ]] --[[ Name: useReducer ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useReducer";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_17 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v574, v575, v576 = pcall(updateReducer, v570, v571, v572);
            l_ReactCurrentDispatcher_0.current = l_current_17;
            if not v574 then
                error(v575);
            end;
            return v575, v576;
        end, 
        useRef = function(v577) --[[ Line: 2849 ]] --[[ Name: useRef ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useRef";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateRef(v577);
        end, 
        useBinding = function(v578) --[[ Line: 2856 ]] --[[ Name: useBinding ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useBinding";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateBinding(v578);
        end, 
        useState = function(v579) --[[ Line: 2862 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useState";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_18 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v581, v582, v583 = pcall(updateState, v579);
            l_ReactCurrentDispatcher_0.current = l_current_18;
            if not v581 then
                error(v582);
            end;
            return v582, v583;
        end, 
        useDebugValue = function(v584, v585) --[[ Line: 2879 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_mountDebugValue_0 (copy)
            v73 = "useDebugValue";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_mountDebugValue_0(v584, v585);
        end, 
        useMutableSource = function(v586, v587, v588) --[[ Line: 2897 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useMutableSource";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateMutableSource(v586, v587, v588);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2907 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useOpaqueIdentifier";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v82 = {
        readContext = function(v589, v590) --[[ Line: 2918 ]] --[[ Name: readContext ]]
            -- upvalues: l_console_0 (copy), l_readContext_0 (copy)
            l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
            return l_readContext_0(v589, v590);
        end, 
        useCallback = function(v591, v592) --[[ Line: 2925 ]] --[[ Name: useCallback ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useCallback";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateCallback(v591, v592);
        end, 
        useContext = function(v593, v594) --[[ Line: 2931 ]] --[[ Name: useContext ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_readContext_0 (copy)
            v73 = "useContext";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_readContext_0(v593, v594);
        end, 
        useEffect = function(v595, v596) --[[ Line: 2940 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v271 (copy)
            v73 = "useEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v271(v595, v596);
        end, 
        useImperativeHandle = function(v597, v598, v599) --[[ Line: 2950 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useImperativeHandle";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateImperativeHandle(v597, v598, v599);
        end, 
        useLayoutEffect = function(v600, v601) --[[ Line: 2960 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v285 (copy)
            v73 = "useLayoutEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v285(v600, v601);
        end, 
        useMemo = function(v602, v603) --[[ Line: 2971 ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useMemo";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_19 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v605 = {
                pcall(updateMemo, v602, v603)
            };
            l_ReactCurrentDispatcher_0.current = l_current_19;
            if not v605[1] then
                error(v605[2]);
            end;
            return unpack(v605, 2);
        end, 
        useReducer = function(v606, v607, v608) --[[ Line: 2988 ]] --[[ Name: useReducer ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useReducer";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_20 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v610, v611, v612 = pcall(rerenderReducer, v606, v607, v608);
            l_ReactCurrentDispatcher_0.current = l_current_20;
            if not v610 then
                error(v611);
            end;
            return v611, v612;
        end, 
        useRef = function(v613) --[[ Line: 3008 ]] --[[ Name: useRef ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useRef";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateRef(v613);
        end, 
        useBinding = function(v614) --[[ Line: 3015 ]] --[[ Name: useBinding ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useBinding";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateBinding(v614);
        end, 
        useState = function(v615) --[[ Line: 3021 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useState";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_21 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v617, v618, v619 = pcall(rerenderState, v615);
            l_ReactCurrentDispatcher_0.current = l_current_21;
            if not v617 then
                error(v618);
            end;
            return v618, v619;
        end, 
        useDebugValue = function(v620, v621) --[[ Line: 3038 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_mountDebugValue_0 (copy)
            v73 = "useDebugValue";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_mountDebugValue_0(v620, v621);
        end, 
        useMutableSource = function(v622, v623, v624) --[[ Line: 3056 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useMutableSource";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateMutableSource(v622, v623, v624);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 3066 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useOpaqueIdentifier";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return rerenderOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
end;
v66.renderWithHooks = function(v625, v626, v627, v628, v629, v630) --[[ Line: 3077 ]] --[[ Name: renderWithHooks ]]
    -- upvalues: l_l_NoLanes_0_0 (ref), v68 (ref), v74 (ref), v75 (ref), l_NoLanes_0 (copy), l_ReactCurrentDispatcher_0 (copy), v78 (ref), v77 (ref), v76 (ref), v342 (copy), v343 (copy), v72 (ref), l_Error_0 (copy), v69 (ref), v70 (ref), v79 (ref), v344 (copy), v341 (copy), v73 (ref), v71 (ref)
    l_l_NoLanes_0_0 = v630;
    v68 = v626;
    if _G.__DEV__ then
        v74 = if v625 ~= nil then v625._debugHookTypes else nil;
        v75 = 0;
    end;
    v626.memoizedState = nil;
    v626.updateQueue = nil;
    v626.lanes = l_NoLanes_0;
    if _G.__DEV__ then
        if v625 ~= nil and v625.memoizedState ~= nil then
            l_ReactCurrentDispatcher_0.current = v78;
        elseif v74 ~= nil then
            l_ReactCurrentDispatcher_0.current = v77;
        else
            l_ReactCurrentDispatcher_0.current = v76;
        end;
    else
        l_ReactCurrentDispatcher_0.current = (not (v625 ~= nil) or v625.memoizedState == nil) and v342 or v343;
    end;
    local v631 = v627(v628, v629);
    if v72 then
        local v632 = 0;
        repeat
            v72 = false;
            if v632 >= 25 then
                error(l_Error_0.new("Too many re-renders. React limits the number of renders to prevent " .. "an infinite loop."));
            end;
            v632 = v632 + 1;
            v69 = nil;
            v70 = nil;
            v626.updateQueue = nil;
            if _G.__DEV__ then
                v75 = 0;
            end;
            l_ReactCurrentDispatcher_0.current = _G.__DEV__ and v79 or v344;
            v631 = v627(v628, v629);
        until not v72;
    end;
    l_ReactCurrentDispatcher_0.current = v341;
    if _G.__DEV__ then
        v626._debugHookTypes = v74;
    end;
    local v633 = false;
    if v69 ~= nil then
        v633 = v69.next ~= nil;
    end;
    l_l_NoLanes_0_0 = l_NoLanes_0;
    v68 = nil;
    v69 = nil;
    v70 = nil;
    if _G.__DEV__ then
        v73 = nil;
        v74 = nil;
        v75 = 0;
    end;
    v71 = false;
    if v633 then
        error(l_Error_0.new("Rendered fewer hooks than expected. This may be caused by an accidental " .. "early return statement."));
    end;
    return v631;
end;
return v66;