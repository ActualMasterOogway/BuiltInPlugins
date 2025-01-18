local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_Set_0 = require(l_Parent_0.LuauPolyfill).Set;
local v3 = {};
local function v8(v4) --[[ Line: 22 ]] --[[ Name: copySet ]]
    -- upvalues: l_Set_0 (copy)
    local v5 = l_Set_0.new();
    if v4 == nil then
        return v5;
    else
        for _, v7 in v4:ipairs() do
            v5:add(v7);
        end;
        return v5;
    end;
end;
local function _(v9) --[[ Line: 34 ]] --[[ Name: collectionHasEntries ]]
    return next(v9) ~= nil;
end;
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactInternalTypes);
local v13 = require(script.Parent.ReactFiberLane);
local v14 = require(l_Parent_0.Scheduler);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v16 = require(script.Parent["ReactFiberStack.new"]);
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_skipUnmountedBoundaries_0 = l_ReactFeatureFlags_0.skipUnmountedBoundaries;
local l_enableDoubleInvokingEffects_0 = l_ReactFeatureFlags_0.enableDoubleInvokingEffects;
local v20 = require(l_Parent_0.Shared);
local l_ReactSharedInternals_0 = v20.ReactSharedInternals;
local l_invariant_0 = v20.invariant;
local v23 = require(script.Parent["SchedulerWithReactIntegration.new"]);
local l_scheduleCallback_0 = v23.scheduleCallback;
local l_cancelCallback_0 = v23.cancelCallback;
local l_getCurrentPriorityLevel_0 = v23.getCurrentPriorityLevel;
local l_runWithPriority_0 = v23.runWithPriority;
local l_shouldYield_0 = v23.shouldYield;
local l_requestPaint_0 = v23.requestPaint;
local l_now_0 = v23.now;
local l_NoPriority_0 = v23.NoPriority;
local l_ImmediatePriority_0 = v23.ImmediatePriority;
local l_UserBlockingPriority_0 = v23.UserBlockingPriority;
local l_NormalPriority_0 = v23.NormalPriority;
local l_flushSyncCallbackQueue_0 = v23.flushSyncCallbackQueue;
local l_scheduleSyncCallback_0 = v23.scheduleSyncCallback;
local v37 = require(script.Parent.DebugTracing);
local v38 = require(script.Parent.SchedulingProfiler);
local l_tracing_0 = require(l_Parent_0.Scheduler).tracing;
local l___interactionsRef_0 = l_tracing_0.__interactionsRef;
local l___subscriberRef_0 = l_tracing_0.__subscriberRef;
local v42 = require(script.Parent.ReactFiberHostConfig);
local v43 = require(script.Parent["ReactFiber.new"]);
local v44 = require(script.Parent.ReactTypeOfMode);
local v45 = require(script.Parent.ReactWorkTags);
local l_LegacyRoot_0 = require(script.Parent.ReactRootTags).LegacyRoot;
local v47 = require(script.Parent.ReactFiberFlags);
local l_SyncLane_0 = v13.SyncLane;
local l_SyncBatchedLane_0 = v13.SyncBatchedLane;
local l_NoTimestamp_0 = v13.NoTimestamp;
local l_findUpdateLane_0 = v13.findUpdateLane;
local l_findTransitionLane_0 = v13.findTransitionLane;
local l_findRetryLane_0 = v13.findRetryLane;
local l_includesSomeLane_0 = v13.includesSomeLane;
local l_isSubsetOfLanes_0 = v13.isSubsetOfLanes;
local l_mergeLanes_0 = v13.mergeLanes;
local l_removeLanes_0 = v13.removeLanes;
local l_pickArbitraryLane_0 = v13.pickArbitraryLane;
local l_hasDiscreteLanes_0 = v13.hasDiscreteLanes;
local l_includesNonIdleWork_0 = v13.includesNonIdleWork;
local l_includesOnlyRetries_0 = v13.includesOnlyRetries;
local l_includesOnlyTransitions_0 = v13.includesOnlyTransitions;
local l_getNextLanes_0 = v13.getNextLanes;
local l_returnNextLanesPriority_0 = v13.returnNextLanesPriority;
local l_setCurrentUpdateLanePriority_0 = v13.setCurrentUpdateLanePriority;
local l_getCurrentUpdateLanePriority_0 = v13.getCurrentUpdateLanePriority;
local l_markStarvedLanesAsExpired_0 = v13.markStarvedLanesAsExpired;
local l_getLanesToRetrySynchronouslyOnError_0 = v13.getLanesToRetrySynchronouslyOnError;
local l_getMostRecentEventTime_0 = v13.getMostRecentEventTime;
local l_markRootUpdated_0 = v13.markRootUpdated;
local l_markRootSuspended_0 = v13.markRootSuspended;
local l_markRootPinged_0 = v13.markRootPinged;
local l_markRootExpired_0 = v13.markRootExpired;
local l_markDiscreteUpdatesExpired_0 = v13.markDiscreteUpdatesExpired;
local l_markRootFinished_0 = v13.markRootFinished;
local l_schedulerPriorityToLanePriority_0 = v13.schedulerPriorityToLanePriority;
local l_lanePriorityToSchedulerPriority_0 = v13.lanePriorityToSchedulerPriority;
local v78 = require(script.Parent.ReactFiberTransition);
local v79 = require(script.Parent["ReactFiberUnwindWork.new"]);
local l_unwindWork_0 = v79.unwindWork;
local l_unwindInterruptedWork_0 = v79.unwindInterruptedWork;
local v82 = require(script.Parent["ReactFiberThrow.new"]);
local l_throwException_0 = v82.throwException;
local l_createRootErrorUpdate_0 = v82.createRootErrorUpdate;
local l_createClassErrorUpdate_0 = v82.createClassErrorUpdate;
local v86 = require(script.Parent["ReactFiberCommitWork.new"]);
local l_commitBeforeMutationLifeCycles_0 = v86.commitBeforeMutationLifeCycles;
local l_commitPlacement_0 = v86.commitPlacement;
local l_commitWork_0 = v86.commitWork;
local l_commitDeletion_0 = v86.commitDeletion;
local l_commitPassiveUnmount_0 = v86.commitPassiveUnmount;
local l_commitPassiveUnmountInsideDeletedTree_0 = v86.commitPassiveUnmountInsideDeletedTree;
local l_commitPassiveMount_0 = v86.commitPassiveMount;
local l_commitDetachRef_0 = v86.commitDetachRef;
local l_invokeLayoutEffectMountInDEV_0 = v86.invokeLayoutEffectMountInDEV;
local l_invokePassiveEffectMountInDEV_0 = v86.invokePassiveEffectMountInDEV;
local l_invokeLayoutEffectUnmountInDEV_0 = v86.invokeLayoutEffectUnmountInDEV;
local l_invokePassiveEffectUnmountInDEV_0 = v86.invokePassiveEffectUnmountInDEV;
local l_recursivelyCommitLayoutEffects_0 = v86.recursivelyCommitLayoutEffects;
local v100 = require(l_Parent_0.Promise);
local l_enqueueUpdate_0 = require(script.Parent["ReactUpdateQueue.new"]).enqueueUpdate;
local l_resetContextDependencies_0 = require(script.Parent["ReactFiberNewContext.new"]).resetContextDependencies;
local v103 = nil;
local v104 = {
    resetHooksAfterThrowRef = nil, 
    ContextOnlyDispatcherRef = nil, 
    getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = nil, 
    originalBeginWorkRef = nil, 
    completeWorkRef = nil
};
local function v108(v105, v106, v107) --[[ Line: 245 ]]
    -- upvalues: v104 (copy)
    if not v104.originalBeginWorkRef then
        v104.originalBeginWorkRef = require(script.Parent["ReactFiberBeginWork.new"]).beginWork;
    end;
    return v104.originalBeginWorkRef(v105, v106, v107);
end;
local function _(v109, v110, v111) --[[ Line: 256 ]]
    -- upvalues: v104 (copy)
    if not v104.completeWorkRef then
        v104.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
    end;
    return v104.completeWorkRef(v109, v110, v111);
end;
local v113 = nil;
local function _() --[[ Line: 270 ]] --[[ Name: initReactFiberHooks ]]
    -- upvalues: v113 (ref), v104 (copy)
    v113 = require(script.Parent["ReactFiberHooks.new"]);
    v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
    v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
    v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
end;
local function _() --[[ Line: 278 ]]
    -- upvalues: v104 (copy), v113 (ref)
    if not v104.resetHooksAfterThrowRef then
        v113 = require(script.Parent["ReactFiberHooks.new"]);
        v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
        v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
        v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    return v104.resetHooksAfterThrowRef();
end;
local function _() --[[ Line: 286 ]]
    -- upvalues: v104 (copy), v113 (ref)
    if not v104.ContextOnlyDispatcherRef then
        v113 = require(script.Parent["ReactFiberHooks.new"]);
        v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
        v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
        v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    return v104.ContextOnlyDispatcherRef;
end;
local function _() --[[ Line: 294 ]]
    -- upvalues: v104 (copy), v113 (ref)
    if not v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
        v113 = require(script.Parent["ReactFiberHooks.new"]);
        v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
        v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
        v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    return v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef();
end;
local l_createCapturedValue_0 = require(script.Parent.ReactCapturedValue).createCapturedValue;
local l_push_0 = v16.push;
local l_pop_0 = v16.pop;
local l_createCursor_0 = v16.createCursor;
local v122 = require(script.Parent["ReactProfilerTimer.new"]);
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v124 = require(script.Parent["ReactStrictModeWarnings.new"]);
local v125 = require(script.Parent.ReactCurrentFiber);
local l_current_0 = v125.current;
local l_resetCurrentFiber_0 = v125.resetCurrentFiber;
local l_setCurrentFiber_0 = v125.setCurrentFiber;
local l_ReactErrorUtils_0 = require(l_Parent_0.Shared).ReactErrorUtils;
local l_invokeGuardedCallback_0 = l_ReactErrorUtils_0.invokeGuardedCallback;
local l_hasCaughtError_0 = l_ReactErrorUtils_0.hasCaughtError;
local l_clearCaughtError_0 = l_ReactErrorUtils_0.clearCaughtError;
local l_onCommitRoot_0 = require(script.Parent["ReactFiberDevToolsHook.new"]).onCommitRoot;
local l_onCommitRoot_1 = require(script.Parent.ReactTestSelectors).onCommitRoot;
local l_enqueueTask_0 = require(l_Parent_0.Shared).enqueueTask;
local l_doesFiberContain_0 = require(script.Parent.ReactFiberTreeReflection).doesFiberContain;
local l_ReactCurrentDispatcher_0 = l_ReactSharedInternals_0.ReactCurrentDispatcher;
local l_ReactCurrentOwner_0 = l_ReactSharedInternals_0.ReactCurrentOwner;
local l_IsSomeRendererActing_0 = l_ReactSharedInternals_0.IsSomeRendererActing;
local v140 = nil;
local v141 = nil;
local v142 = {};
v3.NoContext = 0;
v3.RetryAfterError = 64;
local v143 = {
    Incomplete = 0, 
    FatalErrored = 1, 
    Errored = 2, 
    Suspended = 3, 
    SuspendedWithDelay = 4, 
    Completed = 5
};
local v144 = 0;
local v145 = nil;
local v146 = nil;
local l_NoLanes_0 = v13.NoLanes;
v3.subtreeRenderLanes = v13.NoLanes;
local v148 = l_createCursor_0(v13.NoLanes);
local l_Incomplete_0 = v143.Incomplete;
local v150 = nil;
local l_NoLanes_1 = v13.NoLanes;
local v152 = require(script.Parent.ReactFiberWorkInProgress);
local l_workInProgressRootSkippedLanes_0 = v152.workInProgressRootSkippedLanes;
local l_NoLanes_2 = v13.NoLanes;
local l_NoLanes_3 = v13.NoLanes;
local v156 = nil;
local v157 = 0;
local v158 = 1e999;
local v159 = nil;
local function _() --[[ Line: 420 ]] --[[ Name: resetRenderTimer ]]
    -- upvalues: v158 (ref), l_now_0 (copy)
    v158 = l_now_0() + 500;
end;
v3.getRenderTargetTime = function() --[[ Line: 424 ]]
    -- upvalues: v158 (ref)
    return v158;
end;
local v161 = false;
local v162 = nil;
local v163 = nil;
local v164 = false;
local v165 = nil;
local l_l_NoPriority_0_0 = l_NoPriority_0;
local l_NoLanes_4 = v13.NoLanes;
local v168 = nil;
local v169 = 0;
local v170 = nil;
local v171 = 0;
local v172 = nil;
local l_l_NoTimestamp_0_0 = l_NoTimestamp_0;
local l_NoLanes_5 = v13.NoLanes;
local l_NoLanes_6 = v13.NoLanes;
local v176 = nil;
local v177 = false;
v3.getWorkInProgressRoot = function() --[[ Line: 465 ]]
    -- upvalues: v145 (ref)
    return v145;
end;
v3.requestEventTime = function() --[[ Line: 469 ]]
    -- upvalues: v144 (ref), l_now_0 (copy), l_l_NoTimestamp_0_0 (ref), l_NoTimestamp_0 (copy)
    if bit32.band(v144, 48) ~= 0 then
        return l_now_0();
    elseif l_l_NoTimestamp_0_0 ~= l_NoTimestamp_0 then
        return l_l_NoTimestamp_0_0;
    else
        l_l_NoTimestamp_0_0 = l_now_0();
        return l_l_NoTimestamp_0_0;
    end;
end;
v3.requestUpdateLane = function(v178) --[[ Line: 488 ]]
    -- upvalues: v44 (copy), l_SyncLane_0 (copy), l_getCurrentPriorityLevel_0 (copy), l_ImmediatePriority_0 (copy), l_SyncBatchedLane_0 (copy), l_ReactFeatureFlags_0 (copy), v144 (ref), l_NoLanes_0 (ref), v13 (copy), l_pickArbitraryLane_0 (copy), l_NoLanes_5 (ref), l_NoLanes_1 (ref), v78 (copy), l_NoLanes_6 (ref), v156 (ref), l_findTransitionLane_0 (copy), l_UserBlockingPriority_0 (copy), l_findUpdateLane_0 (copy), l_schedulerPriorityToLanePriority_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_console_0 (copy)
    local l_mode_0 = v178.mode;
    if bit32.band(l_mode_0, v44.BlockingMode) == v44.NoMode then
        return l_SyncLane_0;
    elseif bit32.band(l_mode_0, v44.ConcurrentMode) == v44.NoMode then
        return l_getCurrentPriorityLevel_0() == l_ImmediatePriority_0 and l_SyncLane_0 or l_SyncBatchedLane_0;
    elseif not l_ReactFeatureFlags_0.deferRenderPhaseUpdateToNextBatch and bit32.band(v144, 16) ~= 0 and l_NoLanes_0 ~= v13.NoLanes then
        return l_pickArbitraryLane_0(l_NoLanes_0);
    else
        if l_NoLanes_5 == v13.NoLanes then
            l_NoLanes_5 = l_NoLanes_1;
        end;
        if v78.requestCurrentTransition() ~= v78.NoTransition then
            if l_NoLanes_6 ~= v13.NoLanes then
                if v156 ~= nil then
                    l_NoLanes_6 = v156.pendingLanes;
                else
                    l_NoLanes_6 = v13.NoLanes;
                end;
            end;
            return l_findTransitionLane_0(l_NoLanes_5, l_NoLanes_6);
        else
            local v180 = l_getCurrentPriorityLevel_0();
            local _ = nil;
            if bit32.band(v144, 4) ~= 0 and v180 == l_UserBlockingPriority_0 then
                return (l_findUpdateLane_0(v13.InputDiscreteLanePriority, l_NoLanes_5));
            else
                local v182 = l_schedulerPriorityToLanePriority_0(v180);
                if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
                    local v183 = l_getCurrentUpdateLanePriority_0();
                    if v182 ~= v183 and v183 ~= v13.NoLanePriority and _G.__DEV__ then
                        l_console_0.error("Expected current scheduler lane priority %s to match current update lane priority %s", tostring(v182), (tostring(v183)));
                    end;
                end;
                return (l_findUpdateLane_0(v182, l_NoLanes_5));
            end;
        end;
    end;
end;
requestRetryLane = function(v184) --[[ Line: 592 ]] --[[ Name: requestRetryLane ]]
    -- upvalues: v44 (copy), l_SyncLane_0 (copy), l_getCurrentPriorityLevel_0 (copy), l_ImmediatePriority_0 (copy), l_SyncBatchedLane_0 (copy), l_NoLanes_5 (ref), v13 (copy), l_NoLanes_1 (ref), l_findRetryLane_0 (copy)
    local l_mode_1 = v184.mode;
    if bit32.band(l_mode_1, v44.BlockingMode) == v44.NoMode then
        return l_SyncLane_0;
    elseif bit32.band(l_mode_1, v44.ConcurrentMode) == v44.NoMode then
        if l_getCurrentPriorityLevel_0() == l_ImmediatePriority_0 then
            return l_SyncLane_0;
        else
            return l_SyncBatchedLane_0;
        end;
    else
        if l_NoLanes_5 == v13.NoLanes then
            l_NoLanes_5 = l_NoLanes_1;
        end;
        return l_findRetryLane_0(l_NoLanes_5);
    end;
end;
v3.scheduleUpdateOnFiber = function(v186, v187, v188) --[[ Line: 614 ]]
    -- upvalues: v142 (copy), l_markRootUpdated_0 (copy), v145 (ref), l_ReactFeatureFlags_0 (copy), v144 (ref), l_NoLanes_2 (ref), l_mergeLanes_0 (copy), l_Incomplete_0 (ref), v143 (copy), l_NoLanes_0 (ref), l_getCurrentPriorityLevel_0 (copy), l_SyncLane_0 (copy), v103 (ref), v158 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy), l_UserBlockingPriority_0 (copy), l_ImmediatePriority_0 (copy), v168 (ref), v156 (ref)
    v142.checkForNestedUpdates();
    local v189 = v142.markUpdateLaneFromFiberToRoot(v186, v187);
    if v189 == nil then
        return nil;
    else
        l_markRootUpdated_0(v189, v187, v188);
        if v189 == v145 then
            v142.warnAboutRenderPhaseUpdatesInDEV(v186);
            if l_ReactFeatureFlags_0.deferRenderPhaseUpdateToNextBatch or bit32.band(v144, 16) == 0 then
                l_NoLanes_2 = l_mergeLanes_0(l_NoLanes_2, v187);
            end;
            if l_Incomplete_0 == v143.SuspendedWithDelay then
                v142.markRootSuspended(v189, l_NoLanes_0);
            end;
        end;
        local v190 = l_getCurrentPriorityLevel_0();
        if v187 == l_SyncLane_0 then
            if bit32.band(v144, 8) ~= 0 and bit32.band(v144, 48) == 0 then
                v142.schedulePendingInteractions(v189, v187);
                v142.performSyncWorkOnRoot(v189);
            else
                v103(v189, v188);
                v142.schedulePendingInteractions(v189, v187);
                if v144 == 0 then
                    v158 = l_now_0() + 500;
                    l_flushSyncCallbackQueue_0();
                end;
            end;
        else
            if bit32.band(v144, 4) ~= 0 and (v190 == l_UserBlockingPriority_0 or v190 == l_ImmediatePriority_0) then
                if v168 == nil then
                    v168 = {
                        [v189] = true
                    };
                else
                    v168[v189] = true;
                end;
            end;
            v103(v189, v188);
            v142.schedulePendingInteractions(v189, v187);
        end;
        v156 = v189;
        return v189;
    end;
end;
v142.markUpdateLaneFromFiberToRoot = function(v191, v192) --[[ Line: 724 ]]
    -- upvalues: l_mergeLanes_0 (copy), v47 (copy), v142 (copy), v45 (copy)
    v191.lanes = l_mergeLanes_0(v191.lanes, v192);
    local l_alternate_0 = v191.alternate;
    if l_alternate_0 ~= nil then
        l_alternate_0.lanes = l_mergeLanes_0(l_alternate_0.lanes, v192);
    end;
    if _G.__DEV__ and l_alternate_0 == nil and bit32.band(v191.flags, (bit32.bor(v47.Placement, v47.Hydrating))) ~= v47.NoFlags then
        v142.warnAboutUpdateOnNotYetMountedFiberInDEV(v191);
    end;
    local l_v191_0 = v191;
    local l_return__0 = v191.return_;
    while l_return__0 ~= nil do
        l_return__0.childLanes = l_mergeLanes_0(l_return__0.childLanes, v192);
        l_alternate_0 = l_return__0.alternate;
        if l_alternate_0 ~= nil then
            l_alternate_0.childLanes = l_mergeLanes_0(l_alternate_0.childLanes, v192);
        elseif _G.__DEV__ and bit32.band(l_return__0.flags, (bit32.bor(v47.Placement, v47.Hydrating))) ~= v47.NoFlags then
            v142.warnAboutUpdateOnNotYetMountedFiberInDEV(v191);
        end;
        l_v191_0 = l_return__0;
        l_return__0 = l_return__0.return_;
    end;
    if l_v191_0.tag == v45.HostRoot then
        return l_v191_0.stateNode;
    else
        return nil;
    end;
end;
v103 = function(v196, v197) --[[ Line: 773 ]]
    -- upvalues: l_markStarvedLanesAsExpired_0 (copy), v145 (ref), l_NoLanes_0 (ref), v13 (copy), l_getNextLanes_0 (copy), l_returnNextLanesPriority_0 (copy), l_cancelCallback_0 (copy), l_scheduleSyncCallback_0 (copy), v142 (copy), l_scheduleCallback_0 (copy), l_ImmediatePriority_0 (copy), l_lanePriorityToSchedulerPriority_0 (copy)
    local l_callbackNode_0 = v196.callbackNode;
    l_markStarvedLanesAsExpired_0(v196, v197);
    local v199 = nil;
    v199 = if v196 == v145 then l_NoLanes_0 else v13.NoLanes;
    local v200 = l_getNextLanes_0(v196, v199);
    local v201 = l_returnNextLanesPriority_0();
    if v200 == v13.NoLanes then
        if l_callbackNode_0 ~= nil then
            l_cancelCallback_0(l_callbackNode_0);
            v196.callbackNode = nil;
            v196.callbackPriority = v13.NoLanePriority;
        end;
        return;
    else
        if l_callbackNode_0 ~= nil then
            if v196.callbackPriority == v201 then
                return;
            else
                l_cancelCallback_0(l_callbackNode_0);
            end;
        end;
        local v202 = nil;
        if v201 == v13.SyncLanePriority then
            v202 = l_scheduleSyncCallback_0(function() --[[ Line: 822 ]]
                -- upvalues: v142 (ref), v196 (copy)
                return v142.performSyncWorkOnRoot(v196);
            end);
        elseif v201 == v13.SyncBatchedLanePriority then
            v202 = l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 829 ]]
                -- upvalues: v142 (ref), v196 (copy)
                return v142.performSyncWorkOnRoot(v196);
            end);
        else
            local v203 = l_lanePriorityToSchedulerPriority_0(v201);
            v202 = l_scheduleCallback_0(v203, function() --[[ Line: 839 ]]
                -- upvalues: v142 (ref), v196 (copy)
                return v142.performConcurrentWorkOnRoot(v196);
            end);
        end;
        v196.callbackPriority = v201;
        v196.callbackNode = v202;
        return;
    end;
end;
v142.performConcurrentWorkOnRoot = function(v204) --[[ Line: 852 ]]
    -- upvalues: l_l_NoTimestamp_0_0 (ref), l_NoTimestamp_0 (copy), l_NoLanes_5 (ref), v13 (copy), l_NoLanes_6 (ref), l_invariant_0 (copy), v144 (ref), v3 (copy), l_getNextLanes_0 (copy), v145 (ref), l_NoLanes_0 (ref), v142 (copy), l_includesSomeLane_0 (copy), l_NoLanes_1 (ref), l_NoLanes_2 (ref), v143 (copy), v42 (copy), l_getLanesToRetrySynchronouslyOnError_0 (copy), v150 (ref), v103 (ref), l_now_0 (copy)
    l_l_NoTimestamp_0_0 = l_NoTimestamp_0;
    l_NoLanes_5 = v13.NoLanes;
    l_NoLanes_6 = v13.NoLanes;
    l_invariant_0(bit32.band(v144, 48) == 0, "Should not already be working.");
    local l_callbackNode_1 = v204.callbackNode;
    if v3.flushPassiveEffects() and v204.callbackNode ~= l_callbackNode_1 then
        return nil;
    else
        local v206 = l_getNextLanes_0(v204, if v204 == v145 then l_NoLanes_0 else v13.NoLanes);
        if v206 == v13.NoLanes then
            return nil;
        else
            local v207 = v142.renderRootConcurrent(v204, v206);
            if l_includesSomeLane_0(l_NoLanes_1, l_NoLanes_2) then
                v142.prepareFreshStack(v204, v13.NoLanes);
            elseif v207 ~= v143.Incomplete then
                if v207 == v143.Errored then
                    v144 = bit32.bor(v144, 64);
                    if v204.hydrate then
                        v204.hydrate = false;
                        v42.clearContainer(v204.containerInfo);
                    end;
                    v206 = l_getLanesToRetrySynchronouslyOnError_0(v204);
                    if v206 ~= v13.NoLanes then
                        v207 = v142.renderRootSync(v204, v206);
                    end;
                end;
                if v207 == v143.FatalErrored then
                    local l_v150_0 = v150;
                    v142.prepareFreshStack(v204, v13.NoLanes);
                    v142.markRootSuspended(v204, v206);
                    v103(v204, l_now_0());
                    error(l_v150_0);
                end;
                v204.finishedWork = v204.current.alternate;
                v204.finishedLanes = v206;
                v142.finishConcurrentRender(v204, v207, v206);
            end;
            v103(v204, l_now_0());
            if v204.callbackNode == l_callbackNode_1 then
                return function() --[[ Line: 948 ]]
                    -- upvalues: v142 (ref), v204 (copy)
                    return v142.performConcurrentWorkOnRoot(v204);
                end;
            else
                return nil;
            end;
        end;
    end;
end;
local v209 = 0;
local v210 = false;
shouldForceFlushFallbacksInDEV = function() --[[ Line: 961 ]] --[[ Name: shouldForceFlushFallbacksInDEV ]]
    -- upvalues: v209 (ref)
    return _G.__DEV__ and v209 > 0;
end;
v142.finishConcurrentRender = function(v211, v212, v213) --[[ Line: 966 ]]
    -- upvalues: v143 (copy), l_invariant_0 (copy), v142 (copy), l_includesOnlyRetries_0 (copy), v157 (ref), l_now_0 (copy), l_getNextLanes_0 (copy), v13 (copy), l_isSubsetOfLanes_0 (copy), v3 (copy), l_markRootPinged_0 (copy), v42 (copy), l_includesOnlyTransitions_0 (copy), l_getMostRecentEventTime_0 (copy)
    if v212 == v143.Incomplete or v212 == v143.FatalErrored then
        l_invariant_0(false, "Root did not complete. This is a bug in React.");
        return;
    elseif v212 == v143.Errored then
        v142.commitRoot(v211);
        return;
    elseif v212 == v143.Suspended then
        v142.markRootSuspended(v211, v213);
        if l_includesOnlyRetries_0(v213) and not shouldForceFlushFallbacksInDEV() then
            local v214 = v157 + 500 - l_now_0();
            if v214 > 10 then
                if l_getNextLanes_0(v211, v13.NoLanes) ~= v13.NoLanes then
                    return;
                else
                    local l_suspendedLanes_0 = v211.suspendedLanes;
                    if not l_isSubsetOfLanes_0(l_suspendedLanes_0, v213) then
                        local v216 = v3.requestEventTime();
                        l_markRootPinged_0(v211, l_suspendedLanes_0, v216);
                        return;
                    else
                        v211.timeoutHandle = v42.scheduleTimeout(function() --[[ Line: 1014 ]]
                            -- upvalues: v142 (ref), v211 (copy)
                            return v142.commitRoot(v211);
                        end, v214);
                        return;
                    end;
                end;
            end;
        end;
        v142.commitRoot(v211);
        return;
    elseif v212 == v143.SuspendedWithDelay then
        v142.markRootSuspended(v211, v213);
        if l_includesOnlyTransitions_0(v213) then
            return;
        else
            if not shouldForceFlushFallbacksInDEV() then
                local v217 = l_getMostRecentEventTime_0(v211, v213);
                local v218 = l_now_0() - v217;
                local v219 = jnd(v218) - v218;
                if v219 > 10 then
                    v211.timeoutHandle = v42.scheduleTimeout(function() --[[ Line: 1050 ]]
                        -- upvalues: v142 (ref), v211 (copy)
                        return v142.commitRoot(v211);
                    end, v219);
                    return;
                end;
            end;
            v142.commitRoot(v211);
            return;
        end;
    elseif v212 == v143.Completed then
        v142.commitRoot(v211);
        return;
    else
        l_invariant_0(false, "Unknown root exit status.");
        return;
    end;
end;
v142.markRootSuspended = function(v220, v221) --[[ Line: 1066 ]]
    -- upvalues: l_removeLanes_0 (copy), l_NoLanes_3 (ref), l_NoLanes_2 (ref), l_markRootSuspended_0 (copy)
    v221 = l_removeLanes_0(v221, l_NoLanes_3);
    v221 = l_removeLanes_0(v221, l_NoLanes_2);
    l_markRootSuspended_0(v220, v221);
end;
v142.performSyncWorkOnRoot = function(v222) --[[ Line: 1078 ]]
    -- upvalues: l_invariant_0 (copy), v144 (ref), v3 (copy), v145 (ref), l_includesSomeLane_0 (copy), l_NoLanes_0 (ref), v142 (copy), l_NoLanes_1 (ref), l_NoLanes_2 (ref), l_getNextLanes_0 (copy), v13 (copy), l_LegacyRoot_0 (copy), v143 (copy), v42 (copy), l_getLanesToRetrySynchronouslyOnError_0 (copy), v150 (ref), v103 (ref), l_now_0 (copy)
    l_invariant_0(bit32.band(v144, 48) == 0, "Should not already be working.");
    v3.flushPassiveEffects();
    local v223 = nil;
    local v224 = nil;
    if v222 == v145 and l_includesSomeLane_0(v222.expiredLanes, l_NoLanes_0) then
        v223 = l_NoLanes_0;
        v224 = v142.renderRootSync(v222, v223);
        if l_includesSomeLane_0(l_NoLanes_1, l_NoLanes_2) then
            v223 = l_getNextLanes_0(v222, v223);
            v224 = v142.renderRootSync(v222, v223);
        end;
    else
        v223 = l_getNextLanes_0(v222, v13.NoLanes);
        v224 = v142.renderRootSync(v222, v223);
    end;
    if v222.tag ~= l_LegacyRoot_0 and v224 == v143.Errored then
        v144 = bit32.bor(v144, 64);
        if v222.hydrate then
            v222.hydrate = false;
            v42.clearContainer(v222.containerInfo);
        end;
        v223 = l_getLanesToRetrySynchronouslyOnError_0(v222);
        if v223 ~= v13.NoLanes then
            v224 = v142.renderRootSync(v222, v223);
        end;
    end;
    if v224 == v143.FatalErrored then
        local l_v150_1 = v150;
        v142.prepareFreshStack(v222, v13.NoLanes);
        v142.markRootSuspended(v222, v223);
        v103(v222, l_now_0());
        error(l_v150_1);
    end;
    v222.finishedWork = v222.current.alternate;
    v222.finishedLanes = v223;
    v142.commitRoot(v222);
    v103(v222, l_now_0());
    return nil;
end;
v3.flushRoot = function(v226, v227) --[[ Line: 1160 ]]
    -- upvalues: l_markRootExpired_0 (copy), v103 (ref), l_now_0 (copy), v144 (ref), v158 (ref), l_flushSyncCallbackQueue_0 (copy)
    l_markRootExpired_0(v226, v227);
    v103(v226, l_now_0());
    if bit32.band(v144, 48) == 0 then
        v158 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
end;
v3.getExecutionContext = function() --[[ Line: 1169 ]]
    -- upvalues: v144 (ref)
    return v144;
end;
v3.flushDiscreteUpdates = function() --[[ Line: 1173 ]]
    -- upvalues: v144 (ref), l_console_0 (copy), v142 (copy), v3 (copy)
    if bit32.band(v144, 49) ~= 0 then
        if _G.__DEV__ and bit32.band(v144, 16) ~= 0 then
            l_console_0.error("unstable_flushDiscreteUpdates: Cannot flush updates when React is " .. "already rendering.");
        end;
        return;
    else
        v142.flushPendingDiscreteUpdates();
        v3.flushPassiveEffects();
        return;
    end;
end;
v3.deferredUpdates = function(v228) --[[ Line: 1201 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v13 (copy), l_runWithPriority_0 (copy), l_NormalPriority_0 (copy)
    if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        local v229 = l_getCurrentUpdateLanePriority_0();
        local v230 = nil;
        local v231 = nil;
        if not _G.__YOLO__ then
            l_setCurrentUpdateLanePriority_0(v13.DefaultLanePriority);
            local l_status_0, l_result_0 = pcall(l_runWithPriority_0, l_NormalPriority_0, v228);
            v230 = l_status_0;
            v231 = l_result_0;
        else
            v230 = true;
            l_setCurrentUpdateLanePriority_0(v13.DefaultLanePriority);
            v231 = l_runWithPriority_0(l_NormalPriority_0, v228);
        end;
        l_setCurrentUpdateLanePriority_0(v229);
        if v230 then
            return v231;
        else
            error(v231);
            return;
        end;
    else
        return l_runWithPriority_0(l_NormalPriority_0, v228);
    end;
end;
v142.flushPendingDiscreteUpdates = function() --[[ Line: 1229 ]]
    -- upvalues: v168 (ref), l_markDiscreteUpdatesExpired_0 (copy), v103 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    if v168 ~= nil then
        local l_v168_0 = v168;
        v168 = nil;
        for v235, _ in pairs(l_v168_0) do
            l_markDiscreteUpdatesExpired_0(v235);
            v103(v235, l_now_0());
        end;
    end;
    l_flushSyncCallbackQueue_0();
end;
v3.batchedUpdates = function(v237, v238) --[[ Line: 1246 ]]
    -- upvalues: v144 (ref), v158 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v144_0 = v144;
    v144 = bit32.bor(v144, 1);
    local v240 = nil;
    local v241 = nil;
    if not _G.__YOLO__ then
        local l_status_1, l_result_1 = pcall(v237, v238);
        v240 = l_status_1;
        v241 = l_result_1;
    else
        v240 = true;
        v241 = v237(v238);
    end;
    v144 = l_v144_0;
    if v144 == 0 then
        v158 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if v240 then
        return v241;
    else
        error(v241);
        return;
    end;
end;
v3.batchedEventUpdates = function(v244, v245) --[[ Line: 1274 ]]
    -- upvalues: v144 (ref), v158 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v144_1 = v144;
    v144 = bit32.bor(v144, 2);
    local v247 = nil;
    local v248 = nil;
    if not _G.__YOLO__ then
        local l_status_2, l_result_2 = pcall(v244, v245);
        v247 = l_status_2;
        v248 = l_result_2;
    else
        v247 = true;
        v248 = v244(v245);
    end;
    v144 = l_v144_1;
    if v144 == 0 then
        v158 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if v247 then
        return v248;
    else
        error(v248);
        return;
    end;
end;
v3.discreteUpdates = function(v251, v252, v253, v254, v255) --[[ Line: 1303 ]]
    -- upvalues: v144 (ref), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v13 (copy), l_runWithPriority_0 (copy), l_UserBlockingPriority_0 (copy), v158 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v144_2 = v144;
    v144 = bit32.bor(v144, 4);
    if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        local v257 = l_getCurrentUpdateLanePriority_0();
        l_setCurrentUpdateLanePriority_0(v13.InputDiscreteLanePriority);
        local l_status_3, l_result_3 = pcall(l_runWithPriority_0, l_UserBlockingPriority_0, function() --[[ Line: 1313 ]]
            -- upvalues: v251 (copy), v252 (copy), v253 (copy), v254 (copy), v255 (copy)
            return v251(v252, v253, v254, v255);
        end);
        l_setCurrentUpdateLanePriority_0(v257);
        v144 = l_v144_2;
        if v144 == 0 then
            v158 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if l_status_3 then
            return l_result_3;
        else
            error(l_result_3);
            return;
        end;
    else
        local l_status_4, l_result_4 = pcall(l_runWithPriority_0, l_UserBlockingPriority_0, function() --[[ Line: 1335 ]]
            -- upvalues: v251 (copy), v252 (copy), v253 (copy), v254 (copy), v255 (copy)
            return v251(v252, v253, v254, v255);
        end);
        v144 = l_v144_2;
        if v144 == 0 then
            v158 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if l_status_4 then
            return l_result_4;
        else
            error(l_result_4);
            return;
        end;
    end;
end;
v3.unbatchedUpdates = function(v262, v263) --[[ Line: 1356 ]]
    -- upvalues: v144 (ref), v158 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v144_3 = v144;
    v144 = bit32.band(v144, 4294967294);
    v144 = bit32.bor(v144, 8);
    local v265 = nil;
    local v266 = nil;
    if not _G.__YOLO__ then
        local l_status_5, l_result_5 = pcall(v262, v263);
        v265 = l_status_5;
        v266 = l_result_5;
    else
        v265 = true;
        v266 = v262(v263);
    end;
    v144 = l_v144_3;
    if v144 == 0 then
        v158 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if v265 then
        return v266;
    else
        error(v266);
        return;
    end;
end;
v3.flushSync = function(v269, v270) --[[ Line: 1384 ]]
    -- upvalues: v144 (ref), l_console_0 (copy), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v13 (copy), l_runWithPriority_0 (copy), l_ImmediatePriority_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v144_4 = v144;
    if bit32.band(l_v144_4, 48) ~= 0 then
        if _G.__DEV__ then
            l_console_0.error("flushSync was called from inside a lifecycle method. React cannot " .. "flush when React is already rendering. Consider moving this call to " .. "a scheduler task or micro task.");
        end;
        return v269(v270);
    else
        v144 = bit32.bor(v144, 1);
        if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
            local v272 = l_getCurrentUpdateLanePriority_0();
            l_setCurrentUpdateLanePriority_0(v13.SyncLanePriority);
            local v273 = nil;
            local v274 = nil;
            if not _G.__YOLO__ then
                if v269 then
                    local l_status_6, l_result_6 = pcall(l_runWithPriority_0, l_ImmediatePriority_0, function() --[[ Line: 1409 ]]
                        -- upvalues: v269 (copy), v270 (copy)
                        return v269(v270);
                    end);
                    v273 = l_status_6;
                    v274 = l_result_6;
                else
                    v273 = true;
                    v274 = nil;
                end;
            else
                v273 = true;
                l_setCurrentUpdateLanePriority_0(v13.SyncLanePriority);
                v274 = if v269 then l_runWithPriority_0(l_ImmediatePriority_0, function() --[[ Line: 1422 ]]
                    -- upvalues: v269 (copy), v270 (copy)
                    return v269(v270);
                end) else nil;
            end;
            l_setCurrentUpdateLanePriority_0(v272);
            v144 = l_v144_4;
            l_flushSyncCallbackQueue_0();
            if not v273 then
                error(v274);
            end;
            return v274;
        else
            local v277 = nil;
            local v278 = nil;
            if not _G.__YOLO__ then
                if v269 then
                    local l_status_7, l_result_7 = pcall(l_runWithPriority_0, l_ImmediatePriority_0, function() --[[ Line: 1450 ]]
                        -- upvalues: v269 (copy), v270 (copy)
                        return v269(v270);
                    end);
                    v277 = l_status_7;
                    v278 = l_result_7;
                else
                    v277 = true;
                    v278 = nil;
                end;
            else
                v277 = true;
                v278 = if v269 then l_runWithPriority_0(l_ImmediatePriority_0, function() --[[ Line: 1462 ]]
                    -- upvalues: v269 (copy), v270 (copy)
                    return v269(v270);
                end) else nil;
            end;
            v144 = l_v144_4;
            l_flushSyncCallbackQueue_0();
            if not v277 then
                error(v278);
            end;
            return v278;
        end;
    end;
end;
v3.flushControlled = function(v281) --[[ Line: 1483 ]]
    -- upvalues: v144 (ref), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v13 (copy), l_runWithPriority_0 (copy), l_ImmediatePriority_0 (copy), v158 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v144_5 = v144;
    v144 = bit32.bor(v144, 1);
    if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        local v283 = l_getCurrentUpdateLanePriority_0();
        l_setCurrentUpdateLanePriority_0(v13.SyncLanePriority);
        local l_status_8, l_result_8 = pcall(l_runWithPriority_0, l_ImmediatePriority_0, v281);
        l_setCurrentUpdateLanePriority_0(v283);
        v144 = l_v144_5;
        if v144 == 0 then
            v158 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if not l_status_8 then
            error(l_result_8);
            return;
        end;
    else
        local l_status_9, l_result_9 = pcall(l_runWithPriority_0, l_ImmediatePriority_0, v281);
        v144 = l_v144_5;
        if v144 == 0 then
            v158 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if not l_status_9 then
            error(l_result_9);
        end;
    end;
end;
v3.pushRenderLanes = function(v288, v289) --[[ Line: 1521 ]]
    -- upvalues: l_push_0 (copy), v148 (copy), v3 (copy), l_mergeLanes_0 (copy), l_NoLanes_1 (ref)
    l_push_0(v148, v3.subtreeRenderLanes, v288);
    v3.subtreeRenderLanes = l_mergeLanes_0(v3.subtreeRenderLanes, v289);
    l_NoLanes_1 = l_mergeLanes_0(l_NoLanes_1, v289);
end;
v3.popRenderLanes = function(v290) --[[ Line: 1530 ]]
    -- upvalues: v3 (copy), v148 (copy), l_pop_0 (copy)
    v3.subtreeRenderLanes = v148.current;
    l_pop_0(v148, v290);
end;
v142.prepareFreshStack = function(v291, v292) --[[ Line: 1535 ]]
    -- upvalues: v13 (copy), v42 (copy), v146 (ref), l_unwindInterruptedWork_0 (copy), v145 (ref), v43 (copy), l_NoLanes_0 (ref), v3 (copy), l_NoLanes_1 (ref), l_Incomplete_0 (ref), v143 (copy), v150 (ref), l_workInProgressRootSkippedLanes_0 (copy), l_NoLanes_2 (ref), l_NoLanes_3 (ref), l_ReactFeatureFlags_0 (copy), v172 (ref), v124 (copy)
    v291.finishedWork = nil;
    v291.finishedLanes = v13.NoLanes;
    local l_timeoutHandle_0 = v291.timeoutHandle;
    if l_timeoutHandle_0 ~= v42.noTimeout then
        v291.timeoutHandle = v42.noTimeout;
        v42.cancelTimeout(l_timeoutHandle_0);
    end;
    if v146 ~= nil then
        local l_return__1 = v146.return_;
        while l_return__1 ~= nil do
            l_unwindInterruptedWork_0(l_return__1);
            l_return__1 = l_return__1.return_;
        end;
    end;
    v145 = v291;
    v146 = v43.createWorkInProgress(v291.current, nil);
    l_NoLanes_0 = v292;
    v3.subtreeRenderLanes = v292;
    l_NoLanes_1 = v292;
    l_Incomplete_0 = v143.Incomplete;
    v150 = nil;
    l_workInProgressRootSkippedLanes_0(v13.NoLanes);
    l_NoLanes_2 = v13.NoLanes;
    l_NoLanes_3 = v13.NoLanes;
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        v172 = nil;
    end;
    if _G.__DEV__ then
        v124.discardPendingWarnings();
    end;
end;
v142.handleError = function(v295, v296) --[[ Line: 1575 ]]
    -- upvalues: v146 (ref), l_resetContextDependencies_0 (copy), v104 (copy), v113 (ref), l_resetCurrentFiber_0 (copy), l_ReactCurrentOwner_0 (copy), l_Incomplete_0 (ref), v143 (copy), v150 (ref), l_ReactFeatureFlags_0 (copy), v44 (copy), v122 (copy), l_throwException_0 (copy), l_NoLanes_0 (ref), v3 (copy), v142 (copy)
    while true do
        local l_v146_0 = v146;
        local l_status_10, l_result_10 = pcall(function() --[[ Line: 1579 ]]
            -- upvalues: l_resetContextDependencies_0 (ref), v104 (ref), v113 (ref), l_resetCurrentFiber_0 (ref), l_ReactCurrentOwner_0 (ref), l_v146_0 (ref), l_Incomplete_0 (ref), v143 (ref), v150 (ref), v296 (ref), v146 (ref), l_ReactFeatureFlags_0 (ref), v44 (ref), v122 (ref), l_throwException_0 (ref), v295 (copy), l_NoLanes_0 (ref), v3 (ref), v142 (ref)
            l_resetContextDependencies_0();
            if not v104.resetHooksAfterThrowRef then
                v113 = require(script.Parent["ReactFiberHooks.new"]);
                v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
                v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
                v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
            end;
            local _ = v104.resetHooksAfterThrowRef();
            l_resetCurrentFiber_0();
            l_ReactCurrentOwner_0.current = nil;
            if l_v146_0 == nil or l_v146_0.return_ == nil then
                l_Incomplete_0 = v143.FatalErrored;
                v150 = v296;
                v146 = nil;
                return;
            else
                if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(l_v146_0.mode, v44.ProfileMode) ~= 0 then
                    v122.stopProfilerTimerIfRunningAndRecordDelta(l_v146_0, true);
                end;
                l_throwException_0(v295, l_v146_0.return_, l_v146_0, v296, l_NoLanes_0, v3.onUncaughtError, v3.renderDidError);
                v142.completeUnitOfWork(l_v146_0);
                return;
            end;
        end);
        if not l_status_10 then
            v296 = l_result_10;
            if v146 == l_v146_0 and l_v146_0 ~= nil then
                l_v146_0 = l_v146_0.return_;
                v146 = l_v146_0;
            else
                l_v146_0 = v146;
            end;
            --[[ close >= 2 ]]
        else
            break;
        end;
    end;
end;
v142.pushDispatcher = function() --[[ Line: 1644 ]]
    -- upvalues: l_ReactCurrentDispatcher_0 (copy), v104 (copy), v113 (ref)
    local l_current_1 = l_ReactCurrentDispatcher_0.current;
    local l_l_ReactCurrentDispatcher_0_0 = l_ReactCurrentDispatcher_0;
    if not v104.ContextOnlyDispatcherRef then
        v113 = require(script.Parent["ReactFiberHooks.new"]);
        v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
        v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
        v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    l_l_ReactCurrentDispatcher_0_0.current = v104.ContextOnlyDispatcherRef;
    if l_current_1 == nil then
        if not v104.ContextOnlyDispatcherRef then
            v113 = require(script.Parent["ReactFiberHooks.new"]);
            v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
            v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
            v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
        end;
        return v104.ContextOnlyDispatcherRef;
    else
        return l_current_1;
    end;
end;
v142.popDispatcher = function(v303) --[[ Line: 1661 ]]
    -- upvalues: l_ReactCurrentDispatcher_0 (copy)
    l_ReactCurrentDispatcher_0.current = v303;
end;
v142.pushInteractions = function(v304) --[[ Line: 1665 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___interactionsRef_0 (copy)
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        local l_current_2 = l___interactionsRef_0.current;
        l___interactionsRef_0.current = v304.memoizedInteractions;
        return l_current_2;
    else
        return nil;
    end;
end;
v142.popInteractions = function(v306) --[[ Line: 1674 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___interactionsRef_0 (copy)
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        l___interactionsRef_0.current = v306;
    end;
end;
v3.markCommitTimeOfFallback = function() --[[ Line: 1680 ]]
    -- upvalues: v157 (ref), l_now_0 (copy)
    v157 = l_now_0();
end;
v3.markSkippedUpdateLanes = function(v307) --[[ Line: 1684 ]]
    -- upvalues: v152 (copy)
    v152.markSkippedUpdateLanes(v307);
end;
v3.renderDidSuspend = function() --[[ Line: 1688 ]]
    -- upvalues: l_Incomplete_0 (ref), v143 (copy)
    if l_Incomplete_0 == v143.Incomplete then
        l_Incomplete_0 = v143.Suspended;
    end;
end;
v3.renderDidSuspendDelayIfPossible = function() --[[ Line: 1694 ]]
    -- upvalues: l_Incomplete_0 (ref), v143 (copy), v145 (ref), l_includesNonIdleWork_0 (copy), l_workInProgressRootSkippedLanes_0 (copy), l_NoLanes_2 (ref), v142 (copy), l_NoLanes_0 (ref)
    if l_Incomplete_0 == v143.Incomplete or l_Incomplete_0 == v143.Suspended then
        l_Incomplete_0 = v143.SuspendedWithDelay;
    end;
    if v145 ~= nil and (l_includesNonIdleWork_0(l_workInProgressRootSkippedLanes_0()) or l_includesNonIdleWork_0(l_NoLanes_2)) then
        v142.markRootSuspended(v145, l_NoLanes_0);
    end;
end;
v3.renderDidError = function() --[[ Line: 1720 ]]
    -- upvalues: l_Incomplete_0 (ref), v143 (copy)
    if l_Incomplete_0 ~= v143.Completed then
        l_Incomplete_0 = v143.Errored;
    end;
end;
v3.renderHasNotSuspendedYet = function() --[[ Line: 1728 ]]
    -- upvalues: l_Incomplete_0 (ref), v143 (copy)
    return l_Incomplete_0 == v143.Incomplete;
end;
v142.renderRootSync = function(v308, v309) --[[ Line: 1734 ]]
    -- upvalues: v144 (ref), v142 (copy), v145 (ref), l_NoLanes_0 (ref), l_ReactFeatureFlags_0 (copy), v37 (copy), v38 (copy), l_resetContextDependencies_0 (copy), v146 (ref), l_invariant_0 (copy), v13 (copy), l_Incomplete_0 (ref)
    local l_v144_6 = v144;
    v144 = bit32.bor(v144, 16);
    local v311 = v142.pushDispatcher();
    if v145 ~= v308 or l_NoLanes_0 ~= v309 then
        v142.prepareFreshStack(v308, v309);
        v142.startWorkOnPendingInteractions(v308, v309);
    end;
    local v312 = v142.pushInteractions(v308);
    if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
        v37.logRenderStarted(v309);
    end;
    if l_ReactFeatureFlags_0.enableSchedulingProfiler then
        v38.markRenderStarted(v309);
    end;
    while true do
        local v313 = nil;
        local v314 = nil;
        if not _G.__YOLO__ then
            local l_status_11, l_result_11 = pcall(v142.workLoopSync);
            v313 = l_status_11;
            v314 = l_result_11;
        else
            v313 = true;
            v142.workLoopSync();
        end;
        if not v313 then
            v142.handleError(v308, v314);
        else
            break;
        end;
    end;
    l_resetContextDependencies_0();
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        v142.popInteractions(v312);
    end;
    v144 = l_v144_6;
    v142.popDispatcher(v311);
    if v146 ~= nil then
        l_invariant_0(false, "Cannot commit an incomplete root. This error is likely caused by a " .. "bug in React. Please file an issue.");
    end;
    if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
        v37.logRenderStopped();
    end;
    if l_ReactFeatureFlags_0.enableSchedulingProfiler then
        v38.markRenderStopped();
    end;
    v145 = nil;
    l_NoLanes_0 = v13.NoLanes;
    return l_Incomplete_0;
end;
v142.workLoopSync = function() --[[ Line: 1810 ]]
    -- upvalues: v146 (ref), v142 (copy)
    while v146 ~= nil do
        v142.performUnitOfWork(v146);
    end;
end;
v142.renderRootConcurrent = function(v317, v318) --[[ Line: 1817 ]]
    -- upvalues: v144 (ref), v142 (copy), v145 (ref), l_NoLanes_0 (ref), v158 (ref), l_now_0 (copy), l_ReactFeatureFlags_0 (copy), v37 (copy), v38 (copy), l_resetContextDependencies_0 (copy), v146 (ref), v143 (copy), v13 (copy), l_Incomplete_0 (ref)
    local l_v144_7 = v144;
    v144 = bit32.bor(v144, 16);
    local v320 = v142.pushDispatcher();
    if v145 ~= v317 or l_NoLanes_0 ~= v318 then
        v158 = l_now_0() + 500;
        v142.prepareFreshStack(v317, v318);
        v142.startWorkOnPendingInteractions(v317, v318);
    end;
    local v321 = v142.pushInteractions(v317);
    if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
        v37.logRenderStarted(v318);
    end;
    if l_ReactFeatureFlags_0.enableSchedulingProfiler then
        v38.markRenderStarted(v318);
    end;
    while true do
        local v322 = nil;
        local v323 = nil;
        if not _G.__YOLO__ then
            local l_status_12, l_result_12 = pcall(v142.workLoopConcurrent);
            v322 = l_status_12;
            v323 = l_result_12;
            if v322 then
                v323 = "break";
            end;
        else
            v322 = true;
            v323 = "break";
            v142.workLoopConcurrent();
        end;
        if v323 ~= "break" then
            if not v322 then
                v142.handleError(v317, v323);
            end;
        else
            break;
        end;
    end;
    l_resetContextDependencies_0();
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        v142.popInteractions(v321);
    end;
    v142.popDispatcher(v320);
    v144 = l_v144_7;
    if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
        v37.logRenderStopped();
    end;
    if v146 ~= nil then
        if l_ReactFeatureFlags_0.enableSchedulingProfiler then
            v38.markRenderYielded();
        end;
        return v143.Incomplete;
    else
        if l_ReactFeatureFlags_0.enableSchedulingProfiler then
            v38.markRenderStopped();
        end;
        v145 = nil;
        l_NoLanes_0 = v13.NoLanes;
        return l_Incomplete_0;
    end;
end;
v142.workLoopConcurrent = function() --[[ Line: 1901 ]]
    -- upvalues: v146 (ref), l_shouldYield_0 (copy), v142 (copy)
    while v146 ~= nil and not l_shouldYield_0() do
        v142.performUnitOfWork(v146);
    end;
end;
v142.performUnitOfWork = function(v326) --[[ Line: 1908 ]]
    -- upvalues: l_setCurrentFiber_0 (copy), l_ReactFeatureFlags_0 (copy), v44 (copy), v122 (copy), v142 (copy), v3 (copy), l_resetCurrentFiber_0 (copy), v146 (ref), l_ReactCurrentOwner_0 (copy)
    local l_alternate_1 = v326.alternate;
    l_setCurrentFiber_0(v326);
    local v328 = nil;
    if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(v326.mode, v44.ProfileMode) ~= v44.NoMode then
        v122.startProfilerTimer(v326);
        v328 = v142.beginWork(l_alternate_1, v326, v3.subtreeRenderLanes);
        v122.stopProfilerTimerIfRunningAndRecordDelta(v326, true);
    else
        v328 = v142.beginWork(l_alternate_1, v326, v3.subtreeRenderLanes);
    end;
    l_resetCurrentFiber_0();
    v326.memoizedProps = v326.pendingProps;
    if v328 == nil then
        v142.completeUnitOfWork(v326);
    else
        v146 = v328;
    end;
    l_ReactCurrentOwner_0.current = nil;
end;
v142.completeUnitOfWork = function(v329) --[[ Line: 1936 ]]
    -- upvalues: v47 (copy), l_setCurrentFiber_0 (copy), l_ReactFeatureFlags_0 (copy), v44 (copy), v3 (copy), v104 (copy), v122 (copy), l_resetCurrentFiber_0 (copy), v146 (ref), l_unwindWork_0 (copy), l_Incomplete_0 (ref), v143 (copy)
    local l_v329_0 = v329;
    while true do
        local l_alternate_2 = l_v329_0.alternate;
        local l_return__2 = l_v329_0.return_;
        if bit32.band(l_v329_0.flags, v47.Incomplete) == v47.NoFlags then
            l_setCurrentFiber_0(l_v329_0);
            local v333 = nil;
            if not l_ReactFeatureFlags_0.enableProfilerTimer or bit32.band(l_v329_0.mode, v44.ProfileMode) == v44.NoMode then
                local l_l_v329_0_0 = l_v329_0;
                local l_subtreeRenderLanes_0 = v3.subtreeRenderLanes;
                if not v104.completeWorkRef then
                    v104.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
                end;
                v333 = v104.completeWorkRef(l_alternate_2, l_l_v329_0_0, l_subtreeRenderLanes_0);
            else
                v122.startProfilerTimer(l_v329_0);
                local l_l_v329_0_1 = l_v329_0;
                local l_subtreeRenderLanes_1 = v3.subtreeRenderLanes;
                if not v104.completeWorkRef then
                    v104.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
                end;
                v333 = v104.completeWorkRef(l_alternate_2, l_l_v329_0_1, l_subtreeRenderLanes_1);
                v122.stopProfilerTimerIfRunningAndRecordDelta(l_v329_0, false);
            end;
            l_resetCurrentFiber_0();
            if v333 ~= nil then
                v146 = v333;
                return;
            end;
        else
            local v338 = l_unwindWork_0(l_v329_0, v3.subtreeRenderLanes);
            if v338 ~= nil then
                v338.flags = bit32.band(v338.flags, v47.HostEffectMask);
                v146 = v338;
                return;
            else
                if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(l_v329_0.mode, v44.ProfileMode) ~= v44.NoMode then
                    v122.stopProfilerTimerIfRunningAndRecordDelta(l_v329_0, false);
                    local v339 = l_v329_0.actualDuration or 0;
                    local l_child_0 = l_v329_0.child;
                    while l_child_0 ~= nil do
                        v339 = v339 + (l_child_0.actualDuration or 0);
                        l_child_0 = l_child_0.sibling;
                    end;
                    l_v329_0.actualDuration = v339;
                end;
                if l_return__2 ~= nil then
                    l_return__2.flags = bit32.bor(l_return__2.flags, v47.Incomplete);
                    l_return__2.subtreeFlags = v47.NoFlags;
                    l_return__2.deletions = nil;
                end;
            end;
        end;
        local l_sibling_0 = l_v329_0.sibling;
        if l_sibling_0 ~= nil then
            v146 = l_sibling_0;
            return;
        else
            l_v329_0 = l_return__2;
            v146 = l_v329_0;
            if l_v329_0 == nil then
                if l_Incomplete_0 == v143.Incomplete then
                    l_Incomplete_0 = v143.Completed;
                end;
                return;
            end;
        end;
    end;
end;
v142.commitRoot = function(v342) --[[ Line: 2032 ]]
    -- upvalues: l_getCurrentPriorityLevel_0 (copy), l_runWithPriority_0 (copy), l_ImmediatePriority_0 (copy), v142 (copy)
    local v343 = l_getCurrentPriorityLevel_0();
    l_runWithPriority_0(l_ImmediatePriority_0, function() --[[ Line: 2036 ]]
        -- upvalues: v142 (ref), v342 (copy), v343 (copy)
        return v142.commitRootImpl(v342, v343);
    end);
    return nil;
end;
v142.commitRootImpl = function(v344, v345) --[[ Line: 2044 ]]
    -- upvalues: v3 (copy), v165 (ref), l_invariant_0 (copy), v144 (ref), l_ReactFeatureFlags_0 (copy), v37 (copy), v38 (copy), v13 (copy), l_mergeLanes_0 (copy), l_markRootFinished_0 (copy), v168 (ref), l_hasDiscreteLanes_0 (copy), v145 (ref), v146 (ref), l_NoLanes_0 (ref), v47 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v142 (copy), l_ReactCurrentOwner_0 (copy), v176 (ref), v42 (copy), v177 (ref), v122 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_recursivelyCommitLayoutEffects_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v140 (ref), l_resetCurrentFiber_0 (copy), v164 (ref), l_scheduleCallback_0 (copy), l_NormalPriority_0 (copy), l_requestPaint_0 (copy), l_NoLanes_4 (ref), l_l_NoPriority_0_0 (ref), v172 (ref), v163 (ref), l_enableDoubleInvokingEffects_0 (copy), l_SyncLane_0 (copy), v170 (ref), v169 (ref), l_onCommitRoot_0 (copy), l_onCommitRoot_1 (copy), v103 (ref), l_now_0 (copy), v161 (ref), v162 (ref), l_flushSyncCallbackQueue_0 (copy)
    repeat
        v3.flushPassiveEffects();
    until v165 == nil;
    flushRenderPhaseStrictModeWarningsInDEV();
    l_invariant_0(bit32.band(v144, 48) == 0, "Should not already be working.");
    local l_finishedWork_0 = v344.finishedWork;
    local l_finishedLanes_0 = v344.finishedLanes;
    if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
        v37.logCommitStarted(l_finishedLanes_0);
    end;
    if l_ReactFeatureFlags_0.enableSchedulingProfiler then
        v38.markCommitStarted(l_finishedLanes_0);
    end;
    if l_finishedWork_0 == nil then
        if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
            v37.logCommitStopped();
        end;
        if l_ReactFeatureFlags_0.enableSchedulingProfiler then
            v38.markCommitStopped();
        end;
        return nil;
    else
        v344.finishedWork = nil;
        v344.finishedLanes = v13.NoLanes;
        l_invariant_0(l_finishedWork_0 ~= v344.current, "Cannot commit the same tree as before. This error is likely caused by " .. "a bug in React. Please file an issue.");
        v344.callbackNode = nil;
        local v348 = l_mergeLanes_0(l_finishedWork_0.lanes, l_finishedWork_0.childLanes);
        l_markRootFinished_0(v344, v348);
        if v168 ~= nil and not l_hasDiscreteLanes_0(v348) and v168[v344] ~= nil then
            v168[v344] = nil;
        end;
        if v344 == v145 then
            v145 = nil;
            v146 = nil;
            l_NoLanes_0 = v13.NoLanes;
        end;
        local v349 = bit32.band(l_finishedWork_0.subtreeFlags, (bit32.bor(v47.BeforeMutationMask, v47.MutationMask, v47.LayoutMask, v47.PassiveMask))) ~= v47.NoFlags;
        local v350 = bit32.band(l_finishedWork_0.flags, (bit32.bor(v47.BeforeMutationMask, v47.MutationMask, v47.LayoutMask, v47.PassiveMask))) ~= v47.NoFlags;
        if v349 or v350 then
            local v351 = nil;
            if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
                v351 = l_getCurrentUpdateLanePriority_0();
                l_setCurrentUpdateLanePriority_0(v13.SyncLanePriority);
            end;
            local l_v144_8 = v144;
            v144 = bit32.bor(v144, 32);
            local v353 = v142.pushInteractions(v344);
            l_ReactCurrentOwner_0.current = nil;
            v176 = v42.prepareForCommit(v344.containerInfo);
            v177 = false;
            v142.commitBeforeMutationEffects(l_finishedWork_0);
            v176 = nil;
            if l_ReactFeatureFlags_0.enableProfilerTimer then
                v122.recordCommitTime();
            end;
            v142.commitMutationEffects(l_finishedWork_0, v344, v345);
            if v177 then
                v42.afterActiveInstanceBlur();
            end;
            v42.resetAfterCommit(v344.containerInfo);
            v344.current = l_finishedWork_0;
            if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
                v37.logLayoutEffectsStarted(l_finishedLanes_0);
            end;
            if l_ReactFeatureFlags_0.enableSchedulingProfiler then
                v38.markLayoutEffectsStarted(l_finishedLanes_0);
            end;
            if _G.__DEV__ then
                l_setCurrentFiber_0(l_finishedWork_0);
                l_invokeGuardedCallback_0(nil, l_recursivelyCommitLayoutEffects_0, nil, l_finishedWork_0, v344, v3.captureCommitPhaseError, v3.schedulePassiveEffectCallback);
                if l_hasCaughtError_0() then
                    local v354 = l_clearCaughtError_0();
                    v140(l_finishedWork_0, l_finishedWork_0, v354);
                end;
                l_resetCurrentFiber_0();
            else
                local v355 = nil;
                local v356 = nil;
                if not _G.__YOLO__ then
                    local l_status_13, l_result_13 = pcall(l_recursivelyCommitLayoutEffects_0, l_finishedWork_0, v344, v3.captureCommitPhaseError, v3.schedulePassiveEffectCallback);
                    v355 = l_status_13;
                    v356 = l_result_13;
                else
                    v355 = true;
                    l_recursivelyCommitLayoutEffects_0(l_finishedWork_0, v344, v3.captureCommitPhaseError, v3.schedulePassiveEffectCallback);
                end;
                if not v355 then
                    v140(l_finishedWork_0, l_finishedWork_0, v356);
                end;
            end;
            if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
                v37.logLayoutEffectsStopped();
            end;
            if l_ReactFeatureFlags_0.enableSchedulingProfiler then
                v38.markLayoutEffectsStopped();
            end;
            if (bit32.band(l_finishedWork_0.subtreeFlags, v47.PassiveMask) ~= v47.NoFlags or bit32.band(l_finishedWork_0.flags, v47.PassiveMask) ~= v47.NoFlags) and not v164 then
                v164 = true;
                l_scheduleCallback_0(l_NormalPriority_0, function() --[[ Line: 2261 ]]
                    -- upvalues: v3 (ref)
                    v3.flushPassiveEffects();
                    return nil;
                end);
            end;
            l_requestPaint_0();
            if l_ReactFeatureFlags_0.enableSchedulerTracing then
                v142.popInteractions(v353);
            end;
            v144 = l_v144_8;
            if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler and v351 ~= nil then
                l_setCurrentUpdateLanePriority_0(v351);
            end;
        else
            v344.current = l_finishedWork_0;
            if l_ReactFeatureFlags_0.enableProfilerTimer then
                v122.recordCommitTime();
            end;
        end;
        local l_v164_0 = v164;
        if v164 then
            v164 = false;
            v165 = v344;
            l_NoLanes_4 = l_finishedLanes_0;
            l_l_NoPriority_0_0 = v345;
        end;
        v348 = v344.pendingLanes;
        if v348 ~= v13.NoLanes then
            if l_ReactFeatureFlags_0.enableSchedulerTracing then
                if v172 ~= nil then
                    local l_v172_0 = v172;
                    v172 = nil;
                    for v361 = 1, #l_v172_0 do
                        scheduleInteractions(v344, l_v172_0[v361], v344.memoizedInteractions);
                    end;
                end;
                v142.schedulePendingInteractions(v344, v348);
            end;
        else
            v163 = nil;
        end;
        if _G.__DEV__ and l_enableDoubleInvokingEffects_0 and not l_v164_0 then
            commitDoubleInvokeEffectsInDEV(v344.current, false);
        end;
        if l_ReactFeatureFlags_0.enableSchedulerTracing and not l_v164_0 then
            v142.finishPendingInteractions(v344, l_finishedLanes_0);
        end;
        if v348 == l_SyncLane_0 then
            if v344 == v170 then
                v169 = v169 + 1;
            else
                v169 = 0;
                v170 = v344;
            end;
        else
            v169 = 0;
        end;
        l_onCommitRoot_0(l_finishedWork_0.stateNode, v345);
        if _G.__DEV__ then
            l_onCommitRoot_1();
        end;
        v103(v344, l_now_0());
        if v161 then
            v161 = false;
            local l_v162_0 = v162;
            v162 = nil;
            error(l_v162_0);
        end;
        if bit32.band(v144, 8) ~= 0 then
            if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
                v37.logCommitStopped();
            end;
            if l_ReactFeatureFlags_0.enableSchedulingProfiler then
                v38.markCommitStopped();
            end;
            return nil;
        else
            l_flushSyncCallbackQueue_0();
            if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
                v37.logCommitStopped();
            end;
            if l_ReactFeatureFlags_0.enableSchedulingProfiler then
                v38.markCommitStopped();
            end;
            return nil;
        end;
    end;
end;
v142.commitBeforeMutationEffects = function(v363) --[[ Line: 2409 ]]
    -- upvalues: v142 (copy), v47 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v3 (copy), l_resetCurrentFiber_0 (copy)
    local l_v363_0 = v363;
    while l_v363_0 ~= nil do
        if l_v363_0.deletions ~= nil then
            v142.commitBeforeMutationEffectsDeletions(l_v363_0.deletions);
        end;
        if l_v363_0.child ~= nil and bit32.band(l_v363_0.subtreeFlags, v47.BeforeMutationMask) ~= v47.NoFlags then
            v142.commitBeforeMutationEffects(l_v363_0.child);
        end;
        if _G.__DEV__ then
            l_setCurrentFiber_0(l_v363_0);
            l_invokeGuardedCallback_0(nil, v142.commitBeforeMutationEffectsImpl, nil, l_v363_0);
            if l_hasCaughtError_0() then
                local v365 = l_clearCaughtError_0();
                v3.captureCommitPhaseError(l_v363_0, l_v363_0.return_, v365);
            end;
            l_resetCurrentFiber_0();
        else
            local v366 = nil;
            local v367 = nil;
            if not _G.__YOLO__ then
                local l_status_14, l_result_14 = pcall(v142.commitBeforeMutationEffectsImpl, l_v363_0);
                v366 = l_status_14;
                v367 = l_result_14;
            else
                v366 = true;
                v142.commitBeforeMutationEffectsImpl(l_v363_0);
            end;
            if not v366 then
                v3.captureCommitPhaseError(l_v363_0, l_v363_0.return_, v367);
            end;
        end;
        l_v363_0 = l_v363_0.sibling;
    end;
end;
v142.commitBeforeMutationEffectsImpl = function(v370) --[[ Line: 2450 ]]
    -- upvalues: v177 (ref), v176 (ref), v45 (copy), v86 (copy), l_doesFiberContain_0 (copy), v42 (copy), v47 (copy), l_setCurrentFiber_0 (copy), l_commitBeforeMutationLifeCycles_0 (copy), l_resetCurrentFiber_0 (copy), v164 (ref), l_scheduleCallback_0 (copy), l_NormalPriority_0 (copy), v3 (copy)
    local l_alternate_3 = v370.alternate;
    local l_flags_0 = v370.flags;
    if not v177 and v176 ~= nil and v370.tag == v45.SuspenseComponent and v86.isSuspenseBoundaryBeingHidden(l_alternate_3, v370) and l_doesFiberContain_0(v370, v176) then
        v177 = true;
        v42.beforeActiveInstanceBlur();
    end;
    if bit32.band(l_flags_0, v47.Snapshot) ~= v47.NoFlags then
        l_setCurrentFiber_0(v370);
        l_commitBeforeMutationLifeCycles_0(l_alternate_3, v370);
        l_resetCurrentFiber_0();
    end;
    if bit32.band(l_flags_0, v47.Passive) ~= v47.NoFlags and not v164 then
        v164 = true;
        l_scheduleCallback_0(l_NormalPriority_0, function() --[[ Line: 2478 ]]
            -- upvalues: v3 (ref)
            v3.flushPassiveEffects();
            return nil;
        end);
    end;
end;
v142.commitBeforeMutationEffectsDeletions = function(v373) --[[ Line: 2486 ]]
    -- upvalues: l_doesFiberContain_0 (copy), v176 (ref), v177 (ref), v42 (copy)
    for v374 = 1, #v373 do
        local v375 = v373[v374];
        if l_doesFiberContain_0(v375, v176) then
            v177 = true;
            v42.beforeActiveInstanceBlur();
        end;
    end;
end;
v142.commitMutationEffects = function(v376, v377, v378) --[[ Line: 2501 ]]
    -- upvalues: l_commitDeletion_0 (copy), v3 (copy), v47 (copy), v142 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), l_resetCurrentFiber_0 (copy)
    local l_v376_0 = v376;
    while l_v376_0 ~= nil do
        local l_deletions_0 = l_v376_0.deletions;
        if l_deletions_0 ~= nil then
            for _, v382 in ipairs(l_deletions_0) do
                local l_status_15, l_result_15 = pcall(l_commitDeletion_0, v377, v382, l_v376_0, v378);
                if not l_status_15 then
                    v3.captureCommitPhaseError(v382, l_v376_0, l_result_15);
                end;
            end;
        end;
        if l_v376_0.child ~= nil and bit32.band(l_v376_0.subtreeFlags, v47.MutationMask) ~= v47.NoFlags then
            v142.commitMutationEffects(l_v376_0.child, v377, v378);
        end;
        if _G.__DEV__ then
            l_setCurrentFiber_0(l_v376_0);
            l_invokeGuardedCallback_0(nil, v142.commitMutationEffectsImpl, nil, l_v376_0, v377, v378);
            if l_hasCaughtError_0() then
                local v385 = l_clearCaughtError_0();
                v3.captureCommitPhaseError(l_v376_0, l_v376_0.return_, v385);
            end;
            l_resetCurrentFiber_0();
        else
            local v386 = nil;
            local v387 = nil;
            if not _G.__YOLO__ then
                local l_status_16, l_result_16 = pcall(v142.commitMutationEffectsImpl, l_v376_0, v377, v378);
                v386 = l_status_16;
                v387 = l_result_16;
            else
                v386 = true;
                v142.commitMutationEffectsImpl(l_v376_0, v377, v378);
            end;
            if not v386 then
                v3.captureCommitPhaseError(l_v376_0, l_v376_0.return_, v387);
            end;
        end;
        l_v376_0 = l_v376_0.sibling;
    end;
end;
v142.commitMutationEffectsImpl = function(v390, _, _) --[[ Line: 2565 ]]
    -- upvalues: v47 (copy), l_commitDetachRef_0 (copy), l_commitPlacement_0 (copy), l_commitWork_0 (copy)
    local l_flags_1 = v390.flags;
    if bit32.band(l_flags_1, v47.Ref) ~= 0 then
        local l_alternate_4 = v390.alternate;
        if l_alternate_4 ~= nil then
            l_commitDetachRef_0(l_alternate_4);
        end;
    end;
    local v395 = bit32.band(l_flags_1, (bit32.bor(v47.Placement, v47.Update, v47.Hydrating)));
    if v395 == v47.Placement then
        l_commitPlacement_0(v390);
        v390.flags = bit32.band(v390.flags, (bit32.bnot(v47.Placement)));
        return;
    elseif v395 == v47.PlacementAndUpdate then
        l_commitPlacement_0(v390);
        v390.flags = bit32.band(v390.flags, (bit32.bnot(v47.Placement)));
        local l_alternate_5 = v390.alternate;
        l_commitWork_0(l_alternate_5, v390);
        return;
    else
        if v395 == v47.Update then
            local l_alternate_6 = v390.alternate;
            l_commitWork_0(l_alternate_6, v390);
        end;
        return;
    end;
end;
v142.commitMutationEffectsDeletions = function(v398, v399, v400, v401) --[[ Line: 2631 ]]
    -- upvalues: l_commitDeletion_0 (copy), v3 (copy)
    for _, v403 in ipairs(v398) do
        local l_status_17, l_result_17 = pcall(l_commitDeletion_0, v400, v403, v399, v401);
        if not l_status_17 then
            v3.captureCommitPhaseError(v403, v399, l_result_17);
        end;
    end;
end;
v3.schedulePassiveEffectCallback = function() --[[ Line: 2652 ]]
    -- upvalues: v164 (ref), l_scheduleCallback_0 (copy), l_NormalPriority_0 (copy), v3 (copy)
    if not v164 then
        v164 = true;
        l_scheduleCallback_0(l_NormalPriority_0, function() --[[ Line: 2655 ]]
            -- upvalues: v3 (ref)
            v3.flushPassiveEffects();
            return nil;
        end);
    end;
end;
local v406 = nil;
v3.flushPassiveEffects = function() --[[ Line: 2664 ]]
    -- upvalues: l_l_NoPriority_0_0 (ref), l_NoPriority_0 (copy), l_NormalPriority_0 (copy), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), l_schedulerPriorityToLanePriority_0 (copy), l_runWithPriority_0 (copy), v406 (ref)
    if l_l_NoPriority_0_0 ~= l_NoPriority_0 then
        local v407 = if l_NormalPriority_0 < l_l_NoPriority_0_0 then l_NormalPriority_0 else l_l_NoPriority_0_0;
        l_l_NoPriority_0_0 = l_NoPriority_0;
        if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
            local v408 = l_getCurrentUpdateLanePriority_0();
            l_setCurrentUpdateLanePriority_0(l_schedulerPriorityToLanePriority_0(v407));
            local v409 = nil;
            local v410 = nil;
            if not _G.__YOLO__ then
                local l_status_18, l_result_18 = pcall(l_runWithPriority_0, v407, v406);
                v409 = l_status_18;
                v410 = l_result_18;
            else
                v409 = true;
                l_setCurrentUpdateLanePriority_0(l_schedulerPriorityToLanePriority_0(v407));
                v410 = l_runWithPriority_0(v407, v406);
            end;
            l_setCurrentUpdateLanePriority_0(v408);
            if not v409 then
                error(v410);
            end;
            return v410;
        else
            return l_runWithPriority_0(v407, v406);
        end;
    else
        return false;
    end;
end;
v141 = function(v413, v414) --[[ Line: 2704 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), v45 (copy), v159 (ref), v47 (copy), v141 (ref), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_commitPassiveMount_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v3 (copy), l_resetCurrentFiber_0 (copy)
    local l_v414_0 = v414;
    while l_v414_0 ~= nil do
        local v416 = nil;
        if l_ReactFeatureFlags_0.enableProfilerTimer and l_ReactFeatureFlags_0.enableProfilerCommitHooks and l_v414_0.tag == v45.Profiler then
            v416 = v159;
            v159 = l_v414_0;
        end;
        local v417 = bit32.band(l_v414_0.subtreeFlags, v47.PassiveMask);
        if l_v414_0.child ~= nil and v417 ~= v47.NoFlags then
            v141(v413, l_v414_0.child);
        end;
        if bit32.band(l_v414_0.flags, v47.Passive) ~= v47.NoFlags then
            if _G.__DEV__ then
                l_setCurrentFiber_0(l_v414_0);
                l_invokeGuardedCallback_0(nil, l_commitPassiveMount_0, nil, v413, l_v414_0);
                if l_hasCaughtError_0() then
                    local v418 = l_clearCaughtError_0();
                    v3.captureCommitPhaseError(l_v414_0, l_v414_0.return_, v418);
                end;
                l_resetCurrentFiber_0();
            else
                local v419 = nil;
                local v420 = nil;
                if not _G.__YOLO__ then
                    local l_status_19, l_result_19 = pcall(l_commitPassiveMount_0, v413, l_v414_0);
                    v419 = l_status_19;
                    v420 = l_result_19;
                else
                    v419 = true;
                    l_commitPassiveMount_0(v413, l_v414_0);
                end;
                if not v419 then
                    v3.captureCommitPhaseError(l_v414_0, l_v414_0.return_, v420);
                end;
            end;
        end;
        if l_ReactFeatureFlags_0.enableProfilerTimer and l_ReactFeatureFlags_0.enableProfilerCommitHooks and l_v414_0.tag == v45.Profiler then
            if v416 ~= nil then
                local l_stateNode_0 = v416.stateNode;
                l_stateNode_0.passiveEffectDuration = l_stateNode_0.passiveEffectDuration + l_v414_0.stateNode.passiveEffectDuration;
            end;
            v159 = v416;
        end;
        l_v414_0 = l_v414_0.sibling;
    end;
end;
local function v424(v425) --[[ Line: 2770 ]] --[[ Name: flushPassiveUnmountEffects ]]
    -- upvalues: v142 (copy), v47 (copy), v424 (copy), l_setCurrentFiber_0 (copy), l_commitPassiveUnmount_0 (copy), l_resetCurrentFiber_0 (copy)
    local l_v425_0 = v425;
    while l_v425_0 ~= nil do
        local l_deletions_1 = l_v425_0.deletions;
        if l_deletions_1 ~= nil then
            for v428 = 1, #l_deletions_1 do
                local v429 = l_deletions_1[v428];
                v142.flushPassiveUnmountEffectsInsideOfDeletedTree(v429, l_v425_0);
                v142.detachFiberAfterEffects(v429);
            end;
        end;
        local l_child_1 = l_v425_0.child;
        if l_child_1 ~= nil and bit32.band(l_v425_0.subtreeFlags, v47.PassiveMask) ~= v47.NoFlags then
            v424(l_child_1);
        end;
        if bit32.band(l_v425_0.flags, v47.Passive) ~= v47.NoFlags then
            l_setCurrentFiber_0(l_v425_0);
            l_commitPassiveUnmount_0(l_v425_0);
            l_resetCurrentFiber_0();
        end;
        l_v425_0 = l_v425_0.sibling;
    end;
end;
v142.flushPassiveUnmountEffectsInsideOfDeletedTree = function(v431, v432) --[[ Line: 2808 ]]
    -- upvalues: v47 (copy), v142 (copy), l_setCurrentFiber_0 (copy), l_commitPassiveUnmountInsideDeletedTree_0 (copy), l_resetCurrentFiber_0 (copy)
    if bit32.band(v431.subtreeFlags, v47.PassiveStatic) ~= v47.NoFlags then
        local l_child_2 = v431.child;
        while l_child_2 ~= nil do
            v142.flushPassiveUnmountEffectsInsideOfDeletedTree(l_child_2, v432);
            l_child_2 = l_child_2.sibling;
        end;
    end;
    if bit32.band(v431.flags, v47.PassiveStatic) ~= v47.NoFlags then
        l_setCurrentFiber_0(v431);
        l_commitPassiveUnmountInsideDeletedTree_0(v431, v432);
        l_resetCurrentFiber_0();
    end;
end;
v406 = function() --[[ Line: 2837 ]]
    -- upvalues: v165 (ref), l_NoLanes_4 (ref), v13 (copy), l_invariant_0 (copy), v144 (ref), l_ReactFeatureFlags_0 (copy), v37 (copy), v38 (copy), v142 (copy), v424 (copy), v141 (ref), l_enableDoubleInvokingEffects_0 (copy), l_flushSyncCallbackQueue_0 (copy), v171 (ref)
    if v165 == nil then
        return false;
    else
        local l_v165_0 = v165;
        local l_l_NoLanes_4_0 = l_NoLanes_4;
        v165 = nil;
        l_NoLanes_4 = v13.NoLanes;
        l_invariant_0(bit32.band(v144, 48) == 0, "Cannot flush passive effects while already rendering.");
        if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
            v37.logPassiveEffectsStarted(l_l_NoLanes_4_0);
        end;
        if l_ReactFeatureFlags_0.enableSchedulingProfiler then
            v38.markPassiveEffectsStarted(l_l_NoLanes_4_0);
        end;
        local l_v144_9 = v144;
        v144 = bit32.bor(v144, 32);
        local v437 = v142.pushInteractions(l_v165_0);
        v424(l_v165_0.current);
        v141(l_v165_0, l_v165_0.current);
        if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
            v37.logPassiveEffectsStopped();
        end;
        if l_ReactFeatureFlags_0.enableSchedulingProfiler then
            v38.markPassiveEffectsStopped();
        end;
        if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
            commitDoubleInvokeEffectsInDEV(l_v165_0.current, true);
        end;
        if l_ReactFeatureFlags_0.enableSchedulerTracing then
            v142.popInteractions(v437);
            v142.finishPendingInteractions(l_v165_0, l_l_NoLanes_4_0);
        end;
        v144 = l_v144_9;
        l_flushSyncCallbackQueue_0();
        if v165 == nil then
            v171 = 0;
        else
            v171 = v171 + 1;
        end;
        return true;
    end;
end;
v3.isAlreadyFailedLegacyErrorBoundary = function(v438) --[[ Line: 2910 ]]
    -- upvalues: v163 (ref)
    local v439 = false;
    if v163 ~= nil then
        v439 = v163:has(v438);
    end;
    return v439;
end;
v3.markLegacyErrorBoundaryAsFailed = function(v440) --[[ Line: 2916 ]]
    -- upvalues: v163 (ref), l_Set_0 (copy)
    if v163 == nil then
        v163 = l_Set_0.new({
            v440
        });
        return;
    else
        v163:add(v440);
        return;
    end;
end;
v3.onUncaughtError = function(v441) --[[ Line: 2925 ]] --[[ Name: prepareToThrowUncaughtError ]]
    -- upvalues: v161 (ref), v162 (ref)
    if not v161 then
        v161 = true;
        v162 = v441;
    end;
end;
v140 = function(v442, v443, v444) --[[ Line: 2933 ]]
    -- upvalues: l_createCapturedValue_0 (copy), l_createRootErrorUpdate_0 (copy), l_SyncLane_0 (copy), v3 (copy), l_enqueueUpdate_0 (copy), v142 (copy), l_markRootUpdated_0 (copy), v103 (ref)
    local v445 = l_createCapturedValue_0(v444, v443);
    local v446 = l_createRootErrorUpdate_0(v442, v445, l_SyncLane_0, v3.onUncaughtError);
    l_enqueueUpdate_0(v442, v446);
    local v447 = v3.requestEventTime();
    local v448 = v142.markUpdateLaneFromFiberToRoot(v442, l_SyncLane_0);
    if v448 ~= nil then
        l_markRootUpdated_0(v448, l_SyncLane_0, v447);
        v103(v448, v447);
        v142.schedulePendingInteractions(v448, l_SyncLane_0);
    end;
end;
v3.captureCommitPhaseError = function(v449, v450, v451) --[[ Line: 2956 ]]
    -- upvalues: v45 (copy), v140 (ref), l_skipUnmountedBoundaries_0 (copy), v3 (copy), l_createCapturedValue_0 (copy), l_createClassErrorUpdate_0 (copy), l_SyncLane_0 (copy), l_enqueueUpdate_0 (copy), v142 (copy), l_markRootUpdated_0 (copy), v103 (ref)
    if v449.tag == v45.HostRoot then
        v140(v449, v449, v451);
        return;
    else
        local v452 = nil;
        v452 = if l_skipUnmountedBoundaries_0 then v450 else v449.return_;
        while true do
            if v452 ~= nil then
                if v452.tag == v45.HostRoot then
                    v140(v452, v449, v451);
                    return;
                else
                    if v452.tag == v45.ClassComponent then
                        local l_type_0 = v452.type;
                        local l_stateNode_1 = v452.stateNode;
                        if typeof(l_type_0.getDerivedStateFromError) == "function" or typeof(l_stateNode_1.componentDidCatch) == "function" and not v3.isAlreadyFailedLegacyErrorBoundary(l_stateNode_1) then
                            local v455 = l_createCapturedValue_0(v451, v449);
                            local v456 = l_createClassErrorUpdate_0(v452, v455, l_SyncLane_0);
                            l_enqueueUpdate_0(v452, v456);
                            local v457 = v3.requestEventTime();
                            local v458 = v142.markUpdateLaneFromFiberToRoot(v452, l_SyncLane_0);
                            if v458 ~= nil then
                                l_markRootUpdated_0(v458, l_SyncLane_0, v457);
                                v103(v458, v457);
                                v142.schedulePendingInteractions(v458, l_SyncLane_0);
                            end;
                            return;
                        end;
                    end;
                    v452 = v452.return_;
                end;
            else
                return;
            end;
        end;
    end;
end;
v3.pingSuspendedRoot = function(v459, v460, v461) --[[ Line: 3009 ]]
    -- upvalues: v3 (copy), l_markRootPinged_0 (copy), v145 (ref), l_isSubsetOfLanes_0 (copy), l_NoLanes_0 (ref), l_Incomplete_0 (ref), v143 (copy), l_includesOnlyRetries_0 (copy), l_now_0 (copy), v157 (ref), v142 (copy), v13 (copy), l_NoLanes_3 (ref), l_mergeLanes_0 (copy), v103 (ref)
    local l_pingCache_0 = v459.pingCache;
    if l_pingCache_0 ~= nil then
        l_pingCache_0[v460] = nil;
    end;
    local v463 = v3.requestEventTime();
    l_markRootPinged_0(v459, v461, v463);
    if v145 == v459 and l_isSubsetOfLanes_0(l_NoLanes_0, v461) then
        if l_Incomplete_0 == v143.SuspendedWithDelay or l_Incomplete_0 == v143.Suspended and l_includesOnlyRetries_0(l_NoLanes_0) and l_now_0() - v157 < 500 then
            v142.prepareFreshStack(v459, v13.NoLanes);
        else
            l_NoLanes_3 = l_mergeLanes_0(l_NoLanes_3, v461);
        end;
    end;
    v103(v459, v463);
    v142.schedulePendingInteractions(v459, v461);
end;
retryTimedOutBoundary = function(v464, v465) --[[ Line: 3059 ]] --[[ Name: retryTimedOutBoundary ]]
    -- upvalues: v13 (copy), v3 (copy), v142 (copy), l_markRootUpdated_0 (copy), v103 (ref)
    if v465 == v13.NoLane then
        v465 = requestRetryLane(v464);
    end;
    local v466 = v3.requestEventTime();
    local v467 = v142.markUpdateLaneFromFiberToRoot(v464, v465);
    if v467 ~= nil then
        l_markRootUpdated_0(v467, v465, v466);
        v103(v467, v466);
        v142.schedulePendingInteractions(v467, v465);
    end;
end;
v3.resolveRetryWakeable = function(v468, v469) --[[ Line: 3086 ]]
    -- upvalues: v13 (copy)
    local l_NoLane_0 = v13.NoLane;
    local v471 = nil;
    v471 = v468.stateNode;
    if v471 ~= nil then
        v471:delete(v469);
    end;
    retryTimedOutBoundary(v468, l_NoLane_0);
end;
jnd = function(v472) --[[ Line: 3130 ]] --[[ Name: jnd ]]
    if v472 < 120 then
        return 120;
    elseif v472 < 480 then
        return 480;
    elseif v472 < 1080 then
        return 1080;
    elseif v472 < 1920 then
        return 1920;
    elseif v472 < 3000 then
        return 3000;
    elseif v472 < 4320 then
        return 4320;
    else
        return math.ceil(v472 / 1960) * 1960;
    end;
end;
v142.checkForNestedUpdates = function() --[[ Line: 3148 ]]
    -- upvalues: v169 (ref), v170 (ref), l_invariant_0 (copy), v171 (ref), l_console_0 (copy)
    if v169 > 50 then
        v169 = 0;
        v170 = nil;
        l_invariant_0(false, "Maximum update depth exceeded. This can happen when a component " .. "repeatedly calls setState inside componentWillUpdate or " .. "componentDidUpdate. React limits the number of nested updates to " .. "prevent infinite loops.");
    end;
    if _G.__DEV__ and v171 > 50 then
        v171 = 0;
        l_console_0.error("Maximum update depth exceeded. This can happen when a component " .. "calls setState inside useEffect, but useEffect either doesn't " .. "have a dependency array, or one of the dependencies changes on " .. "every render.");
    end;
end;
flushRenderPhaseStrictModeWarningsInDEV = function() --[[ Line: 3174 ]] --[[ Name: flushRenderPhaseStrictModeWarningsInDEV ]]
    -- upvalues: v124 (copy), l_ReactFeatureFlags_0 (copy)
    if _G.__DEV__ then
        v124.flushLegacyContextWarning();
        if l_ReactFeatureFlags_0.warnAboutDeprecatedLifecycles then
            v124.flushPendingUnsafeLifecycleWarnings();
        end;
    end;
end;
commitDoubleInvokeEffectsInDEV = function(v473, v474) --[[ Line: 3184 ]] --[[ Name: commitDoubleInvokeEffectsInDEV ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), l_setCurrentFiber_0 (copy), v47 (copy), l_invokeLayoutEffectUnmountInDEV_0 (copy), l_invokePassiveEffectUnmountInDEV_0 (copy), l_invokeLayoutEffectMountInDEV_0 (copy), l_invokePassiveEffectMountInDEV_0 (copy), l_resetCurrentFiber_0 (copy)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        l_setCurrentFiber_0(v473);
        invokeEffectsInDev(v473, v47.MountLayoutDev, l_invokeLayoutEffectUnmountInDEV_0);
        if v474 then
            invokeEffectsInDev(v473, v47.MountPassiveDev, l_invokePassiveEffectUnmountInDEV_0);
        end;
        invokeEffectsInDev(v473, v47.MountLayoutDev, l_invokeLayoutEffectMountInDEV_0);
        if v474 then
            invokeEffectsInDev(v473, v47.MountPassiveDev, l_invokePassiveEffectMountInDEV_0);
        end;
        l_resetCurrentFiber_0();
    end;
end;
invokeEffectsInDev = function(v475, v476, v477) --[[ Line: 3207 ]] --[[ Name: invokeEffectsInDev ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), v47 (copy)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        local l_v475_0 = v475;
        while l_v475_0 ~= nil do
            if l_v475_0.child ~= nil and bit32.band(l_v475_0.subtreeFlags, v476) ~= v47.NoFlags then
                invokeEffectsInDev(l_v475_0.child, v476, v477);
            end;
            if bit32.band(l_v475_0.flags, v476) ~= v47.NoFlags then
                v477(l_v475_0);
            end;
            l_v475_0 = l_v475_0.sibling;
        end;
    end;
end;
local v479 = nil;
v142.warnAboutUpdateOnNotYetMountedFiberInDEV = function(v480) --[[ Line: 3233 ]]
    -- upvalues: v144 (ref), v44 (copy), v45 (copy), l_getComponentName_0 (copy), v479 (ref), v125 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_resetCurrentFiber_0 (copy)
    if _G.__DEV__ then
        if bit32.band(v144, 16) ~= 0 then
            return;
        elseif bit32.band(v480.mode, (bit32.bor(v44.BlockingMode, v44.ConcurrentMode))) == 0 then
            return;
        else
            local l_tag_0 = v480.tag;
            if l_tag_0 ~= v45.IndeterminateComponent and l_tag_0 ~= v45.HostRoot and l_tag_0 ~= v45.ClassComponent and l_tag_0 ~= v45.FunctionComponent and l_tag_0 ~= v45.ForwardRef and l_tag_0 ~= v45.MemoComponent and l_tag_0 ~= v45.SimpleMemoComponent and l_tag_0 ~= v45.Block then
                return;
            else
                local v482 = l_getComponentName_0(v480.type) or "ReactComponent";
                if v479 ~= nil then
                    if v479[v482] then
                        return;
                    else
                        v479[v482] = true;
                    end;
                else
                    v479 = {
                        [v482] = true
                    };
                end;
                local l_current_3 = v125.current;
                local l_status_20, l_result_20 = pcall(function() --[[ Line: 3273 ]]
                    -- upvalues: l_setCurrentFiber_0 (ref), v480 (copy), l_console_0 (ref)
                    l_setCurrentFiber_0(v480);
                    l_console_0.error("Can't perform a React state update on a component that hasn't mounted yet. " .. "This indicates that you have a side-effect in your render function that " .. "asynchronously later calls tries to update the component. Move this work to " .. "useEffect instead.");
                end);
                if l_current_3 then
                    l_setCurrentFiber_0(v480);
                else
                    l_resetCurrentFiber_0();
                end;
                if not l_status_20 then
                    error(l_result_20);
                end;
            end;
        end;
    end;
end;
if _G.__DEV__ and l_ReactFeatureFlags_0.replayFailedUnitOfWorkWithInvokeGuardedCallback then
    v142.beginWork = function(v486, v487, v488) --[[ Line: 3300 ]]
        -- upvalues: v43 (copy), v108 (copy), l_resetContextDependencies_0 (copy), v104 (copy), v113 (ref), l_unwindInterruptedWork_0 (copy), l_ReactFeatureFlags_0 (copy), v44 (copy), v122 (copy), l_invokeGuardedCallback_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy)
        local v489 = v43.assignFiberPropertiesInDEV(nil, v487);
        local l_status_21, l_result_21 = pcall(v108, v486, v487, v488);
        if not l_status_21 then
            if l_result_21 ~= nil and typeof(l_result_21) == "table" and typeof(l_result_21.andThen) == "function" then
                error(l_result_21);
            end;
            l_resetContextDependencies_0();
            if not v104.resetHooksAfterThrowRef then
                v113 = require(script.Parent["ReactFiberHooks.new"]);
                v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
                v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
                v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
            end;
            local v492 = v104.resetHooksAfterThrowRef();
            l_unwindInterruptedWork_0(v487);
            v43.assignFiberPropertiesInDEV(v487, v489);
            if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(v487.mode, v44.ProfileMode) ~= 0 then
                v122.startProfilerTimer(v487);
            end;
            l_invokeGuardedCallback_0(nil, v108, nil, v486, v487, v488);
            if l_hasCaughtError_0() then
                v492 = l_clearCaughtError_0();
                error(v492);
                return l_result_21;
            else
                error(l_result_21);
            end;
        end;
        return l_result_21;
    end;
else
    v142.beginWork = v108;
end;
local v493 = false;
local v494 = nil;
if _G.__DEV__ then
    v494 = {};
end;
v142.warnAboutRenderPhaseUpdatesInDEV = function(v495) --[[ Line: 3376 ]]
    -- upvalues: v125 (copy), v144 (ref), v104 (copy), v113 (ref), v45 (copy), v146 (ref), l_getComponentName_0 (copy), v494 (ref), l_console_0 (copy), v493 (ref)
    if _G.__DEV__ and v125.isRendering and bit32.band(v144, 16) ~= 0 then
        if not v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
            v113 = require(script.Parent["ReactFiberHooks.new"]);
            v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
            v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
            v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
        end;
        if not v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef() then
            if v495.tag == v45.FunctionComponent or v495.tag == v45.ForwardRef or v495.tag == v45.SimpleMemoComponent then
                local v496 = if v146 ~= nil then l_getComponentName_0(v146.type) else "Unknown";
                if v494[v496] == nil then
                    v494[v496] = true;
                    local v497 = l_getComponentName_0(v495.type) or "Unknown";
                    l_console_0.error("Cannot update a component (`%s`) while rendering a " .. "different component (`%s`). To locate the bad setState() call inside `%s`, " .. "follow the stack trace as described in https://reactjs.org/link/setstate-in-render", v497, v496, v496);
                    return;
                end;
            elseif v495.tag == v45.ClassComponent and not v493 then
                l_console_0.error("Cannot update during an existing state transition (such as " .. "within `render`). Render methods should be a pure " .. "function of props and state.");
                v493 = true;
            end;
        end;
    end;
end;
v3.IsThisRendererActing = {
    current = false
};
v3.warnIfNotScopedWithMatchingAct = function(v498) --[[ Line: 3426 ]]
    -- upvalues: v42 (copy), l_IsSomeRendererActing_0 (copy), v3 (copy), v125 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_resetCurrentFiber_0 (copy)
    if _G.__DEV__ and v42.warnsIfNotActing == true and l_IsSomeRendererActing_0.current == true and v3.IsThisRendererActing.current ~= true then
        local l_current_4 = v125.current;
        local l_status_22, l_result_22 = pcall(function() --[[ Line: 3434 ]]
            -- upvalues: l_setCurrentFiber_0 (ref), v498 (copy), l_console_0 (ref)
            l_setCurrentFiber_0(v498);
            l_console_0.error("It looks like you're using the wrong act() around your test interactions.\n" .. "Be sure to use the matching version of act() corresponding to your renderer:\n\n" .. "-- for react-roblox:\n" .. "local React = require(Packages.React)\n" .. "-- ...\n" .. "React.TestUtils.act(function() ... end)\n\n" .. "-- for react-test-renderer:\n" .. "local TestRenderer = require(Packages.ReactTestRenderer)\n" .. "-- ...\n" .. "TestRenderer.act(function() ... end)");
        end);
        if l_current_4 then
            l_setCurrentFiber_0(v498);
        else
            l_resetCurrentFiber_0();
        end;
        if not l_status_22 then
            error(l_result_22);
        end;
    end;
end;
v3.warnIfNotCurrentlyActingEffectsInDEV = function(v502) --[[ Line: 3470 ]]
    -- upvalues: v42 (copy), v44 (copy), l_IsSomeRendererActing_0 (copy), v3 (copy), l_console_0 (copy), l_getComponentName_0 (copy)
    if _G.__DEV__ and v42.warnsIfNotActing == true and bit32.band(v502.mode, v44.StrictMode) ~= v44.NoMode and l_IsSomeRendererActing_0.current == false and v3.IsThisRendererActing.current == false then
        l_console_0.error("An update to %s ran an effect, but was not wrapped in act(...).\n\n" .. "When testing, code that causes React state updates should be " .. "wrapped into act(...):\n\n" .. "act(function()\n" .. "  --[[ fire events that update state ]]\n" .. "end)\n" .. "--[[ assert on the output ]]\n\n" .. "This ensures that you're testing the behavior the user would see " .. "in the real client." .. " Learn more at https://reactjs.org/link/wrap-tests-with-act", l_getComponentName_0(v502.type));
    end;
end;
v3.warnIfNotCurrentlyActingUpdatesInDEV = function(v503) --[[ Line: 3496 ]]
    -- upvalues: v42 (copy), v144 (ref), l_IsSomeRendererActing_0 (copy), v3 (copy), l_current_0 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_resetCurrentFiber_0 (copy)
    if _G.__DEV__ and v42.warnsIfNotActing == true and v144 == 0 and l_IsSomeRendererActing_0.current == false and v3.IsThisRendererActing.current == false then
        local l_l_current_0_0 = l_current_0;
        local l_status_23, l_result_23 = pcall(function() --[[ Line: 3505 ]]
            -- upvalues: l_setCurrentFiber_0 (ref), v503 (copy), l_console_0 (ref), l_getComponentName_0 (ref)
            l_setCurrentFiber_0(v503);
            l_console_0.error("An update to %s inside a test was not wrapped in act(...).\n\n" .. "When testing, code that causes React state updates should be " .. "wrapped into act(...):\n\n" .. "act(function()\n" .. "  --[[ fire events that update state ]]\n" .. "end)\n" .. "--[[ assert on the output ]]\n\n" .. "This ensures that you're testing the behavior the user would see " .. "in the client application." .. " Learn more at https://reactjs.org/link/wrap-tests-with-act", l_getComponentName_0(v503.type));
        end);
        if l_l_current_0_0 then
            l_setCurrentFiber_0(v503);
        else
            l_resetCurrentFiber_0();
        end;
        if l_status_23 then
            return l_result_23;
        end;
    end;
end;
local v507 = false;
v3.warnIfUnmockedScheduler = function(v508) --[[ Line: 3546 ]]
    -- upvalues: v507 (ref), v14 (copy), v44 (copy), l_console_0 (copy), l_ReactFeatureFlags_0 (copy)
    if _G.__DEV__ and v507 == false and v14.unstable_flushAllWithoutAsserting == nil then
        if bit32.band(v508.mode, v44.BlockingMode) ~= 0 or bit32.band(v508.mode, v44.ConcurrentMode) ~= 0 then
            v507 = true;
            l_console_0.error("In Concurrent or Sync modes, the 'scheduler' module needs to be mocked " .. "to guarantee consistent behaviour across tests and client application. " .. "For example, with RobloxJest: \n" .. "RobloxJest.mock('scheduler', function() return require(Packages.Scheduler).unstable_mock end)\n\n" .. "For more info, visit https://reactjs.org/link/mock-scheduler");
            return;
        elseif l_ReactFeatureFlags_0.warnAboutUnmockedScheduler == true then
            v507 = true;
            l_console_0.error("Starting from React v18, the 'scheduler' module will need to be mocked " .. "to guarantee consistent behaviour across tests and client applications. " .. "For example, with RobloxJest: \n" .. "RobloxJest.mock('scheduler', function() return require(Packages.Scheduler).unstable_mock end)\n\n" .. "For more info, visit https://reactjs.org/link/mock-scheduler");
        end;
    end;
end;
computeThreadID = function(v509, v510) --[[ Line: 3587 ]] --[[ Name: computeThreadID ]]
    return v510 * 1000 + v509.interactionThreadID;
end;
v3.markSpawnedWork = function(v511) --[[ Line: 3595 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), v172 (ref)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    elseif v172 == nil then
        v172 = {
            v511
        };
        return;
    else
        table.insert(v172, v511);
        return;
    end;
end;
scheduleInteractions = function(v512, v513, v514) --[[ Line: 3607 ]] --[[ Name: scheduleInteractions ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), v8 (copy), l___subscriberRef_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        if next(v514) ~= nil then
            local l_pendingInteractionMap_0 = v512.pendingInteractionMap;
            local v516 = l_pendingInteractionMap_0[v513];
            if v516 ~= nil then
                if v514.ipairs ~= nil then
                    for _, v518 in v514:ipairs() do
                        if not v516[v518] then
                            v518.__count = v518.__count + 1;
                        end;
                        v516[v518] = true;
                    end;
                else
                    for _, v520 in ipairs(v514) do
                        if not v516[v520] then
                            v520.__count = v520.__count + 1;
                        end;
                        v516[v520] = true;
                    end;
                end;
            else
                l_pendingInteractionMap_0[v513] = v8(v514);
                if v514.ipairs ~= nil then
                    for _, v522 in v514:ipairs() do
                        v522.__count = v522.__count + 1;
                    end;
                else
                    for _, v524 in ipairs(v514) do
                        v524.__count = v524.__count + 1;
                    end;
                end;
            end;
            local l_current_5 = l___subscriberRef_0.current;
            if l_current_5 ~= nil then
                local v526 = computeThreadID(v512, v513);
                l_current_5.onWorkScheduled(v514, v526);
            end;
        end;
        return;
    end;
end;
v142.schedulePendingInteractions = function(v527, v528) --[[ Line: 3662 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___interactionsRef_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        scheduleInteractions(v527, v528, l___interactionsRef_0.current);
        return;
    end;
end;
v142.startWorkOnPendingInteractions = function(v529, v530) --[[ Line: 3673 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l_Set_0 (copy), l_includesSomeLane_0 (copy), l___subscriberRef_0 (copy), l_scheduleCallback_0 (copy), l_ImmediatePriority_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        local v531 = l_Set_0.new();
        for v532, v533 in pairs(v529.pendingInteractionMap) do
            if l_includesSomeLane_0(v530, v532) then
                for _, v535 in v533:ipairs() do
                    v531:add(v535);
                end;
            end;
        end;
        v529.memoizedInteractions = v531;
        if next(v531) ~= nil then
            local l_current_6 = l___subscriberRef_0.current;
            if l_current_6 ~= nil then
                local v537 = computeThreadID(v529, v530);
                local l_status_24, l_result_24 = pcall(l_current_6.onWorkStarted, v531, v537);
                if not l_status_24 then
                    l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3706 ]]
                        -- upvalues: l_result_24 (copy)
                        error(l_result_24);
                    end);
                end;
            end;
        end;
        return;
    end;
end;
v142.finishPendingInteractions = function(v540, v541) --[[ Line: 3714 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___subscriberRef_0 (copy), l_includesSomeLane_0 (copy), l_scheduleCallback_0 (copy), l_ImmediatePriority_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        local l_pendingLanes_0 = v540.pendingLanes;
        local v543 = nil;
        local v544 = true;
        local v545 = nil;
        if v543 ~= nil then
            local l_memoizedInteractions_0 = v540.memoizedInteractions;
            if next(l_memoizedInteractions_0) ~= nil then
                local v547 = computeThreadID(v540, v541);
                v543 = l___subscriberRef_0.current;
                local v548;
                l_memoizedInteractions_0, v548 = pcall(v543.onWorkStopped, v540.memoizedInteractions, v547);
                v544 = l_memoizedInteractions_0;
                v545 = v548;
            end;
        end;
        local l_pendingInteractionMap_1 = v540.pendingInteractionMap;
        for v550, v551 in pairs(l_pendingInteractionMap_1) do
            if not l_includesSomeLane_0(l_pendingLanes_0, v550) then
                l_pendingInteractionMap_1[v550] = nil;
                if v551.size ~= 0 then
                    if v551.ipairs ~= nil then
                        for _, v553 in v551:ipairs() do
                            v553.__count = v553.__count - 1;
                            if v543 ~= nil and v553.__count == 0 then
                                local l_status_25, l_result_25 = pcall(v543.onInteractionScheduledWorkCompleted, v553);
                                if not l_status_25 then
                                    l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3759 ]]
                                        -- upvalues: l_result_25 (copy)
                                        error(l_result_25);
                                    end);
                                end;
                            end;
                        end;
                    else
                        for _, v557 in ipairs(v551) do
                            v557.__count = v557.__count - 1;
                            if v543 ~= nil and v557.__count == 0 then
                                local l_status_26, l_result_26 = pcall(v543.onInteractionScheduledWorkCompleted, v557);
                                if not l_status_26 then
                                    l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3773 ]]
                                        -- upvalues: l_result_26 (copy)
                                        error(l_result_26);
                                    end);
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        if not v544 then
            l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3785 ]]
                -- upvalues: v545 (ref)
                error(v545);
            end);
        end;
        return;
    end;
end;
local v560 = false;
local v561 = false;
local l_unstable_flushAllWithoutAsserting_0 = v14.unstable_flushAllWithoutAsserting;
local v563 = typeof(l_unstable_flushAllWithoutAsserting_0) == "function";
local function v571() --[[ Line: 3804 ]] --[[ Name: flushActWork ]]
    -- upvalues: l_unstable_flushAllWithoutAsserting_0 (copy), v560 (ref), v3 (copy)
    if l_unstable_flushAllWithoutAsserting_0 ~= nil then
        local l_v560_0 = v560;
        v560 = true;
        local l_status_27, l_result_27 = pcall(l_unstable_flushAllWithoutAsserting_0);
        v560 = l_v560_0;
        if not l_status_27 then
            error(l_result_27);
            return;
        else
            return l_result_27;
        end;
    else
        local l_v560_1 = v560;
        v560 = true;
        local l_status_28, l_result_28 = pcall(function() --[[ Line: 3824 ]]
            -- upvalues: v3 (ref)
            local v568 = false;
            while v3.flushPassiveEffects() do
                v568 = true;
            end;
            return v568;
        end);
        v560 = l_v560_1;
        if not l_status_28 then
            error(l_result_28);
            return;
        else
            return l_result_28;
        end;
    end;
end;
local function v572(v573) --[[ Line: 3843 ]] --[[ Name: flushWorkAndMicroTasks ]]
    -- upvalues: v571 (copy), l_enqueueTask_0 (copy), v572 (copy)
    local l_status_29, l_result_29 = pcall(v571);
    if l_status_29 then
        local l_status_30, l_result_30 = pcall(l_enqueueTask_0, function() --[[ Line: 3847 ]]
            -- upvalues: v571 (ref), v572 (ref), v573 (copy)
            if v571() then
                v572(v573);
                return;
            else
                v573();
                return;
            end;
        end);
        l_status_29 = l_status_30;
        l_result_29 = l_result_30;
    end;
    if not l_status_29 then
        v573(l_result_29);
    end;
end;
v3.act = function(v578) --[[ Line: 3861 ]]
    -- upvalues: v210 (ref), l_console_0 (copy), v209 (ref), l_IsSomeRendererActing_0 (copy), v3 (copy), v561 (ref), v100 (copy), v563 (copy), v572 (copy), v571 (copy)
    if not _G.__DEV__ and not _G.__ROACT_17_MOCK_SCHEDULER__ and v210 == false then
        v210 = true;
        l_console_0.error("act(...) is not supported in production builds of React, and might not behave as expected.");
    end;
    local l_v209_0 = v209;
    v209 = v209 + 1;
    local l_current_7 = l_IsSomeRendererActing_0.current;
    local l_current_8 = v3.IsThisRendererActing.current;
    local l_v561_0 = v561;
    l_IsSomeRendererActing_0.current = true;
    v3.IsThisRendererActing.current = true;
    v561 = true;
    local function _() --[[ Line: 3886 ]] --[[ Name: onDone ]]
        -- upvalues: v209 (ref), l_IsSomeRendererActing_0 (ref), l_current_7 (copy), v3 (ref), l_current_8 (copy), v561 (ref), l_v561_0 (copy), l_v209_0 (copy), l_console_0 (ref)
        v209 = v209 - 1;
        l_IsSomeRendererActing_0.current = l_current_7;
        v3.IsThisRendererActing.current = l_current_8;
        v561 = l_v561_0;
        if _G.__DEV__ and l_v209_0 < v209 then
            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
        end;
    end;
    local l_status_31, l_result_31 = pcall(v3.batchedUpdates, v578);
    if not l_status_31 then
        v209 = v209 - 1;
        l_IsSomeRendererActing_0.current = l_current_7;
        v3.IsThisRendererActing.current = l_current_8;
        v561 = l_v561_0;
        if _G.__DEV__ and l_v209_0 < v209 then
            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
        end;
        error(l_result_31);
    end;
    if l_result_31 ~= nil and typeof(l_result_31) == "table" and typeof(l_result_31.andThen) == "function" then
        local v586 = false;
        if _G.__DEV__ and typeof(v100) ~= nil then
            v100.resolve():andThen(function() --[[ Line: 3920 ]]

            end):andThen(function() --[[ Line: 3921 ]]
                -- upvalues: v586 (ref), l_console_0 (ref)
                if v586 == false then
                    l_console_0.error("You called act(Promise.new(function() --[[ ... ]] end)) without :await() or :expect(). " .. "This could lead to unexpected testing behaviour, interleaving multiple act " .. "calls and mixing their scopes. You should - act(function() Promise.new(function() --[[ ... ]] end):await() end);");
                end;
            end);
        end;
        return {
            andThen = function(_, v588, v589) --[[ Line: 3940 ]] --[[ Name: andThen ]]
                -- upvalues: v586 (ref), l_result_31 (copy), v209 (ref), v563 (ref), l_current_7 (copy), l_IsSomeRendererActing_0 (ref), v3 (ref), l_current_8 (copy), v561 (ref), l_v561_0 (copy), l_v209_0 (copy), l_console_0 (ref), v572 (ref)
                v586 = true;
                return l_result_31:andThen(function() --[[ Line: 3943 ]]
                    -- upvalues: v209 (ref), v563 (ref), l_current_7 (ref), l_IsSomeRendererActing_0 (ref), v3 (ref), l_current_8 (ref), v561 (ref), l_v561_0 (ref), l_v209_0 (ref), l_console_0 (ref), v588 (copy), v572 (ref), v589 (copy)
                    if v209 > 1 or v563 == true and l_current_7 == true then
                        v209 = v209 - 1;
                        l_IsSomeRendererActing_0.current = l_current_7;
                        v3.IsThisRendererActing.current = l_current_8;
                        v561 = l_v561_0;
                        if _G.__DEV__ and l_v209_0 < v209 then
                            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                        end;
                        v588();
                        return;
                    else
                        v572(function(v590) --[[ Line: 3955 ]]
                            -- upvalues: v209 (ref), l_IsSomeRendererActing_0 (ref), l_current_7 (ref), v3 (ref), l_current_8 (ref), v561 (ref), l_v561_0 (ref), l_v209_0 (ref), l_console_0 (ref), v589 (ref), v588 (ref)
                            v209 = v209 - 1;
                            l_IsSomeRendererActing_0.current = l_current_7;
                            v3.IsThisRendererActing.current = l_current_8;
                            v561 = l_v561_0;
                            if _G.__DEV__ and l_v209_0 < v209 then
                                l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                            end;
                            if v590 then
                                v589(v590);
                                return;
                            else
                                v588();
                                return;
                            end;
                        end);
                        return;
                    end;
                end, function(v591) --[[ Line: 3964 ]]
                    -- upvalues: v209 (ref), l_IsSomeRendererActing_0 (ref), l_current_7 (ref), v3 (ref), l_current_8 (ref), v561 (ref), l_v561_0 (ref), l_v209_0 (ref), l_console_0 (ref), v589 (copy)
                    v209 = v209 - 1;
                    l_IsSomeRendererActing_0.current = l_current_7;
                    v3.IsThisRendererActing.current = l_current_8;
                    v561 = l_v561_0;
                    if _G.__DEV__ and l_v209_0 < v209 then
                        l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                    end;
                    v589(v591);
                end);
            end
        };
    else
        if _G.__DEV__ and l_result_31 ~= nil then
            l_console_0.error("The callback passed to act(...) function " .. "must return nil, or a Promise. You returned %s", (tostring(l_result_31)));
        end;
        local l_status_32, l_result_32 = pcall(function() --[[ Line: 3984 ]]
            -- upvalues: v209 (ref), v563 (ref), l_current_7 (copy), v571 (ref), l_IsSomeRendererActing_0 (ref), v3 (ref), l_current_8 (copy), v561 (ref), l_v561_0 (copy), l_v209_0 (copy), l_console_0 (ref)
            if v209 == 1 and (v563 == false or l_current_7 == false) then
                v571();
            end;
            v209 = v209 - 1;
            l_IsSomeRendererActing_0.current = l_current_7;
            v3.IsThisRendererActing.current = l_current_8;
            v561 = l_v561_0;
            if _G.__DEV__ and l_v209_0 < v209 then
                l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
            end;
        end);
        if not l_status_32 then
            v209 = v209 - 1;
            l_IsSomeRendererActing_0.current = l_current_7;
            v3.IsThisRendererActing.current = l_current_8;
            v561 = l_v561_0;
            if _G.__DEV__ and l_v209_0 < v209 then
                l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
            end;
            error(l_result_32);
        end;
        return {
            andThen = function(_, v595, _) --[[ Line: 4004 ]] --[[ Name: andThen ]]
                -- upvalues: l_console_0 (ref)
                if _G.__DEV__ then
                    l_console_0.error("Do not await the result of calling act(...) with sync logic, it is not a Promise.");
                end;
                v595();
            end
        };
    end;
end;
v142.detachFiberAfterEffects = function(v597) --[[ Line: 4016 ]]
    v597.child = nil;
    v597.deletions = nil;
    v597.dependencies = nil;
    v597.memoizedProps = nil;
    v597.memoizedState = nil;
    v597.pendingProps = nil;
    v597.sibling = nil;
    v597.stateNode = nil;
    v597.updateQueue = nil;
    if _G.__DEV__ then
        v597._debugOwner = nil;
    end;
end;
return v3;