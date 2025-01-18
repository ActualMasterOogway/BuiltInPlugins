local function _(v0) --[[ Line: 11 ]] --[[ Name: unimplemented ]]
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
local l_inspect_0 = v3.util.inspect;
local v8 = require(l_Parent_0.Cryo);
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactInternalTypes);
local v12 = require(script.Parent.ReactFiberLane);
local v13 = require(script.Parent.ReactHookEffectTags);
local l_ReactSharedInternals_0 = require(l_Parent_0.Shared).ReactSharedInternals;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableDebugTracing_0 = l_ReactFeatureFlags_0.enableDebugTracing;
local l_enableSchedulingProfiler_0 = l_ReactFeatureFlags_0.enableSchedulingProfiler;
local l_enableNewReconciler_0 = l_ReactFeatureFlags_0.enableNewReconciler;
local l_enableDoubleInvokingEffects_0 = l_ReactFeatureFlags_0.enableDoubleInvokingEffects;
local l_DebugTracingMode_0 = require(script.Parent.ReactTypeOfMode).DebugTracingMode;
local l_NoLane_0 = v12.NoLane;
local l_NoLanes_0 = v12.NoLanes;
local l_isSubsetOfLanes_0 = v12.isSubsetOfLanes;
local l_mergeLanes_0 = v12.mergeLanes;
local l_removeLanes_0 = v12.removeLanes;
local l_markRootEntangled_0 = v12.markRootEntangled;
local l_markRootMutableRead_0 = v12.markRootMutableRead;
local l_readContext_0 = require(script.Parent["ReactFiberNewContext.new"]).readContext;
local v29 = require(script.Parent.ReactFiberFlags);
local l_Update_0 = v29.Update;
local l_Passive_0 = v29.Passive;
local l_PassiveStatic_0 = v29.PassiveStatic;
local l_MountLayoutDev_0 = v29.MountLayoutDev;
local l_MountPassiveDev_0 = v29.MountPassiveDev;
local l_HasEffect_0 = v13.HasEffect;
local l_Layout_0 = v13.Layout;
local l_Passive_1 = v13.Passive;
local v38 = require(script.Parent["ReactFiberWorkLoop.new"]);
local l_warnIfNotCurrentlyActingUpdatesInDEV_0 = v38.warnIfNotCurrentlyActingUpdatesInDEV;
local l_scheduleUpdateOnFiber_0 = v38.scheduleUpdateOnFiber;
local l_warnIfNotScopedWithMatchingAct_0 = v38.warnIfNotScopedWithMatchingAct;
local l_requestEventTime_0 = v38.requestEventTime;
local l_requestUpdateLane_0 = v38.requestUpdateLane;
local l_markSkippedUpdateLanes_0 = v38.markSkippedUpdateLanes;
local l_getWorkInProgressRoot_0 = v38.getWorkInProgressRoot;
local l_warnIfNotCurrentlyActingEffectsInDEV_0 = v38.warnIfNotCurrentlyActingEffectsInDEV;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local function _(v49, v50) --[[ Line: 102 ]] --[[ Name: is ]]
    return v49 == v50 and (v49 ~= 0 or 1 / v49 == 1 / v50) or v49 ~= v49 and v50 ~= v50;
end;
local l_markWorkInProgressReceivedUpdate_0 = require(script.Parent["ReactFiberBeginWork.new"]).markWorkInProgressReceivedUpdate;
local l_getIsHydrating_0 = require(script.Parent["ReactFiberHydrationContext.new"]).getIsHydrating;
local l_makeClientId_0 = require(script.Parent.ReactFiberHostConfig).makeClientId;
local v55 = require(script.Parent["ReactMutableSource.new"]);
local l_warnAboutMultipleRenderersDEV_0 = v55.warnAboutMultipleRenderersDEV;
local l_getWorkInProgressVersion_0 = v55.getWorkInProgressVersion;
local l_setWorkInProgressVersion_0 = v55.setWorkInProgressVersion;
local l_markSourceAsDirty_0 = v55.markSourceAsDirty;
local l_logStateUpdateScheduled_0 = require(script.Parent.DebugTracing).logStateUpdateScheduled;
local l_markStateUpdateScheduled_0 = require(script.Parent.SchedulingProfiler).markStateUpdateScheduled;
local l_ReactCurrentDispatcher_0 = l_ReactSharedInternals_0.ReactCurrentDispatcher;
local v63 = nil;
local v64 = nil;
if _G.__DEV__ then
    v64 = {};
    v63 = {};
end;
local v65 = {};
local l_l_NoLanes_0_0 = l_NoLanes_0;
local v67 = nil;
local v68 = nil;
local v69 = nil;
local v70 = false;
local v71 = false;
local v72 = nil;
local v73 = nil;
local v74 = 0;
local v75 = nil;
local v76 = nil;
local v77 = nil;
local v78 = nil;
local v79 = nil;
local v80 = nil;
local v81 = nil;
local function _() --[[ Line: 243 ]] --[[ Name: mountHookTypesDev ]]
    -- upvalues: v72 (ref), v73 (ref)
    if _G.__DEV__ then
        local l_v72_0 = v72;
        if v73 == nil then
            v73 = {
                l_v72_0
            };
            return;
        else
            table.insert(v73, l_v72_0);
        end;
    end;
end;
updateHookTypesDev = function() --[[ Line: 255 ]] --[[ Name: updateHookTypesDev ]]
    -- upvalues: v72 (ref), v73 (ref), v74 (ref)
    if _G.__DEV__ then
        local l_v72_1 = v72;
        if v73 ~= nil then
            v74 = v74 + 1;
            if v73[v74] ~= l_v72_1 then
                warnOnHookMismatchInDev(l_v72_1);
            end;
        end;
    end;
end;
local function _(v85) --[[ Line: 268 ]] --[[ Name: checkDepsAreArrayDev ]]
    -- upvalues: l_Array_0 (copy), l_console_0 (copy), v72 (ref)
    if _G.__DEV__ and v85 ~= nil and not l_Array_0.isArray(v85) then
        l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v72, (typeof(v85)));
    end;
end;
warnOnHookMismatchInDev = function(v87) --[[ Line: 283 ]] --[[ Name: warnOnHookMismatchInDev ]]
    -- upvalues: l_getComponentName_0 (copy), v67 (ref), v63 (ref), v73 (ref), v74 (ref), l_console_0 (copy)
    if _G.__DEV__ then
        local v88 = l_getComponentName_0(v67.type) or "Component";
        if not v63[v88] then
            v63[v88] = true;
            if v73 ~= nil then
                local v89 = "";
                for v90 = 1, v74 do
                    local v91 = v73[v90];
                    local v92 = nil;
                    v92 = if v90 == v74 then v87 else v91;
                    local v93 = tostring(v90) .. ". " .. (v91 or "undefined");
                    while string.len(v93) < 30 do
                        v93 = v93 .. " ";
                    end;
                    v89 = v89 .. v93 .. v92 .. "\n";
                end;
                l_console_0.error("React has detected a change in the order of Hooks called by %s. " .. "This will lead to bugs and errors if not fixed. " .. "For more information, read the Rules of Hooks: https://reactjs.org/link/rules-of-hooks\n\n" .. "   Previous render            Next render\n" .. "   ------------------------------------------------------\n" .. "%s" .. "   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n", v88, v89);
            end;
        end;
    end;
end;
local function v94() --[[ Line: 334 ]] --[[ Name: throwInvalidHookError ]]
    -- upvalues: l_Error_0 (copy)
    error(l_Error_0.new("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for" .. " one of the following reasons:\n" .. "1. You might have mismatching versions of React and the renderer (such as React DOM)\n" .. "2. You might be breaking the Rules of Hooks\n" .. "3. You might have more than one copy of React in the same app\n" .. "See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem."));
end;
local function v100(v95, v96) --[[ Line: 347 ]] --[[ Name: areHookInputsEqual ]]
    -- upvalues: l_console_0 (copy), v72 (ref), l_inspect_0 (copy)
    if _G.__DEV__ then

    end;
    if v96 == nil then
        if _G.__DEV__ then
            l_console_0.error("%s received a final argument during this render, but not during " .. "the previous render. Even though the final argument is optional, " .. "its type cannot change between renders.", v72);
        end;
        return false;
    else
        if _G.__DEV__ and #v95 ~= #v96 then
            l_console_0.error("The final argument passed to %s changed size between renders. The " .. "order and size of this array must remain constant.\n\n" .. "Previous: %s\n" .. "Incoming: %s", v72, l_inspect_0(v96), l_inspect_0(v95));
        end;
        for v97 = 1, math.min(#v96, #v95) do
            local v98 = v95[v97];
            local v99 = v96[v97];
            if not (v98 == v99 and (v98 ~= 0 or 1 / v98 == 1 / v99) or v98 ~= v98 and v99 ~= v99) then
                return false;
            end;
        end;
        return true;
    end;
end;
v65.bailoutHooks = function(v101, v102, v103) --[[ Line: 397 ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), l_MountPassiveDev_0 (copy), l_Passive_0 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy), l_removeLanes_0 (copy)
    v102.updateQueue = v101.updateQueue;
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        v102.flags = bit32.band(v102.flags, (bit32.bnot((bit32.bor(l_MountPassiveDev_0, l_Passive_0, l_MountLayoutDev_0, l_Update_0)))));
    else
        v102.flags = bit32.band(v102.flags, (bit32.bnot((bit32.bor(l_Passive_0, l_Update_0)))));
    end;
    v101.lanes = l_removeLanes_0(v101.lanes, v103);
end;
local v104 = false;
v65.resetHooksAfterThrow = function() --[[ Line: 424 ]]
    -- upvalues: l_ReactCurrentDispatcher_0 (copy), v65 (copy), v70 (ref), v67 (ref), l_l_NoLanes_0_0 (ref), l_NoLanes_0 (copy), v68 (ref), v69 (ref), v73 (ref), v74 (ref), v72 (ref), v104 (ref), v71 (ref)
    l_ReactCurrentDispatcher_0.current = v65.ContextOnlyDispatcher;
    if v70 then
        local l_memoizedState_0 = v67.memoizedState;
        while l_memoizedState_0 ~= nil do
            local l_queue_0 = l_memoizedState_0.queue;
            if l_queue_0 ~= nil then
                l_queue_0.pending = nil;
            end;
            l_memoizedState_0 = l_memoizedState_0.next;
        end;
        v70 = false;
    end;
    l_l_NoLanes_0_0 = l_NoLanes_0;
    v67 = nil;
    v68 = nil;
    v69 = nil;
    if _G.__DEV__ then
        v73 = nil;
        v74 = 0;
        v72 = nil;
        v104 = false;
    end;
    v71 = false;
end;
local function _() --[[ Line: 469 ]] --[[ Name: mountWorkInProgressHook ]]
    -- upvalues: v69 (ref), v67 (ref)
    local v107 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v69 == nil then
        v67.memoizedState = v107;
        v69 = v107;
    else
        v69.next = v107;
        v69 = v107;
    end;
    return v69;
end;
local function v113() --[[ Line: 492 ]] --[[ Name: updateWorkInProgressHook ]]
    -- upvalues: v68 (ref), v67 (ref), v69 (ref), l_Error_0 (copy)
    local v109 = nil;
    if v68 == nil then
        local l_alternate_0 = v67.alternate;
        v109 = if l_alternate_0 ~= nil then l_alternate_0.memoizedState else nil;
    else
        v109 = v68.next;
    end;
    local v111 = nil;
    v111 = if v69 == nil then v67.memoizedState else v69.next;
    if v111 ~= nil then
        v69 = v111;
        v111 = v69.next;
        v68 = v109;
    else
        if v109 == nil then
            error(l_Error_0.new("Rendered more hooks than during the previous render."));
        end;
        v68 = v109;
        local v112 = {
            memoizedState = v68.memoizedState, 
            baseState = v68.baseState, 
            baseQueue = v68.baseQueue, 
            queue = v68.queue, 
            next = nil
        };
        if v69 == nil then
            v69 = v112;
            v67.memoizedState = v112;
        else
            v69.next = v112;
            v69 = v112;
        end;
    end;
    return v69;
end;
basicStateReducer = function(v114, v115) --[[ Line: 568 ]] --[[ Name: basicStateReducer ]]
    if typeof(v115) == "function" then
        return v115(v114);
    else
        return v115;
    end;
end;
mountReducer = function(v116, v117, v118) --[[ Line: 583 ]] --[[ Name: mountReducer ]]
    -- upvalues: v69 (ref), v67 (ref)
    local v119 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v69 == nil then
        v67.memoizedState = v119;
        v69 = v119;
    else
        v69.next = v119;
        v69 = v119;
    end;
    local l_v69_0 = v69;
    v119 = nil;
    v119 = if v118 ~= nil then v118(v117) else v117;
    l_v69_0.baseState = v119;
    l_v69_0.memoizedState = l_v69_0.baseState;
    l_v69_0.queue = {
        pending = nil, 
        dispatch = nil, 
        lastRenderedReducer = v116, 
        lastRenderedState = v119
    };
    local l_queue_1 = l_v69_0.queue;
    local l_v67_0 = v67;
    l_queue_1.dispatch = function(...) --[[ Line: 613 ]]
        -- upvalues: l_v67_0 (copy), l_queue_1 (copy)
        return dispatchAction(l_v67_0, l_queue_1, ...);
    end;
    local l_dispatch_0 = l_queue_1.dispatch;
    return l_v69_0.memoizedState, l_dispatch_0;
end;
updateReducer = function(v124, _, _) --[[ Line: 627 ]] --[[ Name: updateReducer ]]
    -- upvalues: v113 (copy), v68 (ref), l_l_NoLanes_0_0 (ref), v67 (ref), l_mergeLanes_0 (copy), l_markSkippedUpdateLanes_0 (copy), l_NoLane_0 (copy), l_markWorkInProgressReceivedUpdate_0 (copy)
    local v127 = v113();
    local l_queue_2 = v127.queue;
    l_queue_2.lastRenderedReducer = v124;
    local l_v68_0 = v68;
    local l_baseQueue_0 = l_v68_0.baseQueue;
    local l_pending_0 = l_queue_2.pending;
    if l_pending_0 ~= nil then
        if l_baseQueue_0 ~= nil then
            local l_next_0 = l_baseQueue_0.next;
            l_baseQueue_0.next = l_pending_0.next;
            l_pending_0.next = l_next_0;
        end;
        l_baseQueue_0 = l_pending_0;
        l_v68_0.baseQueue = l_baseQueue_0;
        l_queue_2.pending = nil;
    end;
    if l_baseQueue_0 ~= nil then
        local l_next_1 = l_baseQueue_0.next;
        local l_baseState_0 = l_v68_0.baseState;
        local v135 = nil;
        local v136 = nil;
        local v137 = nil;
        local l_l_next_1_0 = l_next_1;
        repeat
            local l_lane_0 = l_l_next_1_0.lane;
            if bit32.band(l_l_NoLanes_0_0, l_lane_0) ~= l_lane_0 then
                local v140 = {
                    lane = l_lane_0, 
                    action = l_l_next_1_0.action, 
                    eagerReducer = l_l_next_1_0.eagerReducer, 
                    eagerState = l_l_next_1_0.eagerState, 
                    next = nil
                };
                if v137 == nil then
                    v137 = v140;
                    v136 = v137;
                    v135 = l_baseState_0;
                else
                    v137.next = v140;
                    v137 = v137.next;
                end;
                v67.lanes = l_mergeLanes_0(v67.lanes, l_lane_0);
                l_markSkippedUpdateLanes_0(l_lane_0);
            else
                if v137 ~= nil then
                    v137.next = {
                        lane = l_NoLane_0, 
                        action = l_l_next_1_0.action, 
                        eagerReducer = l_l_next_1_0.eagerReducer, 
                        eagerState = l_l_next_1_0.eagerState, 
                        next = nil
                    };
                    v137 = v137.next;
                end;
                if l_l_next_1_0.eagerReducer == v124 then
                    l_baseState_0 = l_l_next_1_0.eagerState;
                else
                    l_baseState_0 = v124(l_baseState_0, l_l_next_1_0.action);
                end;
            end;
            l_l_next_1_0 = l_l_next_1_0.next;
        until l_l_next_1_0 == nil or l_l_next_1_0 == l_next_1;
        if v137 == nil then
            v135 = l_baseState_0;
        else
            v137.next = v136;
        end;
        local l_l_baseState_0_0 = l_baseState_0;
        local l_memoizedState_1 = v127.memoizedState;
        if not (l_l_baseState_0_0 == l_memoizedState_1 and (l_l_baseState_0_0 ~= 0 or 1 / l_l_baseState_0_0 == 1 / l_memoizedState_1) or l_l_baseState_0_0 ~= l_l_baseState_0_0 and l_memoizedState_1 ~= l_memoizedState_1) then
            l_markWorkInProgressReceivedUpdate_0();
        end;
        v127.memoizedState = l_baseState_0;
        v127.baseState = v135;
        v127.baseQueue = v137;
        l_queue_2.lastRenderedState = l_baseState_0;
    end;
    local l_dispatch_1 = l_queue_2.dispatch;
    return v127.memoizedState, l_dispatch_1;
end;
rerenderReducer = function(v144, _, _) --[[ Line: 775 ]] --[[ Name: rerenderReducer ]]
    -- upvalues: v113 (copy), l_markWorkInProgressReceivedUpdate_0 (copy)
    local v147 = v113();
    local l_queue_3 = v147.queue;
    l_queue_3.lastRenderedReducer = v144;
    local l_dispatch_2 = l_queue_3.dispatch;
    local l_pending_1 = l_queue_3.pending;
    local l_memoizedState_2 = v147.memoizedState;
    if l_pending_1 ~= nil then
        l_queue_3.pending = nil;
        local l_next_2 = l_pending_1.next;
        local l_l_next_2_0 = l_next_2;
        repeat
            l_memoizedState_2 = v144(l_memoizedState_2, l_l_next_2_0.action);
            l_l_next_2_0 = l_l_next_2_0.next;
        until l_l_next_2_0 == l_next_2;
        local l_l_memoizedState_2_0 = l_memoizedState_2;
        local l_memoizedState_3 = v147.memoizedState;
        if not (l_l_memoizedState_2_0 == l_memoizedState_3 and (l_l_memoizedState_2_0 ~= 0 or 1 / l_l_memoizedState_2_0 == 1 / l_memoizedState_3) or l_l_memoizedState_2_0 ~= l_l_memoizedState_2_0 and l_memoizedState_3 ~= l_memoizedState_3) then
            l_markWorkInProgressReceivedUpdate_0();
        end;
        v147.memoizedState = l_memoizedState_2;
        if v147.baseQueue == nil then
            v147.baseState = l_memoizedState_2;
        end;
        l_queue_3.lastRenderedState = l_memoizedState_2;
    end;
    return l_memoizedState_2, l_dispatch_2;
end;
readFromUnsubcribedMutableSource = function(v156, v157, v158) --[[ Line: 845 ]] --[[ Name: readFromUnsubcribedMutableSource ]]
    -- upvalues: l_warnAboutMultipleRenderersDEV_0 (copy), l_getWorkInProgressVersion_0 (copy), l_isSubsetOfLanes_0 (copy), l_l_NoLanes_0_0 (ref), l_setWorkInProgressVersion_0 (copy), l_console_0 (copy), l_markSourceAsDirty_0 (copy), l_invariant_0 (copy)
    if _G.__DEV__ then
        l_warnAboutMultipleRenderersDEV_0(v157);
    end;
    local v159 = v157._getVersion(v157._source);
    local v160 = false;
    local v161 = l_getWorkInProgressVersion_0(v157);
    if v161 ~= nil then
        v160 = v161 == v159;
    else
        v160 = l_isSubsetOfLanes_0(l_l_NoLanes_0_0, v156.mutableReadLanes);
        if v160 then
            l_setWorkInProgressVersion_0(v157, v159);
        end;
    end;
    if v160 then
        local v162 = v158(v157._source);
        if _G.__DEV__ and typeof(v162) == "function" then
            l_console_0.error("Mutable source should not return a function as the snapshot value. " .. "Functions may close over mutable values and cause tearing.");
        end;
        return v162;
    else
        l_markSourceAsDirty_0(v157);
        l_invariant_0(false, "Cannot read from mutable source during the current render without tearing. This is a bug in React. Please file an issue.");
        return nil;
    end;
end;
useMutableSource = function(v163, v164, v165, v166) --[[ Line: 935 ]] --[[ Name: useMutableSource ]]
    -- upvalues: l_getWorkInProgressRoot_0 (copy), l_invariant_0 (copy), l_ReactCurrentDispatcher_0 (copy), v69 (ref), v67 (ref), l_console_0 (copy), l_requestUpdateLane_0 (copy), l_markRootMutableRead_0 (copy), l_markRootEntangled_0 (copy)
    local v167 = l_getWorkInProgressRoot_0();
    l_invariant_0(v167 ~= nil, "Expected a work-in-progress root. This is a bug in React. Please file an issue.");
    local l__getVersion_0 = v164._getVersion;
    local v169 = l__getVersion_0(v164._source);
    local l_current_0 = l_ReactCurrentDispatcher_0.current;
    local v171, v172 = l_current_0.useState(function() --[[ Line: 953 ]]
        -- upvalues: v167 (copy), v164 (copy), v165 (copy)
        return readFromUnsubcribedMutableSource(v167, v164, v165);
    end);
    local l_v171_0 = v171;
    local l_v69_1 = v69;
    local l_memoizedState_4 = v163.memoizedState;
    if l_memoizedState_4.refs == nil then
        error((tostring(debug.traceback())));
    end;
    local l_refs_0 = l_memoizedState_4.refs;
    local l_getSnapshot_0 = l_refs_0.getSnapshot;
    local l_source_0 = l_memoizedState_4.source;
    local l_subscribe_0 = l_memoizedState_4.subscribe;
    local l_v67_1 = v67;
    v163.memoizedState = {
        refs = l_refs_0, 
        source = v164, 
        subscribe = v166
    };
    l_current_0.useEffect(function() --[[ Line: 982 ]]
        -- upvalues: l_refs_0 (copy), v165 (copy), v172 (ref), l__getVersion_0 (copy), v164 (copy), v169 (copy), l_console_0 (ref), l_v171_0 (ref), l_requestUpdateLane_0 (ref), l_v67_1 (copy), l_markRootMutableRead_0 (ref), v167 (copy), l_markRootEntangled_0 (ref)
        l_refs_0.getSnapshot = v165;
        l_refs_0.setSnapshot = v172;
        local v181 = l__getVersion_0(v164._source);
        local l_v169_0 = v169;
        if not (l_v169_0 == v181 and (l_v169_0 ~= 0 or 1 / l_v169_0 == 1 / v181) or l_v169_0 ~= l_v169_0 and v181 ~= v181) then
            local v183 = v165(v164._source);
            if _G.__DEV__ and typeof(v183) == "function" then
                l_console_0.error("Mutable source should not return a function as the snapshot value. " .. "Functions may close over mutable values and cause tearing.");
            end;
            local l_l_v171_0_0 = l_v171_0;
            if not (l_l_v171_0_0 == v183 and (l_l_v171_0_0 ~= 0 or 1 / l_l_v171_0_0 == 1 / v183) or l_l_v171_0_0 ~= l_l_v171_0_0 and v183 ~= v183) then
                v172(v183);
                l_v169_0 = l_requestUpdateLane_0(l_v67_1);
                l_markRootMutableRead_0(v167, l_v169_0);
            end;
            l_markRootEntangled_0(v167, v167.mutableReadLanes);
        end;
    end, {
        v165, 
        v164, 
        v166
    });
    l_current_0.useEffect(function() --[[ Line: 1018 ]]
        -- upvalues: l_refs_0 (copy), v164 (copy), l_requestUpdateLane_0 (ref), l_v67_1 (copy), l_markRootMutableRead_0 (ref), v167 (copy), v166 (copy), l_console_0 (ref)
        local function v190() --[[ Line: 1019 ]]
            -- upvalues: l_refs_0 (ref), v164 (ref), l_requestUpdateLane_0 (ref), l_v67_1 (ref), l_markRootMutableRead_0 (ref), v167 (ref)
            local l_getSnapshot_1 = l_refs_0.getSnapshot;
            local l_setSnapshot_0 = l_refs_0.setSnapshot;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 1024 ]]
                -- upvalues: l_setSnapshot_0 (copy), l_getSnapshot_1 (copy), v164 (ref), l_requestUpdateLane_0 (ref), l_v67_1 (ref), l_markRootMutableRead_0 (ref), v167 (ref)
                l_setSnapshot_0(l_getSnapshot_1(v164._source));
                local v187 = l_requestUpdateLane_0(l_v67_1);
                l_markRootMutableRead_0(v167, v187);
            end);
            if not l_status_0 then
                l_setSnapshot_0(function() --[[ Line: 1039 ]]
                    -- upvalues: l_result_0 (copy)
                    error(l_result_0);
                end);
            end;
        end;
        local v191 = v166(v164._source, v190);
        if _G.__DEV__ and typeof(v191) ~= "function" then
            l_console_0.error("Mutable source subscribe function must return an unsubscribe function.");
        end;
        return v191;
    end, {
        v164, 
        v166
    });
    if (l_getSnapshot_0 ~= v165 or l_getSnapshot_0 == 0 and 1 / l_getSnapshot_0 ~= 1 / v165) and (l_getSnapshot_0 == l_getSnapshot_0 or v165 == v165) or (l_source_0 ~= v164 or l_source_0 == 0 and 1 / l_source_0 ~= 1 / v164) and (l_source_0 == l_source_0 or v164 == v164) or not (l_subscribe_0 == v166 and (l_subscribe_0 ~= 0 or 1 / l_subscribe_0 == 1 / v166) or l_subscribe_0 ~= l_subscribe_0 and v166 ~= v166) then
        local v192 = {
            pending = nil, 
            dispatch = nil, 
            lastRenderedReducer = basicStateReducer, 
            lastRenderedState = l_v171_0
        };
        local l_v67_2 = v67;
        v172 = function(...) --[[ Line: 1086 ]]
            -- upvalues: l_v67_2 (copy), v192 (copy)
            return dispatchAction(l_v67_2, v192, ...);
        end;
        v192.dispatch = v172;
        l_v69_1.queue = v192;
        l_v69_1.baseQueue = nil;
        l_v171_0 = readFromUnsubcribedMutableSource(v167, v164, v165);
        l_v69_1.baseState = l_v171_0;
        l_v69_1.memoizedState = l_v69_1.baseState;
    end;
    return l_v171_0;
end;
mountMutableSource = function(v194, v195, v196) --[[ Line: 1107 ]] --[[ Name: mountMutableSource ]]
    -- upvalues: v69 (ref), v67 (ref)
    local v197 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v69 == nil then
        v67.memoizedState = v197;
        v69 = v197;
    else
        v69.next = v197;
        v69 = v197;
    end;
    local l_v69_2 = v69;
    l_v69_2.memoizedState = {
        refs = {
            getSnapshot = v195, 
            setSnapshot = nil
        }, 
        source = v194, 
        subscribe = v196
    };
    return useMutableSource(l_v69_2, v194, v195, v196);
end;
updateMutableSource = function(v199, v200, v201) --[[ Line: 1130 ]] --[[ Name: updateMutableSource ]]
    -- upvalues: v113 (copy)
    local v202 = v113();
    return useMutableSource(v202, v199, v200, v201);
end;
mountState = function(v203) --[[ Line: 1143 ]] --[[ Name: mountState ]]
    -- upvalues: v69 (ref), v67 (ref)
    local v204 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v69 == nil then
        v67.memoizedState = v204;
        v69 = v204;
    else
        v69.next = v204;
        v69 = v204;
    end;
    local l_v69_3 = v69;
    if typeof(v203) == "function" then
        v203 = v203();
    end;
    l_v69_3.baseState = v203;
    l_v69_3.memoizedState = l_v69_3.baseState;
    l_v69_3.queue = {
        pending = nil, 
        dispatch = nil, 
        lastRenderedReducer = basicStateReducer, 
        lastRenderedState = v203
    };
    v204 = l_v69_3.queue;
    local l_v67_3 = v67;
    v204.dispatch = function(...) --[[ Line: 1166 ]]
        -- upvalues: l_v67_3 (copy), v204 (copy)
        return dispatchAction(l_v67_3, v204, ...);
    end;
    local l_dispatch_3 = v204.dispatch;
    return l_v69_3.memoizedState, l_dispatch_3;
end;
updateState = function(v208) --[[ Line: 1178 ]] --[[ Name: updateState ]]
    return updateReducer(basicStateReducer, v208);
end;
rerenderState = function(v209) --[[ Line: 1188 ]] --[[ Name: rerenderState ]]
    return rerenderReducer(basicStateReducer, v209);
end;
local function v218(v210, v211, v212, v213) --[[ Line: 1194 ]] --[[ Name: pushEffect ]]
    -- upvalues: v67 (ref)
    local v214 = {
        tag = v210, 
        create = v211, 
        destroy = v212, 
        deps = v213, 
        next = nil
    };
    local l_updateQueue_0 = v67.updateQueue;
    if l_updateQueue_0 == nil then
        l_updateQueue_0 = {
            lastEffect = nil
        };
        v67.updateQueue = l_updateQueue_0;
        v214.next = v214;
        l_updateQueue_0.lastEffect = v214;
        return v214;
    else
        local l_lastEffect_0 = l_updateQueue_0.lastEffect;
        if l_lastEffect_0 == nil then
            l_updateQueue_0.lastEffect = v214;
            v214.next = v214;
            return v214;
        else
            local l_next_3 = l_lastEffect_0.next;
            l_lastEffect_0.next = v214;
            v214.next = l_next_3;
            l_updateQueue_0.lastEffect = v214;
            return v214;
        end;
    end;
end;
mountRef = function(v219) --[[ Line: 1229 ]] --[[ Name: mountRef ]]
    -- upvalues: v69 (ref), v67 (ref)
    local v220 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v69 == nil then
        v67.memoizedState = v220;
        v69 = v220;
    else
        v69.next = v220;
        v69 = v220;
    end;
    local l_v69_4 = v69;
    v220 = {
        current = v219
    };
    l_v69_4.memoizedState = v220;
    return v220;
end;
updateRef = function(_) --[[ Line: 1240 ]] --[[ Name: updateRef ]]
    -- upvalues: v113 (copy)
    return v113().memoizedState;
end;
local function v229(v223, v224, v225, v226) --[[ Line: 1245 ]] --[[ Name: mountEffectImpl ]]
    -- upvalues: v69 (ref), v67 (ref), v218 (copy), l_HasEffect_0 (copy)
    local v227 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v69 == nil then
        v67.memoizedState = v227;
        v69 = v227;
    else
        v69.next = v227;
        v69 = v227;
    end;
    local l_v69_5 = v69;
    v67.flags = bit32.bor(v67.flags, v223);
    l_v69_5.memoizedState = v218(bit32.bor(l_HasEffect_0, v224), v225, nil, v226);
end;
updateEffectImpl = function(v230, v231, v232, v233) --[[ Line: 1260 ]] --[[ Name: updateEffectImpl ]]
    -- upvalues: v113 (copy), v68 (ref), v100 (copy), v218 (copy), v67 (ref), l_HasEffect_0 (copy)
    local v234 = v113();
    local v235 = nil;
    if v68 ~= nil then
        local l_memoizedState_5 = v68.memoizedState;
        v235 = l_memoizedState_5.destroy;
        if v233 ~= nil then
            local l_deps_0 = l_memoizedState_5.deps;
            if v100(v233, l_deps_0) then
                v234.memoizedState = v218(v231, v232, v235, v233);
                return;
            end;
        end;
    end;
    v67.flags = bit32.bor(v67.flags, v230);
    v234.memoizedState = v218(bit32.bor(l_HasEffect_0, v231), v232, v235, v233);
end;
local function v240(v238, v239) --[[ Line: 1289 ]] --[[ Name: mountEffect ]]
    -- upvalues: l_warnIfNotCurrentlyActingEffectsInDEV_0 (copy), v67 (ref), l_enableDoubleInvokingEffects_0 (copy), v229 (copy), l_MountPassiveDev_0 (copy), l_Passive_0 (copy), l_PassiveStatic_0 (copy), l_Passive_1 (copy)
    if _G.__DEV__ and (typeof(_G.jest) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__) then
        l_warnIfNotCurrentlyActingEffectsInDEV_0(v67);
    end;
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        return v229(bit32.bor(l_MountPassiveDev_0, l_Passive_0, l_PassiveStatic_0), l_Passive_1, v238, v239);
    else
        return v229(bit32.bor(l_Passive_0, l_PassiveStatic_0), l_Passive_1, v238, v239);
    end;
end;
local function v243(v241, v242) --[[ Line: 1319 ]] --[[ Name: updateEffect ]]
    -- upvalues: l_warnIfNotCurrentlyActingEffectsInDEV_0 (copy), v67 (ref), l_Passive_0 (copy), l_Passive_1 (copy)
    if _G.__DEV__ and (typeof(_G.jest) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__) then
        l_warnIfNotCurrentlyActingEffectsInDEV_0(v67);
    end;
    return updateEffectImpl(l_Passive_0, l_Passive_1, v241, v242);
end;
local function v246(v244, v245) --[[ Line: 1339 ]] --[[ Name: mountLayoutEffect ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), v229 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy), l_Layout_0 (copy)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        return v229(bit32.bor(l_MountLayoutDev_0, l_Update_0), l_Layout_0, v244, v245);
    else
        return v229(l_Update_0, l_Layout_0, v244, v245);
    end;
end;
local function v249(v247, v248) --[[ Line: 1356 ]] --[[ Name: updateLayoutEffect ]]
    -- upvalues: l_Update_0 (copy), l_Layout_0 (copy)
    return updateEffectImpl(l_Update_0, l_Layout_0, v247, v248);
end;
imperativeHandleEffect = function(v250, v251) --[[ Line: 1369 ]] --[[ Name: imperativeHandleEffect ]]
    -- upvalues: l_console_0 (copy), l_Array_0 (copy), l_Object_0 (copy)
    if typeof(v251) == "function" then
        v251((v250()));
        return function() --[[ Line: 1377 ]]
            -- upvalues: v251 (copy)
            return v251(nil);
        end;
    elseif v251 ~= nil then
        if _G.__DEV__ and rawget(v251, "current") == nil then
            l_console_0.error("Expected useImperativeHandle() first argument to either be a " .. "ref callback or React.createRef() object. Instead received: %s.", "an object with keys {" .. l_Array_0.join(l_Object_0.keys(v251), ", ") .. "}");
        end;
        v251.current = v250();
        return function() --[[ Line: 1395 ]]
            -- upvalues: v251 (copy)
            v251.current = nil;
        end;
    else
        return;
    end;
end;
mountImperativeHandle = function(v252, v253, v254) --[[ Line: 1410 ]] --[[ Name: mountImperativeHandle ]]
    -- upvalues: l_console_0 (copy), v8 (copy), l_enableDoubleInvokingEffects_0 (copy), v229 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy), l_Layout_0 (copy)
    if _G.__DEV__ and typeof(v253) ~= "function" then
        local v255 = "nil";
        if v253 then
            v255 = typeof(v253);
        end;
        l_console_0.error("Expected useImperativeHandle() second argument to be a function " .. "that creates a handle. Instead received: %s.", v255);
    end;
    local v256 = nil;
    if v254 ~= nil then
        v256 = v8.List.join(v254, {
            v252
        });
    end;
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        return v229(bit32.bor(l_MountLayoutDev_0, l_Update_0), l_Layout_0, function() --[[ Line: 1439 ]]
            -- upvalues: v253 (copy), v252 (copy)
            return imperativeHandleEffect(v253, v252);
        end, v256);
    else
        return v229(l_Update_0, l_Layout_0, function() --[[ Line: 1448 ]]
            -- upvalues: v253 (copy), v252 (copy)
            return imperativeHandleEffect(v253, v252);
        end, v256);
    end;
end;
updateImperativeHandle = function(v257, v258, v259) --[[ Line: 1462 ]] --[[ Name: updateImperativeHandle ]]
    -- upvalues: l_console_0 (copy), v8 (copy), l_Update_0 (copy), l_Layout_0 (copy)
    if _G.__DEV__ and typeof(v258) ~= "function" then
        local v260 = "nil";
        if v258 then
            v260 = typeof(v258);
        end;
        l_console_0.error("Expected useImperativeHandle() second argument to be a function " .. "that creates a handle. Instead received: %s.", v260);
    end;
    local v261 = nil;
    if v259 ~= nil then
        v261 = v8.List.join(v259, {
            v257
        });
    end;
    return updateEffectImpl(l_Update_0, l_Layout_0, function() --[[ Line: 1491 ]]
        -- upvalues: v258 (copy), v257 (copy)
        return imperativeHandleEffect(v258, v257);
    end, v261);
end;
mountDebugValue = function(_, _) --[[ Line: 1499 ]] --[[ Name: mountDebugValue ]]

end;
local l_mountDebugValue_0 = mountDebugValue;
mountCallback = function(v265, v266) --[[ Line: 1507 ]] --[[ Name: mountCallback ]]
    -- upvalues: v69 (ref), v67 (ref)
    local v267 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v69 == nil then
        v67.memoizedState = v267;
        v69 = v267;
    else
        v69.next = v267;
        v69 = v267;
    end;
    v69.memoizedState = {
        v265, 
        v266
    };
    return v265;
end;
updateCallback = function(v268, v269) --[[ Line: 1514 ]] --[[ Name: updateCallback ]]
    -- upvalues: v113 (copy), v100 (copy)
    local v270 = v113();
    local l_memoizedState_6 = v270.memoizedState;
    if l_memoizedState_6 ~= nil and v269 ~= nil then
        local v272 = l_memoizedState_6[2];
        if v100(v269, v272) then
            return l_memoizedState_6[1];
        end;
    end;
    v270.memoizedState = {
        v268, 
        v269
    };
    return v268;
end;
mountMemo = function(v273, v274) --[[ Line: 1536 ]] --[[ Name: mountMemo ]]
    -- upvalues: v69 (ref), v67 (ref)
    local v275 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v69 == nil then
        v67.memoizedState = v275;
        v69 = v275;
    else
        v69.next = v275;
        v69 = v275;
    end;
    local l_v69_6 = v69;
    v275 = v273();
    l_v69_6.memoizedState = {
        v275, 
        v274
    };
    return v275;
end;
updateMemo = function(v277, v278) --[[ Line: 1554 ]] --[[ Name: updateMemo ]]
    -- upvalues: v113 (copy), v100 (copy)
    local v279 = v113();
    local l_memoizedState_7 = v279.memoizedState;
    if l_memoizedState_7 ~= nil and v278 ~= nil then
        local v281 = l_memoizedState_7[2];
        if v100(v278, v281) then
            return l_memoizedState_7[1];
        end;
    end;
    local v282 = v277();
    v279.memoizedState = {
        v282, 
        v278
    };
    return v282;
end;
v65.getIsUpdatingOpaqueValueInRenderPhaseInDEV = function() --[[ Line: 1706 ]]
    if _G.__DEV__ then
        return false;
    else
        return nil;
    end;
end;
mountOpaqueIdentifier = function() --[[ Line: 1728 ]] --[[ Name: mountOpaqueIdentifier ]]
    -- upvalues: l_console_0 (copy), l_makeClientId_0 (copy), l_getIsHydrating_0 (copy)
    local v283 = nil;
    if _G.__DEV__ then
        l_console_0.warn("!!! unimplemented: warnOnOpaqueIdentifierAccessInDEV");
    else
        v283 = l_makeClientId_0;
    end;
    if l_getIsHydrating_0() then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("UNIMPLEMENTED ERROR: " .. "ReactFiberHooks: getIsHydrating() true");
        error("FIXME (roblox): " .. "ReactFiberHooks: getIsHydrating() true" .. " is unimplemented");
        return nil;
    else
        local v284 = v283();
        mountState(v284);
        return v284;
    end;
end;
updateOpaqueIdentifier = function() --[[ Line: 1795 ]] --[[ Name: updateOpaqueIdentifier ]]
    local v285, _ = updateState(nil);
    return v285;
end;
rerenderOpaqueIdentifier = function() --[[ Line: 1800 ]] --[[ Name: rerenderOpaqueIdentifier ]]
    local v287, _ = rerenderState(nil);
    return v287;
end;
dispatchAction = function(v289, v290, v291, ...) --[[ Line: 1811 ]] --[[ Name: dispatchAction ]]
    -- upvalues: l_console_0 (copy), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), v67 (ref), v70 (ref), v71 (ref), l_NoLanes_0 (copy), l_ReactCurrentDispatcher_0 (copy), v80 (ref), l_warnIfNotScopedWithMatchingAct_0 (copy), l_warnIfNotCurrentlyActingUpdatesInDEV_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_enableDebugTracing_0 (copy), l_DebugTracingMode_0 (copy), l_getComponentName_0 (copy), l_logStateUpdateScheduled_0 (copy), l_enableSchedulingProfiler_0 (copy), l_markStateUpdateScheduled_0 (copy)
    if _G.__DEV__ then
        local v292 = select("#", ...);
        local v293 = nil;
        if v292 == 1 then
            v293 = select(1, ...);
        end;
        if typeof(v293) == "function" then
            l_console_0.error("State updates from the useState() and useReducer() Hooks don't support the " .. "second callback argument. To execute a side effect after " .. "rendering, declare it in the component body with useEffect().");
        end;
    end;
    local v294 = l_requestEventTime_0();
    local v295 = l_requestUpdateLane_0(v289);
    local v296 = {
        lane = v295, 
        action = v291, 
        eagerReducer = nil, 
        eagerState = nil, 
        next = nil
    };
    local l_pending_2 = v290.pending;
    if l_pending_2 == nil then
        v296.next = v296;
    else
        v296.next = l_pending_2.next;
        l_pending_2.next = v296;
    end;
    v290.pending = v296;
    local l_alternate_1 = v289.alternate;
    if v289 == v67 or l_alternate_1 ~= nil and l_alternate_1 == v67 then
        v70 = true;
        v71 = true;
    else
        if v289.lanes == l_NoLanes_0 and (l_alternate_1 == nil or l_alternate_1.lanes == l_NoLanes_0) then
            local l_lastRenderedReducer_0 = v290.lastRenderedReducer;
            if l_lastRenderedReducer_0 ~= nil then
                local v300 = nil;
                if _G.__DEV__ then
                    v300 = l_ReactCurrentDispatcher_0.current;
                    l_ReactCurrentDispatcher_0.current = v80;
                end;
                local l_lastRenderedState_0 = v290.lastRenderedState;
                local l_status_1, l_result_1 = pcall(l_lastRenderedReducer_0, l_lastRenderedState_0, v291);
                if l_status_1 then
                    v296.eagerReducer = l_lastRenderedReducer_0;
                    v296.eagerState = l_result_1;
                end;
                if _G.__DEV__ then
                    l_ReactCurrentDispatcher_0.current = v300;
                end;
                if l_result_1 == l_lastRenderedState_0 and (l_result_1 ~= 0 or 1 / l_result_1 == 1 / l_lastRenderedState_0) or l_result_1 ~= l_result_1 and l_lastRenderedState_0 ~= l_lastRenderedState_0 then
                    return;
                elseif not l_status_1 then

                end;
            end;
        end;
        if _G.__DEV__ and (typeof(_G.jest) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__) then
            l_warnIfNotScopedWithMatchingAct_0(v289);
            l_warnIfNotCurrentlyActingUpdatesInDEV_0(v289);
        end;
        l_scheduleUpdateOnFiber_0(v289, v295, v294);
    end;
    if _G.__DEV__ and l_enableDebugTracing_0 and bit32.band(v289.mode, l_DebugTracingMode_0) ~= 0 then
        local v304 = l_getComponentName_0(v289.type) or "Unknown";
        l_logStateUpdateScheduled_0(v304, v295, v291);
    end;
    if l_enableSchedulingProfiler_0 then
        l_markStateUpdateScheduled_0(v289, v295);
    end;
end;
local v305 = {
    readContext = l_readContext_0, 
    useCallback = v94, 
    useContext = v94, 
    useEffect = v94, 
    useImperativeHandle = v94, 
    useLayoutEffect = v94, 
    useMemo = v94, 
    useReducer = v94, 
    useRef = v94, 
    useState = v94, 
    useDebugValue = v94, 
    useMutableSource = v94, 
    useOpaqueIdentifier = v94, 
    unstable_isNewReconciler = l_enableNewReconciler_0
};
v65.ContextOnlyDispatcher = v305;
local v306 = {
    readContext = l_readContext_0, 
    useCallback = mountCallback, 
    useContext = l_readContext_0, 
    useEffect = v240, 
    useImperativeHandle = mountImperativeHandle, 
    useLayoutEffect = v246, 
    useMemo = mountMemo, 
    useReducer = mountReducer, 
    useRef = mountRef, 
    useState = mountState, 
    useDebugValue = mountDebugValue, 
    useMutableSource = mountMutableSource, 
    useOpaqueIdentifier = mountOpaqueIdentifier, 
    unstable_isNewReconciler = l_enableNewReconciler_0
};
local v307 = {
    readContext = l_readContext_0, 
    useCallback = updateCallback, 
    useContext = l_readContext_0, 
    useEffect = v243, 
    useImperativeHandle = updateImperativeHandle, 
    useLayoutEffect = v249, 
    useMemo = updateMemo, 
    useReducer = updateReducer, 
    useRef = updateRef, 
    useState = updateState, 
    useDebugValue = l_mountDebugValue_0, 
    useMutableSource = updateMutableSource, 
    useOpaqueIdentifier = updateOpaqueIdentifier, 
    unstable_isNewReconciler = l_enableNewReconciler_0
};
local v308 = {
    readContext = l_readContext_0, 
    useCallback = updateCallback, 
    useContext = l_readContext_0, 
    useEffect = v243, 
    useImperativeHandle = updateImperativeHandle, 
    useLayoutEffect = v249, 
    useMemo = updateMemo, 
    useReducer = rerenderReducer, 
    useRef = updateRef, 
    useState = rerenderState, 
    useDebugValue = l_mountDebugValue_0, 
    useMutableSource = updateMutableSource, 
    useOpaqueIdentifier = rerenderOpaqueIdentifier, 
    unstable_isNewReconciler = l_enableNewReconciler_0
};
if _G.__DEV__ then
    local function _() --[[ Line: 2024 ]]
        -- upvalues: l_console_0 (copy)
        l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
    end;
    local function _() --[[ Line: 2033 ]]
        -- upvalues: l_console_0 (copy)
        l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
    end;
    v75 = {
        readContext = function(v311, v312) --[[ Line: 2043 ]] --[[ Name: readContext ]]
            -- upvalues: l_readContext_0 (copy)
            return l_readContext_0(v311, v312);
        end, 
        useCallback = function(v313, v314) --[[ Line: 2049 ]] --[[ Name: useCallback ]]
            -- upvalues: v72 (ref), v73 (ref), l_Array_0 (copy), l_console_0 (copy)
            v72 = "useCallback";
            if _G.__DEV__ then
                local l_v72_2 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_2
                    };
                else
                    table.insert(v73, l_v72_2);
                end;
            end;
            if _G.__DEV__ and v314 ~= nil and not l_Array_0.isArray(v314) then
                l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v72, (typeof(v314)));
            end;
            return mountCallback(v313, v314);
        end, 
        useContext = function(v316, v317) --[[ Line: 2055 ]] --[[ Name: useContext ]]
            -- upvalues: v72 (ref), v73 (ref), l_readContext_0 (copy)
            v72 = "useContext";
            if _G.__DEV__ then
                local l_v72_3 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_3
                    };
                else
                    table.insert(v73, l_v72_3);
                end;
            end;
            return l_readContext_0(v316, v317);
        end, 
        useEffect = function(v319, v320) --[[ Line: 2063 ]] --[[ Name: useEffect ]]
            -- upvalues: v72 (ref), v73 (ref), l_Array_0 (copy), l_console_0 (copy), v240 (copy)
            v72 = "useEffect";
            if _G.__DEV__ then
                local l_v72_4 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_4
                    };
                else
                    table.insert(v73, l_v72_4);
                end;
            end;
            if _G.__DEV__ and v320 ~= nil and not l_Array_0.isArray(v320) then
                l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v72, (typeof(v320)));
            end;
            return v240(v319, v320);
        end, 
        useImperativeHandle = function(v322, v323, v324) --[[ Line: 2079 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v72 (ref), v73 (ref), l_Array_0 (copy), l_console_0 (copy)
            v72 = "useImperativeHandle";
            if _G.__DEV__ then
                local l_v72_5 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_5
                    };
                else
                    table.insert(v73, l_v72_5);
                end;
            end;
            if _G.__DEV__ and v324 ~= nil and not l_Array_0.isArray(v324) then
                l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v72, (typeof(v324)));
            end;
            return mountImperativeHandle(v322, v323, v324);
        end, 
        useLayoutEffect = function(v326, v327) --[[ Line: 2089 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v72 (ref), v73 (ref), l_Array_0 (copy), l_console_0 (copy), v246 (copy)
            v72 = "useLayoutEffect";
            if _G.__DEV__ then
                local l_v72_6 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_6
                    };
                else
                    table.insert(v73, l_v72_6);
                end;
            end;
            if _G.__DEV__ and v327 ~= nil and not l_Array_0.isArray(v327) then
                l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v72, (typeof(v327)));
            end;
            return v246(v326, v327);
        end, 
        useMemo = function(v329, v330) --[[ Line: 2101 ]] --[[ Name: useMemo ]]
            -- upvalues: v72 (ref), v73 (ref), l_Array_0 (copy), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v79 (ref)
            v72 = "useMemo";
            if _G.__DEV__ then
                local l_v72_7 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_7
                    };
                else
                    table.insert(v73, l_v72_7);
                end;
            end;
            if _G.__DEV__ and v330 ~= nil and not l_Array_0.isArray(v330) then
                l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v72, (typeof(v330)));
            end;
            local l_current_1 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v79;
            local l_status_2, l_result_2 = pcall(mountMemo, v329, v330);
            l_ReactCurrentDispatcher_0.current = l_current_1;
            if not l_status_2 then
                error(l_result_2);
            end;
            return l_result_2;
        end, 
        useReducer = function(v335, v336, v337) --[[ Line: 2120 ]] --[[ Name: useReducer ]]
            -- upvalues: v72 (ref), v73 (ref), l_ReactCurrentDispatcher_0 (copy), v79 (ref)
            v72 = "useReducer";
            if _G.__DEV__ then
                local l_v72_8 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_8
                    };
                else
                    table.insert(v73, l_v72_8);
                end;
            end;
            local l_current_2 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v79;
            local v340, v341, v342 = pcall(mountReducer, v335, v336, v337);
            l_ReactCurrentDispatcher_0.current = l_current_2;
            if not v340 then
                error(v341);
            end;
            return v341, v342;
        end, 
        useRef = function(v343) --[[ Line: 2139 ]] --[[ Name: useRef ]]
            -- upvalues: v72 (ref), v73 (ref)
            v72 = "useRef";
            if _G.__DEV__ then
                local l_v72_9 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_9
                    };
                else
                    table.insert(v73, l_v72_9);
                end;
            end;
            return mountRef(v343);
        end, 
        useState = function(v345) --[[ Line: 2148 ]] --[[ Name: useState ]]
            -- upvalues: v72 (ref), v73 (ref), l_ReactCurrentDispatcher_0 (copy), v79 (ref)
            v72 = "useState";
            if _G.__DEV__ then
                local l_v72_10 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_10
                    };
                else
                    table.insert(v73, l_v72_10);
                end;
            end;
            local l_current_3 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v79;
            local v348, v349, v350 = pcall(mountState, v345);
            l_ReactCurrentDispatcher_0.current = l_current_3;
            if not v348 then
                error(v349);
            end;
            return v349, v350;
        end, 
        useDebugValue = function(v351, v352) --[[ Line: 2166 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v72 (ref), v73 (ref)
            v72 = "useDebugValue";
            if _G.__DEV__ then
                local l_v72_11 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_11
                    };
                else
                    table.insert(v73, l_v72_11);
                end;
            end;
            return mountDebugValue(v351, v352);
        end, 
        useMutableSource = function(v354, v355, v356) --[[ Line: 2187 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v72 (ref), v73 (ref)
            v72 = "useMutableSource";
            if _G.__DEV__ then
                local l_v72_12 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_12
                    };
                else
                    table.insert(v73, l_v72_12);
                end;
            end;
            return mountMutableSource(v354, v355, v356);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2196 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v72 (ref), v73 (ref)
            v72 = "useOpaqueIdentifier";
            if _G.__DEV__ then
                local l_v72_13 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_13
                    };
                else
                    table.insert(v73, l_v72_13);
                end;
            end;
            return mountOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v76 = {
        readContext = function(v359, v360) --[[ Line: 2211 ]] --[[ Name: readContext ]]
            -- upvalues: l_readContext_0 (copy)
            return l_readContext_0(v359, v360);
        end, 
        useCallback = function(v361, v362) --[[ Line: 2219 ]] --[[ Name: useCallback ]]
            -- upvalues: v72 (ref), l_Array_0 (copy), l_console_0 (copy)
            v72 = "useCallback";
            updateHookTypesDev();
            if _G.__DEV__ and v362 ~= nil and not l_Array_0.isArray(v362) then
                l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v72, (typeof(v362)));
            end;
            return mountCallback(v361, v362);
        end, 
        useContext = function(v363, v364) --[[ Line: 2230 ]] --[[ Name: useContext ]]
            -- upvalues: v72 (ref), l_readContext_0 (copy)
            v72 = "useContext";
            updateHookTypesDev();
            return l_readContext_0(v363, v364);
        end, 
        useEffect = function(v365, v366) --[[ Line: 2238 ]] --[[ Name: useEffect ]]
            -- upvalues: v72 (ref), v240 (copy)
            v72 = "useEffect";
            updateHookTypesDev();
            return v240(v365, v366);
        end, 
        useImperativeHandle = function(v367, v368, v369) --[[ Line: 2253 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v72 (ref)
            v72 = "useImperativeHandle";
            updateHookTypesDev();
            return mountImperativeHandle(v367, v368, v369);
        end, 
        useLayoutEffect = function(v370, v371) --[[ Line: 2262 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v72 (ref), v246 (copy)
            v72 = "useLayoutEffect";
            updateHookTypesDev();
            return v246(v370, v371);
        end, 
        useMemo = function(v372, v373) --[[ Line: 2273 ]] --[[ Name: useMemo ]]
            -- upvalues: v72 (ref), l_ReactCurrentDispatcher_0 (copy), v79 (ref)
            v72 = "useMemo";
            updateHookTypesDev();
            local l_current_4 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v79;
            local l_status_3, l_result_3 = pcall(mountMemo, v372, v373);
            l_ReactCurrentDispatcher_0.current = l_current_4;
            if not l_status_3 then
                error(l_result_3);
            end;
            return l_result_3;
        end, 
        useReducer = function(v377, v378, v379) --[[ Line: 2291 ]] --[[ Name: useReducer ]]
            -- upvalues: v72 (ref), l_ReactCurrentDispatcher_0 (copy), v79 (ref)
            v72 = "useReducer";
            updateHookTypesDev();
            local l_current_5 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v79;
            local v381, v382, v383 = pcall(mountReducer, v377, v378, v379);
            l_ReactCurrentDispatcher_0.current = l_current_5;
            if not v381 then
                error(v382);
            end;
            return v382, v383;
        end, 
        useRef = function(v384) --[[ Line: 2311 ]] --[[ Name: useRef ]]
            -- upvalues: v72 (ref)
            v72 = "useRef";
            updateHookTypesDev();
            return mountRef(v384);
        end, 
        useState = function(v385) --[[ Line: 2320 ]] --[[ Name: useState ]]
            -- upvalues: v72 (ref), l_ReactCurrentDispatcher_0 (copy), v79 (ref)
            v72 = "useState";
            updateHookTypesDev();
            local l_current_6 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v79;
            local v387, v388, v389 = pcall(mountState, v385);
            l_ReactCurrentDispatcher_0.current = l_current_6;
            if not v387 then
                error(v388);
            end;
            return v388, v389;
        end, 
        useDebugValue = function(v390, v391) --[[ Line: 2337 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v72 (ref)
            v72 = "useDebugValue";
            updateHookTypesDev();
            return mountDebugValue(v390, v391);
        end, 
        useMutableSource = function(v392, v393, v394) --[[ Line: 2358 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v72 (ref)
            v72 = "useMutableSource";
            updateHookTypesDev();
            return mountMutableSource(v392, v393, v394);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2367 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v72 (ref)
            v72 = "useOpaqueIdentifier";
            updateHookTypesDev();
            return mountOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v77 = {
        readContext = function(v395, v396) --[[ Line: 2382 ]] --[[ Name: readContext ]]
            -- upvalues: l_readContext_0 (copy)
            return l_readContext_0(v395, v396);
        end, 
        useCallback = function(v397, v398) --[[ Line: 2390 ]] --[[ Name: useCallback ]]
            -- upvalues: v72 (ref)
            v72 = "useCallback";
            updateHookTypesDev();
            return mountCallback(v397, v398);
        end, 
        useContext = function(v399, v400) --[[ Line: 2400 ]] --[[ Name: useContext ]]
            -- upvalues: v72 (ref), l_readContext_0 (copy)
            v72 = "useContext";
            updateHookTypesDev();
            return l_readContext_0(v399, v400);
        end, 
        useEffect = function(v401, v402) --[[ Line: 2408 ]] --[[ Name: useEffect ]]
            -- upvalues: v72 (ref), v243 (copy)
            v72 = "useEffect";
            updateHookTypesDev();
            return v243(v401, v402);
        end, 
        useImperativeHandle = function(v403, v404, v405) --[[ Line: 2423 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v72 (ref)
            v72 = "useImperativeHandle";
            updateHookTypesDev();
            return updateImperativeHandle(v403, v404, v405);
        end, 
        useLayoutEffect = function(v406, v407) --[[ Line: 2432 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v72 (ref), v249 (copy)
            v72 = "useLayoutEffect";
            updateHookTypesDev();
            return v249(v406, v407);
        end, 
        useMemo = function(v408, v409) --[[ Line: 2443 ]] --[[ Name: useMemo ]]
            -- upvalues: v72 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v72 = "useMemo";
            updateHookTypesDev();
            local l_current_7 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local l_status_4, l_result_4 = pcall(updateMemo, v408, v409);
            l_ReactCurrentDispatcher_0.current = l_current_7;
            if not l_status_4 then
                error(l_result_4);
            end;
            return l_result_4;
        end, 
        useReducer = function(v413, v414, v415) --[[ Line: 2461 ]] --[[ Name: useReducer ]]
            -- upvalues: v72 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v72 = "useReducer";
            updateHookTypesDev();
            local l_current_8 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v417, v418, v419 = pcall(updateReducer, v413, v414, v415);
            l_ReactCurrentDispatcher_0.current = l_current_8;
            if not v417 then
                error(v418);
            end;
            return v418, v419;
        end, 
        useRef = function(v420) --[[ Line: 2480 ]] --[[ Name: useRef ]]
            -- upvalues: v72 (ref)
            v72 = "useRef";
            updateHookTypesDev();
            return updateRef(v420);
        end, 
        useState = function(v421) --[[ Line: 2489 ]] --[[ Name: useState ]]
            -- upvalues: v72 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v72 = "useState";
            updateHookTypesDev();
            local l_current_9 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v423, v424, v425 = pcall(updateState, v421);
            l_ReactCurrentDispatcher_0.current = l_current_9;
            if not v423 then
                error(v424);
            end;
            return v424, v425;
        end, 
        useDebugValue = function(v426, v427) --[[ Line: 2507 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v72 (ref), l_mountDebugValue_0 (copy)
            v72 = "useDebugValue";
            updateHookTypesDev();
            return l_mountDebugValue_0(v426, v427);
        end, 
        useMutableSource = function(v428, v429, v430) --[[ Line: 2528 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v72 (ref)
            v72 = "useMutableSource";
            updateHookTypesDev();
            return updateMutableSource(v428, v429, v430);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2537 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v72 (ref)
            v72 = "useOpaqueIdentifier";
            updateHookTypesDev();
            return updateOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v78 = {
        readContext = function(v431, v432) --[[ Line: 2552 ]] --[[ Name: readContext ]]
            -- upvalues: l_readContext_0 (copy)
            return l_readContext_0(v431, v432);
        end, 
        useCallback = function(v433, v434) --[[ Line: 2560 ]] --[[ Name: useCallback ]]
            -- upvalues: v72 (ref)
            v72 = "useCallback";
            updateHookTypesDev();
            return mountCallback(v433, v434);
        end, 
        useContext = function(v435, v436) --[[ Line: 2570 ]] --[[ Name: useContext ]]
            -- upvalues: v72 (ref), l_readContext_0 (copy)
            v72 = "useContext";
            updateHookTypesDev();
            return l_readContext_0(v435, v436);
        end, 
        useEffect = function(v437, v438) --[[ Line: 2583 ]] --[[ Name: useEffect ]]
            -- upvalues: v72 (ref), v243 (copy)
            v72 = "useEffect";
            updateHookTypesDev();
            return v243(v437, v438);
        end, 
        useImperativeHandle = function(v439, v440, v441) --[[ Line: 2598 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v72 (ref)
            v72 = "useImperativeHandle";
            updateHookTypesDev();
            return updateImperativeHandle(v439, v440, v441);
        end, 
        useLayoutEffect = function(v442, v443) --[[ Line: 2607 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v72 (ref), v249 (copy)
            v72 = "useLayoutEffect";
            updateHookTypesDev();
            return v249(v442, v443);
        end, 
        useMemo = function(v444, v445) --[[ Line: 2619 ]] --[[ Name: useMemo ]]
            -- upvalues: v72 (ref), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v72 = "useMemo";
            updateHookTypesDev();
            local l_current_10 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local l_status_5, l_result_5 = pcall(updateMemo, v444, v445);
            l_ReactCurrentDispatcher_0.current = l_current_10;
            if not l_status_5 then
                error(l_result_5);
            end;
            return l_result_5;
        end, 
        useReducer = function(v449, v450, v451) --[[ Line: 2637 ]] --[[ Name: useReducer ]]
            -- upvalues: v72 (ref), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v72 = "useReducer";
            updateHookTypesDev();
            local l_current_11 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v453, v454, v455 = pcall(rerenderReducer, v449, v450, v451);
            l_ReactCurrentDispatcher_0.current = l_current_11;
            if not v453 then
                error(v454);
            end;
            return v454, v455;
        end, 
        useRef = function(v456) --[[ Line: 2656 ]] --[[ Name: useRef ]]
            -- upvalues: v72 (ref)
            v72 = "useRef";
            updateHookTypesDev();
            return updateRef(v456);
        end, 
        useState = function(v457) --[[ Line: 2665 ]] --[[ Name: useState ]]
            -- upvalues: v72 (ref), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v72 = "useState";
            updateHookTypesDev();
            local l_current_12 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v459, v460, v461 = pcall(rerenderState, v457);
            l_ReactCurrentDispatcher_0.current = l_current_12;
            if not v459 then
                error(v460);
            end;
            return v460, v461;
        end, 
        useDebugValue = function(v462, v463) --[[ Line: 2682 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v72 (ref), l_mountDebugValue_0 (copy)
            v72 = "useDebugValue";
            updateHookTypesDev();
            return l_mountDebugValue_0(v462, v463);
        end, 
        useMutableSource = function(v464, v465, v466) --[[ Line: 2703 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v72 (ref)
            v72 = "useMutableSource";
            updateHookTypesDev();
            return updateMutableSource(v464, v465, v466);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2712 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v72 (ref)
            v72 = "useOpaqueIdentifier";
            updateHookTypesDev();
            return rerenderOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v79 = {
        readContext = function(v467, v468) --[[ Line: 2727 ]] --[[ Name: readContext ]]
            -- upvalues: l_console_0 (copy), l_readContext_0 (copy)
            l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
            return l_readContext_0(v467, v468);
        end, 
        useCallback = function(v469, v470) --[[ Line: 2736 ]] --[[ Name: useCallback ]]
            -- upvalues: v72 (ref), l_console_0 (copy), v73 (ref)
            v72 = "useCallback";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v72_14 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_14
                    };
                else
                    table.insert(v73, l_v72_14);
                end;
            end;
            return mountCallback(v469, v470);
        end, 
        useContext = function(v472, v473) --[[ Line: 2742 ]] --[[ Name: useContext ]]
            -- upvalues: v72 (ref), l_console_0 (copy), v73 (ref), l_readContext_0 (copy)
            v72 = "useContext";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v72_15 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_15
                    };
                else
                    table.insert(v73, l_v72_15);
                end;
            end;
            return l_readContext_0(v472, v473);
        end, 
        useEffect = function(v475, v476) --[[ Line: 2751 ]] --[[ Name: useEffect ]]
            -- upvalues: v72 (ref), l_console_0 (copy), v73 (ref), v240 (copy)
            v72 = "useEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v72_16 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_16
                    };
                else
                    table.insert(v73, l_v72_16);
                end;
            end;
            return v240(v475, v476);
        end, 
        useImperativeHandle = function(v478, v479, v480) --[[ Line: 2761 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v72 (ref), l_console_0 (copy), v73 (ref)
            v72 = "useImperativeHandle";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v72_17 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_17
                    };
                else
                    table.insert(v73, l_v72_17);
                end;
            end;
            return mountImperativeHandle(v478, v479, v480);
        end, 
        useLayoutEffect = function(v482, v483) --[[ Line: 2771 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v72 (ref), l_console_0 (copy), v73 (ref), v246 (copy)
            v72 = "useLayoutEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v72_18 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_18
                    };
                else
                    table.insert(v73, l_v72_18);
                end;
            end;
            return v246(v482, v483);
        end, 
        useMemo = function(v485, v486) --[[ Line: 2781 ]] --[[ Name: useMemo ]]
            -- upvalues: v72 (ref), l_console_0 (copy), v73 (ref), l_ReactCurrentDispatcher_0 (copy), v79 (ref)
            v72 = "useMemo";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v72_19 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_19
                    };
                else
                    table.insert(v73, l_v72_19);
                end;
            end;
            local l_current_13 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v79;
            local l_status_6, l_result_6 = pcall(mountMemo, v485, v486);
            l_ReactCurrentDispatcher_0.current = l_current_13;
            if not l_status_6 then
                error(l_result_6);
            end;
            return l_result_6;
        end, 
        useReducer = function(v491, v492, v493) --[[ Line: 2794 ]] --[[ Name: useReducer ]]
            -- upvalues: v72 (ref), l_console_0 (copy), v73 (ref), l_ReactCurrentDispatcher_0 (copy), v79 (ref)
            v72 = "useReducer";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v72_20 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_20
                    };
                else
                    table.insert(v73, l_v72_20);
                end;
            end;
            local l_current_14 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v79;
            local v496, v497, v498 = pcall(mountReducer, v491, v492, v493);
            l_ReactCurrentDispatcher_0.current = l_current_14;
            if not v496 then
                error(v497);
            end;
            return v497, v498;
        end, 
        useRef = function(v499) --[[ Line: 2814 ]] --[[ Name: useRef ]]
            -- upvalues: v72 (ref), l_console_0 (copy), v73 (ref)
            v72 = "useRef";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v72_21 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_21
                    };
                else
                    table.insert(v73, l_v72_21);
                end;
            end;
            return mountRef(v499);
        end, 
        useState = function(v501) --[[ Line: 2824 ]] --[[ Name: useState ]]
            -- upvalues: v72 (ref), l_console_0 (copy), v73 (ref), l_ReactCurrentDispatcher_0 (copy), v79 (ref)
            v72 = "useState";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v72_22 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_22
                    };
                else
                    table.insert(v73, l_v72_22);
                end;
            end;
            local l_current_15 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v79;
            local v504, v505, v506 = pcall(mountState, v501);
            l_ReactCurrentDispatcher_0.current = l_current_15;
            if not v504 then
                error(v505);
            end;
            return v505, v506;
        end, 
        useDebugValue = function(v507, v508) --[[ Line: 2843 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v72 (ref), l_console_0 (copy), v73 (ref)
            v72 = "useDebugValue";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v72_23 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_23
                    };
                else
                    table.insert(v73, l_v72_23);
                end;
            end;
            return mountDebugValue(v507, v508);
        end, 
        useMutableSource = function(v510, v511, v512) --[[ Line: 2867 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v72 (ref), l_console_0 (copy), v73 (ref)
            v72 = "useMutableSource";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v72_24 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_24
                    };
                else
                    table.insert(v73, l_v72_24);
                end;
            end;
            return mountMutableSource(v510, v511, v512);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2877 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v72 (ref), l_console_0 (copy), v73 (ref)
            v72 = "useOpaqueIdentifier";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            if _G.__DEV__ then
                local l_v72_25 = v72;
                if v73 == nil then
                    v73 = {
                        l_v72_25
                    };
                else
                    table.insert(v73, l_v72_25);
                end;
            end;
            return mountOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v80 = {
        readContext = function(v515, v516) --[[ Line: 2893 ]] --[[ Name: readContext ]]
            -- upvalues: l_console_0 (copy), l_readContext_0 (copy)
            l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
            return l_readContext_0(v515, v516);
        end, 
        useCallback = function(v517, v518) --[[ Line: 2902 ]] --[[ Name: useCallback ]]
            -- upvalues: v72 (ref), l_console_0 (copy)
            v72 = "useCallback";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return mountCallback(v517, v518);
        end, 
        useContext = function(v519, v520) --[[ Line: 2909 ]] --[[ Name: useContext ]]
            -- upvalues: v72 (ref), l_console_0 (copy), l_readContext_0 (copy)
            v72 = "useContext";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_readContext_0(v519, v520);
        end, 
        useEffect = function(v521, v522) --[[ Line: 2923 ]] --[[ Name: useEffect ]]
            -- upvalues: v72 (ref), l_console_0 (copy), v243 (copy)
            v72 = "useEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v243(v521, v522);
        end, 
        useImperativeHandle = function(v523, v524, v525) --[[ Line: 2939 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v72 (ref), l_console_0 (copy)
            v72 = "useImperativeHandle";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateImperativeHandle(v523, v524, v525);
        end, 
        useLayoutEffect = function(v526, v527) --[[ Line: 2949 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v72 (ref), l_console_0 (copy), v249 (copy)
            v72 = "useLayoutEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v249(v526, v527);
        end, 
        useMemo = function(v528, v529) --[[ Line: 2961 ]] --[[ Name: useMemo ]]
            -- upvalues: v72 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v72 = "useMemo";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_16 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local l_status_7, l_result_7 = pcall(updateMemo, v528, v529);
            l_ReactCurrentDispatcher_0.current = l_current_16;
            if not l_status_7 then
                error(l_result_7);
            end;
            return l_result_7;
        end, 
        useReducer = function(v533, v534, v535) --[[ Line: 2980 ]] --[[ Name: useReducer ]]
            -- upvalues: v72 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v72 = "useReducer";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_17 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v537, v538, v539 = pcall(updateReducer, v533, v534, v535);
            l_ReactCurrentDispatcher_0.current = l_current_17;
            if not v537 then
                error(v538);
            end;
            return v538, v539;
        end, 
        useRef = function(v540) --[[ Line: 3001 ]] --[[ Name: useRef ]]
            -- upvalues: v72 (ref), l_console_0 (copy)
            v72 = "useRef";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateRef(v540);
        end, 
        useState = function(v541) --[[ Line: 3011 ]] --[[ Name: useState ]]
            -- upvalues: v72 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v72 = "useState";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_18 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v543, v544, v545 = pcall(updateState, v541);
            l_ReactCurrentDispatcher_0.current = l_current_18;
            if not v543 then
                error(v544);
            end;
            return v544, v545;
        end, 
        useDebugValue = function(v546, v547) --[[ Line: 3030 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v72 (ref), l_console_0 (copy), l_mountDebugValue_0 (copy)
            v72 = "useDebugValue";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_mountDebugValue_0(v546, v547);
        end, 
        useMutableSource = function(v548, v549, v550) --[[ Line: 3054 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v72 (ref), l_console_0 (copy)
            v72 = "useMutableSource";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateMutableSource(v548, v549, v550);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 3064 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v72 (ref), l_console_0 (copy)
            v72 = "useOpaqueIdentifier";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v81 = {
        readContext = function(v551, v552) --[[ Line: 3080 ]] --[[ Name: readContext ]]
            -- upvalues: l_console_0 (copy), l_readContext_0 (copy)
            l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
            return l_readContext_0(v551, v552);
        end, 
        useCallback = function(v553, v554) --[[ Line: 3090 ]] --[[ Name: useCallback ]]
            -- upvalues: v72 (ref), l_console_0 (copy)
            v72 = "useCallback";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateCallback(v553, v554);
        end, 
        useContext = function(v555, v556) --[[ Line: 3101 ]] --[[ Name: useContext ]]
            -- upvalues: v72 (ref), l_console_0 (copy), l_readContext_0 (copy)
            v72 = "useContext";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_readContext_0(v555, v556);
        end, 
        useEffect = function(v557, v558) --[[ Line: 3115 ]] --[[ Name: useEffect ]]
            -- upvalues: v72 (ref), l_console_0 (copy), v243 (copy)
            v72 = "useEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v243(v557, v558);
        end, 
        useImperativeHandle = function(v559, v560, v561) --[[ Line: 3131 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v72 (ref), l_console_0 (copy)
            v72 = "useImperativeHandle";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateImperativeHandle(v559, v560, v561);
        end, 
        useLayoutEffect = function(v562, v563) --[[ Line: 3141 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v72 (ref), l_console_0 (copy), v249 (copy)
            v72 = "useLayoutEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v249(v562, v563);
        end, 
        useMemo = function(v564, v565) --[[ Line: 3153 ]] --[[ Name: useMemo ]]
            -- upvalues: v72 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v72 = "useMemo";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_19 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local l_status_8, l_result_8 = pcall(updateMemo, v564, v565);
            l_ReactCurrentDispatcher_0.current = l_current_19;
            if not l_status_8 then
                error(l_result_8);
            end;
            return l_result_8;
        end, 
        useReducer = function(v569, v570, v571) --[[ Line: 3172 ]] --[[ Name: useReducer ]]
            -- upvalues: v72 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v72 = "useReducer";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_20 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v573, v574, v575 = pcall(rerenderReducer, v569, v570, v571);
            l_ReactCurrentDispatcher_0.current = l_current_20;
            if not v573 then
                error(v574);
            end;
            return v574, v575;
        end, 
        useRef = function(v576) --[[ Line: 3192 ]] --[[ Name: useRef ]]
            -- upvalues: v72 (ref), l_console_0 (copy)
            v72 = "useRef";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateRef(v576);
        end, 
        useState = function(v577) --[[ Line: 3202 ]] --[[ Name: useState ]]
            -- upvalues: v72 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v72 = "useState";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_21 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v579, v580, v581 = pcall(rerenderState, v577);
            l_ReactCurrentDispatcher_0.current = l_current_21;
            if not v579 then
                error(v580);
            end;
            return v580, v581;
        end, 
        useDebugValue = function(v582, v583) --[[ Line: 3221 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v72 (ref), l_console_0 (copy), l_mountDebugValue_0 (copy)
            v72 = "useDebugValue";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_mountDebugValue_0(v582, v583);
        end, 
        useMutableSource = function(v584, v585, v586) --[[ Line: 3245 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v72 (ref), l_console_0 (copy)
            v72 = "useMutableSource";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateMutableSource(v584, v585, v586);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 3255 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v72 (ref), l_console_0 (copy)
            v72 = "useOpaqueIdentifier";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return rerenderOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
end;
v65.renderWithHooks = function(v587, v588, v589, v590, v591, v592) --[[ Line: 3276 ]] --[[ Name: renderWithHooks ]]
    -- upvalues: l_l_NoLanes_0_0 (ref), v67 (ref), v73 (ref), v74 (ref), l_NoLanes_0 (copy), l_ReactCurrentDispatcher_0 (copy), v77 (ref), v76 (ref), v75 (ref), v306 (copy), v307 (copy), v71 (ref), l_Error_0 (copy), v68 (ref), v69 (ref), v78 (ref), v308 (copy), v305 (copy), v72 (ref), v70 (ref)
    l_l_NoLanes_0_0 = v592;
    v67 = v588;
    if _G.__DEV__ then
        if v587 ~= nil then
            v73 = v587._debugHookTypes;
        else
            v73 = nil;
        end;
        v74 = 0;
    end;
    v588.memoizedState = nil;
    v588.updateQueue = nil;
    v588.lanes = l_NoLanes_0;
    if _G.__DEV__ then
        if v587 ~= nil and v587.memoizedState ~= nil then
            l_ReactCurrentDispatcher_0.current = v77;
        elseif v73 ~= nil then
            l_ReactCurrentDispatcher_0.current = v76;
        else
            l_ReactCurrentDispatcher_0.current = v75;
        end;
    else
        l_ReactCurrentDispatcher_0.current = (not (v587 ~= nil) or v587.memoizedState == nil) and v306 or v307;
    end;
    local v593 = v589(v590, v591);
    if v71 then
        local v594 = 0;
        repeat
            v71 = false;
            if v594 >= 25 then
                error(l_Error_0.new("Too many re-renders. React limits the number of renders to prevent " .. "an infinite loop."));
            end;
            v594 = v594 + 1;
            v68 = nil;
            v69 = nil;
            v588.updateQueue = nil;
            if _G.__DEV__ then
                v74 = 0;
            end;
            l_ReactCurrentDispatcher_0.current = _G.__DEV__ and v78 or v308;
            v593 = v589(v590, v591);
        until not v71;
    end;
    l_ReactCurrentDispatcher_0.current = v305;
    if _G.__DEV__ then
        v588._debugHookTypes = v73;
    end;
    local v595 = false;
    if v68 ~= nil then
        v595 = v68.next ~= nil;
    end;
    l_l_NoLanes_0_0 = l_NoLanes_0;
    v67 = nil;
    v68 = nil;
    v69 = nil;
    if _G.__DEV__ then
        v72 = nil;
        v73 = nil;
        v74 = 0;
    end;
    v70 = false;
    if v595 then
        error(l_Error_0.new("Rendered fewer hooks than expected. This may be caused by an accidental " .. "early return statement."));
    end;
    return v593;
end;
return v65;