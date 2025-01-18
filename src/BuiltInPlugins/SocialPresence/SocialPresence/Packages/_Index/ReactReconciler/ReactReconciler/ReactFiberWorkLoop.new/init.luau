local l___DEV___0 = _G.__DEV__;
local l___YOLO___0 = _G.__YOLO__;
local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_Set_0 = require(l_Parent_0.LuauPolyfill).Set;
local v5 = {};
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactInternalTypes);
local v8 = require(script.Parent.ReactFiberLane);
local v9 = require(l_Parent_0.Scheduler);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v11 = require(script.Parent["ReactFiberStack.new"]);
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableDebugTracing_0 = l_ReactFeatureFlags_0.enableDebugTracing;
local l_enableSchedulingProfiler_0 = l_ReactFeatureFlags_0.enableSchedulingProfiler;
local l_skipUnmountedBoundaries_0 = l_ReactFeatureFlags_0.skipUnmountedBoundaries;
local l_enableDoubleInvokingEffects_0 = l_ReactFeatureFlags_0.enableDoubleInvokingEffects;
local v17 = require(l_Parent_0.Shared);
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local l_ReactSharedInternals_0 = v17.ReactSharedInternals;
local l_invariant_0 = v17.invariant;
local v21 = require(script.Parent["SchedulerWithReactIntegration.new"]);
local l_scheduleCallback_0 = v21.scheduleCallback;
local l_cancelCallback_0 = v21.cancelCallback;
local l_getCurrentPriorityLevel_0 = v21.getCurrentPriorityLevel;
local l_runWithPriority_0 = v21.runWithPriority;
local l_shouldYield_0 = v21.shouldYield;
local l_requestPaint_0 = v21.requestPaint;
local l_now_0 = v21.now;
local l_NoPriority_0 = v21.NoPriority;
local l_ImmediatePriority_0 = v21.ImmediatePriority;
local l_UserBlockingPriority_0 = v21.UserBlockingPriority;
local l_NormalPriority_0 = v21.NormalPriority;
local l_flushSyncCallbackQueue_0 = v21.flushSyncCallbackQueue;
local l_scheduleSyncCallback_0 = v21.scheduleSyncCallback;
local v35 = require(script.Parent.DebugTracing);
local v36 = require(script.Parent.SchedulingProfiler);
local l_tracing_0 = require(l_Parent_0.Scheduler).tracing;
local l___interactionsRef_0 = l_tracing_0.__interactionsRef;
local l___subscriberRef_0 = l_tracing_0.__subscriberRef;
local v40 = require(script.Parent.ReactFiberHostConfig);
local v41 = require(script.Parent["ReactFiber.new"]);
local v42 = require(script.Parent.ReactTypeOfMode);
local v43 = require(script.Parent.ReactWorkTags);
local l_LegacyRoot_0 = require(script.Parent.ReactRootTags).LegacyRoot;
local v45 = require(script.Parent.ReactFiberFlags);
local l_SyncLane_0 = v8.SyncLane;
local l_SyncBatchedLane_0 = v8.SyncBatchedLane;
local l_NoTimestamp_0 = v8.NoTimestamp;
local l_findUpdateLane_0 = v8.findUpdateLane;
local l_findTransitionLane_0 = v8.findTransitionLane;
local l_findRetryLane_0 = v8.findRetryLane;
local l_includesSomeLane_0 = v8.includesSomeLane;
local l_isSubsetOfLanes_0 = v8.isSubsetOfLanes;
local l_mergeLanes_0 = v8.mergeLanes;
local l_removeLanes_0 = v8.removeLanes;
local l_pickArbitraryLane_0 = v8.pickArbitraryLane;
local l_hasDiscreteLanes_0 = v8.hasDiscreteLanes;
local l_includesNonIdleWork_0 = v8.includesNonIdleWork;
local l_includesOnlyRetries_0 = v8.includesOnlyRetries;
local l_includesOnlyTransitions_0 = v8.includesOnlyTransitions;
local l_getNextLanes_0 = v8.getNextLanes;
local l_returnNextLanesPriority_0 = v8.returnNextLanesPriority;
local l_setCurrentUpdateLanePriority_0 = v8.setCurrentUpdateLanePriority;
local l_getCurrentUpdateLanePriority_0 = v8.getCurrentUpdateLanePriority;
local l_markStarvedLanesAsExpired_0 = v8.markStarvedLanesAsExpired;
local l_getLanesToRetrySynchronouslyOnError_0 = v8.getLanesToRetrySynchronouslyOnError;
local l_getMostRecentEventTime_0 = v8.getMostRecentEventTime;
local l_markRootUpdated_0 = v8.markRootUpdated;
local l_markRootSuspended_0 = v8.markRootSuspended;
local l_markRootPinged_0 = v8.markRootPinged;
local l_markRootExpired_0 = v8.markRootExpired;
local l_markDiscreteUpdatesExpired_0 = v8.markDiscreteUpdatesExpired;
local l_markRootFinished_0 = v8.markRootFinished;
local l_schedulerPriorityToLanePriority_0 = v8.schedulerPriorityToLanePriority;
local l_lanePriorityToSchedulerPriority_0 = v8.lanePriorityToSchedulerPriority;
local v76 = require(script.Parent.ReactFiberTransition);
local v77 = require(script.Parent["ReactFiberUnwindWork.new"]);
local l_unwindWork_0 = v77.unwindWork;
local l_unwindInterruptedWork_0 = v77.unwindInterruptedWork;
local v80 = require(script.Parent["ReactFiberThrow.new"]);
local l_throwException_0 = v80.throwException;
local l_createRootErrorUpdate_0 = v80.createRootErrorUpdate;
local l_createClassErrorUpdate_0 = v80.createClassErrorUpdate;
local v84 = require(script.Parent["ReactFiberCommitWork.new"]);
local l_commitBeforeMutationLifeCycles_0 = v84.commitBeforeMutationLifeCycles;
local l_commitPlacement_0 = v84.commitPlacement;
local l_commitWork_0 = v84.commitWork;
local l_commitDeletion_0 = v84.commitDeletion;
local l_commitPassiveUnmount_0 = v84.commitPassiveUnmount;
local l_commitPassiveUnmountInsideDeletedTree_0 = v84.commitPassiveUnmountInsideDeletedTree;
local l_commitPassiveMount_0 = v84.commitPassiveMount;
local l_commitDetachRef_0 = v84.commitDetachRef;
local l_invokeLayoutEffectMountInDEV_0 = v84.invokeLayoutEffectMountInDEV;
local l_invokePassiveEffectMountInDEV_0 = v84.invokePassiveEffectMountInDEV;
local l_invokeLayoutEffectUnmountInDEV_0 = v84.invokeLayoutEffectUnmountInDEV;
local l_invokePassiveEffectUnmountInDEV_0 = v84.invokePassiveEffectUnmountInDEV;
local l_recursivelyCommitLayoutEffects_0 = v84.recursivelyCommitLayoutEffects;
local v98 = require(l_Parent_0.Promise);
local l_enqueueUpdate_0 = require(script.Parent["ReactUpdateQueue.new"]).enqueueUpdate;
local l_resetContextDependencies_0 = require(script.Parent["ReactFiberNewContext.new"]).resetContextDependencies;
local v101 = nil;
local v102 = {
    resetHooksAfterThrowRef = nil, 
    ContextOnlyDispatcherRef = nil, 
    getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = nil, 
    originalBeginWorkRef = nil, 
    completeWorkRef = nil
};
local function v106(v103, v104, v105) --[[ Line: 232 ]]
    -- upvalues: v102 (copy)
    if not v102.originalBeginWorkRef then
        v102.originalBeginWorkRef = require(script.Parent["ReactFiberBeginWork.new"]).beginWork;
    end;
    return v102.originalBeginWorkRef(v103, v104, v105);
end;
local function _(v107, v108, v109) --[[ Line: 243 ]]
    -- upvalues: v102 (copy)
    if not v102.completeWorkRef then
        v102.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
    end;
    return v102.completeWorkRef(v107, v108, v109);
end;
local v111 = nil;
local function _() --[[ Line: 257 ]] --[[ Name: initReactFiberHooks ]]
    -- upvalues: v111 (ref), v102 (copy)
    v111 = require(script.Parent["ReactFiberHooks.new"]);
    v102.resetHooksAfterThrowRef = v111.resetHooksAfterThrow;
    v102.ContextOnlyDispatcherRef = v111.ContextOnlyDispatcher;
    v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v111.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
end;
local function _() --[[ Line: 265 ]]
    -- upvalues: v102 (copy), v111 (ref)
    if not v102.resetHooksAfterThrowRef then
        v111 = require(script.Parent["ReactFiberHooks.new"]);
        v102.resetHooksAfterThrowRef = v111.resetHooksAfterThrow;
        v102.ContextOnlyDispatcherRef = v111.ContextOnlyDispatcher;
        v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v111.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    return v102.resetHooksAfterThrowRef();
end;
local function _() --[[ Line: 273 ]]
    -- upvalues: v102 (copy), v111 (ref)
    if not v102.ContextOnlyDispatcherRef then
        v111 = require(script.Parent["ReactFiberHooks.new"]);
        v102.resetHooksAfterThrowRef = v111.resetHooksAfterThrow;
        v102.ContextOnlyDispatcherRef = v111.ContextOnlyDispatcher;
        v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v111.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    return v102.ContextOnlyDispatcherRef;
end;
local function _() --[[ Line: 281 ]]
    -- upvalues: v102 (copy), v111 (ref)
    if not v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
        v111 = require(script.Parent["ReactFiberHooks.new"]);
        v102.resetHooksAfterThrowRef = v111.resetHooksAfterThrow;
        v102.ContextOnlyDispatcherRef = v111.ContextOnlyDispatcher;
        v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v111.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    return v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef();
end;
local l_createCapturedValue_0 = require(script.Parent.ReactCapturedValue).createCapturedValue;
local l_push_0 = v11.push;
local l_pop_0 = v11.pop;
local l_createCursor_0 = v11.createCursor;
local v120 = require(script.Parent["ReactProfilerTimer.new"]);
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v122 = require(script.Parent["ReactStrictModeWarnings.new"]);
local v123 = require(script.Parent.ReactCurrentFiber);
local l_current_0 = v123.current;
local l_resetCurrentFiber_0 = v123.resetCurrentFiber;
local l_setCurrentFiber_0 = v123.setCurrentFiber;
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
local v138 = nil;
local v139 = nil;
local v140 = {};
v5.NoContext = 0;
v5.RetryAfterError = 64;
local v141 = {
    Incomplete = 0, 
    FatalErrored = 1, 
    Errored = 2, 
    Suspended = 3, 
    SuspendedWithDelay = 4, 
    Completed = 5
};
local v142 = 0;
local v143 = nil;
local v144 = nil;
local l_NoLanes_0 = v8.NoLanes;
v5.subtreeRenderLanes = v8.NoLanes;
local v146 = l_createCursor_0(v8.NoLanes);
local l_Incomplete_0 = v141.Incomplete;
local v148 = nil;
local l_NoLanes_1 = v8.NoLanes;
local v150 = require(script.Parent.ReactFiberWorkInProgress);
local l_workInProgressRootSkippedLanes_0 = v150.workInProgressRootSkippedLanes;
local l_NoLanes_2 = v8.NoLanes;
local l_NoLanes_3 = v8.NoLanes;
local v154 = nil;
local v155 = 0;
local v156 = 1e999;
local v157 = nil;
local function _() --[[ Line: 407 ]] --[[ Name: resetRenderTimer ]]
    -- upvalues: v156 (ref), l_now_0 (copy)
    v156 = l_now_0() + 500;
end;
v5.getRenderTargetTime = function() --[[ Line: 411 ]]
    -- upvalues: v156 (ref)
    return v156;
end;
local v159 = false;
local v160 = nil;
local v161 = nil;
local v162 = false;
local v163 = nil;
local l_l_NoPriority_0_0 = l_NoPriority_0;
local l_NoLanes_4 = v8.NoLanes;
local v166 = nil;
local v167 = 0;
local v168 = nil;
local v169 = 0;
local v170 = nil;
local l_l_NoTimestamp_0_0 = l_NoTimestamp_0;
local l_NoLanes_5 = v8.NoLanes;
local l_NoLanes_6 = v8.NoLanes;
local v174 = nil;
local v175 = false;
v5.getWorkInProgressRoot = function() --[[ Line: 451 ]]
    -- upvalues: v143 (ref)
    return v143;
end;
v5.requestEventTime = function() --[[ Line: 455 ]]
    -- upvalues: v142 (ref), l_now_0 (copy), l_l_NoTimestamp_0_0 (ref), l_NoTimestamp_0 (copy)
    if bit32.band(v142, 48) ~= 0 then
        return l_now_0();
    elseif l_l_NoTimestamp_0_0 ~= l_NoTimestamp_0 then
        return l_l_NoTimestamp_0_0;
    else
        l_l_NoTimestamp_0_0 = l_now_0();
        return l_l_NoTimestamp_0_0;
    end;
end;
v5.requestUpdateLane = function(v176) --[[ Line: 474 ]]
    -- upvalues: v42 (copy), l_SyncLane_0 (copy), l_getCurrentPriorityLevel_0 (copy), l_ImmediatePriority_0 (copy), l_SyncBatchedLane_0 (copy), l_ReactFeatureFlags_0 (copy), v142 (ref), l_NoLanes_0 (ref), v8 (copy), l_pickArbitraryLane_0 (copy), l_NoLanes_5 (ref), l_NoLanes_1 (ref), v76 (copy), l_NoLanes_6 (ref), v154 (ref), l_findTransitionLane_0 (copy), l_UserBlockingPriority_0 (copy), l_findUpdateLane_0 (copy), l_schedulerPriorityToLanePriority_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l___DEV___0 (copy), l_console_0 (copy)
    local l_mode_0 = v176.mode;
    if bit32.band(l_mode_0, v42.BlockingMode) == v42.NoMode then
        return l_SyncLane_0;
    elseif bit32.band(l_mode_0, v42.ConcurrentMode) == v42.NoMode then
        if l_getCurrentPriorityLevel_0() == l_ImmediatePriority_0 then
            return l_SyncLane_0;
        else
            return l_SyncBatchedLane_0;
        end;
    elseif not l_ReactFeatureFlags_0.deferRenderPhaseUpdateToNextBatch and bit32.band(v142, 16) ~= 0 and l_NoLanes_0 ~= v8.NoLanes then
        return l_pickArbitraryLane_0(l_NoLanes_0);
    else
        if l_NoLanes_5 == v8.NoLanes then
            l_NoLanes_5 = l_NoLanes_1;
        end;
        if v76.requestCurrentTransition() ~= v76.NoTransition then
            if l_NoLanes_6 ~= v8.NoLanes then
                if v154 ~= nil then
                    l_NoLanes_6 = v154.pendingLanes;
                else
                    l_NoLanes_6 = v8.NoLanes;
                end;
            end;
            return l_findTransitionLane_0(l_NoLanes_5, l_NoLanes_6);
        else
            local v178 = l_getCurrentPriorityLevel_0();
            local _ = nil;
            if bit32.band(v142, 4) ~= 0 and v178 == l_UserBlockingPriority_0 then
                return (l_findUpdateLane_0(v8.InputDiscreteLanePriority, l_NoLanes_5));
            else
                local v180 = l_schedulerPriorityToLanePriority_0(v178);
                if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
                    local v181 = l_getCurrentUpdateLanePriority_0();
                    if v180 ~= v181 and v181 ~= v8.NoLanePriority and l___DEV___0 then
                        l_console_0.error("Expected current scheduler lane priority %s to match current update lane priority %s", tostring(v180), (tostring(v181)));
                    end;
                end;
                return (l_findUpdateLane_0(v180, l_NoLanes_5));
            end;
        end;
    end;
end;
requestRetryLane = function(v182) --[[ Line: 578 ]] --[[ Name: requestRetryLane ]]
    -- upvalues: v42 (copy), l_SyncLane_0 (copy), l_getCurrentPriorityLevel_0 (copy), l_ImmediatePriority_0 (copy), l_SyncBatchedLane_0 (copy), l_NoLanes_5 (ref), v8 (copy), l_NoLanes_1 (ref), l_findRetryLane_0 (copy)
    local l_mode_1 = v182.mode;
    if bit32.band(l_mode_1, v42.BlockingMode) == v42.NoMode then
        return l_SyncLane_0;
    elseif bit32.band(l_mode_1, v42.ConcurrentMode) == v42.NoMode then
        if l_getCurrentPriorityLevel_0() == l_ImmediatePriority_0 then
            return l_SyncLane_0;
        else
            return l_SyncBatchedLane_0;
        end;
    else
        if l_NoLanes_5 == v8.NoLanes then
            l_NoLanes_5 = l_NoLanes_1;
        end;
        return l_findRetryLane_0(l_NoLanes_5);
    end;
end;
v5.scheduleUpdateOnFiber = function(v184, v185, v186) --[[ Line: 600 ]]
    -- upvalues: v140 (copy), l_markRootUpdated_0 (copy), v143 (ref), l_ReactFeatureFlags_0 (copy), v142 (ref), l_NoLanes_2 (ref), l_mergeLanes_0 (copy), l_Incomplete_0 (ref), v141 (copy), l_NoLanes_0 (ref), l_getCurrentPriorityLevel_0 (copy), l_SyncLane_0 (copy), v101 (ref), v156 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy), l_UserBlockingPriority_0 (copy), l_ImmediatePriority_0 (copy), v166 (ref), l_Set_0 (copy), v154 (ref)
    v140.checkForNestedUpdates();
    local v187 = v140.markUpdateLaneFromFiberToRoot(v184, v185);
    if v187 == nil then
        return nil;
    else
        l_markRootUpdated_0(v187, v185, v186);
        if v187 == v143 then
            v140.warnAboutRenderPhaseUpdatesInDEV(v184);
            if l_ReactFeatureFlags_0.deferRenderPhaseUpdateToNextBatch or bit32.band(v142, 16) == 0 then
                l_NoLanes_2 = l_mergeLanes_0(l_NoLanes_2, v185);
            end;
            if l_Incomplete_0 == v141.SuspendedWithDelay then
                v140.markRootSuspended(v187, l_NoLanes_0);
            end;
        end;
        local v188 = l_getCurrentPriorityLevel_0();
        if v185 == l_SyncLane_0 then
            if bit32.band(v142, 8) ~= 0 and bit32.band(v142, 48) == 0 then
                v140.schedulePendingInteractions(v187, v185);
                v140.performSyncWorkOnRoot(v187);
            else
                v101(v187, v186);
                v140.schedulePendingInteractions(v187, v185);
                if v142 == 0 then
                    v156 = l_now_0() + 500;
                    l_flushSyncCallbackQueue_0();
                end;
            end;
        else
            if bit32.band(v142, 4) ~= 0 and (v188 == l_UserBlockingPriority_0 or v188 == l_ImmediatePriority_0) then
                if v166 == nil then
                    v166 = l_Set_0.new({
                        v187
                    });
                else
                    v166:add(v187);
                end;
            end;
            v101(v187, v186);
            v140.schedulePendingInteractions(v187, v185);
        end;
        v154 = v187;
        return v187;
    end;
end;
v140.markUpdateLaneFromFiberToRoot = function(v189, v190) --[[ Line: 709 ]]
    -- upvalues: l_mergeLanes_0 (copy), l___DEV___0 (copy), v45 (copy), v140 (copy), v43 (copy)
    v189.lanes = l_mergeLanes_0(v189.lanes, v190);
    local l_alternate_0 = v189.alternate;
    if l_alternate_0 ~= nil then
        l_alternate_0.lanes = l_mergeLanes_0(l_alternate_0.lanes, v190);
    end;
    if l___DEV___0 and l_alternate_0 == nil and bit32.band(v189.flags, (bit32.bor(v45.Placement, v45.Hydrating))) ~= v45.NoFlags then
        v140.warnAboutUpdateOnNotYetMountedFiberInDEV(v189);
    end;
    local l_v189_0 = v189;
    local l_return__0 = v189.return_;
    while l_return__0 ~= nil do
        l_return__0.childLanes = l_mergeLanes_0(l_return__0.childLanes, v190);
        l_alternate_0 = l_return__0.alternate;
        if l_alternate_0 ~= nil then
            l_alternate_0.childLanes = l_mergeLanes_0(l_alternate_0.childLanes, v190);
        elseif l___DEV___0 and bit32.band(l_return__0.flags, (bit32.bor(v45.Placement, v45.Hydrating))) ~= v45.NoFlags then
            v140.warnAboutUpdateOnNotYetMountedFiberInDEV(v189);
        end;
        l_v189_0 = l_return__0;
        l_return__0 = l_return__0.return_;
    end;
    if l_v189_0.tag == v43.HostRoot then
        return l_v189_0.stateNode;
    else
        return nil;
    end;
end;
v101 = function(v194, v195) --[[ Line: 758 ]]
    -- upvalues: l_markStarvedLanesAsExpired_0 (copy), v143 (ref), l_NoLanes_0 (ref), v8 (copy), l_getNextLanes_0 (copy), l_returnNextLanesPriority_0 (copy), l_cancelCallback_0 (copy), l_scheduleSyncCallback_0 (copy), v140 (copy), l_scheduleCallback_0 (copy), l_ImmediatePriority_0 (copy), l_lanePriorityToSchedulerPriority_0 (copy)
    local l_callbackNode_0 = v194.callbackNode;
    l_markStarvedLanesAsExpired_0(v194, v195);
    local v197 = nil;
    v197 = if v194 == v143 then l_NoLanes_0 else v8.NoLanes;
    local v198 = l_getNextLanes_0(v194, v197);
    local v199 = l_returnNextLanesPriority_0();
    if v198 == v8.NoLanes then
        if l_callbackNode_0 ~= nil then
            l_cancelCallback_0(l_callbackNode_0);
            v194.callbackNode = nil;
            v194.callbackPriority = v8.NoLanePriority;
        end;
        return;
    else
        if l_callbackNode_0 ~= nil then
            if v194.callbackPriority == v199 then
                return;
            else
                l_cancelCallback_0(l_callbackNode_0);
            end;
        end;
        local v200 = nil;
        if v199 == v8.SyncLanePriority then
            v200 = l_scheduleSyncCallback_0(function() --[[ Line: 807 ]]
                -- upvalues: v140 (ref), v194 (copy)
                return v140.performSyncWorkOnRoot(v194);
            end);
        elseif v199 == v8.SyncBatchedLanePriority then
            v200 = l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 814 ]]
                -- upvalues: v140 (ref), v194 (copy)
                return v140.performSyncWorkOnRoot(v194);
            end);
        else
            local v201 = l_lanePriorityToSchedulerPriority_0(v199);
            v200 = l_scheduleCallback_0(v201, function() --[[ Line: 824 ]]
                -- upvalues: v140 (ref), v194 (copy)
                return v140.performConcurrentWorkOnRoot(v194);
            end);
        end;
        v194.callbackPriority = v199;
        v194.callbackNode = v200;
        return;
    end;
end;
v140.performConcurrentWorkOnRoot = function(v202) --[[ Line: 837 ]]
    -- upvalues: l_l_NoTimestamp_0_0 (ref), l_NoTimestamp_0 (copy), l_NoLanes_5 (ref), v8 (copy), l_NoLanes_6 (ref), l_invariant_0 (copy), v142 (ref), v5 (copy), l_getNextLanes_0 (copy), v143 (ref), l_NoLanes_0 (ref), v140 (copy), l_includesSomeLane_0 (copy), l_NoLanes_1 (ref), l_NoLanes_2 (ref), v141 (copy), v40 (copy), l_getLanesToRetrySynchronouslyOnError_0 (copy), v148 (ref), v101 (ref), l_now_0 (copy)
    l_l_NoTimestamp_0_0 = l_NoTimestamp_0;
    l_NoLanes_5 = v8.NoLanes;
    l_NoLanes_6 = v8.NoLanes;
    l_invariant_0(bit32.band(v142, 48) == 0, "Should not already be working.");
    local l_callbackNode_1 = v202.callbackNode;
    if v5.flushPassiveEffects() and v202.callbackNode ~= l_callbackNode_1 then
        return nil;
    else
        local v204 = l_getNextLanes_0(v202, if v202 == v143 then l_NoLanes_0 else v8.NoLanes);
        if v204 == v8.NoLanes then
            return nil;
        else
            local v205 = v140.renderRootConcurrent(v202, v204);
            if l_includesSomeLane_0(l_NoLanes_1, l_NoLanes_2) then
                v140.prepareFreshStack(v202, v8.NoLanes);
            elseif v205 ~= v141.Incomplete then
                if v205 == v141.Errored then
                    v142 = bit32.bor(v142, 64);
                    if v202.hydrate then
                        v202.hydrate = false;
                        v40.clearContainer(v202.containerInfo);
                    end;
                    v204 = l_getLanesToRetrySynchronouslyOnError_0(v202);
                    if v204 ~= v8.NoLanes then
                        v205 = v140.renderRootSync(v202, v204);
                    end;
                end;
                if v205 == v141.FatalErrored then
                    local l_v148_0 = v148;
                    v140.prepareFreshStack(v202, v8.NoLanes);
                    v140.markRootSuspended(v202, v204);
                    v101(v202, l_now_0());
                    error(l_v148_0);
                end;
                v202.finishedWork = v202.current.alternate;
                v202.finishedLanes = v204;
                v140.finishConcurrentRender(v202, v205, v204);
            end;
            v101(v202, l_now_0());
            if v202.callbackNode == l_callbackNode_1 then
                return function() --[[ Line: 933 ]]
                    -- upvalues: v140 (ref), v202 (copy)
                    return v140.performConcurrentWorkOnRoot(v202);
                end;
            else
                return nil;
            end;
        end;
    end;
end;
local v207 = 0;
local v208 = false;
shouldForceFlushFallbacksInDEV = function() --[[ Line: 946 ]] --[[ Name: shouldForceFlushFallbacksInDEV ]]
    -- upvalues: l___DEV___0 (copy), v207 (ref)
    return l___DEV___0 and v207 > 0;
end;
v140.finishConcurrentRender = function(v209, v210, v211) --[[ Line: 951 ]]
    -- upvalues: v141 (copy), l_invariant_0 (copy), v140 (copy), l_includesOnlyRetries_0 (copy), v155 (ref), l_now_0 (copy), l_getNextLanes_0 (copy), v8 (copy), l_isSubsetOfLanes_0 (copy), v5 (copy), l_markRootPinged_0 (copy), v40 (copy), l_includesOnlyTransitions_0 (copy), l_getMostRecentEventTime_0 (copy)
    if v210 == v141.Incomplete or v210 == v141.FatalErrored then
        l_invariant_0(false, "Root did not complete. This is a bug in React.");
        return;
    elseif v210 == v141.Errored then
        v140.commitRoot(v209);
        return;
    elseif v210 == v141.Suspended then
        v140.markRootSuspended(v209, v211);
        if l_includesOnlyRetries_0(v211) and not shouldForceFlushFallbacksInDEV() then
            local v212 = v155 + 500 - l_now_0();
            if v212 > 10 then
                if l_getNextLanes_0(v209, v8.NoLanes) ~= v8.NoLanes then
                    return;
                else
                    local l_suspendedLanes_0 = v209.suspendedLanes;
                    if not l_isSubsetOfLanes_0(l_suspendedLanes_0, v211) then
                        local v214 = v5.requestEventTime();
                        l_markRootPinged_0(v209, l_suspendedLanes_0, v214);
                        return;
                    else
                        v209.timeoutHandle = v40.scheduleTimeout(function() --[[ Line: 999 ]]
                            -- upvalues: v140 (ref), v209 (copy)
                            return v140.commitRoot(v209);
                        end, v212);
                        return;
                    end;
                end;
            end;
        end;
        v140.commitRoot(v209);
        return;
    elseif v210 == v141.SuspendedWithDelay then
        v140.markRootSuspended(v209, v211);
        if l_includesOnlyTransitions_0(v211) then
            return;
        else
            if not shouldForceFlushFallbacksInDEV() then
                local v215 = l_getMostRecentEventTime_0(v209, v211);
                local v216 = l_now_0() - v215;
                local v217 = jnd(v216) - v216;
                if v217 > 10 then
                    v209.timeoutHandle = v40.scheduleTimeout(function() --[[ Line: 1035 ]]
                        -- upvalues: v140 (ref), v209 (copy)
                        return v140.commitRoot(v209);
                    end, v217);
                    return;
                end;
            end;
            v140.commitRoot(v209);
            return;
        end;
    elseif v210 == v141.Completed then
        v140.commitRoot(v209);
        return;
    else
        l_invariant_0(false, "Unknown root exit status.");
        return;
    end;
end;
v140.markRootSuspended = function(v218, v219) --[[ Line: 1051 ]]
    -- upvalues: l_removeLanes_0 (copy), l_NoLanes_3 (ref), l_NoLanes_2 (ref), l_markRootSuspended_0 (copy)
    v219 = l_removeLanes_0(v219, l_NoLanes_3);
    v219 = l_removeLanes_0(v219, l_NoLanes_2);
    l_markRootSuspended_0(v218, v219);
end;
v140.performSyncWorkOnRoot = function(v220) --[[ Line: 1063 ]]
    -- upvalues: l_invariant_0 (copy), v142 (ref), v5 (copy), v143 (ref), l_includesSomeLane_0 (copy), l_NoLanes_0 (ref), v140 (copy), l_NoLanes_1 (ref), l_NoLanes_2 (ref), l_getNextLanes_0 (copy), v8 (copy), l_LegacyRoot_0 (copy), v141 (copy), v40 (copy), l_getLanesToRetrySynchronouslyOnError_0 (copy), v148 (ref), v101 (ref), l_now_0 (copy)
    l_invariant_0(bit32.band(v142, 48) == 0, "Should not already be working.");
    v5.flushPassiveEffects();
    local v221 = nil;
    local v222 = nil;
    if v220 == v143 and l_includesSomeLane_0(v220.expiredLanes, l_NoLanes_0) then
        v221 = l_NoLanes_0;
        v222 = v140.renderRootSync(v220, v221);
        if l_includesSomeLane_0(l_NoLanes_1, l_NoLanes_2) then
            v221 = l_getNextLanes_0(v220, v221);
            v222 = v140.renderRootSync(v220, v221);
        end;
    else
        v221 = l_getNextLanes_0(v220, v8.NoLanes);
        v222 = v140.renderRootSync(v220, v221);
    end;
    if v220.tag ~= l_LegacyRoot_0 and v222 == v141.Errored then
        v142 = bit32.bor(v142, 64);
        if v220.hydrate then
            v220.hydrate = false;
            v40.clearContainer(v220.containerInfo);
        end;
        v221 = l_getLanesToRetrySynchronouslyOnError_0(v220);
        if v221 ~= v8.NoLanes then
            v222 = v140.renderRootSync(v220, v221);
        end;
    end;
    if v222 == v141.FatalErrored then
        local l_v148_1 = v148;
        v140.prepareFreshStack(v220, v8.NoLanes);
        v140.markRootSuspended(v220, v221);
        v101(v220, l_now_0());
        error(l_v148_1);
    end;
    v220.finishedWork = v220.current.alternate;
    v220.finishedLanes = v221;
    v140.commitRoot(v220);
    v101(v220, l_now_0());
    return nil;
end;
v5.flushRoot = function(v224, v225) --[[ Line: 1145 ]]
    -- upvalues: l_markRootExpired_0 (copy), v101 (ref), l_now_0 (copy), v142 (ref), v156 (ref), l_flushSyncCallbackQueue_0 (copy)
    l_markRootExpired_0(v224, v225);
    v101(v224, l_now_0());
    if bit32.band(v142, 48) == 0 then
        v156 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
end;
v5.getExecutionContext = function() --[[ Line: 1154 ]]
    -- upvalues: v142 (ref)
    return v142;
end;
v5.flushDiscreteUpdates = function() --[[ Line: 1158 ]]
    -- upvalues: v142 (ref), l___DEV___0 (copy), l_console_0 (copy), v140 (copy), v5 (copy)
    if bit32.band(v142, 49) ~= 0 then
        if l___DEV___0 and bit32.band(v142, 16) ~= 0 then
            l_console_0.error("unstable_flushDiscreteUpdates: Cannot flush updates when React is " .. "already rendering.");
        end;
        return;
    else
        v140.flushPendingDiscreteUpdates();
        v5.flushPassiveEffects();
        return;
    end;
end;
v5.deferredUpdates = function(v226) --[[ Line: 1186 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l___YOLO___0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v8 (copy), l_runWithPriority_0 (copy), l_describeError_0 (copy), l_NormalPriority_0 (copy)
    if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        local v227 = l_getCurrentUpdateLanePriority_0();
        local v228 = nil;
        local v229 = nil;
        if not l___YOLO___0 then
            l_setCurrentUpdateLanePriority_0(v8.DefaultLanePriority);
            local v230, v231 = xpcall(l_runWithPriority_0, l_describeError_0, l_NormalPriority_0, v226);
            v228 = v230;
            v229 = v231;
        else
            v228 = true;
            l_setCurrentUpdateLanePriority_0(v8.DefaultLanePriority);
            v229 = l_runWithPriority_0(l_NormalPriority_0, v226);
        end;
        l_setCurrentUpdateLanePriority_0(v227);
        if v228 then
            return v229;
        else
            error(v229);
            return;
        end;
    else
        return l_runWithPriority_0(l_NormalPriority_0, v226);
    end;
end;
v140.flushPendingDiscreteUpdates = function() --[[ Line: 1214 ]]
    -- upvalues: v166 (ref), l_markDiscreteUpdatesExpired_0 (copy), v101 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    if v166 ~= nil then
        local l_v166_0 = v166;
        v166 = nil;
        l_v166_0:forEach(function(v233) --[[ Line: 1220 ]]
            -- upvalues: l_markDiscreteUpdatesExpired_0 (ref), v101 (ref), l_now_0 (ref)
            l_markDiscreteUpdatesExpired_0(v233);
            v101(v233, l_now_0());
        end);
    end;
    l_flushSyncCallbackQueue_0();
end;
v5.batchedUpdates = function(v234, v235) --[[ Line: 1229 ]]
    -- upvalues: v142 (ref), l___YOLO___0 (copy), l_describeError_0 (copy), v156 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v142_0 = v142;
    v142 = bit32.bor(v142, 1);
    local v237 = nil;
    local v238 = nil;
    if not l___YOLO___0 then
        local v239, v240 = xpcall(v234, l_describeError_0, v235);
        v237 = v239;
        v238 = v240;
    else
        v237 = true;
        v238 = v234(v235);
    end;
    v142 = l_v142_0;
    if v142 == 0 then
        v156 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if v237 then
        return v238;
    else
        error(v238);
        return;
    end;
end;
v5.batchedEventUpdates = function(v241, v242) --[[ Line: 1257 ]]
    -- upvalues: v142 (ref), l___YOLO___0 (copy), l_describeError_0 (copy), v156 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v142_1 = v142;
    v142 = bit32.bor(v142, 2);
    local v244 = nil;
    local v245 = nil;
    if not l___YOLO___0 then
        local v246, v247 = xpcall(v241, l_describeError_0, v242);
        v244 = v246;
        v245 = v247;
    else
        v244 = true;
        v245 = v241(v242);
    end;
    v142 = l_v142_1;
    if v142 == 0 then
        v156 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if v244 then
        return v245;
    else
        error(v245);
        return;
    end;
end;
v5.discreteUpdates = function(v248, v249, v250, v251, v252) --[[ Line: 1286 ]]
    -- upvalues: v142 (ref), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v8 (copy), l_runWithPriority_0 (copy), l_describeError_0 (copy), l_UserBlockingPriority_0 (copy), v156 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v142_2 = v142;
    v142 = bit32.bor(v142, 4);
    if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        local v254 = l_getCurrentUpdateLanePriority_0();
        l_setCurrentUpdateLanePriority_0(v8.InputDiscreteLanePriority);
        local v255, v256 = xpcall(l_runWithPriority_0, l_describeError_0, l_UserBlockingPriority_0, function() --[[ Line: 1297 ]]
            -- upvalues: v248 (copy), v249 (copy), v250 (copy), v251 (copy), v252 (copy)
            return v248(v249, v250, v251, v252);
        end);
        l_setCurrentUpdateLanePriority_0(v254);
        v142 = l_v142_2;
        if v142 == 0 then
            v156 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if v255 then
            return v256;
        else
            error(v256);
            return;
        end;
    else
        local v257, v258 = xpcall(l_runWithPriority_0, l_describeError_0, l_UserBlockingPriority_0, function() --[[ Line: 1320 ]]
            -- upvalues: v248 (copy), v249 (copy), v250 (copy), v251 (copy), v252 (copy)
            return v248(v249, v250, v251, v252);
        end);
        v142 = l_v142_2;
        if v142 == 0 then
            v156 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if v257 then
            return v258;
        else
            error(v258);
            return;
        end;
    end;
end;
v5.unbatchedUpdates = function(v259, v260) --[[ Line: 1341 ]]
    -- upvalues: v142 (ref), l___YOLO___0 (copy), l_describeError_0 (copy), v156 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v142_3 = v142;
    v142 = bit32.band(v142, 4294967294);
    v142 = bit32.bor(v142, 8);
    local v262 = nil;
    local v263 = nil;
    if not l___YOLO___0 then
        local v264, v265 = xpcall(v259, l_describeError_0, v260);
        v262 = v264;
        v263 = v265;
    else
        v262 = true;
        v263 = v259(v260);
    end;
    v142 = l_v142_3;
    if v142 == 0 then
        v156 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if v262 then
        return v263;
    else
        error(v263);
        return;
    end;
end;
v5.flushSync = function(v266, v267) --[[ Line: 1369 ]]
    -- upvalues: v142 (ref), l___DEV___0 (copy), l_console_0 (copy), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v8 (copy), l___YOLO___0 (copy), l_runWithPriority_0 (copy), l_describeError_0 (copy), l_ImmediatePriority_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v142_4 = v142;
    if bit32.band(l_v142_4, 48) ~= 0 then
        if l___DEV___0 then
            l_console_0.error("flushSync was called from inside a lifecycle method. React cannot " .. "flush when React is already rendering. Consider moving this call to " .. "a scheduler task or micro task.");
        end;
        return v266(v267);
    else
        v142 = bit32.bor(v142, 1);
        if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
            local v269 = l_getCurrentUpdateLanePriority_0();
            l_setCurrentUpdateLanePriority_0(v8.SyncLanePriority);
            local v270 = nil;
            local v271 = nil;
            if not l___YOLO___0 then
                if v266 then
                    local v272, v273 = xpcall(l_runWithPriority_0, l_describeError_0, l_ImmediatePriority_0, function() --[[ Line: 1395 ]]
                        -- upvalues: v266 (copy), v267 (copy)
                        return v266(v267);
                    end);
                    v270 = v272;
                    v271 = v273;
                else
                    v270 = true;
                    v271 = nil;
                end;
            else
                v270 = true;
                l_setCurrentUpdateLanePriority_0(v8.SyncLanePriority);
                v271 = if v266 then l_runWithPriority_0(l_ImmediatePriority_0, function() --[[ Line: 1408 ]]
                    -- upvalues: v266 (copy), v267 (copy)
                    return v266(v267);
                end) else nil;
            end;
            l_setCurrentUpdateLanePriority_0(v269);
            v142 = l_v142_4;
            l_flushSyncCallbackQueue_0();
            if not v270 then
                error(v271);
            end;
            return v271;
        else
            local v274 = nil;
            local v275 = nil;
            if not l___YOLO___0 then
                if v266 then
                    local v276, v277 = xpcall(l_runWithPriority_0, l_describeError_0, l_ImmediatePriority_0, function() --[[ Line: 1437 ]]
                        -- upvalues: v266 (copy), v267 (copy)
                        return v266(v267);
                    end);
                    v274 = v276;
                    v275 = v277;
                else
                    v274 = true;
                    v275 = nil;
                end;
            else
                v274 = true;
                v275 = if v266 then l_runWithPriority_0(l_ImmediatePriority_0, function() --[[ Line: 1449 ]]
                    -- upvalues: v266 (copy), v267 (copy)
                    return v266(v267);
                end) else nil;
            end;
            v142 = l_v142_4;
            l_flushSyncCallbackQueue_0();
            if not v274 then
                error(v275);
            end;
            return v275;
        end;
    end;
end;
v5.flushControlled = function(v278) --[[ Line: 1470 ]]
    -- upvalues: v142 (ref), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v8 (copy), l_runWithPriority_0 (copy), l_describeError_0 (copy), l_ImmediatePriority_0 (copy), v156 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v142_5 = v142;
    v142 = bit32.bor(v142, 1);
    if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        local v280 = l_getCurrentUpdateLanePriority_0();
        l_setCurrentUpdateLanePriority_0(v8.SyncLanePriority);
        local v281, v282 = xpcall(l_runWithPriority_0, l_describeError_0, l_ImmediatePriority_0, v278);
        l_setCurrentUpdateLanePriority_0(v280);
        v142 = l_v142_5;
        if v142 == 0 then
            v156 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if not v281 then
            error(v282);
            return;
        end;
    else
        local v283, v284 = xpcall(l_runWithPriority_0, l_describeError_0, l_ImmediatePriority_0, v278);
        v142 = l_v142_5;
        if v142 == 0 then
            v156 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if not v283 then
            error(v284);
        end;
    end;
end;
v5.pushRenderLanes = function(v285, v286) --[[ Line: 1508 ]]
    -- upvalues: l_push_0 (copy), v146 (copy), v5 (copy), l_mergeLanes_0 (copy), l_NoLanes_1 (ref)
    l_push_0(v146, v5.subtreeRenderLanes, v285);
    v5.subtreeRenderLanes = l_mergeLanes_0(v5.subtreeRenderLanes, v286);
    l_NoLanes_1 = l_mergeLanes_0(l_NoLanes_1, v286);
end;
v5.popRenderLanes = function(v287) --[[ Line: 1517 ]]
    -- upvalues: v5 (copy), v146 (copy), l_pop_0 (copy)
    v5.subtreeRenderLanes = v146.current;
    l_pop_0(v146, v287);
end;
v140.prepareFreshStack = function(v288, v289) --[[ Line: 1522 ]]
    -- upvalues: v8 (copy), v40 (copy), v144 (ref), l_unwindInterruptedWork_0 (copy), v143 (ref), v41 (copy), l_NoLanes_0 (ref), v5 (copy), l_NoLanes_1 (ref), l_Incomplete_0 (ref), v141 (copy), v148 (ref), l_workInProgressRootSkippedLanes_0 (copy), l_NoLanes_2 (ref), l_NoLanes_3 (ref), l_ReactFeatureFlags_0 (copy), v170 (ref), l___DEV___0 (copy), v122 (copy)
    v288.finishedWork = nil;
    v288.finishedLanes = v8.NoLanes;
    local l_timeoutHandle_0 = v288.timeoutHandle;
    if l_timeoutHandle_0 ~= v40.noTimeout then
        v288.timeoutHandle = v40.noTimeout;
        v40.cancelTimeout(l_timeoutHandle_0);
    end;
    if v144 ~= nil then
        local l_return__1 = v144.return_;
        while l_return__1 ~= nil do
            l_unwindInterruptedWork_0(l_return__1);
            l_return__1 = l_return__1.return_;
        end;
    end;
    v143 = v288;
    v144 = v41.createWorkInProgress(v288.current, nil);
    l_NoLanes_0 = v289;
    v5.subtreeRenderLanes = v289;
    l_NoLanes_1 = v289;
    l_Incomplete_0 = v141.Incomplete;
    v148 = nil;
    l_workInProgressRootSkippedLanes_0(v8.NoLanes);
    l_NoLanes_2 = v8.NoLanes;
    l_NoLanes_3 = v8.NoLanes;
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        v170 = nil;
    end;
    if l___DEV___0 then
        v122.discardPendingWarnings();
    end;
end;
v140.handleError = function(v292, v293) --[[ Line: 1562 ]]
    -- upvalues: v144 (ref), l_resetContextDependencies_0 (copy), v102 (copy), v111 (ref), l_resetCurrentFiber_0 (copy), l_ReactCurrentOwner_0 (copy), l_Incomplete_0 (ref), v141 (copy), v148 (ref), l_ReactFeatureFlags_0 (copy), v42 (copy), v120 (copy), l_throwException_0 (copy), l_NoLanes_0 (ref), v5 (copy), v140 (copy)
    while true do
        local l_v144_0 = v144;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 1566 ]]
            -- upvalues: l_resetContextDependencies_0 (ref), v102 (ref), v111 (ref), l_resetCurrentFiber_0 (ref), l_ReactCurrentOwner_0 (ref), l_v144_0 (ref), l_Incomplete_0 (ref), v141 (ref), v148 (ref), v293 (ref), v144 (ref), l_ReactFeatureFlags_0 (ref), v42 (ref), v120 (ref), l_throwException_0 (ref), v292 (copy), l_NoLanes_0 (ref), v5 (ref), v140 (ref)
            l_resetContextDependencies_0();
            if not v102.resetHooksAfterThrowRef then
                v111 = require(script.Parent["ReactFiberHooks.new"]);
                v102.resetHooksAfterThrowRef = v111.resetHooksAfterThrow;
                v102.ContextOnlyDispatcherRef = v111.ContextOnlyDispatcher;
                v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v111.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
            end;
            local _ = v102.resetHooksAfterThrowRef();
            l_resetCurrentFiber_0();
            l_ReactCurrentOwner_0.current = nil;
            if l_v144_0 == nil or l_v144_0.return_ == nil then
                l_Incomplete_0 = v141.FatalErrored;
                v148 = v293;
                v144 = nil;
                return;
            else
                if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(l_v144_0.mode, v42.ProfileMode) ~= 0 then
                    v120.stopProfilerTimerIfRunningAndRecordDelta(l_v144_0, true);
                end;
                l_throwException_0(v292, l_v144_0.return_, l_v144_0, v293, l_NoLanes_0, v5.onUncaughtError, v5.renderDidError);
                v140.completeUnitOfWork(l_v144_0);
                return;
            end;
        end);
        if not l_status_0 then
            v293 = l_result_0;
            if v144 == l_v144_0 and l_v144_0 ~= nil then
                l_v144_0 = l_v144_0.return_;
                v144 = l_v144_0;
            else
                l_v144_0 = v144;
            end;
            --[[ close >= 2 ]]
        else
            break;
        end;
    end;
end;
v140.pushDispatcher = function() --[[ Line: 1631 ]]
    -- upvalues: l_ReactCurrentDispatcher_0 (copy), v102 (copy), v111 (ref)
    local l_current_1 = l_ReactCurrentDispatcher_0.current;
    local l_l_ReactCurrentDispatcher_0_0 = l_ReactCurrentDispatcher_0;
    if not v102.ContextOnlyDispatcherRef then
        v111 = require(script.Parent["ReactFiberHooks.new"]);
        v102.resetHooksAfterThrowRef = v111.resetHooksAfterThrow;
        v102.ContextOnlyDispatcherRef = v111.ContextOnlyDispatcher;
        v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v111.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    l_l_ReactCurrentDispatcher_0_0.current = v102.ContextOnlyDispatcherRef;
    if l_current_1 == nil then
        if not v102.ContextOnlyDispatcherRef then
            v111 = require(script.Parent["ReactFiberHooks.new"]);
            v102.resetHooksAfterThrowRef = v111.resetHooksAfterThrow;
            v102.ContextOnlyDispatcherRef = v111.ContextOnlyDispatcher;
            v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v111.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
        end;
        return v102.ContextOnlyDispatcherRef;
    else
        return l_current_1;
    end;
end;
v140.popDispatcher = function(v300) --[[ Line: 1648 ]]
    -- upvalues: l_ReactCurrentDispatcher_0 (copy)
    l_ReactCurrentDispatcher_0.current = v300;
end;
v140.pushInteractions = function(v301) --[[ Line: 1652 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___interactionsRef_0 (copy)
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        local l_current_2 = l___interactionsRef_0.current;
        l___interactionsRef_0.current = v301.memoizedInteractions;
        return l_current_2;
    else
        return nil;
    end;
end;
v140.popInteractions = function(v303) --[[ Line: 1661 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___interactionsRef_0 (copy)
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        l___interactionsRef_0.current = v303;
    end;
end;
v5.markCommitTimeOfFallback = function() --[[ Line: 1667 ]]
    -- upvalues: v155 (ref), l_now_0 (copy)
    v155 = l_now_0();
end;
v5.markSkippedUpdateLanes = function(v304) --[[ Line: 1671 ]]
    -- upvalues: v150 (copy)
    v150.markSkippedUpdateLanes(v304);
end;
v5.renderDidSuspend = function() --[[ Line: 1675 ]]
    -- upvalues: l_Incomplete_0 (ref), v141 (copy)
    if l_Incomplete_0 == v141.Incomplete then
        l_Incomplete_0 = v141.Suspended;
    end;
end;
v5.renderDidSuspendDelayIfPossible = function() --[[ Line: 1681 ]]
    -- upvalues: l_Incomplete_0 (ref), v141 (copy), v143 (ref), l_includesNonIdleWork_0 (copy), l_workInProgressRootSkippedLanes_0 (copy), l_NoLanes_2 (ref), v140 (copy), l_NoLanes_0 (ref)
    if l_Incomplete_0 == v141.Incomplete or l_Incomplete_0 == v141.Suspended then
        l_Incomplete_0 = v141.SuspendedWithDelay;
    end;
    if v143 ~= nil and (l_includesNonIdleWork_0(l_workInProgressRootSkippedLanes_0()) or l_includesNonIdleWork_0(l_NoLanes_2)) then
        v140.markRootSuspended(v143, l_NoLanes_0);
    end;
end;
v5.renderDidError = function() --[[ Line: 1707 ]]
    -- upvalues: l_Incomplete_0 (ref), v141 (copy)
    if l_Incomplete_0 ~= v141.Completed then
        l_Incomplete_0 = v141.Errored;
    end;
end;
v5.renderHasNotSuspendedYet = function() --[[ Line: 1715 ]]
    -- upvalues: l_Incomplete_0 (ref), v141 (copy)
    return l_Incomplete_0 == v141.Incomplete;
end;
v140.renderRootSync = function(v305, v306) --[[ Line: 1721 ]]
    -- upvalues: v142 (ref), v140 (copy), v143 (ref), l_NoLanes_0 (ref), l___DEV___0 (copy), l_enableDebugTracing_0 (copy), v35 (copy), l_enableSchedulingProfiler_0 (copy), v36 (copy), l___YOLO___0 (copy), l_describeError_0 (copy), l_resetContextDependencies_0 (copy), l_ReactFeatureFlags_0 (copy), v144 (ref), l_invariant_0 (copy), v8 (copy), l_Incomplete_0 (ref)
    local l_v142_6 = v142;
    v142 = bit32.bor(v142, 16);
    local v308 = v140.pushDispatcher();
    if v143 ~= v305 or l_NoLanes_0 ~= v306 then
        v140.prepareFreshStack(v305, v306);
        v140.startWorkOnPendingInteractions(v305, v306);
    end;
    local v309 = v140.pushInteractions(v305);
    if l___DEV___0 and l_enableDebugTracing_0 then
        v35.logRenderStarted(v306);
    end;
    if l_enableSchedulingProfiler_0 then
        v36.markRenderStarted(v306);
    end;
    while true do
        local v310 = nil;
        local v311 = nil;
        if not l___YOLO___0 then
            local v312, v313 = xpcall(v140.workLoopSync, l_describeError_0);
            v310 = v312;
            v311 = v313;
        else
            v310 = true;
            v140.workLoopSync();
        end;
        if not v310 then
            v140.handleError(v305, v311);
        else
            break;
        end;
    end;
    l_resetContextDependencies_0();
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        v140.popInteractions(v309);
    end;
    v142 = l_v142_6;
    v140.popDispatcher(v308);
    if v144 ~= nil then
        l_invariant_0(false, "Cannot commit an incomplete root. This error is likely caused by a " .. "bug in React. Please file an issue.");
    end;
    if l___DEV___0 and l_enableDebugTracing_0 then
        v35.logRenderStopped();
    end;
    if l_enableSchedulingProfiler_0 then
        v36.markRenderStopped();
    end;
    v143 = nil;
    l_NoLanes_0 = v8.NoLanes;
    return l_Incomplete_0;
end;
v140.workLoopSync = function() --[[ Line: 1797 ]]
    -- upvalues: v144 (ref), v140 (copy)
    while v144 ~= nil do
        v140.performUnitOfWork(v144);
    end;
end;
v140.renderRootConcurrent = function(v314, v315) --[[ Line: 1804 ]]
    -- upvalues: v142 (ref), v140 (copy), v143 (ref), l_NoLanes_0 (ref), v156 (ref), l_now_0 (copy), l___DEV___0 (copy), l_enableDebugTracing_0 (copy), v35 (copy), l_enableSchedulingProfiler_0 (copy), v36 (copy), l___YOLO___0 (copy), l_describeError_0 (copy), l_resetContextDependencies_0 (copy), l_ReactFeatureFlags_0 (copy), v144 (ref), v141 (copy), v8 (copy), l_Incomplete_0 (ref)
    local l_v142_7 = v142;
    v142 = bit32.bor(v142, 16);
    local v317 = v140.pushDispatcher();
    if v143 ~= v314 or l_NoLanes_0 ~= v315 then
        v156 = l_now_0() + 500;
        v140.prepareFreshStack(v314, v315);
        v140.startWorkOnPendingInteractions(v314, v315);
    end;
    local v318 = v140.pushInteractions(v314);
    if l___DEV___0 and l_enableDebugTracing_0 then
        v35.logRenderStarted(v315);
    end;
    if l_enableSchedulingProfiler_0 then
        v36.markRenderStarted(v315);
    end;
    while true do
        local v319 = nil;
        local v320 = nil;
        if not l___YOLO___0 then
            local v321, v322 = xpcall(v140.workLoopConcurrent, l_describeError_0);
            v319 = v321;
            v320 = v322;
            if v319 then
                v320 = "break";
            end;
        else
            v319 = true;
            v320 = "break";
            v140.workLoopConcurrent();
        end;
        if v320 ~= "break" then
            if not v319 then
                v140.handleError(v314, v320);
            end;
        else
            break;
        end;
    end;
    l_resetContextDependencies_0();
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        v140.popInteractions(v318);
    end;
    v140.popDispatcher(v317);
    v142 = l_v142_7;
    if l___DEV___0 and l_enableDebugTracing_0 then
        v35.logRenderStopped();
    end;
    if v144 ~= nil then
        if l_enableSchedulingProfiler_0 then
            v36.markRenderYielded();
        end;
        return v141.Incomplete;
    else
        if l_enableSchedulingProfiler_0 then
            v36.markRenderStopped();
        end;
        v143 = nil;
        l_NoLanes_0 = v8.NoLanes;
        return l_Incomplete_0;
    end;
end;
v140.workLoopConcurrent = function() --[[ Line: 1888 ]]
    -- upvalues: v144 (ref), l_shouldYield_0 (copy), v140 (copy)
    while v144 ~= nil and not l_shouldYield_0() do
        v140.performUnitOfWork(v144);
    end;
end;
v140.performUnitOfWork = function(v323) --[[ Line: 1895 ]]
    -- upvalues: l_setCurrentFiber_0 (copy), l_ReactFeatureFlags_0 (copy), v42 (copy), v120 (copy), v140 (copy), v5 (copy), l_resetCurrentFiber_0 (copy), v144 (ref), l_ReactCurrentOwner_0 (copy)
    local l_alternate_1 = v323.alternate;
    l_setCurrentFiber_0(v323);
    local v325 = nil;
    if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(v323.mode, v42.ProfileMode) ~= v42.NoMode then
        v120.startProfilerTimer(v323);
        v325 = v140.beginWork(l_alternate_1, v323, v5.subtreeRenderLanes);
        v120.stopProfilerTimerIfRunningAndRecordDelta(v323, true);
    else
        v325 = v140.beginWork(l_alternate_1, v323, v5.subtreeRenderLanes);
    end;
    l_resetCurrentFiber_0();
    v323.memoizedProps = v323.pendingProps;
    if v325 == nil then
        v140.completeUnitOfWork(v323);
    else
        v144 = v325;
    end;
    l_ReactCurrentOwner_0.current = nil;
end;
v140.completeUnitOfWork = function(v326) --[[ Line: 1923 ]]
    -- upvalues: v45 (copy), l_setCurrentFiber_0 (copy), l_ReactFeatureFlags_0 (copy), v42 (copy), v5 (copy), v102 (copy), v120 (copy), l_resetCurrentFiber_0 (copy), v144 (ref), l_unwindWork_0 (copy), l_Incomplete_0 (ref), v141 (copy)
    local l_v326_0 = v326;
    while true do
        local l_alternate_2 = l_v326_0.alternate;
        local l_return__2 = l_v326_0.return_;
        if bit32.band(l_v326_0.flags, v45.Incomplete) == v45.NoFlags then
            l_setCurrentFiber_0(l_v326_0);
            local v330 = nil;
            if not l_ReactFeatureFlags_0.enableProfilerTimer or bit32.band(l_v326_0.mode, v42.ProfileMode) == v42.NoMode then
                local l_l_v326_0_0 = l_v326_0;
                local l_subtreeRenderLanes_0 = v5.subtreeRenderLanes;
                if not v102.completeWorkRef then
                    v102.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
                end;
                v330 = v102.completeWorkRef(l_alternate_2, l_l_v326_0_0, l_subtreeRenderLanes_0);
            else
                v120.startProfilerTimer(l_v326_0);
                local l_l_v326_0_1 = l_v326_0;
                local l_subtreeRenderLanes_1 = v5.subtreeRenderLanes;
                if not v102.completeWorkRef then
                    v102.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
                end;
                v330 = v102.completeWorkRef(l_alternate_2, l_l_v326_0_1, l_subtreeRenderLanes_1);
                v120.stopProfilerTimerIfRunningAndRecordDelta(l_v326_0, false);
            end;
            l_resetCurrentFiber_0();
            if v330 ~= nil then
                v144 = v330;
                return;
            end;
        else
            local v335 = l_unwindWork_0(l_v326_0, v5.subtreeRenderLanes);
            if v335 ~= nil then
                v335.flags = bit32.band(v335.flags, v45.HostEffectMask);
                v144 = v335;
                return;
            else
                if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(l_v326_0.mode, v42.ProfileMode) ~= v42.NoMode then
                    v120.stopProfilerTimerIfRunningAndRecordDelta(l_v326_0, false);
                    local v336 = l_v326_0.actualDuration or 0;
                    local l_child_0 = l_v326_0.child;
                    while l_child_0 ~= nil do
                        v336 = v336 + (l_child_0.actualDuration or 0);
                        l_child_0 = l_child_0.sibling;
                    end;
                    l_v326_0.actualDuration = v336;
                end;
                if l_return__2 ~= nil then
                    l_return__2.flags = bit32.bor(l_return__2.flags, v45.Incomplete);
                    l_return__2.subtreeFlags = v45.NoFlags;
                    l_return__2.deletions = nil;
                end;
            end;
        end;
        local l_sibling_0 = l_v326_0.sibling;
        if l_sibling_0 ~= nil then
            v144 = l_sibling_0;
            return;
        else
            l_v326_0 = l_return__2;
            v144 = l_v326_0;
            if l_v326_0 == nil then
                if l_Incomplete_0 == v141.Incomplete then
                    l_Incomplete_0 = v141.Completed;
                end;
                return;
            end;
        end;
    end;
end;
v140.commitRoot = function(v339) --[[ Line: 2019 ]]
    -- upvalues: l_getCurrentPriorityLevel_0 (copy), l_runWithPriority_0 (copy), l_ImmediatePriority_0 (copy), v140 (copy)
    local v340 = l_getCurrentPriorityLevel_0();
    l_runWithPriority_0(l_ImmediatePriority_0, function() --[[ Line: 2023 ]]
        -- upvalues: v140 (ref), v339 (copy), v340 (copy)
        return v140.commitRootImpl(v339, v340);
    end);
    return nil;
end;
v140.commitRootImpl = function(v341, v342) --[[ Line: 2031 ]]
    -- upvalues: v5 (copy), v163 (ref), l_invariant_0 (copy), v142 (ref), l___DEV___0 (copy), l_enableDebugTracing_0 (copy), v35 (copy), l_enableSchedulingProfiler_0 (copy), v36 (copy), v8 (copy), l_mergeLanes_0 (copy), l_markRootFinished_0 (copy), v166 (ref), l_hasDiscreteLanes_0 (copy), v143 (ref), v144 (ref), l_NoLanes_0 (ref), v45 (copy), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v140 (copy), l_ReactCurrentOwner_0 (copy), v174 (ref), v40 (copy), v175 (ref), v120 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_recursivelyCommitLayoutEffects_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v138 (ref), l_resetCurrentFiber_0 (copy), l___YOLO___0 (copy), l_describeError_0 (copy), v162 (ref), l_scheduleCallback_0 (copy), l_NormalPriority_0 (copy), l_requestPaint_0 (copy), l_NoLanes_4 (ref), l_l_NoPriority_0_0 (ref), v170 (ref), v161 (ref), l_enableDoubleInvokingEffects_0 (copy), l_SyncLane_0 (copy), v168 (ref), v167 (ref), l_onCommitRoot_0 (copy), l_onCommitRoot_1 (copy), v101 (ref), l_now_0 (copy), v159 (ref), v160 (ref), l_flushSyncCallbackQueue_0 (copy)
    repeat
        v5.flushPassiveEffects();
    until v163 == nil;
    flushRenderPhaseStrictModeWarningsInDEV();
    l_invariant_0(bit32.band(v142, 48) == 0, "Should not already be working.");
    local l_finishedWork_0 = v341.finishedWork;
    local l_finishedLanes_0 = v341.finishedLanes;
    if l___DEV___0 and l_enableDebugTracing_0 then
        v35.logCommitStarted(l_finishedLanes_0);
    end;
    if l_enableSchedulingProfiler_0 then
        v36.markCommitStarted(l_finishedLanes_0);
    end;
    if l_finishedWork_0 == nil then
        if l___DEV___0 and l_enableDebugTracing_0 then
            v35.logCommitStopped();
        end;
        if l_enableSchedulingProfiler_0 then
            v36.markCommitStopped();
        end;
        return nil;
    else
        v341.finishedWork = nil;
        v341.finishedLanes = v8.NoLanes;
        l_invariant_0(l_finishedWork_0 ~= v341.current, "Cannot commit the same tree as before. This error is likely caused by " .. "a bug in React. Please file an issue.");
        v341.callbackNode = nil;
        local v345 = l_mergeLanes_0(l_finishedWork_0.lanes, l_finishedWork_0.childLanes);
        l_markRootFinished_0(v341, v345);
        if v166 ~= nil and not l_hasDiscreteLanes_0(v345) and v166:has(v341) then
            v166:delete(v341);
        end;
        if v341 == v143 then
            v143 = nil;
            v144 = nil;
            l_NoLanes_0 = v8.NoLanes;
        end;
        local v346 = bit32.band(l_finishedWork_0.subtreeFlags, (bit32.bor(v45.BeforeMutationMask, v45.MutationMask, v45.LayoutMask, v45.PassiveMask))) ~= v45.NoFlags;
        local v347 = bit32.band(l_finishedWork_0.flags, (bit32.bor(v45.BeforeMutationMask, v45.MutationMask, v45.LayoutMask, v45.PassiveMask))) ~= v45.NoFlags;
        if v346 or v347 then
            local v348 = nil;
            if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
                v348 = l_getCurrentUpdateLanePriority_0();
                l_setCurrentUpdateLanePriority_0(v8.SyncLanePriority);
            end;
            local l_v142_8 = v142;
            v142 = bit32.bor(v142, 32);
            local v350 = v140.pushInteractions(v341);
            l_ReactCurrentOwner_0.current = nil;
            v174 = v40.prepareForCommit(v341.containerInfo);
            v175 = false;
            v140.commitBeforeMutationEffects(l_finishedWork_0);
            v174 = nil;
            if l_ReactFeatureFlags_0.enableProfilerTimer then
                v120.recordCommitTime();
            end;
            v140.commitMutationEffects(l_finishedWork_0, v341, v342);
            if v175 then
                v40.afterActiveInstanceBlur();
            end;
            v40.resetAfterCommit(v341.containerInfo);
            v341.current = l_finishedWork_0;
            if l___DEV___0 and l_enableDebugTracing_0 then
                v35.logLayoutEffectsStarted(l_finishedLanes_0);
            end;
            if l_enableSchedulingProfiler_0 then
                v36.markLayoutEffectsStarted(l_finishedLanes_0);
            end;
            if l___DEV___0 then
                l_setCurrentFiber_0(l_finishedWork_0);
                l_invokeGuardedCallback_0(nil, l_recursivelyCommitLayoutEffects_0, nil, l_finishedWork_0, v341, v5.captureCommitPhaseError, v5.schedulePassiveEffectCallback);
                if l_hasCaughtError_0() then
                    local v351 = l_clearCaughtError_0();
                    v138(l_finishedWork_0, l_finishedWork_0, v351);
                end;
                l_resetCurrentFiber_0();
            else
                local v352 = nil;
                local v353 = nil;
                if not l___YOLO___0 then
                    local v354, v355 = xpcall(l_recursivelyCommitLayoutEffects_0, l_describeError_0, l_finishedWork_0, v341, v5.captureCommitPhaseError, v5.schedulePassiveEffectCallback);
                    v352 = v354;
                    v353 = v355;
                else
                    v352 = true;
                    l_recursivelyCommitLayoutEffects_0(l_finishedWork_0, v341, v5.captureCommitPhaseError, v5.schedulePassiveEffectCallback);
                end;
                if not v352 then
                    v138(l_finishedWork_0, l_finishedWork_0, v353);
                end;
            end;
            if l___DEV___0 and l_enableDebugTracing_0 then
                v35.logLayoutEffectsStopped();
            end;
            if l_enableSchedulingProfiler_0 then
                v36.markLayoutEffectsStopped();
            end;
            if (bit32.band(l_finishedWork_0.subtreeFlags, v45.PassiveMask) ~= v45.NoFlags or bit32.band(l_finishedWork_0.flags, v45.PassiveMask) ~= v45.NoFlags) and not v162 then
                v162 = true;
                l_scheduleCallback_0(l_NormalPriority_0, function() --[[ Line: 2248 ]]
                    -- upvalues: v5 (ref)
                    v5.flushPassiveEffects();
                    return nil;
                end);
            end;
            l_requestPaint_0();
            if l_ReactFeatureFlags_0.enableSchedulerTracing then
                v140.popInteractions(v350);
            end;
            v142 = l_v142_8;
            if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler and v348 ~= nil then
                l_setCurrentUpdateLanePriority_0(v348);
            end;
        else
            v341.current = l_finishedWork_0;
            if l_ReactFeatureFlags_0.enableProfilerTimer then
                v120.recordCommitTime();
            end;
        end;
        local l_v162_0 = v162;
        if v162 then
            v162 = false;
            v163 = v341;
            l_NoLanes_4 = l_finishedLanes_0;
            l_l_NoPriority_0_0 = v342;
        end;
        v345 = v341.pendingLanes;
        if v345 ~= v8.NoLanes then
            if l_ReactFeatureFlags_0.enableSchedulerTracing then
                if v170 ~= nil then
                    local l_v170_0 = v170;
                    v170 = nil;
                    for v358 = 1, #l_v170_0 do
                        scheduleInteractions(v341, l_v170_0[v358], v341.memoizedInteractions);
                    end;
                end;
                v140.schedulePendingInteractions(v341, v345);
            end;
        else
            v161 = nil;
        end;
        if l___DEV___0 and l_enableDoubleInvokingEffects_0 and not l_v162_0 then
            commitDoubleInvokeEffectsInDEV(v341.current, false);
        end;
        if l_ReactFeatureFlags_0.enableSchedulerTracing and not l_v162_0 then
            v140.finishPendingInteractions(v341, l_finishedLanes_0);
        end;
        if v345 == l_SyncLane_0 then
            if v341 == v168 then
                v167 = v167 + 1;
            else
                v167 = 0;
                v168 = v341;
            end;
        else
            v167 = 0;
        end;
        l_onCommitRoot_0(l_finishedWork_0.stateNode, v342);
        if l___DEV___0 then
            l_onCommitRoot_1();
        end;
        v101(v341, l_now_0());
        if v159 then
            v159 = false;
            local l_v160_0 = v160;
            v160 = nil;
            error(l_v160_0);
        end;
        if bit32.band(v142, 8) ~= 0 then
            if l___DEV___0 and l_enableDebugTracing_0 then
                v35.logCommitStopped();
            end;
            if l_enableSchedulingProfiler_0 then
                v36.markCommitStopped();
            end;
            return nil;
        else
            l_flushSyncCallbackQueue_0();
            if l___DEV___0 and l_enableDebugTracing_0 then
                v35.logCommitStopped();
            end;
            if l_enableSchedulingProfiler_0 then
                v36.markCommitStopped();
            end;
            return nil;
        end;
    end;
end;
v140.commitBeforeMutationEffects = function(v360) --[[ Line: 2396 ]]
    -- upvalues: v140 (copy), v45 (copy), l___DEV___0 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v5 (copy), l_resetCurrentFiber_0 (copy), l___YOLO___0 (copy), l_describeError_0 (copy)
    local l_v360_0 = v360;
    while l_v360_0 ~= nil do
        if l_v360_0.deletions ~= nil then
            v140.commitBeforeMutationEffectsDeletions(l_v360_0.deletions);
        end;
        if l_v360_0.child ~= nil and bit32.band(l_v360_0.subtreeFlags, v45.BeforeMutationMask) ~= v45.NoFlags then
            v140.commitBeforeMutationEffects(l_v360_0.child);
        end;
        if l___DEV___0 then
            l_setCurrentFiber_0(l_v360_0);
            l_invokeGuardedCallback_0(nil, v140.commitBeforeMutationEffectsImpl, nil, l_v360_0);
            if l_hasCaughtError_0() then
                local v362 = l_clearCaughtError_0();
                v5.captureCommitPhaseError(l_v360_0, l_v360_0.return_, v362);
            end;
            l_resetCurrentFiber_0();
        else
            local v363 = nil;
            local v364 = nil;
            if not l___YOLO___0 then
                local v365, v366 = xpcall(v140.commitBeforeMutationEffectsImpl, l_describeError_0, l_v360_0);
                v363 = v365;
                v364 = v366;
            else
                v363 = true;
                v140.commitBeforeMutationEffectsImpl(l_v360_0);
            end;
            if not v363 then
                v5.captureCommitPhaseError(l_v360_0, l_v360_0.return_, v364);
            end;
        end;
        l_v360_0 = l_v360_0.sibling;
    end;
end;
v140.commitBeforeMutationEffectsImpl = function(v367) --[[ Line: 2437 ]]
    -- upvalues: v175 (ref), v174 (ref), v43 (copy), v84 (copy), l_doesFiberContain_0 (copy), v40 (copy), v45 (copy), l_setCurrentFiber_0 (copy), l_commitBeforeMutationLifeCycles_0 (copy), l_resetCurrentFiber_0 (copy), v162 (ref), l_scheduleCallback_0 (copy), l_NormalPriority_0 (copy), v5 (copy)
    local l_alternate_3 = v367.alternate;
    local l_flags_0 = v367.flags;
    if not v175 and v174 ~= nil and v367.tag == v43.SuspenseComponent and v84.isSuspenseBoundaryBeingHidden(l_alternate_3, v367) and l_doesFiberContain_0(v367, v174) then
        v175 = true;
        v40.beforeActiveInstanceBlur();
    end;
    if bit32.band(l_flags_0, v45.Snapshot) ~= v45.NoFlags then
        l_setCurrentFiber_0(v367);
        l_commitBeforeMutationLifeCycles_0(l_alternate_3, v367);
        l_resetCurrentFiber_0();
    end;
    if bit32.band(l_flags_0, v45.Passive) ~= v45.NoFlags and not v162 then
        v162 = true;
        l_scheduleCallback_0(l_NormalPriority_0, function() --[[ Line: 2465 ]]
            -- upvalues: v5 (ref)
            v5.flushPassiveEffects();
            return nil;
        end);
    end;
end;
v140.commitBeforeMutationEffectsDeletions = function(v370) --[[ Line: 2473 ]]
    -- upvalues: l_doesFiberContain_0 (copy), v174 (ref), v175 (ref), v40 (copy)
    for v371 = 1, #v370 do
        local v372 = v370[v371];
        if l_doesFiberContain_0(v372, v174) then
            v175 = true;
            v40.beforeActiveInstanceBlur();
        end;
    end;
end;
v140.commitMutationEffects = function(v373, v374, v375) --[[ Line: 2488 ]]
    -- upvalues: l_commitDeletion_0 (copy), l_describeError_0 (copy), v5 (copy), v45 (copy), v140 (copy), l___DEV___0 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), l_resetCurrentFiber_0 (copy), l___YOLO___0 (copy)
    local l_v373_0 = v373;
    while l_v373_0 ~= nil do
        local l_deletions_0 = l_v373_0.deletions;
        if l_deletions_0 ~= nil then
            for _, v379 in l_deletions_0 do
                local v380, v381 = xpcall(l_commitDeletion_0, l_describeError_0, v374, v379, l_v373_0, v375);
                if not v380 then
                    v5.captureCommitPhaseError(v379, l_v373_0, v381);
                end;
            end;
        end;
        if l_v373_0.child ~= nil and bit32.band(l_v373_0.subtreeFlags, v45.MutationMask) ~= v45.NoFlags then
            v140.commitMutationEffects(l_v373_0.child, v374, v375);
        end;
        if l___DEV___0 then
            l_setCurrentFiber_0(l_v373_0);
            l_invokeGuardedCallback_0(nil, v140.commitMutationEffectsImpl, nil, l_v373_0, v374, v375);
            if l_hasCaughtError_0() then
                local v382 = l_clearCaughtError_0();
                v5.captureCommitPhaseError(l_v373_0, l_v373_0.return_, v382);
            end;
            l_resetCurrentFiber_0();
        else
            local v383 = nil;
            local v384 = nil;
            if not l___YOLO___0 then
                local v385, v386 = xpcall(v140.commitMutationEffectsImpl, l_describeError_0, l_v373_0, v374, v375);
                v383 = v385;
                v384 = v386;
            else
                v383 = true;
                v140.commitMutationEffectsImpl(l_v373_0, v374, v375);
            end;
            if not v383 then
                v5.captureCommitPhaseError(l_v373_0, l_v373_0.return_, v384);
            end;
        end;
        l_v373_0 = l_v373_0.sibling;
    end;
end;
v140.commitMutationEffectsImpl = function(v387, _, _) --[[ Line: 2553 ]]
    -- upvalues: v45 (copy), l_commitDetachRef_0 (copy), l_commitPlacement_0 (copy), l_commitWork_0 (copy)
    local l_flags_1 = v387.flags;
    if bit32.band(l_flags_1, v45.Ref) ~= 0 then
        local l_alternate_4 = v387.alternate;
        if l_alternate_4 ~= nil then
            l_commitDetachRef_0(l_alternate_4);
        end;
    end;
    local v392 = bit32.band(l_flags_1, (bit32.bor(v45.Placement, v45.Update, v45.Hydrating)));
    if v392 == v45.Placement then
        l_commitPlacement_0(v387);
        v387.flags = bit32.band(v387.flags, (bit32.bnot(v45.Placement)));
        return;
    elseif v392 == v45.PlacementAndUpdate then
        l_commitPlacement_0(v387);
        v387.flags = bit32.band(v387.flags, (bit32.bnot(v45.Placement)));
        local l_alternate_5 = v387.alternate;
        l_commitWork_0(l_alternate_5, v387);
        return;
    else
        if v392 == v45.Update then
            local l_alternate_6 = v387.alternate;
            l_commitWork_0(l_alternate_6, v387);
        end;
        return;
    end;
end;
v140.commitMutationEffectsDeletions = function(v395, v396, v397, v398) --[[ Line: 2619 ]]
    -- upvalues: l_commitDeletion_0 (copy), l_describeError_0 (copy), v5 (copy)
    for _, v400 in v395 do
        local v401, v402 = xpcall(l_commitDeletion_0, l_describeError_0, v397, v400, v396, v398);
        if not v401 then
            v5.captureCommitPhaseError(v400, v396, v402);
        end;
    end;
end;
v5.schedulePassiveEffectCallback = function() --[[ Line: 2641 ]]
    -- upvalues: v162 (ref), l_scheduleCallback_0 (copy), l_NormalPriority_0 (copy), v5 (copy)
    if not v162 then
        v162 = true;
        l_scheduleCallback_0(l_NormalPriority_0, function() --[[ Line: 2644 ]]
            -- upvalues: v5 (ref)
            v5.flushPassiveEffects();
            return nil;
        end);
    end;
end;
local v403 = nil;
v5.flushPassiveEffects = function() --[[ Line: 2653 ]]
    -- upvalues: l_l_NoPriority_0_0 (ref), l_NoPriority_0 (copy), l_NormalPriority_0 (copy), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), l_schedulerPriorityToLanePriority_0 (copy), l___YOLO___0 (copy), l_runWithPriority_0 (copy), l_describeError_0 (copy), v403 (ref)
    if l_l_NoPriority_0_0 ~= l_NoPriority_0 then
        local v404 = if l_NormalPriority_0 < l_l_NoPriority_0_0 then l_NormalPriority_0 else l_l_NoPriority_0_0;
        l_l_NoPriority_0_0 = l_NoPriority_0;
        if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
            local v405 = l_getCurrentUpdateLanePriority_0();
            l_setCurrentUpdateLanePriority_0(l_schedulerPriorityToLanePriority_0(v404));
            local v406 = nil;
            local v407 = nil;
            if not l___YOLO___0 then
                local v408, v409 = xpcall(l_runWithPriority_0, l_describeError_0, v404, v403);
                v406 = v408;
                v407 = v409;
            else
                v406 = true;
                l_setCurrentUpdateLanePriority_0(l_schedulerPriorityToLanePriority_0(v404));
                v407 = l_runWithPriority_0(v404, v403);
            end;
            l_setCurrentUpdateLanePriority_0(v405);
            if not v406 then
                error(v407);
            end;
            return v407;
        else
            return l_runWithPriority_0(v404, v403);
        end;
    else
        return false;
    end;
end;
v139 = function(v410, v411) --[[ Line: 2693 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), v43 (copy), v157 (ref), v45 (copy), v139 (ref), l___DEV___0 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_commitPassiveMount_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v5 (copy), l_resetCurrentFiber_0 (copy), l___YOLO___0 (copy), l_describeError_0 (copy)
    local l_v411_0 = v411;
    while l_v411_0 ~= nil do
        local v413 = nil;
        if l_ReactFeatureFlags_0.enableProfilerTimer and l_ReactFeatureFlags_0.enableProfilerCommitHooks and l_v411_0.tag == v43.Profiler then
            v413 = v157;
            v157 = l_v411_0;
        end;
        local v414 = bit32.band(l_v411_0.subtreeFlags, v45.PassiveMask);
        if l_v411_0.child ~= nil and v414 ~= v45.NoFlags then
            v139(v410, l_v411_0.child);
        end;
        if bit32.band(l_v411_0.flags, v45.Passive) ~= v45.NoFlags then
            if l___DEV___0 then
                l_setCurrentFiber_0(l_v411_0);
                l_invokeGuardedCallback_0(nil, l_commitPassiveMount_0, nil, v410, l_v411_0);
                if l_hasCaughtError_0() then
                    local v415 = l_clearCaughtError_0();
                    v5.captureCommitPhaseError(l_v411_0, l_v411_0.return_, v415);
                end;
                l_resetCurrentFiber_0();
            else
                local v416 = nil;
                local v417 = nil;
                if not l___YOLO___0 then
                    local v418, v419 = xpcall(l_commitPassiveMount_0, l_describeError_0, v410, l_v411_0);
                    v416 = v418;
                    v417 = v419;
                else
                    v416 = true;
                    l_commitPassiveMount_0(v410, l_v411_0);
                end;
                if not v416 then
                    v5.captureCommitPhaseError(l_v411_0, l_v411_0.return_, v417);
                end;
            end;
        end;
        if l_ReactFeatureFlags_0.enableProfilerTimer and l_ReactFeatureFlags_0.enableProfilerCommitHooks and l_v411_0.tag == v43.Profiler then
            if v413 ~= nil then
                local l_stateNode_0 = v413.stateNode;
                l_stateNode_0.passiveEffectDuration = l_stateNode_0.passiveEffectDuration + l_v411_0.stateNode.passiveEffectDuration;
            end;
            v157 = v413;
        end;
        l_v411_0 = l_v411_0.sibling;
    end;
end;
local function v421(v422) --[[ Line: 2759 ]] --[[ Name: flushPassiveUnmountEffects ]]
    -- upvalues: v140 (copy), v45 (copy), v421 (copy), l_setCurrentFiber_0 (copy), l_commitPassiveUnmount_0 (copy), l_resetCurrentFiber_0 (copy)
    local l_v422_0 = v422;
    while l_v422_0 ~= nil do
        local l_deletions_1 = l_v422_0.deletions;
        if l_deletions_1 ~= nil then
            for v425 = 1, #l_deletions_1 do
                local v426 = l_deletions_1[v425];
                v140.flushPassiveUnmountEffectsInsideOfDeletedTree(v426, l_v422_0);
                v140.detachFiberAfterEffects(v426);
            end;
        end;
        local l_child_1 = l_v422_0.child;
        if l_child_1 ~= nil and bit32.band(l_v422_0.subtreeFlags, v45.PassiveMask) ~= v45.NoFlags then
            v421(l_child_1);
        end;
        if bit32.band(l_v422_0.flags, v45.Passive) ~= v45.NoFlags then
            l_setCurrentFiber_0(l_v422_0);
            l_commitPassiveUnmount_0(l_v422_0);
            l_resetCurrentFiber_0();
        end;
        l_v422_0 = l_v422_0.sibling;
    end;
end;
v140.flushPassiveUnmountEffectsInsideOfDeletedTree = function(v428, v429) --[[ Line: 2797 ]]
    -- upvalues: v45 (copy), v140 (copy), l_setCurrentFiber_0 (copy), l_commitPassiveUnmountInsideDeletedTree_0 (copy), l_resetCurrentFiber_0 (copy)
    if bit32.band(v428.subtreeFlags, v45.PassiveStatic) ~= v45.NoFlags then
        local l_child_2 = v428.child;
        while l_child_2 ~= nil do
            v140.flushPassiveUnmountEffectsInsideOfDeletedTree(l_child_2, v429);
            l_child_2 = l_child_2.sibling;
        end;
    end;
    if bit32.band(v428.flags, v45.PassiveStatic) ~= v45.NoFlags then
        l_setCurrentFiber_0(v428);
        l_commitPassiveUnmountInsideDeletedTree_0(v428, v429);
        l_resetCurrentFiber_0();
    end;
end;
v403 = function() --[[ Line: 2826 ]]
    -- upvalues: v163 (ref), l_NoLanes_4 (ref), v8 (copy), l_invariant_0 (copy), v142 (ref), l___DEV___0 (copy), l_enableDebugTracing_0 (copy), v35 (copy), l_enableSchedulingProfiler_0 (copy), v36 (copy), v140 (copy), v421 (copy), v139 (ref), l_enableDoubleInvokingEffects_0 (copy), l_ReactFeatureFlags_0 (copy), l_flushSyncCallbackQueue_0 (copy), v169 (ref)
    if v163 == nil then
        return false;
    else
        local l_v163_0 = v163;
        local l_l_NoLanes_4_0 = l_NoLanes_4;
        v163 = nil;
        l_NoLanes_4 = v8.NoLanes;
        l_invariant_0(bit32.band(v142, 48) == 0, "Cannot flush passive effects while already rendering.");
        if l___DEV___0 and l_enableDebugTracing_0 then
            v35.logPassiveEffectsStarted(l_l_NoLanes_4_0);
        end;
        if l_enableSchedulingProfiler_0 then
            v36.markPassiveEffectsStarted(l_l_NoLanes_4_0);
        end;
        local l_v142_9 = v142;
        v142 = bit32.bor(v142, 32);
        local v434 = v140.pushInteractions(l_v163_0);
        v421(l_v163_0.current);
        v139(l_v163_0, l_v163_0.current);
        if l___DEV___0 and l_enableDebugTracing_0 then
            v35.logPassiveEffectsStopped();
        end;
        if l_enableSchedulingProfiler_0 then
            v36.markPassiveEffectsStopped();
        end;
        if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
            commitDoubleInvokeEffectsInDEV(l_v163_0.current, true);
        end;
        if l_ReactFeatureFlags_0.enableSchedulerTracing then
            v140.popInteractions(v434);
            v140.finishPendingInteractions(l_v163_0, l_l_NoLanes_4_0);
        end;
        v142 = l_v142_9;
        l_flushSyncCallbackQueue_0();
        if v163 == nil then
            v169 = 0;
        else
            v169 = v169 + 1;
        end;
        return true;
    end;
end;
v5.isAlreadyFailedLegacyErrorBoundary = function(v435) --[[ Line: 2899 ]]
    -- upvalues: v161 (ref)
    local v436 = false;
    if v161 ~= nil then
        v436 = v161:has(v435);
    end;
    return v436;
end;
v5.markLegacyErrorBoundaryAsFailed = function(v437) --[[ Line: 2905 ]]
    -- upvalues: v161 (ref), l_Set_0 (copy)
    if v161 == nil then
        v161 = l_Set_0.new({
            v437
        });
        return;
    else
        v161:add(v437);
        return;
    end;
end;
v5.onUncaughtError = function(v438) --[[ Line: 2914 ]] --[[ Name: prepareToThrowUncaughtError ]]
    -- upvalues: v159 (ref), v160 (ref)
    if not v159 then
        v159 = true;
        v160 = v438;
    end;
end;
v138 = function(v439, v440, v441) --[[ Line: 2922 ]]
    -- upvalues: l_createCapturedValue_0 (copy), l_createRootErrorUpdate_0 (copy), l_SyncLane_0 (copy), v5 (copy), l_enqueueUpdate_0 (copy), v140 (copy), l_markRootUpdated_0 (copy), v101 (ref)
    local v442 = l_createCapturedValue_0(v441, v440);
    local v443 = l_createRootErrorUpdate_0(v439, v442, l_SyncLane_0, v5.onUncaughtError);
    l_enqueueUpdate_0(v439, v443);
    local v444 = v5.requestEventTime();
    local v445 = v140.markUpdateLaneFromFiberToRoot(v439, l_SyncLane_0);
    if v445 ~= nil then
        l_markRootUpdated_0(v445, l_SyncLane_0, v444);
        v101(v445, v444);
        v140.schedulePendingInteractions(v445, l_SyncLane_0);
    end;
end;
v5.captureCommitPhaseError = function(v446, v447, v448) --[[ Line: 2945 ]]
    -- upvalues: v43 (copy), v138 (ref), l_skipUnmountedBoundaries_0 (copy), v5 (copy), l_createCapturedValue_0 (copy), l_createClassErrorUpdate_0 (copy), l_SyncLane_0 (copy), l_enqueueUpdate_0 (copy), v140 (copy), l_markRootUpdated_0 (copy), v101 (ref)
    if v446.tag == v43.HostRoot then
        v138(v446, v446, v448);
        return;
    else
        local v449 = nil;
        v449 = if l_skipUnmountedBoundaries_0 then v447 else v446.return_;
        while true do
            if v449 ~= nil then
                if v449.tag == v43.HostRoot then
                    v138(v449, v446, v448);
                    return;
                else
                    if v449.tag == v43.ClassComponent then
                        local l_type_0 = v449.type;
                        local l_stateNode_1 = v449.stateNode;
                        if typeof(l_type_0.getDerivedStateFromError) == "function" or typeof(l_stateNode_1.componentDidCatch) == "function" and not v5.isAlreadyFailedLegacyErrorBoundary(l_stateNode_1) then
                            local v452 = l_createCapturedValue_0(v448, v446);
                            local v453 = l_createClassErrorUpdate_0(v449, v452, l_SyncLane_0);
                            l_enqueueUpdate_0(v449, v453);
                            local v454 = v5.requestEventTime();
                            local v455 = v140.markUpdateLaneFromFiberToRoot(v449, l_SyncLane_0);
                            if v455 ~= nil then
                                l_markRootUpdated_0(v455, l_SyncLane_0, v454);
                                v101(v455, v454);
                                v140.schedulePendingInteractions(v455, l_SyncLane_0);
                            end;
                            return;
                        end;
                    end;
                    v449 = v449.return_;
                end;
            else
                return;
            end;
        end;
    end;
end;
v5.pingSuspendedRoot = function(v456, v457, v458) --[[ Line: 2998 ]]
    -- upvalues: v5 (copy), l_markRootPinged_0 (copy), v143 (ref), l_isSubsetOfLanes_0 (copy), l_NoLanes_0 (ref), l_Incomplete_0 (ref), v141 (copy), l_includesOnlyRetries_0 (copy), l_now_0 (copy), v155 (ref), v140 (copy), v8 (copy), l_NoLanes_3 (ref), l_mergeLanes_0 (copy), v101 (ref)
    local l_pingCache_0 = v456.pingCache;
    if l_pingCache_0 ~= nil then
        l_pingCache_0[v457] = nil;
    end;
    local v460 = v5.requestEventTime();
    l_markRootPinged_0(v456, v458, v460);
    if v143 == v456 and l_isSubsetOfLanes_0(l_NoLanes_0, v458) then
        if l_Incomplete_0 == v141.SuspendedWithDelay or l_Incomplete_0 == v141.Suspended and l_includesOnlyRetries_0(l_NoLanes_0) and l_now_0() - v155 < 500 then
            v140.prepareFreshStack(v456, v8.NoLanes);
        else
            l_NoLanes_3 = l_mergeLanes_0(l_NoLanes_3, v458);
        end;
    end;
    v101(v456, v460);
    v140.schedulePendingInteractions(v456, v458);
end;
retryTimedOutBoundary = function(v461, v462) --[[ Line: 3048 ]] --[[ Name: retryTimedOutBoundary ]]
    -- upvalues: v8 (copy), v5 (copy), v140 (copy), l_markRootUpdated_0 (copy), v101 (ref)
    if v462 == v8.NoLane then
        v462 = requestRetryLane(v461);
    end;
    local v463 = v5.requestEventTime();
    local v464 = v140.markUpdateLaneFromFiberToRoot(v461, v462);
    if v464 ~= nil then
        l_markRootUpdated_0(v464, v462, v463);
        v101(v464, v463);
        v140.schedulePendingInteractions(v464, v462);
    end;
end;
v5.resolveRetryWakeable = function(v465, v466) --[[ Line: 3075 ]]
    -- upvalues: v8 (copy)
    local l_NoLane_0 = v8.NoLane;
    local v468 = nil;
    v468 = v465.stateNode;
    if v468 ~= nil then
        v468:delete(v466);
    end;
    retryTimedOutBoundary(v465, l_NoLane_0);
end;
jnd = function(v469) --[[ Line: 3119 ]] --[[ Name: jnd ]]
    if v469 < 120 then
        return 120;
    elseif v469 < 480 then
        return 480;
    elseif v469 < 1080 then
        return 1080;
    elseif v469 < 1920 then
        return 1920;
    elseif v469 < 3000 then
        return 3000;
    elseif v469 < 4320 then
        return 4320;
    else
        return math.ceil(v469 / 1960) * 1960;
    end;
end;
v140.checkForNestedUpdates = function() --[[ Line: 3137 ]]
    -- upvalues: v167 (ref), v168 (ref), l_invariant_0 (copy), l___DEV___0 (copy), v169 (ref), l_console_0 (copy)
    if v167 > 50 then
        v167 = 0;
        v168 = nil;
        l_invariant_0(false, "Maximum update depth exceeded. This can happen when a component " .. "repeatedly calls setState inside componentWillUpdate or " .. "componentDidUpdate. React limits the number of nested updates to " .. "prevent infinite loops.");
    end;
    if l___DEV___0 and v169 > 50 then
        v169 = 0;
        l_console_0.error("Maximum update depth exceeded. This can happen when a component " .. "calls setState inside useEffect, but useEffect either doesn't " .. "have a dependency array, or one of the dependencies changes on " .. "every render.");
    end;
end;
flushRenderPhaseStrictModeWarningsInDEV = function() --[[ Line: 3163 ]] --[[ Name: flushRenderPhaseStrictModeWarningsInDEV ]]
    -- upvalues: l___DEV___0 (copy), v122 (copy), l_ReactFeatureFlags_0 (copy)
    if l___DEV___0 then
        v122.flushLegacyContextWarning();
        if l_ReactFeatureFlags_0.warnAboutDeprecatedLifecycles then
            v122.flushPendingUnsafeLifecycleWarnings();
        end;
    end;
end;
commitDoubleInvokeEffectsInDEV = function(v470, v471) --[[ Line: 3173 ]] --[[ Name: commitDoubleInvokeEffectsInDEV ]]
    -- upvalues: l___DEV___0 (copy), l_enableDoubleInvokingEffects_0 (copy), l_setCurrentFiber_0 (copy), v45 (copy), l_invokeLayoutEffectUnmountInDEV_0 (copy), l_invokePassiveEffectUnmountInDEV_0 (copy), l_invokeLayoutEffectMountInDEV_0 (copy), l_invokePassiveEffectMountInDEV_0 (copy), l_resetCurrentFiber_0 (copy)
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
        l_setCurrentFiber_0(v470);
        invokeEffectsInDev(v470, v45.MountLayoutDev, l_invokeLayoutEffectUnmountInDEV_0);
        if v471 then
            invokeEffectsInDev(v470, v45.MountPassiveDev, l_invokePassiveEffectUnmountInDEV_0);
        end;
        invokeEffectsInDev(v470, v45.MountLayoutDev, l_invokeLayoutEffectMountInDEV_0);
        if v471 then
            invokeEffectsInDev(v470, v45.MountPassiveDev, l_invokePassiveEffectMountInDEV_0);
        end;
        l_resetCurrentFiber_0();
    end;
end;
invokeEffectsInDev = function(v472, v473, v474) --[[ Line: 3196 ]] --[[ Name: invokeEffectsInDev ]]
    -- upvalues: l___DEV___0 (copy), l_enableDoubleInvokingEffects_0 (copy), v45 (copy)
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
        local l_v472_0 = v472;
        while l_v472_0 ~= nil do
            if l_v472_0.child ~= nil and bit32.band(l_v472_0.subtreeFlags, v473) ~= v45.NoFlags then
                invokeEffectsInDev(l_v472_0.child, v473, v474);
            end;
            if bit32.band(l_v472_0.flags, v473) ~= v45.NoFlags then
                v474(l_v472_0);
            end;
            l_v472_0 = l_v472_0.sibling;
        end;
    end;
end;
local v476 = nil;
v140.warnAboutUpdateOnNotYetMountedFiberInDEV = function(v477) --[[ Line: 3222 ]]
    -- upvalues: l___DEV___0 (copy), v142 (ref), v42 (copy), v43 (copy), l_getComponentName_0 (copy), v476 (ref), v123 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_resetCurrentFiber_0 (copy)
    if l___DEV___0 then
        if bit32.band(v142, 16) ~= 0 then
            return;
        elseif bit32.band(v477.mode, (bit32.bor(v42.BlockingMode, v42.ConcurrentMode))) == 0 then
            return;
        else
            local l_tag_0 = v477.tag;
            if l_tag_0 ~= v43.IndeterminateComponent and l_tag_0 ~= v43.HostRoot and l_tag_0 ~= v43.ClassComponent and l_tag_0 ~= v43.FunctionComponent and l_tag_0 ~= v43.ForwardRef and l_tag_0 ~= v43.MemoComponent and l_tag_0 ~= v43.SimpleMemoComponent and l_tag_0 ~= v43.Block then
                return;
            else
                local v479 = l_getComponentName_0(v477.type) or "ReactComponent";
                if v476 ~= nil then
                    if v476[v479] then
                        return;
                    else
                        v476[v479] = true;
                    end;
                else
                    v476 = {
                        [v479] = true
                    };
                end;
                local l_current_3 = v123.current;
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 3262 ]]
                    -- upvalues: l_setCurrentFiber_0 (ref), v477 (copy), l_console_0 (ref)
                    l_setCurrentFiber_0(v477);
                    l_console_0.error("Can't perform a React state update on a component that hasn't mounted yet. " .. "This indicates that you have a side-effect in your render function that " .. "asynchronously later calls tries to update the component. Move this work to " .. "useEffect instead.");
                end);
                if l_current_3 then
                    l_setCurrentFiber_0(v477);
                else
                    l_resetCurrentFiber_0();
                end;
                if not l_status_1 then
                    error(l_result_1);
                end;
            end;
        end;
    end;
end;
if l___DEV___0 and l_ReactFeatureFlags_0.replayFailedUnitOfWorkWithInvokeGuardedCallback then
    v140.beginWork = function(v483, v484, v485) --[[ Line: 3289 ]]
        -- upvalues: v41 (copy), v106 (copy), l_describeError_0 (copy), l_resetContextDependencies_0 (copy), v102 (copy), v111 (ref), l_unwindInterruptedWork_0 (copy), l_ReactFeatureFlags_0 (copy), v42 (copy), v120 (copy), l_invokeGuardedCallback_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy)
        local v486 = v41.assignFiberPropertiesInDEV(nil, v484);
        local v487, v488 = xpcall(v106, l_describeError_0, v483, v484, v485);
        if not v487 then
            if v488 ~= nil and typeof(v488) == "table" and typeof(v488.andThen) == "function" then
                error(v488);
            end;
            l_resetContextDependencies_0();
            if not v102.resetHooksAfterThrowRef then
                v111 = require(script.Parent["ReactFiberHooks.new"]);
                v102.resetHooksAfterThrowRef = v111.resetHooksAfterThrow;
                v102.ContextOnlyDispatcherRef = v111.ContextOnlyDispatcher;
                v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v111.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
            end;
            local v489 = v102.resetHooksAfterThrowRef();
            l_unwindInterruptedWork_0(v484);
            v41.assignFiberPropertiesInDEV(v484, v486);
            if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(v484.mode, v42.ProfileMode) ~= 0 then
                v120.startProfilerTimer(v484);
            end;
            l_invokeGuardedCallback_0(nil, v106, nil, v483, v484, v485);
            if l_hasCaughtError_0() then
                v489 = l_clearCaughtError_0();
                error(v489);
                return v488;
            else
                error(v488);
            end;
        end;
        return v488;
    end;
else
    v140.beginWork = v106;
end;
local v490 = false;
local v491 = nil;
if l___DEV___0 then
    v491 = {};
end;
v140.warnAboutRenderPhaseUpdatesInDEV = function(v492) --[[ Line: 3365 ]]
    -- upvalues: l___DEV___0 (copy), v123 (copy), v142 (ref), v102 (copy), v111 (ref), v43 (copy), v144 (ref), l_getComponentName_0 (copy), v491 (ref), l_console_0 (copy), v490 (ref)
    if l___DEV___0 and v123.isRendering and bit32.band(v142, 16) ~= 0 then
        if not v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
            v111 = require(script.Parent["ReactFiberHooks.new"]);
            v102.resetHooksAfterThrowRef = v111.resetHooksAfterThrow;
            v102.ContextOnlyDispatcherRef = v111.ContextOnlyDispatcher;
            v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v111.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
        end;
        if not v102.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef() then
            if v492.tag == v43.FunctionComponent or v492.tag == v43.ForwardRef or v492.tag == v43.SimpleMemoComponent then
                local v493 = if v144 ~= nil then l_getComponentName_0(v144.type) else "Unknown";
                if v491[v493] == nil then
                    v491[v493] = true;
                    local v494 = l_getComponentName_0(v492.type) or "Unknown";
                    l_console_0.error("Cannot update a component (`%s`) while rendering a " .. "different component (`%s`). To locate the bad setState() call inside `%s`, " .. "follow the stack trace as described in https://reactjs.org/link/setstate-in-render", v494, v493, v493);
                    return;
                end;
            elseif v492.tag == v43.ClassComponent and not v490 then
                l_console_0.error("Cannot update during an existing state transition (such as " .. "within `render`). Render methods should be a pure " .. "function of props and state.");
                v490 = true;
            end;
        end;
    end;
end;
v5.IsThisRendererActing = {
    current = false
};
v5.warnIfNotScopedWithMatchingAct = function(v495) --[[ Line: 3415 ]]
    -- upvalues: l___DEV___0 (copy), v40 (copy), l_IsSomeRendererActing_0 (copy), v5 (copy), v123 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_resetCurrentFiber_0 (copy)
    if l___DEV___0 and v40.warnsIfNotActing == true and l_IsSomeRendererActing_0.current == true and v5.IsThisRendererActing.current ~= true then
        local l_current_4 = v123.current;
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 3423 ]]
            -- upvalues: l_setCurrentFiber_0 (ref), v495 (copy), l_console_0 (ref)
            l_setCurrentFiber_0(v495);
            l_console_0.error("It looks like you're using the wrong act() around your test interactions.\n" .. "Be sure to use the matching version of act() corresponding to your renderer:\n\n" .. "-- for react-roblox:\n" .. "local React = require(Packages.React)\n" .. "-- ...\n" .. "React.TestUtils.act(function() ... end)\n\n" .. "-- for react-test-renderer:\n" .. "local TestRenderer = require(Packages.ReactTestRenderer)\n" .. "-- ...\n" .. "TestRenderer.act(function() ... end)");
        end);
        if l_current_4 then
            l_setCurrentFiber_0(v495);
        else
            l_resetCurrentFiber_0();
        end;
        if not l_status_2 then
            error(l_result_2);
        end;
    end;
end;
v5.warnIfNotCurrentlyActingEffectsInDEV = function(v499) --[[ Line: 3459 ]]
    -- upvalues: l___DEV___0 (copy), v40 (copy), v42 (copy), l_IsSomeRendererActing_0 (copy), v5 (copy), l_console_0 (copy), l_getComponentName_0 (copy)
    if l___DEV___0 and v40.warnsIfNotActing == true and bit32.band(v499.mode, v42.StrictMode) ~= v42.NoMode and l_IsSomeRendererActing_0.current == false and v5.IsThisRendererActing.current == false then
        l_console_0.error("An update to %s ran an effect, but was not wrapped in act(...).\n\n" .. "When testing, code that causes React state updates should be " .. "wrapped into act(...):\n\n" .. "act(function()\n" .. "  --[[ fire events that update state ]]\n" .. "end)\n" .. "--[[ assert on the output ]]\n\n" .. "This ensures that you're testing the behavior the user would see " .. "in the real client." .. " Learn more at https://reactjs.org/link/wrap-tests-with-act", l_getComponentName_0(v499.type));
    end;
end;
v5.warnIfNotCurrentlyActingUpdatesInDEV = function(v500) --[[ Line: 3485 ]]
    -- upvalues: l___DEV___0 (copy), v40 (copy), v142 (ref), l_IsSomeRendererActing_0 (copy), v5 (copy), l_current_0 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_resetCurrentFiber_0 (copy)
    if l___DEV___0 and v40.warnsIfNotActing == true and v142 == 0 and l_IsSomeRendererActing_0.current == false and v5.IsThisRendererActing.current == false then
        local l_l_current_0_0 = l_current_0;
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 3494 ]]
            -- upvalues: l_setCurrentFiber_0 (ref), v500 (copy), l_console_0 (ref), l_getComponentName_0 (ref)
            l_setCurrentFiber_0(v500);
            l_console_0.error("An update to %s inside a test was not wrapped in act(...).\n\n" .. "When testing, code that causes React state updates should be " .. "wrapped into act(...):\n\n" .. "act(function()\n" .. "  --[[ fire events that update state ]]\n" .. "end)\n" .. "--[[ assert on the output ]]\n\n" .. "This ensures that you're testing the behavior the user would see " .. "in the client application." .. " Learn more at https://reactjs.org/link/wrap-tests-with-act", l_getComponentName_0(v500.type));
        end);
        if l_l_current_0_0 then
            l_setCurrentFiber_0(v500);
        else
            l_resetCurrentFiber_0();
        end;
        if l_status_3 then
            return l_result_3;
        end;
    end;
end;
local v504 = false;
v5.warnIfUnmockedScheduler = function(v505) --[[ Line: 3535 ]]
    -- upvalues: l___DEV___0 (copy), v504 (ref), v9 (copy), v42 (copy), l_console_0 (copy), l_ReactFeatureFlags_0 (copy)
    if l___DEV___0 and v504 == false and v9.unstable_flushAllWithoutAsserting == nil then
        if bit32.band(v505.mode, v42.BlockingMode) ~= 0 or bit32.band(v505.mode, v42.ConcurrentMode) ~= 0 then
            v504 = true;
            l_console_0.error("In Concurrent or Sync modes, the 'scheduler' module needs to be mocked " .. "to guarantee consistent behaviour across tests and client application. " .. "For example, with RobloxJest: \n" .. "RobloxJest.mock('scheduler', function() return require(Packages.Scheduler).unstable_mock end)\n\n" .. "For more info, visit https://reactjs.org/link/mock-scheduler");
            return;
        elseif l_ReactFeatureFlags_0.warnAboutUnmockedScheduler == true then
            v504 = true;
            l_console_0.error("Starting from React v18, the 'scheduler' module will need to be mocked " .. "to guarantee consistent behaviour across tests and client applications. " .. "For example, with RobloxJest: \n" .. "RobloxJest.mock('scheduler', function() return require(Packages.Scheduler).unstable_mock end)\n\n" .. "For more info, visit https://reactjs.org/link/mock-scheduler");
        end;
    end;
end;
computeThreadID = function(v506, v507) --[[ Line: 3576 ]] --[[ Name: computeThreadID ]]
    return v507 * 1000 + v506.interactionThreadID;
end;
v5.markSpawnedWork = function(v508) --[[ Line: 3584 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), v170 (ref)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    elseif v170 == nil then
        v170 = {
            v508
        };
        return;
    else
        table.insert(v170, v508);
        return;
    end;
end;
scheduleInteractions = function(v509, v510, v511) --[[ Line: 3596 ]] --[[ Name: scheduleInteractions ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l_Set_0 (copy), l___subscriberRef_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        if v511.size > 0 then
            local l_pendingInteractionMap_0 = v509.pendingInteractionMap;
            local v513 = l_pendingInteractionMap_0:get(v510);
            if v513 ~= nil then
                v511:forEach(function(v514) --[[ Line: 3609 ]]
                    -- upvalues: v513 (copy)
                    if not v513:has(v514) then
                        v514.__count = v514.__count + 1;
                    end;
                    v513:add(v514);
                end);
            else
                l_pendingInteractionMap_0:set(v510, l_Set_0.new(v511));
                for _, v516 in v511 do
                    v516.__count = v516.__count + 1;
                end;
            end;
            local l_current_5 = l___subscriberRef_0.current;
            if l_current_5 ~= nil then
                local v518 = computeThreadID(v509, v510);
                l_current_5.onWorkScheduled(v511, v518);
            end;
        end;
        return;
    end;
end;
v140.schedulePendingInteractions = function(v519, v520) --[[ Line: 3634 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___interactionsRef_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        scheduleInteractions(v519, v520, l___interactionsRef_0.current);
        return;
    end;
end;
v140.startWorkOnPendingInteractions = function(v521, v522) --[[ Line: 3645 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l_Set_0 (copy), l_includesSomeLane_0 (copy), l___subscriberRef_0 (copy), l_describeError_0 (copy), l_scheduleCallback_0 (copy), l_ImmediatePriority_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        local v523 = l_Set_0.new();
        v521.pendingInteractionMap:forEach(function(v524, v525) --[[ Line: 3655 ]]
            -- upvalues: l_includesSomeLane_0 (ref), v522 (copy), v523 (copy)
            if l_includesSomeLane_0(v522, v525) then
                v524:forEach(function(v526) --[[ Line: 3657 ]]
                    -- upvalues: v523 (ref)
                    v523:add(v526);
                end);
            end;
        end);
        v521.memoizedInteractions = v523;
        if v523.size > 0 then
            local l_current_6 = l___subscriberRef_0.current;
            if l_current_6 ~= nil then
                local v528 = computeThreadID(v521, v522);
                local v529, v530 = xpcall(l_current_6.onWorkStarted, l_describeError_0, v523, v528);
                if not v529 then
                    l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3678 ]]
                        -- upvalues: v530 (copy)
                        error(v530);
                    end);
                end;
            end;
        end;
        return;
    end;
end;
v140.finishPendingInteractions = function(v531, v532) --[[ Line: 3686 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___subscriberRef_0 (copy), l_describeError_0 (copy), l_includesSomeLane_0 (copy), l_scheduleCallback_0 (copy), l_ImmediatePriority_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        local l_pendingLanes_0 = v531.pendingLanes;
        local v534 = nil;
        local v535 = true;
        local v536 = nil;
        if v534 ~= nil and v531.memoizedInteractions.size > 0 then
            local v537 = computeThreadID(v531, v532);
            v534 = l___subscriberRef_0.current;
            local v538, v539 = xpcall(v534.onWorkStopped, l_describeError_0, v531.memoizedInteractions, v537);
            v535 = v538;
            v536 = v539;
        end;
        local l_pendingInteractionMap_1 = v531.pendingInteractionMap;
        l_pendingInteractionMap_1:forEach(function(v541, v542) --[[ Line: 3712 ]]
            -- upvalues: l_includesSomeLane_0 (ref), l_pendingLanes_0 (copy), l_pendingInteractionMap_1 (copy), v534 (ref), l_describeError_0 (ref), l_scheduleCallback_0 (ref), l_ImmediatePriority_0 (ref)
            if not l_includesSomeLane_0(l_pendingLanes_0, v542) then
                l_pendingInteractionMap_1:delete(v542);
                v541:forEach(function(v543) --[[ Line: 3718 ]]
                    -- upvalues: v534 (ref), l_describeError_0 (ref), l_scheduleCallback_0 (ref), l_ImmediatePriority_0 (ref)
                    v543.__count = v543.__count - 1;
                    if v534 ~= nil and v543.__count == 0 then
                        local v544, v545 = xpcall(v534.onInteractionScheduledWorkCompleted, l_describeError_0, v543);
                        if not v544 then
                            l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3725 ]]
                                -- upvalues: v545 (copy)
                                error(v545);
                            end);
                        end;
                    end;
                end);
            end;
        end);
        if not v535 then
            l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3737 ]]
                -- upvalues: v536 (ref)
                error(v536);
            end);
        end;
        return;
    end;
end;
local v546 = false;
local v547 = false;
local l_unstable_flushAllWithoutAsserting_0 = v9.unstable_flushAllWithoutAsserting;
local v549 = typeof(l_unstable_flushAllWithoutAsserting_0) == "function";
local function v557() --[[ Line: 3756 ]] --[[ Name: flushActWork ]]
    -- upvalues: l_unstable_flushAllWithoutAsserting_0 (copy), v546 (ref), l_describeError_0 (copy), v5 (copy)
    if l_unstable_flushAllWithoutAsserting_0 ~= nil then
        local l_v546_0 = v546;
        v546 = true;
        local v551, v552 = xpcall(l_unstable_flushAllWithoutAsserting_0, l_describeError_0);
        v546 = l_v546_0;
        if not v551 then
            error(v552);
            return;
        else
            return v552;
        end;
    else
        local l_v546_1 = v546;
        v546 = true;
        local v555, v556 = xpcall(function() --[[ Line: 3776 ]]
            -- upvalues: v5 (ref)
            local v554 = false;
            while v5.flushPassiveEffects() do
                v554 = true;
            end;
            return v554;
        end, l_describeError_0);
        v546 = l_v546_1;
        if not v555 then
            error(v556);
            return;
        else
            return v556;
        end;
    end;
end;
local function v558(v559) --[[ Line: 3795 ]] --[[ Name: flushWorkAndMicroTasks ]]
    -- upvalues: v557 (copy), l_describeError_0 (copy), l_enqueueTask_0 (copy), v558 (copy)
    local v560, v561 = xpcall(v557, l_describeError_0);
    if v560 then
        local v562, v563 = xpcall(l_enqueueTask_0, l_describeError_0, function() --[[ Line: 3799 ]]
            -- upvalues: v557 (ref), v558 (ref), v559 (copy)
            if v557() then
                v558(v559);
                return;
            else
                v559();
                return;
            end;
        end);
        v560 = v562;
        v561 = v563;
    end;
    if not v560 then
        v559(v561);
    end;
end;
v5.act = function(v564) --[[ Line: 3813 ]]
    -- upvalues: l___DEV___0 (copy), v208 (ref), l_console_0 (copy), v207 (ref), l_IsSomeRendererActing_0 (copy), v5 (copy), v547 (ref), l_describeError_0 (copy), v98 (copy), v549 (copy), v558 (copy), v557 (copy)
    if not l___DEV___0 and not _G.__ROACT_17_MOCK_SCHEDULER__ and v208 == false then
        v208 = true;
        l_console_0.error("act(...) is not supported in production builds of React, and might not behave as expected.");
    end;
    local l_v207_0 = v207;
    v207 = v207 + 1;
    local l_current_7 = l_IsSomeRendererActing_0.current;
    local l_current_8 = v5.IsThisRendererActing.current;
    local l_v547_0 = v547;
    l_IsSomeRendererActing_0.current = true;
    v5.IsThisRendererActing.current = true;
    v547 = true;
    local function _() --[[ Line: 3838 ]] --[[ Name: onDone ]]
        -- upvalues: v207 (ref), l_IsSomeRendererActing_0 (ref), l_current_7 (copy), v5 (ref), l_current_8 (copy), v547 (ref), l_v547_0 (copy), l___DEV___0 (ref), l_v207_0 (copy), l_console_0 (ref)
        v207 = v207 - 1;
        l_IsSomeRendererActing_0.current = l_current_7;
        v5.IsThisRendererActing.current = l_current_8;
        v547 = l_v547_0;
        if l___DEV___0 and l_v207_0 < v207 then
            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
        end;
    end;
    local v570, v571 = xpcall(v5.batchedUpdates, l_describeError_0, v564);
    if not v570 then
        v207 = v207 - 1;
        l_IsSomeRendererActing_0.current = l_current_7;
        v5.IsThisRendererActing.current = l_current_8;
        v547 = l_v547_0;
        if l___DEV___0 and l_v207_0 < v207 then
            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
        end;
        error(v571);
    end;
    if v571 ~= nil and typeof(v571) == "table" and typeof(v571.andThen) == "function" then
        local v572 = false;
        if l___DEV___0 and typeof(v98) ~= nil then
            v98.resolve():andThen(function() --[[ Line: 3872 ]]

            end):andThen(function() --[[ Line: 3873 ]]
                -- upvalues: v572 (ref), l_console_0 (ref)
                if v572 == false then
                    l_console_0.error("You called act(Promise.new(function() --[[ ... ]] end)) without :await() or :expect(). " .. "This could lead to unexpected testing behaviour, interleaving multiple act " .. "calls and mixing their scopes. You should - act(function() Promise.new(function() --[[ ... ]] end):await() end);");
                end;
            end);
        end;
        return {
            andThen = function(_, v574, v575) --[[ Line: 3892 ]] --[[ Name: andThen ]]
                -- upvalues: v572 (ref), v571 (copy), v207 (ref), v549 (ref), l_current_7 (copy), l_IsSomeRendererActing_0 (ref), v5 (ref), l_current_8 (copy), v547 (ref), l_v547_0 (copy), l___DEV___0 (ref), l_v207_0 (copy), l_console_0 (ref), v558 (ref)
                v572 = true;
                return v571:andThen(function() --[[ Line: 3895 ]]
                    -- upvalues: v207 (ref), v549 (ref), l_current_7 (ref), l_IsSomeRendererActing_0 (ref), v5 (ref), l_current_8 (ref), v547 (ref), l_v547_0 (ref), l___DEV___0 (ref), l_v207_0 (ref), l_console_0 (ref), v574 (copy), v558 (ref), v575 (copy)
                    if v207 > 1 or v549 == true and l_current_7 == true then
                        v207 = v207 - 1;
                        l_IsSomeRendererActing_0.current = l_current_7;
                        v5.IsThisRendererActing.current = l_current_8;
                        v547 = l_v547_0;
                        if l___DEV___0 and l_v207_0 < v207 then
                            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                        end;
                        v574();
                        return;
                    else
                        v558(function(v576) --[[ Line: 3907 ]]
                            -- upvalues: v207 (ref), l_IsSomeRendererActing_0 (ref), l_current_7 (ref), v5 (ref), l_current_8 (ref), v547 (ref), l_v547_0 (ref), l___DEV___0 (ref), l_v207_0 (ref), l_console_0 (ref), v575 (ref), v574 (ref)
                            v207 = v207 - 1;
                            l_IsSomeRendererActing_0.current = l_current_7;
                            v5.IsThisRendererActing.current = l_current_8;
                            v547 = l_v547_0;
                            if l___DEV___0 and l_v207_0 < v207 then
                                l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                            end;
                            if v576 then
                                v575(v576);
                                return;
                            else
                                v574();
                                return;
                            end;
                        end);
                        return;
                    end;
                end, function(v577) --[[ Line: 3916 ]]
                    -- upvalues: v207 (ref), l_IsSomeRendererActing_0 (ref), l_current_7 (ref), v5 (ref), l_current_8 (ref), v547 (ref), l_v547_0 (ref), l___DEV___0 (ref), l_v207_0 (ref), l_console_0 (ref), v575 (copy)
                    v207 = v207 - 1;
                    l_IsSomeRendererActing_0.current = l_current_7;
                    v5.IsThisRendererActing.current = l_current_8;
                    v547 = l_v547_0;
                    if l___DEV___0 and l_v207_0 < v207 then
                        l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                    end;
                    v575(v577);
                end);
            end
        };
    else
        if l___DEV___0 and v571 ~= nil then
            l_console_0.error("The callback passed to act(...) function " .. "must return nil, or a Promise. You returned %s", (tostring(v571)));
        end;
        local v578, v579 = xpcall(function() --[[ Line: 3936 ]]
            -- upvalues: v207 (ref), v549 (ref), l_current_7 (copy), v557 (ref), l_IsSomeRendererActing_0 (ref), v5 (ref), l_current_8 (copy), v547 (ref), l_v547_0 (copy), l___DEV___0 (ref), l_v207_0 (copy), l_console_0 (ref)
            if v207 == 1 and (v549 == false or l_current_7 == false) then
                v557();
            end;
            v207 = v207 - 1;
            l_IsSomeRendererActing_0.current = l_current_7;
            v5.IsThisRendererActing.current = l_current_8;
            v547 = l_v547_0;
            if l___DEV___0 and l_v207_0 < v207 then
                l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
            end;
        end, l_describeError_0);
        if not v578 then
            v207 = v207 - 1;
            l_IsSomeRendererActing_0.current = l_current_7;
            v5.IsThisRendererActing.current = l_current_8;
            v547 = l_v547_0;
            if l___DEV___0 and l_v207_0 < v207 then
                l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
            end;
            error(v579);
        end;
        return {
            andThen = function(_, v581, _) --[[ Line: 3956 ]] --[[ Name: andThen ]]
                -- upvalues: l___DEV___0 (ref), l_console_0 (ref)
                if l___DEV___0 then
                    l_console_0.error("Do not await the result of calling act(...) with sync logic, it is not a Promise.");
                end;
                v581();
            end
        };
    end;
end;
v140.detachFiberAfterEffects = function(v583) --[[ Line: 3968 ]]
    -- upvalues: l___DEV___0 (copy)
    v583.child = nil;
    v583.deletions = nil;
    v583.dependencies = nil;
    v583.memoizedProps = nil;
    v583.memoizedState = nil;
    v583.pendingProps = nil;
    v583.sibling = nil;
    v583.stateNode = nil;
    v583.updateQueue = nil;
    if l___DEV___0 then
        v583._debugOwner = nil;
    end;
end;
return v5;