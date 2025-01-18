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
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local l_enableSchedulingProfiler_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableSchedulingProfiler;
local l_ReactSharedInternals_0 = require(l_Parent_0.Shared).ReactSharedInternals;
local l_getPublicInstance_0 = require(script.Parent.ReactFiberHostConfig).getPublicInstance;
local v29 = require(script.Parent["ReactFiberContext.new"]);
local l_findCurrentUnmaskedContext_0 = v29.findCurrentUnmaskedContext;
local l_processChildContext_0 = v29.processChildContext;
local l_emptyContextObject_0 = v29.emptyContextObject;
local l_isContextProvider_0 = v29.isContextProvider;
local l_createFiberRoot_0 = require(script.Parent["ReactFiberRoot.new"]).createFiberRoot;
local v35 = require(script.Parent["ReactFiberDevToolsHook.new"]);
local l_injectInternals_0 = v35.injectInternals;
local l_onScheduleRoot_0 = v35.onScheduleRoot;
local v38 = require(script.Parent["ReactFiberWorkLoop.new"]);
local l_requestEventTime_0 = v38.requestEventTime;
local l_requestUpdateLane_0 = v38.requestUpdateLane;
local l_scheduleUpdateOnFiber_0 = v38.scheduleUpdateOnFiber;
local l_flushRoot_0 = v38.flushRoot;
local l_batchedEventUpdates_0 = v38.batchedEventUpdates;
local l_batchedUpdates_0 = v38.batchedUpdates;
local l_unbatchedUpdates_0 = v38.unbatchedUpdates;
local l_flushSync_0 = v38.flushSync;
local l_flushControlled_0 = v38.flushControlled;
local l_deferredUpdates_0 = v38.deferredUpdates;
local l_discreteUpdates_0 = v38.discreteUpdates;
local l_flushDiscreteUpdates_0 = v38.flushDiscreteUpdates;
local l_flushPassiveEffects_0 = v38.flushPassiveEffects;
local l_warnIfNotScopedWithMatchingAct_0 = v38.warnIfNotScopedWithMatchingAct;
local l_warnIfUnmockedScheduler_0 = v38.warnIfUnmockedScheduler;
local l_IsThisRendererActing_0 = v38.IsThisRendererActing;
local l_act_0 = v38.act;
local v56 = require(script.Parent["ReactUpdateQueue.new"]);
local l_createUpdate_0 = v56.createUpdate;
local l_enqueueUpdate_0 = v56.enqueueUpdate;
local v59 = require(script.Parent.ReactCurrentFiber);
local l_isRendering_0 = v59.isRendering;
local l_resetCurrentFiber_0 = v59.resetCurrentFiber;
local l_setCurrentFiber_0 = v59.setCurrentFiber;
local v63 = require(script.Parent.ReactTypeOfMode);
local l_StrictMode_0 = v63.StrictMode;
local l_SyncLane_0 = v13.SyncLane;
local l_InputDiscreteHydrationLane_0 = v13.InputDiscreteHydrationLane;
local l_SelectiveHydrationLane_0 = v13.SelectiveHydrationLane;
local l_NoTimestamp_0 = v13.NoTimestamp;
local l_getHighestPriorityPendingLanes_0 = v13.getHighestPriorityPendingLanes;
local l_higherPriorityLane_0 = v13.higherPriorityLane;
local l_getCurrentUpdateLanePriority_0 = v13.getCurrentUpdateLanePriority;
local l_setCurrentUpdateLanePriority_0 = v13.setCurrentUpdateLanePriority;
local l_markRenderScheduled_0 = require(script.Parent.SchedulingProfiler).markRenderScheduled;
local v74 = {
    ReactRootTags = v7, 
    ReactWorkTags = v10, 
    ReactTypeOfMode = v63, 
    ReactFiberFlags = v8, 
    getNearestMountedFiber = v15.getNearestMountedFiber, 
    findCurrentFiberUsingSlowPath = v15.findCurrentFiberUsingSlowPath, 
    createPortal = require(script.Parent.ReactPortal).createPortal
};
local v75 = nil;
local v76 = nil;
if _G.__DEV__ then
    v75 = false;
    v76 = {};
end;
local function _(v77) --[[ Line: 174 ]] --[[ Name: getContextForSubtree ]]
    -- upvalues: l_emptyContextObject_0 (copy), l_get_0 (copy), l_findCurrentUnmaskedContext_0 (copy), l_ClassComponent_0 (copy), l_isContextProvider_0 (copy), l_processChildContext_0 (copy)
    if not v77 then
        return l_emptyContextObject_0;
    else
        local v78 = l_get_0(v77);
        local v79 = l_findCurrentUnmaskedContext_0(v78);
        if v78.tag == l_ClassComponent_0 then
            local l_type_0 = v78.type;
            if l_isContextProvider_0(l_type_0) then
                return l_processChildContext_0(v78, l_type_0, v79);
            end;
        end;
        return v79;
    end;
end;
local function v85(v82) --[[ Line: 194 ]] --[[ Name: findHostInstance ]]
    -- upvalues: l_get_0 (copy), l_invariant_0 (copy), l_Object_0 (copy), l_findCurrentHostFiber_0 (copy)
    local v83 = l_get_0(v82);
    if v83 == nil then
        if typeof(v82.render) == "function" then
            l_invariant_0(false, "Unable to find node on an unmounted component.");
        else
            l_invariant_0(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(l_Object_0.keys(v82)));
        end;
    end;
    local v84 = l_findCurrentHostFiber_0(v83);
    if v84 == nil then
        return nil;
    else
        return v84.stateNode;
    end;
end;
local function v94(v86, v87) --[[ Line: 215 ]] --[[ Name: findHostInstanceWithWarning ]]
    -- upvalues: l_get_0 (copy), l_invariant_0 (copy), l_Object_0 (copy), l_findCurrentHostFiber_0 (copy), l_StrictMode_0 (copy), l_getComponentName_0 (copy), v76 (ref), v59 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_describeError_0 (copy), l_resetCurrentFiber_0 (copy), v85 (copy)
    if _G.__DEV__ then
        local v88 = l_get_0(v86);
        if v88 == nil then
            if typeof(v86.render) == "function" then
                l_invariant_0(false, "Unable to find node on an unmounted component.");
            else
                l_invariant_0(false, "Argument appears to not be a ReactComponent. Keys: %s", table.concat(l_Object_0.keys(v86)));
            end;
        end;
        local v89 = l_findCurrentHostFiber_0(v88);
        if v89 == nil then
            return nil;
        else
            if bit32.band(v89.mode, l_StrictMode_0) ~= 0 then
                local v90 = l_getComponentName_0(v88.type) or "Component";
                if not v76[v90] then
                    v76[v90] = true;
                    local l_current_0 = v59.current;
                    local v92, v93 = xpcall(function() --[[ Line: 243 ]]
                        -- upvalues: l_setCurrentFiber_0 (ref), v89 (copy), v88 (copy), l_StrictMode_0 (ref), l_console_0 (ref), v87 (copy), v90 (copy)
                        l_setCurrentFiber_0(v89);
                        if bit32.band(v88.mode, l_StrictMode_0) ~= 0 then
                            l_console_0.error("%s is deprecated in StrictMode. " .. "%s was passed an instance of %s which is inside StrictMode. " .. "Instead, add a ref directly to the element you want to reference. " .. "Learn more about using refs safely here: " .. "https://reactjs.org/link/strict-mode-find-node", v87, v87, v90);
                            return;
                        else
                            l_console_0.error("%s is deprecated in StrictMode. " .. "%s was passed an instance of %s which renders StrictMode children. " .. "Instead, add a ref directly to the element you want to reference. " .. "Learn more about using refs safely here: " .. "https://reactjs.org/link/strict-mode-find-node", v87, v87, v90);
                            return;
                        end;
                    end, l_describeError_0);
                    if l_current_0 then
                        l_setCurrentFiber_0(l_current_0);
                    else
                        l_resetCurrentFiber_0();
                    end;
                    if not v92 then
                        error(v93);
                    end;
                end;
            end;
            return v89.stateNode;
        end;
    else
        return (v85(v86));
    end;
end;
v74.createContainer = function(v95, v96, v97, v98) --[[ Line: 288 ]]
    -- upvalues: l_createFiberRoot_0 (copy)
    return l_createFiberRoot_0(v95, v96, v97, v98);
end;
v74.updateContainer = function(v99, v100, v101, v102) --[[ Line: 297 ]]
    -- upvalues: l_onScheduleRoot_0 (copy), l_requestEventTime_0 (copy), l_warnIfUnmockedScheduler_0 (copy), l_warnIfNotScopedWithMatchingAct_0 (copy), l_requestUpdateLane_0 (copy), l_enableSchedulingProfiler_0 (copy), l_markRenderScheduled_0 (copy), l_emptyContextObject_0 (copy), l_get_0 (copy), l_findCurrentUnmaskedContext_0 (copy), l_ClassComponent_0 (copy), l_isContextProvider_0 (copy), l_processChildContext_0 (copy), l_isRendering_0 (copy), v59 (copy), v75 (ref), l_console_0 (copy), l_getComponentName_0 (copy), l_createUpdate_0 (copy), l_Object_0 (copy), l_enqueueUpdate_0 (copy), l_scheduleUpdateOnFiber_0 (copy)
    local v103 = false;
    if _G.__DEV__ then
        l_onScheduleRoot_0(v100, v99);
    end;
    local l_current_1 = v100.current;
    local v105 = l_requestEventTime_0();
    if _G.__DEV__ and _G.__TESTEZ_RUNNING_TEST__ then
        l_warnIfUnmockedScheduler_0(l_current_1);
        l_warnIfNotScopedWithMatchingAct_0(l_current_1);
    end;
    local v106 = l_requestUpdateLane_0(l_current_1);
    if l_enableSchedulingProfiler_0 then
        l_markRenderScheduled_0(v106);
    end;
    local v107;
    if not v101 then
        v107 = l_emptyContextObject_0;
    else
        local v108 = l_get_0(v101);
        local v109 = l_findCurrentUnmaskedContext_0(v108);
        if v108.tag == l_ClassComponent_0 then
            local l_type_1 = v108.type;
            if l_isContextProvider_0(l_type_1) then
                v107 = l_processChildContext_0(v108, l_type_1, v109);
                v103 = true;
            end;
        end;
        if not v103 then
            v107 = v109;
        end;
    end;
    v103 = false;
    if v100.context == nil then
        v100.context = v107;
    else
        v100.pendingContext = v107;
    end;
    if _G.__DEV__ and l_isRendering_0 and v59.current ~= nil and not v75 then
        v75 = true;
        l_console_0.error("Render methods should be a pure function of props and state; " .. "triggering nested component updates from render is not allowed. " .. "If necessary, trigger nested updates in componentDidUpdate.\n\n" .. "Check the render method of %s.", l_getComponentName_0(v59.current.type) or "Unknown");
    end;
    local v111 = l_createUpdate_0(v105, v106);
    if v99 == nil then
        v99 = l_Object_0.None;
    end;
    v111.payload = {
        element = v99
    };
    if v102 ~= nil then
        if _G.__DEV__ and typeof(v102) ~= "function" then
            l_console_0.error("render(...): Expected the last optional `callback` argument to be a " .. "function. Instead received: %s.", (tostring(v102)));
        end;
        v111.callback = v102;
    end;
    l_enqueueUpdate_0(l_current_1, v111);
    l_scheduleUpdateOnFiber_0(l_current_1, v106, v105);
    return v106;
end;
v74.batchedEventUpdates = l_batchedEventUpdates_0;
v74.batchedUpdates = l_batchedUpdates_0;
v74.unbatchedUpdates = l_unbatchedUpdates_0;
v74.deferredUpdates = l_deferredUpdates_0;
v74.discreteUpdates = l_discreteUpdates_0;
v74.flushDiscreteUpdates = l_flushDiscreteUpdates_0;
v74.flushControlled = l_flushControlled_0;
v74.flushSync = l_flushSync_0;
v74.flushPassiveEffects = l_flushPassiveEffects_0;
v74.IsThisRendererActing = l_IsThisRendererActing_0;
v74.act = l_act_0;
v74.getPublicRootInstance = function(v112) --[[ Line: 392 ]]
    -- upvalues: l_HostComponent_0 (copy), l_getPublicInstance_0 (copy)
    local l_current_2 = v112.current;
    if not l_current_2.child then
        return nil;
    elseif l_current_2.child.tag == l_HostComponent_0 then
        return l_getPublicInstance_0(l_current_2.child.stateNode);
    else
        return l_current_2.child.stateNode;
    end;
end;
local v114 = nil;
v74.attemptSynchronousHydration = function(v115) --[[ Line: 409 ]]
    -- upvalues: l_HostRoot_0 (copy), l_getHighestPriorityPendingLanes_0 (copy), l_flushRoot_0 (copy), l_SuspenseComponent_0 (copy), l_requestEventTime_0 (copy), l_flushSync_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_InputDiscreteHydrationLane_0 (copy), v114 (ref)
    if v115.tag == l_HostRoot_0 then
        local l_stateNode_0 = v115.stateNode;
        if l_stateNode_0.hydrate then
            local v117 = l_getHighestPriorityPendingLanes_0(l_stateNode_0);
            l_flushRoot_0(l_stateNode_0, v117);
            return;
        end;
    elseif v115.tag == l_SuspenseComponent_0 then
        local v118 = l_requestEventTime_0();
        l_flushSync_0(function() --[[ Line: 419 ]]
            -- upvalues: l_scheduleUpdateOnFiber_0 (ref), v115 (copy), l_SyncLane_0 (ref), v118 (copy)
            return l_scheduleUpdateOnFiber_0(v115, l_SyncLane_0, v118);
        end);
        v114(v115, l_InputDiscreteHydrationLane_0);
    end;
end;
local function _(v119, v120) --[[ Line: 430 ]] --[[ Name: markRetryLaneImpl ]]
    -- upvalues: l_higherPriorityLane_0 (copy)
    local l_memoizedState_0 = v119.memoizedState;
    if l_memoizedState_0 and l_memoizedState_0 ~= nil and l_memoizedState_0.dehydrated ~= nil then
        l_memoizedState_0.retryLane = l_higherPriorityLane_0(l_memoizedState_0.retryLane, v120);
    end;
end;
v114 = function(v123, v124) --[[ Line: 443 ]]
    -- upvalues: l_higherPriorityLane_0 (copy)
    local l_memoizedState_1 = v123.memoizedState;
    if l_memoizedState_1 and l_memoizedState_1 ~= nil and l_memoizedState_1.dehydrated ~= nil then
        l_memoizedState_1.retryLane = l_higherPriorityLane_0(l_memoizedState_1.retryLane, v124);
    end;
    l_memoizedState_1 = v123.alternate;
    if l_memoizedState_1 then
        local l_memoizedState_2 = l_memoizedState_1.memoizedState;
        if l_memoizedState_2 and l_memoizedState_2 ~= nil and l_memoizedState_2.dehydrated ~= nil then
            l_memoizedState_2.retryLane = l_higherPriorityLane_0(l_memoizedState_2.retryLane, v124);
        end;
    end;
end;
v74.attemptUserBlockingHydration = function(v127) --[[ Line: 452 ]]
    -- upvalues: l_SuspenseComponent_0 (copy), l_requestEventTime_0 (copy), l_InputDiscreteHydrationLane_0 (copy), l_scheduleUpdateOnFiber_0 (copy), v114 (ref)
    if v127.tag ~= l_SuspenseComponent_0 then
        return;
    else
        local v128 = l_requestEventTime_0();
        local l_l_InputDiscreteHydrationLane_0_0 = l_InputDiscreteHydrationLane_0;
        l_scheduleUpdateOnFiber_0(v127, l_l_InputDiscreteHydrationLane_0_0, v128);
        v114(v127, l_l_InputDiscreteHydrationLane_0_0);
        return;
    end;
end;
v74.attemptContinuousHydration = function(v130) --[[ Line: 466 ]]
    -- upvalues: l_SuspenseComponent_0 (copy), l_requestEventTime_0 (copy), l_SelectiveHydrationLane_0 (copy), l_scheduleUpdateOnFiber_0 (copy), v114 (ref)
    if v130.tag ~= l_SuspenseComponent_0 then
        return;
    else
        local v131 = l_requestEventTime_0();
        local l_l_SelectiveHydrationLane_0_0 = l_SelectiveHydrationLane_0;
        l_scheduleUpdateOnFiber_0(v130, l_l_SelectiveHydrationLane_0_0, v131);
        v114(v130, l_l_SelectiveHydrationLane_0_0);
        return;
    end;
end;
v74.attemptHydrationAtCurrentPriority = function(v133) --[[ Line: 480 ]]
    -- upvalues: l_SuspenseComponent_0 (copy), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), l_scheduleUpdateOnFiber_0 (copy), v114 (ref)
    if v133.tag ~= l_SuspenseComponent_0 then
        return;
    else
        local v134 = l_requestEventTime_0();
        local v135 = l_requestUpdateLane_0(v133);
        l_scheduleUpdateOnFiber_0(v133, v135, v134);
        v114(v133, v135);
        return;
    end;
end;
v74.runWithPriority = function(v136, v137) --[[ Line: 492 ]]
    -- upvalues: l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), l_describeError_0 (copy)
    local v138 = l_getCurrentUpdateLanePriority_0();
    l_setCurrentUpdateLanePriority_0(v136);
    local v139, v140 = xpcall(v137, l_describeError_0);
    l_setCurrentUpdateLanePriority_0(v138);
    if not v139 then
        error(v140);
    end;
    return v140;
end;
v74.getCurrentUpdateLanePriority = l_getCurrentUpdateLanePriority_0;
v74.findHostInstance = v85;
v74.findHostInstanceWithWarning = v94;
v74.findHostInstanceWithNoPortals = function(v141) --[[ Line: 510 ]]
    -- upvalues: l_findCurrentHostFiberWithNoPortals_0 (copy), l_FundamentalComponent_0 (copy)
    local v142 = l_findCurrentHostFiberWithNoPortals_0(v141);
    if v142 == nil then
        return nil;
    elseif v142.tag == l_FundamentalComponent_0 then
        return v142.stateNode.instance;
    else
        return v142.stateNode;
    end;
end;
local function v144(_) --[[ Line: 523 ]] --[[ Name: shouldSuspendImpl ]]
    return false;
end;
v74.shouldSuspend = function(v145) --[[ Line: 527 ]]
    -- upvalues: v144 (ref)
    return v144(v145);
end;
local v146 = nil;
local v147 = nil;
local v148 = nil;
local v149 = nil;
local v150 = nil;
local v151 = nil;
local v152 = nil;
local v153 = nil;
if _G.__DEV__ then
    local function v154(v155, v156, v157) --[[ Line: 542 ]] --[[ Name: copyWithDeleteImpl ]]
        -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v154 (copy)
        local v158 = v156[v157];
        local v159 = nil;
        v159 = if l_Array_0.isArray(v155) then l_Array_0.slice(v155) else l_Object_0.assign({}, v155);
        if v157 + 1 == #v156 then
            if l_Array_0.isArray(v159) then
                l_Array_0.splice(v159, v158, 1);
                return v159;
            else
                v159[v158] = nil;
                return v159;
            end;
        else
            v159[v158] = v154(v155[v158], v156, v157 + 1);
            return v159;
        end;
    end;
    local function _(v160, v161) --[[ Line: 570 ]] --[[ Name: copyWithDelete ]]
        -- upvalues: v154 (copy)
        return (v154(v160, v161, 0));
    end;
    local function v163(v164, v165, v166, v167) --[[ Line: 578 ]] --[[ Name: copyWithRenameImpl ]]
        -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v163 (copy)
        local v168 = v165[v167];
        local v169 = nil;
        v169 = if l_Array_0.isArray(v164) then l_Array_0.slice(v164) else l_Object_0.assign({}, v164);
        if v167 + 1 == #v165 then
            v169[v166[v167]] = v169[v168];
            if l_Array_0.isArray(v169) then
                l_Array_0.splice(v169, v168, 1);
                return v169;
            else
                v169[v168] = nil;
                return v169;
            end;
        else
            v169[v168] = v163(v164[v168], v165, v166, v167 + 1);
            return v169;
        end;
    end;
    local function v174(v170, v171, v172) --[[ Line: 614 ]] --[[ Name: copyWithRename ]]
        -- upvalues: l_console_0 (copy), v163 (copy)
        if #v171 ~= #v172 then
            l_console_0.warn("copyWithRename() expects paths of the same length");
            return nil;
        else
            for v173 = 1, #v172 do
                if v171[v173] ~= v172[v173] then
                    l_console_0.warn("copyWithRename() expects paths to be the same except for the deepest key");
                    return nil;
                end;
            end;
            return (v163(v170, v171, v172, 0));
        end;
    end;
    local function v175(v176, v177, v178, v179) --[[ Line: 636 ]] --[[ Name: copyWithSetImpl ]]
        -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v175 (copy)
        if #v177 <= v178 then
            return v179;
        else
            local v180 = v177[v178];
            local v181 = nil;
            v181 = if l_Array_0.isArray(v176) then l_Array_0.slice(v176) else l_Object_0.assign({}, v176);
            v181[v180] = v175(v176[v180], v177, v178 + 1, v179);
            return v181;
        end;
    end;
    local function _(v182, v183, v184) --[[ Line: 658 ]] --[[ Name: copyWithSet ]]
        -- upvalues: v175 (copy)
        return (v175(v182, v183, 0, v184));
    end;
    local function _(v186, v187) --[[ Line: 666 ]] --[[ Name: findHook ]]
        local l_memoizedState_3 = v186.memoizedState;
        while l_memoizedState_3 ~= nil and v187 > 0 do
            l_memoizedState_3 = l_memoizedState_3.next;
            v187 = v187 - 1;
        end;
        return l_memoizedState_3;
    end;
    v146 = function(v190, v191, v192, v193) --[[ Line: 678 ]]
        -- upvalues: v175 (copy), l_Object_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_v191_0 = v191;
        local l_memoizedState_4 = v190.memoizedState;
        while l_memoizedState_4 ~= nil and l_v191_0 > 0 do
            l_memoizedState_4 = l_memoizedState_4.next;
            l_v191_0 = l_v191_0 - 1;
        end;
        local l_l_memoizedState_4_0 = l_memoizedState_4;
        if l_l_memoizedState_4_0 ~= nil then
            l_memoizedState_4 = l_l_memoizedState_4_0.memoizedState;
            l_v191_0 = v175(l_memoizedState_4, v192, 0, v193);
            l_l_memoizedState_4_0.memoizedState = l_v191_0;
            l_l_memoizedState_4_0.baseState = l_v191_0;
            v190.memoizedProps = l_Object_0.assign({}, v190.memoizedProps);
            l_scheduleUpdateOnFiber_0(v190, l_SyncLane_0, l_NoTimestamp_0);
        end;
    end;
    v147 = function(v197, v198, v199) --[[ Line: 700 ]]
        -- upvalues: v154 (copy), l_Object_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_v198_0 = v198;
        local l_memoizedState_5 = v197.memoizedState;
        while l_memoizedState_5 ~= nil and l_v198_0 > 0 do
            l_memoizedState_5 = l_memoizedState_5.next;
            l_v198_0 = l_v198_0 - 1;
        end;
        local l_l_memoizedState_5_0 = l_memoizedState_5;
        if l_l_memoizedState_5_0 ~= nil then
            l_memoizedState_5 = l_l_memoizedState_5_0.memoizedState;
            l_v198_0 = v154(l_memoizedState_5, v199, 0);
            l_l_memoizedState_5_0.memoizedState = l_v198_0;
            l_l_memoizedState_5_0.baseState = l_v198_0;
            v197.memoizedProps = l_Object_0.assign({}, v197.memoizedProps);
            l_scheduleUpdateOnFiber_0(v197, l_SyncLane_0, l_NoTimestamp_0);
        end;
    end;
    v148 = function(v203, v204, v205, v206) --[[ Line: 721 ]]
        -- upvalues: v174 (copy), l_Object_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_v204_0 = v204;
        local l_memoizedState_6 = v203.memoizedState;
        while l_memoizedState_6 ~= nil and l_v204_0 > 0 do
            l_memoizedState_6 = l_memoizedState_6.next;
            l_v204_0 = l_v204_0 - 1;
        end;
        local l_l_memoizedState_6_0 = l_memoizedState_6;
        if l_l_memoizedState_6_0 ~= nil then
            l_v204_0 = v174(l_l_memoizedState_6_0.memoizedState, v205, v206);
            l_l_memoizedState_6_0.memoizedState = l_v204_0;
            l_l_memoizedState_6_0.baseState = l_v204_0;
            v203.memoizedProps = l_Object_0.assign({}, v203.memoizedProps);
            l_scheduleUpdateOnFiber_0(v203, l_SyncLane_0, l_NoTimestamp_0);
        end;
    end;
    v149 = function(v210, v211, v212) --[[ Line: 745 ]]
        -- upvalues: v175 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_memoizedProps_0 = v210.memoizedProps;
        v210.pendingProps = v175(l_memoizedProps_0, v211, 0, v212);
        local l_alternate_0 = v210.alternate;
        if l_alternate_0 then
            l_alternate_0.pendingProps = v210.pendingProps;
        end;
        l_scheduleUpdateOnFiber_0(v210, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v150 = function(v215, v216) --[[ Line: 754 ]]
        -- upvalues: v154 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        local l_memoizedProps_1 = v215.memoizedProps;
        v215.pendingProps = v154(l_memoizedProps_1, v216, 0);
        local l_alternate_1 = v215.alternate;
        if l_alternate_1 then
            l_alternate_1.pendingProps = v215.pendingProps;
        end;
        l_scheduleUpdateOnFiber_0(v215, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v151 = function(v219, v220, v221) --[[ Line: 763 ]]
        -- upvalues: v174 (copy), l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        v219.pendingProps = v174(v219.memoizedProps, v220, v221);
        local l_alternate_2 = v219.alternate;
        if l_alternate_2 then
            l_alternate_2.pendingProps = v219.pendingProps;
        end;
        l_scheduleUpdateOnFiber_0(v219, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v152 = function(v223) --[[ Line: 777 ]]
        -- upvalues: l_scheduleUpdateOnFiber_0 (copy), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy)
        l_scheduleUpdateOnFiber_0(v223, l_SyncLane_0, l_NoTimestamp_0);
    end;
    v153 = function(v224) --[[ Line: 781 ]]
        -- upvalues: v144 (ref)
        v144 = v224;
    end;
end;
findHostInstanceByFiber = function(v225) --[[ Line: 786 ]] --[[ Name: findHostInstanceByFiber ]]
    -- upvalues: l_findCurrentHostFiber_0 (copy)
    local v226 = l_findCurrentHostFiber_0(v225);
    if v226 == nil then
        return nil;
    else
        return v226.stateNode;
    end;
end;
emptyFindFiberByHostInstance = function(_) --[[ Line: 794 ]] --[[ Name: emptyFindFiberByHostInstance ]]
    return nil;
end;
getCurrentFiberForDevTools = function() --[[ Line: 800 ]] --[[ Name: getCurrentFiberForDevTools ]]
    -- upvalues: v59 (copy)
    return v59.current;
end;
v74.injectIntoDevTools = function(v228) --[[ Line: 804 ]]
    -- upvalues: l_ReactSharedInternals_0 (copy), l_injectInternals_0 (copy), v146 (ref), v147 (ref), v148 (ref), v149 (ref), v150 (ref), v151 (ref), v153 (ref), v152 (ref)
    local l_findFiberByHostInstance_0 = v228.findFiberByHostInstance;
    local l_ReactCurrentDispatcher_0 = l_ReactSharedInternals_0.ReactCurrentDispatcher;
    local v231 = nil;
    if _G.__DEV__ then
        v231 = getCurrentFiberForDevTools;
    end;
    return l_injectInternals_0({
        bundleType = v228.bundleType, 
        version = v228.version, 
        rendererPackageName = v228.rendererPackageName, 
        rendererConfig = v228.rendererConfig, 
        overrideHookState = v146, 
        overrideHookStateDeletePath = v147, 
        overrideHookStateRenamePath = v148, 
        overrideProps = v149, 
        overridePropsDeletePath = v150, 
        overridePropsRenamePath = v151, 
        setSuspenseHandler = v153, 
        scheduleUpdate = v152, 
        currentDispatcherRef = l_ReactCurrentDispatcher_0, 
        findHostInstanceByFiber = findHostInstanceByFiber, 
        findFiberByHostInstance = l_findFiberByHostInstance_0 or emptyFindFiberByHostInstance, 
        getCurrentFiber = v231
    });
end;
return v74;