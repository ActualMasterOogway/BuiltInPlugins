local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Shared);
local v3 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Object_0 = v3.Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v8 = require(script.Parent.ReactRootTags);
local v9 = require(script.Parent.ReactFiberFlags);
local _ = require(script.Parent.ReactFiberHostConfig);
local v11 = require(script.Parent.ReactWorkTags);
local l_FundamentalComponent_0 = v11.FundamentalComponent;
local _ = require(l_Parent_0.Shared);
local v14 = require(script.Parent.ReactFiberLane);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v16 = require(script.Parent.ReactFiberTreeReflection);
local l_findCurrentHostFiber_0 = v16.findCurrentHostFiber;
local l_findCurrentHostFiberWithNoPortals_0 = v16.findCurrentHostFiberWithNoPortals;
local l_get_0 = require(l_Parent_0.Shared).ReactInstanceMap.get;
local l_HostComponent_0 = v11.HostComponent;
local l_ClassComponent_0 = v11.ClassComponent;
local l_HostRoot_0 = v11.HostRoot;
local l_SuspenseComponent_0 = v11.SuspenseComponent;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local l_enableSchedulingProfiler_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableSchedulingProfiler;
local l_ReactSharedInternals_0 = require(l_Parent_0.Shared).ReactSharedInternals;
local l_getPublicInstance_0 = require(script.Parent.ReactFiberHostConfig).getPublicInstance;
local v30 = require(script.Parent["ReactFiberContext.new"]);
local l_findCurrentUnmaskedContext_0 = v30.findCurrentUnmaskedContext;
local l_processChildContext_0 = v30.processChildContext;
local l_emptyContextObject_0 = v30.emptyContextObject;
local l_isContextProvider_0 = v30.isContextProvider;
local l_createFiberRoot_0 = require(script.Parent["ReactFiberRoot.new"]).createFiberRoot;
local v36 = require(script.Parent["ReactFiberDevToolsHook.new"]);
local l_injectInternals_0 = v36.injectInternals;
local l_onScheduleRoot_0 = v36.onScheduleRoot;
local v39 = require(script.Parent["ReactFiberWorkLoop.new"]);
local l_requestEventTime_0 = v39.requestEventTime;
local l_requestUpdateLane_0 = v39.requestUpdateLane;
local l_scheduleUpdateOnFiber_0 = v39.scheduleUpdateOnFiber;
local l_flushRoot_0 = v39.flushRoot;
local l_batchedEventUpdates_0 = v39.batchedEventUpdates;
local l_batchedUpdates_0 = v39.batchedUpdates;
local l_unbatchedUpdates_0 = v39.unbatchedUpdates;
local l_flushSync_0 = v39.flushSync;
local l_flushControlled_0 = v39.flushControlled;
local l_deferredUpdates_0 = v39.deferredUpdates;
local l_discreteUpdates_0 = v39.discreteUpdates;
local l_flushDiscreteUpdates_0 = v39.flushDiscreteUpdates;
local l_flushPassiveEffects_0 = v39.flushPassiveEffects;
local l_warnIfNotScopedWithMatchingAct_0 = v39.warnIfNotScopedWithMatchingAct;
local l_warnIfUnmockedScheduler_0 = v39.warnIfUnmockedScheduler;
local l_IsThisRendererActing_0 = v39.IsThisRendererActing;
local l_act_0 = v39.act;
local v57 = require(script.Parent["ReactUpdateQueue.new"]);
local l_createUpdate_0 = v57.createUpdate;
local l_enqueueUpdate_0 = v57.enqueueUpdate;
local v60 = require(script.Parent.ReactCurrentFiber);
local l_isRendering_0 = v60.isRendering;
local l_resetCurrentFiber_0 = v60.resetCurrentFiber;
local l_setCurrentFiber_0 = v60.setCurrentFiber;
local v64 = require(script.Parent.ReactTypeOfMode);
local l_StrictMode_0 = v64.StrictMode;
local l_SyncLane_0 = v14.SyncLane;
local l_InputDiscreteHydrationLane_0 = v14.InputDiscreteHydrationLane;
local l_SelectiveHydrationLane_0 = v14.SelectiveHydrationLane;
local l_NoTimestamp_0 = v14.NoTimestamp;
local l_getHighestPriorityPendingLanes_0 = v14.getHighestPriorityPendingLanes;
local l_higherPriorityLane_0 = v14.higherPriorityLane;
local l_getCurrentUpdateLanePriority_0 = v14.getCurrentUpdateLanePriority;
local l_setCurrentUpdateLanePriority_0 = v14.setCurrentUpdateLanePriority;
local l_markRenderScheduled_0 = require(script.Parent.SchedulingProfiler).markRenderScheduled;
local v75 = {
    ReactRootTags = v8, 
    ReactWorkTags = v11, 
    ReactTypeOfMode = v64, 
    ReactFiberFlags = v9, 
    getNearestMountedFiber = v16.getNearestMountedFiber, 
    findCurrentFiberUsingSlowPath = v16.findCurrentFiberUsingSlowPath, 
    createPortal = require(script.Parent.ReactPortal).createPortal
};
local v76 = nil;
local v77 = nil;
if l___DEV___0 then
    v76 = false;
    v77 = {};
end;
local function _(v78) --[[ Line: 178 ]] --[[ Name: getContextForSubtree ]]
    -- upvalues: l_emptyContextObject_0 (copy), l_get_0 (copy), l_findCurrentUnmaskedContext_0 (copy), l_ClassComponent_0 (copy), l_isContextProvider_0 (copy), l_processChildContext_0 (copy)
    if not v78 then
        return l_emptyContextObject_0;
    else
        local v79 = l_get_0(v78);
        local v80 = l_findCurrentUnmaskedContext_0(v79);
        if v79.tag == l_ClassComponent_0 then
            local l_type_0 = v79.type;
            if l_isContextProvider_0(l_type_0) then
                return l_processChildContext_0(v79, l_type_0, v80);
            end;
        end;
        return v80;
    end;
end;
local function v86(v83) --[[ Line: 196 ]] --[[ Name: findHostInstance ]]
    -- upvalues: l_get_0 (copy), l_invariant_0 (copy), l_Object_0 (copy), l_findCurrentHostFiber_0 (copy)
    local v84 = l_get_0(v83);
    if v84 == nil then
        if typeof(v83.render) == "function" then
            l_invariant_0(false, "Unable to find node on an unmounted component.");
        else
            l_invariant_0(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(l_Object_0.keys(v83)));
        end;
    end;
    local v85 = l_findCurrentHostFiber_0(v84);
    if v85 == nil then
        return nil;
    else
        return v85.stateNode;
    end;
end;
local function v95(v87, v88) --[[ Line: 217 ]] --[[ Name: findHostInstanceWithWarning ]]
    -- upvalues: l___DEV___0 (copy), l_get_0 (copy), l_invariant_0 (copy), l_Object_0 (copy), l_findCurrentHostFiber_0 (copy), l_StrictMode_0 (copy), l_getComponentName_0 (copy), v77 (ref), v60 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_describeError_0 (copy), l_resetCurrentFiber_0 (copy), v86 (copy)
    if l___DEV___0 then
        local v89 = l_get_0(v87);
        if v89 == nil then
            if typeof(v87.render) == "function" then
                l_invariant_0(false, "Unable to find node on an unmounted component.");
            else
                l_invariant_0(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(l_Object_0.keys(v87)));
            end;
        end;
        local v90 = l_findCurrentHostFiber_0(v89);
        if v90 == nil then
            return nil;
        else
            if bit32.band(v90.mode, l_StrictMode_0) ~= 0 then
                local v91 = l_getComponentName_0(v89.type) or "Component";
                if not v77[v91] then
                    v77[v91] = true;
                    local l_current_0 = v60.current;
                    local v93, v94 = xpcall(function() --[[ Line: 245 ]]
                        -- upvalues: l_setCurrentFiber_0 (ref), v90 (copy), v89 (copy), l_StrictMode_0 (ref), l_console_0 (ref), v88 (copy), v91 (copy)
                        l_setCurrentFiber_0(v90);
                        if bit32.band(v89.mode, l_StrictMode_0) ~= 0 then
                            l_console_0.error("%s is deprecated in StrictMode. " .. "%s was passed an instance of %s which is inside StrictMode. " .. "Instead, add a ref directly to the element you want to reference. " .. "Learn more about using refs safely here: " .. "https://reactjs.org/link/strict-mode-find-node", v88, v88, v91);
                            return;
                        else
                            l_console_0.error("%s is deprecated in StrictMode. " .. "%s was passed an instance of %s which renders StrictMode children. " .. "Instead, add a ref directly to the element you want to reference. " .. "Learn more about using refs safely here: " .. "https://reactjs.org/link/strict-mode-find-node", v88, v88, v91);
                            return;
                        end;
                    end, l_describeError_0);
                    if l_current_0 then
                        l_setCurrentFiber_0(l_current_0);
                    else
                        l_resetCurrentFiber_0();
                    end;
                    if not v93 then
                        error(v94);
                    end;
                end;
            end;
            return v90.stateNode;
        end;
    else
        return (v86(v87));
    end;
end;
v75.createContainer = function(v96, v97, v98, v99) --[[ Line: 290 ]]
    -- upvalues: l_createFiberRoot_0 (copy)
    return l_createFiberRoot_0(v96, v97, v98, v99);
end;
v75.updateContainer = function(v100, v101, v102, v103) --[[ Line: 299 ]]
    -- upvalues: l___DEV___0 (copy), l_onScheduleRoot_0 (copy), l_requestEventTime_0 (copy), l_warnIfUnmockedScheduler_0 (copy), l_warnIfNotScopedWithMatchingAct_0 (copy), l_requestUpdateLane_0 (copy), l_enableSchedulingProfiler_0 (copy), l_markRenderScheduled_0 (copy), l_emptyContextObject_0 (copy), l_get_0 (copy), l_findCurrentUnmaskedContext_0 (copy), l_ClassComponent_0 (copy), l_isContextProvider_0 (copy), l_processChildContext_0 (copy), l_isRendering_0 (copy), v60 (copy), v76 (ref), l_console_0 (copy), l_getComponentName_0 (copy), l_createUpdate_0 (copy), l_Object_0 (copy), l_enqueueUpdate_0 (copy), l_scheduleUpdateOnFiber_0 (copy)
    local v104 = false;
    if l___DEV___0 then
        l_onScheduleRoot_0(v101, v100);
    end;
    local l_current_1 = v101.current;
    local v106 = l_requestEventTime_0();
    if l___DEV___0 and _G.__TESTEZ_RUNNING_TEST__ then
        l_warnIfUnmockedScheduler_0(l_current_1);
        l_warnIfNotScopedWithMatchingAct_0(l_current_1);
    end;
    local v107 = l_requestUpdateLane_0(l_current_1);
    if l_enableSchedulingProfiler_0 then
        l_markRenderScheduled_0(v107);
    end;
    local v108;
    if not v102 then
        v108 = l_emptyContextObject_0;
    else
        local v109 = l_get_0(v102);
        local v110 = l_findCurrentUnmaskedContext_0(v109);
        if v109.tag == l_ClassComponent_0 then
            local l_type_1 = v109.type;
            if l_isContextProvider_0(l_type_1) then
                v108 = l_processChildContext_0(v109, l_type_1, v110);
                v104 = true;
            end;
        end;
        if not v104 then
            v108 = v110;
        end;
    end;
    v104 = false;
    if v101.context == nil then
        v101.context = v108;
    else
        v101.pendingContext = v108;
    end;
    if l___DEV___0 and l_isRendering_0 and v60.current ~= nil and not v76 then
        v76 = true;
        l_console_0.error("Render methods should be a pure function of props and state; " .. "triggering nested component updates from render is not allowed. " .. "If necessary, trigger nested updates in componentDidUpdate.\n\n" .. "Check the render method of %s.", l_getComponentName_0(v60.current.type) or "Unknown");
    end;
    local v112 = l_createUpdate_0(v106, v107);
    if v100 == nil then
        v100 = l_Object_0.None;
    end;
    v112.payload = {
        element = v100
    };
    if v103 ~= nil then
        if l___DEV___0 and typeof(v103) ~= "function" then
            l_console_0.error("render(...): Expected the last optional `callback` argument to be a " .. "function. Instead received: %s.", (tostring(v103)));
        end;
        v112.callback = v103;
    end;
    l_enqueueUpdate_0(l_current_1, v112);
    l_scheduleUpdateOnFiber_0(l_current_1, v107, v106);
    return v107;
end;
v75.batchedEventUpdates = l_batchedEventUpdates_0;
v75.batchedUpdates = l_batchedUpdates_0;
v75.unbatchedUpdates = l_unbatchedUpdates_0;
v75.deferredUpdates = l_deferredUpdates_0;
v75.discreteUpdates = l_discreteUpdates_0;
v75.flushDiscreteUpdates = l_flushDiscreteUpdates_0;
v75.flushControlled = l_flushControlled_0;
v75.flushSync = l_flushSync_0;
v75.flushPassiveEffects = l_flushPassiveEffects_0;
v75.IsThisRendererActing = l_IsThisRendererActing_0;
v75.act = l_act_0;
v75.getPublicRootInstance = function(v113) --[[ Line: 395 ]]
    -- upvalues: l_HostComponent_0 (copy), l_getPublicInstance_0 (copy)
    local l_current_2 = v113.current;
    if not l_current_2.child then
        return nil;
    elseif l_current_2.child.tag == l_HostComponent_0 then
        return l_getPublicInstance_0(l_current_2.child.stateNode);
    else
        return l_current_2.child.stateNode;
    end;
end;
local v115 = nil;
v75.attemptSynchronousHydration = function(v116) --[[ Line: 410 ]]
    -- upvalues: l_HostRoot_0 (copy), l_getHighestPriorityPendingLanes_0 (copy), l_flushRoot_0 (copy), l_SuspenseComponent_0 (copy), l_requestEventTime_0 (copy), l_flushSync_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_InputDiscreteHydrationLane_0 (copy), v115 (ref)
    if v116.tag == l_HostRoot_0 then
        local l_stateNode_0 = v116.stateNode;
        if l_stateNode_0.hydrate then
            local v118 = l_getHighestPriorityPendingLanes_0(l_stateNode_0);
            l_flushRoot_0(l_stateNode_0, v118);
            return;
        end;
    elseif v116.tag == l_SuspenseComponent_0 then
        local v119 = l_requestEventTime_0();
        l_flushSync_0(function() --[[ Line: 420 ]]
            -- upvalues: l_scheduleUpdateOnFiber_0 (ref), v116 (copy), l_SyncLane_0 (ref), v119 (copy)
            return l_scheduleUpdateOnFiber_0(v116, l_SyncLane_0, v119);
        end);
        v115(v116, l_InputDiscreteHydrationLane_0);
    end;
end;
local function _(v120, v121) --[[ Line: 431 ]] --[[ Name: markRetryLaneImpl ]]
    -- upvalues: l_higherPriorityLane_0 (copy)
    local l_memoizedState_0 = v120.memoizedState;
    if l_memoizedState_0 and l_memoizedState_0 ~= nil and l_memoizedState_0.dehydrated ~= nil then
        l_memoizedState_0.retryLane = l_higherPriorityLane_0(l_memoizedState_0.retryLane, v121);
    end;
end;
v115 = function(v124, v125) --[[ Line: 442 ]]
    -- upvalues: l_higherPriorityLane_0 (copy)
    local l_memoizedState_1 = v124.memoizedState;
    if l_memoizedState_1 and l_memoizedState_1 ~= nil and l_memoizedState_1.dehydrated ~= nil then
        l_memoizedState_1.retryLane = l_higherPriorityLane_0(l_memoizedState_1.retryLane, v125);
    end;
    l_memoizedState_1 = v124.alternate;
    if l_memoizedState_1 then
        local l_memoizedState_2 = l_memoizedState_1.memoizedState;
        if l_memoizedState_2 and l_memoizedState_2 ~= nil and l_memoizedState_2.dehydrated ~= nil then
            l_memoizedState_2.retryLane = l_higherPriorityLane_0(l_memoizedState_2.retryLane, v125);
        end;
    end;
end;
v75.attemptUserBlockingHydration = function(v128) --[[ Line: 451 ]]
    -- upvalues: l_SuspenseComponent_0 (copy), l_requestEventTime_0 (copy), l_InputDiscreteHydrationLane_0 (copy), l_scheduleUpdateOnFiber_0 (copy), v115 (ref)
    if v128.tag ~= l_SuspenseComponent_0 then
        return;
    else
        local v129 = l_requestEventTime_0();
        local l_l_InputDiscreteHydrationLane_0_0 = l_InputDiscreteHydrationLane_0;
        l_scheduleUpdateOnFiber_0(v128, l_l_InputDiscreteHydrationLane_0_0, v129);
        v115(v128, l_l_InputDiscreteHydrationLane_0_0);
        return;
    end;
end;
v75.attemptContinuousHydration = function(v131) --[[ Line: 465 ]]
    -- upvalues: l_SuspenseComponent_0 (copy), l_requestEventTime_0 (copy), l_SelectiveHydrationLane_0 (copy), l_scheduleUpdateOnFiber_0 (copy), v115 (ref)
    if v131.tag ~= l_SuspenseComponent_0 then
        return;
    else
        local v132 = l_requestEventTime_0();
        local l_l_SelectiveHydrationLane_0_0 = l_SelectiveHydrationLane_0;
        l_scheduleUpdateOnFiber_0(v131, l_l_SelectiveHydrationLane_0_0, v132);
        v115(v131, l_l_SelectiveHydrationLane_0_0);
        return;
    end;
end;
v75.attemptHydrationAtCurrentPriority = function(v134) --[[ Line: 479 ]]
    -- upvalues: l_SuspenseComponent_0 (copy), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), l_scheduleUpdateOnFiber_0 (copy), v115 (ref)
    if v134.tag ~= l_SuspenseComponent_0 then
        return;
    else
        local v135 = l_requestEventTime_0();
        local v136 = l_requestUpdateLane_0(v134);
        l_scheduleUpdateOnFiber_0(v134, v136, v135);
        v115(v134, v136);
        return;
    end;
end;
v75.runWithPriority = function(v137, v138) --[[ Line: 491 ]]
    -- upvalues: l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), l_describeError_0 (copy)
    local v139 = l_getCurrentUpdateLanePriority_0();
    l_setCurrentUpdateLanePriority_0(v137);
    local v140, v141 = xpcall(v138, l_describeError_0);
    l_setCurrentUpdateLanePriority_0(v139);
    if not v140 then
        error(v141);
    end;
    return v141;
end;
v75.getCurrentUpdateLanePriority = l_getCurrentUpdateLanePriority_0;
v75.findHostInstance = v86;
v75.findHostInstanceWithWarning = v95;
v75.findHostInstanceWithNoPortals = function(v142) --[[ Line: 509 ]]
    -- upvalues: l_findCurrentHostFiberWithNoPortals_0 (copy), l_FundamentalComponent_0 (copy)
    local v143 = l_findCurrentHostFiberWithNoPortals_0(v142);
    if v143 == nil then
        return nil;
    elseif v143.tag == l_FundamentalComponent_0 then
        return v143.stateNode.instance;
    else
        return v143.stateNode;
    end;
end;
local function v145(_) --[[ Line: 520 ]] --[[ Name: shouldSuspendImpl ]]
    return false;
end;
v75.shouldSuspend = function(v146) --[[ Line: 524 ]]
    -- upvalues: v145 (ref)
    return v145(v146);
end;
local v147 = nil;
local v148 = nil;
local v149 = nil;
local v150 = nil;
local v151 = nil;
local v152 = nil;
local v153 = nil;
local v154 = nil;
if l___DEV___0 then
    local function v155(v156, v157, v158) --[[ Line: 539 ]] --[[ Name: copyWithDeleteImpl ]]
        -- upvalues: l_Array_0 (copy), v155 (copy)
        local v159 = v157[v158];
        local v160 = nil;
        v160 = if l_Array_0.isArray(v156) then l_Array_0.slice(v156) else table.clone(v156);
        if v158 + 1 == #v157 then
            if l_Array_0.isArray(v160) then
                l_Array_0.splice(v160, v159, 1);
                return v160;
            else
                v160[v159] = nil;
                return v160;
            end;
        else
            v160[v159] = v155(v156[v159], v157, v158 + 1);
            return v160;
        end;
    end;
    local function _(v161, v162) --[[ Line: 567 ]] --[[ Name: copyWithDelete ]]
        -- upvalues: v155 (copy)
        return (v155(v161, v162, 0));
    end;
    local function v164(v165, v166, v167, v168) --[[ Line: 575 ]] --[[ Name: copyWithRenameImpl ]]
        -- upvalues: l_Array_0 (copy), v164 (copy)
        local v169 = v166[v168];
        local v170 = nil;
        v170 = if l_Array_0.isArray(v165) then l_Array_0.slice(v165) else table.clone(v165);
        if v168 + 1 == #v166 then
            v170[v167[v168]] = v170[v169];
            if l_Array_0.isArray(v170) then
                l_Array_0.splice(v170, v169, 1);
                return v170;
            else
                v170[v169] = nil;
                return v170;
            end;
        else
            v170[v169] = v164(v165[v169], v166, v167, v168 + 1);
            return v170;
        end;
    end;
    local function v175(v171, v172, v173) --[[ Line: 611 ]] --[[ Name: copyWithRename ]]
        -- upvalues: l_console_0 (copy), v164 (copy)
        if #v172 ~= #v173 then
            l_console_0.warn("copyWithRename() expects paths of the same length");
            return nil;
        else
            for v174 = 1, #v173 do
                if v172[v174] ~= v173[v174] then
                    l_console_0.warn("copyWithRename() expects paths to be the same except for the deepest key");
                    return nil;
                end;
            end;
            return (v164(v171, v172, v173, 0));
        end;
    end;
    local function v176(v177, v178, v179, v180) --[[ Line: 633 ]] --[[ Name: copyWithSetImpl ]]
        -- upvalues: l_Array_0 (copy), v176 (copy)
        if #v178 + 1 <= v179 then
            return v180;
        else
            local v181 = v178[v179];
            local v182 = nil;
            v182 = if l_Array_0.isArray(v177) then l_Array_0.slice(v177) else table.clone(v177);
            v182[v181] = v176(v177[v181], v178, v179 + 2, v180);
            return v182;
        end;
    end;
    local function _(v183, v184, v185) --[[ Line: 655 ]] --[[ Name: copyWithSet ]]
        -- upvalues: v176 (copy)
        return (v176(v183, v184, 1, v185));
    end;
    local function _(v187, v188) --[[ Line: 663 ]] --[[ Name: findHook ]]
        local l_memoizedState_3 = v187.memoizedState;
        while l_memoizedState_3 ~= nil and v188 > 1 do
            l_memoizedState_3 = l_memoizedState_3.next;
            v188 = v188 - 1;
        end;
        return l_memoizedState_3;
    end;
    v147 = function(v191, v192, v193, v194) --[[ Line: 676 ]]
        -- upvalues: v176 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_v192_0 = v192;
        local l_memoizedState_4 = v191.memoizedState;
        while l_memoizedState_4 ~= nil and l_v192_0 > 1 do
            l_memoizedState_4 = l_memoizedState_4.next;
            l_v192_0 = l_v192_0 - 1;
        end;
        local l_l_memoizedState_4_0 = l_memoizedState_4;
        if l_l_memoizedState_4_0 ~= nil then
            l_memoizedState_4 = l_l_memoizedState_4_0.memoizedState;
            l_v192_0 = v176(l_memoizedState_4, v193, 1, v194);
            l_l_memoizedState_4_0.memoizedState = l_v192_0;
            l_l_memoizedState_4_0.baseState = l_v192_0;
            v191.memoizedProps = table.clone(v191.memoizedProps);
            l_scheduleUpdateOnFiber_0(v191, l_SyncLane_0, l_NoTimestamp_0);
        end;
    end;
    v148 = function(v198, v199, v200) --[[ Line: 694 ]]
        -- upvalues: v155 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_v199_0 = v199;
        local l_memoizedState_5 = v198.memoizedState;
        while l_memoizedState_5 ~= nil and l_v199_0 > 1 do
            l_memoizedState_5 = l_memoizedState_5.next;
            l_v199_0 = l_v199_0 - 1;
        end;
        local l_l_memoizedState_5_0 = l_memoizedState_5;
        if l_l_memoizedState_5_0 ~= nil then
            l_memoizedState_5 = l_l_memoizedState_5_0.memoizedState;
            l_v199_0 = v155(l_memoizedState_5, v200, 0);
            l_l_memoizedState_5_0.memoizedState = l_v199_0;
            l_l_memoizedState_5_0.baseState = l_v199_0;
            v198.memoizedProps = table.clone(v198.memoizedProps);
            l_scheduleUpdateOnFiber_0(v198, l_SyncLane_0, l_NoTimestamp_0);
        end;
    end;
    v149 = function(v204, v205, v206, v207) --[[ Line: 711 ]]
        -- upvalues: v175 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_v205_0 = v205;
        local l_memoizedState_6 = v204.memoizedState;
        while l_memoizedState_6 ~= nil and l_v205_0 > 1 do
            l_memoizedState_6 = l_memoizedState_6.next;
            l_v205_0 = l_v205_0 - 1;
        end;
        local l_l_memoizedState_6_0 = l_memoizedState_6;
        if l_l_memoizedState_6_0 ~= nil then
            l_v205_0 = v175(l_l_memoizedState_6_0.memoizedState, v206, v207);
            l_l_memoizedState_6_0.memoizedState = l_v205_0;
            l_l_memoizedState_6_0.baseState = l_v205_0;
            v204.memoizedProps = table.clone(v204.memoizedProps);
            l_scheduleUpdateOnFiber_0(v204, l_SyncLane_0, l_NoTimestamp_0);
        end;
    end;
    v150 = function(v211, v212, v213) --[[ Line: 735 ]]
        -- upvalues: v176 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_memoizedProps_0 = v211.memoizedProps;
        v211.pendingProps = v176(l_memoizedProps_0, v212, 1, v213);
        local l_alternate_0 = v211.alternate;
        if l_alternate_0 then
            l_alternate_0.pendingProps = v211.pendingProps;
        end;
        l_scheduleUpdateOnFiber_0(v211, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v151 = function(v216, v217) --[[ Line: 744 ]]
        -- upvalues: v155 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_memoizedProps_1 = v216.memoizedProps;
        v216.pendingProps = v155(l_memoizedProps_1, v217, 0);
        local l_alternate_1 = v216.alternate;
        if l_alternate_1 then
            l_alternate_1.pendingProps = v216.pendingProps;
        end;
        l_scheduleUpdateOnFiber_0(v216, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v152 = function(v220, v221, v222) --[[ Line: 753 ]]
        -- upvalues: v175 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        v220.pendingProps = v175(v220.memoizedProps, v221, v222);
        local l_alternate_2 = v220.alternate;
        if l_alternate_2 then
            l_alternate_2.pendingProps = v220.pendingProps;
        end;
        l_scheduleUpdateOnFiber_0(v220, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v153 = function(v224) --[[ Line: 767 ]]
        -- upvalues: l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        l_scheduleUpdateOnFiber_0(v224, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v154 = function(v225) --[[ Line: 771 ]]
        -- upvalues: v145 (ref)
        v145 = v225;
    end;
end;
findHostInstanceByFiber = function(v226) --[[ Line: 776 ]] --[[ Name: findHostInstanceByFiber ]]
    -- upvalues: l_findCurrentHostFiber_0 (copy)
    local v227 = l_findCurrentHostFiber_0(v226);
    if v227 == nil then
        return nil;
    else
        return v227.stateNode;
    end;
end;
emptyFindFiberByHostInstance = function(_) --[[ Line: 784 ]] --[[ Name: emptyFindFiberByHostInstance ]]
    return nil;
end;
getCurrentFiberForDevTools = function() --[[ Line: 788 ]] --[[ Name: getCurrentFiberForDevTools ]]
    -- upvalues: v60 (copy)
    return v60.current;
end;
v75.injectIntoDevTools = function(v229) --[[ Line: 792 ]]
    -- upvalues: l_ReactSharedInternals_0 (copy), l___DEV___0 (copy), l_injectInternals_0 (copy), v147 (ref), v148 (ref), v149 (ref), v150 (ref), v151 (ref), v152 (ref), v154 (ref), v153 (ref)
    local l_findFiberByHostInstance_0 = v229.findFiberByHostInstance;
    local l_ReactCurrentDispatcher_0 = l_ReactSharedInternals_0.ReactCurrentDispatcher;
    local v232 = nil;
    if l___DEV___0 then
        v232 = getCurrentFiberForDevTools;
    end;
    return l_injectInternals_0({
        bundleType = v229.bundleType, 
        version = v229.version, 
        rendererPackageName = v229.rendererPackageName, 
        rendererConfig = v229.rendererConfig, 
        overrideHookState = v147, 
        overrideHookStateDeletePath = v148, 
        overrideHookStateRenamePath = v149, 
        overrideProps = v150, 
        overridePropsDeletePath = v151, 
        overridePropsRenamePath = v152, 
        setSuspenseHandler = v154, 
        scheduleUpdate = v153, 
        currentDispatcherRef = l_ReactCurrentDispatcher_0, 
        findHostInstanceByFiber = findHostInstanceByFiber, 
        findFiberByHostInstance = l_findFiberByHostInstance_0 or emptyFindFiberByHostInstance, 
        getCurrentFiber = v232
    });
end;
v75.robloxReactProfiling = require(script.Parent.RobloxReactProfiling);
return v75;