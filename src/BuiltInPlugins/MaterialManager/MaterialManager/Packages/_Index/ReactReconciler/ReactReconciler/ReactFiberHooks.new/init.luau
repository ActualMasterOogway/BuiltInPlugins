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
local l_inspect_0 = v3.util.inspect;
local v8 = require(l_Parent_0.Cryo);
local l_createRef_0 = require(l_Parent_0.React).createRef;
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
local function _(v50, v51) --[[ Line: 106 ]] --[[ Name: is ]]
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
local function _() --[[ Line: 246 ]] --[[ Name: mountHookTypesDev ]]
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
updateHookTypesDev = function() --[[ Line: 259 ]] --[[ Name: updateHookTypesDev ]]
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
local function _(v86) --[[ Line: 273 ]] --[[ Name: checkDepsAreArrayDev ]]
    -- upvalues: l_Array_0 (copy), l_console_0 (copy), v73 (ref)
    if _G.__DEV__ and v86 ~= nil and not l_Array_0.isArray(v86) then
        l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (typeof(v86)));
    end;
end;
warnOnHookMismatchInDev = function(v88) --[[ Line: 288 ]] --[[ Name: warnOnHookMismatchInDev ]]
    -- upvalues: l_getComponentName_0 (copy), v68 (ref), v64 (ref), v74 (ref), v75 (ref), l_console_0 (copy)
    if _G.__DEV__ then
        local v89 = l_getComponentName_0(v68.type) or "Component";
        if not v64[v89] then
            v64[v89] = true;
            if v74 ~= nil then
                local v90 = "";
                for v91 = 1, v75 do
                    local v92 = v74[v91];
                    local v93 = nil;
                    v93 = if v91 == v75 then v88 else v92;
                    local v94 = tostring(v91) .. ". " .. (v92 or "undefined");
                    while string.len(v94) < 30 do
                        v94 = v94 .. " ";
                    end;
                    v90 = v90 .. v94 .. v93 .. "\n";
                end;
                l_console_0.error("React has detected a change in the order of Hooks called by %s. " .. "This will lead to bugs and errors if not fixed. " .. "For more information, read the Rules of Hooks: https://reactjs.org/link/rules-of-hooks\n\n" .. "   Previous render            Next render\n" .. "   ------------------------------------------------------\n" .. "%s" .. "   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n", v89, v90);
            end;
        end;
    end;
end;
local function v95() --[[ Line: 339 ]] --[[ Name: throwInvalidHookError ]]
    -- upvalues: l_Error_0 (copy)
    error(l_Error_0.new("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for" .. " one of the following reasons:\n" .. "1. You might have mismatching versions of React and the renderer (such as React DOM)\n" .. "2. You might be breaking the Rules of Hooks\n" .. "3. You might have more than one copy of React in the same app\n" .. "See https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem."));
end;
local function v101(v96, v97) --[[ Line: 352 ]] --[[ Name: areHookInputsEqual ]]
    -- upvalues: l_console_0 (copy), v73 (ref), l_inspect_0 (copy)
    if _G.__DEV__ then

    end;
    if v97 == nil then
        if _G.__DEV__ then
            l_console_0.error("%s received a final argument during this render, but not during " .. "the previous render. Even though the final argument is optional, " .. "its type cannot change between renders.", v73);
        end;
        return false;
    else
        if _G.__DEV__ and #v96 ~= #v97 then
            l_console_0.error("The final argument passed to %s changed size between renders. The " .. "order and size of this array must remain constant.\n\n" .. "Previous: %s\n" .. "Incoming: %s", v73, l_inspect_0(v97), l_inspect_0(v96));
        end;
        for v98 = 1, math.min(#v97, #v96) do
            local v99 = v96[v98];
            local v100 = v97[v98];
            if not (v99 == v100 and (v99 ~= 0 or 1 / v99 == 1 / v100) or v99 ~= v99 and v100 ~= v100) then
                return false;
            end;
        end;
        return true;
    end;
end;
v66.bailoutHooks = function(v102, v103, v104) --[[ Line: 402 ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), l_MountPassiveDev_0 (copy), l_Passive_0 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy), l_removeLanes_0 (copy)
    v103.updateQueue = v102.updateQueue;
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        v103.flags = bit32.band(v103.flags, (bit32.bnot((bit32.bor(l_MountPassiveDev_0, l_Passive_0, l_MountLayoutDev_0, l_Update_0)))));
    else
        v103.flags = bit32.band(v103.flags, (bit32.bnot((bit32.bor(l_Passive_0, l_Update_0)))));
    end;
    v102.lanes = l_removeLanes_0(v102.lanes, v104);
end;
local v105 = false;
v66.resetHooksAfterThrow = function() --[[ Line: 429 ]]
    -- upvalues: l_ReactCurrentDispatcher_0 (copy), v66 (copy), v71 (ref), v68 (ref), l_l_NoLanes_0_0 (ref), l_NoLanes_0 (copy), v69 (ref), v70 (ref), v74 (ref), v75 (ref), v73 (ref), v105 (ref), v72 (ref)
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
        v105 = false;
    end;
    v72 = false;
end;
local function _() --[[ Line: 474 ]] --[[ Name: mountWorkInProgressHook ]]
    -- upvalues: v70 (ref), v68 (ref)
    local v108 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v108;
        v70 = v108;
    else
        v70.next = v108;
        v70 = v108;
    end;
    return v70;
end;
local function v114() --[[ Line: 497 ]] --[[ Name: updateWorkInProgressHook ]]
    -- upvalues: v69 (ref), v68 (ref), v70 (ref), l_Error_0 (copy)
    local v110 = nil;
    if v69 == nil then
        local l_alternate_0 = v68.alternate;
        v110 = if l_alternate_0 ~= nil then l_alternate_0.memoizedState else nil;
    else
        v110 = v69.next;
    end;
    local v112 = nil;
    v112 = if v70 == nil then v68.memoizedState else v70.next;
    if v112 ~= nil then
        v70 = v112;
        v112 = v70.next;
        v69 = v110;
    else
        if v110 == nil then
            error(l_Error_0.new("Rendered more hooks than during the previous render."));
        end;
        v69 = v110;
        local v113 = {
            memoizedState = v69.memoizedState, 
            baseState = v69.baseState, 
            baseQueue = v69.baseQueue, 
            queue = v69.queue, 
            next = nil
        };
        if v70 == nil then
            v70 = v113;
            v68.memoizedState = v113;
        else
            v70.next = v113;
            v70 = v113;
        end;
    end;
    return v70;
end;
basicStateReducer = function(v115, v116) --[[ Line: 572 ]] --[[ Name: basicStateReducer ]]
    if typeof(v116) == "function" then
        return v116(v115);
    else
        return v116;
    end;
end;
mountReducer = function(v117, v118, v119) --[[ Line: 581 ]] --[[ Name: mountReducer ]]
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
    local l_v70_0 = v70;
    v120 = nil;
    v120 = if v119 ~= nil then v119(v118) else v118;
    l_v70_0.baseState = v120;
    l_v70_0.memoizedState = l_v70_0.baseState;
    local v122 = {
        pending = nil, 
        dispatch = nil, 
        lastRenderedReducer = v117, 
        lastRenderedState = v120
    };
    l_v70_0.queue = v122;
    local l_v68_0 = v68;
    local function v125(v124, ...) --[[ Line: 608 ]]
        -- upvalues: l_v68_0 (copy), v122 (copy)
        dispatchAction(l_v68_0, v122, v124, ...);
    end;
    v122.dispatch = v125;
    return l_v70_0.memoizedState, v125;
end;
updateReducer = function(v126, _, _) --[[ Line: 618 ]] --[[ Name: updateReducer ]]
    -- upvalues: v114 (copy), v69 (ref), l_l_NoLanes_0_0 (ref), v68 (ref), l_mergeLanes_0 (copy), l_markSkippedUpdateLanes_0 (copy), l_NoLane_0 (copy), l_markWorkInProgressReceivedUpdate_0 (copy)
    local v129 = v114();
    local l_queue_1 = v129.queue;
    assert(l_queue_1 ~= nil, "Should have a queue. This is likely a bug in React. Please file an issue.");
    l_queue_1.lastRenderedReducer = v126;
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
        local v137 = nil;
        local v138 = nil;
        local v139 = nil;
        local l_l_next_1_0 = l_next_1;
        repeat
            local l_lane_0 = l_l_next_1_0.lane;
            if bit32.band(l_l_NoLanes_0_0, l_lane_0) ~= l_lane_0 then
                local v142 = {
                    lane = l_lane_0, 
                    action = l_l_next_1_0.action, 
                    eagerReducer = l_l_next_1_0.eagerReducer, 
                    eagerState = l_l_next_1_0.eagerState, 
                    next = nil
                };
                if v139 == nil then
                    v139 = v142;
                    v138 = v139;
                    v137 = l_baseState_0;
                else
                    v139.next = v142;
                    v139 = v139.next;
                end;
                v68.lanes = l_mergeLanes_0(v68.lanes, l_lane_0);
                l_markSkippedUpdateLanes_0(l_lane_0);
            else
                if v139 ~= nil then
                    v139.next = {
                        lane = l_NoLane_0, 
                        action = l_l_next_1_0.action, 
                        eagerReducer = l_l_next_1_0.eagerReducer, 
                        eagerState = l_l_next_1_0.eagerState, 
                        next = nil
                    };
                    v139 = v139.next;
                end;
                if l_l_next_1_0.eagerReducer == v126 then
                    l_baseState_0 = l_l_next_1_0.eagerState;
                else
                    l_baseState_0 = v126(l_baseState_0, l_l_next_1_0.action);
                end;
            end;
            l_l_next_1_0 = l_l_next_1_0.next;
        until l_l_next_1_0 == nil or l_l_next_1_0 == l_next_1;
        if v139 == nil then
            v137 = l_baseState_0;
        else
            v139.next = v138;
        end;
        local l_l_baseState_0_0 = l_baseState_0;
        local l_memoizedState_1 = v129.memoizedState;
        if not (l_l_baseState_0_0 == l_memoizedState_1 and (l_l_baseState_0_0 ~= 0 or 1 / l_l_baseState_0_0 == 1 / l_memoizedState_1) or l_l_baseState_0_0 ~= l_l_baseState_0_0 and l_memoizedState_1 ~= l_memoizedState_1) then
            l_markWorkInProgressReceivedUpdate_0();
        end;
        v129.memoizedState = l_baseState_0;
        v129.baseState = v137;
        v129.baseQueue = v139;
        l_queue_1.lastRenderedState = l_baseState_0;
    end;
    local l_dispatch_0 = l_queue_1.dispatch;
    return v129.memoizedState, l_dispatch_0;
end;
rerenderReducer = function(v146, _, _) --[[ Line: 758 ]] --[[ Name: rerenderReducer ]]
    -- upvalues: v114 (copy), l_markWorkInProgressReceivedUpdate_0 (copy)
    local v149 = v114();
    local l_queue_2 = v149.queue;
    assert(l_queue_2 ~= nil, "Should have a queue. This is likely a bug in React. Please file an issue.");
    l_queue_2.lastRenderedReducer = v146;
    local l_dispatch_1 = l_queue_2.dispatch;
    local l_pending_1 = l_queue_2.pending;
    local l_memoizedState_2 = v149.memoizedState;
    if l_pending_1 ~= nil then
        l_queue_2.pending = nil;
        local l_next_2 = l_pending_1.next;
        local l_l_next_2_0 = l_next_2;
        repeat
            l_memoizedState_2 = v146(l_memoizedState_2, l_l_next_2_0.action);
            l_l_next_2_0 = l_l_next_2_0.next;
        until l_l_next_2_0 == l_next_2;
        local l_l_memoizedState_2_0 = l_memoizedState_2;
        local l_memoizedState_3 = v149.memoizedState;
        if not (l_l_memoizedState_2_0 == l_memoizedState_3 and (l_l_memoizedState_2_0 ~= 0 or 1 / l_l_memoizedState_2_0 == 1 / l_memoizedState_3) or l_l_memoizedState_2_0 ~= l_l_memoizedState_2_0 and l_memoizedState_3 ~= l_memoizedState_3) then
            l_markWorkInProgressReceivedUpdate_0();
        end;
        v149.memoizedState = l_memoizedState_2;
        if v149.baseQueue == nil then
            v149.baseState = l_memoizedState_2;
        end;
        l_queue_2.lastRenderedState = l_memoizedState_2;
    end;
    return l_memoizedState_2, l_dispatch_1;
end;
readFromUnsubcribedMutableSource = function(v158, v159, v160) --[[ Line: 823 ]] --[[ Name: readFromUnsubcribedMutableSource ]]
    -- upvalues: l_warnAboutMultipleRenderersDEV_0 (copy), l_getWorkInProgressVersion_0 (copy), l_isSubsetOfLanes_0 (copy), l_l_NoLanes_0_0 (ref), l_setWorkInProgressVersion_0 (copy), l_console_0 (copy), l_markSourceAsDirty_0 (copy), l_Error_0 (copy)
    if _G.__DEV__ then
        l_warnAboutMultipleRenderersDEV_0(v159);
    end;
    local v161 = v159._getVersion(v159._source);
    local v162 = false;
    local v163 = l_getWorkInProgressVersion_0(v159);
    if v163 ~= nil then
        v162 = v163 == v161;
    else
        v162 = l_isSubsetOfLanes_0(l_l_NoLanes_0_0, v158.mutableReadLanes);
        if v162 then
            l_setWorkInProgressVersion_0(v159, v161);
        end;
    end;
    if v162 then
        local v164 = v160(v159._source);
        if _G.__DEV__ and typeof(v164) == "function" then
            l_console_0.error("Mutable source should not return a function as the snapshot value. " .. "Functions may close over mutable values and cause tearing.");
        end;
        return v164;
    else
        l_markSourceAsDirty_0(v159);
        error(l_Error_0.new("Cannot read from mutable source during the current render without tearing. This is a bug in React. Please file an issue."));
        return;
    end;
end;
useMutableSource = function(v165, v166, v167, v168) --[[ Line: 904 ]] --[[ Name: useMutableSource ]]
    -- upvalues: l_getWorkInProgressRoot_0 (copy), l_invariant_0 (copy), l_ReactCurrentDispatcher_0 (copy), v70 (ref), v68 (ref), l_console_0 (copy), l_requestUpdateLane_0 (copy), l_markRootMutableRead_0 (copy), l_markRootEntangled_0 (copy)
    local v169 = l_getWorkInProgressRoot_0();
    l_invariant_0(v169 ~= nil, "Expected a work-in-progress root. This is a bug in React. Please file an issue.");
    local l__getVersion_0 = v166._getVersion;
    local v171 = l__getVersion_0(v166._source);
    local l_current_0 = l_ReactCurrentDispatcher_0.current;
    assert(l_current_0 ~= nil, "dispatcher was nil, this is a bug in React");
    local v173, v174 = l_current_0.useState(function() --[[ Line: 923 ]]
        -- upvalues: v169 (copy), v166 (copy), v167 (copy)
        return readFromUnsubcribedMutableSource(v169, v166, v167);
    end);
    local l_v173_0 = v173;
    local l_v70_1 = v70;
    local l_memoizedState_4 = v165.memoizedState;
    if l_memoizedState_4.refs == nil then
        error((tostring(debug.traceback())));
    end;
    local l_refs_0 = l_memoizedState_4.refs;
    local l_getSnapshot_0 = l_refs_0.getSnapshot;
    local l_source_0 = l_memoizedState_4.source;
    local l_subscribe_0 = l_memoizedState_4.subscribe;
    local l_v68_1 = v68;
    v165.memoizedState = {
        refs = l_refs_0, 
        source = v166, 
        subscribe = v168
    };
    l_current_0.useEffect(function() --[[ Line: 952 ]]
        -- upvalues: l_refs_0 (copy), v167 (copy), v174 (ref), l__getVersion_0 (copy), v166 (copy), v171 (copy), l_console_0 (ref), l_v173_0 (ref), l_requestUpdateLane_0 (ref), l_v68_1 (copy), l_markRootMutableRead_0 (ref), v169 (copy), l_markRootEntangled_0 (ref)
        l_refs_0.getSnapshot = v167;
        l_refs_0.setSnapshot = v174;
        local v183 = l__getVersion_0(v166._source);
        local l_v171_0 = v171;
        if not (l_v171_0 == v183 and (l_v171_0 ~= 0 or 1 / l_v171_0 == 1 / v183) or l_v171_0 ~= l_v171_0 and v183 ~= v183) then
            local v185 = v167(v166._source);
            if _G.__DEV__ and typeof(v185) == "function" then
                l_console_0.error("Mutable source should not return a function as the snapshot value. " .. "Functions may close over mutable values and cause tearing.");
            end;
            local l_l_v173_0_0 = l_v173_0;
            if not (l_l_v173_0_0 == v185 and (l_l_v173_0_0 ~= 0 or 1 / l_l_v173_0_0 == 1 / v185) or l_l_v173_0_0 ~= l_l_v173_0_0 and v185 ~= v185) then
                v174(v185);
                l_v171_0 = l_requestUpdateLane_0(l_v68_1);
                l_markRootMutableRead_0(v169, l_v171_0);
            end;
            l_markRootEntangled_0(v169, v169.mutableReadLanes);
        end;
    end, {
        v167, 
        v166, 
        v168
    });
    l_current_0.useEffect(function() --[[ Line: 990 ]]
        -- upvalues: l_refs_0 (copy), v166 (copy), l_requestUpdateLane_0 (ref), l_v68_1 (copy), l_markRootMutableRead_0 (ref), v169 (copy), v168 (copy), l_console_0 (ref)
        local function v192() --[[ Line: 991 ]]
            -- upvalues: l_refs_0 (ref), v166 (ref), l_requestUpdateLane_0 (ref), l_v68_1 (ref), l_markRootMutableRead_0 (ref), v169 (ref)
            local l_getSnapshot_1 = l_refs_0.getSnapshot;
            local l_setSnapshot_0 = l_refs_0.setSnapshot;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 996 ]]
                -- upvalues: l_setSnapshot_0 (copy), l_getSnapshot_1 (copy), v166 (ref), l_requestUpdateLane_0 (ref), l_v68_1 (ref), l_markRootMutableRead_0 (ref), v169 (ref)
                l_setSnapshot_0(l_getSnapshot_1(v166._source));
                local v189 = l_requestUpdateLane_0(l_v68_1);
                l_markRootMutableRead_0(v169, v189);
            end);
            if not l_status_0 then
                l_setSnapshot_0(function() --[[ Line: 1011 ]]
                    -- upvalues: l_result_0 (copy)
                    error(l_result_0);
                end);
            end;
        end;
        local v193 = v168(v166._source, v192);
        if _G.__DEV__ and typeof(v193) ~= "function" then
            l_console_0.error("Mutable source subscribe function must return an unsubscribe function.");
        end;
        return v193;
    end, {
        v166, 
        v168
    });
    if (l_getSnapshot_0 ~= v167 or l_getSnapshot_0 == 0 and 1 / l_getSnapshot_0 ~= 1 / v167) and (l_getSnapshot_0 == l_getSnapshot_0 or v167 == v167) or (l_source_0 ~= v166 or l_source_0 == 0 and 1 / l_source_0 ~= 1 / v166) and (l_source_0 == l_source_0 or v166 == v166) or not (l_subscribe_0 == v168 and (l_subscribe_0 ~= 0 or 1 / l_subscribe_0 == 1 / v168) or l_subscribe_0 ~= l_subscribe_0 and v168 ~= v168) then
        local v194 = {
            pending = nil, 
            dispatch = nil, 
            lastRenderedReducer = basicStateReducer, 
            lastRenderedState = l_v173_0
        };
        local l_v68_2 = v68;
        v174 = function(...) --[[ Line: 1060 ]]
            -- upvalues: l_v68_2 (copy), v194 (copy)
            dispatchAction(l_v68_2, v194, ...);
        end;
        v194.dispatch = v174;
        l_v70_1.queue = v194;
        l_v70_1.baseQueue = nil;
        l_v173_0 = readFromUnsubcribedMutableSource(v169, v166, v167);
        l_v70_1.baseState = l_v173_0;
        l_v70_1.memoizedState = l_v70_1.baseState;
    end;
    return l_v173_0;
end;
mountMutableSource = function(v196, v197, v198) --[[ Line: 1074 ]] --[[ Name: mountMutableSource ]]
    -- upvalues: v70 (ref), v68 (ref)
    local v199 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v199;
        v70 = v199;
    else
        v70.next = v199;
        v70 = v199;
    end;
    local l_v70_2 = v70;
    l_v70_2.memoizedState = {
        refs = {
            getSnapshot = v197, 
            setSnapshot = nil
        }, 
        source = v196, 
        subscribe = v198
    };
    return useMutableSource(l_v70_2, v196, v197, v198);
end;
updateMutableSource = function(v201, v202, v203) --[[ Line: 1091 ]] --[[ Name: updateMutableSource ]]
    -- upvalues: v114 (copy)
    local v204 = v114();
    return useMutableSource(v204, v201, v202, v203);
end;
mountState = function(v205) --[[ Line: 1100 ]] --[[ Name: mountState ]]
    -- upvalues: v70 (ref), v68 (ref)
    local v206 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v206;
        v70 = v206;
    else
        v70.next = v206;
        v70 = v206;
    end;
    local l_v70_3 = v70;
    if typeof(v205) == "function" then
        v205 = v205();
    end;
    l_v70_3.baseState = v205;
    l_v70_3.memoizedState = l_v70_3.baseState;
    v206 = {
        pending = nil, 
        dispatch = nil, 
        lastRenderedReducer = nil, 
        lastRenderedState = v205, 
        lastRenderedReducer = basicStateReducer
    };
    l_v70_3.queue = v206;
    local l_v68_3 = v68;
    local function v210(v209, ...) --[[ Line: 1124 ]]
        -- upvalues: l_v68_3 (copy), v206 (copy)
        dispatchAction(l_v68_3, v206, v209, ...);
    end;
    v206.dispatch = v210;
    return l_v70_3.memoizedState, v210;
end;
updateState = function(v211) --[[ Line: 1133 ]] --[[ Name: updateState ]]
    return updateReducer(basicStateReducer, v211);
end;
rerenderState = function(v212) --[[ Line: 1139 ]] --[[ Name: rerenderState ]]
    return rerenderReducer(basicStateReducer, v212);
end;
local function v221(v213, v214, v215, v216) --[[ Line: 1145 ]] --[[ Name: pushEffect ]]
    -- upvalues: v68 (ref)
    local v217 = {
        tag = v213, 
        create = v214, 
        destroy = v215, 
        deps = v216, 
        next = nil
    };
    local l_updateQueue_0 = v68.updateQueue;
    if l_updateQueue_0 == nil then
        l_updateQueue_0 = {
            lastEffect = nil
        };
        v68.updateQueue = l_updateQueue_0;
        v217.next = v217;
        l_updateQueue_0.lastEffect = v217;
        return v217;
    else
        local l_lastEffect_0 = l_updateQueue_0.lastEffect;
        if l_lastEffect_0 == nil then
            l_updateQueue_0.lastEffect = v217;
            v217.next = v217;
            return v217;
        else
            local l_next_3 = l_lastEffect_0.next;
            l_lastEffect_0.next = v217;
            v217.next = l_next_3;
            l_updateQueue_0.lastEffect = v217;
            return v217;
        end;
    end;
end;
mountRef = function(v222) --[[ Line: 1180 ]] --[[ Name: mountRef ]]
    -- upvalues: v70 (ref), v68 (ref), l_createRef_0 (copy)
    local v223 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v223;
        v70 = v223;
    else
        v70.next = v223;
        v70 = v223;
    end;
    local l_v70_4 = v70;
    v223 = l_createRef_0();
    v223.current = v222;
    l_v70_4.memoizedState = v223;
    return v223;
end;
updateRef = function(_) --[[ Line: 1193 ]] --[[ Name: updateRef ]]
    -- upvalues: v114 (copy)
    return v114().memoizedState;
end;
local function v232(v226, v227, v228, v229) --[[ Line: 1198 ]] --[[ Name: mountEffectImpl ]]
    -- upvalues: v70 (ref), v68 (ref), v221 (copy), l_HasEffect_0 (copy)
    local v230 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v230;
        v70 = v230;
    else
        v70.next = v230;
        v70 = v230;
    end;
    local l_v70_5 = v70;
    v68.flags = bit32.bor(v68.flags, v226);
    l_v70_5.memoizedState = v221(bit32.bor(l_HasEffect_0, v227), v228, nil, v229);
end;
updateEffectImpl = function(v233, v234, v235, v236) --[[ Line: 1214 ]] --[[ Name: updateEffectImpl ]]
    -- upvalues: v114 (copy), v69 (ref), v101 (copy), v221 (copy), v68 (ref), l_HasEffect_0 (copy)
    local v237 = v114();
    local v238 = nil;
    if v69 ~= nil then
        local l_memoizedState_5 = v69.memoizedState;
        v238 = l_memoizedState_5.destroy;
        if v236 ~= nil then
            local l_deps_0 = l_memoizedState_5.deps;
            if v101(v236, l_deps_0) then
                v237.memoizedState = v221(v234, v235, v238, v236);
                return;
            end;
        end;
    end;
    v68.flags = bit32.bor(v68.flags, v233);
    v237.memoizedState = v221(bit32.bor(l_HasEffect_0, v234), v235, v238, v236);
end;
local function v251(v241, v242) --[[ Line: 1244 ]] --[[ Name: mountEffect ]]
    -- upvalues: l_warnIfNotCurrentlyActingEffectsInDEV_0 (copy), v68 (ref), l_enableDoubleInvokingEffects_0 (copy), l_MountPassiveDev_0 (copy), l_Passive_0 (copy), l_PassiveStatic_0 (copy), l_Passive_1 (copy), v70 (ref), v221 (copy), l_HasEffect_0 (copy)
    if _G.__DEV__ and (typeof(_G.jest) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__) then
        l_warnIfNotCurrentlyActingEffectsInDEV_0(v68);
    end;
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        local v243 = bit32.bor(l_MountPassiveDev_0, l_Passive_0, l_PassiveStatic_0);
        local l_l_Passive_1_0 = l_Passive_1;
        local v245 = {
            memoizedState = nil, 
            baseState = nil, 
            baseQueue = nil, 
            queue = nil, 
            next = nil
        };
        if v70 == nil then
            v68.memoizedState = v245;
            v70 = v245;
        else
            v70.next = v245;
            v70 = v245;
        end;
        local l_v70_6 = v70;
        v68.flags = bit32.bor(v68.flags, v243);
        l_v70_6.memoizedState = v221(bit32.bor(l_HasEffect_0, l_l_Passive_1_0), v241, nil, v242);
        return;
    else
        local v247 = bit32.bor(l_Passive_0, l_PassiveStatic_0);
        local l_l_Passive_1_1 = l_Passive_1;
        local v249 = {
            memoizedState = nil, 
            baseState = nil, 
            baseQueue = nil, 
            queue = nil, 
            next = nil
        };
        if v70 == nil then
            v68.memoizedState = v249;
            v70 = v249;
        else
            v70.next = v249;
            v70 = v249;
        end;
        local l_v70_7 = v70;
        v68.flags = bit32.bor(v68.flags, v247);
        l_v70_7.memoizedState = v221(bit32.bor(l_HasEffect_0, l_l_Passive_1_1), v241, nil, v242);
        return;
    end;
end;
local function v254(v252, v253) --[[ Line: 1274 ]] --[[ Name: updateEffect ]]
    -- upvalues: l_warnIfNotCurrentlyActingEffectsInDEV_0 (copy), v68 (ref), l_Passive_0 (copy), l_Passive_1 (copy)
    if _G.__DEV__ and (typeof(_G.jest) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__) then
        l_warnIfNotCurrentlyActingEffectsInDEV_0(v68);
    end;
    updateEffectImpl(l_Passive_0, l_Passive_1, v252, v253);
end;
local function v265(v255, v256) --[[ Line: 1294 ]] --[[ Name: mountLayoutEffect ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy), l_Layout_0 (copy), v70 (ref), v68 (ref), v221 (copy), l_HasEffect_0 (copy)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        local v257 = bit32.bor(l_MountLayoutDev_0, l_Update_0);
        local l_l_Layout_0_0 = l_Layout_0;
        local v259 = {
            memoizedState = nil, 
            baseState = nil, 
            baseQueue = nil, 
            queue = nil, 
            next = nil
        };
        if v70 == nil then
            v68.memoizedState = v259;
            v70 = v259;
        else
            v70.next = v259;
            v70 = v259;
        end;
        local l_v70_8 = v70;
        v68.flags = bit32.bor(v68.flags, v257);
        l_v70_8.memoizedState = v221(bit32.bor(l_HasEffect_0, l_l_Layout_0_0), v255, nil, v256);
        return;
    else
        local l_l_Update_0_0 = l_Update_0;
        local l_l_Layout_0_1 = l_Layout_0;
        local v263 = {
            memoizedState = nil, 
            baseState = nil, 
            baseQueue = nil, 
            queue = nil, 
            next = nil
        };
        if v70 == nil then
            v68.memoizedState = v263;
            v70 = v263;
        else
            v70.next = v263;
            v70 = v263;
        end;
        local l_v70_9 = v70;
        v68.flags = bit32.bor(v68.flags, l_l_Update_0_0);
        l_v70_9.memoizedState = v221(bit32.bor(l_HasEffect_0, l_l_Layout_0_1), v255, nil, v256);
        return;
    end;
end;
local function v268(v266, v267) --[[ Line: 1311 ]] --[[ Name: updateLayoutEffect ]]
    -- upvalues: l_Update_0 (copy), l_Layout_0 (copy)
    updateEffectImpl(l_Update_0, l_Layout_0, v266, v267);
end;
imperativeHandleEffect = function(v269, v270) --[[ Line: 1319 ]] --[[ Name: imperativeHandleEffect ]]
    -- upvalues: l_console_0 (copy), l_Array_0 (copy), l_Object_0 (copy)
    if typeof(v270) == "function" then
        v270((v269()));
        return function() --[[ Line: 1328 ]]
            -- upvalues: v270 (copy)
            return v270(nil);
        end;
    elseif v270 ~= nil then
        if _G.__DEV__ and rawget(v270, "current") == nil then
            l_console_0.error("Expected useImperativeHandle() first argument to either be a " .. "ref callback or React.createRef() object. Instead received: %s.", "an object with keys {" .. l_Array_0.join(l_Object_0.keys(v270), ", ") .. "}");
        end;
        v270.current = v269();
        return function() --[[ Line: 1346 ]]
            -- upvalues: v270 (copy)
            v270.current = nil;
        end;
    else
        return nil;
    end;
end;
mountImperativeHandle = function(v271, v272, v273) --[[ Line: 1355 ]] --[[ Name: mountImperativeHandle ]]
    -- upvalues: l_console_0 (copy), l_Array_0 (copy), l_enableDoubleInvokingEffects_0 (copy), v232 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy), l_Layout_0 (copy)
    if _G.__DEV__ and typeof(v272) ~= "function" then
        l_console_0.error("Expected useImperativeHandle() second argument to be a function " .. "that creates a handle. Instead received: %s.", if v272 ~= nil then typeof(v272) else "nil");
    end;
    local v274 = if v273 ~= nil then l_Array_0.concat(v273, {
        v271
    }) else nil;
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        return v232(bit32.bor(l_MountLayoutDev_0, l_Update_0), l_Layout_0, function() --[[ Line: 1378 ]]
            -- upvalues: v272 (copy), v271 (copy)
            return imperativeHandleEffect(v272, v271);
        end, v274);
    else
        return v232(l_Update_0, l_Layout_0, function() --[[ Line: 1387 ]]
            -- upvalues: v272 (copy), v271 (copy)
            return imperativeHandleEffect(v272, v271);
        end, v274);
    end;
end;
updateImperativeHandle = function(v275, v276, v277) --[[ Line: 1395 ]] --[[ Name: updateImperativeHandle ]]
    -- upvalues: l_console_0 (copy), v8 (copy), l_Update_0 (copy), l_Layout_0 (copy)
    if _G.__DEV__ and typeof(v276) ~= "function" then
        local v278 = "nil";
        if v276 then
            v278 = typeof(v276);
        end;
        l_console_0.error("Expected useImperativeHandle() second argument to be a function " .. "that creates a handle. Instead received: %s.", v278);
    end;
    local v279 = nil;
    if v277 ~= nil then
        v279 = v8.List.join(v277, {
            v275
        });
    end;
    return updateEffectImpl(l_Update_0, l_Layout_0, function() --[[ Line: 1424 ]]
        -- upvalues: v276 (copy), v275 (copy)
        return imperativeHandleEffect(v276, v275);
    end, v279);
end;
mountDebugValue = function(_, _) --[[ Line: 1431 ]] --[[ Name: mountDebugValue ]]

end;
local l_mountDebugValue_0 = mountDebugValue;
mountCallback = function(v283, v284) --[[ Line: 1439 ]] --[[ Name: mountCallback ]]
    -- upvalues: v70 (ref), v68 (ref)
    local v285 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v285;
        v70 = v285;
    else
        v70.next = v285;
        v70 = v285;
    end;
    v70.memoizedState = {
        v283, 
        v284
    };
    return v283;
end;
updateCallback = function(v286, v287) --[[ Line: 1447 ]] --[[ Name: updateCallback ]]
    -- upvalues: v114 (copy), v101 (copy)
    local v288 = v114();
    local l_memoizedState_6 = v288.memoizedState;
    if l_memoizedState_6 ~= nil and v287 ~= nil then
        local v290 = l_memoizedState_6[2];
        if v101(v287, v290) then
            return l_memoizedState_6[1];
        end;
    end;
    v288.memoizedState = {
        v286, 
        v287
    };
    return v286;
end;
mountMemo = function(v291, v292) --[[ Line: 1466 ]] --[[ Name: mountMemo ]]
    -- upvalues: v70 (ref), v68 (ref)
    local v293 = {
        memoizedState = nil, 
        baseState = nil, 
        baseQueue = nil, 
        queue = nil, 
        next = nil
    };
    if v70 == nil then
        v68.memoizedState = v293;
        v70 = v293;
    else
        v70.next = v293;
        v70 = v293;
    end;
    local l_v70_10 = v70;
    v293 = {
        v291()
    };
    l_v70_10.memoizedState = {
        v293, 
        v292
    };
    return unpack(v293);
end;
updateMemo = function(v295, v296) --[[ Line: 1481 ]] --[[ Name: updateMemo ]]
    -- upvalues: v114 (copy), v101 (copy)
    local v297 = v114();
    local l_memoizedState_7 = v297.memoizedState;
    if l_memoizedState_7 ~= nil and v296 ~= nil then
        local v299 = l_memoizedState_7[2];
        if v101(v296, v299) then
            return unpack(l_memoizedState_7[1]);
        end;
    end;
    local v300 = {
        v295()
    };
    v297.memoizedState = {
        v300, 
        v296
    };
    return unpack(v300);
end;
v66.getIsUpdatingOpaqueValueInRenderPhaseInDEV = function() --[[ Line: 1634 ]]
    if _G.__DEV__ then
        return false;
    else
        return nil;
    end;
end;
mountOpaqueIdentifier = function() --[[ Line: 1656 ]] --[[ Name: mountOpaqueIdentifier ]]
    -- upvalues: l_console_0 (copy), l_makeClientId_0 (copy), l_getIsHydrating_0 (copy)
    local v301 = nil;
    if _G.__DEV__ then
        l_console_0.warn("!!! unimplemented: warnOnOpaqueIdentifierAccessInDEV");
    else
        v301 = l_makeClientId_0;
    end;
    if l_getIsHydrating_0() then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("UNIMPLEMENTED ERROR: " .. "ReactFiberHooks: getIsHydrating() true");
        error("FIXME (roblox): " .. "ReactFiberHooks: getIsHydrating() true" .. " is unimplemented");
        return nil;
    else
        local v302 = v301();
        mountState(v302);
        return v302;
    end;
end;
updateOpaqueIdentifier = function() --[[ Line: 1723 ]] --[[ Name: updateOpaqueIdentifier ]]
    local v303, _ = updateState(nil);
    return v303;
end;
rerenderOpaqueIdentifier = function() --[[ Line: 1728 ]] --[[ Name: rerenderOpaqueIdentifier ]]
    local v305, _ = rerenderState(nil);
    return v305;
end;
dispatchAction = function(v307, v308, v309, ...) --[[ Line: 1733 ]] --[[ Name: dispatchAction ]]
    -- upvalues: l_console_0 (copy), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), v68 (ref), v71 (ref), v72 (ref), l_NoLanes_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref), l_warnIfNotScopedWithMatchingAct_0 (copy), l_warnIfNotCurrentlyActingUpdatesInDEV_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_enableDebugTracing_0 (copy), l_DebugTracingMode_0 (copy), l_getComponentName_0 (copy), l_logStateUpdateScheduled_0 (copy), l_enableSchedulingProfiler_0 (copy), l_markStateUpdateScheduled_0 (copy)
    if _G.__DEV__ then
        local v310 = select("#", ...);
        local v311 = nil;
        if v310 == 1 then
            v311 = select(1, ...);
        end;
        if typeof(v311) == "function" then
            l_console_0.error("State updates from the useState() and useReducer() Hooks don't support the " .. "second callback argument. To execute a side effect after " .. "rendering, declare it in the component body with useEffect().");
        end;
    end;
    local v312 = l_requestEventTime_0();
    local v313 = l_requestUpdateLane_0(v307);
    local v314 = {
        lane = v313, 
        action = v309, 
        eagerReducer = nil, 
        eagerState = nil, 
        next = nil
    };
    local l_pending_2 = v308.pending;
    if l_pending_2 == nil then
        v314.next = v314;
    else
        v314.next = l_pending_2.next;
        l_pending_2.next = v314;
    end;
    v308.pending = v314;
    local l_alternate_1 = v307.alternate;
    if v307 == v68 or l_alternate_1 ~= nil and l_alternate_1 == v68 then
        v71 = true;
        v72 = true;
    else
        if v307.lanes == l_NoLanes_0 and (l_alternate_1 == nil or l_alternate_1.lanes == l_NoLanes_0) then
            local l_lastRenderedReducer_0 = v308.lastRenderedReducer;
            if l_lastRenderedReducer_0 ~= nil then
                local v318 = nil;
                if _G.__DEV__ then
                    v318 = l_ReactCurrentDispatcher_0.current;
                    l_ReactCurrentDispatcher_0.current = v81;
                end;
                local l_lastRenderedState_0 = v308.lastRenderedState;
                local l_status_1, l_result_1 = pcall(l_lastRenderedReducer_0, l_lastRenderedState_0, v309);
                if l_status_1 then
                    v314.eagerReducer = l_lastRenderedReducer_0;
                    v314.eagerState = l_result_1;
                end;
                if _G.__DEV__ then
                    l_ReactCurrentDispatcher_0.current = v318;
                end;
                if l_result_1 == l_lastRenderedState_0 and (l_result_1 ~= 0 or 1 / l_result_1 == 1 / l_lastRenderedState_0) or l_result_1 ~= l_result_1 and l_lastRenderedState_0 ~= l_lastRenderedState_0 then
                    return;
                elseif not l_status_1 then

                end;
            end;
        end;
        if _G.__DEV__ and (typeof(_G.jest) ~= "nil" or _G.__TESTEZ_RUNNING_TEST__) then
            l_warnIfNotScopedWithMatchingAct_0(v307);
            l_warnIfNotCurrentlyActingUpdatesInDEV_0(v307);
        end;
        l_scheduleUpdateOnFiber_0(v307, v313, v312);
    end;
    if _G.__DEV__ and l_enableDebugTracing_0 and bit32.band(v307.mode, l_DebugTracingMode_0) ~= 0 then
        local v322 = l_getComponentName_0(v307.type) or "Unknown";
        l_logStateUpdateScheduled_0(v322, v313, v309);
    end;
    if l_enableSchedulingProfiler_0 then
        l_markStateUpdateScheduled_0(v307, v313);
    end;
end;
local v323 = {
    readContext = l_readContext_0, 
    useCallback = v95, 
    useContext = v95, 
    useEffect = v95, 
    useImperativeHandle = v95, 
    useLayoutEffect = v95, 
    useMemo = v95, 
    useReducer = v95, 
    useRef = v95, 
    useState = v95, 
    useDebugValue = v95, 
    useMutableSource = v95, 
    useOpaqueIdentifier = v95, 
    unstable_isNewReconciler = l_enableNewReconciler_0
};
v66.ContextOnlyDispatcher = v323;
local v324 = {
    readContext = l_readContext_0, 
    useCallback = mountCallback, 
    useContext = l_readContext_0, 
    useEffect = v251, 
    useImperativeHandle = mountImperativeHandle, 
    useLayoutEffect = v265, 
    useMemo = mountMemo, 
    useReducer = mountReducer, 
    useRef = mountRef, 
    useState = mountState, 
    useDebugValue = mountDebugValue, 
    useMutableSource = mountMutableSource, 
    useOpaqueIdentifier = mountOpaqueIdentifier, 
    unstable_isNewReconciler = l_enableNewReconciler_0
};
local v325 = {
    readContext = l_readContext_0, 
    useCallback = updateCallback, 
    useContext = l_readContext_0, 
    useEffect = v254, 
    useImperativeHandle = updateImperativeHandle, 
    useLayoutEffect = v268, 
    useMemo = updateMemo, 
    useReducer = updateReducer, 
    useRef = updateRef, 
    useState = updateState, 
    useDebugValue = l_mountDebugValue_0, 
    useMutableSource = updateMutableSource, 
    useOpaqueIdentifier = updateOpaqueIdentifier, 
    unstable_isNewReconciler = l_enableNewReconciler_0
};
local v326 = {
    readContext = l_readContext_0, 
    useCallback = updateCallback, 
    useContext = l_readContext_0, 
    useEffect = v254, 
    useImperativeHandle = updateImperativeHandle, 
    useLayoutEffect = v268, 
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
    local function _() --[[ Line: 1949 ]]
        -- upvalues: l_console_0 (copy)
        l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
    end;
    local function _() --[[ Line: 1958 ]]
        -- upvalues: l_console_0 (copy)
        l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
    end;
    v76 = {
        readContext = function(v329, v330) --[[ Line: 1968 ]] --[[ Name: readContext ]]
            -- upvalues: l_readContext_0 (copy)
            return l_readContext_0(v329, v330);
        end, 
        useCallback = function(v331, v332) --[[ Line: 1974 ]] --[[ Name: useCallback ]]
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
            if _G.__DEV__ and v332 ~= nil and not l_Array_0.isArray(v332) then
                l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (typeof(v332)));
            end;
            return mountCallback(v331, v332);
        end, 
        useContext = function(v334, v335) --[[ Line: 1980 ]] --[[ Name: useContext ]]
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
            return l_readContext_0(v334, v335);
        end, 
        useEffect = function(v337, v338) --[[ Line: 1988 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), v74 (ref), l_Array_0 (copy), l_console_0 (copy), v251 (copy)
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
            if _G.__DEV__ and v338 ~= nil and not l_Array_0.isArray(v338) then
                l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (typeof(v338)));
            end;
            return v251(v337, v338);
        end, 
        useImperativeHandle = function(v340, v341, v342) --[[ Line: 1998 ]] --[[ Name: useImperativeHandle ]]
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
            if _G.__DEV__ and v342 ~= nil and not l_Array_0.isArray(v342) then
                l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (typeof(v342)));
            end;
            return mountImperativeHandle(v340, v341, v342);
        end, 
        useLayoutEffect = function(v344, v345) --[[ Line: 2008 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), v74 (ref), l_Array_0 (copy), l_console_0 (copy), v265 (copy)
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
            if _G.__DEV__ and v345 ~= nil and not l_Array_0.isArray(v345) then
                l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (typeof(v345)));
            end;
            return v265(v344, v345);
        end, 
        useMemo = function(v347, v348) --[[ Line: 2019 ]]
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
            if _G.__DEV__ and v348 ~= nil and not l_Array_0.isArray(v348) then
                l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (typeof(v348)));
            end;
            local l_current_1 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v351 = {
                pcall(mountMemo, v347, v348)
            };
            l_ReactCurrentDispatcher_0.current = l_current_1;
            if not v351[1] then
                error(v351[2]);
            end;
            return unpack(v351, 2);
        end, 
        useReducer = function(v352, v353, v354) --[[ Line: 2037 ]] --[[ Name: useReducer ]]
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
            local v357, v358, v359 = pcall(mountReducer, v352, v353, v354);
            l_ReactCurrentDispatcher_0.current = l_current_2;
            if not v357 then
                error(v358);
            end;
            return v358, v359;
        end, 
        useRef = function(v360) --[[ Line: 2056 ]] --[[ Name: useRef ]]
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
            return mountRef(v360);
        end, 
        useState = function(v362) --[[ Line: 2061 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), v74 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useState";
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
            local l_current_3 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v365, v366, v367 = pcall(mountState, v362);
            l_ReactCurrentDispatcher_0.current = l_current_3;
            if not v365 then
                error(v366);
            end;
            return v366, v367;
        end, 
        useDebugValue = function(v368, v369) --[[ Line: 2077 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref), v74 (ref)
            v73 = "useDebugValue";
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
            return mountDebugValue(v368, v369);
        end, 
        useMutableSource = function(v371, v372, v373) --[[ Line: 2092 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref), v74 (ref)
            v73 = "useMutableSource";
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
            return mountMutableSource(v371, v372, v373);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2101 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref), v74 (ref)
            v73 = "useOpaqueIdentifier";
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
            return mountOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v77 = {
        readContext = function(v376, v377) --[[ Line: 2111 ]] --[[ Name: readContext ]]
            -- upvalues: l_readContext_0 (copy)
            return l_readContext_0(v376, v377);
        end, 
        useCallback = function(v378, v379) --[[ Line: 2117 ]] --[[ Name: useCallback ]]
            -- upvalues: v73 (ref), l_Array_0 (copy), l_console_0 (copy)
            v73 = "useCallback";
            updateHookTypesDev();
            if _G.__DEV__ and v379 ~= nil and not l_Array_0.isArray(v379) then
                l_console_0.error("%s received a final argument that is not an array (instead, received `%s`). When " .. "specified, the final argument must be an array.", v73, (typeof(v379)));
            end;
            return mountCallback(v378, v379);
        end, 
        useContext = function(v380, v381) --[[ Line: 2123 ]] --[[ Name: useContext ]]
            -- upvalues: v73 (ref), l_readContext_0 (copy)
            v73 = "useContext";
            updateHookTypesDev();
            return l_readContext_0(v380, v381);
        end, 
        useEffect = function(v382, v383) --[[ Line: 2131 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), v251 (copy)
            v73 = "useEffect";
            updateHookTypesDev();
            return v251(v382, v383);
        end, 
        useImperativeHandle = function(v384, v385, v386) --[[ Line: 2140 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v73 (ref)
            v73 = "useImperativeHandle";
            updateHookTypesDev();
            return mountImperativeHandle(v384, v385, v386);
        end, 
        useLayoutEffect = function(v387, v388) --[[ Line: 2149 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), v265 (copy)
            v73 = "useLayoutEffect";
            updateHookTypesDev();
            return v265(v387, v388);
        end, 
        useMemo = function(v389, v390) --[[ Line: 2159 ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useMemo";
            updateHookTypesDev();
            local l_current_4 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v392 = {
                pcall(mountMemo, v389, v390)
            };
            l_ReactCurrentDispatcher_0.current = l_current_4;
            if not v392[1] then
                error(v392[2]);
            end;
            return unpack(v392, 2);
        end, 
        useReducer = function(v393, v394, v395) --[[ Line: 2175 ]] --[[ Name: useReducer ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useReducer";
            updateHookTypesDev();
            local l_current_5 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v397, v398, v399 = pcall(mountReducer, v393, v394, v395);
            l_ReactCurrentDispatcher_0.current = l_current_5;
            if not v397 then
                error(v398);
            end;
            return v398, v399;
        end, 
        useRef = function(v400) --[[ Line: 2194 ]] --[[ Name: useRef ]]
            -- upvalues: v73 (ref)
            v73 = "useRef";
            updateHookTypesDev();
            return mountRef(v400);
        end, 
        useState = function(v401) --[[ Line: 2199 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useState";
            updateHookTypesDev();
            local l_current_6 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v403, v404, v405 = pcall(mountState, v401);
            l_ReactCurrentDispatcher_0.current = l_current_6;
            if not v403 then
                error(v404);
            end;
            return v404, v405;
        end, 
        useDebugValue = function(v406, v407) --[[ Line: 2215 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref)
            v73 = "useDebugValue";
            updateHookTypesDev();
            return mountDebugValue(v406, v407);
        end, 
        useMutableSource = function(v408, v409, v410) --[[ Line: 2230 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref)
            v73 = "useMutableSource";
            updateHookTypesDev();
            return mountMutableSource(v408, v409, v410);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2239 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref)
            v73 = "useOpaqueIdentifier";
            updateHookTypesDev();
            return mountOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v78 = {
        readContext = function(v411, v412) --[[ Line: 2249 ]] --[[ Name: readContext ]]
            -- upvalues: l_readContext_0 (copy)
            return l_readContext_0(v411, v412);
        end, 
        useCallback = function(v413, v414) --[[ Line: 2255 ]] --[[ Name: useCallback ]]
            -- upvalues: v73 (ref)
            v73 = "useCallback";
            updateHookTypesDev();
            return updateCallback(v413, v414);
        end, 
        useContext = function(v415, v416) --[[ Line: 2260 ]] --[[ Name: useContext ]]
            -- upvalues: v73 (ref), l_readContext_0 (copy)
            v73 = "useContext";
            updateHookTypesDev();
            return l_readContext_0(v415, v416);
        end, 
        useEffect = function(v417, v418) --[[ Line: 2268 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), v254 (copy)
            v73 = "useEffect";
            updateHookTypesDev();
            return v254(v417, v418);
        end, 
        useImperativeHandle = function(v419, v420, v421) --[[ Line: 2277 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v73 (ref)
            v73 = "useImperativeHandle";
            updateHookTypesDev();
            return updateImperativeHandle(v419, v420, v421);
        end, 
        useLayoutEffect = function(v422, v423) --[[ Line: 2286 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), v268 (copy)
            v73 = "useLayoutEffect";
            updateHookTypesDev();
            return v268(v422, v423);
        end, 
        useMemo = function(v424, v425) --[[ Line: 2296 ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useMemo";
            updateHookTypesDev();
            local l_current_7 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v427 = {
                pcall(updateMemo, v424, v425)
            };
            l_ReactCurrentDispatcher_0.current = l_current_7;
            if not v427[1] then
                error(v427[2]);
            end;
            return unpack(v427, 2);
        end, 
        useReducer = function(v428, v429, v430) --[[ Line: 2312 ]] --[[ Name: useReducer ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useReducer";
            updateHookTypesDev();
            local l_current_8 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v432, v433, v434 = pcall(updateReducer, v428, v429, v430);
            l_ReactCurrentDispatcher_0.current = l_current_8;
            if not v432 then
                error(v433);
            end;
            return v433, v434;
        end, 
        useRef = function(v435) --[[ Line: 2331 ]] --[[ Name: useRef ]]
            -- upvalues: v73 (ref)
            v73 = "useRef";
            updateHookTypesDev();
            return updateRef(v435);
        end, 
        useState = function(v436) --[[ Line: 2336 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useState";
            updateHookTypesDev();
            local l_current_9 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v438, v439, v440 = pcall(updateState, v436);
            l_ReactCurrentDispatcher_0.current = l_current_9;
            if not v438 then
                error(v439);
            end;
            return v439, v440;
        end, 
        useDebugValue = function(v441, v442) --[[ Line: 2352 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref), l_mountDebugValue_0 (copy)
            v73 = "useDebugValue";
            updateHookTypesDev();
            return l_mountDebugValue_0(v441, v442);
        end, 
        useMutableSource = function(v443, v444, v445) --[[ Line: 2367 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref)
            v73 = "useMutableSource";
            updateHookTypesDev();
            return updateMutableSource(v443, v444, v445);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2376 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref)
            v73 = "useOpaqueIdentifier";
            updateHookTypesDev();
            return updateOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v79 = {
        readContext = function(v446, v447) --[[ Line: 2386 ]] --[[ Name: readContext ]]
            -- upvalues: l_readContext_0 (copy)
            return l_readContext_0(v446, v447);
        end, 
        useCallback = function(v448, v449) --[[ Line: 2392 ]] --[[ Name: useCallback ]]
            -- upvalues: v73 (ref)
            v73 = "useCallback";
            updateHookTypesDev();
            return mountCallback(v448, v449);
        end, 
        useContext = function(v450, v451) --[[ Line: 2397 ]] --[[ Name: useContext ]]
            -- upvalues: v73 (ref), l_readContext_0 (copy)
            v73 = "useContext";
            updateHookTypesDev();
            return l_readContext_0(v450, v451);
        end, 
        useEffect = function(v452, v453) --[[ Line: 2405 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), v254 (copy)
            v73 = "useEffect";
            updateHookTypesDev();
            return v254(v452, v453);
        end, 
        useImperativeHandle = function(v454, v455, v456) --[[ Line: 2414 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v73 (ref)
            v73 = "useImperativeHandle";
            updateHookTypesDev();
            return updateImperativeHandle(v454, v455, v456);
        end, 
        useLayoutEffect = function(v457, v458) --[[ Line: 2423 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), v268 (copy)
            v73 = "useLayoutEffect";
            updateHookTypesDev();
            return v268(v457, v458);
        end, 
        useMemo = function(v459, v460) --[[ Line: 2434 ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v82 (ref)
            v73 = "useMemo";
            updateHookTypesDev();
            local l_current_10 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v462 = {
                pcall(updateMemo, v459, v460)
            };
            l_ReactCurrentDispatcher_0.current = l_current_10;
            if not v462[1] then
                error(v462[2]);
            end;
            return unpack(v462, 2);
        end, 
        useReducer = function(v463, v464, v465) --[[ Line: 2450 ]] --[[ Name: useReducer ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v82 (ref)
            v73 = "useReducer";
            updateHookTypesDev();
            local l_current_11 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v467, v468, v469 = pcall(rerenderReducer, v463, v464, v465);
            l_ReactCurrentDispatcher_0.current = l_current_11;
            if not v467 then
                error(v468);
            end;
            return v468, v469;
        end, 
        useRef = function(v470) --[[ Line: 2469 ]] --[[ Name: useRef ]]
            -- upvalues: v73 (ref)
            v73 = "useRef";
            updateHookTypesDev();
            return updateRef(v470);
        end, 
        useState = function(v471) --[[ Line: 2474 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), l_ReactCurrentDispatcher_0 (copy), v82 (ref)
            v73 = "useState";
            updateHookTypesDev();
            local l_current_12 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v82;
            local v473, v474, v475 = pcall(rerenderState, v471);
            l_ReactCurrentDispatcher_0.current = l_current_12;
            if not v473 then
                error(v474);
            end;
            return v474, v475;
        end, 
        useDebugValue = function(v476, v477) --[[ Line: 2490 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref), l_mountDebugValue_0 (copy)
            v73 = "useDebugValue";
            updateHookTypesDev();
            return l_mountDebugValue_0(v476, v477);
        end, 
        useMutableSource = function(v478, v479, v480) --[[ Line: 2505 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref)
            v73 = "useMutableSource";
            updateHookTypesDev();
            return updateMutableSource(v478, v479, v480);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2514 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref)
            v73 = "useOpaqueIdentifier";
            updateHookTypesDev();
            return rerenderOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v80 = {
        readContext = function(v481, v482) --[[ Line: 2524 ]] --[[ Name: readContext ]]
            -- upvalues: l_console_0 (copy), l_readContext_0 (copy)
            l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
            return l_readContext_0(v481, v482);
        end, 
        useCallback = function(v483, v484) --[[ Line: 2531 ]] --[[ Name: useCallback ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref)
            v73 = "useCallback";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
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
            return mountCallback(v483, v484);
        end, 
        useContext = function(v486, v487) --[[ Line: 2537 ]] --[[ Name: useContext ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref), l_readContext_0 (copy)
            v73 = "useContext";
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
            return l_readContext_0(v486, v487);
        end, 
        useEffect = function(v489, v490) --[[ Line: 2546 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref), v251 (copy)
            v73 = "useEffect";
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
            return v251(v489, v490);
        end, 
        useImperativeHandle = function(v492, v493, v494) --[[ Line: 2556 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref)
            v73 = "useImperativeHandle";
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
            return mountImperativeHandle(v492, v493, v494);
        end, 
        useLayoutEffect = function(v496, v497) --[[ Line: 2566 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref), v265 (copy)
            v73 = "useLayoutEffect";
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
            return v265(v496, v497);
        end, 
        useMemo = function(v499, v500) --[[ Line: 2577 ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useMemo";
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
            local l_current_13 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v503 = {
                pcall(mountMemo, v499, v500)
            };
            l_ReactCurrentDispatcher_0.current = l_current_13;
            if not v503[1] then
                error(v503[2]);
            end;
            return unpack(v503, 2);
        end, 
        useReducer = function(v504, v505, v506) --[[ Line: 2594 ]] --[[ Name: useReducer ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useReducer";
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
            local l_current_14 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v509, v510, v511 = pcall(mountReducer, v504, v505, v506);
            l_ReactCurrentDispatcher_0.current = l_current_14;
            if not v509 then
                error(v510);
            end;
            return v510, v511;
        end, 
        useRef = function(v512) --[[ Line: 2614 ]] --[[ Name: useRef ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref)
            v73 = "useRef";
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
            return mountRef(v512);
        end, 
        useState = function(v514) --[[ Line: 2620 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref), l_ReactCurrentDispatcher_0 (copy), v80 (ref)
            v73 = "useState";
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
            local l_current_15 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v80;
            local v517, v518, v519 = pcall(mountState, v514);
            l_ReactCurrentDispatcher_0.current = l_current_15;
            if not v517 then
                error(v518);
            end;
            return v518, v519;
        end, 
        useDebugValue = function(v520, v521) --[[ Line: 2637 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref)
            v73 = "useDebugValue";
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
            return mountDebugValue(v520, v521);
        end, 
        useMutableSource = function(v523, v524, v525) --[[ Line: 2655 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref)
            v73 = "useMutableSource";
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
            return mountMutableSource(v523, v524, v525);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2665 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v74 (ref)
            v73 = "useOpaqueIdentifier";
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
            return mountOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v81 = {
        readContext = function(v528, v529) --[[ Line: 2676 ]] --[[ Name: readContext ]]
            -- upvalues: l_console_0 (copy), l_readContext_0 (copy)
            l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
            return l_readContext_0(v528, v529);
        end, 
        useCallback = function(v530, v531) --[[ Line: 2683 ]] --[[ Name: useCallback ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useCallback";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return mountCallback(v530, v531);
        end, 
        useContext = function(v532, v533) --[[ Line: 2689 ]] --[[ Name: useContext ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_readContext_0 (copy)
            v73 = "useContext";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_readContext_0(v532, v533);
        end, 
        useEffect = function(v534, v535) --[[ Line: 2698 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v254 (copy)
            v73 = "useEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v254(v534, v535);
        end, 
        useImperativeHandle = function(v536, v537, v538) --[[ Line: 2708 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useImperativeHandle";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateImperativeHandle(v536, v537, v538);
        end, 
        useLayoutEffect = function(v539, v540) --[[ Line: 2718 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v268 (copy)
            v73 = "useLayoutEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v268(v539, v540);
        end, 
        useMemo = function(v541, v542) --[[ Line: 2729 ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useMemo";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_16 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v544 = {
                pcall(updateMemo, v541, v542)
            };
            l_ReactCurrentDispatcher_0.current = l_current_16;
            if not v544[1] then
                error(v544[2]);
            end;
            return unpack(v544, 2);
        end, 
        useReducer = function(v545, v546, v547) --[[ Line: 2746 ]] --[[ Name: useReducer ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useReducer";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_17 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v549, v550, v551 = pcall(updateReducer, v545, v546, v547);
            l_ReactCurrentDispatcher_0.current = l_current_17;
            if not v549 then
                error(v550);
            end;
            return v550, v551;
        end, 
        useRef = function(v552) --[[ Line: 2767 ]] --[[ Name: useRef ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useRef";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateRef(v552);
        end, 
        useState = function(v553) --[[ Line: 2773 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useState";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_18 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v555, v556, v557 = pcall(updateState, v553);
            l_ReactCurrentDispatcher_0.current = l_current_18;
            if not v555 then
                error(v556);
            end;
            return v556, v557;
        end, 
        useDebugValue = function(v558, v559) --[[ Line: 2790 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_mountDebugValue_0 (copy)
            v73 = "useDebugValue";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_mountDebugValue_0(v558, v559);
        end, 
        useMutableSource = function(v560, v561, v562) --[[ Line: 2808 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useMutableSource";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateMutableSource(v560, v561, v562);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2818 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useOpaqueIdentifier";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
    v82 = {
        readContext = function(v563, v564) --[[ Line: 2829 ]] --[[ Name: readContext ]]
            -- upvalues: l_console_0 (copy), l_readContext_0 (copy)
            l_console_0.error("Context can only be read while React is rendering. " .. "In classes, you can read it in the render method or getDerivedStateFromProps. " .. "In function components, you can read it directly in the function body, but not " .. "inside Hooks like useReducer() or useMemo().");
            return l_readContext_0(v563, v564);
        end, 
        useCallback = function(v565, v566) --[[ Line: 2836 ]] --[[ Name: useCallback ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useCallback";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateCallback(v565, v566);
        end, 
        useContext = function(v567, v568) --[[ Line: 2842 ]] --[[ Name: useContext ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_readContext_0 (copy)
            v73 = "useContext";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_readContext_0(v567, v568);
        end, 
        useEffect = function(v569, v570) --[[ Line: 2851 ]] --[[ Name: useEffect ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v254 (copy)
            v73 = "useEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v254(v569, v570);
        end, 
        useImperativeHandle = function(v571, v572, v573) --[[ Line: 2861 ]] --[[ Name: useImperativeHandle ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useImperativeHandle";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateImperativeHandle(v571, v572, v573);
        end, 
        useLayoutEffect = function(v574, v575) --[[ Line: 2871 ]] --[[ Name: useLayoutEffect ]]
            -- upvalues: v73 (ref), l_console_0 (copy), v268 (copy)
            v73 = "useLayoutEffect";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return v268(v574, v575);
        end, 
        useMemo = function(v576, v577) --[[ Line: 2882 ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useMemo";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_19 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v579 = {
                pcall(updateMemo, v576, v577)
            };
            l_ReactCurrentDispatcher_0.current = l_current_19;
            if not v579[1] then
                error(v579[2]);
            end;
            return unpack(v579, 2);
        end, 
        useReducer = function(v580, v581, v582) --[[ Line: 2899 ]] --[[ Name: useReducer ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useReducer";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_20 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v584, v585, v586 = pcall(rerenderReducer, v580, v581, v582);
            l_ReactCurrentDispatcher_0.current = l_current_20;
            if not v584 then
                error(v585);
            end;
            return v585, v586;
        end, 
        useRef = function(v587) --[[ Line: 2919 ]] --[[ Name: useRef ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useRef";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateRef(v587);
        end, 
        useState = function(v588) --[[ Line: 2925 ]] --[[ Name: useState ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_ReactCurrentDispatcher_0 (copy), v81 (ref)
            v73 = "useState";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            local l_current_21 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = v81;
            local v590, v591, v592 = pcall(rerenderState, v588);
            l_ReactCurrentDispatcher_0.current = l_current_21;
            if not v590 then
                error(v591);
            end;
            return v591, v592;
        end, 
        useDebugValue = function(v593, v594) --[[ Line: 2942 ]] --[[ Name: useDebugValue ]]
            -- upvalues: v73 (ref), l_console_0 (copy), l_mountDebugValue_0 (copy)
            v73 = "useDebugValue";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return l_mountDebugValue_0(v593, v594);
        end, 
        useMutableSource = function(v595, v596, v597) --[[ Line: 2960 ]] --[[ Name: useMutableSource ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useMutableSource";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return updateMutableSource(v595, v596, v597);
        end, 
        useOpaqueIdentifier = function() --[[ Line: 2970 ]] --[[ Name: useOpaqueIdentifier ]]
            -- upvalues: v73 (ref), l_console_0 (copy)
            v73 = "useOpaqueIdentifier";
            l_console_0.error("Do not call Hooks inside useEffect(...), useMemo(...), or other built-in Hooks. " .. "You can only call Hooks at the top level of your React function. " .. "For more information, see " .. "https://reactjs.org/link/rules-of-hooks");
            updateHookTypesDev();
            return rerenderOpaqueIdentifier();
        end, 
        unstable_isNewReconciler = l_enableNewReconciler_0
    };
end;
v66.renderWithHooks = function(v598, v599, v600, v601, v602, v603) --[[ Line: 2981 ]] --[[ Name: renderWithHooks ]]
    -- upvalues: l_l_NoLanes_0_0 (ref), v68 (ref), v74 (ref), v75 (ref), l_NoLanes_0 (copy), l_ReactCurrentDispatcher_0 (copy), v78 (ref), v77 (ref), v76 (ref), v324 (copy), v325 (copy), v72 (ref), l_Error_0 (copy), v69 (ref), v70 (ref), v79 (ref), v326 (copy), v323 (copy), v73 (ref), v71 (ref)
    l_l_NoLanes_0_0 = v603;
    v68 = v599;
    if _G.__DEV__ then
        v74 = if v598 ~= nil then v598._debugHookTypes else nil;
        v75 = 0;
    end;
    v599.memoizedState = nil;
    v599.updateQueue = nil;
    v599.lanes = l_NoLanes_0;
    if _G.__DEV__ then
        if v598 ~= nil and v598.memoizedState ~= nil then
            l_ReactCurrentDispatcher_0.current = v78;
        elseif v74 ~= nil then
            l_ReactCurrentDispatcher_0.current = v77;
        else
            l_ReactCurrentDispatcher_0.current = v76;
        end;
    else
        l_ReactCurrentDispatcher_0.current = (not (v598 ~= nil) or v598.memoizedState == nil) and v324 or v325;
    end;
    local v604 = v600(v601, v602);
    if v72 then
        local v605 = 0;
        repeat
            v72 = false;
            if v605 >= 25 then
                error(l_Error_0.new("Too many re-renders. React limits the number of renders to prevent " .. "an infinite loop."));
            end;
            v605 = v605 + 1;
            v69 = nil;
            v70 = nil;
            v599.updateQueue = nil;
            if _G.__DEV__ then
                v75 = 0;
            end;
            l_ReactCurrentDispatcher_0.current = _G.__DEV__ and v79 or v326;
            v604 = v600(v601, v602);
        until not v72;
    end;
    l_ReactCurrentDispatcher_0.current = v323;
    if _G.__DEV__ then
        v599._debugHookTypes = v74;
    end;
    local v606 = false;
    if v69 ~= nil then
        v606 = v69.next ~= nil;
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
    if v606 then
        error(l_Error_0.new("Rendered fewer hooks than expected. This may be caused by an accidental " .. "early return statement."));
    end;
    return v604;
end;
return v66;