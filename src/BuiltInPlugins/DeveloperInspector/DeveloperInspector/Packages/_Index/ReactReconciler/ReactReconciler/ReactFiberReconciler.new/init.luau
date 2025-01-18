local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Object_0 = v1.Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v6 = require(script.Parent.ReactRootTags);
local v7 = require(script.Parent.ReactFiberFlags);
local _ = require(script.Parent.ReactFiberHostConfig);
local v9 = require(script.Parent.ReactWorkTags);
local l_FundamentalComponent_0 = v9.FundamentalComponent;
local _ = require(l_Parent_0.Shared);
local v12 = require(script.Parent.ReactFiberLane);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v14 = require(script.Parent.ReactFiberTreeReflection);
local l_findCurrentHostFiber_0 = v14.findCurrentHostFiber;
local l_findCurrentHostFiberWithNoPortals_0 = v14.findCurrentHostFiberWithNoPortals;
local l_get_0 = require(l_Parent_0.Shared).ReactInstanceMap.get;
local l_HostComponent_0 = v9.HostComponent;
local l_ClassComponent_0 = v9.ClassComponent;
local l_HostRoot_0 = v9.HostRoot;
local l_SuspenseComponent_0 = v9.SuspenseComponent;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_enableSchedulingProfiler_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableSchedulingProfiler;
local l_ReactSharedInternals_0 = require(l_Parent_0.Shared).ReactSharedInternals;
local l_getPublicInstance_0 = require(script.Parent.ReactFiberHostConfig).getPublicInstance;
local v27 = require(script.Parent["ReactFiberContext.new"]);
local l_findCurrentUnmaskedContext_0 = v27.findCurrentUnmaskedContext;
local l_processChildContext_0 = v27.processChildContext;
local l_emptyContextObject_0 = v27.emptyContextObject;
local l_isContextProvider_0 = v27.isContextProvider;
local l_createFiberRoot_0 = require(script.Parent["ReactFiberRoot.new"]).createFiberRoot;
local v33 = require(script.Parent["ReactFiberDevToolsHook.new"]);
local l_injectInternals_0 = v33.injectInternals;
local l_onScheduleRoot_0 = v33.onScheduleRoot;
local v36 = require(script.Parent["ReactFiberWorkLoop.new"]);
local l_requestEventTime_0 = v36.requestEventTime;
local l_requestUpdateLane_0 = v36.requestUpdateLane;
local l_scheduleUpdateOnFiber_0 = v36.scheduleUpdateOnFiber;
local l_flushRoot_0 = v36.flushRoot;
local l_batchedEventUpdates_0 = v36.batchedEventUpdates;
local l_batchedUpdates_0 = v36.batchedUpdates;
local l_unbatchedUpdates_0 = v36.unbatchedUpdates;
local l_flushSync_0 = v36.flushSync;
local l_flushControlled_0 = v36.flushControlled;
local l_deferredUpdates_0 = v36.deferredUpdates;
local l_discreteUpdates_0 = v36.discreteUpdates;
local l_flushDiscreteUpdates_0 = v36.flushDiscreteUpdates;
local l_flushPassiveEffects_0 = v36.flushPassiveEffects;
local l_warnIfNotScopedWithMatchingAct_0 = v36.warnIfNotScopedWithMatchingAct;
local l_warnIfUnmockedScheduler_0 = v36.warnIfUnmockedScheduler;
local l_IsThisRendererActing_0 = v36.IsThisRendererActing;
local l_act_0 = v36.act;
local v54 = require(script.Parent["ReactUpdateQueue.new"]);
local l_createUpdate_0 = v54.createUpdate;
local l_enqueueUpdate_0 = v54.enqueueUpdate;
local v57 = require(script.Parent.ReactCurrentFiber);
local l_isRendering_0 = v57.isRendering;
local l_resetCurrentFiber_0 = v57.resetCurrentFiber;
local l_setCurrentFiber_0 = v57.setCurrentFiber;
local v61 = require(script.Parent.ReactTypeOfMode);
local l_StrictMode_0 = v61.StrictMode;
local l_SyncLane_0 = v12.SyncLane;
local l_InputDiscreteHydrationLane_0 = v12.InputDiscreteHydrationLane;
local l_SelectiveHydrationLane_0 = v12.SelectiveHydrationLane;
local l_NoTimestamp_0 = v12.NoTimestamp;
local l_getHighestPriorityPendingLanes_0 = v12.getHighestPriorityPendingLanes;
local l_higherPriorityLane_0 = v12.higherPriorityLane;
local l_getCurrentUpdateLanePriority_0 = v12.getCurrentUpdateLanePriority;
local l_setCurrentUpdateLanePriority_0 = v12.setCurrentUpdateLanePriority;
local l_markRenderScheduled_0 = require(script.Parent.SchedulingProfiler).markRenderScheduled;
local v72 = {
    ReactRootTags = v6, 
    ReactWorkTags = v9, 
    ReactTypeOfMode = v61, 
    ReactFiberFlags = v7, 
    getNearestMountedFiber = v14.getNearestMountedFiber, 
    findCurrentFiberUsingSlowPath = v14.findCurrentFiberUsingSlowPath, 
    createPortal = require(script.Parent.ReactPortal).createPortal
};
local v73 = nil;
local v74 = nil;
if _G.__DEV__ then
    v73 = false;
    v74 = {};
end;
local function _(v75) --[[ Line: 172 ]] --[[ Name: getContextForSubtree ]]
    -- upvalues: l_emptyContextObject_0 (copy), l_get_0 (copy), l_findCurrentUnmaskedContext_0 (copy), l_ClassComponent_0 (copy), l_isContextProvider_0 (copy), l_processChildContext_0 (copy)
    if not v75 then
        return l_emptyContextObject_0;
    else
        local v76 = l_get_0(v75);
        local v77 = l_findCurrentUnmaskedContext_0(v76);
        if v76.tag == l_ClassComponent_0 then
            local l_type_0 = v76.type;
            if l_isContextProvider_0(l_type_0) then
                return l_processChildContext_0(v76, l_type_0, v77);
            end;
        end;
        return v77;
    end;
end;
local function v83(v80) --[[ Line: 192 ]] --[[ Name: findHostInstance ]]
    -- upvalues: l_get_0 (copy), l_invariant_0 (copy), l_Object_0 (copy), l_findCurrentHostFiber_0 (copy)
    local v81 = l_get_0(v80);
    if v81 == nil then
        if typeof(v80.render) == "function" then
            l_invariant_0(false, "Unable to find node on an unmounted component.");
        else
            l_invariant_0(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(l_Object_0.keys(v80)));
        end;
    end;
    local v82 = l_findCurrentHostFiber_0(v81);
    if v82 == nil then
        return nil;
    else
        return v82.stateNode;
    end;
end;
local function v92(v84, v85) --[[ Line: 213 ]] --[[ Name: findHostInstanceWithWarning ]]
    -- upvalues: l_get_0 (copy), l_invariant_0 (copy), l_Object_0 (copy), l_findCurrentHostFiber_0 (copy), l_StrictMode_0 (copy), l_getComponentName_0 (copy), v74 (ref), v57 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_resetCurrentFiber_0 (copy), v83 (copy)
    if _G.__DEV__ then
        local v86 = l_get_0(v84);
        if v86 == nil then
            if typeof(v84.render) == "function" then
                l_invariant_0(false, "Unable to find node on an unmounted component.");
            else
                l_invariant_0(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(l_Object_0.keys(v84)));
            end;
        end;
        local v87 = l_findCurrentHostFiber_0(v86);
        if v87 == nil then
            return nil;
        else
            if bit32.band(v87.mode, l_StrictMode_0) ~= 0 then
                local v88 = l_getComponentName_0(v86.type) or "Component";
                if not v74[v88] then
                    v74[v88] = true;
                    local l_current_0 = v57.current;
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 241 ]]
                        -- upvalues: l_setCurrentFiber_0 (ref), v87 (copy), v86 (copy), l_StrictMode_0 (ref), l_console_0 (ref), v85 (copy), v88 (copy)
                        l_setCurrentFiber_0(v87);
                        if bit32.band(v86.mode, l_StrictMode_0) ~= 0 then
                            l_console_0.error("%s is deprecated in StrictMode. " .. "%s was passed an instance of %s which is inside StrictMode. " .. "Instead, add a ref directly to the element you want to reference. " .. "Learn more about using refs safely here: " .. "https://reactjs.org/link/strict-mode-find-node", v85, v85, v88);
                            return;
                        else
                            l_console_0.error("%s is deprecated in StrictMode. " .. "%s was passed an instance of %s which renders StrictMode children. " .. "Instead, add a ref directly to the element you want to reference. " .. "Learn more about using refs safely here: " .. "https://reactjs.org/link/strict-mode-find-node", v85, v85, v88);
                            return;
                        end;
                    end);
                    if l_current_0 then
                        l_setCurrentFiber_0(l_current_0);
                    else
                        l_resetCurrentFiber_0();
                    end;
                    if not l_status_0 then
                        error(l_result_0);
                    end;
                end;
            end;
            return v87.stateNode;
        end;
    else
        return (v83(v84));
    end;
end;
v72.createContainer = function(v93, v94, v95, v96) --[[ Line: 286 ]]
    -- upvalues: l_createFiberRoot_0 (copy)
    return l_createFiberRoot_0(v93, v94, v95, v96);
end;
v72.updateContainer = function(v97, v98, v99, v100) --[[ Line: 295 ]]
    -- upvalues: l_onScheduleRoot_0 (copy), l_requestEventTime_0 (copy), l_warnIfUnmockedScheduler_0 (copy), l_warnIfNotScopedWithMatchingAct_0 (copy), l_requestUpdateLane_0 (copy), l_enableSchedulingProfiler_0 (copy), l_markRenderScheduled_0 (copy), l_emptyContextObject_0 (copy), l_get_0 (copy), l_findCurrentUnmaskedContext_0 (copy), l_ClassComponent_0 (copy), l_isContextProvider_0 (copy), l_processChildContext_0 (copy), l_isRendering_0 (copy), v57 (copy), v73 (ref), l_console_0 (copy), l_getComponentName_0 (copy), l_createUpdate_0 (copy), l_Object_0 (copy), l_enqueueUpdate_0 (copy), l_scheduleUpdateOnFiber_0 (copy)
    local v101 = false;
    if _G.__DEV__ then
        l_onScheduleRoot_0(v98, v97);
    end;
    local l_current_1 = v98.current;
    local v103 = l_requestEventTime_0();
    if _G.__DEV__ and _G.__TESTEZ_RUNNING_TEST__ then
        l_warnIfUnmockedScheduler_0(l_current_1);
        l_warnIfNotScopedWithMatchingAct_0(l_current_1);
    end;
    local v104 = l_requestUpdateLane_0(l_current_1);
    if l_enableSchedulingProfiler_0 then
        l_markRenderScheduled_0(v104);
    end;
    local v105;
    if not v99 then
        v105 = l_emptyContextObject_0;
    else
        local v106 = l_get_0(v99);
        local v107 = l_findCurrentUnmaskedContext_0(v106);
        if v106.tag == l_ClassComponent_0 then
            local l_type_1 = v106.type;
            if l_isContextProvider_0(l_type_1) then
                v105 = l_processChildContext_0(v106, l_type_1, v107);
                v101 = true;
            end;
        end;
        if not v101 then
            v105 = v107;
        end;
    end;
    v101 = false;
    if v98.context == nil then
        v98.context = v105;
    else
        v98.pendingContext = v105;
    end;
    if _G.__DEV__ and l_isRendering_0 and v57.current ~= nil and not v73 then
        v73 = true;
        l_console_0.error("Render methods should be a pure function of props and state; " .. "triggering nested component updates from render is not allowed. " .. "If necessary, trigger nested updates in componentDidUpdate.\n\n" .. "Check the render method of %s.", l_getComponentName_0(v57.current.type) or "Unknown");
    end;
    local v109 = l_createUpdate_0(v103, v104);
    if v97 == nil then
        v97 = l_Object_0.None;
    end;
    v109.payload = {
        element = v97
    };
    if v100 ~= nil then
        if _G.__DEV__ and typeof(v100) ~= "function" then
            l_console_0.error("render(...): Expected the last optional `callback` argument to be a " .. "function. Instead received: %s.", (tostring(v100)));
        end;
        v109.callback = v100;
    end;
    l_enqueueUpdate_0(l_current_1, v109);
    l_scheduleUpdateOnFiber_0(l_current_1, v104, v103);
    return v104;
end;
v72.batchedEventUpdates = l_batchedEventUpdates_0;
v72.batchedUpdates = l_batchedUpdates_0;
v72.unbatchedUpdates = l_unbatchedUpdates_0;
v72.deferredUpdates = l_deferredUpdates_0;
v72.discreteUpdates = l_discreteUpdates_0;
v72.flushDiscreteUpdates = l_flushDiscreteUpdates_0;
v72.flushControlled = l_flushControlled_0;
v72.flushSync = l_flushSync_0;
v72.flushPassiveEffects = l_flushPassiveEffects_0;
v72.IsThisRendererActing = l_IsThisRendererActing_0;
v72.act = l_act_0;
v72.getPublicRootInstance = function(v110) --[[ Line: 390 ]]
    -- upvalues: l_HostComponent_0 (copy), l_getPublicInstance_0 (copy)
    local l_current_2 = v110.current;
    if not l_current_2.child then
        return nil;
    elseif l_current_2.child.tag == l_HostComponent_0 then
        return l_getPublicInstance_0(l_current_2.child.stateNode);
    else
        return l_current_2.child.stateNode;
    end;
end;
local v112 = nil;
v72.attemptSynchronousHydration = function(v113) --[[ Line: 408 ]]
    -- upvalues: l_HostRoot_0 (copy), l_getHighestPriorityPendingLanes_0 (copy), l_flushRoot_0 (copy), l_SuspenseComponent_0 (copy), l_requestEventTime_0 (copy), l_flushSync_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_InputDiscreteHydrationLane_0 (copy), v112 (ref)
    if v113.tag == l_HostRoot_0 then
        local l_stateNode_0 = v113.stateNode;
        if l_stateNode_0.hydrate then
            local v115 = l_getHighestPriorityPendingLanes_0(l_stateNode_0);
            l_flushRoot_0(l_stateNode_0, v115);
            return;
        end;
    elseif v113.tag == l_SuspenseComponent_0 then
        local v116 = l_requestEventTime_0();
        l_flushSync_0(function() --[[ Line: 418 ]]
            -- upvalues: l_scheduleUpdateOnFiber_0 (ref), v113 (copy), l_SyncLane_0 (ref), v116 (copy)
            return l_scheduleUpdateOnFiber_0(v113, l_SyncLane_0, v116);
        end);
        v112(v113, l_InputDiscreteHydrationLane_0);
    end;
end;
local function _(v117, v118) --[[ Line: 429 ]] --[[ Name: markRetryLaneImpl ]]
    -- upvalues: l_higherPriorityLane_0 (copy)
    local l_memoizedState_0 = v117.memoizedState;
    if l_memoizedState_0 and l_memoizedState_0 ~= nil and l_memoizedState_0.dehydrated ~= nil then
        l_memoizedState_0.retryLane = l_higherPriorityLane_0(l_memoizedState_0.retryLane, v118);
    end;
end;
v112 = function(v121, v122) --[[ Line: 442 ]]
    -- upvalues: l_higherPriorityLane_0 (copy)
    local l_memoizedState_1 = v121.memoizedState;
    if l_memoizedState_1 and l_memoizedState_1 ~= nil and l_memoizedState_1.dehydrated ~= nil then
        l_memoizedState_1.retryLane = l_higherPriorityLane_0(l_memoizedState_1.retryLane, v122);
    end;
    l_memoizedState_1 = v121.alternate;
    if l_memoizedState_1 then
        local l_memoizedState_2 = l_memoizedState_1.memoizedState;
        if l_memoizedState_2 and l_memoizedState_2 ~= nil and l_memoizedState_2.dehydrated ~= nil then
            l_memoizedState_2.retryLane = l_higherPriorityLane_0(l_memoizedState_2.retryLane, v122);
        end;
    end;
end;
v72.attemptUserBlockingHydration = function(v125) --[[ Line: 451 ]]
    -- upvalues: l_SuspenseComponent_0 (copy), l_requestEventTime_0 (copy), l_InputDiscreteHydrationLane_0 (copy), l_scheduleUpdateOnFiber_0 (copy), v112 (ref)
    if v125.tag ~= l_SuspenseComponent_0 then
        return;
    else
        local v126 = l_requestEventTime_0();
        local l_l_InputDiscreteHydrationLane_0_0 = l_InputDiscreteHydrationLane_0;
        l_scheduleUpdateOnFiber_0(v125, l_l_InputDiscreteHydrationLane_0_0, v126);
        v112(v125, l_l_InputDiscreteHydrationLane_0_0);
        return;
    end;
end;
v72.attemptContinuousHydration = function(v128) --[[ Line: 465 ]]
    -- upvalues: l_SuspenseComponent_0 (copy), l_requestEventTime_0 (copy), l_SelectiveHydrationLane_0 (copy), l_scheduleUpdateOnFiber_0 (copy), v112 (ref)
    if v128.tag ~= l_SuspenseComponent_0 then
        return;
    else
        local v129 = l_requestEventTime_0();
        local l_l_SelectiveHydrationLane_0_0 = l_SelectiveHydrationLane_0;
        l_scheduleUpdateOnFiber_0(v128, l_l_SelectiveHydrationLane_0_0, v129);
        v112(v128, l_l_SelectiveHydrationLane_0_0);
        return;
    end;
end;
v72.attemptHydrationAtCurrentPriority = function(v131) --[[ Line: 479 ]]
    -- upvalues: l_SuspenseComponent_0 (copy), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), l_scheduleUpdateOnFiber_0 (copy), v112 (ref)
    if v131.tag ~= l_SuspenseComponent_0 then
        return;
    else
        local v132 = l_requestEventTime_0();
        local v133 = l_requestUpdateLane_0(v131);
        l_scheduleUpdateOnFiber_0(v131, v133, v132);
        v112(v131, v133);
        return;
    end;
end;
v72.runWithPriority = function(v134, v135) --[[ Line: 492 ]]
    -- upvalues: l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy)
    local v136 = l_getCurrentUpdateLanePriority_0();
    l_setCurrentUpdateLanePriority_0(v134);
    local l_status_1, l_result_1 = pcall(v135);
    l_setCurrentUpdateLanePriority_0(v136);
    if not l_status_1 then
        error(l_result_1);
    end;
end;
v72.getCurrentUpdateLanePriority = l_getCurrentUpdateLanePriority_0;
v72.findHostInstance = v83;
v72.findHostInstanceWithWarning = v92;
v72.findHostInstanceWithNoPortals = function(v139) --[[ Line: 509 ]]
    -- upvalues: l_findCurrentHostFiberWithNoPortals_0 (copy), l_FundamentalComponent_0 (copy)
    local v140 = l_findCurrentHostFiberWithNoPortals_0(v139);
    if v140 == nil then
        return nil;
    elseif v140.tag == l_FundamentalComponent_0 then
        return v140.stateNode.instance;
    else
        return v140.stateNode;
    end;
end;
local function v142(_) --[[ Line: 522 ]] --[[ Name: shouldSuspendImpl ]]
    return false;
end;
v72.shouldSuspend = function(v143) --[[ Line: 526 ]]
    -- upvalues: v142 (ref)
    return v142(v143);
end;
local v144 = nil;
local v145 = nil;
local v146 = nil;
local v147 = nil;
local v148 = nil;
local v149 = nil;
local v150 = nil;
local v151 = nil;
if _G.__DEV__ then
    local function v152(v153, v154, v155) --[[ Line: 541 ]] --[[ Name: copyWithDeleteImpl ]]
        -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v152 (copy)
        local v156 = v154[v155];
        local v157 = nil;
        v157 = if l_Array_0.isArray(v153) then l_Array_0.slice(v153) else l_Object_0.assign({}, v153);
        if v155 + 1 == #v154 then
            if l_Array_0.isArray(v157) then
                l_Array_0.splice(v157, v156, 1);
                return v157;
            else
                v157[v156] = nil;
                return v157;
            end;
        else
            v157[v156] = v152(v153[v156], v154, v155 + 1);
            return v157;
        end;
    end;
    local function _(v158, v159) --[[ Line: 569 ]] --[[ Name: copyWithDelete ]]
        -- upvalues: v152 (copy)
        return (v152(v158, v159, 0));
    end;
    local function v161(v162, v163, v164, v165) --[[ Line: 577 ]] --[[ Name: copyWithRenameImpl ]]
        -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v161 (copy)
        local v166 = v163[v165];
        local v167 = nil;
        v167 = if l_Array_0.isArray(v162) then l_Array_0.slice(v162) else l_Object_0.assign({}, v162);
        if v165 + 1 == #v163 then
            v167[v164[v165]] = v167[v166];
            if l_Array_0.isArray(v167) then
                l_Array_0.splice(v167, v166, 1);
                return v167;
            else
                v167[v166] = nil;
                return v167;
            end;
        else
            v167[v166] = v161(v162[v166], v163, v164, v165 + 1);
            return v167;
        end;
    end;
    local function v172(v168, v169, v170) --[[ Line: 613 ]] --[[ Name: copyWithRename ]]
        -- upvalues: l_console_0 (copy), v161 (copy)
        if #v169 ~= #v170 then
            l_console_0.warn("copyWithRename() expects paths of the same length");
            return nil;
        else
            for v171 = 1, #v170 do
                if v169[v171] ~= v170[v171] then
                    l_console_0.warn("copyWithRename() expects paths to be the same except for the deepest key");
                    return nil;
                end;
            end;
            return (v161(v168, v169, v170, 0));
        end;
    end;
    local function v173(v174, v175, v176, v177) --[[ Line: 635 ]] --[[ Name: copyWithSetImpl ]]
        -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v173 (copy)
        if #v175 <= v176 then
            return v177;
        else
            local v178 = v175[v176];
            local v179 = nil;
            v179 = if l_Array_0.isArray(v174) then l_Array_0.slice(v174) else l_Object_0.assign({}, v174);
            v179[v178] = v173(v174[v178], v175, v176 + 1, v177);
            return v179;
        end;
    end;
    local function _(v180, v181, v182) --[[ Line: 657 ]] --[[ Name: copyWithSet ]]
        -- upvalues: v173 (copy)
        return (v173(v180, v181, 0, v182));
    end;
    local function _(v184, v185) --[[ Line: 665 ]] --[[ Name: findHook ]]
        local l_memoizedState_3 = v184.memoizedState;
        while l_memoizedState_3 ~= nil and v185 > 0 do
            l_memoizedState_3 = l_memoizedState_3.next;
            v185 = v185 - 1;
        end;
        return l_memoizedState_3;
    end;
    v144 = function(v188, v189, v190, v191) --[[ Line: 677 ]]
        -- upvalues: v173 (copy), l_Object_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_v189_0 = v189;
        local l_memoizedState_4 = v188.memoizedState;
        while l_memoizedState_4 ~= nil and l_v189_0 > 0 do
            l_memoizedState_4 = l_memoizedState_4.next;
            l_v189_0 = l_v189_0 - 1;
        end;
        local l_l_memoizedState_4_0 = l_memoizedState_4;
        if l_l_memoizedState_4_0 ~= nil then
            l_memoizedState_4 = l_l_memoizedState_4_0.memoizedState;
            l_v189_0 = v173(l_memoizedState_4, v190, 0, v191);
            l_l_memoizedState_4_0.memoizedState = l_v189_0;
            l_l_memoizedState_4_0.baseState = l_v189_0;
            v188.memoizedProps = l_Object_0.assign({}, v188.memoizedProps);
            l_scheduleUpdateOnFiber_0(v188, l_SyncLane_0, l_NoTimestamp_0);
        end;
    end;
    v145 = function(v195, v196, v197) --[[ Line: 699 ]]
        -- upvalues: v152 (copy), l_Object_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_v196_0 = v196;
        local l_memoizedState_5 = v195.memoizedState;
        while l_memoizedState_5 ~= nil and l_v196_0 > 0 do
            l_memoizedState_5 = l_memoizedState_5.next;
            l_v196_0 = l_v196_0 - 1;
        end;
        local l_l_memoizedState_5_0 = l_memoizedState_5;
        if l_l_memoizedState_5_0 ~= nil then
            l_memoizedState_5 = l_l_memoizedState_5_0.memoizedState;
            l_v196_0 = v152(l_memoizedState_5, v197, 0);
            l_l_memoizedState_5_0.memoizedState = l_v196_0;
            l_l_memoizedState_5_0.baseState = l_v196_0;
            v195.memoizedProps = l_Object_0.assign({}, v195.memoizedProps);
            l_scheduleUpdateOnFiber_0(v195, l_SyncLane_0, l_NoTimestamp_0);
        end;
    end;
    v146 = function(v201, v202, v203, v204) --[[ Line: 720 ]]
        -- upvalues: v172 (copy), l_Object_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_v202_0 = v202;
        local l_memoizedState_6 = v201.memoizedState;
        while l_memoizedState_6 ~= nil and l_v202_0 > 0 do
            l_memoizedState_6 = l_memoizedState_6.next;
            l_v202_0 = l_v202_0 - 1;
        end;
        local l_l_memoizedState_6_0 = l_memoizedState_6;
        if l_l_memoizedState_6_0 ~= nil then
            l_v202_0 = v172(l_l_memoizedState_6_0.memoizedState, v203, v204);
            l_l_memoizedState_6_0.memoizedState = l_v202_0;
            l_l_memoizedState_6_0.baseState = l_v202_0;
            v201.memoizedProps = l_Object_0.assign({}, v201.memoizedProps);
            l_scheduleUpdateOnFiber_0(v201, l_SyncLane_0, l_NoTimestamp_0);
        end;
    end;
    v147 = function(v208, v209, v210) --[[ Line: 744 ]]
        -- upvalues: v173 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_memoizedProps_0 = v208.memoizedProps;
        v208.pendingProps = v173(l_memoizedProps_0, v209, 0, v210);
        local l_alternate_0 = v208.alternate;
        if l_alternate_0 then
            l_alternate_0.pendingProps = v208.pendingProps;
        end;
        l_scheduleUpdateOnFiber_0(v208, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v148 = function(v213, v214) --[[ Line: 753 ]]
        -- upvalues: v152 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_memoizedProps_1 = v213.memoizedProps;
        v213.pendingProps = v152(l_memoizedProps_1, v214, 0);
        local l_alternate_1 = v213.alternate;
        if l_alternate_1 then
            l_alternate_1.pendingProps = v213.pendingProps;
        end;
        l_scheduleUpdateOnFiber_0(v213, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v149 = function(v217, v218, v219) --[[ Line: 762 ]]
        -- upvalues: v172 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        v217.pendingProps = v172(v217.memoizedProps, v218, v219);
        local l_alternate_2 = v217.alternate;
        if l_alternate_2 then
            l_alternate_2.pendingProps = v217.pendingProps;
        end;
        l_scheduleUpdateOnFiber_0(v217, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v150 = function(v221) --[[ Line: 776 ]]
        -- upvalues: l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        l_scheduleUpdateOnFiber_0(v221, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v151 = function(v222) --[[ Line: 780 ]]
        -- upvalues: v142 (ref)
        v142 = v222;
    end;
end;
findHostInstanceByFiber = function(v223) --[[ Line: 785 ]] --[[ Name: findHostInstanceByFiber ]]
    -- upvalues: l_findCurrentHostFiber_0 (copy)
    local v224 = l_findCurrentHostFiber_0(v223);
    if v224 == nil then
        return nil;
    else
        return v224.stateNode;
    end;
end;
emptyFindFiberByHostInstance = function(_) --[[ Line: 793 ]] --[[ Name: emptyFindFiberByHostInstance ]]
    return nil;
end;
getCurrentFiberForDevTools = function() --[[ Line: 799 ]] --[[ Name: getCurrentFiberForDevTools ]]
    -- upvalues: v57 (copy)
    return v57.current;
end;
v72.injectIntoDevTools = function(v226) --[[ Line: 803 ]]
    -- upvalues: l_ReactSharedInternals_0 (copy), l_injectInternals_0 (copy), v144 (ref), v145 (ref), v146 (ref), v147 (ref), v148 (ref), v149 (ref), v151 (ref), v150 (ref)
    local l_findFiberByHostInstance_0 = v226.findFiberByHostInstance;
    local l_ReactCurrentDispatcher_0 = l_ReactSharedInternals_0.ReactCurrentDispatcher;
    local v229 = nil;
    if _G.__DEV__ then
        v229 = getCurrentFiberForDevTools;
    end;
    return l_injectInternals_0({
        bundleType = v226.bundleType, 
        version = v226.version, 
        rendererPackageName = v226.rendererPackageName, 
        rendererConfig = v226.rendererConfig, 
        overrideHookState = v144, 
        overrideHookStateDeletePath = v145, 
        overrideHookStateRenamePath = v146, 
        overrideProps = v147, 
        overridePropsDeletePath = v148, 
        overridePropsRenamePath = v149, 
        setSuspenseHandler = v151, 
        scheduleUpdate = v150, 
        currentDispatcherRef = l_ReactCurrentDispatcher_0, 
        findHostInstanceByFiber = findHostInstanceByFiber, 
        findFiberByHostInstance = l_findFiberByHostInstance_0 or emptyFindFiberByHostInstance, 
        getCurrentFiber = v229
    });
end;
return v72;