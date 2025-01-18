local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_Set_0 = require(l_Parent_0.LuauPolyfill).Set;
local v3 = {};
local function v8(v4) --[[ Line: 21 ]] --[[ Name: copySet ]]
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
local function _(v9) --[[ Line: 33 ]] --[[ Name: collectionHasEntries ]]
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
local function v108(v105, v106, v107) --[[ Line: 243 ]]
    -- upvalues: v104 (copy)
    if not v104.originalBeginWorkRef then
        v104.originalBeginWorkRef = require(script.Parent["ReactFiberBeginWork.new"]).beginWork;
    end;
    return v104.originalBeginWorkRef(v105, v106, v107);
end;
local function _(v109, v110, v111) --[[ Line: 254 ]]
    -- upvalues: v104 (copy)
    if not v104.completeWorkRef then
        v104.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
    end;
    return v104.completeWorkRef(v109, v110, v111);
end;
local v113 = nil;
local function _() --[[ Line: 268 ]] --[[ Name: initReactFiberHooks ]]
    -- upvalues: v113 (ref), v104 (copy)
    v113 = require(script.Parent["ReactFiberHooks.new"]);
    v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
    v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
    v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
end;
local function _() --[[ Line: 276 ]]
    -- upvalues: v104 (copy), v113 (ref)
    if not v104.resetHooksAfterThrowRef then
        v113 = require(script.Parent["ReactFiberHooks.new"]);
        v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
        v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
        v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    return v104.resetHooksAfterThrowRef();
end;
local function _() --[[ Line: 284 ]]
    -- upvalues: v104 (copy), v113 (ref)
    if not v104.ContextOnlyDispatcherRef then
        v113 = require(script.Parent["ReactFiberHooks.new"]);
        v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
        v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
        v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    return v104.ContextOnlyDispatcherRef;
end;
local function _() --[[ Line: 292 ]]
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
local function _() --[[ Line: 418 ]] --[[ Name: resetRenderTimer ]]
    -- upvalues: v158 (ref), l_now_0 (copy)
    v158 = l_now_0() + 500;
end;
v3.getRenderTargetTime = function() --[[ Line: 422 ]]
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
v3.getWorkInProgressRoot = function() --[[ Line: 463 ]]
    -- upvalues: v145 (ref)
    return v145;
end;
v3.requestEventTime = function() --[[ Line: 467 ]]
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
v3.requestUpdateLane = function(v178) --[[ Line: 486 ]]
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
requestRetryLane = function(v184) --[[ Line: 591 ]] --[[ Name: requestRetryLane ]]
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
v3.scheduleUpdateOnFiber = function(v186, v187, v188) --[[ Line: 617 ]]
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
v142.markUpdateLaneFromFiberToRoot = function(v191, v192) --[[ Line: 727 ]]
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
v103 = function(v196, v197) --[[ Line: 776 ]]
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
            v202 = l_scheduleSyncCallback_0(function() --[[ Line: 825 ]]
                -- upvalues: v142 (ref), v196 (copy)
                return v142.performSyncWorkOnRoot(v196);
            end);
        elseif v201 == v13.SyncBatchedLanePriority then
            v202 = l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 832 ]]
                -- upvalues: v142 (ref), v196 (copy)
                return v142.performSyncWorkOnRoot(v196);
            end);
        else
            local v203 = l_lanePriorityToSchedulerPriority_0(v201);
            v202 = l_scheduleCallback_0(v203, function() --[[ Line: 842 ]]
                -- upvalues: v142 (ref), v196 (copy)
                return v142.performConcurrentWorkOnRoot(v196);
            end);
        end;
        v196.callbackPriority = v201;
        v196.callbackNode = v202;
        return;
    end;
end;
v142.performConcurrentWorkOnRoot = function(v204) --[[ Line: 854 ]]
    -- upvalues: l_l_NoTimestamp_0_0 (ref), l_NoTimestamp_0 (copy), l_NoLanes_5 (ref), v13 (copy), l_NoLanes_6 (ref), l_invariant_0 (copy), v144 (ref), v3 (copy), v145 (ref), l_NoLanes_0 (ref), l_getNextLanes_0 (copy), v142 (copy), l_includesSomeLane_0 (copy), l_NoLanes_1 (ref), l_NoLanes_2 (ref), v143 (copy), v42 (copy), l_getLanesToRetrySynchronouslyOnError_0 (copy), v150 (ref), v103 (ref), l_now_0 (copy)
    l_l_NoTimestamp_0_0 = l_NoTimestamp_0;
    l_NoLanes_5 = v13.NoLanes;
    l_NoLanes_6 = v13.NoLanes;
    l_invariant_0(bit32.band(v144, 48) == 0, "Should not already be working.");
    local l_callbackNode_1 = v204.callbackNode;
    if v3.flushPassiveEffects() and v204.callbackNode ~= l_callbackNode_1 then
        return nil;
    else
        local v206 = nil;
        v206 = if v204 == v145 then l_NoLanes_0 else v13.NoLanes;
        local v207 = l_getNextLanes_0(v204, v206);
        if v207 == v13.NoLanes then
            return nil;
        else
            local v208 = v142.renderRootConcurrent(v204, v207);
            if l_includesSomeLane_0(l_NoLanes_1, l_NoLanes_2) then
                v142.prepareFreshStack(v204, v13.NoLanes);
            elseif v208 ~= v143.Incomplete then
                if v208 == v143.Errored then
                    v144 = bit32.bor(v144, 64);
                    if v204.hydrate then
                        v204.hydrate = false;
                        v42.clearContainer(v204.containerInfo);
                    end;
                    v207 = l_getLanesToRetrySynchronouslyOnError_0(v204);
                    if v207 ~= v13.NoLanes then
                        v208 = v142.renderRootSync(v204, v207);
                    end;
                end;
                if v208 == v143.FatalErrored then
                    local l_v150_0 = v150;
                    v142.prepareFreshStack(v204, v13.NoLanes);
                    v142.markRootSuspended(v204, v207);
                    v103(v204, l_now_0());
                    error(l_v150_0);
                end;
                v204.finishedWork = v204.current.alternate;
                v204.finishedLanes = v207;
                v142.finishConcurrentRender(v204, v208, v207);
            end;
            v103(v204, l_now_0());
            if v204.callbackNode == l_callbackNode_1 then
                return function() --[[ Line: 959 ]]
                    -- upvalues: v142 (ref), v204 (copy)
                    return v142.performConcurrentWorkOnRoot(v204);
                end;
            else
                return nil;
            end;
        end;
    end;
end;
local v210 = 0;
local v211 = false;
shouldForceFlushFallbacksInDEV = function() --[[ Line: 971 ]] --[[ Name: shouldForceFlushFallbacksInDEV ]]
    -- upvalues: v210 (ref)
    return _G.__DEV__ and v210 > 0;
end;
v142.finishConcurrentRender = function(v212, v213, v214) --[[ Line: 976 ]]
    -- upvalues: v143 (copy), l_invariant_0 (copy), v142 (copy), l_includesOnlyRetries_0 (copy), v157 (ref), l_now_0 (copy), l_getNextLanes_0 (copy), v13 (copy), l_isSubsetOfLanes_0 (copy), v3 (copy), l_markRootPinged_0 (copy), v42 (copy), l_includesOnlyTransitions_0 (copy), l_getMostRecentEventTime_0 (copy)
    if v213 == v143.Incomplete or v213 == v143.FatalErrored then
        l_invariant_0(false, "Root did not complete. This is a bug in React.");
        return;
    elseif v213 == v143.Errored then
        v142.commitRoot(v212);
        return;
    elseif v213 == v143.Suspended then
        v142.markRootSuspended(v212, v214);
        if l_includesOnlyRetries_0(v214) and not shouldForceFlushFallbacksInDEV() then
            local v215 = v157 + 500 - l_now_0();
            if v215 > 10 then
                if l_getNextLanes_0(v212, v13.NoLanes) ~= v13.NoLanes then
                    return;
                else
                    local l_suspendedLanes_0 = v212.suspendedLanes;
                    if not l_isSubsetOfLanes_0(l_suspendedLanes_0, v214) then
                        local v217 = v3.requestEventTime();
                        l_markRootPinged_0(v212, l_suspendedLanes_0, v217);
                        return;
                    else
                        v212.timeoutHandle = v42.scheduleTimeout(function() --[[ Line: 1024 ]]
                            -- upvalues: v142 (ref), v212 (copy)
                            return v142.commitRoot(v212);
                        end, v215);
                        return;
                    end;
                end;
            end;
        end;
        v142.commitRoot(v212);
        return;
    elseif v213 == v143.SuspendedWithDelay then
        v142.markRootSuspended(v212, v214);
        if l_includesOnlyTransitions_0(v214) then
            return;
        else
            if not shouldForceFlushFallbacksInDEV() then
                local v218 = l_getMostRecentEventTime_0(v212, v214);
                local v219 = l_now_0() - v218;
                local v220 = jnd(v219) - v219;
                if v220 > 10 then
                    v212.timeoutHandle = v42.scheduleTimeout(function() --[[ Line: 1060 ]]
                        -- upvalues: v142 (ref), v212 (copy)
                        return v142.commitRoot(v212);
                    end, v220);
                    return;
                end;
            end;
            v142.commitRoot(v212);
            return;
        end;
    elseif v213 == v143.Completed then
        v142.commitRoot(v212);
        return;
    else
        l_invariant_0(false, "Unknown root exit status.");
        return;
    end;
end;
v142.markRootSuspended = function(v221, v222) --[[ Line: 1076 ]]
    -- upvalues: l_removeLanes_0 (copy), l_NoLanes_3 (ref), l_NoLanes_2 (ref), l_markRootSuspended_0 (copy)
    v222 = l_removeLanes_0(v222, l_NoLanes_3);
    v222 = l_removeLanes_0(v222, l_NoLanes_2);
    l_markRootSuspended_0(v221, v222);
end;
v142.performSyncWorkOnRoot = function(v223) --[[ Line: 1088 ]]
    -- upvalues: l_invariant_0 (copy), v144 (ref), v3 (copy), v145 (ref), l_includesSomeLane_0 (copy), l_NoLanes_0 (ref), v142 (copy), l_NoLanes_1 (ref), l_NoLanes_2 (ref), l_getNextLanes_0 (copy), v13 (copy), l_LegacyRoot_0 (copy), v143 (copy), v42 (copy), l_getLanesToRetrySynchronouslyOnError_0 (copy), v150 (ref), v103 (ref), l_now_0 (copy)
    l_invariant_0(bit32.band(v144, 48) == 0, "Should not already be working.");
    v3.flushPassiveEffects();
    local v224 = nil;
    local v225 = nil;
    if v223 == v145 and l_includesSomeLane_0(v223.expiredLanes, l_NoLanes_0) then
        v224 = l_NoLanes_0;
        v225 = v142.renderRootSync(v223, v224);
        if l_includesSomeLane_0(l_NoLanes_1, l_NoLanes_2) then
            v224 = l_getNextLanes_0(v223, v224);
            v225 = v142.renderRootSync(v223, v224);
        end;
    else
        v224 = l_getNextLanes_0(v223, v13.NoLanes);
        v225 = v142.renderRootSync(v223, v224);
    end;
    if v223.tag ~= l_LegacyRoot_0 and v225 == v143.Errored then
        v144 = bit32.bor(v144, 64);
        if v223.hydrate then
            v223.hydrate = false;
            v42.clearContainer(v223.containerInfo);
        end;
        v224 = l_getLanesToRetrySynchronouslyOnError_0(v223);
        if v224 ~= v13.NoLanes then
            v225 = v142.renderRootSync(v223, v224);
        end;
    end;
    if v225 == v143.FatalErrored then
        local l_v150_1 = v150;
        v142.prepareFreshStack(v223, v13.NoLanes);
        v142.markRootSuspended(v223, v224);
        v103(v223, l_now_0());
        error(l_v150_1);
    end;
    v223.finishedWork = v223.current.alternate;
    v223.finishedLanes = v224;
    v142.commitRoot(v223);
    v103(v223, l_now_0());
    return nil;
end;
v3.flushRoot = function(v227, v228) --[[ Line: 1170 ]]
    -- upvalues: l_markRootExpired_0 (copy), v103 (ref), l_now_0 (copy), v144 (ref), v158 (ref), l_flushSyncCallbackQueue_0 (copy)
    l_markRootExpired_0(v227, v228);
    v103(v227, l_now_0());
    if bit32.band(v144, 48) == 0 then
        v158 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
end;
v3.getExecutionContext = function() --[[ Line: 1179 ]]
    -- upvalues: v144 (ref)
    return v144;
end;
v3.flushDiscreteUpdates = function() --[[ Line: 1183 ]]
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
v3.deferredUpdates = function(v229) --[[ Line: 1213 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v13 (copy), l_runWithPriority_0 (copy), l_NormalPriority_0 (copy)
    if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        local v230 = l_getCurrentUpdateLanePriority_0();
        local v231 = nil;
        local v232 = nil;
        if not _G.__YOLO__ then
            l_setCurrentUpdateLanePriority_0(v13.DefaultLanePriority);
            local l_status_0, l_result_0 = pcall(l_runWithPriority_0, l_NormalPriority_0, v229);
            v231 = l_status_0;
            v232 = l_result_0;
        else
            v231 = true;
            l_setCurrentUpdateLanePriority_0(v13.DefaultLanePriority);
            v232 = l_runWithPriority_0(l_NormalPriority_0, v229);
        end;
        l_setCurrentUpdateLanePriority_0(v230);
        if v231 then
            return v232;
        else
            error(v232);
            return;
        end;
    else
        return l_runWithPriority_0(l_NormalPriority_0, v229);
    end;
end;
v142.flushPendingDiscreteUpdates = function() --[[ Line: 1241 ]]
    -- upvalues: v168 (ref), l_markDiscreteUpdatesExpired_0 (copy), v103 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    if v168 ~= nil then
        local l_v168_0 = v168;
        v168 = nil;
        for v236, _ in pairs(l_v168_0) do
            l_markDiscreteUpdatesExpired_0(v236);
            v103(v236, l_now_0());
        end;
    end;
    l_flushSyncCallbackQueue_0();
end;
v3.batchedUpdates = function(v238, v239) --[[ Line: 1260 ]]
    -- upvalues: v144 (ref), v158 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v144_0 = v144;
    v144 = bit32.bor(v144, 1);
    local v241 = nil;
    local v242 = nil;
    if not _G.__YOLO__ then
        local l_status_1, l_result_1 = pcall(v238, v239);
        v241 = l_status_1;
        v242 = l_result_1;
    else
        v241 = true;
        v242 = v238(v239);
    end;
    v144 = l_v144_0;
    if v144 == 0 then
        v158 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if v241 then
        return v242;
    else
        error(v242);
        return;
    end;
end;
v3.batchedEventUpdates = function(v245, v246) --[[ Line: 1290 ]]
    -- upvalues: v144 (ref), v158 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v144_1 = v144;
    v144 = bit32.bor(v144, 2);
    local v248 = nil;
    local v249 = nil;
    if not _G.__YOLO__ then
        local l_status_2, l_result_2 = pcall(v245, v246);
        v248 = l_status_2;
        v249 = l_result_2;
    else
        v248 = true;
        v249 = v245(v246);
    end;
    v144 = l_v144_1;
    if v144 == 0 then
        v158 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if v248 then
        return v249;
    else
        error(v249);
        return;
    end;
end;
v3.discreteUpdates = function(v252, v253, v254, v255, v256) --[[ Line: 1327 ]]
    -- upvalues: v144 (ref), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v13 (copy), l_runWithPriority_0 (copy), l_UserBlockingPriority_0 (copy), v158 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v144_2 = v144;
    v144 = bit32.bor(v144, 4);
    if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        local v258 = l_getCurrentUpdateLanePriority_0();
        l_setCurrentUpdateLanePriority_0(v13.InputDiscreteLanePriority);
        local l_status_3, l_result_3 = pcall(l_runWithPriority_0, l_UserBlockingPriority_0, function() --[[ Line: 1337 ]]
            -- upvalues: v252 (copy), v253 (copy), v254 (copy), v255 (copy), v256 (copy)
            return v252(v253, v254, v255, v256);
        end);
        l_setCurrentUpdateLanePriority_0(v258);
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
        local l_status_4, l_result_4 = pcall(l_runWithPriority_0, l_UserBlockingPriority_0, function() --[[ Line: 1359 ]]
            -- upvalues: v252 (copy), v253 (copy), v254 (copy), v255 (copy), v256 (copy)
            return v252(v253, v254, v255, v256);
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
v3.unbatchedUpdates = function(v263, v264) --[[ Line: 1382 ]]
    -- upvalues: v144 (ref), v158 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v144_3 = v144;
    v144 = bit32.band(v144, 4294967294);
    v144 = bit32.bor(v144, 8);
    local v266 = nil;
    local v267 = nil;
    if not _G.__YOLO__ then
        local l_status_5, l_result_5 = pcall(v263, v264);
        v266 = l_status_5;
        v267 = l_result_5;
    else
        v266 = true;
        v267 = v263(v264);
    end;
    v144 = l_v144_3;
    if v144 == 0 then
        v158 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if v266 then
        return v267;
    else
        error(v267);
        return;
    end;
end;
v3.flushSync = function(v270, v271) --[[ Line: 1412 ]]
    -- upvalues: v144 (ref), l_console_0 (copy), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v13 (copy), l_runWithPriority_0 (copy), l_ImmediatePriority_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v144_4 = v144;
    if bit32.band(l_v144_4, 48) ~= 0 then
        if _G.__DEV__ then
            l_console_0.error("flushSync was called from inside a lifecycle method. React cannot " .. "flush when React is already rendering. Consider moving this call to " .. "a scheduler task or micro task.");
        end;
        return v270(v271);
    else
        v144 = bit32.bor(v144, 1);
        if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
            local v273 = l_getCurrentUpdateLanePriority_0();
            l_setCurrentUpdateLanePriority_0(v13.SyncLanePriority);
            local v274 = nil;
            local v275 = nil;
            if not _G.__YOLO__ then
                if v270 then
                    local l_status_6, l_result_6 = pcall(l_runWithPriority_0, l_ImmediatePriority_0, function() --[[ Line: 1437 ]]
                        -- upvalues: v270 (copy), v271 (copy)
                        return v270(v271);
                    end);
                    v274 = l_status_6;
                    v275 = l_result_6;
                else
                    v274 = true;
                    v275 = nil;
                end;
            else
                v274 = true;
                l_setCurrentUpdateLanePriority_0(v13.SyncLanePriority);
                v275 = if v270 then l_runWithPriority_0(l_ImmediatePriority_0, function() --[[ Line: 1449 ]]
                    -- upvalues: v270 (copy), v271 (copy)
                    return v270(v271);
                end) else nil;
            end;
            l_setCurrentUpdateLanePriority_0(v273);
            v144 = l_v144_4;
            l_flushSyncCallbackQueue_0();
            if not v274 then
                error(v275);
                return nil;
            else
                return v275;
            end;
        else
            local v278 = nil;
            local v279 = nil;
            if not _G.__YOLO__ then
                if v270 then
                    local l_status_7, l_result_7 = pcall(l_runWithPriority_0, l_ImmediatePriority_0, function() --[[ Line: 1478 ]]
                        -- upvalues: v270 (copy), v271 (copy)
                        return v270(v271);
                    end);
                    v278 = l_status_7;
                    v279 = l_result_7;
                else
                    v278 = true;
                    v279 = nil;
                end;
            else
                v278 = true;
                v279 = if v270 then l_runWithPriority_0(l_ImmediatePriority_0, function() --[[ Line: 1489 ]]
                    -- upvalues: v270 (copy), v271 (copy)
                    return v270(v271);
                end) else nil;
            end;
            v144 = l_v144_4;
            l_flushSyncCallbackQueue_0();
            if not v278 then
                error(v279);
            end;
            return v279;
        end;
    end;
end;
v3.flushControlled = function(v282) --[[ Line: 1509 ]]
    -- upvalues: v144 (ref), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v13 (copy), l_runWithPriority_0 (copy), l_ImmediatePriority_0 (copy), v158 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v144_5 = v144;
    v144 = bit32.bor(v144, 1);
    if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        local v284 = l_getCurrentUpdateLanePriority_0();
        l_setCurrentUpdateLanePriority_0(v13.SyncLanePriority);
        local l_status_8, l_result_8 = pcall(l_runWithPriority_0, l_ImmediatePriority_0, v282);
        l_setCurrentUpdateLanePriority_0(v284);
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
        local l_status_9, l_result_9 = pcall(l_runWithPriority_0, l_ImmediatePriority_0, v282);
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
v3.pushRenderLanes = function(v289, v290) --[[ Line: 1547 ]]
    -- upvalues: l_push_0 (copy), v148 (copy), v3 (copy), l_mergeLanes_0 (copy), l_NoLanes_1 (ref)
    l_push_0(v148, v3.subtreeRenderLanes, v289);
    v3.subtreeRenderLanes = l_mergeLanes_0(v3.subtreeRenderLanes, v290);
    l_NoLanes_1 = l_mergeLanes_0(l_NoLanes_1, v290);
end;
v3.popRenderLanes = function(v291) --[[ Line: 1556 ]]
    -- upvalues: v3 (copy), v148 (copy), l_pop_0 (copy)
    v3.subtreeRenderLanes = v148.current;
    l_pop_0(v148, v291);
end;
v142.prepareFreshStack = function(v292, v293) --[[ Line: 1561 ]]
    -- upvalues: v13 (copy), v42 (copy), v146 (ref), l_unwindInterruptedWork_0 (copy), v145 (ref), v43 (copy), l_NoLanes_0 (ref), v3 (copy), l_NoLanes_1 (ref), l_Incomplete_0 (ref), v143 (copy), v150 (ref), l_workInProgressRootSkippedLanes_0 (copy), l_NoLanes_2 (ref), l_NoLanes_3 (ref), l_ReactFeatureFlags_0 (copy), v172 (ref), v124 (copy)
    v292.finishedWork = nil;
    v292.finishedLanes = v13.NoLanes;
    local l_timeoutHandle_0 = v292.timeoutHandle;
    if l_timeoutHandle_0 ~= v42.noTimeout then
        v292.timeoutHandle = v42.noTimeout;
        v42.cancelTimeout(l_timeoutHandle_0);
    end;
    if v146 ~= nil then
        local l_return__1 = v146.return_;
        while l_return__1 ~= nil do
            l_unwindInterruptedWork_0(l_return__1);
            l_return__1 = l_return__1.return_;
        end;
    end;
    v145 = v292;
    v146 = v43.createWorkInProgress(v292.current, nil);
    l_NoLanes_0 = v293;
    v3.subtreeRenderLanes = v293;
    l_NoLanes_1 = v293;
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
v142.handleError = function(v296, v297) --[[ Line: 1602 ]]
    -- upvalues: v146 (ref), l_resetContextDependencies_0 (copy), v104 (copy), v113 (ref), l_resetCurrentFiber_0 (copy), l_ReactCurrentOwner_0 (copy), l_Incomplete_0 (ref), v143 (copy), v150 (ref), l_ReactFeatureFlags_0 (copy), v44 (copy), v122 (copy), l_throwException_0 (copy), l_NoLanes_0 (ref), v3 (copy), v142 (copy)
    while true do
        local l_v146_0 = v146;
        local l_status_10, l_result_10 = pcall(function() --[[ Line: 1605 ]]
            -- upvalues: l_resetContextDependencies_0 (ref), v104 (ref), v113 (ref), l_resetCurrentFiber_0 (ref), l_ReactCurrentOwner_0 (ref), l_v146_0 (ref), l_Incomplete_0 (ref), v143 (ref), v150 (ref), v297 (ref), v146 (ref), l_ReactFeatureFlags_0 (ref), v44 (ref), v122 (ref), l_throwException_0 (ref), v296 (copy), l_NoLanes_0 (ref), v3 (ref), v142 (ref)
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
                v150 = v297;
                v146 = nil;
                return;
            else
                if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(l_v146_0.mode, v44.ProfileMode) ~= 0 then
                    v122.stopProfilerTimerIfRunningAndRecordDelta(l_v146_0, true);
                end;
                l_throwException_0(v296, l_v146_0.return_, l_v146_0, v297, l_NoLanes_0, v3.onUncaughtError, v3.renderDidError);
                v142.completeUnitOfWork(l_v146_0);
                return;
            end;
        end);
        if not l_status_10 then
            v297 = l_result_10;
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
v142.pushDispatcher = function() --[[ Line: 1668 ]]
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
v142.popDispatcher = function(v304) --[[ Line: 1685 ]]
    -- upvalues: l_ReactCurrentDispatcher_0 (copy)
    l_ReactCurrentDispatcher_0.current = v304;
end;
v142.pushInteractions = function(v305) --[[ Line: 1689 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___interactionsRef_0 (copy)
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        local l_current_2 = l___interactionsRef_0.current;
        l___interactionsRef_0.current = v305.memoizedInteractions;
        return l_current_2;
    else
        return nil;
    end;
end;
v142.popInteractions = function(v307) --[[ Line: 1698 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___interactionsRef_0 (copy)
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        l___interactionsRef_0.current = v307;
    end;
end;
v3.markCommitTimeOfFallback = function() --[[ Line: 1704 ]]
    -- upvalues: v157 (ref), l_now_0 (copy)
    v157 = l_now_0();
end;
v3.markSkippedUpdateLanes = function(v308) --[[ Line: 1708 ]]
    -- upvalues: v152 (copy)
    v152.markSkippedUpdateLanes(v308);
end;
v3.renderDidSuspend = function() --[[ Line: 1712 ]]
    -- upvalues: l_Incomplete_0 (ref), v143 (copy)
    if l_Incomplete_0 == v143.Incomplete then
        l_Incomplete_0 = v143.Suspended;
    end;
end;
v3.renderDidSuspendDelayIfPossible = function() --[[ Line: 1718 ]]
    -- upvalues: l_Incomplete_0 (ref), v143 (copy), v145 (ref), l_includesNonIdleWork_0 (copy), l_workInProgressRootSkippedLanes_0 (copy), l_NoLanes_2 (ref), v142 (copy), l_NoLanes_0 (ref)
    if l_Incomplete_0 == v143.Incomplete or l_Incomplete_0 == v143.Suspended then
        l_Incomplete_0 = v143.SuspendedWithDelay;
    end;
    if v145 ~= nil and (l_includesNonIdleWork_0(l_workInProgressRootSkippedLanes_0()) or l_includesNonIdleWork_0(l_NoLanes_2)) then
        v142.markRootSuspended(v145, l_NoLanes_0);
    end;
end;
v3.renderDidError = function() --[[ Line: 1744 ]]
    -- upvalues: l_Incomplete_0 (ref), v143 (copy)
    if l_Incomplete_0 ~= v143.Completed then
        l_Incomplete_0 = v143.Errored;
    end;
end;
v3.renderHasNotSuspendedYet = function() --[[ Line: 1752 ]]
    -- upvalues: l_Incomplete_0 (ref), v143 (copy)
    return l_Incomplete_0 == v143.Incomplete;
end;
v142.renderRootSync = function(v309, v310) --[[ Line: 1758 ]]
    -- upvalues: v144 (ref), v142 (copy), v145 (ref), l_NoLanes_0 (ref), l_ReactFeatureFlags_0 (copy), v37 (copy), v38 (copy), l_resetContextDependencies_0 (copy), v146 (ref), l_invariant_0 (copy), v13 (copy), l_Incomplete_0 (ref)
    local l_v144_6 = v144;
    v144 = bit32.bor(v144, 16);
    local v312 = v142.pushDispatcher();
    if v145 ~= v309 or l_NoLanes_0 ~= v310 then
        v142.prepareFreshStack(v309, v310);
        v142.startWorkOnPendingInteractions(v309, v310);
    end;
    local v313 = v142.pushInteractions(v309);
    if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
        v37.logRenderStarted(v310);
    end;
    if l_ReactFeatureFlags_0.enableSchedulingProfiler then
        v38.markRenderStarted(v310);
    end;
    while true do
        local v314 = nil;
        local v315 = nil;
        if not _G.__YOLO__ then
            local l_status_11, l_result_11 = pcall(v142.workLoopSync);
            v314 = l_status_11;
            v315 = l_result_11;
        else
            v314 = true;
            v142.workLoopSync();
        end;
        if not v314 then
            v142.handleError(v309, v315);
        else
            break;
        end;
    end;
    l_resetContextDependencies_0();
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        v142.popInteractions(v313);
    end;
    v144 = l_v144_6;
    v142.popDispatcher(v312);
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
v142.workLoopSync = function() --[[ Line: 1834 ]]
    -- upvalues: v146 (ref), v142 (copy)
    while v146 ~= nil do
        v142.performUnitOfWork(v146);
    end;
end;
v142.renderRootConcurrent = function(v318, v319) --[[ Line: 1841 ]]
    -- upvalues: v144 (ref), v142 (copy), v145 (ref), l_NoLanes_0 (ref), v158 (ref), l_now_0 (copy), l_ReactFeatureFlags_0 (copy), v37 (copy), v38 (copy), l_resetContextDependencies_0 (copy), v146 (ref), v143 (copy), v13 (copy), l_Incomplete_0 (ref)
    local l_v144_7 = v144;
    v144 = bit32.bor(v144, 16);
    local v321 = v142.pushDispatcher();
    if v145 ~= v318 or l_NoLanes_0 ~= v319 then
        v158 = l_now_0() + 500;
        v142.prepareFreshStack(v318, v319);
        v142.startWorkOnPendingInteractions(v318, v319);
    end;
    local v322 = v142.pushInteractions(v318);
    if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
        v37.logRenderStarted(v319);
    end;
    if l_ReactFeatureFlags_0.enableSchedulingProfiler then
        v38.markRenderStarted(v319);
    end;
    while true do
        local v323 = nil;
        local v324 = nil;
        if not _G.__YOLO__ then
            local l_status_12, l_result_12 = pcall(v142.workLoopConcurrent);
            v323 = l_status_12;
            v324 = l_result_12;
            if v323 then
                v324 = "break";
            end;
        else
            v323 = true;
            v324 = "break";
            v142.workLoopConcurrent();
        end;
        if v324 ~= "break" then
            if not v323 then
                v142.handleError(v318, v324);
            end;
        else
            break;
        end;
    end;
    l_resetContextDependencies_0();
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        v142.popInteractions(v322);
    end;
    v142.popDispatcher(v321);
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
v142.workLoopConcurrent = function() --[[ Line: 1925 ]]
    -- upvalues: v146 (ref), l_shouldYield_0 (copy), v142 (copy)
    while v146 ~= nil and not l_shouldYield_0() do
        v142.performUnitOfWork(v146);
    end;
end;
v142.performUnitOfWork = function(v327) --[[ Line: 1932 ]]
    -- upvalues: l_setCurrentFiber_0 (copy), l_ReactFeatureFlags_0 (copy), v44 (copy), v122 (copy), v142 (copy), v3 (copy), l_resetCurrentFiber_0 (copy), v146 (ref), l_ReactCurrentOwner_0 (copy)
    local l_alternate_1 = v327.alternate;
    l_setCurrentFiber_0(v327);
    local v329 = nil;
    if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(v327.mode, v44.ProfileMode) ~= v44.NoMode then
        v122.startProfilerTimer(v327);
        v329 = v142.beginWork(l_alternate_1, v327, v3.subtreeRenderLanes);
        v122.stopProfilerTimerIfRunningAndRecordDelta(v327, true);
    else
        v329 = v142.beginWork(l_alternate_1, v327, v3.subtreeRenderLanes);
    end;
    l_resetCurrentFiber_0();
    v327.memoizedProps = v327.pendingProps;
    if v329 == nil then
        v142.completeUnitOfWork(v327);
    else
        v146 = v329;
    end;
    l_ReactCurrentOwner_0.current = nil;
end;
v142.completeUnitOfWork = function(v330) --[[ Line: 1960 ]]
    -- upvalues: v47 (copy), l_setCurrentFiber_0 (copy), l_ReactFeatureFlags_0 (copy), v44 (copy), v3 (copy), v104 (copy), v122 (copy), l_resetCurrentFiber_0 (copy), v146 (ref), l_unwindWork_0 (copy), l_Incomplete_0 (ref), v143 (copy)
    local l_v330_0 = v330;
    while true do
        local l_alternate_2 = l_v330_0.alternate;
        local l_return__2 = l_v330_0.return_;
        if bit32.band(l_v330_0.flags, v47.Incomplete) == v47.NoFlags then
            l_setCurrentFiber_0(l_v330_0);
            local v334 = nil;
            if not l_ReactFeatureFlags_0.enableProfilerTimer or bit32.band(l_v330_0.mode, v44.ProfileMode) == v44.NoMode then
                local l_l_v330_0_0 = l_v330_0;
                local l_subtreeRenderLanes_0 = v3.subtreeRenderLanes;
                if not v104.completeWorkRef then
                    v104.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
                end;
                v334 = v104.completeWorkRef(l_alternate_2, l_l_v330_0_0, l_subtreeRenderLanes_0);
            else
                v122.startProfilerTimer(l_v330_0);
                local l_l_v330_0_1 = l_v330_0;
                local l_subtreeRenderLanes_1 = v3.subtreeRenderLanes;
                if not v104.completeWorkRef then
                    v104.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
                end;
                v334 = v104.completeWorkRef(l_alternate_2, l_l_v330_0_1, l_subtreeRenderLanes_1);
                v122.stopProfilerTimerIfRunningAndRecordDelta(l_v330_0, false);
            end;
            l_resetCurrentFiber_0();
            if v334 ~= nil then
                v146 = v334;
                return;
            end;
        else
            local v339 = l_unwindWork_0(l_v330_0, v3.subtreeRenderLanes);
            if v339 ~= nil then
                v339.flags = bit32.band(v339.flags, v47.HostEffectMask);
                v146 = v339;
                return;
            else
                if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(l_v330_0.mode, v44.ProfileMode) ~= v44.NoMode then
                    v122.stopProfilerTimerIfRunningAndRecordDelta(l_v330_0, false);
                    local l_actualDuration_0 = l_v330_0.actualDuration;
                    local l_child_0 = l_v330_0.child;
                    while l_child_0 ~= nil do
                        l_actualDuration_0 = l_actualDuration_0 + l_child_0.actualDuration;
                        l_child_0 = l_child_0.sibling;
                    end;
                    l_v330_0.actualDuration = l_actualDuration_0;
                end;
                if l_return__2 ~= nil then
                    l_return__2.flags = bit32.bor(l_return__2.flags, v47.Incomplete);
                    l_return__2.subtreeFlags = v47.NoFlags;
                    l_return__2.deletions = nil;
                end;
            end;
        end;
        local l_sibling_0 = l_v330_0.sibling;
        if l_sibling_0 ~= nil then
            v146 = l_sibling_0;
            return;
        else
            l_v330_0 = l_return__2;
            v146 = l_v330_0;
            if l_v330_0 == nil then
                if l_Incomplete_0 == v143.Incomplete then
                    l_Incomplete_0 = v143.Completed;
                end;
                return;
            end;
        end;
    end;
end;
v142.commitRoot = function(v343) --[[ Line: 2054 ]]
    -- upvalues: l_getCurrentPriorityLevel_0 (copy), l_runWithPriority_0 (copy), l_ImmediatePriority_0 (copy), v142 (copy)
    local v344 = l_getCurrentPriorityLevel_0();
    l_runWithPriority_0(l_ImmediatePriority_0, function() --[[ Line: 2058 ]]
        -- upvalues: v142 (ref), v343 (copy), v344 (copy)
        return v142.commitRootImpl(v343, v344);
    end);
    return nil;
end;
v142.commitRootImpl = function(v345, v346) --[[ Line: 2065 ]]
    -- upvalues: v3 (copy), v165 (ref), l_invariant_0 (copy), v144 (ref), l_ReactFeatureFlags_0 (copy), v37 (copy), v38 (copy), v13 (copy), l_mergeLanes_0 (copy), l_markRootFinished_0 (copy), v168 (ref), l_hasDiscreteLanes_0 (copy), v145 (ref), v146 (ref), l_NoLanes_0 (ref), v47 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v142 (copy), l_ReactCurrentOwner_0 (copy), v176 (ref), v42 (copy), v177 (ref), v122 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_recursivelyCommitLayoutEffects_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v140 (ref), l_resetCurrentFiber_0 (copy), v164 (ref), l_scheduleCallback_0 (copy), l_NormalPriority_0 (copy), l_requestPaint_0 (copy), l_NoLanes_4 (ref), l_l_NoPriority_0_0 (ref), v172 (ref), v163 (ref), l_enableDoubleInvokingEffects_0 (copy), l_SyncLane_0 (copy), v170 (ref), v169 (ref), l_onCommitRoot_0 (copy), l_onCommitRoot_1 (copy), v103 (ref), l_now_0 (copy), v161 (ref), v162 (ref), l_flushSyncCallbackQueue_0 (copy)
    repeat
        v3.flushPassiveEffects();
    until v165 == nil;
    flushRenderPhaseStrictModeWarningsInDEV();
    l_invariant_0(bit32.band(v144, 48) == 0, "Should not already be working.");
    local l_finishedWork_0 = v345.finishedWork;
    local l_finishedLanes_0 = v345.finishedLanes;
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
        v345.finishedWork = nil;
        v345.finishedLanes = v13.NoLanes;
        l_invariant_0(l_finishedWork_0 ~= v345.current, "Cannot commit the same tree as before. This error is likely caused by " .. "a bug in React. Please file an issue.");
        v345.callbackNode = nil;
        local v349 = l_mergeLanes_0(l_finishedWork_0.lanes, l_finishedWork_0.childLanes);
        l_markRootFinished_0(v345, v349);
        if v168 ~= nil and not l_hasDiscreteLanes_0(v349) and v168[v345] ~= nil then
            v168[v345] = nil;
        end;
        if v345 == v145 then
            v145 = nil;
            v146 = nil;
            l_NoLanes_0 = v13.NoLanes;
        end;
        local v350 = bit32.band(l_finishedWork_0.subtreeFlags, (bit32.bor(v47.BeforeMutationMask, v47.MutationMask, v47.LayoutMask, v47.PassiveMask))) ~= v47.NoFlags;
        local v351 = bit32.band(l_finishedWork_0.flags, (bit32.bor(v47.BeforeMutationMask, v47.MutationMask, v47.LayoutMask, v47.PassiveMask))) ~= v47.NoFlags;
        if v350 or v351 then
            local v352 = nil;
            if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
                v352 = l_getCurrentUpdateLanePriority_0();
                l_setCurrentUpdateLanePriority_0(v13.SyncLanePriority);
            end;
            local l_v144_8 = v144;
            v144 = bit32.bor(v144, 32);
            local v354 = v142.pushInteractions(v345);
            l_ReactCurrentOwner_0.current = nil;
            v176 = v42.prepareForCommit(v345.containerInfo);
            v177 = false;
            v142.commitBeforeMutationEffects(l_finishedWork_0);
            v176 = nil;
            if l_ReactFeatureFlags_0.enableProfilerTimer then
                v122.recordCommitTime();
            end;
            v142.commitMutationEffects(l_finishedWork_0, v345, v346);
            if v177 then
                v42.afterActiveInstanceBlur();
            end;
            v42.resetAfterCommit(v345.containerInfo);
            v345.current = l_finishedWork_0;
            if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
                v37.logLayoutEffectsStarted(l_finishedLanes_0);
            end;
            if l_ReactFeatureFlags_0.enableSchedulingProfiler then
                v38.markLayoutEffectsStarted(l_finishedLanes_0);
            end;
            if _G.__DEV__ then
                l_setCurrentFiber_0(l_finishedWork_0);
                l_invokeGuardedCallback_0(nil, l_recursivelyCommitLayoutEffects_0, nil, l_finishedWork_0, v345, v3.captureCommitPhaseError, v3.schedulePassiveEffectCallback);
                if l_hasCaughtError_0() then
                    local v355 = l_clearCaughtError_0();
                    v140(l_finishedWork_0, l_finishedWork_0, v355);
                end;
                l_resetCurrentFiber_0();
            else
                local v356 = nil;
                local v357 = nil;
                if not _G.__YOLO__ then
                    local l_status_13, l_result_13 = pcall(l_recursivelyCommitLayoutEffects_0, l_finishedWork_0, v345, v3.captureCommitPhaseError, v3.schedulePassiveEffectCallback);
                    v356 = l_status_13;
                    v357 = l_result_13;
                else
                    v356 = true;
                    l_recursivelyCommitLayoutEffects_0(l_finishedWork_0, v345, v3.captureCommitPhaseError, v3.schedulePassiveEffectCallback);
                end;
                if not v356 then
                    v140(l_finishedWork_0, l_finishedWork_0, v357);
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
                l_scheduleCallback_0(l_NormalPriority_0, function() --[[ Line: 2281 ]]
                    -- upvalues: v3 (ref)
                    v3.flushPassiveEffects();
                    return nil;
                end);
            end;
            l_requestPaint_0();
            if l_ReactFeatureFlags_0.enableSchedulerTracing then
                v142.popInteractions(v354);
            end;
            v144 = l_v144_8;
            if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler and v352 ~= nil then
                l_setCurrentUpdateLanePriority_0(v352);
            end;
        else
            v345.current = l_finishedWork_0;
            if l_ReactFeatureFlags_0.enableProfilerTimer then
                v122.recordCommitTime();
            end;
        end;
        local l_v164_0 = v164;
        if v164 then
            v164 = false;
            v165 = v345;
            l_NoLanes_4 = l_finishedLanes_0;
            l_l_NoPriority_0_0 = v346;
        end;
        v349 = v345.pendingLanes;
        if v349 ~= v13.NoLanes then
            if l_ReactFeatureFlags_0.enableSchedulerTracing then
                if v172 ~= nil then
                    local l_v172_0 = v172;
                    v172 = nil;
                    for v362 = 1, #l_v172_0 do
                        scheduleInteractions(v345, l_v172_0[v362], v345.memoizedInteractions);
                    end;
                end;
                v142.schedulePendingInteractions(v345, v349);
            end;
        else
            v163 = nil;
        end;
        if _G.__DEV__ and l_enableDoubleInvokingEffects_0 and not l_v164_0 then
            commitDoubleInvokeEffectsInDEV(v345.current, false);
        end;
        if l_ReactFeatureFlags_0.enableSchedulerTracing and not l_v164_0 then
            v142.finishPendingInteractions(v345, l_finishedLanes_0);
        end;
        if v349 == l_SyncLane_0 then
            if v345 == v170 then
                v169 = v169 + 1;
            else
                v169 = 0;
                v170 = v345;
            end;
        else
            v169 = 0;
        end;
        l_onCommitRoot_0(l_finishedWork_0.stateNode, v346);
        if _G.__DEV__ then
            l_onCommitRoot_1();
        end;
        v103(v345, l_now_0());
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
v142.commitBeforeMutationEffects = function(v364) --[[ Line: 2429 ]]
    -- upvalues: v142 (copy), v47 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v3 (copy), l_resetCurrentFiber_0 (copy)
    local l_v364_0 = v364;
    while l_v364_0 ~= nil do
        if l_v364_0.deletions ~= nil then
            v142.commitBeforeMutationEffectsDeletions(l_v364_0.deletions);
        end;
        if l_v364_0.child ~= nil and bit32.band(l_v364_0.subtreeFlags, v47.BeforeMutationMask) ~= v47.NoFlags then
            v142.commitBeforeMutationEffects(l_v364_0.child);
        end;
        if _G.__DEV__ then
            l_setCurrentFiber_0(l_v364_0);
            l_invokeGuardedCallback_0(nil, v142.commitBeforeMutationEffectsImpl, nil, l_v364_0);
            if l_hasCaughtError_0() then
                local v366 = l_clearCaughtError_0();
                v3.captureCommitPhaseError(l_v364_0, l_v364_0.return_, v366);
            end;
            l_resetCurrentFiber_0();
        else
            local v367 = nil;
            local v368 = nil;
            if not _G.__YOLO__ then
                local l_status_14, l_result_14 = pcall(v142.commitBeforeMutationEffectsImpl, l_v364_0);
                v367 = l_status_14;
                v368 = l_result_14;
            else
                v367 = true;
                v142.commitBeforeMutationEffectsImpl(l_v364_0);
            end;
            if not v367 then
                v3.captureCommitPhaseError(l_v364_0, l_v364_0.return_, v368);
            end;
        end;
        l_v364_0 = l_v364_0.sibling;
    end;
end;
v142.commitBeforeMutationEffectsImpl = function(v371) --[[ Line: 2469 ]]
    -- upvalues: v177 (ref), v176 (ref), v45 (copy), v86 (copy), l_doesFiberContain_0 (copy), v42 (copy), v47 (copy), l_setCurrentFiber_0 (copy), l_commitBeforeMutationLifeCycles_0 (copy), l_resetCurrentFiber_0 (copy), v164 (ref), l_scheduleCallback_0 (copy), l_NormalPriority_0 (copy), v3 (copy)
    local l_alternate_3 = v371.alternate;
    local l_flags_0 = v371.flags;
    if not v177 and v176 ~= nil and v371.tag == v45.SuspenseComponent and v86.isSuspenseBoundaryBeingHidden(l_alternate_3, v371) and l_doesFiberContain_0(v371, v176) then
        v177 = true;
        v42.beforeActiveInstanceBlur();
    end;
    if bit32.band(l_flags_0, v47.Snapshot) ~= v47.NoFlags then
        l_setCurrentFiber_0(v371);
        l_commitBeforeMutationLifeCycles_0(l_alternate_3, v371);
        l_resetCurrentFiber_0();
    end;
    if bit32.band(l_flags_0, v47.Passive) ~= v47.NoFlags and not v164 then
        v164 = true;
        l_scheduleCallback_0(l_NormalPriority_0, function() --[[ Line: 2497 ]]
            -- upvalues: v3 (ref)
            v3.flushPassiveEffects();
            return nil;
        end);
    end;
end;
v142.commitBeforeMutationEffectsDeletions = function(v374) --[[ Line: 2505 ]]
    -- upvalues: l_doesFiberContain_0 (copy), v176 (ref), v177 (ref), v42 (copy)
    for v375 = 1, #v374 do
        local v376 = v374[v375];
        if l_doesFiberContain_0(v376, v176) then
            v177 = true;
            v42.beforeActiveInstanceBlur();
        end;
    end;
end;
v142.commitMutationEffects = function(v377, v378, v379) --[[ Line: 2521 ]]
    -- upvalues: l_commitDeletion_0 (copy), v3 (copy), v47 (copy), v142 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), l_resetCurrentFiber_0 (copy)
    local l_v377_0 = v377;
    while l_v377_0 ~= nil do
        local l_deletions_0 = l_v377_0.deletions;
        if l_deletions_0 ~= nil then
            for _, v383 in ipairs(l_deletions_0) do
                local l_status_15, l_result_15 = pcall(l_commitDeletion_0, v378, v383, l_v377_0, v379);
                if not l_status_15 then
                    v3.captureCommitPhaseError(v383, l_v377_0, l_result_15);
                end;
            end;
        end;
        if l_v377_0.child ~= nil and bit32.band(l_v377_0.subtreeFlags, v47.MutationMask) ~= v47.NoFlags then
            v142.commitMutationEffects(l_v377_0.child, v378, v379);
        end;
        if _G.__DEV__ then
            l_setCurrentFiber_0(l_v377_0);
            l_invokeGuardedCallback_0(nil, v142.commitMutationEffectsImpl, nil, l_v377_0, v378, v379);
            if l_hasCaughtError_0() then
                local v386 = l_clearCaughtError_0();
                v3.captureCommitPhaseError(l_v377_0, l_v377_0.return_, v386);
            end;
            l_resetCurrentFiber_0();
        else
            local v387 = nil;
            local v388 = nil;
            if not _G.__YOLO__ then
                local l_status_16, l_result_16 = pcall(v142.commitMutationEffectsImpl, l_v377_0, v378, v379);
                v387 = l_status_16;
                v388 = l_result_16;
            else
                v387 = true;
                v142.commitMutationEffectsImpl(l_v377_0, v378, v379);
            end;
            if not v387 then
                v3.captureCommitPhaseError(l_v377_0, l_v377_0.return_, v388);
            end;
        end;
        l_v377_0 = l_v377_0.sibling;
    end;
end;
v142.commitMutationEffectsImpl = function(v391, _, _) --[[ Line: 2583 ]]
    -- upvalues: v47 (copy), l_commitDetachRef_0 (copy), l_commitPlacement_0 (copy), l_commitWork_0 (copy)
    local l_flags_1 = v391.flags;
    if bit32.band(l_flags_1, v47.Ref) ~= 0 then
        local l_alternate_4 = v391.alternate;
        if l_alternate_4 ~= nil then
            l_commitDetachRef_0(l_alternate_4);
        end;
    end;
    local v396 = bit32.band(l_flags_1, (bit32.bor(v47.Placement, v47.Update, v47.Hydrating)));
    if v396 == v47.Placement then
        l_commitPlacement_0(v391);
        v391.flags = bit32.band(v391.flags, (bit32.bnot(v47.Placement)));
        return;
    elseif v396 == v47.PlacementAndUpdate then
        l_commitPlacement_0(v391);
        v391.flags = bit32.band(v391.flags, (bit32.bnot(v47.Placement)));
        local l_alternate_5 = v391.alternate;
        l_commitWork_0(l_alternate_5, v391);
        return;
    else
        if v396 == v47.Update then
            local l_alternate_6 = v391.alternate;
            l_commitWork_0(l_alternate_6, v391);
        end;
        return;
    end;
end;
v142.commitMutationEffectsDeletions = function(v399, v400, v401, v402) --[[ Line: 2649 ]]
    -- upvalues: l_commitDeletion_0 (copy), v3 (copy)
    for _, v404 in ipairs(v399) do
        local l_status_17, l_result_17 = pcall(l_commitDeletion_0, v401, v404, v400, v402);
        if not l_status_17 then
            v3.captureCommitPhaseError(v404, v400, l_result_17);
        end;
    end;
end;
v3.schedulePassiveEffectCallback = function() --[[ Line: 2669 ]]
    -- upvalues: v164 (ref), l_scheduleCallback_0 (copy), l_NormalPriority_0 (copy), v3 (copy)
    if not v164 then
        v164 = true;
        l_scheduleCallback_0(l_NormalPriority_0, function() --[[ Line: 2672 ]]
            -- upvalues: v3 (ref)
            v3.flushPassiveEffects();
            return nil;
        end);
    end;
end;
local v407 = nil;
v3.flushPassiveEffects = function() --[[ Line: 2681 ]]
    -- upvalues: l_l_NoPriority_0_0 (ref), l_NoPriority_0 (copy), l_NormalPriority_0 (copy), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), l_schedulerPriorityToLanePriority_0 (copy), l_runWithPriority_0 (copy), v407 (ref)
    if l_l_NoPriority_0_0 ~= l_NoPriority_0 then
        local v408 = nil;
        v408 = if l_NormalPriority_0 < l_l_NoPriority_0_0 then l_NormalPriority_0 else l_l_NoPriority_0_0;
        l_l_NoPriority_0_0 = l_NoPriority_0;
        if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
            local v409 = l_getCurrentUpdateLanePriority_0();
            l_setCurrentUpdateLanePriority_0(l_schedulerPriorityToLanePriority_0(v408));
            local v410 = nil;
            local v411 = nil;
            if not _G.__YOLO__ then
                local l_status_18, l_result_18 = pcall(l_runWithPriority_0, v408, v407);
                v410 = l_status_18;
                v411 = l_result_18;
            else
                v410 = true;
                l_setCurrentUpdateLanePriority_0(l_schedulerPriorityToLanePriority_0(v408));
                v411 = l_runWithPriority_0(v408, v407);
            end;
            l_setCurrentUpdateLanePriority_0(v409);
            if not v410 then
                error(v411);
            end;
            return v411;
        else
            return l_runWithPriority_0(v408, v407);
        end;
    else
        return false;
    end;
end;
v141 = function(v414, v415) --[[ Line: 2725 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), v45 (copy), v159 (ref), v47 (copy), v141 (ref), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_commitPassiveMount_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v3 (copy), l_resetCurrentFiber_0 (copy)
    local l_v415_0 = v415;
    while l_v415_0 ~= nil do
        local v417 = nil;
        if l_ReactFeatureFlags_0.enableProfilerTimer and l_ReactFeatureFlags_0.enableProfilerCommitHooks and l_v415_0.tag == v45.Profiler then
            v417 = v159;
            v159 = l_v415_0;
        end;
        local v418 = bit32.band(l_v415_0.subtreeFlags, v47.PassiveMask);
        if l_v415_0.child ~= nil and v418 ~= v47.NoFlags then
            v141(v414, l_v415_0.child);
        end;
        if bit32.band(l_v415_0.flags, v47.Passive) ~= v47.NoFlags then
            if _G.__DEV__ then
                l_setCurrentFiber_0(l_v415_0);
                l_invokeGuardedCallback_0(nil, l_commitPassiveMount_0, nil, v414, l_v415_0);
                if l_hasCaughtError_0() then
                    local v419 = l_clearCaughtError_0();
                    v3.captureCommitPhaseError(l_v415_0, l_v415_0.return_, v419);
                end;
                l_resetCurrentFiber_0();
            else
                local v420 = nil;
                local v421 = nil;
                if not _G.__YOLO__ then
                    local l_status_19, l_result_19 = pcall(l_commitPassiveMount_0, v414, l_v415_0);
                    v420 = l_status_19;
                    v421 = l_result_19;
                else
                    v420 = true;
                    l_commitPassiveMount_0(v414, l_v415_0);
                end;
                if not v420 then
                    v3.captureCommitPhaseError(l_v415_0, l_v415_0.return_, v421);
                end;
            end;
        end;
        if l_ReactFeatureFlags_0.enableProfilerTimer and l_ReactFeatureFlags_0.enableProfilerCommitHooks and l_v415_0.tag == v45.Profiler then
            if v417 ~= nil then
                local l_stateNode_0 = v417.stateNode;
                l_stateNode_0.passiveEffectDuration = l_stateNode_0.passiveEffectDuration + l_v415_0.stateNode.passiveEffectDuration;
            end;
            v159 = v417;
        end;
        l_v415_0 = l_v415_0.sibling;
    end;
end;
local function v425(v426) --[[ Line: 2790 ]] --[[ Name: flushPassiveUnmountEffects ]]
    -- upvalues: v142 (copy), v47 (copy), v425 (copy), l_setCurrentFiber_0 (copy), l_commitPassiveUnmount_0 (copy), l_resetCurrentFiber_0 (copy)
    local l_v426_0 = v426;
    while l_v426_0 ~= nil do
        local l_deletions_1 = l_v426_0.deletions;
        if l_deletions_1 ~= nil then
            for v429 = 1, #l_deletions_1 do
                local v430 = l_deletions_1[v429];
                v142.flushPassiveUnmountEffectsInsideOfDeletedTree(v430, l_v426_0);
                v142.detachFiberAfterEffects(v430);
            end;
        end;
        local l_child_1 = l_v426_0.child;
        if l_child_1 ~= nil and bit32.band(l_v426_0.subtreeFlags, v47.PassiveMask) ~= v47.NoFlags then
            v425(l_child_1);
        end;
        if bit32.band(l_v426_0.flags, v47.Passive) ~= v47.NoFlags then
            l_setCurrentFiber_0(l_v426_0);
            l_commitPassiveUnmount_0(l_v426_0);
            l_resetCurrentFiber_0();
        end;
        l_v426_0 = l_v426_0.sibling;
    end;
end;
v142.flushPassiveUnmountEffectsInsideOfDeletedTree = function(v432, v433) --[[ Line: 2827 ]]
    -- upvalues: v47 (copy), v142 (copy), l_setCurrentFiber_0 (copy), l_commitPassiveUnmountInsideDeletedTree_0 (copy), l_resetCurrentFiber_0 (copy)
    if bit32.band(v432.subtreeFlags, v47.PassiveStatic) ~= v47.NoFlags then
        local l_child_2 = v432.child;
        while l_child_2 ~= nil do
            v142.flushPassiveUnmountEffectsInsideOfDeletedTree(l_child_2, v433);
            l_child_2 = l_child_2.sibling;
        end;
    end;
    if bit32.band(v432.flags, v47.PassiveStatic) ~= v47.NoFlags then
        l_setCurrentFiber_0(v432);
        l_commitPassiveUnmountInsideDeletedTree_0(v432, v433);
        l_resetCurrentFiber_0();
    end;
end;
v407 = function() --[[ Line: 2856 ]]
    -- upvalues: v165 (ref), l_NoLanes_4 (ref), v13 (copy), l_invariant_0 (copy), v144 (ref), l_ReactFeatureFlags_0 (copy), v37 (copy), v38 (copy), v142 (copy), v425 (copy), v141 (ref), l_enableDoubleInvokingEffects_0 (copy), l_flushSyncCallbackQueue_0 (copy), v171 (ref)
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
        local v438 = v142.pushInteractions(l_v165_0);
        v425(l_v165_0.current);
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
            v142.popInteractions(v438);
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
v3.isAlreadyFailedLegacyErrorBoundary = function(v439) --[[ Line: 2928 ]]
    -- upvalues: v163 (ref)
    local v440 = false;
    if v163 ~= nil then
        v440 = v163[v439];
    end;
    return v440;
end;
v3.markLegacyErrorBoundaryAsFailed = function(v441) --[[ Line: 2936 ]]
    -- upvalues: v163 (ref)
    if v163 == nil then
        v163 = {
            [v441] = true
        };
        return;
    else
        v163[v441] = true;
        return;
    end;
end;
v3.onUncaughtError = function(v442) --[[ Line: 2945 ]] --[[ Name: prepareToThrowUncaughtError ]]
    -- upvalues: v161 (ref), v162 (ref)
    if not v161 then
        v161 = true;
        v162 = v442;
    end;
end;
v140 = function(v443, v444, v445) --[[ Line: 2953 ]]
    -- upvalues: l_createCapturedValue_0 (copy), l_createRootErrorUpdate_0 (copy), l_SyncLane_0 (copy), v3 (copy), l_enqueueUpdate_0 (copy), v142 (copy), l_markRootUpdated_0 (copy), v103 (ref)
    local v446 = l_createCapturedValue_0(v445, v444);
    local v447 = l_createRootErrorUpdate_0(v443, v446, l_SyncLane_0, v3.onUncaughtError);
    l_enqueueUpdate_0(v443, v447);
    local v448 = v3.requestEventTime();
    local v449 = v142.markUpdateLaneFromFiberToRoot(v443, l_SyncLane_0);
    if v449 ~= nil then
        l_markRootUpdated_0(v449, l_SyncLane_0, v448);
        v103(v449, v448);
        v142.schedulePendingInteractions(v449, l_SyncLane_0);
    end;
end;
v3.captureCommitPhaseError = function(v450, v451, v452) --[[ Line: 2976 ]]
    -- upvalues: v45 (copy), v140 (ref), l_skipUnmountedBoundaries_0 (copy), v3 (copy), l_createCapturedValue_0 (copy), l_createClassErrorUpdate_0 (copy), l_SyncLane_0 (copy), l_enqueueUpdate_0 (copy), v142 (copy), l_markRootUpdated_0 (copy), v103 (ref)
    if v450.tag == v45.HostRoot then
        v140(v450, v450, v452);
        return;
    else
        local v453 = nil;
        v453 = if l_skipUnmountedBoundaries_0 then v451 else v450.return_;
        while true do
            if v453 ~= nil then
                if v453.tag == v45.HostRoot then
                    v140(v453, v450, v452);
                    return;
                else
                    if v453.tag == v45.ClassComponent then
                        local l_type_0 = v453.type;
                        local l_stateNode_1 = v453.stateNode;
                        if typeof(l_type_0.getDerivedStateFromError) == "function" or typeof(l_stateNode_1.componentDidCatch) == "function" and not v3.isAlreadyFailedLegacyErrorBoundary(l_stateNode_1) then
                            local v456 = l_createCapturedValue_0(v452, v450);
                            local v457 = l_createClassErrorUpdate_0(v453, v456, l_SyncLane_0);
                            l_enqueueUpdate_0(v453, v457);
                            local v458 = v3.requestEventTime();
                            local v459 = v142.markUpdateLaneFromFiberToRoot(v453, l_SyncLane_0);
                            if v459 ~= nil then
                                l_markRootUpdated_0(v459, l_SyncLane_0, v458);
                                v103(v459, v458);
                                v142.schedulePendingInteractions(v459, l_SyncLane_0);
                            end;
                            return;
                        end;
                    end;
                    v453 = v453.return_;
                end;
            else
                return;
            end;
        end;
    end;
end;
v3.pingSuspendedRoot = function(v460, v461, v462) --[[ Line: 3029 ]]
    -- upvalues: v3 (copy), l_markRootPinged_0 (copy), v145 (ref), l_isSubsetOfLanes_0 (copy), l_NoLanes_0 (ref), l_Incomplete_0 (ref), v143 (copy), l_includesOnlyRetries_0 (copy), l_now_0 (copy), v157 (ref), v142 (copy), v13 (copy), l_NoLanes_3 (ref), l_mergeLanes_0 (copy), v103 (ref)
    local l_pingCache_0 = v460.pingCache;
    if l_pingCache_0 ~= nil then
        l_pingCache_0[v461] = nil;
    end;
    local v464 = v3.requestEventTime();
    l_markRootPinged_0(v460, v462, v464);
    if v145 == v460 and l_isSubsetOfLanes_0(l_NoLanes_0, v462) then
        if l_Incomplete_0 == v143.SuspendedWithDelay or l_Incomplete_0 == v143.Suspended and l_includesOnlyRetries_0(l_NoLanes_0) and l_now_0() - v157 < 500 then
            v142.prepareFreshStack(v460, v13.NoLanes);
        else
            l_NoLanes_3 = l_mergeLanes_0(l_NoLanes_3, v462);
        end;
    end;
    v103(v460, v464);
    v142.schedulePendingInteractions(v460, v462);
end;
retryTimedOutBoundary = function(v465, v466) --[[ Line: 3079 ]] --[[ Name: retryTimedOutBoundary ]]
    -- upvalues: v13 (copy), v3 (copy), v142 (copy), l_markRootUpdated_0 (copy), v103 (ref)
    if v466 == v13.NoLane then
        v466 = requestRetryLane(v465);
    end;
    local v467 = v3.requestEventTime();
    local v468 = v142.markUpdateLaneFromFiberToRoot(v465, v466);
    if v468 ~= nil then
        l_markRootUpdated_0(v468, v466, v467);
        v103(v468, v467);
        v142.schedulePendingInteractions(v468, v466);
    end;
end;
v3.resolveRetryWakeable = function(v469, v470) --[[ Line: 3106 ]]
    -- upvalues: v13 (copy)
    local l_NoLane_0 = v13.NoLane;
    local v472 = nil;
    v472 = v469.stateNode;
    if v472 ~= nil then
        v472:delete(v470);
    end;
    retryTimedOutBoundary(v469, l_NoLane_0);
end;
jnd = function(v473) --[[ Line: 3149 ]] --[[ Name: jnd ]]
    if v473 < 120 then
        return 120;
    elseif v473 < 480 then
        return 480;
    elseif v473 < 1080 then
        return 1080;
    elseif v473 < 1920 then
        return 1920;
    elseif v473 < 3000 then
        return 3000;
    elseif v473 < 4320 then
        return 4320;
    else
        return math.ceil(v473 / 1960) * 1960;
    end;
end;
v142.checkForNestedUpdates = function() --[[ Line: 3167 ]]
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
flushRenderPhaseStrictModeWarningsInDEV = function() --[[ Line: 3193 ]] --[[ Name: flushRenderPhaseStrictModeWarningsInDEV ]]
    -- upvalues: v124 (copy), l_ReactFeatureFlags_0 (copy)
    if _G.__DEV__ then
        v124.flushLegacyContextWarning();
        if l_ReactFeatureFlags_0.warnAboutDeprecatedLifecycles then
            v124.flushPendingUnsafeLifecycleWarnings();
        end;
    end;
end;
commitDoubleInvokeEffectsInDEV = function(v474, v475) --[[ Line: 3203 ]] --[[ Name: commitDoubleInvokeEffectsInDEV ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), l_setCurrentFiber_0 (copy), v47 (copy), l_invokeLayoutEffectUnmountInDEV_0 (copy), l_invokePassiveEffectUnmountInDEV_0 (copy), l_invokeLayoutEffectMountInDEV_0 (copy), l_invokePassiveEffectMountInDEV_0 (copy), l_resetCurrentFiber_0 (copy)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        l_setCurrentFiber_0(v474);
        invokeEffectsInDev(v474, v47.MountLayoutDev, l_invokeLayoutEffectUnmountInDEV_0);
        if v475 then
            invokeEffectsInDev(v474, v47.MountPassiveDev, l_invokePassiveEffectUnmountInDEV_0);
        end;
        invokeEffectsInDev(v474, v47.MountLayoutDev, l_invokeLayoutEffectMountInDEV_0);
        if v475 then
            invokeEffectsInDev(v474, v47.MountPassiveDev, l_invokePassiveEffectMountInDEV_0);
        end;
        l_resetCurrentFiber_0();
    end;
end;
invokeEffectsInDev = function(v476, v477, v478) --[[ Line: 3226 ]] --[[ Name: invokeEffectsInDev ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), v47 (copy)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        local l_v476_0 = v476;
        while l_v476_0 ~= nil do
            if l_v476_0.child ~= nil and bit32.band(l_v476_0.subtreeFlags, v477) ~= v47.NoFlags then
                invokeEffectsInDev(l_v476_0.child, v477, v478);
            end;
            if bit32.band(l_v476_0.flags, v477) ~= v47.NoFlags then
                v478(l_v476_0);
            end;
            l_v476_0 = l_v476_0.sibling;
        end;
    end;
end;
local v480 = nil;
v142.warnAboutUpdateOnNotYetMountedFiberInDEV = function(v481) --[[ Line: 3253 ]]
    -- upvalues: v144 (ref), v44 (copy), v45 (copy), l_getComponentName_0 (copy), v480 (ref), v125 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_resetCurrentFiber_0 (copy)
    if _G.__DEV__ then
        if bit32.band(v144, 16) ~= 0 then
            return;
        elseif bit32.band(v481.mode, (bit32.bor(v44.BlockingMode, v44.ConcurrentMode))) == 0 then
            return;
        else
            local l_tag_0 = v481.tag;
            if l_tag_0 ~= v45.IndeterminateComponent and l_tag_0 ~= v45.HostRoot and l_tag_0 ~= v45.ClassComponent and l_tag_0 ~= v45.FunctionComponent and l_tag_0 ~= v45.ForwardRef and l_tag_0 ~= v45.MemoComponent and l_tag_0 ~= v45.SimpleMemoComponent and l_tag_0 ~= v45.Block then
                return;
            else
                local v483 = l_getComponentName_0(v481.type) or "ReactComponent";
                if v480 ~= nil then
                    if v480[v483] then
                        return;
                    else
                        v480[v483] = true;
                    end;
                else
                    v480 = {
                        [v483] = true
                    };
                end;
                local l_current_3 = v125.current;
                local l_status_20, l_result_20 = pcall(function() --[[ Line: 3293 ]]
                    -- upvalues: l_setCurrentFiber_0 (ref), v481 (copy), l_console_0 (ref)
                    l_setCurrentFiber_0(v481);
                    l_console_0.error("Can't perform a React state update on a component that hasn't mounted yet. " .. "This indicates that you have a side-effect in your render function that " .. "asynchronously later calls tries to update the component. Move this work to " .. "useEffect instead.");
                end);
                if l_current_3 then
                    l_setCurrentFiber_0(v481);
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
    v142.beginWork = function(v487, v488, v489) --[[ Line: 3320 ]]
        -- upvalues: v43 (copy), v108 (copy), l_resetContextDependencies_0 (copy), v104 (copy), v113 (ref), l_unwindInterruptedWork_0 (copy), l_ReactFeatureFlags_0 (copy), v44 (copy), v122 (copy), l_invokeGuardedCallback_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy)
        local v490 = v43.assignFiberPropertiesInDEV(nil, v488);
        local l_status_21, l_result_21 = pcall(v108, v487, v488, v489);
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
            local v493 = v104.resetHooksAfterThrowRef();
            l_unwindInterruptedWork_0(v488);
            v43.assignFiberPropertiesInDEV(v488, v490);
            if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(v488.mode, v44.ProfileMode) ~= 0 then
                v122.startProfilerTimer(v488);
            end;
            l_invokeGuardedCallback_0(nil, v108, nil, v487, v488, v489);
            if l_hasCaughtError_0() then
                v493 = l_clearCaughtError_0();
                error(v493);
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
local v494 = false;
local v495 = nil;
if _G.__DEV__ then
    v495 = {};
end;
v142.warnAboutRenderPhaseUpdatesInDEV = function(v496) --[[ Line: 3396 ]]
    -- upvalues: v125 (copy), v144 (ref), v104 (copy), v113 (ref), v45 (copy), v146 (ref), l_getComponentName_0 (copy), v495 (ref), l_console_0 (copy), v494 (ref)
    if _G.__DEV__ and v125.isRendering and bit32.band(v144, 16) ~= 0 then
        if not v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
            v113 = require(script.Parent["ReactFiberHooks.new"]);
            v104.resetHooksAfterThrowRef = v113.resetHooksAfterThrow;
            v104.ContextOnlyDispatcherRef = v113.ContextOnlyDispatcher;
            v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v113.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
        end;
        if not v104.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef() then
            if v496.tag == v45.FunctionComponent or v496.tag == v45.ForwardRef or v496.tag == v45.SimpleMemoComponent then
                local v497 = if v146 ~= nil then l_getComponentName_0(v146.type) else "Unknown";
                if v495[v497] == nil then
                    v495[v497] = true;
                    local v498 = l_getComponentName_0(v496.type) or "Unknown";
                    l_console_0.error("Cannot update a component (`%s`) while rendering a " .. "different component (`%s`). To locate the bad setState() call inside `%s`, " .. "follow the stack trace as described in https://reactjs.org/link/setstate-in-render", v498, v497, v497);
                    return;
                end;
            elseif v496.tag == v45.ClassComponent and not v494 then
                l_console_0.error("Cannot update during an existing state transition (such as " .. "within `render`). Render methods should be a pure " .. "function of props and state.");
                v494 = true;
            end;
        end;
    end;
end;
v3.IsThisRendererActing = {
    current = false
};
v3.warnIfNotScopedWithMatchingAct = function(v499) --[[ Line: 3446 ]]
    -- upvalues: v42 (copy), l_IsSomeRendererActing_0 (copy), v3 (copy), v125 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_resetCurrentFiber_0 (copy)
    if _G.__DEV__ and v42.warnsIfNotActing == true and l_IsSomeRendererActing_0.current == true and v3.IsThisRendererActing.current ~= true then
        local l_current_4 = v125.current;
        local l_status_22, l_result_22 = pcall(function() --[[ Line: 3454 ]]
            -- upvalues: l_setCurrentFiber_0 (ref), v499 (copy), l_console_0 (ref)
            l_setCurrentFiber_0(v499);
            l_console_0.error("It looks like you're using the wrong act() around your test interactions.\n" .. "Be sure to use the matching version of act() corresponding to your renderer:\n\n" .. "-- for react-roblox:\n" .. "local React = require(Packages.React)\n" .. "-- ...\n" .. "React.TestUtils.act(function() ... end)\n\n" .. "-- for react-test-renderer:\n" .. "local TestRenderer = require(Packages.ReactTestRenderer)\n" .. "-- ...\n" .. "TestRenderer.act(function() ... end)");
        end);
        if l_current_4 then
            l_setCurrentFiber_0(v499);
        else
            l_resetCurrentFiber_0();
        end;
        if not l_status_22 then
            error(l_result_22);
        end;
    end;
end;
v3.warnIfNotCurrentlyActingEffectsInDEV = function(v503) --[[ Line: 3490 ]]
    -- upvalues: v42 (copy), v44 (copy), l_IsSomeRendererActing_0 (copy), v3 (copy), l_console_0 (copy), l_getComponentName_0 (copy)
    if _G.__DEV__ and v42.warnsIfNotActing == true and bit32.band(v503.mode, v44.StrictMode) ~= v44.NoMode and l_IsSomeRendererActing_0.current == false and v3.IsThisRendererActing.current == false then
        l_console_0.error("An update to %s ran an effect, but was not wrapped in act(...).\n\n" .. "When testing, code that causes React state updates should be " .. "wrapped into act(...):\n\n" .. "act(function()\n" .. "  --[[ fire events that update state ]]\n" .. "end)\n" .. "--[[ assert on the output ]]\n\n" .. "This ensures that you're testing the behavior the user would see " .. "in the real client." .. " Learn more at https://reactjs.org/link/wrap-tests-with-act", l_getComponentName_0(v503.type));
    end;
end;
v3.warnIfNotCurrentlyActingUpdatesInDEV = function(v504) --[[ Line: 3516 ]]
    -- upvalues: v42 (copy), v144 (ref), l_IsSomeRendererActing_0 (copy), v3 (copy), l_current_0 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_resetCurrentFiber_0 (copy)
    if _G.__DEV__ and v42.warnsIfNotActing == true and v144 == 0 and l_IsSomeRendererActing_0.current == false and v3.IsThisRendererActing.current == false then
        local l_l_current_0_0 = l_current_0;
        local l_status_23, l_result_23 = pcall(function() --[[ Line: 3525 ]]
            -- upvalues: l_setCurrentFiber_0 (ref), v504 (copy), l_console_0 (ref), l_getComponentName_0 (ref)
            l_setCurrentFiber_0(v504);
            l_console_0.error("An update to %s inside a test was not wrapped in act(...).\n\n" .. "When testing, code that causes React state updates should be " .. "wrapped into act(...):\n\n" .. "act(function()\n" .. "  --[[ fire events that update state ]]\n" .. "end)\n" .. "--[[ assert on the output ]]\n\n" .. "This ensures that you're testing the behavior the user would see " .. "in the client application." .. " Learn more at https://reactjs.org/link/wrap-tests-with-act", l_getComponentName_0(v504.type));
        end);
        if l_l_current_0_0 then
            l_setCurrentFiber_0(v504);
        else
            l_resetCurrentFiber_0();
        end;
        if l_status_23 then
            return l_result_23;
        end;
    end;
end;
local v508 = false;
v3.warnIfUnmockedScheduler = function(v509) --[[ Line: 3566 ]]
    -- upvalues: v508 (ref), v14 (copy), v44 (copy), l_console_0 (copy), l_ReactFeatureFlags_0 (copy)
    if _G.__DEV__ and v508 == false and v14.unstable_flushAllWithoutAsserting == nil then
        if bit32.band(v509.mode, v44.BlockingMode) ~= 0 or bit32.band(v509.mode, v44.ConcurrentMode) ~= 0 then
            v508 = true;
            l_console_0.error("In Concurrent or Sync modes, the 'scheduler' module needs to be mocked " .. "to guarantee consistent behaviour across tests and client application. " .. "For example, with RobloxJest: \n" .. "RobloxJest.mock('scheduler', function() return require(Packages.Scheduler).unstable_mock end)\n\n" .. "For more info, visit https://reactjs.org/link/mock-scheduler");
            return;
        elseif l_ReactFeatureFlags_0.warnAboutUnmockedScheduler == true then
            v508 = true;
            l_console_0.error("Starting from React v18, the 'scheduler' module will need to be mocked " .. "to guarantee consistent behaviour across tests and client applications. " .. "For example, with RobloxJest: \n" .. "RobloxJest.mock('scheduler', function() return require(Packages.Scheduler).unstable_mock end)\n\n" .. "For more info, visit https://reactjs.org/link/mock-scheduler");
        end;
    end;
end;
computeThreadID = function(v510, v511) --[[ Line: 3607 ]] --[[ Name: computeThreadID ]]
    return v511 * 1000 + v510.interactionThreadID;
end;
v3.markSpawnedWork = function(v512) --[[ Line: 3615 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), v172 (ref)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    elseif v172 == nil then
        v172 = {
            v512
        };
        return;
    else
        table.insert(v172, v512);
        return;
    end;
end;
scheduleInteractions = function(v513, v514, v515) --[[ Line: 3627 ]] --[[ Name: scheduleInteractions ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), v8 (copy), l___subscriberRef_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        if next(v515) ~= nil then
            local l_pendingInteractionMap_0 = v513.pendingInteractionMap;
            local v517 = l_pendingInteractionMap_0[v514];
            if v517 ~= nil then
                if v515.ipairs ~= nil then
                    for _, v519 in v515:ipairs() do
                        if not v517[v519] then
                            v519.__count = v519.__count + 1;
                        end;
                        v517[v519] = true;
                    end;
                else
                    for _, v521 in ipairs(v515) do
                        if not v517[v521] then
                            v521.__count = v521.__count + 1;
                        end;
                        v517[v521] = true;
                    end;
                end;
            else
                l_pendingInteractionMap_0[v514] = v8(v515);
                if v515.ipairs ~= nil then
                    for _, v523 in v515:ipairs() do
                        v523.__count = v523.__count + 1;
                    end;
                else
                    for _, v525 in ipairs(v515) do
                        v525.__count = v525.__count + 1;
                    end;
                end;
            end;
            local l_current_5 = l___subscriberRef_0.current;
            if l_current_5 ~= nil then
                local v527 = computeThreadID(v513, v514);
                l_current_5.onWorkScheduled(v515, v527);
            end;
        end;
        return;
    end;
end;
v142.schedulePendingInteractions = function(v528, v529) --[[ Line: 3682 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___interactionsRef_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        scheduleInteractions(v528, v529, l___interactionsRef_0.current);
        return;
    end;
end;
v142.startWorkOnPendingInteractions = function(v530, v531) --[[ Line: 3693 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l_Set_0 (copy), l_includesSomeLane_0 (copy), l___subscriberRef_0 (copy), l_scheduleCallback_0 (copy), l_ImmediatePriority_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        local v532 = l_Set_0.new();
        for v533, v534 in pairs(v530.pendingInteractionMap) do
            if l_includesSomeLane_0(v531, v533) then
                for _, v536 in v534:ipairs() do
                    v532:add(v536);
                end;
            end;
        end;
        v530.memoizedInteractions = v532;
        if next(v532) ~= nil then
            local l_current_6 = l___subscriberRef_0.current;
            if l_current_6 ~= nil then
                local v538 = computeThreadID(v530, v531);
                local l_status_24, l_result_24 = pcall(l_current_6.onWorkStarted, v532, v538);
                if not l_status_24 then
                    l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3726 ]]
                        -- upvalues: l_result_24 (copy)
                        error(l_result_24);
                    end);
                end;
            end;
        end;
        return;
    end;
end;
v142.finishPendingInteractions = function(v541, v542) --[[ Line: 3734 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___subscriberRef_0 (copy), l_includesSomeLane_0 (copy), l_scheduleCallback_0 (copy), l_ImmediatePriority_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        local l_pendingLanes_0 = v541.pendingLanes;
        local v544 = nil;
        local v545 = true;
        local v546 = nil;
        if v544 ~= nil then
            local l_memoizedInteractions_0 = v541.memoizedInteractions;
            if next(l_memoizedInteractions_0) ~= nil then
                local v548 = computeThreadID(v541, v542);
                v544 = l___subscriberRef_0.current;
                local v549;
                l_memoizedInteractions_0, v549 = pcall(v544.onWorkStopped, v541.memoizedInteractions, v548);
                v545 = l_memoizedInteractions_0;
                v546 = v549;
            end;
        end;
        local l_pendingInteractionMap_1 = v541.pendingInteractionMap;
        for v551, v552 in pairs(l_pendingInteractionMap_1) do
            if not l_includesSomeLane_0(l_pendingLanes_0, v551) then
                l_pendingInteractionMap_1[v551] = nil;
                if v552.size ~= 0 then
                    if v552.ipairs ~= nil then
                        for _, v554 in v552:ipairs() do
                            v554.__count = v554.__count - 1;
                            if v544 ~= nil and v554.__count == 0 then
                                local l_status_25, l_result_25 = pcall(v544.onInteractionScheduledWorkCompleted, v554);
                                if not l_status_25 then
                                    l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3778 ]]
                                        -- upvalues: l_result_25 (copy)
                                        error(l_result_25);
                                    end);
                                end;
                            end;
                        end;
                    else
                        for _, v558 in ipairs(v552) do
                            v558.__count = v558.__count - 1;
                            if v544 ~= nil and v558.__count == 0 then
                                local l_status_26, l_result_26 = pcall(v544.onInteractionScheduledWorkCompleted, v558);
                                if not l_status_26 then
                                    l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3792 ]]
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
        if not v545 then
            l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3804 ]]
                -- upvalues: v546 (ref)
                error(v546);
            end);
        end;
        return;
    end;
end;
local v561 = false;
local v562 = false;
local l_unstable_flushAllWithoutAsserting_0 = v14.unstable_flushAllWithoutAsserting;
local v564 = typeof(l_unstable_flushAllWithoutAsserting_0) == "function";
local function v572() --[[ Line: 3823 ]] --[[ Name: flushActWork ]]
    -- upvalues: l_unstable_flushAllWithoutAsserting_0 (copy), v561 (ref), v3 (copy)
    if l_unstable_flushAllWithoutAsserting_0 ~= nil then
        local l_v561_0 = v561;
        v561 = true;
        local l_status_27, l_result_27 = pcall(l_unstable_flushAllWithoutAsserting_0);
        v561 = l_v561_0;
        if not l_status_27 then
            error(l_result_27);
            return;
        else
            return l_result_27;
        end;
    else
        local l_v561_1 = v561;
        v561 = true;
        local l_status_28, l_result_28 = pcall(function() --[[ Line: 3843 ]]
            -- upvalues: v3 (ref)
            local v569 = false;
            while v3.flushPassiveEffects() do
                v569 = true;
            end;
            return v569;
        end);
        v561 = l_v561_1;
        if not l_status_28 then
            error(l_result_28);
            return;
        else
            return l_result_28;
        end;
    end;
end;
local function v573(v574) --[[ Line: 3862 ]] --[[ Name: flushWorkAndMicroTasks ]]
    -- upvalues: v572 (copy), l_enqueueTask_0 (copy), v573 (copy)
    local l_status_29, l_result_29 = pcall(v572);
    if l_status_29 then
        local l_status_30, l_result_30 = pcall(l_enqueueTask_0, function() --[[ Line: 3866 ]]
            -- upvalues: v572 (ref), v573 (ref), v574 (copy)
            if v572() then
                v573(v574);
                return;
            else
                v574();
                return;
            end;
        end);
        l_status_29 = l_status_30;
        l_result_29 = l_result_30;
    end;
    if not l_status_29 then
        v574(l_result_29);
    end;
end;
v3.act = function(v579) --[[ Line: 3880 ]]
    -- upvalues: v211 (ref), l_console_0 (copy), v210 (ref), l_IsSomeRendererActing_0 (copy), v3 (copy), v562 (ref), v100 (copy), v564 (copy), v573 (copy), v572 (copy)
    if not _G.__DEV__ and not _G.__ROACT_17_MOCK_SCHEDULER__ and v211 == false then
        v211 = true;
        l_console_0.error("act(...) is not supported in production builds of React, and might not behave as expected.");
    end;
    local l_v210_0 = v210;
    v210 = v210 + 1;
    local l_current_7 = l_IsSomeRendererActing_0.current;
    local l_current_8 = v3.IsThisRendererActing.current;
    local l_v562_0 = v562;
    l_IsSomeRendererActing_0.current = true;
    v3.IsThisRendererActing.current = true;
    v562 = true;
    local function _() --[[ Line: 3905 ]] --[[ Name: onDone ]]
        -- upvalues: v210 (ref), l_IsSomeRendererActing_0 (ref), l_current_7 (copy), v3 (ref), l_current_8 (copy), v562 (ref), l_v562_0 (copy), l_v210_0 (copy), l_console_0 (ref)
        v210 = v210 - 1;
        l_IsSomeRendererActing_0.current = l_current_7;
        v3.IsThisRendererActing.current = l_current_8;
        v562 = l_v562_0;
        if _G.__DEV__ and l_v210_0 < v210 then
            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
        end;
    end;
    local l_status_31, l_result_31 = pcall(v3.batchedUpdates, v579);
    if not l_status_31 then
        v210 = v210 - 1;
        l_IsSomeRendererActing_0.current = l_current_7;
        v3.IsThisRendererActing.current = l_current_8;
        v562 = l_v562_0;
        if _G.__DEV__ and l_v210_0 < v210 then
            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
        end;
        error(l_result_31);
    end;
    if l_result_31 ~= nil and typeof(l_result_31) == "table" and typeof(l_result_31.andThen) == "function" then
        local v587 = false;
        if _G.__DEV__ and typeof(v100) ~= nil then
            v100.resolve():andThen(function() --[[ Line: 3939 ]]

            end):andThen(function() --[[ Line: 3940 ]]
                -- upvalues: v587 (ref), l_console_0 (ref)
                if v587 == false then
                    l_console_0.error("You called act(Promise.new(function() --[[ ... ]] end)) without :await() or :expect(). " .. "This could lead to unexpected testing behaviour, interleaving multiple act " .. "calls and mixing their scopes. You should - act(function() Promise.new(function() --[[ ... ]] end):await() end);");
                end;
            end);
        end;
        return {
            andThen = function(_, v589, v590) --[[ Line: 3958 ]] --[[ Name: andThen ]]
                -- upvalues: v587 (ref), l_result_31 (copy), v210 (ref), v564 (ref), l_current_7 (copy), l_IsSomeRendererActing_0 (ref), v3 (ref), l_current_8 (copy), v562 (ref), l_v562_0 (copy), l_v210_0 (copy), l_console_0 (ref), v573 (ref)
                v587 = true;
                l_result_31:andThen(function() --[[ Line: 3961 ]]
                    -- upvalues: v210 (ref), v564 (ref), l_current_7 (ref), l_IsSomeRendererActing_0 (ref), v3 (ref), l_current_8 (ref), v562 (ref), l_v562_0 (ref), l_v210_0 (ref), l_console_0 (ref), v589 (copy), v573 (ref), v590 (copy)
                    if v210 > 1 or v564 == true and l_current_7 == true then
                        v210 = v210 - 1;
                        l_IsSomeRendererActing_0.current = l_current_7;
                        v3.IsThisRendererActing.current = l_current_8;
                        v562 = l_v562_0;
                        if _G.__DEV__ and l_v210_0 < v210 then
                            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                        end;
                        v589();
                        return;
                    else
                        v573(function(v591) --[[ Line: 3973 ]]
                            -- upvalues: v210 (ref), l_IsSomeRendererActing_0 (ref), l_current_7 (ref), v3 (ref), l_current_8 (ref), v562 (ref), l_v562_0 (ref), l_v210_0 (ref), l_console_0 (ref), v590 (ref), v589 (ref)
                            v210 = v210 - 1;
                            l_IsSomeRendererActing_0.current = l_current_7;
                            v3.IsThisRendererActing.current = l_current_8;
                            v562 = l_v562_0;
                            if _G.__DEV__ and l_v210_0 < v210 then
                                l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                            end;
                            if v591 then
                                v590(v591);
                                return;
                            else
                                v589();
                                return;
                            end;
                        end);
                        return;
                    end;
                end, function(v592) --[[ Line: 3982 ]]
                    -- upvalues: v210 (ref), l_IsSomeRendererActing_0 (ref), l_current_7 (ref), v3 (ref), l_current_8 (ref), v562 (ref), l_v562_0 (ref), l_v210_0 (ref), l_console_0 (ref), v590 (copy)
                    v210 = v210 - 1;
                    l_IsSomeRendererActing_0.current = l_current_7;
                    v3.IsThisRendererActing.current = l_current_8;
                    v562 = l_v562_0;
                    if _G.__DEV__ and l_v210_0 < v210 then
                        l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                    end;
                    v590(v592);
                end);
            end
        };
    else
        if _G.__DEV__ and l_result_31 ~= nil then
            l_console_0.error("The callback passed to act(...) function " .. "must return nil, or a Promise. You returned %s", (tostring(l_result_31)));
        end;
        local l_status_32, l_result_32 = pcall(function() --[[ Line: 4002 ]]
            -- upvalues: v210 (ref), v564 (ref), l_current_7 (copy), v572 (ref), l_IsSomeRendererActing_0 (ref), v3 (ref), l_current_8 (copy), v562 (ref), l_v562_0 (copy), l_v210_0 (copy), l_console_0 (ref)
            if v210 == 1 and (v564 == false or l_current_7 == false) then
                v572();
            end;
            v210 = v210 - 1;
            l_IsSomeRendererActing_0.current = l_current_7;
            v3.IsThisRendererActing.current = l_current_8;
            v562 = l_v562_0;
            if _G.__DEV__ and l_v210_0 < v210 then
                l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
            end;
        end);
        if not l_status_32 then
            v210 = v210 - 1;
            l_IsSomeRendererActing_0.current = l_current_7;
            v3.IsThisRendererActing.current = l_current_8;
            v562 = l_v562_0;
            if _G.__DEV__ and l_v210_0 < v210 then
                l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
            end;
            error(l_result_32);
        end;
        return {
            andThen = function(_, v596, _) --[[ Line: 4021 ]] --[[ Name: andThen ]]
                -- upvalues: l_console_0 (ref)
                if _G.__DEV__ then
                    l_console_0.error("Do not await the result of calling act(...) with sync logic, it is not a Promise.");
                end;
                v596();
            end
        };
    end;
end;
v142.detachFiberAfterEffects = function(v598) --[[ Line: 4033 ]]
    v598.child = nil;
    v598.deletions = nil;
    v598.dependencies = nil;
    v598.memoizedProps = nil;
    v598.memoizedState = nil;
    v598.pendingProps = nil;
    v598.sibling = nil;
    v598.stateNode = nil;
    v598.updateQueue = nil;
    if _G.__DEV__ then
        v598._debugOwner = nil;
    end;
end;
return v3;