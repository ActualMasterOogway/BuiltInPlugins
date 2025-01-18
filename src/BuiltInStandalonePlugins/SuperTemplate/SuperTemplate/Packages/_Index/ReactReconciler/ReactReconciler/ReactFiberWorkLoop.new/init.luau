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
local v101 = require(script.Parent.RobloxReactProfiling);
local v102 = nil;
local v103 = {
    resetHooksAfterThrowRef = nil, 
    ContextOnlyDispatcherRef = nil, 
    getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = nil, 
    originalBeginWorkRef = nil, 
    completeWorkRef = nil
};
local function v107(v104, v105, v106) --[[ Line: 243 ]]
    -- upvalues: v103 (copy)
    if not v103.originalBeginWorkRef then
        v103.originalBeginWorkRef = require(script.Parent["ReactFiberBeginWork.new"]).beginWork;
    end;
    return v103.originalBeginWorkRef(v104, v105, v106);
end;
local function _(v108, v109, v110) --[[ Line: 252 ]]
    -- upvalues: v103 (copy)
    if not v103.completeWorkRef then
        v103.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
    end;
    return v103.completeWorkRef(v108, v109, v110);
end;
local v112 = nil;
local function _() --[[ Line: 262 ]] --[[ Name: initReactFiberHooks ]]
    -- upvalues: v112 (ref), v103 (copy)
    v112 = require(script.Parent["ReactFiberHooks.new"]);
    v103.resetHooksAfterThrowRef = v112.resetHooksAfterThrow;
    v103.ContextOnlyDispatcherRef = v112.ContextOnlyDispatcher;
    v103.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v112.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
end;
local function _() --[[ Line: 271 ]]
    -- upvalues: v103 (copy), v112 (ref)
    if not v103.resetHooksAfterThrowRef then
        v112 = require(script.Parent["ReactFiberHooks.new"]);
        v103.resetHooksAfterThrowRef = v112.resetHooksAfterThrow;
        v103.ContextOnlyDispatcherRef = v112.ContextOnlyDispatcher;
        v103.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v112.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    return v103.resetHooksAfterThrowRef();
end;
local function _() --[[ Line: 279 ]]
    -- upvalues: v103 (copy), v112 (ref)
    if not v103.ContextOnlyDispatcherRef then
        v112 = require(script.Parent["ReactFiberHooks.new"]);
        v103.resetHooksAfterThrowRef = v112.resetHooksAfterThrow;
        v103.ContextOnlyDispatcherRef = v112.ContextOnlyDispatcher;
        v103.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v112.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    return v103.ContextOnlyDispatcherRef;
end;
local function _() --[[ Line: 287 ]]
    -- upvalues: v103 (copy), v112 (ref)
    if not v103.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
        v112 = require(script.Parent["ReactFiberHooks.new"]);
        v103.resetHooksAfterThrowRef = v112.resetHooksAfterThrow;
        v103.ContextOnlyDispatcherRef = v112.ContextOnlyDispatcher;
        v103.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v112.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    return v103.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef();
end;
local l_createCapturedValue_0 = require(script.Parent.ReactCapturedValue).createCapturedValue;
local l_push_0 = v11.push;
local l_pop_0 = v11.pop;
local l_createCursor_0 = v11.createCursor;
local v121 = require(script.Parent["ReactProfilerTimer.new"]);
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v123 = require(script.Parent["ReactStrictModeWarnings.new"]);
local v124 = require(script.Parent.ReactCurrentFiber);
local l_current_0 = v124.current;
local l_resetCurrentFiber_0 = v124.resetCurrentFiber;
local l_setCurrentFiber_0 = v124.setCurrentFiber;
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
local v139 = nil;
local v140 = nil;
local v141 = {};
v5.NoContext = 0;
v5.RetryAfterError = 64;
local v142 = {
    Incomplete = 0, 
    FatalErrored = 1, 
    Errored = 2, 
    Suspended = 3, 
    SuspendedWithDelay = 4, 
    Completed = 5
};
local v143 = 0;
local v144 = nil;
local v145 = nil;
local l_NoLanes_0 = v8.NoLanes;
v5.subtreeRenderLanes = v8.NoLanes;
local v147 = l_createCursor_0(v8.NoLanes);
local l_Incomplete_0 = v142.Incomplete;
local v149 = nil;
local l_NoLanes_1 = v8.NoLanes;
local v151 = require(script.Parent.ReactFiberWorkInProgress);
local l_workInProgressRootSkippedLanes_0 = v151.workInProgressRootSkippedLanes;
local l_NoLanes_2 = v8.NoLanes;
local l_NoLanes_3 = v8.NoLanes;
local v155 = nil;
local v156 = 0;
local v157 = 1e999;
local v158 = nil;
local function _() --[[ Line: 423 ]] --[[ Name: resetRenderTimer ]]
    -- upvalues: v157 (ref), l_now_0 (copy)
    v157 = l_now_0() + 500;
end;
v5.getRenderTargetTime = function() --[[ Line: 427 ]]
    -- upvalues: v157 (ref)
    return v157;
end;
local v160 = false;
local v161 = nil;
local v162 = nil;
local v163 = false;
local v164 = nil;
local l_l_NoPriority_0_0 = l_NoPriority_0;
local l_NoLanes_4 = v8.NoLanes;
local v167 = nil;
local v168 = 0;
local v169 = nil;
local v170 = 0;
local v171 = nil;
local l_l_NoTimestamp_0_0 = l_NoTimestamp_0;
local l_NoLanes_5 = v8.NoLanes;
local l_NoLanes_6 = v8.NoLanes;
local v175 = nil;
local v176 = false;
v5.getWorkInProgressRoot = function() --[[ Line: 467 ]]
    -- upvalues: v144 (ref)
    return v144;
end;
v5.requestEventTime = function() --[[ Line: 471 ]]
    -- upvalues: v143 (ref), l_now_0 (copy), l_l_NoTimestamp_0_0 (ref), l_NoTimestamp_0 (copy)
    if bit32.band(v143, 48) ~= 0 then
        return l_now_0();
    elseif l_l_NoTimestamp_0_0 ~= l_NoTimestamp_0 then
        return l_l_NoTimestamp_0_0;
    else
        l_l_NoTimestamp_0_0 = l_now_0();
        return l_l_NoTimestamp_0_0;
    end;
end;
v5.requestUpdateLane = function(v177) --[[ Line: 493 ]]
    -- upvalues: v42 (copy), l_SyncLane_0 (copy), l_getCurrentPriorityLevel_0 (copy), l_ImmediatePriority_0 (copy), l_SyncBatchedLane_0 (copy), l_ReactFeatureFlags_0 (copy), v143 (ref), l_NoLanes_0 (ref), v8 (copy), l_pickArbitraryLane_0 (copy), l_NoLanes_5 (ref), l_NoLanes_1 (ref), v76 (copy), l_NoLanes_6 (ref), v155 (ref), l_findTransitionLane_0 (copy), l_UserBlockingPriority_0 (copy), l_findUpdateLane_0 (copy), l_schedulerPriorityToLanePriority_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l___DEV___0 (copy), l_console_0 (copy)
    local l_mode_0 = v177.mode;
    if bit32.band(l_mode_0, v42.BlockingMode) == v42.NoMode then
        return l_SyncLane_0;
    elseif bit32.band(l_mode_0, v42.ConcurrentMode) == v42.NoMode then
        if l_getCurrentPriorityLevel_0() == l_ImmediatePriority_0 then
            return l_SyncLane_0;
        else
            return l_SyncBatchedLane_0;
        end;
    elseif not l_ReactFeatureFlags_0.deferRenderPhaseUpdateToNextBatch and bit32.band(v143, 16) ~= 0 and l_NoLanes_0 ~= v8.NoLanes then
        return l_pickArbitraryLane_0(l_NoLanes_0);
    else
        if l_NoLanes_5 == v8.NoLanes then
            l_NoLanes_5 = l_NoLanes_1;
        end;
        if v76.requestCurrentTransition() ~= v76.NoTransition then
            if l_NoLanes_6 ~= v8.NoLanes then
                if v155 ~= nil then
                    l_NoLanes_6 = v155.pendingLanes;
                else
                    l_NoLanes_6 = v8.NoLanes;
                end;
            end;
            return l_findTransitionLane_0(l_NoLanes_5, l_NoLanes_6);
        else
            local v179 = l_getCurrentPriorityLevel_0();
            local _ = nil;
            if bit32.band(v143, 4) ~= 0 and v179 == l_UserBlockingPriority_0 then
                return (l_findUpdateLane_0(v8.InputDiscreteLanePriority, l_NoLanes_5));
            else
                local v181 = l_schedulerPriorityToLanePriority_0(v179);
                if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
                    local v182 = l_getCurrentUpdateLanePriority_0();
                    if v181 ~= v182 and v182 ~= v8.NoLanePriority and l___DEV___0 then
                        l_console_0.error("Expected current scheduler lane priority %s to match current update lane priority %s", tostring(v181), (tostring(v182)));
                    end;
                end;
                return (l_findUpdateLane_0(v181, l_NoLanes_5));
            end;
        end;
    end;
end;
requestRetryLane = function(v183) --[[ Line: 597 ]] --[[ Name: requestRetryLane ]]
    -- upvalues: v42 (copy), l_SyncLane_0 (copy), l_getCurrentPriorityLevel_0 (copy), l_ImmediatePriority_0 (copy), l_SyncBatchedLane_0 (copy), l_NoLanes_5 (ref), v8 (copy), l_NoLanes_1 (ref), l_findRetryLane_0 (copy)
    local l_mode_1 = v183.mode;
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
v5.scheduleUpdateOnFiber = function(v185, v186, v187) --[[ Line: 619 ]]
    -- upvalues: v141 (copy), l_markRootUpdated_0 (copy), v144 (ref), l_ReactFeatureFlags_0 (copy), v143 (ref), l_NoLanes_2 (ref), l_mergeLanes_0 (copy), l_Incomplete_0 (ref), v142 (copy), l_NoLanes_0 (ref), l_getCurrentPriorityLevel_0 (copy), l_SyncLane_0 (copy), v102 (ref), v157 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy), l_UserBlockingPriority_0 (copy), l_ImmediatePriority_0 (copy), v167 (ref), l_Set_0 (copy), v155 (ref)
    v141.checkForNestedUpdates();
    local v188 = v141.markUpdateLaneFromFiberToRoot(v185, v186);
    if v188 == nil then
        return nil;
    else
        l_markRootUpdated_0(v188, v186, v187);
        if v188 == v144 then
            v141.warnAboutRenderPhaseUpdatesInDEV(v185);
            if l_ReactFeatureFlags_0.deferRenderPhaseUpdateToNextBatch or bit32.band(v143, 16) == 0 then
                l_NoLanes_2 = l_mergeLanes_0(l_NoLanes_2, v186);
            end;
            if l_Incomplete_0 == v142.SuspendedWithDelay then
                v141.markRootSuspended(v188, l_NoLanes_0);
            end;
        end;
        local v189 = l_getCurrentPriorityLevel_0();
        if v186 == l_SyncLane_0 then
            if bit32.band(v143, 8) ~= 0 and bit32.band(v143, 48) == 0 then
                v141.schedulePendingInteractions(v188, v186);
                v141.performSyncWorkOnRoot(v188);
            else
                v102(v188, v187);
                v141.schedulePendingInteractions(v188, v186);
                if v143 == 0 then
                    v157 = l_now_0() + 500;
                    l_flushSyncCallbackQueue_0();
                end;
            end;
        else
            if bit32.band(v143, 4) ~= 0 and (v189 == l_UserBlockingPriority_0 or v189 == l_ImmediatePriority_0) then
                if v167 == nil then
                    v167 = l_Set_0.new({
                        v188
                    });
                else
                    v167:add(v188);
                end;
            end;
            v102(v188, v187);
            v141.schedulePendingInteractions(v188, v186);
        end;
        v155 = v188;
        return v188;
    end;
end;
v141.markUpdateLaneFromFiberToRoot = function(v190, v191) --[[ Line: 729 ]]
    -- upvalues: l_mergeLanes_0 (copy), l___DEV___0 (copy), v45 (copy), v141 (copy), v43 (copy)
    v190.lanes = l_mergeLanes_0(v190.lanes, v191);
    local l_alternate_0 = v190.alternate;
    if l_alternate_0 ~= nil then
        l_alternate_0.lanes = l_mergeLanes_0(l_alternate_0.lanes, v191);
    end;
    if l___DEV___0 and l_alternate_0 == nil and bit32.band(v190.flags, (bit32.bor(v45.Placement, v45.Hydrating))) ~= v45.NoFlags then
        v141.warnAboutUpdateOnNotYetMountedFiberInDEV(v190);
    end;
    local l_v190_0 = v190;
    local l_return__0 = v190.return_;
    while l_return__0 ~= nil do
        l_return__0.childLanes = l_mergeLanes_0(l_return__0.childLanes, v191);
        l_alternate_0 = l_return__0.alternate;
        if l_alternate_0 ~= nil then
            l_alternate_0.childLanes = l_mergeLanes_0(l_alternate_0.childLanes, v191);
        elseif l___DEV___0 and bit32.band(l_return__0.flags, (bit32.bor(v45.Placement, v45.Hydrating))) ~= v45.NoFlags then
            v141.warnAboutUpdateOnNotYetMountedFiberInDEV(v190);
        end;
        l_v190_0 = l_return__0;
        l_return__0 = l_return__0.return_;
    end;
    if l_v190_0.tag == v43.HostRoot then
        return l_v190_0.stateNode;
    else
        return nil;
    end;
end;
v102 = function(v195, v196) --[[ Line: 784 ]]
    -- upvalues: l_markStarvedLanesAsExpired_0 (copy), v144 (ref), l_NoLanes_0 (ref), v8 (copy), l_getNextLanes_0 (copy), l_returnNextLanesPriority_0 (copy), l_cancelCallback_0 (copy), l_scheduleSyncCallback_0 (copy), v101 (copy), v141 (copy), l_scheduleCallback_0 (copy), l_ImmediatePriority_0 (copy), l_lanePriorityToSchedulerPriority_0 (copy)
    local l_callbackNode_0 = v195.callbackNode;
    l_markStarvedLanesAsExpired_0(v195, v196);
    local v198 = nil;
    v198 = if v195 == v144 then l_NoLanes_0 else v8.NoLanes;
    local v199 = l_getNextLanes_0(v195, v198);
    local v200 = l_returnNextLanesPriority_0();
    if v199 == v8.NoLanes then
        if l_callbackNode_0 ~= nil then
            l_cancelCallback_0(l_callbackNode_0);
            v195.callbackNode = nil;
            v195.callbackPriority = v8.NoLanePriority;
        end;
        return;
    else
        if l_callbackNode_0 ~= nil then
            if v195.callbackPriority == v200 then
                return;
            else
                l_cancelCallback_0(l_callbackNode_0);
            end;
        end;
        local v201 = nil;
        if v200 == v8.SyncLanePriority then
            v201 = l_scheduleSyncCallback_0(function() --[[ Line: 829 ]]
                -- upvalues: v101 (ref), v195 (copy), v141 (ref)
                local v202 = v101.profileRootBeforeUnitOfWork(v195);
                local v203 = v141.performSyncWorkOnRoot(v195);
                v101.profileRootAfterYielding(v202);
                return v203;
            end);
        elseif v200 == v8.SyncBatchedLanePriority then
            v201 = l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 837 ]]
                -- upvalues: v101 (ref), v195 (copy), v141 (ref)
                local v204 = v101.profileRootBeforeUnitOfWork(v195);
                local v205 = v141.performSyncWorkOnRoot(v195);
                v101.profileRootAfterYielding(v204);
                return v205;
            end);
        else
            local v206 = l_lanePriorityToSchedulerPriority_0(v200);
            v201 = l_scheduleCallback_0(v206, function() --[[ Line: 847 ]]
                -- upvalues: v101 (ref), v195 (copy), v141 (ref)
                local v207 = v101.profileRootBeforeUnitOfWork(v195);
                local v208 = v141.performConcurrentWorkOnRoot(v195);
                v101.profileRootAfterYielding(v207);
                return v208;
            end);
        end;
        v195.callbackPriority = v200;
        v195.callbackNode = v201;
        return;
    end;
end;
v141.performConcurrentWorkOnRoot = function(v209) --[[ Line: 863 ]]
    -- upvalues: l_l_NoTimestamp_0_0 (ref), l_NoTimestamp_0 (copy), l_NoLanes_5 (ref), v8 (copy), l_NoLanes_6 (ref), l_invariant_0 (copy), v143 (ref), v5 (copy), l_getNextLanes_0 (copy), v144 (ref), l_NoLanes_0 (ref), v141 (copy), l_includesSomeLane_0 (copy), l_NoLanes_1 (ref), l_NoLanes_2 (ref), v142 (copy), v40 (copy), l_getLanesToRetrySynchronouslyOnError_0 (copy), v149 (ref), v102 (ref), l_now_0 (copy)
    l_l_NoTimestamp_0_0 = l_NoTimestamp_0;
    l_NoLanes_5 = v8.NoLanes;
    l_NoLanes_6 = v8.NoLanes;
    l_invariant_0(bit32.band(v143, 48) == 0, "Should not already be working.");
    local l_callbackNode_1 = v209.callbackNode;
    if v5.flushPassiveEffects() and v209.callbackNode ~= l_callbackNode_1 then
        return nil;
    else
        local v211 = l_getNextLanes_0(v209, if v209 == v144 then l_NoLanes_0 else v8.NoLanes);
        if v211 == v8.NoLanes then
            return nil;
        else
            local v212 = v141.renderRootConcurrent(v209, v211);
            if l_includesSomeLane_0(l_NoLanes_1, l_NoLanes_2) then
                v141.prepareFreshStack(v209, v8.NoLanes);
            elseif v212 ~= v142.Incomplete then
                if v212 == v142.Errored then
                    v143 = bit32.bor(v143, 64);
                    if v209.hydrate then
                        v209.hydrate = false;
                        v40.clearContainer(v209.containerInfo);
                    end;
                    v211 = l_getLanesToRetrySynchronouslyOnError_0(v209);
                    if v211 ~= v8.NoLanes then
                        v212 = v141.renderRootSync(v209, v211);
                    end;
                end;
                if v212 == v142.FatalErrored then
                    local l_v149_0 = v149;
                    v141.prepareFreshStack(v209, v8.NoLanes);
                    v141.markRootSuspended(v209, v211);
                    v102(v209, l_now_0());
                    error(l_v149_0);
                end;
                v209.finishedWork = v209.current.alternate;
                v209.finishedLanes = v211;
                v141.finishConcurrentRender(v209, v212, v211);
            end;
            v102(v209, l_now_0());
            if v209.callbackNode == l_callbackNode_1 then
                return function() --[[ Line: 958 ]]
                    -- upvalues: v141 (ref), v209 (copy)
                    return v141.performConcurrentWorkOnRoot(v209);
                end;
            else
                return nil;
            end;
        end;
    end;
end;
local v214 = 0;
local v215 = false;
shouldForceFlushFallbacksInDEV = function() --[[ Line: 971 ]] --[[ Name: shouldForceFlushFallbacksInDEV ]]
    -- upvalues: l___DEV___0 (copy), v214 (ref)
    return l___DEV___0 and v214 > 0;
end;
v141.finishConcurrentRender = function(v216, v217, v218) --[[ Line: 976 ]]
    -- upvalues: v142 (copy), l_invariant_0 (copy), v141 (copy), l_includesOnlyRetries_0 (copy), v156 (ref), l_now_0 (copy), l_getNextLanes_0 (copy), v8 (copy), l_isSubsetOfLanes_0 (copy), v5 (copy), l_markRootPinged_0 (copy), v40 (copy), l_includesOnlyTransitions_0 (copy), l_getMostRecentEventTime_0 (copy)
    if v217 == v142.Incomplete or v217 == v142.FatalErrored then
        l_invariant_0(false, "Root did not complete. This is a bug in React.");
        return;
    elseif v217 == v142.Errored then
        v141.commitRoot(v216);
        return;
    elseif v217 == v142.Suspended then
        v141.markRootSuspended(v216, v218);
        if l_includesOnlyRetries_0(v218) and not shouldForceFlushFallbacksInDEV() then
            local v219 = v156 + 500 - l_now_0();
            if v219 > 10 then
                if l_getNextLanes_0(v216, v8.NoLanes) ~= v8.NoLanes then
                    return;
                else
                    local l_suspendedLanes_0 = v216.suspendedLanes;
                    if not l_isSubsetOfLanes_0(l_suspendedLanes_0, v218) then
                        local v221 = v5.requestEventTime();
                        l_markRootPinged_0(v216, l_suspendedLanes_0, v221);
                        return;
                    else
                        v216.timeoutHandle = v40.scheduleTimeout(function() --[[ Line: 1025 ]]
                            -- upvalues: v141 (ref), v216 (copy)
                            return v141.commitRoot(v216);
                        end, v219);
                        return;
                    end;
                end;
            end;
        end;
        v141.commitRoot(v216);
        return;
    elseif v217 == v142.SuspendedWithDelay then
        v141.markRootSuspended(v216, v218);
        if l_includesOnlyTransitions_0(v218) then
            return;
        else
            if not shouldForceFlushFallbacksInDEV() then
                local v222 = l_getMostRecentEventTime_0(v216, v218);
                local v223 = l_now_0() - v222;
                local v224 = jnd(v223) - v223;
                if v224 > 10 then
                    v216.timeoutHandle = v40.scheduleTimeout(function() --[[ Line: 1060 ]]
                        -- upvalues: v141 (ref), v216 (copy)
                        return v141.commitRoot(v216);
                    end, v224);
                    return;
                end;
            end;
            v141.commitRoot(v216);
            return;
        end;
    elseif v217 == v142.Completed then
        v141.commitRoot(v216);
        return;
    else
        l_invariant_0(false, "Unknown root exit status.");
        return;
    end;
end;
v141.markRootSuspended = function(v225, v226) --[[ Line: 1076 ]]
    -- upvalues: l_removeLanes_0 (copy), l_NoLanes_3 (ref), l_NoLanes_2 (ref), l_markRootSuspended_0 (copy)
    v226 = l_removeLanes_0(v226, l_NoLanes_3);
    v226 = l_removeLanes_0(v226, l_NoLanes_2);
    l_markRootSuspended_0(v225, v226);
end;
v141.performSyncWorkOnRoot = function(v227) --[[ Line: 1088 ]]
    -- upvalues: l_invariant_0 (copy), v143 (ref), v5 (copy), v144 (ref), l_includesSomeLane_0 (copy), l_NoLanes_0 (ref), v141 (copy), l_NoLanes_1 (ref), l_NoLanes_2 (ref), l_getNextLanes_0 (copy), v8 (copy), l_LegacyRoot_0 (copy), v142 (copy), v40 (copy), l_getLanesToRetrySynchronouslyOnError_0 (copy), v149 (ref), v102 (ref), l_now_0 (copy)
    l_invariant_0(bit32.band(v143, 48) == 0, "Should not already be working.");
    v5.flushPassiveEffects();
    local v228 = nil;
    local v229 = nil;
    if v227 == v144 and l_includesSomeLane_0(v227.expiredLanes, l_NoLanes_0) then
        v228 = l_NoLanes_0;
        v229 = v141.renderRootSync(v227, v228);
        if l_includesSomeLane_0(l_NoLanes_1, l_NoLanes_2) then
            v228 = l_getNextLanes_0(v227, v228);
            v229 = v141.renderRootSync(v227, v228);
        end;
    else
        v228 = l_getNextLanes_0(v227, v8.NoLanes);
        v229 = v141.renderRootSync(v227, v228);
    end;
    if v227.tag ~= l_LegacyRoot_0 and v229 == v142.Errored then
        v143 = bit32.bor(v143, 64);
        if v227.hydrate then
            v227.hydrate = false;
            v40.clearContainer(v227.containerInfo);
        end;
        v228 = l_getLanesToRetrySynchronouslyOnError_0(v227);
        if v228 ~= v8.NoLanes then
            v229 = v141.renderRootSync(v227, v228);
        end;
    end;
    if v229 == v142.FatalErrored then
        local l_v149_1 = v149;
        v141.prepareFreshStack(v227, v8.NoLanes);
        v141.markRootSuspended(v227, v228);
        v102(v227, l_now_0());
        error(l_v149_1);
    end;
    v227.finishedWork = v227.current.alternate;
    v227.finishedLanes = v228;
    v141.commitRoot(v227);
    v102(v227, l_now_0());
    return nil;
end;
v5.flushRoot = function(v231, v232) --[[ Line: 1170 ]]
    -- upvalues: l_markRootExpired_0 (copy), v102 (ref), l_now_0 (copy), v143 (ref), v157 (ref), l_flushSyncCallbackQueue_0 (copy)
    l_markRootExpired_0(v231, v232);
    v102(v231, l_now_0());
    if bit32.band(v143, 48) == 0 then
        v157 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
end;
v5.getExecutionContext = function() --[[ Line: 1182 ]]
    -- upvalues: v143 (ref)
    return v143;
end;
v5.flushDiscreteUpdates = function() --[[ Line: 1186 ]]
    -- upvalues: v143 (ref), l___DEV___0 (copy), l_console_0 (copy), v141 (copy), v5 (copy)
    if bit32.band(v143, 49) ~= 0 then
        if l___DEV___0 and bit32.band(v143, 16) ~= 0 then
            l_console_0.error("unstable_flushDiscreteUpdates: Cannot flush updates when React is " .. "already rendering.");
        end;
        return;
    else
        v141.flushPendingDiscreteUpdates();
        v5.flushPassiveEffects();
        return;
    end;
end;
v5.deferredUpdates = function(v233) --[[ Line: 1216 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l___YOLO___0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v8 (copy), l_runWithPriority_0 (copy), l_describeError_0 (copy), l_NormalPriority_0 (copy)
    if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        local v234 = l_getCurrentUpdateLanePriority_0();
        local v235 = nil;
        local v236 = nil;
        if not l___YOLO___0 then
            l_setCurrentUpdateLanePriority_0(v8.DefaultLanePriority);
            local v237, v238 = xpcall(l_runWithPriority_0, l_describeError_0, l_NormalPriority_0, v233);
            v235 = v237;
            v236 = v238;
        else
            v235 = true;
            l_setCurrentUpdateLanePriority_0(v8.DefaultLanePriority);
            v236 = l_runWithPriority_0(l_NormalPriority_0, v233);
        end;
        l_setCurrentUpdateLanePriority_0(v234);
        if v235 then
            return v236;
        else
            error(v236);
            return;
        end;
    else
        return l_runWithPriority_0(l_NormalPriority_0, v233);
    end;
end;
v141.flushPendingDiscreteUpdates = function() --[[ Line: 1245 ]]
    -- upvalues: v167 (ref), l_markDiscreteUpdatesExpired_0 (copy), v102 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    if v167 ~= nil then
        local l_v167_0 = v167;
        v167 = nil;
        l_v167_0:forEach(function(v240) --[[ Line: 1251 ]]
            -- upvalues: l_markDiscreteUpdatesExpired_0 (ref), v102 (ref), l_now_0 (ref)
            l_markDiscreteUpdatesExpired_0(v240);
            v102(v240, l_now_0());
        end);
    end;
    l_flushSyncCallbackQueue_0();
end;
v5.batchedUpdates = function(v241, v242) --[[ Line: 1260 ]]
    -- upvalues: v143 (ref), l___YOLO___0 (copy), l_describeError_0 (copy), v157 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v143_0 = v143;
    v143 = bit32.bor(v143, 1);
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
    v143 = l_v143_0;
    if v143 == 0 then
        v157 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if v244 then
        return v245;
    else
        error(v245);
        return;
    end;
end;
v5.batchedEventUpdates = function(v248, v249) --[[ Line: 1288 ]]
    -- upvalues: v143 (ref), l___YOLO___0 (copy), l_describeError_0 (copy), v157 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v143_1 = v143;
    v143 = bit32.bor(v143, 2);
    local v251 = nil;
    local v252 = nil;
    if not l___YOLO___0 then
        local v253, v254 = xpcall(v248, l_describeError_0, v249);
        v251 = v253;
        v252 = v254;
    else
        v251 = true;
        v252 = v248(v249);
    end;
    v143 = l_v143_1;
    if v143 == 0 then
        v157 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if v251 then
        return v252;
    else
        error(v252);
        return;
    end;
end;
v5.discreteUpdates = function(v255, v256, v257, v258, v259) --[[ Line: 1317 ]]
    -- upvalues: v143 (ref), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v8 (copy), l_runWithPriority_0 (copy), l_describeError_0 (copy), l_UserBlockingPriority_0 (copy), v157 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v143_2 = v143;
    v143 = bit32.bor(v143, 4);
    if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        local v261 = l_getCurrentUpdateLanePriority_0();
        l_setCurrentUpdateLanePriority_0(v8.InputDiscreteLanePriority);
        local v262, v263 = xpcall(l_runWithPriority_0, l_describeError_0, l_UserBlockingPriority_0, function() --[[ Line: 1329 ]]
            -- upvalues: v255 (copy), v256 (copy), v257 (copy), v258 (copy), v259 (copy)
            return v255(v256, v257, v258, v259);
        end);
        l_setCurrentUpdateLanePriority_0(v261);
        v143 = l_v143_2;
        if v143 == 0 then
            v157 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if v262 then
            return v263;
        else
            error(v263);
            return;
        end;
    else
        local v264, v265 = xpcall(l_runWithPriority_0, l_describeError_0, l_UserBlockingPriority_0, function() --[[ Line: 1353 ]]
            -- upvalues: v255 (copy), v256 (copy), v257 (copy), v258 (copy), v259 (copy)
            return v255(v256, v257, v258, v259);
        end);
        v143 = l_v143_2;
        if v143 == 0 then
            v157 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if v264 then
            return v265;
        else
            error(v265);
            return;
        end;
    end;
end;
v5.unbatchedUpdates = function(v266, v267) --[[ Line: 1374 ]]
    -- upvalues: v143 (ref), l___YOLO___0 (copy), l_describeError_0 (copy), v157 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v143_3 = v143;
    v143 = bit32.band(v143, 4294967294);
    v143 = bit32.bor(v143, 8);
    local v269 = nil;
    local v270 = nil;
    if not l___YOLO___0 then
        local v271, v272 = xpcall(v266, l_describeError_0, v267);
        v269 = v271;
        v270 = v272;
    else
        v269 = true;
        v270 = v266(v267);
    end;
    v143 = l_v143_3;
    if v143 == 0 then
        v157 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if v269 then
        return v270;
    else
        error(v270);
        return;
    end;
end;
v5.flushSync = function(v273, v274) --[[ Line: 1402 ]]
    -- upvalues: v143 (ref), l___DEV___0 (copy), l_console_0 (copy), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v8 (copy), l___YOLO___0 (copy), l_runWithPriority_0 (copy), l_describeError_0 (copy), l_ImmediatePriority_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v143_4 = v143;
    if bit32.band(l_v143_4, 48) ~= 0 then
        if l___DEV___0 then
            l_console_0.error("flushSync was called from inside a lifecycle method. React cannot " .. "flush when React is already rendering. Consider moving this call to " .. "a scheduler task or micro task.");
        end;
        return v273(v274);
    else
        v143 = bit32.bor(v143, 1);
        if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
            local v276 = l_getCurrentUpdateLanePriority_0();
            l_setCurrentUpdateLanePriority_0(v8.SyncLanePriority);
            local v277 = nil;
            local v278 = nil;
            if not l___YOLO___0 then
                if v273 then
                    local v279, v280 = xpcall(l_runWithPriority_0, l_describeError_0, l_ImmediatePriority_0, function() --[[ Line: 1432 ]]
                        -- upvalues: v273 (copy), v274 (copy)
                        return v273(v274);
                    end);
                    v277 = v279;
                    v278 = v280;
                else
                    v277 = true;
                    v278 = nil;
                end;
            else
                v277 = true;
                l_setCurrentUpdateLanePriority_0(v8.SyncLanePriority);
                v278 = if v273 then l_runWithPriority_0(l_ImmediatePriority_0, function() --[[ Line: 1445 ]]
                    -- upvalues: v273 (copy), v274 (copy)
                    return v273(v274);
                end) else nil;
            end;
            l_setCurrentUpdateLanePriority_0(v276);
            v143 = l_v143_4;
            l_flushSyncCallbackQueue_0();
            if not v277 then
                error(v278);
            end;
            return v278;
        else
            local v281 = nil;
            local v282 = nil;
            if not l___YOLO___0 then
                if v273 then
                    local v283, v284 = xpcall(l_runWithPriority_0, l_describeError_0, l_ImmediatePriority_0, function() --[[ Line: 1475 ]]
                        -- upvalues: v273 (copy), v274 (copy)
                        return v273(v274);
                    end);
                    v281 = v283;
                    v282 = v284;
                else
                    v281 = true;
                    v282 = nil;
                end;
            else
                v281 = true;
                v282 = if v273 then l_runWithPriority_0(l_ImmediatePriority_0, function() --[[ Line: 1487 ]]
                    -- upvalues: v273 (copy), v274 (copy)
                    return v273(v274);
                end) else nil;
            end;
            v143 = l_v143_4;
            l_flushSyncCallbackQueue_0();
            if not v281 then
                error(v282);
            end;
            return v282;
        end;
    end;
end;
v5.flushControlled = function(v285) --[[ Line: 1508 ]]
    -- upvalues: v143 (ref), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v8 (copy), l_runWithPriority_0 (copy), l_describeError_0 (copy), l_ImmediatePriority_0 (copy), v157 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v143_5 = v143;
    v143 = bit32.bor(v143, 1);
    if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        local v287 = l_getCurrentUpdateLanePriority_0();
        l_setCurrentUpdateLanePriority_0(v8.SyncLanePriority);
        local v288, v289 = xpcall(l_runWithPriority_0, l_describeError_0, l_ImmediatePriority_0, v285);
        l_setCurrentUpdateLanePriority_0(v287);
        v143 = l_v143_5;
        if v143 == 0 then
            v157 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if not v288 then
            error(v289);
            return;
        end;
    else
        local v290, v291 = xpcall(l_runWithPriority_0, l_describeError_0, l_ImmediatePriority_0, v285);
        v143 = l_v143_5;
        if v143 == 0 then
            v157 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if not v290 then
            error(v291);
        end;
    end;
end;
v5.pushRenderLanes = function(v292, v293) --[[ Line: 1548 ]]
    -- upvalues: l_push_0 (copy), v147 (copy), v5 (copy), l_mergeLanes_0 (copy), l_NoLanes_1 (ref)
    l_push_0(v147, v5.subtreeRenderLanes, v292);
    v5.subtreeRenderLanes = l_mergeLanes_0(v5.subtreeRenderLanes, v293);
    l_NoLanes_1 = l_mergeLanes_0(l_NoLanes_1, v293);
end;
v5.popRenderLanes = function(v294) --[[ Line: 1554 ]]
    -- upvalues: v5 (copy), v147 (copy), l_pop_0 (copy)
    v5.subtreeRenderLanes = v147.current;
    l_pop_0(v147, v294);
end;
v141.prepareFreshStack = function(v295, v296) --[[ Line: 1559 ]]
    -- upvalues: v8 (copy), v40 (copy), v145 (ref), l_unwindInterruptedWork_0 (copy), v144 (ref), v41 (copy), l_NoLanes_0 (ref), v5 (copy), l_NoLanes_1 (ref), l_Incomplete_0 (ref), v142 (copy), v149 (ref), l_workInProgressRootSkippedLanes_0 (copy), l_NoLanes_2 (ref), l_NoLanes_3 (ref), l_ReactFeatureFlags_0 (copy), v171 (ref), l___DEV___0 (copy), v123 (copy)
    v295.finishedWork = nil;
    v295.finishedLanes = v8.NoLanes;
    local l_timeoutHandle_0 = v295.timeoutHandle;
    if l_timeoutHandle_0 ~= v40.noTimeout then
        v295.timeoutHandle = v40.noTimeout;
        v40.cancelTimeout(l_timeoutHandle_0);
    end;
    if v145 ~= nil then
        local l_return__1 = v145.return_;
        while l_return__1 ~= nil do
            l_unwindInterruptedWork_0(l_return__1);
            l_return__1 = l_return__1.return_;
        end;
    end;
    v144 = v295;
    v145 = v41.createWorkInProgress(v295.current, nil);
    l_NoLanes_0 = v296;
    v5.subtreeRenderLanes = v296;
    l_NoLanes_1 = v296;
    l_Incomplete_0 = v142.Incomplete;
    v149 = nil;
    l_workInProgressRootSkippedLanes_0(v8.NoLanes);
    l_NoLanes_2 = v8.NoLanes;
    l_NoLanes_3 = v8.NoLanes;
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        v171 = nil;
    end;
    if l___DEV___0 then
        v123.discardPendingWarnings();
    end;
end;
v141.handleError = function(v299, v300) --[[ Line: 1599 ]]
    -- upvalues: v145 (ref), l_resetContextDependencies_0 (copy), v103 (copy), v112 (ref), l_resetCurrentFiber_0 (copy), l_ReactCurrentOwner_0 (copy), l_Incomplete_0 (ref), v142 (copy), v149 (ref), l_ReactFeatureFlags_0 (copy), v42 (copy), v121 (copy), l_throwException_0 (copy), l_NoLanes_0 (ref), v5 (copy), v141 (copy)
    while true do
        local l_v145_0 = v145;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 1603 ]]
            -- upvalues: l_resetContextDependencies_0 (ref), v103 (ref), v112 (ref), l_resetCurrentFiber_0 (ref), l_ReactCurrentOwner_0 (ref), l_v145_0 (ref), l_Incomplete_0 (ref), v142 (ref), v149 (ref), v300 (ref), v145 (ref), l_ReactFeatureFlags_0 (ref), v42 (ref), v121 (ref), l_throwException_0 (ref), v299 (copy), l_NoLanes_0 (ref), v5 (ref), v141 (ref)
            l_resetContextDependencies_0();
            if not v103.resetHooksAfterThrowRef then
                v112 = require(script.Parent["ReactFiberHooks.new"]);
                v103.resetHooksAfterThrowRef = v112.resetHooksAfterThrow;
                v103.ContextOnlyDispatcherRef = v112.ContextOnlyDispatcher;
                v103.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v112.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
            end;
            local _ = v103.resetHooksAfterThrowRef();
            l_resetCurrentFiber_0();
            l_ReactCurrentOwner_0.current = nil;
            if l_v145_0 == nil or l_v145_0.return_ == nil then
                l_Incomplete_0 = v142.FatalErrored;
                v149 = v300;
                v145 = nil;
                return;
            else
                if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(l_v145_0.mode, v42.ProfileMode) ~= 0 then
                    v121.stopProfilerTimerIfRunningAndRecordDelta(l_v145_0, true);
                end;
                l_throwException_0(v299, l_v145_0.return_, l_v145_0, v300, l_NoLanes_0, v5.onUncaughtError, v5.renderDidError);
                v141.completeUnitOfWork(l_v145_0);
                return;
            end;
        end);
        if not l_status_0 then
            v300 = l_result_0;
            if v145 == l_v145_0 and l_v145_0 ~= nil then
                l_v145_0 = l_v145_0.return_;
                v145 = l_v145_0;
            else
                l_v145_0 = v145;
            end;
            --[[ close >= 2 ]]
        else
            break;
        end;
    end;
end;
v141.pushDispatcher = function() --[[ Line: 1678 ]]
    -- upvalues: l_ReactCurrentDispatcher_0 (copy), v103 (copy), v112 (ref)
    local l_current_1 = l_ReactCurrentDispatcher_0.current;
    local l_l_ReactCurrentDispatcher_0_0 = l_ReactCurrentDispatcher_0;
    if not v103.ContextOnlyDispatcherRef then
        v112 = require(script.Parent["ReactFiberHooks.new"]);
        v103.resetHooksAfterThrowRef = v112.resetHooksAfterThrow;
        v103.ContextOnlyDispatcherRef = v112.ContextOnlyDispatcher;
        v103.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v112.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    l_l_ReactCurrentDispatcher_0_0.current = v103.ContextOnlyDispatcherRef;
    if l_current_1 == nil then
        if not v103.ContextOnlyDispatcherRef then
            v112 = require(script.Parent["ReactFiberHooks.new"]);
            v103.resetHooksAfterThrowRef = v112.resetHooksAfterThrow;
            v103.ContextOnlyDispatcherRef = v112.ContextOnlyDispatcher;
            v103.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v112.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
        end;
        return v103.ContextOnlyDispatcherRef;
    else
        return l_current_1;
    end;
end;
v141.popDispatcher = function(v307) --[[ Line: 1695 ]]
    -- upvalues: l_ReactCurrentDispatcher_0 (copy)
    l_ReactCurrentDispatcher_0.current = v307;
end;
v141.pushInteractions = function(v308) --[[ Line: 1699 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___interactionsRef_0 (copy)
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        local l_current_2 = l___interactionsRef_0.current;
        l___interactionsRef_0.current = v308.memoizedInteractions;
        return l_current_2;
    else
        return nil;
    end;
end;
v141.popInteractions = function(v310) --[[ Line: 1708 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___interactionsRef_0 (copy)
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        l___interactionsRef_0.current = v310;
    end;
end;
v5.markCommitTimeOfFallback = function() --[[ Line: 1714 ]]
    -- upvalues: v156 (ref), l_now_0 (copy)
    v156 = l_now_0();
end;
v5.markSkippedUpdateLanes = function(v311) --[[ Line: 1718 ]]
    -- upvalues: v151 (copy)
    v151.markSkippedUpdateLanes(v311);
end;
v5.renderDidSuspend = function() --[[ Line: 1722 ]]
    -- upvalues: l_Incomplete_0 (ref), v142 (copy)
    if l_Incomplete_0 == v142.Incomplete then
        l_Incomplete_0 = v142.Suspended;
    end;
end;
v5.renderDidSuspendDelayIfPossible = function() --[[ Line: 1728 ]]
    -- upvalues: l_Incomplete_0 (ref), v142 (copy), v144 (ref), l_includesNonIdleWork_0 (copy), l_workInProgressRootSkippedLanes_0 (copy), l_NoLanes_2 (ref), v141 (copy), l_NoLanes_0 (ref)
    if l_Incomplete_0 == v142.Incomplete or l_Incomplete_0 == v142.Suspended then
        l_Incomplete_0 = v142.SuspendedWithDelay;
    end;
    if v144 ~= nil and (l_includesNonIdleWork_0(l_workInProgressRootSkippedLanes_0()) or l_includesNonIdleWork_0(l_NoLanes_2)) then
        v141.markRootSuspended(v144, l_NoLanes_0);
    end;
end;
v5.renderDidError = function() --[[ Line: 1756 ]]
    -- upvalues: l_Incomplete_0 (ref), v142 (copy)
    if l_Incomplete_0 ~= v142.Completed then
        l_Incomplete_0 = v142.Errored;
    end;
end;
v5.renderHasNotSuspendedYet = function() --[[ Line: 1764 ]]
    -- upvalues: l_Incomplete_0 (ref), v142 (copy)
    return l_Incomplete_0 == v142.Incomplete;
end;
v141.renderRootSync = function(v312, v313) --[[ Line: 1770 ]]
    -- upvalues: v143 (ref), v141 (copy), v144 (ref), l_NoLanes_0 (ref), l___DEV___0 (copy), l_enableDebugTracing_0 (copy), v35 (copy), l_enableSchedulingProfiler_0 (copy), v36 (copy), l___YOLO___0 (copy), l_describeError_0 (copy), l_resetContextDependencies_0 (copy), l_ReactFeatureFlags_0 (copy), v145 (ref), l_invariant_0 (copy), v8 (copy), l_Incomplete_0 (ref)
    local l_v143_6 = v143;
    v143 = bit32.bor(v143, 16);
    local v315 = v141.pushDispatcher();
    if v144 ~= v312 or l_NoLanes_0 ~= v313 then
        v141.prepareFreshStack(v312, v313);
        v141.startWorkOnPendingInteractions(v312, v313);
    end;
    local v316 = v141.pushInteractions(v312);
    if l___DEV___0 and l_enableDebugTracing_0 then
        v35.logRenderStarted(v313);
    end;
    if l_enableSchedulingProfiler_0 then
        v36.markRenderStarted(v313);
    end;
    while true do
        local v317 = nil;
        local v318 = nil;
        if not l___YOLO___0 then
            local v319, v320 = xpcall(v141.workLoopSync, l_describeError_0);
            v317 = v319;
            v318 = v320;
        else
            v317 = true;
            v141.workLoopSync();
        end;
        if not v317 then
            v141.handleError(v312, v318);
        else
            break;
        end;
    end;
    l_resetContextDependencies_0();
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        v141.popInteractions(v316);
    end;
    v143 = l_v143_6;
    v141.popDispatcher(v315);
    if v145 ~= nil then
        l_invariant_0(false, "Cannot commit an incomplete root. This error is likely caused by a " .. "bug in React. Please file an issue.");
    end;
    if l___DEV___0 and l_enableDebugTracing_0 then
        v35.logRenderStopped();
    end;
    if l_enableSchedulingProfiler_0 then
        v36.markRenderStopped();
    end;
    v144 = nil;
    l_NoLanes_0 = v8.NoLanes;
    return l_Incomplete_0;
end;
v141.workLoopSync = function() --[[ Line: 1846 ]]
    -- upvalues: v145 (ref), v141 (copy)
    while v145 ~= nil do
        v141.performUnitOfWork(v145);
    end;
end;
v141.renderRootConcurrent = function(v321, v322) --[[ Line: 1853 ]]
    -- upvalues: v143 (ref), v141 (copy), v144 (ref), l_NoLanes_0 (ref), v157 (ref), l_now_0 (copy), l___DEV___0 (copy), l_enableDebugTracing_0 (copy), v35 (copy), l_enableSchedulingProfiler_0 (copy), v36 (copy), l___YOLO___0 (copy), l_describeError_0 (copy), l_resetContextDependencies_0 (copy), l_ReactFeatureFlags_0 (copy), v145 (ref), v142 (copy), v8 (copy), l_Incomplete_0 (ref)
    local l_v143_7 = v143;
    v143 = bit32.bor(v143, 16);
    local v324 = v141.pushDispatcher();
    if v144 ~= v321 or l_NoLanes_0 ~= v322 then
        v157 = l_now_0() + 500;
        v141.prepareFreshStack(v321, v322);
        v141.startWorkOnPendingInteractions(v321, v322);
    end;
    local v325 = v141.pushInteractions(v321);
    if l___DEV___0 and l_enableDebugTracing_0 then
        v35.logRenderStarted(v322);
    end;
    if l_enableSchedulingProfiler_0 then
        v36.markRenderStarted(v322);
    end;
    while true do
        local v326 = nil;
        local v327 = nil;
        if not l___YOLO___0 then
            local v328, v329 = xpcall(v141.workLoopConcurrent, l_describeError_0);
            v326 = v328;
            v327 = v329;
            if v326 then
                v327 = "break";
            end;
        else
            v326 = true;
            v327 = "break";
            v141.workLoopConcurrent();
        end;
        if v327 ~= "break" then
            if not v326 then
                v141.handleError(v321, v327);
            end;
        else
            break;
        end;
    end;
    l_resetContextDependencies_0();
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        v141.popInteractions(v325);
    end;
    v141.popDispatcher(v324);
    v143 = l_v143_7;
    if l___DEV___0 and l_enableDebugTracing_0 then
        v35.logRenderStopped();
    end;
    if v145 ~= nil then
        if l_enableSchedulingProfiler_0 then
            v36.markRenderYielded();
        end;
        return v142.Incomplete;
    else
        if l_enableSchedulingProfiler_0 then
            v36.markRenderStopped();
        end;
        v144 = nil;
        l_NoLanes_0 = v8.NoLanes;
        return l_Incomplete_0;
    end;
end;
v141.workLoopConcurrent = function() --[[ Line: 1937 ]]
    -- upvalues: v145 (ref), l_shouldYield_0 (copy), v141 (copy)
    while v145 ~= nil and not l_shouldYield_0() do
        v141.performUnitOfWork(v145);
    end;
end;
v141.performUnitOfWork = function(v330) --[[ Line: 1944 ]]
    -- upvalues: v101 (copy), l_setCurrentFiber_0 (copy), l_ReactFeatureFlags_0 (copy), v42 (copy), v121 (copy), v141 (copy), v5 (copy), l_resetCurrentFiber_0 (copy), v145 (ref), l_ReactCurrentOwner_0 (copy)
    local v331 = v101.profileUnitOfWorkBefore(v330);
    local l_alternate_1 = v330.alternate;
    l_setCurrentFiber_0(v330);
    local v333 = nil;
    if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(v330.mode, v42.ProfileMode) ~= v42.NoMode then
        v121.startProfilerTimer(v330);
        v333 = v141.beginWork(l_alternate_1, v330, v5.subtreeRenderLanes);
        v121.stopProfilerTimerIfRunningAndRecordDelta(v330, true);
    else
        v333 = v141.beginWork(l_alternate_1, v330, v5.subtreeRenderLanes);
    end;
    l_resetCurrentFiber_0();
    v330.memoizedProps = v330.pendingProps;
    if v333 == nil then
        v141.completeUnitOfWork(v330);
    else
        v145 = v333;
    end;
    l_ReactCurrentOwner_0.current = nil;
    v101.profileUnitOfWorkAfter(v331);
end;
v141.completeUnitOfWork = function(v334) --[[ Line: 1982 ]]
    -- upvalues: v45 (copy), l_setCurrentFiber_0 (copy), l_ReactFeatureFlags_0 (copy), v42 (copy), v5 (copy), v103 (copy), v121 (copy), l_resetCurrentFiber_0 (copy), v145 (ref), l_unwindWork_0 (copy), l_Incomplete_0 (ref), v142 (copy)
    local l_v334_0 = v334;
    while true do
        local l_alternate_2 = l_v334_0.alternate;
        local l_return__2 = l_v334_0.return_;
        if bit32.band(l_v334_0.flags, v45.Incomplete) == v45.NoFlags then
            l_setCurrentFiber_0(l_v334_0);
            local v338 = nil;
            if not l_ReactFeatureFlags_0.enableProfilerTimer or bit32.band(l_v334_0.mode, v42.ProfileMode) == v42.NoMode then
                local l_l_v334_0_0 = l_v334_0;
                local l_subtreeRenderLanes_0 = v5.subtreeRenderLanes;
                if not v103.completeWorkRef then
                    v103.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
                end;
                v338 = v103.completeWorkRef(l_alternate_2, l_l_v334_0_0, l_subtreeRenderLanes_0);
            else
                v121.startProfilerTimer(l_v334_0);
                local l_l_v334_0_1 = l_v334_0;
                local l_subtreeRenderLanes_1 = v5.subtreeRenderLanes;
                if not v103.completeWorkRef then
                    v103.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
                end;
                v338 = v103.completeWorkRef(l_alternate_2, l_l_v334_0_1, l_subtreeRenderLanes_1);
                v121.stopProfilerTimerIfRunningAndRecordDelta(l_v334_0, false);
            end;
            l_resetCurrentFiber_0();
            if v338 ~= nil then
                v145 = v338;
                return;
            end;
        else
            local v343 = l_unwindWork_0(l_v334_0, v5.subtreeRenderLanes);
            if v343 ~= nil then
                v343.flags = bit32.band(v343.flags, v45.HostEffectMask);
                v145 = v343;
                return;
            else
                if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(l_v334_0.mode, v42.ProfileMode) ~= v42.NoMode then
                    v121.stopProfilerTimerIfRunningAndRecordDelta(l_v334_0, false);
                    local v344 = l_v334_0.actualDuration or 0;
                    local l_child_0 = l_v334_0.child;
                    while l_child_0 ~= nil do
                        v344 = v344 + (l_child_0.actualDuration or 0);
                        l_child_0 = l_child_0.sibling;
                    end;
                    l_v334_0.actualDuration = v344;
                end;
                if l_return__2 ~= nil then
                    l_return__2.flags = bit32.bor(l_return__2.flags, v45.Incomplete);
                    l_return__2.subtreeFlags = v45.NoFlags;
                    l_return__2.deletions = nil;
                end;
            end;
        end;
        local l_sibling_0 = l_v334_0.sibling;
        if l_sibling_0 ~= nil then
            v145 = l_sibling_0;
            return;
        else
            l_v334_0 = l_return__2;
            v145 = l_v334_0;
            if l_v334_0 == nil then
                if l_Incomplete_0 == v142.Incomplete then
                    l_Incomplete_0 = v142.Completed;
                end;
                return;
            end;
        end;
    end;
end;
v141.commitRoot = function(v347) --[[ Line: 2090 ]]
    -- upvalues: l_getCurrentPriorityLevel_0 (copy), l_runWithPriority_0 (copy), l_ImmediatePriority_0 (copy), v101 (copy), v141 (copy)
    local v348 = l_getCurrentPriorityLevel_0();
    l_runWithPriority_0(l_ImmediatePriority_0, function() --[[ Line: 2092 ]]
        -- upvalues: v101 (ref), v141 (ref), v347 (copy), v348 (copy)
        v101.profileCommitBefore();
        local v349 = v141.commitRootImpl(v347, v348);
        v101.profileCommitAfter();
        return v349;
    end);
    return nil;
end;
v141.commitRootImpl = function(v350, v351) --[[ Line: 2103 ]]
    -- upvalues: v5 (copy), v164 (ref), l_invariant_0 (copy), v143 (ref), l___DEV___0 (copy), l_enableDebugTracing_0 (copy), v35 (copy), l_enableSchedulingProfiler_0 (copy), v36 (copy), v8 (copy), l_mergeLanes_0 (copy), l_markRootFinished_0 (copy), v167 (ref), l_hasDiscreteLanes_0 (copy), v144 (ref), v145 (ref), l_NoLanes_0 (ref), v45 (copy), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v141 (copy), l_ReactCurrentOwner_0 (copy), v175 (ref), v40 (copy), v176 (ref), v121 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_recursivelyCommitLayoutEffects_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v139 (ref), l_resetCurrentFiber_0 (copy), l___YOLO___0 (copy), l_describeError_0 (copy), v163 (ref), l_scheduleCallback_0 (copy), l_NormalPriority_0 (copy), l_requestPaint_0 (copy), l_NoLanes_4 (ref), l_l_NoPriority_0_0 (ref), v171 (ref), v162 (ref), l_enableDoubleInvokingEffects_0 (copy), l_SyncLane_0 (copy), v169 (ref), v168 (ref), l_onCommitRoot_0 (copy), l_onCommitRoot_1 (copy), v102 (ref), l_now_0 (copy), v160 (ref), v161 (ref), l_flushSyncCallbackQueue_0 (copy)
    repeat
        v5.flushPassiveEffects();
    until v164 == nil;
    flushRenderPhaseStrictModeWarningsInDEV();
    l_invariant_0(bit32.band(v143, 48) == 0, "Should not already be working.");
    local l_finishedWork_0 = v350.finishedWork;
    local l_finishedLanes_0 = v350.finishedLanes;
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
        v350.finishedWork = nil;
        v350.finishedLanes = v8.NoLanes;
        l_invariant_0(l_finishedWork_0 ~= v350.current, "Cannot commit the same tree as before. This error is likely caused by " .. "a bug in React. Please file an issue.");
        v350.callbackNode = nil;
        local v354 = l_mergeLanes_0(l_finishedWork_0.lanes, l_finishedWork_0.childLanes);
        l_markRootFinished_0(v350, v354);
        if v167 ~= nil and not l_hasDiscreteLanes_0(v354) and v167:has(v350) then
            v167:delete(v350);
        end;
        if v350 == v144 then
            v144 = nil;
            v145 = nil;
            l_NoLanes_0 = v8.NoLanes;
        end;
        local v355 = bit32.band(l_finishedWork_0.subtreeFlags, (bit32.bor(v45.BeforeMutationMask, v45.MutationMask, v45.LayoutMask, v45.PassiveMask))) ~= v45.NoFlags;
        local v356 = bit32.band(l_finishedWork_0.flags, (bit32.bor(v45.BeforeMutationMask, v45.MutationMask, v45.LayoutMask, v45.PassiveMask))) ~= v45.NoFlags;
        if v355 or v356 then
            local v357 = nil;
            if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
                v357 = l_getCurrentUpdateLanePriority_0();
                l_setCurrentUpdateLanePriority_0(v8.SyncLanePriority);
            end;
            local l_v143_8 = v143;
            v143 = bit32.bor(v143, 32);
            local v359 = v141.pushInteractions(v350);
            l_ReactCurrentOwner_0.current = nil;
            v175 = v40.prepareForCommit(v350.containerInfo);
            v176 = false;
            v141.commitBeforeMutationEffects(l_finishedWork_0);
            v175 = nil;
            if l_ReactFeatureFlags_0.enableProfilerTimer then
                v121.recordCommitTime();
            end;
            v141.commitMutationEffects(l_finishedWork_0, v350, v351);
            if v176 then
                v40.afterActiveInstanceBlur();
            end;
            v40.resetAfterCommit(v350.containerInfo);
            v350.current = l_finishedWork_0;
            if l___DEV___0 and l_enableDebugTracing_0 then
                v35.logLayoutEffectsStarted(l_finishedLanes_0);
            end;
            if l_enableSchedulingProfiler_0 then
                v36.markLayoutEffectsStarted(l_finishedLanes_0);
            end;
            if l___DEV___0 then
                l_setCurrentFiber_0(l_finishedWork_0);
                l_invokeGuardedCallback_0(nil, l_recursivelyCommitLayoutEffects_0, nil, l_finishedWork_0, v350, v5.captureCommitPhaseError, v5.schedulePassiveEffectCallback);
                if l_hasCaughtError_0() then
                    local v360 = l_clearCaughtError_0();
                    v139(l_finishedWork_0, l_finishedWork_0, v360);
                end;
                l_resetCurrentFiber_0();
            else
                local v361 = nil;
                local v362 = nil;
                if not l___YOLO___0 then
                    local v363, v364 = xpcall(l_recursivelyCommitLayoutEffects_0, l_describeError_0, l_finishedWork_0, v350, v5.captureCommitPhaseError, v5.schedulePassiveEffectCallback);
                    v361 = v363;
                    v362 = v364;
                else
                    v361 = true;
                    l_recursivelyCommitLayoutEffects_0(l_finishedWork_0, v350, v5.captureCommitPhaseError, v5.schedulePassiveEffectCallback);
                end;
                if not v361 then
                    v139(l_finishedWork_0, l_finishedWork_0, v362);
                end;
            end;
            if l___DEV___0 and l_enableDebugTracing_0 then
                v35.logLayoutEffectsStopped();
            end;
            if l_enableSchedulingProfiler_0 then
                v36.markLayoutEffectsStopped();
            end;
            if (bit32.band(l_finishedWork_0.subtreeFlags, v45.PassiveMask) ~= v45.NoFlags or bit32.band(l_finishedWork_0.flags, v45.PassiveMask) ~= v45.NoFlags) and not v163 then
                v163 = true;
                l_scheduleCallback_0(l_NormalPriority_0, function() --[[ Line: 2336 ]]
                    -- upvalues: v5 (ref)
                    v5.flushPassiveEffects();
                    return nil;
                end);
            end;
            l_requestPaint_0();
            if l_ReactFeatureFlags_0.enableSchedulerTracing then
                v141.popInteractions(v359);
            end;
            v143 = l_v143_8;
            if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler and v357 ~= nil then
                l_setCurrentUpdateLanePriority_0(v357);
            end;
        else
            v350.current = l_finishedWork_0;
            if l_ReactFeatureFlags_0.enableProfilerTimer then
                v121.recordCommitTime();
            end;
        end;
        local l_v163_0 = v163;
        if v163 then
            v163 = false;
            v164 = v350;
            l_NoLanes_4 = l_finishedLanes_0;
            l_l_NoPriority_0_0 = v351;
        end;
        v354 = v350.pendingLanes;
        if v354 ~= v8.NoLanes then
            if l_ReactFeatureFlags_0.enableSchedulerTracing then
                if v171 ~= nil then
                    local l_v171_0 = v171;
                    v171 = nil;
                    for v367 = 1, #l_v171_0 do
                        scheduleInteractions(v350, l_v171_0[v367], v350.memoizedInteractions);
                    end;
                end;
                v141.schedulePendingInteractions(v350, v354);
            end;
        else
            v162 = nil;
        end;
        if l___DEV___0 and l_enableDoubleInvokingEffects_0 and not l_v163_0 then
            commitDoubleInvokeEffectsInDEV(v350.current, false);
        end;
        if l_ReactFeatureFlags_0.enableSchedulerTracing and not l_v163_0 then
            v141.finishPendingInteractions(v350, l_finishedLanes_0);
        end;
        if v354 == l_SyncLane_0 then
            if v350 == v169 then
                v168 = v168 + 1;
            else
                v168 = 0;
                v169 = v350;
            end;
        else
            v168 = 0;
        end;
        l_onCommitRoot_0(l_finishedWork_0.stateNode, v351);
        if l___DEV___0 then
            l_onCommitRoot_1();
        end;
        v102(v350, l_now_0());
        if v160 then
            v160 = false;
            local l_v161_0 = v161;
            v161 = nil;
            error(l_v161_0);
        end;
        if bit32.band(v143, 8) ~= 0 then
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
v141.commitBeforeMutationEffects = function(v369) --[[ Line: 2487 ]]
    -- upvalues: v141 (copy), v45 (copy), l___DEV___0 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v5 (copy), l_resetCurrentFiber_0 (copy), l___YOLO___0 (copy), l_describeError_0 (copy)
    local l_v369_0 = v369;
    while l_v369_0 ~= nil do
        if l_v369_0.deletions ~= nil then
            v141.commitBeforeMutationEffectsDeletions(l_v369_0.deletions);
        end;
        if l_v369_0.child ~= nil and bit32.band(l_v369_0.subtreeFlags, v45.BeforeMutationMask) ~= v45.NoFlags then
            v141.commitBeforeMutationEffects(l_v369_0.child);
        end;
        if l___DEV___0 then
            l_setCurrentFiber_0(l_v369_0);
            l_invokeGuardedCallback_0(nil, v141.commitBeforeMutationEffectsImpl, nil, l_v369_0);
            if l_hasCaughtError_0() then
                local v371 = l_clearCaughtError_0();
                v5.captureCommitPhaseError(l_v369_0, l_v369_0.return_, v371);
            end;
            l_resetCurrentFiber_0();
        else
            local v372 = nil;
            local v373 = nil;
            if not l___YOLO___0 then
                local v374, v375 = xpcall(v141.commitBeforeMutationEffectsImpl, l_describeError_0, l_v369_0);
                v372 = v374;
                v373 = v375;
            else
                v372 = true;
                v141.commitBeforeMutationEffectsImpl(l_v369_0);
            end;
            if not v372 then
                v5.captureCommitPhaseError(l_v369_0, l_v369_0.return_, v373);
            end;
        end;
        l_v369_0 = l_v369_0.sibling;
    end;
end;
v141.commitBeforeMutationEffectsImpl = function(v376) --[[ Line: 2530 ]]
    -- upvalues: v176 (ref), v175 (ref), v43 (copy), v84 (copy), l_doesFiberContain_0 (copy), v40 (copy), v45 (copy), l_setCurrentFiber_0 (copy), l_commitBeforeMutationLifeCycles_0 (copy), l_resetCurrentFiber_0 (copy), v163 (ref), l_scheduleCallback_0 (copy), l_NormalPriority_0 (copy), v5 (copy)
    local l_alternate_3 = v376.alternate;
    local l_flags_0 = v376.flags;
    if not v176 and v175 ~= nil and v376.tag == v43.SuspenseComponent and v84.isSuspenseBoundaryBeingHidden(l_alternate_3, v376) and l_doesFiberContain_0(v376, v175) then
        v176 = true;
        v40.beforeActiveInstanceBlur();
    end;
    if bit32.band(l_flags_0, v45.Snapshot) ~= v45.NoFlags then
        l_setCurrentFiber_0(v376);
        l_commitBeforeMutationLifeCycles_0(l_alternate_3, v376);
        l_resetCurrentFiber_0();
    end;
    if bit32.band(l_flags_0, v45.Passive) ~= v45.NoFlags and not v163 then
        v163 = true;
        l_scheduleCallback_0(l_NormalPriority_0, function() --[[ Line: 2558 ]]
            -- upvalues: v5 (ref)
            v5.flushPassiveEffects();
            return nil;
        end);
    end;
end;
v141.commitBeforeMutationEffectsDeletions = function(v379) --[[ Line: 2566 ]]
    -- upvalues: l_doesFiberContain_0 (copy), v175 (ref), v176 (ref), v40 (copy)
    for v380 = 1, #v379 do
        local v381 = v379[v380];
        if l_doesFiberContain_0(v381, v175) then
            v176 = true;
            v40.beforeActiveInstanceBlur();
        end;
    end;
end;
v141.commitMutationEffects = function(v382, v383, v384) --[[ Line: 2582 ]]
    -- upvalues: l_commitDeletion_0 (copy), l_describeError_0 (copy), v5 (copy), v45 (copy), v141 (copy), l___DEV___0 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), l_resetCurrentFiber_0 (copy), l___YOLO___0 (copy)
    local l_v382_0 = v382;
    while l_v382_0 ~= nil do
        local l_deletions_0 = l_v382_0.deletions;
        if l_deletions_0 ~= nil then
            for _, v388 in l_deletions_0 do
                local v389, v390 = xpcall(l_commitDeletion_0, l_describeError_0, v383, v388, l_v382_0, v384);
                if not v389 then
                    v5.captureCommitPhaseError(v388, l_v382_0, v390);
                end;
            end;
        end;
        if l_v382_0.child ~= nil and bit32.band(l_v382_0.subtreeFlags, v45.MutationMask) ~= v45.NoFlags then
            v141.commitMutationEffects(l_v382_0.child, v383, v384);
        end;
        if l___DEV___0 then
            l_setCurrentFiber_0(l_v382_0);
            l_invokeGuardedCallback_0(nil, v141.commitMutationEffectsImpl, nil, l_v382_0, v383, v384);
            if l_hasCaughtError_0() then
                local v391 = l_clearCaughtError_0();
                v5.captureCommitPhaseError(l_v382_0, l_v382_0.return_, v391);
            end;
            l_resetCurrentFiber_0();
        else
            local v392 = nil;
            local v393 = nil;
            if not l___YOLO___0 then
                local v394, v395 = xpcall(v141.commitMutationEffectsImpl, l_describeError_0, l_v382_0, v383, v384);
                v392 = v394;
                v393 = v395;
            else
                v392 = true;
                v141.commitMutationEffectsImpl(l_v382_0, v383, v384);
            end;
            if not v392 then
                v5.captureCommitPhaseError(l_v382_0, l_v382_0.return_, v393);
            end;
        end;
        l_v382_0 = l_v382_0.sibling;
    end;
end;
v141.commitMutationEffectsImpl = function(v396, _, _) --[[ Line: 2652 ]]
    -- upvalues: v45 (copy), l_commitDetachRef_0 (copy), l_commitPlacement_0 (copy), l_commitWork_0 (copy)
    local l_flags_1 = v396.flags;
    if bit32.band(l_flags_1, v45.Ref) ~= 0 then
        local l_alternate_4 = v396.alternate;
        if l_alternate_4 ~= nil then
            l_commitDetachRef_0(l_alternate_4);
        end;
    end;
    local v401 = bit32.band(l_flags_1, (bit32.bor(v45.Placement, v45.Update, v45.Hydrating)));
    if v401 == v45.Placement then
        l_commitPlacement_0(v396);
        v396.flags = bit32.band(v396.flags, (bit32.bnot(v45.Placement)));
        return;
    elseif v401 == v45.PlacementAndUpdate then
        l_commitPlacement_0(v396);
        v396.flags = bit32.band(v396.flags, (bit32.bnot(v45.Placement)));
        local l_alternate_5 = v396.alternate;
        l_commitWork_0(l_alternate_5, v396);
        return;
    else
        if v401 == v45.Update then
            local l_alternate_6 = v396.alternate;
            l_commitWork_0(l_alternate_6, v396);
        end;
        return;
    end;
end;
v141.commitMutationEffectsDeletions = function(v404, v405, v406, v407) --[[ Line: 2718 ]]
    -- upvalues: l_commitDeletion_0 (copy), l_describeError_0 (copy), v5 (copy)
    for _, v409 in v404 do
        local v410, v411 = xpcall(l_commitDeletion_0, l_describeError_0, v406, v409, v405, v407);
        if not v410 then
            v5.captureCommitPhaseError(v409, v405, v411);
        end;
    end;
end;
v5.schedulePassiveEffectCallback = function() --[[ Line: 2736 ]]
    -- upvalues: v163 (ref), l_scheduleCallback_0 (copy), l_NormalPriority_0 (copy), v5 (copy)
    if not v163 then
        v163 = true;
        l_scheduleCallback_0(l_NormalPriority_0, function() --[[ Line: 2739 ]]
            -- upvalues: v5 (ref)
            v5.flushPassiveEffects();
            return nil;
        end);
    end;
end;
local v412 = nil;
v5.flushPassiveEffects = function() --[[ Line: 2748 ]]
    -- upvalues: l_l_NoPriority_0_0 (ref), l_NoPriority_0 (copy), l_NormalPriority_0 (copy), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), l_schedulerPriorityToLanePriority_0 (copy), l___YOLO___0 (copy), l_runWithPriority_0 (copy), l_describeError_0 (copy), v412 (ref)
    if l_l_NoPriority_0_0 ~= l_NoPriority_0 then
        local v413 = if l_NormalPriority_0 < l_l_NoPriority_0_0 then l_NormalPriority_0 else l_l_NoPriority_0_0;
        l_l_NoPriority_0_0 = l_NoPriority_0;
        if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
            local v414 = l_getCurrentUpdateLanePriority_0();
            l_setCurrentUpdateLanePriority_0(l_schedulerPriorityToLanePriority_0(v413));
            local v415 = nil;
            local v416 = nil;
            if not l___YOLO___0 then
                local v417, v418 = xpcall(l_runWithPriority_0, l_describeError_0, v413, v412);
                v415 = v417;
                v416 = v418;
            else
                v415 = true;
                l_setCurrentUpdateLanePriority_0(l_schedulerPriorityToLanePriority_0(v413));
                v416 = l_runWithPriority_0(v413, v412);
            end;
            l_setCurrentUpdateLanePriority_0(v414);
            if not v415 then
                error(v416);
            end;
            return v416;
        else
            return l_runWithPriority_0(v413, v412);
        end;
    else
        return false;
    end;
end;
v140 = function(v419, v420) --[[ Line: 2792 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), v43 (copy), v158 (ref), v45 (copy), v140 (ref), l___DEV___0 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_commitPassiveMount_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v5 (copy), l_resetCurrentFiber_0 (copy), l___YOLO___0 (copy), l_describeError_0 (copy)
    local l_v420_0 = v420;
    while l_v420_0 ~= nil do
        local v422 = nil;
        if l_ReactFeatureFlags_0.enableProfilerTimer and l_ReactFeatureFlags_0.enableProfilerCommitHooks and l_v420_0.tag == v43.Profiler then
            v422 = v158;
            v158 = l_v420_0;
        end;
        local v423 = bit32.band(l_v420_0.subtreeFlags, v45.PassiveMask);
        if l_v420_0.child ~= nil and v423 ~= v45.NoFlags then
            v140(v419, l_v420_0.child);
        end;
        if bit32.band(l_v420_0.flags, v45.Passive) ~= v45.NoFlags then
            if l___DEV___0 then
                l_setCurrentFiber_0(l_v420_0);
                l_invokeGuardedCallback_0(nil, l_commitPassiveMount_0, nil, v419, l_v420_0);
                if l_hasCaughtError_0() then
                    local v424 = l_clearCaughtError_0();
                    v5.captureCommitPhaseError(l_v420_0, l_v420_0.return_, v424);
                end;
                l_resetCurrentFiber_0();
            else
                local v425 = nil;
                local v426 = nil;
                if not l___YOLO___0 then
                    local v427, v428 = xpcall(l_commitPassiveMount_0, l_describeError_0, v419, l_v420_0);
                    v425 = v427;
                    v426 = v428;
                else
                    v425 = true;
                    l_commitPassiveMount_0(v419, l_v420_0);
                end;
                if not v425 then
                    v5.captureCommitPhaseError(l_v420_0, l_v420_0.return_, v426);
                end;
            end;
        end;
        if l_ReactFeatureFlags_0.enableProfilerTimer and l_ReactFeatureFlags_0.enableProfilerCommitHooks and l_v420_0.tag == v43.Profiler then
            if v422 ~= nil then
                local l_stateNode_0 = v422.stateNode;
                l_stateNode_0.passiveEffectDuration = l_stateNode_0.passiveEffectDuration + l_v420_0.stateNode.passiveEffectDuration;
            end;
            v158 = v422;
        end;
        l_v420_0 = l_v420_0.sibling;
    end;
end;
local function v430(v431) --[[ Line: 2861 ]] --[[ Name: flushPassiveUnmountEffects ]]
    -- upvalues: v141 (copy), v45 (copy), v430 (copy), l_setCurrentFiber_0 (copy), l_commitPassiveUnmount_0 (copy), l_resetCurrentFiber_0 (copy)
    local l_v431_0 = v431;
    while l_v431_0 ~= nil do
        local l_deletions_1 = l_v431_0.deletions;
        if l_deletions_1 ~= nil then
            for v434 = 1, #l_deletions_1 do
                local v435 = l_deletions_1[v434];
                v141.flushPassiveUnmountEffectsInsideOfDeletedTree(v435, l_v431_0);
                v141.detachFiberAfterEffects(v435);
            end;
        end;
        local l_child_1 = l_v431_0.child;
        if l_child_1 ~= nil and bit32.band(l_v431_0.subtreeFlags, v45.PassiveMask) ~= v45.NoFlags then
            v430(l_child_1);
        end;
        if bit32.band(l_v431_0.flags, v45.Passive) ~= v45.NoFlags then
            l_setCurrentFiber_0(l_v431_0);
            l_commitPassiveUnmount_0(l_v431_0);
            l_resetCurrentFiber_0();
        end;
        l_v431_0 = l_v431_0.sibling;
    end;
end;
v141.flushPassiveUnmountEffectsInsideOfDeletedTree = function(v437, v438) --[[ Line: 2901 ]]
    -- upvalues: v45 (copy), v141 (copy), l_setCurrentFiber_0 (copy), l_commitPassiveUnmountInsideDeletedTree_0 (copy), l_resetCurrentFiber_0 (copy)
    if bit32.band(v437.subtreeFlags, v45.PassiveStatic) ~= v45.NoFlags then
        local l_child_2 = v437.child;
        while l_child_2 ~= nil do
            v141.flushPassiveUnmountEffectsInsideOfDeletedTree(l_child_2, v438);
            l_child_2 = l_child_2.sibling;
        end;
    end;
    if bit32.band(v437.flags, v45.PassiveStatic) ~= v45.NoFlags then
        l_setCurrentFiber_0(v437);
        l_commitPassiveUnmountInsideDeletedTree_0(v437, v438);
        l_resetCurrentFiber_0();
    end;
end;
v412 = function() --[[ Line: 2933 ]]
    -- upvalues: v164 (ref), l_NoLanes_4 (ref), v8 (copy), l_invariant_0 (copy), v143 (ref), l___DEV___0 (copy), l_enableDebugTracing_0 (copy), v35 (copy), l_enableSchedulingProfiler_0 (copy), v36 (copy), v141 (copy), v430 (copy), v140 (ref), l_enableDoubleInvokingEffects_0 (copy), l_ReactFeatureFlags_0 (copy), l_flushSyncCallbackQueue_0 (copy), v170 (ref)
    if v164 == nil then
        return false;
    else
        local l_v164_0 = v164;
        local l_l_NoLanes_4_0 = l_NoLanes_4;
        v164 = nil;
        l_NoLanes_4 = v8.NoLanes;
        l_invariant_0(bit32.band(v143, 48) == 0, "Cannot flush passive effects while already rendering.");
        if l___DEV___0 and l_enableDebugTracing_0 then
            v35.logPassiveEffectsStarted(l_l_NoLanes_4_0);
        end;
        if l_enableSchedulingProfiler_0 then
            v36.markPassiveEffectsStarted(l_l_NoLanes_4_0);
        end;
        local l_v143_9 = v143;
        v143 = bit32.bor(v143, 32);
        local v443 = v141.pushInteractions(l_v164_0);
        v430(l_v164_0.current);
        v140(l_v164_0, l_v164_0.current);
        if l___DEV___0 and l_enableDebugTracing_0 then
            v35.logPassiveEffectsStopped();
        end;
        if l_enableSchedulingProfiler_0 then
            v36.markPassiveEffectsStopped();
        end;
        if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
            commitDoubleInvokeEffectsInDEV(l_v164_0.current, true);
        end;
        if l_ReactFeatureFlags_0.enableSchedulerTracing then
            v141.popInteractions(v443);
            v141.finishPendingInteractions(l_v164_0, l_l_NoLanes_4_0);
        end;
        v143 = l_v143_9;
        l_flushSyncCallbackQueue_0();
        if v164 == nil then
            v170 = 0;
        else
            v170 = v170 + 1;
        end;
        return true;
    end;
end;
v5.isAlreadyFailedLegacyErrorBoundary = function(v444) --[[ Line: 3006 ]]
    -- upvalues: v162 (ref)
    local v445 = false;
    if v162 ~= nil then
        v445 = v162:has(v444);
    end;
    return v445;
end;
v5.markLegacyErrorBoundaryAsFailed = function(v446) --[[ Line: 3012 ]]
    -- upvalues: v162 (ref), l_Set_0 (copy)
    if v162 == nil then
        v162 = l_Set_0.new({
            v446
        });
        return;
    else
        v162:add(v446);
        return;
    end;
end;
v5.onUncaughtError = function(v447) --[[ Line: 3021 ]] --[[ Name: prepareToThrowUncaughtError ]]
    -- upvalues: v160 (ref), v161 (ref)
    if not v160 then
        v160 = true;
        v161 = v447;
    end;
end;
v139 = function(v448, v449, v450) --[[ Line: 3029 ]]
    -- upvalues: l_createCapturedValue_0 (copy), l_createRootErrorUpdate_0 (copy), l_SyncLane_0 (copy), v5 (copy), l_enqueueUpdate_0 (copy), v141 (copy), l_markRootUpdated_0 (copy), v102 (ref)
    local v451 = l_createCapturedValue_0(v450, v449);
    local v452 = l_createRootErrorUpdate_0(v448, v451, l_SyncLane_0, v5.onUncaughtError);
    l_enqueueUpdate_0(v448, v452);
    local v453 = v5.requestEventTime();
    local v454 = v141.markUpdateLaneFromFiberToRoot(v448, l_SyncLane_0);
    if v454 ~= nil then
        l_markRootUpdated_0(v454, l_SyncLane_0, v453);
        v102(v454, v453);
        v141.schedulePendingInteractions(v454, l_SyncLane_0);
    end;
end;
v5.captureCommitPhaseError = function(v455, v456, v457) --[[ Line: 3050 ]]
    -- upvalues: v43 (copy), v139 (ref), l_skipUnmountedBoundaries_0 (copy), v5 (copy), l_createCapturedValue_0 (copy), l_createClassErrorUpdate_0 (copy), l_SyncLane_0 (copy), l_enqueueUpdate_0 (copy), v141 (copy), l_markRootUpdated_0 (copy), v102 (ref)
    if v455.tag == v43.HostRoot then
        v139(v455, v455, v457);
        return;
    else
        local v458 = nil;
        v458 = if l_skipUnmountedBoundaries_0 then v456 else v455.return_;
        while true do
            if v458 ~= nil then
                if v458.tag == v43.HostRoot then
                    v139(v458, v455, v457);
                    return;
                else
                    if v458.tag == v43.ClassComponent then
                        local l_type_0 = v458.type;
                        local l_stateNode_1 = v458.stateNode;
                        if typeof(l_type_0.getDerivedStateFromError) == "function" or typeof(l_stateNode_1.componentDidCatch) == "function" and not v5.isAlreadyFailedLegacyErrorBoundary(l_stateNode_1) then
                            local v461 = l_createCapturedValue_0(v457, v455);
                            local v462 = l_createClassErrorUpdate_0(v458, v461, l_SyncLane_0);
                            l_enqueueUpdate_0(v458, v462);
                            local v463 = v5.requestEventTime();
                            local v464 = v141.markUpdateLaneFromFiberToRoot(v458, l_SyncLane_0);
                            if v464 ~= nil then
                                l_markRootUpdated_0(v464, l_SyncLane_0, v463);
                                v102(v464, v463);
                                v141.schedulePendingInteractions(v464, l_SyncLane_0);
                            end;
                            return;
                        end;
                    end;
                    v458 = v458.return_;
                end;
            else
                return;
            end;
        end;
    end;
end;
v5.pingSuspendedRoot = function(v465, v466, v467) --[[ Line: 3099 ]]
    -- upvalues: v5 (copy), l_markRootPinged_0 (copy), v144 (ref), l_isSubsetOfLanes_0 (copy), l_NoLanes_0 (ref), l_Incomplete_0 (ref), v142 (copy), l_includesOnlyRetries_0 (copy), l_now_0 (copy), v156 (ref), v141 (copy), v8 (copy), l_NoLanes_3 (ref), l_mergeLanes_0 (copy), v102 (ref)
    local l_pingCache_0 = v465.pingCache;
    if l_pingCache_0 ~= nil then
        l_pingCache_0[v466] = nil;
    end;
    local v469 = v5.requestEventTime();
    l_markRootPinged_0(v465, v467, v469);
    if v144 == v465 and l_isSubsetOfLanes_0(l_NoLanes_0, v467) then
        if l_Incomplete_0 == v142.SuspendedWithDelay or l_Incomplete_0 == v142.Suspended and l_includesOnlyRetries_0(l_NoLanes_0) and l_now_0() - v156 < 500 then
            v141.prepareFreshStack(v465, v8.NoLanes);
        else
            l_NoLanes_3 = l_mergeLanes_0(l_NoLanes_3, v467);
        end;
    end;
    v102(v465, v469);
    v141.schedulePendingInteractions(v465, v467);
end;
retryTimedOutBoundary = function(v470, v471) --[[ Line: 3143 ]] --[[ Name: retryTimedOutBoundary ]]
    -- upvalues: v8 (copy), v5 (copy), v141 (copy), l_markRootUpdated_0 (copy), v102 (ref)
    if v471 == v8.NoLane then
        v471 = requestRetryLane(v470);
    end;
    local v472 = v5.requestEventTime();
    local v473 = v141.markUpdateLaneFromFiberToRoot(v470, v471);
    if v473 ~= nil then
        l_markRootUpdated_0(v473, v471, v472);
        v102(v473, v472);
        v141.schedulePendingInteractions(v473, v471);
    end;
end;
v5.resolveRetryWakeable = function(v474, v475) --[[ Line: 3170 ]]
    -- upvalues: v8 (copy)
    local l_NoLane_0 = v8.NoLane;
    local v477 = nil;
    v477 = v474.stateNode;
    if v477 ~= nil then
        v477:delete(v475);
    end;
    retryTimedOutBoundary(v474, l_NoLane_0);
end;
jnd = function(v478) --[[ Line: 3214 ]] --[[ Name: jnd ]]
    if v478 < 120 then
        return 120;
    elseif v478 < 480 then
        return 480;
    elseif v478 < 1080 then
        return 1080;
    elseif v478 < 1920 then
        return 1920;
    elseif v478 < 3000 then
        return 3000;
    elseif v478 < 4320 then
        return 4320;
    else
        return math.ceil(v478 / 1960) * 1960;
    end;
end;
v141.checkForNestedUpdates = function() --[[ Line: 3232 ]]
    -- upvalues: v168 (ref), v169 (ref), l_invariant_0 (copy), l___DEV___0 (copy), v170 (ref), l_console_0 (copy)
    if v168 > 50 then
        v168 = 0;
        v169 = nil;
        l_invariant_0(false, "Maximum update depth exceeded. This can happen when a component " .. "repeatedly calls setState inside componentWillUpdate or " .. "componentDidUpdate. React limits the number of nested updates to " .. "prevent infinite loops.");
    end;
    if l___DEV___0 and v170 > 50 then
        v170 = 0;
        l_console_0.error("Maximum update depth exceeded. This can happen when a component " .. "calls setState inside useEffect, but useEffect either doesn't " .. "have a dependency array, or one of the dependencies changes on " .. "every render.");
    end;
end;
flushRenderPhaseStrictModeWarningsInDEV = function() --[[ Line: 3258 ]] --[[ Name: flushRenderPhaseStrictModeWarningsInDEV ]]
    -- upvalues: l___DEV___0 (copy), v123 (copy), l_ReactFeatureFlags_0 (copy)
    if l___DEV___0 then
        v123.flushLegacyContextWarning();
        if l_ReactFeatureFlags_0.warnAboutDeprecatedLifecycles then
            v123.flushPendingUnsafeLifecycleWarnings();
        end;
    end;
end;
commitDoubleInvokeEffectsInDEV = function(v479, v480) --[[ Line: 3268 ]] --[[ Name: commitDoubleInvokeEffectsInDEV ]]
    -- upvalues: l___DEV___0 (copy), l_enableDoubleInvokingEffects_0 (copy), l_setCurrentFiber_0 (copy), v45 (copy), l_invokeLayoutEffectUnmountInDEV_0 (copy), l_invokePassiveEffectUnmountInDEV_0 (copy), l_invokeLayoutEffectMountInDEV_0 (copy), l_invokePassiveEffectMountInDEV_0 (copy), l_resetCurrentFiber_0 (copy)
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
        l_setCurrentFiber_0(v479);
        invokeEffectsInDev(v479, v45.MountLayoutDev, l_invokeLayoutEffectUnmountInDEV_0);
        if v480 then
            invokeEffectsInDev(v479, v45.MountPassiveDev, l_invokePassiveEffectUnmountInDEV_0);
        end;
        invokeEffectsInDev(v479, v45.MountLayoutDev, l_invokeLayoutEffectMountInDEV_0);
        if v480 then
            invokeEffectsInDev(v479, v45.MountPassiveDev, l_invokePassiveEffectMountInDEV_0);
        end;
        l_resetCurrentFiber_0();
    end;
end;
invokeEffectsInDev = function(v481, v482, v483) --[[ Line: 3300 ]] --[[ Name: invokeEffectsInDev ]]
    -- upvalues: l___DEV___0 (copy), l_enableDoubleInvokingEffects_0 (copy), v45 (copy)
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
        local l_v481_0 = v481;
        while l_v481_0 ~= nil do
            if l_v481_0.child ~= nil and bit32.band(l_v481_0.subtreeFlags, v482) ~= v45.NoFlags then
                invokeEffectsInDev(l_v481_0.child, v482, v483);
            end;
            if bit32.band(l_v481_0.flags, v482) ~= v45.NoFlags then
                v483(l_v481_0);
            end;
            l_v481_0 = l_v481_0.sibling;
        end;
    end;
end;
local v485 = nil;
v141.warnAboutUpdateOnNotYetMountedFiberInDEV = function(v486) --[[ Line: 3326 ]]
    -- upvalues: l___DEV___0 (copy), v143 (ref), v42 (copy), v43 (copy), l_getComponentName_0 (copy), v485 (ref), v124 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_resetCurrentFiber_0 (copy)
    if l___DEV___0 then
        if bit32.band(v143, 16) ~= 0 then
            return;
        elseif bit32.band(v486.mode, (bit32.bor(v42.BlockingMode, v42.ConcurrentMode))) == 0 then
            return;
        else
            local l_tag_0 = v486.tag;
            if l_tag_0 ~= v43.IndeterminateComponent and l_tag_0 ~= v43.HostRoot and l_tag_0 ~= v43.ClassComponent and l_tag_0 ~= v43.FunctionComponent and l_tag_0 ~= v43.ForwardRef and l_tag_0 ~= v43.MemoComponent and l_tag_0 ~= v43.SimpleMemoComponent and l_tag_0 ~= v43.Block then
                return;
            else
                local v488 = l_getComponentName_0(v486.type) or "ReactComponent";
                if v485 ~= nil then
                    if v485[v488] then
                        return;
                    else
                        v485[v488] = true;
                    end;
                else
                    v485 = {
                        [v488] = true
                    };
                end;
                local l_current_3 = v124.current;
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 3371 ]]
                    -- upvalues: l_setCurrentFiber_0 (ref), v486 (copy), l_console_0 (ref)
                    l_setCurrentFiber_0(v486);
                    l_console_0.error("Can't perform a React state update on a component that hasn't mounted yet. " .. "This indicates that you have a side-effect in your render function that " .. "asynchronously later calls tries to update the component. Move this work to " .. "useEffect instead.");
                end);
                if l_current_3 then
                    l_setCurrentFiber_0(v486);
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
    v141.beginWork = function(v492, v493, v494) --[[ Line: 3397 ]]
        -- upvalues: v41 (copy), v107 (copy), l_describeError_0 (copy), l_resetContextDependencies_0 (copy), v103 (copy), v112 (ref), l_unwindInterruptedWork_0 (copy), l_ReactFeatureFlags_0 (copy), v42 (copy), v121 (copy), l_invokeGuardedCallback_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy)
        local v495 = v41.assignFiberPropertiesInDEV(nil, v493);
        local v496, v497 = xpcall(v107, l_describeError_0, v492, v493, v494);
        if not v496 then
            if v497 ~= nil and typeof(v497) == "table" and typeof(v497.andThen) == "function" then
                error(v497);
            end;
            l_resetContextDependencies_0();
            if not v103.resetHooksAfterThrowRef then
                v112 = require(script.Parent["ReactFiberHooks.new"]);
                v103.resetHooksAfterThrowRef = v112.resetHooksAfterThrow;
                v103.ContextOnlyDispatcherRef = v112.ContextOnlyDispatcher;
                v103.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v112.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
            end;
            local v498 = v103.resetHooksAfterThrowRef();
            l_unwindInterruptedWork_0(v493);
            v41.assignFiberPropertiesInDEV(v493, v495);
            if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(v493.mode, v42.ProfileMode) ~= 0 then
                v121.startProfilerTimer(v493);
            end;
            l_invokeGuardedCallback_0(nil, v107, nil, v492, v493, v494);
            if l_hasCaughtError_0() then
                v498 = l_clearCaughtError_0();
                error(v498);
                return v497;
            else
                error(v497);
            end;
        end;
        return v497;
    end;
else
    v141.beginWork = v107;
end;
local v499 = false;
local v500 = nil;
if l___DEV___0 then
    v500 = {};
end;
v141.warnAboutRenderPhaseUpdatesInDEV = function(v501) --[[ Line: 3467 ]]
    -- upvalues: l___DEV___0 (copy), v124 (copy), v143 (ref), v103 (copy), v112 (ref), v43 (copy), v145 (ref), l_getComponentName_0 (copy), v500 (ref), l_console_0 (copy), v499 (ref)
    if l___DEV___0 and v124.isRendering and bit32.band(v143, 16) ~= 0 then
        if not v103.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
            v112 = require(script.Parent["ReactFiberHooks.new"]);
            v103.resetHooksAfterThrowRef = v112.resetHooksAfterThrow;
            v103.ContextOnlyDispatcherRef = v112.ContextOnlyDispatcher;
            v103.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v112.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
        end;
        if not v103.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef() then
            if v501.tag == v43.FunctionComponent or v501.tag == v43.ForwardRef or v501.tag == v43.SimpleMemoComponent then
                local v502 = if v145 ~= nil then l_getComponentName_0(v145.type) else "Unknown";
                if v500[v502] == nil then
                    v500[v502] = true;
                    local v503 = l_getComponentName_0(v501.type) or "Unknown";
                    l_console_0.error("Cannot update a component (`%s`) while rendering a " .. "different component (`%s`). To locate the bad setState() call inside `%s`, " .. "follow the stack trace as described in https://reactjs.org/link/setstate-in-render", v503, v502, v502);
                    return;
                end;
            elseif v501.tag == v43.ClassComponent and not v499 then
                l_console_0.error("Cannot update during an existing state transition (such as " .. "within `render`). Render methods should be a pure " .. "function of props and state.");
                v499 = true;
            end;
        end;
    end;
end;
v5.IsThisRendererActing = {
    current = false
};
v5.warnIfNotScopedWithMatchingAct = function(v504) --[[ Line: 3519 ]]
    -- upvalues: l___DEV___0 (copy), v40 (copy), l_IsSomeRendererActing_0 (copy), v5 (copy), v124 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_resetCurrentFiber_0 (copy)
    if l___DEV___0 and v40.warnsIfNotActing == true and l_IsSomeRendererActing_0.current == true and v5.IsThisRendererActing.current ~= true then
        local l_current_4 = v124.current;
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 3527 ]]
            -- upvalues: l_setCurrentFiber_0 (ref), v504 (copy), l_console_0 (ref)
            l_setCurrentFiber_0(v504);
            l_console_0.error("It looks like you're using the wrong act() around your test interactions.\n" .. "Be sure to use the matching version of act() corresponding to your renderer:\n\n" .. "-- for react-roblox:\n" .. "local React = require(Packages.React)\n" .. "-- ...\n" .. "React.TestUtils.act(function() ... end)\n\n" .. "-- for react-test-renderer:\n" .. "local TestRenderer = require(Packages.ReactTestRenderer)\n" .. "-- ...\n" .. "TestRenderer.act(function() ... end)");
        end);
        if l_current_4 then
            l_setCurrentFiber_0(v504);
        else
            l_resetCurrentFiber_0();
        end;
        if not l_status_2 then
            error(l_result_2);
        end;
    end;
end;
v5.warnIfNotCurrentlyActingEffectsInDEV = function(v508) --[[ Line: 3562 ]]
    -- upvalues: l___DEV___0 (copy), v40 (copy), v42 (copy), l_IsSomeRendererActing_0 (copy), v5 (copy), l_console_0 (copy), l_getComponentName_0 (copy)
    if l___DEV___0 and v40.warnsIfNotActing == true and bit32.band(v508.mode, v42.StrictMode) ~= v42.NoMode and l_IsSomeRendererActing_0.current == false and v5.IsThisRendererActing.current == false then
        l_console_0.error("An update to %s ran an effect, but was not wrapped in act(...).\n\n" .. "When testing, code that causes React state updates should be " .. "wrapped into act(...):\n\n" .. "act(function()\n" .. "  --[[ fire events that update state ]]\n" .. "end)\n" .. "--[[ assert on the output ]]\n\n" .. "This ensures that you're testing the behavior the user would see " .. "in the real client." .. " Learn more at https://reactjs.org/link/wrap-tests-with-act", l_getComponentName_0(v508.type));
    end;
end;
v5.warnIfNotCurrentlyActingUpdatesInDEV = function(v509) --[[ Line: 3588 ]]
    -- upvalues: l___DEV___0 (copy), v40 (copy), v143 (ref), l_IsSomeRendererActing_0 (copy), v5 (copy), l_current_0 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_resetCurrentFiber_0 (copy)
    if l___DEV___0 and v40.warnsIfNotActing == true and v143 == 0 and l_IsSomeRendererActing_0.current == false and v5.IsThisRendererActing.current == false then
        local l_l_current_0_0 = l_current_0;
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 3597 ]]
            -- upvalues: l_setCurrentFiber_0 (ref), v509 (copy), l_console_0 (ref), l_getComponentName_0 (ref)
            l_setCurrentFiber_0(v509);
            l_console_0.error("An update to %s inside a test was not wrapped in act(...).\n\n" .. "When testing, code that causes React state updates should be " .. "wrapped into act(...):\n\n" .. "act(function()\n" .. "  --[[ fire events that update state ]]\n" .. "end)\n" .. "--[[ assert on the output ]]\n\n" .. "This ensures that you're testing the behavior the user would see " .. "in the client application." .. " Learn more at https://reactjs.org/link/wrap-tests-with-act", l_getComponentName_0(v509.type));
        end);
        if l_l_current_0_0 then
            l_setCurrentFiber_0(v509);
        else
            l_resetCurrentFiber_0();
        end;
        if l_status_3 then
            return l_result_3;
        end;
    end;
end;
local v513 = false;
v5.warnIfUnmockedScheduler = function(v514) --[[ Line: 3638 ]]
    -- upvalues: l___DEV___0 (copy), v513 (ref), v9 (copy), v42 (copy), l_console_0 (copy), l_ReactFeatureFlags_0 (copy)
    if l___DEV___0 and v513 == false and v9.unstable_flushAllWithoutAsserting == nil then
        if bit32.band(v514.mode, v42.BlockingMode) ~= 0 or bit32.band(v514.mode, v42.ConcurrentMode) ~= 0 then
            v513 = true;
            l_console_0.error("In Concurrent or Sync modes, the 'scheduler' module needs to be mocked " .. "to guarantee consistent behaviour across tests and client application. " .. "For example, with Jest: \n" .. "jest.mock('scheduler', function() return require(Packages.Scheduler).unstable_mock end)\n\n" .. "For more info, visit https://reactjs.org/link/mock-scheduler");
            return;
        elseif l_ReactFeatureFlags_0.warnAboutUnmockedScheduler == true then
            v513 = true;
            l_console_0.error("Starting from React v18, the 'scheduler' module will need to be mocked " .. "to guarantee consistent behaviour across tests and client applications. " .. "For example, with Jest: \n" .. "jest.mock('scheduler', function() return require(Packages.Scheduler).unstable_mock end)\n\n" .. "For more info, visit https://reactjs.org/link/mock-scheduler");
        end;
    end;
end;
computeThreadID = function(v515, v516) --[[ Line: 3682 ]] --[[ Name: computeThreadID ]]
    return v516 * 1000 + v515.interactionThreadID;
end;
v5.markSpawnedWork = function(v517) --[[ Line: 3690 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), v171 (ref)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    elseif v171 == nil then
        v171 = {
            v517
        };
        return;
    else
        table.insert(v171, v517);
        return;
    end;
end;
scheduleInteractions = function(v518, v519, v520) --[[ Line: 3702 ]] --[[ Name: scheduleInteractions ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l_Set_0 (copy), l___subscriberRef_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        if v520.size > 0 then
            local l_pendingInteractionMap_0 = v518.pendingInteractionMap;
            local v522 = l_pendingInteractionMap_0:get(v519);
            if v522 ~= nil then
                v520:forEach(function(v523) --[[ Line: 3715 ]]
                    -- upvalues: v522 (copy)
                    if not v522:has(v523) then
                        v523.__count = v523.__count + 1;
                    end;
                    v522:add(v523);
                end);
            else
                l_pendingInteractionMap_0:set(v519, l_Set_0.new(v520));
                for _, v525 in v520 do
                    v525.__count = v525.__count + 1;
                end;
            end;
            local l_current_5 = l___subscriberRef_0.current;
            if l_current_5 ~= nil then
                local v527 = computeThreadID(v518, v519);
                l_current_5.onWorkScheduled(v520, v527);
            end;
        end;
        return;
    end;
end;
v141.schedulePendingInteractions = function(v528, v529) --[[ Line: 3740 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___interactionsRef_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        scheduleInteractions(v528, v529, l___interactionsRef_0.current);
        return;
    end;
end;
v141.startWorkOnPendingInteractions = function(v530, v531) --[[ Line: 3751 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l_Set_0 (copy), l_includesSomeLane_0 (copy), l___subscriberRef_0 (copy), l_describeError_0 (copy), l_scheduleCallback_0 (copy), l_ImmediatePriority_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        local v532 = l_Set_0.new();
        v530.pendingInteractionMap:forEach(function(v533, v534) --[[ Line: 3761 ]]
            -- upvalues: l_includesSomeLane_0 (ref), v531 (copy), v532 (copy)
            if l_includesSomeLane_0(v531, v534) then
                v533:forEach(function(v535) --[[ Line: 3763 ]]
                    -- upvalues: v532 (ref)
                    v532:add(v535);
                end);
            end;
        end);
        v530.memoizedInteractions = v532;
        if v532.size > 0 then
            local l_current_6 = l___subscriberRef_0.current;
            if l_current_6 ~= nil then
                local v537 = computeThreadID(v530, v531);
                local v538, v539 = xpcall(l_current_6.onWorkStarted, l_describeError_0, v532, v537);
                if not v538 then
                    l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3785 ]]
                        -- upvalues: v539 (copy)
                        error(v539);
                    end);
                end;
            end;
        end;
        return;
    end;
end;
v141.finishPendingInteractions = function(v540, v541) --[[ Line: 3793 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___subscriberRef_0 (copy), l_describeError_0 (copy), l_includesSomeLane_0 (copy), l_scheduleCallback_0 (copy), l_ImmediatePriority_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        local l_pendingLanes_0 = v540.pendingLanes;
        local v543 = nil;
        local v544 = true;
        local v545 = nil;
        if v543 ~= nil and v540.memoizedInteractions.size > 0 then
            local v546 = computeThreadID(v540, v541);
            v543 = l___subscriberRef_0.current;
            local v547, v548 = xpcall(v543.onWorkStopped, l_describeError_0, v540.memoizedInteractions, v546);
            v544 = v547;
            v545 = v548;
        end;
        local l_pendingInteractionMap_1 = v540.pendingInteractionMap;
        l_pendingInteractionMap_1:forEach(function(v550, v551) --[[ Line: 3824 ]]
            -- upvalues: l_includesSomeLane_0 (ref), l_pendingLanes_0 (copy), l_pendingInteractionMap_1 (copy), v543 (ref), l_describeError_0 (ref), l_scheduleCallback_0 (ref), l_ImmediatePriority_0 (ref)
            if not l_includesSomeLane_0(l_pendingLanes_0, v551) then
                l_pendingInteractionMap_1:delete(v551);
                v550:forEach(function(v552) --[[ Line: 3830 ]]
                    -- upvalues: v543 (ref), l_describeError_0 (ref), l_scheduleCallback_0 (ref), l_ImmediatePriority_0 (ref)
                    v552.__count = v552.__count - 1;
                    if v543 ~= nil and v552.__count == 0 then
                        local v553, v554 = xpcall(v543.onInteractionScheduledWorkCompleted, l_describeError_0, v552);
                        if not v553 then
                            l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3841 ]]
                                -- upvalues: v554 (copy)
                                error(v554);
                            end);
                        end;
                    end;
                end);
            end;
        end);
        if not v544 then
            l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3853 ]]
                -- upvalues: v545 (ref)
                error(v545);
            end);
        end;
        return;
    end;
end;
local v555 = false;
local v556 = false;
local l_unstable_flushAllWithoutAsserting_0 = v9.unstable_flushAllWithoutAsserting;
local v558 = typeof(l_unstable_flushAllWithoutAsserting_0) == "function";
local function v566() --[[ Line: 3872 ]] --[[ Name: flushActWork ]]
    -- upvalues: l_unstable_flushAllWithoutAsserting_0 (copy), v555 (ref), l_describeError_0 (copy), v5 (copy)
    if l_unstable_flushAllWithoutAsserting_0 ~= nil then
        local l_v555_0 = v555;
        v555 = true;
        local v560, v561 = xpcall(l_unstable_flushAllWithoutAsserting_0, l_describeError_0);
        v555 = l_v555_0;
        if not v560 then
            error(v561);
            return;
        else
            return v561;
        end;
    else
        local l_v555_1 = v555;
        v555 = true;
        local v564, v565 = xpcall(function() --[[ Line: 3892 ]]
            -- upvalues: v5 (ref)
            local v563 = false;
            while v5.flushPassiveEffects() do
                v563 = true;
            end;
            return v563;
        end, l_describeError_0);
        v555 = l_v555_1;
        if not v564 then
            error(v565);
            return;
        else
            return v565;
        end;
    end;
end;
local function v567(v568) --[[ Line: 3911 ]] --[[ Name: flushWorkAndMicroTasks ]]
    -- upvalues: v566 (copy), l_describeError_0 (copy), l_enqueueTask_0 (copy), v567 (copy)
    local v569, v570 = xpcall(v566, l_describeError_0);
    if v569 then
        local v571, v572 = xpcall(l_enqueueTask_0, l_describeError_0, function() --[[ Line: 3915 ]]
            -- upvalues: v566 (ref), v567 (ref), v568 (copy)
            if v566() then
                v567(v568);
                return;
            else
                v568();
                return;
            end;
        end);
        v569 = v571;
        v570 = v572;
    end;
    if not v569 then
        v568(v570);
    end;
end;
v5.act = function(v573) --[[ Line: 3929 ]]
    -- upvalues: l___DEV___0 (copy), v215 (ref), l_console_0 (copy), v214 (ref), l_IsSomeRendererActing_0 (copy), v5 (copy), v556 (ref), l_describeError_0 (copy), v98 (copy), v558 (copy), v567 (copy), v566 (copy)
    if not l___DEV___0 and not _G.__ROACT_17_MOCK_SCHEDULER__ and v215 == false then
        v215 = true;
        l_console_0.error("act(...) is not supported in production builds of React, and might not behave as expected.");
    end;
    local l_v214_0 = v214;
    v214 = v214 + 1;
    local l_current_7 = l_IsSomeRendererActing_0.current;
    local l_current_8 = v5.IsThisRendererActing.current;
    local l_v556_0 = v556;
    l_IsSomeRendererActing_0.current = true;
    v5.IsThisRendererActing.current = true;
    v556 = true;
    local function _() --[[ Line: 3954 ]] --[[ Name: onDone ]]
        -- upvalues: v214 (ref), l_IsSomeRendererActing_0 (ref), l_current_7 (copy), v5 (ref), l_current_8 (copy), v556 (ref), l_v556_0 (copy), l___DEV___0 (ref), l_v214_0 (copy), l_console_0 (ref)
        v214 = v214 - 1;
        l_IsSomeRendererActing_0.current = l_current_7;
        v5.IsThisRendererActing.current = l_current_8;
        v556 = l_v556_0;
        if l___DEV___0 and l_v214_0 < v214 then
            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
        end;
    end;
    local v579, v580 = xpcall(v5.batchedUpdates, l_describeError_0, v573);
    if not v579 then
        v214 = v214 - 1;
        l_IsSomeRendererActing_0.current = l_current_7;
        v5.IsThisRendererActing.current = l_current_8;
        v556 = l_v556_0;
        if l___DEV___0 and l_v214_0 < v214 then
            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
        end;
        error(v580);
    end;
    if v580 ~= nil and typeof(v580) == "table" and typeof(v580.andThen) == "function" then
        local v581 = false;
        if l___DEV___0 and typeof(v98) ~= nil then
            v98.resolve():andThen(function() --[[ Line: 3987 ]]

            end):andThen(function() --[[ Line: 3987 ]]
                -- upvalues: v581 (ref), l_console_0 (ref)
                if v581 == false then
                    l_console_0.error("You called act(Promise.new(function() --[[ ... ]] end)) without :await() or :expect(). " .. "This could lead to unexpected testing behaviour, interleaving multiple act " .. "calls and mixing their scopes. You should - act(function() Promise.new(function() --[[ ... ]] end):await() end);");
                end;
            end);
        end;
        return {
            andThen = function(_, v583, v584) --[[ Line: 4006 ]] --[[ Name: andThen ]]
                -- upvalues: v581 (ref), v580 (copy), v214 (ref), v558 (ref), l_current_7 (copy), l_IsSomeRendererActing_0 (ref), v5 (ref), l_current_8 (copy), v556 (ref), l_v556_0 (copy), l___DEV___0 (ref), l_v214_0 (copy), l_console_0 (ref), v567 (ref)
                v581 = true;
                return v580:andThen(function() --[[ Line: 4008 ]]
                    -- upvalues: v214 (ref), v558 (ref), l_current_7 (ref), l_IsSomeRendererActing_0 (ref), v5 (ref), l_current_8 (ref), v556 (ref), l_v556_0 (ref), l___DEV___0 (ref), l_v214_0 (ref), l_console_0 (ref), v583 (copy), v567 (ref), v584 (copy)
                    if v214 > 1 or v558 == true and l_current_7 == true then
                        v214 = v214 - 1;
                        l_IsSomeRendererActing_0.current = l_current_7;
                        v5.IsThisRendererActing.current = l_current_8;
                        v556 = l_v556_0;
                        if l___DEV___0 and l_v214_0 < v214 then
                            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                        end;
                        v583();
                        return;
                    else
                        v567(function(v585) --[[ Line: 4022 ]]
                            -- upvalues: v214 (ref), l_IsSomeRendererActing_0 (ref), l_current_7 (ref), v5 (ref), l_current_8 (ref), v556 (ref), l_v556_0 (ref), l___DEV___0 (ref), l_v214_0 (ref), l_console_0 (ref), v584 (ref), v583 (ref)
                            v214 = v214 - 1;
                            l_IsSomeRendererActing_0.current = l_current_7;
                            v5.IsThisRendererActing.current = l_current_8;
                            v556 = l_v556_0;
                            if l___DEV___0 and l_v214_0 < v214 then
                                l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                            end;
                            if v585 then
                                v584(v585);
                                return;
                            else
                                v583();
                                return;
                            end;
                        end);
                        return;
                    end;
                end, function(v586) --[[ Line: 4030 ]]
                    -- upvalues: v214 (ref), l_IsSomeRendererActing_0 (ref), l_current_7 (ref), v5 (ref), l_current_8 (ref), v556 (ref), l_v556_0 (ref), l___DEV___0 (ref), l_v214_0 (ref), l_console_0 (ref), v584 (copy)
                    v214 = v214 - 1;
                    l_IsSomeRendererActing_0.current = l_current_7;
                    v5.IsThisRendererActing.current = l_current_8;
                    v556 = l_v556_0;
                    if l___DEV___0 and l_v214_0 < v214 then
                        l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
                    end;
                    v584(v586);
                end);
            end
        };
    else
        if l___DEV___0 and v580 ~= nil then
            l_console_0.error("The callback passed to act(...) function " .. "must return nil, or a Promise. You returned %s", (tostring(v580)));
        end;
        local v587, v588 = xpcall(function() --[[ Line: 4049 ]]
            -- upvalues: v214 (ref), v558 (ref), l_current_7 (copy), v566 (ref), l_IsSomeRendererActing_0 (ref), v5 (ref), l_current_8 (copy), v556 (ref), l_v556_0 (copy), l___DEV___0 (ref), l_v214_0 (copy), l_console_0 (ref)
            if v214 == 1 and (v558 == false or l_current_7 == false) then
                v566();
            end;
            v214 = v214 - 1;
            l_IsSomeRendererActing_0.current = l_current_7;
            v5.IsThisRendererActing.current = l_current_8;
            v556 = l_v556_0;
            if l___DEV___0 and l_v214_0 < v214 then
                l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
            end;
        end, l_describeError_0);
        if not v587 then
            v214 = v214 - 1;
            l_IsSomeRendererActing_0.current = l_current_7;
            v5.IsThisRendererActing.current = l_current_8;
            v556 = l_v556_0;
            if l___DEV___0 and l_v214_0 < v214 then
                l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
            end;
            error(v588);
        end;
        return {
            andThen = function(_, v590, _) --[[ Line: 4069 ]] --[[ Name: andThen ]]
                -- upvalues: l___DEV___0 (ref), l_console_0 (ref)
                if l___DEV___0 then
                    l_console_0.error("Do not await the result of calling act(...) with sync logic, it is not a Promise.");
                end;
                v590();
            end
        };
    end;
end;
v141.detachFiberAfterEffects = function(v592) --[[ Line: 4081 ]]
    -- upvalues: l___DEV___0 (copy)
    v592.child = nil;
    v592.deletions = nil;
    v592.dependencies = nil;
    v592.memoizedProps = nil;
    v592.memoizedState = nil;
    v592.pendingProps = nil;
    v592.sibling = nil;
    v592.stateNode = nil;
    v592.updateQueue = nil;
    if l___DEV___0 then
        v592._debugOwner = nil;
    end;
end;
return v5;