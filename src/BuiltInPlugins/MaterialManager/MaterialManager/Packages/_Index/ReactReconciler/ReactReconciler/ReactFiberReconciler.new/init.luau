local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Shared);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v7 = require(script.Parent.ReactRootTags);
local v8 = require(script.Parent.ReactFiberFlags);
local _ = require(script.Parent.ReactFiberHostConfig);
local v10 = require(script.Parent.ReactWorkTags);
local l_FundamentalComponent_0 = v10.FundamentalComponent;
local _ = require(l_Parent_0.Shared);
local v13 = require(script.Parent.ReactFiberLane);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v15 = require(script.Parent.ReactFiberTreeReflection);
local l_findCurrentHostFiber_0 = v15.findCurrentHostFiber;
local l_findCurrentHostFiberWithNoPortals_0 = v15.findCurrentHostFiberWithNoPortals;
local l_get_0 = require(l_Parent_0.Shared).ReactInstanceMap.get;
local l_HostComponent_0 = v10.HostComponent;
local l_ClassComponent_0 = v10.ClassComponent;
local l_HostRoot_0 = v10.HostRoot;
local l_SuspenseComponent_0 = v10.SuspenseComponent;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_enableSchedulingProfiler_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableSchedulingProfiler;
local l_ReactSharedInternals_0 = require(l_Parent_0.Shared).ReactSharedInternals;
local l_getPublicInstance_0 = require(script.Parent.ReactFiberHostConfig).getPublicInstance;
local v28 = require(script.Parent["ReactFiberContext.new"]);
local l_findCurrentUnmaskedContext_0 = v28.findCurrentUnmaskedContext;
local l_processChildContext_0 = v28.processChildContext;
local l_emptyContextObject_0 = v28.emptyContextObject;
local l_isContextProvider_0 = v28.isContextProvider;
local l_createFiberRoot_0 = require(script.Parent["ReactFiberRoot.new"]).createFiberRoot;
local v34 = require(script.Parent["ReactFiberDevToolsHook.new"]);
local l_injectInternals_0 = v34.injectInternals;
local l_onScheduleRoot_0 = v34.onScheduleRoot;
local v37 = require(script.Parent["ReactFiberWorkLoop.new"]);
local l_requestEventTime_0 = v37.requestEventTime;
local l_requestUpdateLane_0 = v37.requestUpdateLane;
local l_scheduleUpdateOnFiber_0 = v37.scheduleUpdateOnFiber;
local l_flushRoot_0 = v37.flushRoot;
local l_batchedEventUpdates_0 = v37.batchedEventUpdates;
local l_batchedUpdates_0 = v37.batchedUpdates;
local l_unbatchedUpdates_0 = v37.unbatchedUpdates;
local l_flushSync_0 = v37.flushSync;
local l_flushControlled_0 = v37.flushControlled;
local l_deferredUpdates_0 = v37.deferredUpdates;
local l_discreteUpdates_0 = v37.discreteUpdates;
local l_flushDiscreteUpdates_0 = v37.flushDiscreteUpdates;
local l_flushPassiveEffects_0 = v37.flushPassiveEffects;
local l_warnIfNotScopedWithMatchingAct_0 = v37.warnIfNotScopedWithMatchingAct;
local l_warnIfUnmockedScheduler_0 = v37.warnIfUnmockedScheduler;
local l_IsThisRendererActing_0 = v37.IsThisRendererActing;
local l_act_0 = v37.act;
local v55 = require(script.Parent["ReactUpdateQueue.new"]);
local l_createUpdate_0 = v55.createUpdate;
local l_enqueueUpdate_0 = v55.enqueueUpdate;
local v58 = require(script.Parent.ReactCurrentFiber);
local l_isRendering_0 = v58.isRendering;
local l_resetCurrentFiber_0 = v58.resetCurrentFiber;
local l_setCurrentFiber_0 = v58.setCurrentFiber;
local v62 = require(script.Parent.ReactTypeOfMode);
local l_StrictMode_0 = v62.StrictMode;
local l_SyncLane_0 = v13.SyncLane;
local l_InputDiscreteHydrationLane_0 = v13.InputDiscreteHydrationLane;
local l_SelectiveHydrationLane_0 = v13.SelectiveHydrationLane;
local l_NoTimestamp_0 = v13.NoTimestamp;
local l_getHighestPriorityPendingLanes_0 = v13.getHighestPriorityPendingLanes;
local l_higherPriorityLane_0 = v13.higherPriorityLane;
local l_getCurrentUpdateLanePriority_0 = v13.getCurrentUpdateLanePriority;
local l_setCurrentUpdateLanePriority_0 = v13.setCurrentUpdateLanePriority;
local l_markRenderScheduled_0 = require(script.Parent.SchedulingProfiler).markRenderScheduled;
local v73 = {
    ReactRootTags = v7, 
    ReactWorkTags = v10, 
    ReactTypeOfMode = v62, 
    ReactFiberFlags = v8, 
    getNearestMountedFiber = v15.getNearestMountedFiber, 
    findCurrentFiberUsingSlowPath = v15.findCurrentFiberUsingSlowPath, 
    createPortal = require(script.Parent.ReactPortal).createPortal
};
local v74 = nil;
local v75 = nil;
if _G.__DEV__ then
    v74 = false;
    v75 = {};
end;
local function _(v76) --[[ Line: 173 ]] --[[ Name: getContextForSubtree ]]
    -- upvalues: l_emptyContextObject_0 (copy), l_get_0 (copy), l_findCurrentUnmaskedContext_0 (copy), l_ClassComponent_0 (copy), l_isContextProvider_0 (copy), l_processChildContext_0 (copy)
    if not v76 then
        return l_emptyContextObject_0;
    else
        local v77 = l_get_0(v76);
        local v78 = l_findCurrentUnmaskedContext_0(v77);
        if v77.tag == l_ClassComponent_0 then
            local l_type_0 = v77.type;
            if l_isContextProvider_0(l_type_0) then
                return l_processChildContext_0(v77, l_type_0, v78);
            end;
        end;
        return v78;
    end;
end;
local function v84(v81) --[[ Line: 193 ]] --[[ Name: findHostInstance ]]
    -- upvalues: l_get_0 (copy), l_invariant_0 (copy), l_Object_0 (copy), l_findCurrentHostFiber_0 (copy)
    local v82 = l_get_0(v81);
    if v82 == nil then
        if typeof(v81.render) == "function" then
            l_invariant_0(false, "Unable to find node on an unmounted component.");
        else
            l_invariant_0(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(l_Object_0.keys(v81)));
        end;
    end;
    local v83 = l_findCurrentHostFiber_0(v82);
    if v83 == nil then
        return nil;
    else
        return v83.stateNode;
    end;
end;
local function v93(v85, v86) --[[ Line: 214 ]] --[[ Name: findHostInstanceWithWarning ]]
    -- upvalues: l_get_0 (copy), l_invariant_0 (copy), l_Object_0 (copy), l_findCurrentHostFiber_0 (copy), l_StrictMode_0 (copy), l_getComponentName_0 (copy), v75 (ref), v58 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_resetCurrentFiber_0 (copy), v84 (copy)
    if _G.__DEV__ then
        local v87 = l_get_0(v85);
        if v87 == nil then
            if typeof(v85.render) == "function" then
                l_invariant_0(false, "Unable to find node on an unmounted component.");
            else
                l_invariant_0(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(l_Object_0.keys(v85)));
            end;
        end;
        local v88 = l_findCurrentHostFiber_0(v87);
        if v88 == nil then
            return nil;
        else
            if bit32.band(v88.mode, l_StrictMode_0) ~= 0 then
                local v89 = l_getComponentName_0(v87.type) or "Component";
                if not v75[v89] then
                    v75[v89] = true;
                    local l_current_0 = v58.current;
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 242 ]]
                        -- upvalues: l_setCurrentFiber_0 (ref), v88 (copy), v87 (copy), l_StrictMode_0 (ref), l_console_0 (ref), v86 (copy), v89 (copy)
                        l_setCurrentFiber_0(v88);
                        if bit32.band(v87.mode, l_StrictMode_0) ~= 0 then
                            l_console_0.error("%s is deprecated in StrictMode. " .. "%s was passed an instance of %s which is inside StrictMode. " .. "Instead, add a ref directly to the element you want to reference. " .. "Learn more about using refs safely here: " .. "https://reactjs.org/link/strict-mode-find-node", v86, v86, v89);
                            return;
                        else
                            l_console_0.error("%s is deprecated in StrictMode. " .. "%s was passed an instance of %s which renders StrictMode children. " .. "Instead, add a ref directly to the element you want to reference. " .. "Learn more about using refs safely here: " .. "https://reactjs.org/link/strict-mode-find-node", v86, v86, v89);
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
            return v88.stateNode;
        end;
    else
        return (v84(v85));
    end;
end;
v73.createContainer = function(v94, v95, v96, v97) --[[ Line: 287 ]]
    -- upvalues: l_createFiberRoot_0 (copy)
    return l_createFiberRoot_0(v94, v95, v96, v97);
end;
v73.updateContainer = function(v98, v99, v100, v101) --[[ Line: 296 ]]
    -- upvalues: l_onScheduleRoot_0 (copy), l_requestEventTime_0 (copy), l_warnIfUnmockedScheduler_0 (copy), l_warnIfNotScopedWithMatchingAct_0 (copy), l_requestUpdateLane_0 (copy), l_enableSchedulingProfiler_0 (copy), l_markRenderScheduled_0 (copy), l_emptyContextObject_0 (copy), l_get_0 (copy), l_findCurrentUnmaskedContext_0 (copy), l_ClassComponent_0 (copy), l_isContextProvider_0 (copy), l_processChildContext_0 (copy), l_isRendering_0 (copy), v58 (copy), v74 (ref), l_console_0 (copy), l_getComponentName_0 (copy), l_createUpdate_0 (copy), l_Object_0 (copy), l_enqueueUpdate_0 (copy), l_scheduleUpdateOnFiber_0 (copy)
    local v102 = false;
    if _G.__DEV__ then
        l_onScheduleRoot_0(v99, v98);
    end;
    local l_current_1 = v99.current;
    local v104 = l_requestEventTime_0();
    if _G.__DEV__ and _G.__TESTEZ_RUNNING_TEST__ then
        l_warnIfUnmockedScheduler_0(l_current_1);
        l_warnIfNotScopedWithMatchingAct_0(l_current_1);
    end;
    local v105 = l_requestUpdateLane_0(l_current_1);
    if l_enableSchedulingProfiler_0 then
        l_markRenderScheduled_0(v105);
    end;
    local v106;
    if not v100 then
        v106 = l_emptyContextObject_0;
    else
        local v107 = l_get_0(v100);
        local v108 = l_findCurrentUnmaskedContext_0(v107);
        if v107.tag == l_ClassComponent_0 then
            local l_type_1 = v107.type;
            if l_isContextProvider_0(l_type_1) then
                v106 = l_processChildContext_0(v107, l_type_1, v108);
                v102 = true;
            end;
        end;
        if not v102 then
            v106 = v108;
        end;
    end;
    v102 = false;
    if v99.context == nil then
        v99.context = v106;
    else
        v99.pendingContext = v106;
    end;
    if _G.__DEV__ and l_isRendering_0 and v58.current ~= nil and not v74 then
        v74 = true;
        l_console_0.error("Render methods should be a pure function of props and state; " .. "triggering nested component updates from render is not allowed. " .. "If necessary, trigger nested updates in componentDidUpdate.\n\n" .. "Check the render method of %s.", l_getComponentName_0(v58.current.type) or "Unknown");
    end;
    local v110 = l_createUpdate_0(v104, v105);
    if v98 == nil then
        v98 = l_Object_0.None;
    end;
    v110.payload = {
        element = v98
    };
    if v101 ~= nil then
        if _G.__DEV__ and typeof(v101) ~= "function" then
            l_console_0.error("render(...): Expected the last optional `callback` argument to be a " .. "function. Instead received: %s.", (tostring(v101)));
        end;
        v110.callback = v101;
    end;
    l_enqueueUpdate_0(l_current_1, v110);
    l_scheduleUpdateOnFiber_0(l_current_1, v105, v104);
    return v105;
end;
v73.batchedEventUpdates = l_batchedEventUpdates_0;
v73.batchedUpdates = l_batchedUpdates_0;
v73.unbatchedUpdates = l_unbatchedUpdates_0;
v73.deferredUpdates = l_deferredUpdates_0;
v73.discreteUpdates = l_discreteUpdates_0;
v73.flushDiscreteUpdates = l_flushDiscreteUpdates_0;
v73.flushControlled = l_flushControlled_0;
v73.flushSync = l_flushSync_0;
v73.flushPassiveEffects = l_flushPassiveEffects_0;
v73.IsThisRendererActing = l_IsThisRendererActing_0;
v73.act = l_act_0;
v73.getPublicRootInstance = function(v111) --[[ Line: 391 ]]
    -- upvalues: l_HostComponent_0 (copy), l_getPublicInstance_0 (copy)
    local l_current_2 = v111.current;
    if not l_current_2.child then
        return nil;
    elseif l_current_2.child.tag == l_HostComponent_0 then
        return l_getPublicInstance_0(l_current_2.child.stateNode);
    else
        return l_current_2.child.stateNode;
    end;
end;
local v113 = nil;
v73.attemptSynchronousHydration = function(v114) --[[ Line: 408 ]]
    -- upvalues: l_HostRoot_0 (copy), l_getHighestPriorityPendingLanes_0 (copy), l_flushRoot_0 (copy), l_SuspenseComponent_0 (copy), l_requestEventTime_0 (copy), l_flushSync_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_InputDiscreteHydrationLane_0 (copy), v113 (ref)
    if v114.tag == l_HostRoot_0 then
        local l_stateNode_0 = v114.stateNode;
        if l_stateNode_0.hydrate then
            local v116 = l_getHighestPriorityPendingLanes_0(l_stateNode_0);
            l_flushRoot_0(l_stateNode_0, v116);
            return;
        end;
    elseif v114.tag == l_SuspenseComponent_0 then
        local v117 = l_requestEventTime_0();
        l_flushSync_0(function() --[[ Line: 418 ]]
            -- upvalues: l_scheduleUpdateOnFiber_0 (ref), v114 (copy), l_SyncLane_0 (ref), v117 (copy)
            return l_scheduleUpdateOnFiber_0(v114, l_SyncLane_0, v117);
        end);
        v113(v114, l_InputDiscreteHydrationLane_0);
    end;
end;
local function _(v118, v119) --[[ Line: 429 ]] --[[ Name: markRetryLaneImpl ]]
    -- upvalues: l_higherPriorityLane_0 (copy)
    local l_memoizedState_0 = v118.memoizedState;
    if l_memoizedState_0 and l_memoizedState_0 ~= nil and l_memoizedState_0.dehydrated ~= nil then
        l_memoizedState_0.retryLane = l_higherPriorityLane_0(l_memoizedState_0.retryLane, v119);
    end;
end;
v113 = function(v122, v123) --[[ Line: 442 ]]
    -- upvalues: l_higherPriorityLane_0 (copy)
    local l_memoizedState_1 = v122.memoizedState;
    if l_memoizedState_1 and l_memoizedState_1 ~= nil and l_memoizedState_1.dehydrated ~= nil then
        l_memoizedState_1.retryLane = l_higherPriorityLane_0(l_memoizedState_1.retryLane, v123);
    end;
    l_memoizedState_1 = v122.alternate;
    if l_memoizedState_1 then
        local l_memoizedState_2 = l_memoizedState_1.memoizedState;
        if l_memoizedState_2 and l_memoizedState_2 ~= nil and l_memoizedState_2.dehydrated ~= nil then
            l_memoizedState_2.retryLane = l_higherPriorityLane_0(l_memoizedState_2.retryLane, v123);
        end;
    end;
end;
v73.attemptUserBlockingHydration = function(v126) --[[ Line: 451 ]]
    -- upvalues: l_SuspenseComponent_0 (copy), l_requestEventTime_0 (copy), l_InputDiscreteHydrationLane_0 (copy), l_scheduleUpdateOnFiber_0 (copy), v113 (ref)
    if v126.tag ~= l_SuspenseComponent_0 then
        return;
    else
        local v127 = l_requestEventTime_0();
        local l_l_InputDiscreteHydrationLane_0_0 = l_InputDiscreteHydrationLane_0;
        l_scheduleUpdateOnFiber_0(v126, l_l_InputDiscreteHydrationLane_0_0, v127);
        v113(v126, l_l_InputDiscreteHydrationLane_0_0);
        return;
    end;
end;
v73.attemptContinuousHydration = function(v129) --[[ Line: 465 ]]
    -- upvalues: l_SuspenseComponent_0 (copy), l_requestEventTime_0 (copy), l_SelectiveHydrationLane_0 (copy), l_scheduleUpdateOnFiber_0 (copy), v113 (ref)
    if v129.tag ~= l_SuspenseComponent_0 then
        return;
    else
        local v130 = l_requestEventTime_0();
        local l_l_SelectiveHydrationLane_0_0 = l_SelectiveHydrationLane_0;
        l_scheduleUpdateOnFiber_0(v129, l_l_SelectiveHydrationLane_0_0, v130);
        v113(v129, l_l_SelectiveHydrationLane_0_0);
        return;
    end;
end;
v73.attemptHydrationAtCurrentPriority = function(v132) --[[ Line: 479 ]]
    -- upvalues: l_SuspenseComponent_0 (copy), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), l_scheduleUpdateOnFiber_0 (copy), v113 (ref)
    if v132.tag ~= l_SuspenseComponent_0 then
        return;
    else
        local v133 = l_requestEventTime_0();
        local v134 = l_requestUpdateLane_0(v132);
        l_scheduleUpdateOnFiber_0(v132, v134, v133);
        v113(v132, v134);
        return;
    end;
end;
v73.runWithPriority = function(v135, v136) --[[ Line: 491 ]]
    -- upvalues: l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy)
    local v137 = l_getCurrentUpdateLanePriority_0();
    l_setCurrentUpdateLanePriority_0(v135);
    local l_status_1, l_result_1 = pcall(v136);
    l_setCurrentUpdateLanePriority_0(v137);
    if not l_status_1 then
        error(l_result_1);
    end;
    return l_result_1;
end;
v73.getCurrentUpdateLanePriority = l_getCurrentUpdateLanePriority_0;
v73.findHostInstance = v84;
v73.findHostInstanceWithWarning = v93;
v73.findHostInstanceWithNoPortals = function(v140) --[[ Line: 509 ]]
    -- upvalues: l_findCurrentHostFiberWithNoPortals_0 (copy), l_FundamentalComponent_0 (copy)
    local v141 = l_findCurrentHostFiberWithNoPortals_0(v140);
    if v141 == nil then
        return nil;
    elseif v141.tag == l_FundamentalComponent_0 then
        return v141.stateNode.instance;
    else
        return v141.stateNode;
    end;
end;
local function v143(_) --[[ Line: 522 ]] --[[ Name: shouldSuspendImpl ]]
    return false;
end;
v73.shouldSuspend = function(v144) --[[ Line: 526 ]]
    -- upvalues: v143 (ref)
    return v143(v144);
end;
local v145 = nil;
local v146 = nil;
local v147 = nil;
local v148 = nil;
local v149 = nil;
local v150 = nil;
local v151 = nil;
local v152 = nil;
if _G.__DEV__ then
    local function v153(v154, v155, v156) --[[ Line: 541 ]] --[[ Name: copyWithDeleteImpl ]]
        -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v153 (copy)
        local v157 = v155[v156];
        local v158 = nil;
        v158 = if l_Array_0.isArray(v154) then l_Array_0.slice(v154) else l_Object_0.assign({}, v154);
        if v156 + 1 == #v155 then
            if l_Array_0.isArray(v158) then
                l_Array_0.splice(v158, v157, 1);
                return v158;
            else
                v158[v157] = nil;
                return v158;
            end;
        else
            v158[v157] = v153(v154[v157], v155, v156 + 1);
            return v158;
        end;
    end;
    local function _(v159, v160) --[[ Line: 569 ]] --[[ Name: copyWithDelete ]]
        -- upvalues: v153 (copy)
        return (v153(v159, v160, 0));
    end;
    local function v162(v163, v164, v165, v166) --[[ Line: 577 ]] --[[ Name: copyWithRenameImpl ]]
        -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v162 (copy)
        local v167 = v164[v166];
        local v168 = nil;
        v168 = if l_Array_0.isArray(v163) then l_Array_0.slice(v163) else l_Object_0.assign({}, v163);
        if v166 + 1 == #v164 then
            v168[v165[v166]] = v168[v167];
            if l_Array_0.isArray(v168) then
                l_Array_0.splice(v168, v167, 1);
                return v168;
            else
                v168[v167] = nil;
                return v168;
            end;
        else
            v168[v167] = v162(v163[v167], v164, v165, v166 + 1);
            return v168;
        end;
    end;
    local function v173(v169, v170, v171) --[[ Line: 613 ]] --[[ Name: copyWithRename ]]
        -- upvalues: l_console_0 (copy), v162 (copy)
        if #v170 ~= #v171 then
            l_console_0.warn("copyWithRename() expects paths of the same length");
            return nil;
        else
            for v172 = 1, #v171 do
                if v170[v172] ~= v171[v172] then
                    l_console_0.warn("copyWithRename() expects paths to be the same except for the deepest key");
                    return nil;
                end;
            end;
            return (v162(v169, v170, v171, 0));
        end;
    end;
    local function v174(v175, v176, v177, v178) --[[ Line: 635 ]] --[[ Name: copyWithSetImpl ]]
        -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v174 (copy)
        if #v176 <= v177 then
            return v178;
        else
            local v179 = v176[v177];
            local v180 = nil;
            v180 = if l_Array_0.isArray(v175) then l_Array_0.slice(v175) else l_Object_0.assign({}, v175);
            v180[v179] = v174(v175[v179], v176, v177 + 1, v178);
            return v180;
        end;
    end;
    local function _(v181, v182, v183) --[[ Line: 657 ]] --[[ Name: copyWithSet ]]
        -- upvalues: v174 (copy)
        return (v174(v181, v182, 0, v183));
    end;
    local function _(v185, v186) --[[ Line: 665 ]] --[[ Name: findHook ]]
        local l_memoizedState_3 = v185.memoizedState;
        while l_memoizedState_3 ~= nil and v186 > 0 do
            l_memoizedState_3 = l_memoizedState_3.next;
            v186 = v186 - 1;
        end;
        return l_memoizedState_3;
    end;
    v145 = function(v189, v190, v191, v192) --[[ Line: 677 ]]
        -- upvalues: v174 (copy), l_Object_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_v190_0 = v190;
        local l_memoizedState_4 = v189.memoizedState;
        while l_memoizedState_4 ~= nil and l_v190_0 > 0 do
            l_memoizedState_4 = l_memoizedState_4.next;
            l_v190_0 = l_v190_0 - 1;
        end;
        local l_l_memoizedState_4_0 = l_memoizedState_4;
        if l_l_memoizedState_4_0 ~= nil then
            l_memoizedState_4 = l_l_memoizedState_4_0.memoizedState;
            l_v190_0 = v174(l_memoizedState_4, v191, 0, v192);
            l_l_memoizedState_4_0.memoizedState = l_v190_0;
            l_l_memoizedState_4_0.baseState = l_v190_0;
            v189.memoizedProps = l_Object_0.assign({}, v189.memoizedProps);
            l_scheduleUpdateOnFiber_0(v189, l_SyncLane_0, l_NoTimestamp_0);
        end;
    end;
    v146 = function(v196, v197, v198) --[[ Line: 699 ]]
        -- upvalues: v153 (copy), l_Object_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_v197_0 = v197;
        local l_memoizedState_5 = v196.memoizedState;
        while l_memoizedState_5 ~= nil and l_v197_0 > 0 do
            l_memoizedState_5 = l_memoizedState_5.next;
            l_v197_0 = l_v197_0 - 1;
        end;
        local l_l_memoizedState_5_0 = l_memoizedState_5;
        if l_l_memoizedState_5_0 ~= nil then
            l_memoizedState_5 = l_l_memoizedState_5_0.memoizedState;
            l_v197_0 = v153(l_memoizedState_5, v198, 0);
            l_l_memoizedState_5_0.memoizedState = l_v197_0;
            l_l_memoizedState_5_0.baseState = l_v197_0;
            v196.memoizedProps = l_Object_0.assign({}, v196.memoizedProps);
            l_scheduleUpdateOnFiber_0(v196, l_SyncLane_0, l_NoTimestamp_0);
        end;
    end;
    v147 = function(v202, v203, v204, v205) --[[ Line: 720 ]]
        -- upvalues: v173 (copy), l_Object_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_v203_0 = v203;
        local l_memoizedState_6 = v202.memoizedState;
        while l_memoizedState_6 ~= nil and l_v203_0 > 0 do
            l_memoizedState_6 = l_memoizedState_6.next;
            l_v203_0 = l_v203_0 - 1;
        end;
        local l_l_memoizedState_6_0 = l_memoizedState_6;
        if l_l_memoizedState_6_0 ~= nil then
            l_v203_0 = v173(l_l_memoizedState_6_0.memoizedState, v204, v205);
            l_l_memoizedState_6_0.memoizedState = l_v203_0;
            l_l_memoizedState_6_0.baseState = l_v203_0;
            v202.memoizedProps = l_Object_0.assign({}, v202.memoizedProps);
            l_scheduleUpdateOnFiber_0(v202, l_SyncLane_0, l_NoTimestamp_0);
        end;
    end;
    v148 = function(v209, v210, v211) --[[ Line: 744 ]]
        -- upvalues: v174 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_memoizedProps_0 = v209.memoizedProps;
        v209.pendingProps = v174(l_memoizedProps_0, v210, 0, v211);
        local l_alternate_0 = v209.alternate;
        if l_alternate_0 then
            l_alternate_0.pendingProps = v209.pendingProps;
        end;
        l_scheduleUpdateOnFiber_0(v209, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v149 = function(v214, v215) --[[ Line: 753 ]]
        -- upvalues: v153 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_memoizedProps_1 = v214.memoizedProps;
        v214.pendingProps = v153(l_memoizedProps_1, v215, 0);
        local l_alternate_1 = v214.alternate;
        if l_alternate_1 then
            l_alternate_1.pendingProps = v214.pendingProps;
        end;
        l_scheduleUpdateOnFiber_0(v214, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v150 = function(v218, v219, v220) --[[ Line: 762 ]]
        -- upvalues: v173 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        v218.pendingProps = v173(v218.memoizedProps, v219, v220);
        local l_alternate_2 = v218.alternate;
        if l_alternate_2 then
            l_alternate_2.pendingProps = v218.pendingProps;
        end;
        l_scheduleUpdateOnFiber_0(v218, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v151 = function(v222) --[[ Line: 776 ]]
        -- upvalues: l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        l_scheduleUpdateOnFiber_0(v222, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v152 = function(v223) --[[ Line: 780 ]]
        -- upvalues: v143 (ref)
        v143 = v223;
    end;
end;
findHostInstanceByFiber = function(v224) --[[ Line: 785 ]] --[[ Name: findHostInstanceByFiber ]]
    -- upvalues: l_findCurrentHostFiber_0 (copy)
    local v225 = l_findCurrentHostFiber_0(v224);
    if v225 == nil then
        return nil;
    else
        return v225.stateNode;
    end;
end;
emptyFindFiberByHostInstance = function(_) --[[ Line: 793 ]] --[[ Name: emptyFindFiberByHostInstance ]]
    return nil;
end;
getCurrentFiberForDevTools = function() --[[ Line: 799 ]] --[[ Name: getCurrentFiberForDevTools ]]
    -- upvalues: v58 (copy)
    return v58.current;
end;
v73.injectIntoDevTools = function(v227) --[[ Line: 803 ]]
    -- upvalues: l_ReactSharedInternals_0 (copy), l_injectInternals_0 (copy), v145 (ref), v146 (ref), v147 (ref), v148 (ref), v149 (ref), v150 (ref), v152 (ref), v151 (ref)
    local l_findFiberByHostInstance_0 = v227.findFiberByHostInstance;
    local l_ReactCurrentDispatcher_0 = l_ReactSharedInternals_0.ReactCurrentDispatcher;
    local v230 = nil;
    if _G.__DEV__ then
        v230 = getCurrentFiberForDevTools;
    end;
    return l_injectInternals_0({
        bundleType = v227.bundleType, 
        version = v227.version, 
        rendererPackageName = v227.rendererPackageName, 
        rendererConfig = v227.rendererConfig, 
        overrideHookState = v145, 
        overrideHookStateDeletePath = v146, 
        overrideHookStateRenamePath = v147, 
        overrideProps = v148, 
        overridePropsDeletePath = v149, 
        overridePropsRenamePath = v150, 
        setSuspenseHandler = v152, 
        scheduleUpdate = v151, 
        currentDispatcherRef = l_ReactCurrentDispatcher_0, 
        findHostInstanceByFiber = findHostInstanceByFiber, 
        findFiberByHostInstance = l_findFiberByHostInstance_0 or emptyFindFiberByHostInstance, 
        getCurrentFiber = v230
    });
end;
return v73;