local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_Set_0 = require(l_Parent_0.LuauPolyfill).Set;
local v3 = {};
local _ = function(v4) --[[ Line: 22 ]] --[[ Name: copySet ]]
    -- upvalues: l_Set_0 (copy)
    local v5 = l_Set_0.new();
    if v4 == nil then
        return v5;
    else
        for _, v7 in v4 do
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
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local l_ReactSharedInternals_0 = v20.ReactSharedInternals;
local l_invariant_0 = v20.invariant;
local v24 = require(script.Parent["SchedulerWithReactIntegration.new"]);
local l_scheduleCallback_0 = v24.scheduleCallback;
local l_cancelCallback_0 = v24.cancelCallback;
local l_getCurrentPriorityLevel_0 = v24.getCurrentPriorityLevel;
local l_runWithPriority_0 = v24.runWithPriority;
local l_shouldYield_0 = v24.shouldYield;
local l_requestPaint_0 = v24.requestPaint;
local l_now_0 = v24.now;
local l_NoPriority_0 = v24.NoPriority;
local l_ImmediatePriority_0 = v24.ImmediatePriority;
local l_UserBlockingPriority_0 = v24.UserBlockingPriority;
local l_NormalPriority_0 = v24.NormalPriority;
local l_flushSyncCallbackQueue_0 = v24.flushSyncCallbackQueue;
local l_scheduleSyncCallback_0 = v24.scheduleSyncCallback;
local v38 = require(script.Parent.DebugTracing);
local v39 = require(script.Parent.SchedulingProfiler);
local l_tracing_0 = require(l_Parent_0.Scheduler).tracing;
local l___interactionsRef_0 = l_tracing_0.__interactionsRef;
local l___subscriberRef_0 = l_tracing_0.__subscriberRef;
local v43 = require(script.Parent.ReactFiberHostConfig);
local v44 = require(script.Parent["ReactFiber.new"]);
local v45 = require(script.Parent.ReactTypeOfMode);
local v46 = require(script.Parent.ReactWorkTags);
local l_LegacyRoot_0 = require(script.Parent.ReactRootTags).LegacyRoot;
local v48 = require(script.Parent.ReactFiberFlags);
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
local v79 = require(script.Parent.ReactFiberTransition);
local v80 = require(script.Parent["ReactFiberUnwindWork.new"]);
local l_unwindWork_0 = v80.unwindWork;
local l_unwindInterruptedWork_0 = v80.unwindInterruptedWork;
local v83 = require(script.Parent["ReactFiberThrow.new"]);
local l_throwException_0 = v83.throwException;
local l_createRootErrorUpdate_0 = v83.createRootErrorUpdate;
local l_createClassErrorUpdate_0 = v83.createClassErrorUpdate;
local v87 = require(script.Parent["ReactFiberCommitWork.new"]);
local l_commitBeforeMutationLifeCycles_0 = v87.commitBeforeMutationLifeCycles;
local l_commitPlacement_0 = v87.commitPlacement;
local l_commitWork_0 = v87.commitWork;
local l_commitDeletion_0 = v87.commitDeletion;
local l_commitPassiveUnmount_0 = v87.commitPassiveUnmount;
local l_commitPassiveUnmountInsideDeletedTree_0 = v87.commitPassiveUnmountInsideDeletedTree;
local l_commitPassiveMount_0 = v87.commitPassiveMount;
local l_commitDetachRef_0 = v87.commitDetachRef;
local l_invokeLayoutEffectMountInDEV_0 = v87.invokeLayoutEffectMountInDEV;
local l_invokePassiveEffectMountInDEV_0 = v87.invokePassiveEffectMountInDEV;
local l_invokeLayoutEffectUnmountInDEV_0 = v87.invokeLayoutEffectUnmountInDEV;
local l_invokePassiveEffectUnmountInDEV_0 = v87.invokePassiveEffectUnmountInDEV;
local l_recursivelyCommitLayoutEffects_0 = v87.recursivelyCommitLayoutEffects;
local v101 = require(l_Parent_0.Promise);
local l_enqueueUpdate_0 = require(script.Parent["ReactUpdateQueue.new"]).enqueueUpdate;
local l_resetContextDependencies_0 = require(script.Parent["ReactFiberNewContext.new"]).resetContextDependencies;
local v104 = nil;
local v105 = {
    resetHooksAfterThrowRef = nil, 
    ContextOnlyDispatcherRef = nil, 
    getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = nil, 
    originalBeginWorkRef = nil, 
    completeWorkRef = nil
};
local function v109(v106, v107, v108) --[[ Line: 246 ]]
    -- upvalues: v105 (copy)
    if not v105.originalBeginWorkRef then
        v105.originalBeginWorkRef = require(script.Parent["ReactFiberBeginWork.new"]).beginWork;
    end;
    return v105.originalBeginWorkRef(v106, v107, v108);
end;
local function _(v110, v111, v112) --[[ Line: 257 ]]
    -- upvalues: v105 (copy)
    if not v105.completeWorkRef then
        v105.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
    end;
    return v105.completeWorkRef(v110, v111, v112);
end;
local v114 = nil;
local function _() --[[ Line: 271 ]] --[[ Name: initReactFiberHooks ]]
    -- upvalues: v114 (ref), v105 (copy)
    v114 = require(script.Parent["ReactFiberHooks.new"]);
    v105.resetHooksAfterThrowRef = v114.resetHooksAfterThrow;
    v105.ContextOnlyDispatcherRef = v114.ContextOnlyDispatcher;
    v105.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v114.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
end;
local function _() --[[ Line: 279 ]]
    -- upvalues: v105 (copy), v114 (ref)
    if not v105.resetHooksAfterThrowRef then
        v114 = require(script.Parent["ReactFiberHooks.new"]);
        v105.resetHooksAfterThrowRef = v114.resetHooksAfterThrow;
        v105.ContextOnlyDispatcherRef = v114.ContextOnlyDispatcher;
        v105.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v114.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    return v105.resetHooksAfterThrowRef();
end;
local function _() --[[ Line: 287 ]]
    -- upvalues: v105 (copy), v114 (ref)
    if not v105.ContextOnlyDispatcherRef then
        v114 = require(script.Parent["ReactFiberHooks.new"]);
        v105.resetHooksAfterThrowRef = v114.resetHooksAfterThrow;
        v105.ContextOnlyDispatcherRef = v114.ContextOnlyDispatcher;
        v105.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v114.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    return v105.ContextOnlyDispatcherRef;
end;
local function _() --[[ Line: 295 ]]
    -- upvalues: v105 (copy), v114 (ref)
    if not v105.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
        v114 = require(script.Parent["ReactFiberHooks.new"]);
        v105.resetHooksAfterThrowRef = v114.resetHooksAfterThrow;
        v105.ContextOnlyDispatcherRef = v114.ContextOnlyDispatcher;
        v105.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v114.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    return v105.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef();
end;
local l_createCapturedValue_0 = require(script.Parent.ReactCapturedValue).createCapturedValue;
local l_push_0 = v16.push;
local l_pop_0 = v16.pop;
local l_createCursor_0 = v16.createCursor;
local v123 = require(script.Parent["ReactProfilerTimer.new"]);
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v125 = require(script.Parent["ReactStrictModeWarnings.new"]);
local v126 = require(script.Parent.ReactCurrentFiber);
local l_current_0 = v126.current;
local l_resetCurrentFiber_0 = v126.resetCurrentFiber;
local l_setCurrentFiber_0 = v126.setCurrentFiber;
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
local v141 = nil;
local v142 = nil;
local v143 = {};
v3.NoContext = 0;
v3.RetryAfterError = 64;
local v144 = {
    Incomplete = 0, 
    FatalErrored = 1, 
    Errored = 2, 
    Suspended = 3, 
    SuspendedWithDelay = 4, 
    Completed = 5
};
local v145 = 0;
local v146 = nil;
local v147 = nil;
local l_NoLanes_0 = v13.NoLanes;
v3.subtreeRenderLanes = v13.NoLanes;
local v149 = l_createCursor_0(v13.NoLanes);
local l_Incomplete_0 = v144.Incomplete;
local v151 = nil;
local l_NoLanes_1 = v13.NoLanes;
local v153 = require(script.Parent.ReactFiberWorkInProgress);
local l_workInProgressRootSkippedLanes_0 = v153.workInProgressRootSkippedLanes;
local l_NoLanes_2 = v13.NoLanes;
local l_NoLanes_3 = v13.NoLanes;
local v157 = nil;
local v158 = 0;
local v159 = 1e999;
local v160 = nil;
local function _() --[[ Line: 421 ]] --[[ Name: resetRenderTimer ]]
    -- upvalues: v159 (ref), l_now_0 (copy)
    v159 = l_now_0() + 500;
end;
v3.getRenderTargetTime = function() --[[ Line: 425 ]]
    -- upvalues: v159 (ref)
    return v159;
end;
local v162 = false;
local v163 = nil;
local v164 = nil;
local v165 = false;
local v166 = nil;
local l_l_NoPriority_0_0 = l_NoPriority_0;
local l_NoLanes_4 = v13.NoLanes;
local v169 = nil;
local v170 = 0;
local v171 = nil;
local v172 = 0;
local v173 = nil;
local l_l_NoTimestamp_0_0 = l_NoTimestamp_0;
local l_NoLanes_5 = v13.NoLanes;
local l_NoLanes_6 = v13.NoLanes;
local v177 = nil;
local v178 = false;
v3.getWorkInProgressRoot = function() --[[ Line: 466 ]]
    -- upvalues: v146 (ref)
    return v146;
end;
v3.requestEventTime = function() --[[ Line: 470 ]]
    -- upvalues: v145 (ref), l_now_0 (copy), l_l_NoTimestamp_0_0 (ref), l_NoTimestamp_0 (copy)
    if bit32.band(v145, 48) ~= 0 then
        return l_now_0();
    elseif l_l_NoTimestamp_0_0 ~= l_NoTimestamp_0 then
        return l_l_NoTimestamp_0_0;
    else
        l_l_NoTimestamp_0_0 = l_now_0();
        return l_l_NoTimestamp_0_0;
    end;
end;
v3.requestUpdateLane = function(v179) --[[ Line: 489 ]]
    -- upvalues: v45 (copy), l_SyncLane_0 (copy), l_getCurrentPriorityLevel_0 (copy), l_ImmediatePriority_0 (copy), l_SyncBatchedLane_0 (copy), l_ReactFeatureFlags_0 (copy), v145 (ref), l_NoLanes_0 (ref), v13 (copy), l_pickArbitraryLane_0 (copy), l_NoLanes_5 (ref), l_NoLanes_1 (ref), v79 (copy), l_NoLanes_6 (ref), v157 (ref), l_findTransitionLane_0 (copy), l_UserBlockingPriority_0 (copy), l_findUpdateLane_0 (copy), l_schedulerPriorityToLanePriority_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_console_0 (copy)
    local l_mode_0 = v179.mode;
    if bit32.band(l_mode_0, v45.BlockingMode) == v45.NoMode then
        return l_SyncLane_0;
    elseif bit32.band(l_mode_0, v45.ConcurrentMode) == v45.NoMode then
        return l_getCurrentPriorityLevel_0() == l_ImmediatePriority_0 and l_SyncLane_0 or l_SyncBatchedLane_0;
    elseif not l_ReactFeatureFlags_0.deferRenderPhaseUpdateToNextBatch and bit32.band(v145, 16) ~= 0 and l_NoLanes_0 ~= v13.NoLanes then
        return l_pickArbitraryLane_0(l_NoLanes_0);
    else
        if l_NoLanes_5 == v13.NoLanes then
            l_NoLanes_5 = l_NoLanes_1;
        end;
        if v79.requestCurrentTransition() ~= v79.NoTransition then
            if l_NoLanes_6 ~= v13.NoLanes then
                if v157 ~= nil then
                    l_NoLanes_6 = v157.pendingLanes;
                else
                    l_NoLanes_6 = v13.NoLanes;
                end;
            end;
            return l_findTransitionLane_0(l_NoLanes_5, l_NoLanes_6);
        else
            local v181 = l_getCurrentPriorityLevel_0();
            local _ = nil;
            if bit32.band(v145, 4) ~= 0 and v181 == l_UserBlockingPriority_0 then
                return (l_findUpdateLane_0(v13.InputDiscreteLanePriority, l_NoLanes_5));
            else
                local v183 = l_schedulerPriorityToLanePriority_0(v181);
                if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
                    local v184 = l_getCurrentUpdateLanePriority_0();
                    if v183 ~= v184 and v184 ~= v13.NoLanePriority and _G.__DEV__ then
                        l_console_0.error("Expected current scheduler lane priority %s to match current update lane priority %s", tostring(v183), (tostring(v184)));
                    end;
                end;
                return (l_findUpdateLane_0(v183, l_NoLanes_5));
            end;
        end;
    end;
end;
requestRetryLane = function(v185) --[[ Line: 593 ]] --[[ Name: requestRetryLane ]]
    -- upvalues: v45 (copy), l_SyncLane_0 (copy), l_getCurrentPriorityLevel_0 (copy), l_ImmediatePriority_0 (copy), l_SyncBatchedLane_0 (copy), l_NoLanes_5 (ref), v13 (copy), l_NoLanes_1 (ref), l_findRetryLane_0 (copy)
    local l_mode_1 = v185.mode;
    if bit32.band(l_mode_1, v45.BlockingMode) == v45.NoMode then
        return l_SyncLane_0;
    elseif bit32.band(l_mode_1, v45.ConcurrentMode) == v45.NoMode then
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
v3.scheduleUpdateOnFiber = function(v187, v188, v189) --[[ Line: 615 ]]
    -- upvalues: v143 (copy), l_markRootUpdated_0 (copy), v146 (ref), l_ReactFeatureFlags_0 (copy), v145 (ref), l_NoLanes_2 (ref), l_mergeLanes_0 (copy), l_Incomplete_0 (ref), v144 (copy), l_NoLanes_0 (ref), l_getCurrentPriorityLevel_0 (copy), l_SyncLane_0 (copy), v104 (ref), v159 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy), l_UserBlockingPriority_0 (copy), l_ImmediatePriority_0 (copy), v169 (ref), v157 (ref)
    v143.checkForNestedUpdates();
    local v190 = v143.markUpdateLaneFromFiberToRoot(v187, v188);
    if v190 == nil then
        return nil;
    else
        l_markRootUpdated_0(v190, v188, v189);
        if v190 == v146 then
            v143.warnAboutRenderPhaseUpdatesInDEV(v187);
            if l_ReactFeatureFlags_0.deferRenderPhaseUpdateToNextBatch or bit32.band(v145, 16) == 0 then
                l_NoLanes_2 = l_mergeLanes_0(l_NoLanes_2, v188);
            end;
            if l_Incomplete_0 == v144.SuspendedWithDelay then
                v143.markRootSuspended(v190, l_NoLanes_0);
            end;
        end;
        local v191 = l_getCurrentPriorityLevel_0();
        if v188 == l_SyncLane_0 then
            if bit32.band(v145, 8) ~= 0 and bit32.band(v145, 48) == 0 then
                v143.schedulePendingInteractions(v190, v188);
                v143.performSyncWorkOnRoot(v190);
            else
                v104(v190, v189);
                v143.schedulePendingInteractions(v190, v188);
                if v145 == 0 then
                    v159 = l_now_0() + 500;
                    l_flushSyncCallbackQueue_0();
                end;
            end;
        else
            if bit32.band(v145, 4) ~= 0 and (v191 == l_UserBlockingPriority_0 or v191 == l_ImmediatePriority_0) then
                if v169 == nil then
                    v169 = {
                        [v190] = true
                    };
                else
                    v169[v190] = true;
                end;
            end;
            v104(v190, v189);
            v143.schedulePendingInteractions(v190, v188);
        end;
        v157 = v190;
        return v190;
    end;
end;
v143.markUpdateLaneFromFiberToRoot = function(v192, v193) --[[ Line: 725 ]]
    -- upvalues: l_mergeLanes_0 (copy), v48 (copy), v143 (copy), v46 (copy)
    v192.lanes = l_mergeLanes_0(v192.lanes, v193);
    local l_alternate_0 = v192.alternate;
    if l_alternate_0 ~= nil then
        l_alternate_0.lanes = l_mergeLanes_0(l_alternate_0.lanes, v193);
    end;
    if _G.__DEV__ and l_alternate_0 == nil and bit32.band(v192.flags, (bit32.bor(v48.Placement, v48.Hydrating))) ~= v48.NoFlags then
        v143.warnAboutUpdateOnNotYetMountedFiberInDEV(v192);
    end;
    local l_v192_0 = v192;
    local l_return__0 = v192.return_;
    while l_return__0 ~= nil do
        l_return__0.childLanes = l_mergeLanes_0(l_return__0.childLanes, v193);
        l_alternate_0 = l_return__0.alternate;
        if l_alternate_0 ~= nil then
            l_alternate_0.childLanes = l_mergeLanes_0(l_alternate_0.childLanes, v193);
        elseif _G.__DEV__ and bit32.band(l_return__0.flags, (bit32.bor(v48.Placement, v48.Hydrating))) ~= v48.NoFlags then
            v143.warnAboutUpdateOnNotYetMountedFiberInDEV(v192);
        end;
        l_v192_0 = l_return__0;
        l_return__0 = l_return__0.return_;
    end;
    if l_v192_0.tag == v46.HostRoot then
        return l_v192_0.stateNode;
    else
        return nil;
    end;
end;
v104 = function(v197, v198) --[[ Line: 774 ]]
    -- upvalues: l_markStarvedLanesAsExpired_0 (copy), v146 (ref), l_NoLanes_0 (ref), v13 (copy), l_getNextLanes_0 (copy), l_returnNextLanesPriority_0 (copy), l_cancelCallback_0 (copy), l_scheduleSyncCallback_0 (copy), v143 (copy), l_scheduleCallback_0 (copy), l_ImmediatePriority_0 (copy), l_lanePriorityToSchedulerPriority_0 (copy)
    local l_callbackNode_0 = v197.callbackNode;
    l_markStarvedLanesAsExpired_0(v197, v198);
    local v200 = nil;
    v200 = if v197 == v146 then l_NoLanes_0 else v13.NoLanes;
    local v201 = l_getNextLanes_0(v197, v200);
    local v202 = l_returnNextLanesPriority_0();
    if v201 == v13.NoLanes then
        if l_callbackNode_0 ~= nil then
            l_cancelCallback_0(l_callbackNode_0);
            v197.callbackNode = nil;
            v197.callbackPriority = v13.NoLanePriority;
        end;
        return;
    else
        if l_callbackNode_0 ~= nil then
            if v197.callbackPriority == v202 then
                return;
            else
                l_cancelCallback_0(l_callbackNode_0);
            end;
        end;
        local v203 = nil;
        if v202 == v13.SyncLanePriority then
            v203 = l_scheduleSyncCallback_0(function() --[[ Line: 823 ]]
                -- upvalues: v143 (ref), v197 (copy)
                return v143.performSyncWorkOnRoot(v197);
            end);
        elseif v202 == v13.SyncBatchedLanePriority then
            v203 = l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 830 ]]
                -- upvalues: v143 (ref), v197 (copy)
                return v143.performSyncWorkOnRoot(v197);
            end);
        else
            local v204 = l_lanePriorityToSchedulerPriority_0(v202);
            v203 = l_scheduleCallback_0(v204, function() --[[ Line: 840 ]]
                -- upvalues: v143 (ref), v197 (copy)
                return v143.performConcurrentWorkOnRoot(v197);
            end);
        end;
        v197.callbackPriority = v202;
        v197.callbackNode = v203;
        return;
    end;
end;
v143.performConcurrentWorkOnRoot = function(v205) --[[ Line: 853 ]]
    -- upvalues: l_l_NoTimestamp_0_0 (ref), l_NoTimestamp_0 (copy), l_NoLanes_5 (ref), v13 (copy), l_NoLanes_6 (ref), l_invariant_0 (copy), v145 (ref), v3 (copy), l_getNextLanes_0 (copy), v146 (ref), l_NoLanes_0 (ref), v143 (copy), l_includesSomeLane_0 (copy), l_NoLanes_1 (ref), l_NoLanes_2 (ref), v144 (copy), v43 (copy), l_getLanesToRetrySynchronouslyOnError_0 (copy), v151 (ref), v104 (ref), l_now_0 (copy)
    l_l_NoTimestamp_0_0 = l_NoTimestamp_0;
    l_NoLanes_5 = v13.NoLanes;
    l_NoLanes_6 = v13.NoLanes;
    l_invariant_0(bit32.band(v145, 48) == 0, "Should not already be working.");
    local l_callbackNode_1 = v205.callbackNode;
    if v3.flushPassiveEffects() and v205.callbackNode ~= l_callbackNode_1 then
        return nil;
    else
        local v207 = l_getNextLanes_0(v205, if v205 == v146 then l_NoLanes_0 else v13.NoLanes);
        if v207 == v13.NoLanes then
            return nil;
        else
            local v208 = v143.renderRootConcurrent(v205, v207);
            if l_includesSomeLane_0(l_NoLanes_1, l_NoLanes_2) then
                v143.prepareFreshStack(v205, v13.NoLanes);
            elseif v208 ~= v144.Incomplete then
                if v208 == v144.Errored then
                    v145 = bit32.bor(v145, 64);
                    if v205.hydrate then
                        v205.hydrate = false;
                        v43.clearContainer(v205.containerInfo);
                    end;
                    v207 = l_getLanesToRetrySynchronouslyOnError_0(v205);
                    if v207 ~= v13.NoLanes then
                        v208 = v143.renderRootSync(v205, v207);
                    end;
                end;
                if v208 == v144.FatalErrored then
                    local l_v151_0 = v151;
                    v143.prepareFreshStack(v205, v13.NoLanes);
                    v143.markRootSuspended(v205, v207);
                    v104(v205, l_now_0());
                    error(l_v151_0);
                end;
                v205.finishedWork = v205.current.alternate;
                v205.finishedLanes = v207;
                v143.finishConcurrentRender(v205, v208, v207);
            end;
            v104(v205, l_now_0());
            if v205.callbackNode == l_callbackNode_1 then
                return function() --[[ Line: 949 ]]
                    -- upvalues: v143 (ref), v205 (copy)
                    return v143.performConcurrentWorkOnRoot(v205);
                end;
            else
                return nil;
            end;
        end;
    end;
end;
local v210 = 0;
local v211 = false;
shouldForceFlushFallbacksInDEV = function() --[[ Line: 962 ]] --[[ Name: shouldForceFlushFallbacksInDEV ]]
    -- upvalues: v210 (ref)
    return _G.__DEV__ and v210 > 0;
end;
v143.finishConcurrentRender = function(v212, v213, v214) --[[ Line: 967 ]]
    -- upvalues: v144 (copy), l_invariant_0 (copy), v143 (copy), l_includesOnlyRetries_0 (copy), v158 (ref), l_now_0 (copy), l_getNextLanes_0 (copy), v13 (copy), l_isSubsetOfLanes_0 (copy), v3 (copy), l_markRootPinged_0 (copy), v43 (copy), l_includesOnlyTransitions_0 (copy), l_getMostRecentEventTime_0 (copy)
    if v213 == v144.Incomplete or v213 == v144.FatalErrored then
        l_invariant_0(false, "Root did not complete. This is a bug in React.");
        return;
    elseif v213 == v144.Errored then
        v143.commitRoot(v212);
        return;
    elseif v213 == v144.Suspended then
        v143.markRootSuspended(v212, v214);
        if l_includesOnlyRetries_0(v214) and not shouldForceFlushFallbacksInDEV() then
            local v215 = v158 + 500 - l_now_0();
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
                        v212.timeoutHandle = v43.scheduleTimeout(function() --[[ Line: 1015 ]]
                            -- upvalues: v143 (ref), v212 (copy)
                            return v143.commitRoot(v212);
                        end, v215);
                        return;
                    end;
                end;
            end;
        end;
        v143.commitRoot(v212);
        return;
    elseif v213 == v144.SuspendedWithDelay then
        v143.markRootSuspended(v212, v214);
        if l_includesOnlyTransitions_0(v214) then
            return;
        else
            if not shouldForceFlushFallbacksInDEV() then
                local v218 = l_getMostRecentEventTime_0(v212, v214);
                local v219 = l_now_0() - v218;
                local v220 = jnd(v219) - v219;
                if v220 > 10 then
                    v212.timeoutHandle = v43.scheduleTimeout(function() --[[ Line: 1051 ]]
                        -- upvalues: v143 (ref), v212 (copy)
                        return v143.commitRoot(v212);
                    end, v220);
                    return;
                end;
            end;
            v143.commitRoot(v212);
            return;
        end;
    elseif v213 == v144.Completed then
        v143.commitRoot(v212);
        return;
    else
        l_invariant_0(false, "Unknown root exit status.");
        return;
    end;
end;
v143.markRootSuspended = function(v221, v222) --[[ Line: 1067 ]]
    -- upvalues: l_removeLanes_0 (copy), l_NoLanes_3 (ref), l_NoLanes_2 (ref), l_markRootSuspended_0 (copy)
    v222 = l_removeLanes_0(v222, l_NoLanes_3);
    v222 = l_removeLanes_0(v222, l_NoLanes_2);
    l_markRootSuspended_0(v221, v222);
end;
v143.performSyncWorkOnRoot = function(v223) --[[ Line: 1079 ]]
    -- upvalues: l_invariant_0 (copy), v145 (ref), v3 (copy), v146 (ref), l_includesSomeLane_0 (copy), l_NoLanes_0 (ref), v143 (copy), l_NoLanes_1 (ref), l_NoLanes_2 (ref), l_getNextLanes_0 (copy), v13 (copy), l_LegacyRoot_0 (copy), v144 (copy), v43 (copy), l_getLanesToRetrySynchronouslyOnError_0 (copy), v151 (ref), v104 (ref), l_now_0 (copy)
    l_invariant_0(bit32.band(v145, 48) == 0, "Should not already be working.");
    v3.flushPassiveEffects();
    local v224 = nil;
    local v225 = nil;
    if v223 == v146 and l_includesSomeLane_0(v223.expiredLanes, l_NoLanes_0) then
        v224 = l_NoLanes_0;
        v225 = v143.renderRootSync(v223, v224);
        if l_includesSomeLane_0(l_NoLanes_1, l_NoLanes_2) then
            v224 = l_getNextLanes_0(v223, v224);
            v225 = v143.renderRootSync(v223, v224);
        end;
    else
        v224 = l_getNextLanes_0(v223, v13.NoLanes);
        v225 = v143.renderRootSync(v223, v224);
    end;
    if v223.tag ~= l_LegacyRoot_0 and v225 == v144.Errored then
        v145 = bit32.bor(v145, 64);
        if v223.hydrate then
            v223.hydrate = false;
            v43.clearContainer(v223.containerInfo);
        end;
        v224 = l_getLanesToRetrySynchronouslyOnError_0(v223);
        if v224 ~= v13.NoLanes then
            v225 = v143.renderRootSync(v223, v224);
        end;
    end;
    if v225 == v144.FatalErrored then
        local l_v151_1 = v151;
        v143.prepareFreshStack(v223, v13.NoLanes);
        v143.markRootSuspended(v223, v224);
        v104(v223, l_now_0());
        error(l_v151_1);
    end;
    v223.finishedWork = v223.current.alternate;
    v223.finishedLanes = v224;
    v143.commitRoot(v223);
    v104(v223, l_now_0());
    return nil;
end;
v3.flushRoot = function(v227, v228) --[[ Line: 1161 ]]
    -- upvalues: l_markRootExpired_0 (copy), v104 (ref), l_now_0 (copy), v145 (ref), v159 (ref), l_flushSyncCallbackQueue_0 (copy)
    l_markRootExpired_0(v227, v228);
    v104(v227, l_now_0());
    if bit32.band(v145, 48) == 0 then
        v159 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
end;
v3.getExecutionContext = function() --[[ Line: 1170 ]]
    -- upvalues: v145 (ref)
    return v145;
end;
v3.flushDiscreteUpdates = function() --[[ Line: 1174 ]]
    -- upvalues: v145 (ref), l_console_0 (copy), v143 (copy), v3 (copy)
    if bit32.band(v145, 49) ~= 0 then
        if _G.__DEV__ and bit32.band(v145, 16) ~= 0 then
            l_console_0.error("unstable_flushDiscreteUpdates: Cannot flush updates when React is " .. "already rendering.");
        end;
        return;
    else
        v143.flushPendingDiscreteUpdates();
        v3.flushPassiveEffects();
        return;
    end;
end;
v3.deferredUpdates = function(v229) --[[ Line: 1202 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v13 (copy), l_runWithPriority_0 (copy), l_describeError_0 (copy), l_NormalPriority_0 (copy)
    if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        local v230 = l_getCurrentUpdateLanePriority_0();
        local v231 = nil;
        local v232 = nil;
        if not _G.__YOLO__ then
            l_setCurrentUpdateLanePriority_0(v13.DefaultLanePriority);
            local v233, v234 = xpcall(l_runWithPriority_0, l_describeError_0, l_NormalPriority_0, v229);
            v231 = v233;
            v232 = v234;
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
v143.flushPendingDiscreteUpdates = function() --[[ Line: 1230 ]]
    -- upvalues: v169 (ref), l_markDiscreteUpdatesExpired_0 (copy), v104 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    if v169 ~= nil then
        local l_v169_0 = v169;
        v169 = nil;
        for v236, _ in l_v169_0 do
            l_markDiscreteUpdatesExpired_0(v236);
            v104(v236, l_now_0());
        end;
    end;
    l_flushSyncCallbackQueue_0();
end;
v3.batchedUpdates = function(v238, v239) --[[ Line: 1247 ]]
    -- upvalues: v145 (ref), l_describeError_0 (copy), v159 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v145_0 = v145;
    v145 = bit32.bor(v145, 1);
    local v241 = nil;
    local v242 = nil;
    if not _G.__YOLO__ then
        local v243, v244 = xpcall(v238, l_describeError_0, v239);
        v241 = v243;
        v242 = v244;
    else
        v241 = true;
        v242 = v238(v239);
    end;
    v145 = l_v145_0;
    if v145 == 0 then
        v159 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if v241 then
        return v242;
    else
        error(v242);
        return;
    end;
end;
v3.batchedEventUpdates = function(v245, v246) --[[ Line: 1275 ]]
    -- upvalues: v145 (ref), l_describeError_0 (copy), v159 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v145_1 = v145;
    v145 = bit32.bor(v145, 2);
    local v248 = nil;
    local v249 = nil;
    if not _G.__YOLO__ then
        local v250, v251 = xpcall(v245, l_describeError_0, v246);
        v248 = v250;
        v249 = v251;
    else
        v248 = true;
        v249 = v245(v246);
    end;
    v145 = l_v145_1;
    if v145 == 0 then
        v159 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if v248 then
        return v249;
    else
        error(v249);
        return;
    end;
end;
v3.discreteUpdates = function(v252, v253, v254, v255, v256) --[[ Line: 1304 ]]
    -- upvalues: v145 (ref), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v13 (copy), l_runWithPriority_0 (copy), l_describeError_0 (copy), l_UserBlockingPriority_0 (copy), v159 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v145_2 = v145;
    v145 = bit32.bor(v145, 4);
    if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        local v258 = l_getCurrentUpdateLanePriority_0();
        l_setCurrentUpdateLanePriority_0(v13.InputDiscreteLanePriority);
        local v259, v260 = xpcall(l_runWithPriority_0, l_describeError_0, l_UserBlockingPriority_0, function() --[[ Line: 1315 ]]
            -- upvalues: v252 (copy), v253 (copy), v254 (copy), v255 (copy), v256 (copy)
            return v252(v253, v254, v255, v256);
        end);
        l_setCurrentUpdateLanePriority_0(v258);
        v145 = l_v145_2;
        if v145 == 0 then
            v159 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if v259 then
            return v260;
        else
            error(v260);
            return;
        end;
    else
        local v261, v262 = xpcall(l_runWithPriority_0, l_describeError_0, l_UserBlockingPriority_0, function() --[[ Line: 1338 ]]
            -- upvalues: v252 (copy), v253 (copy), v254 (copy), v255 (copy), v256 (copy)
            return v252(v253, v254, v255, v256);
        end);
        v145 = l_v145_2;
        if v145 == 0 then
            v159 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if v261 then
            return v262;
        else
            error(v262);
            return;
        end;
    end;
end;
v3.unbatchedUpdates = function(v263, v264) --[[ Line: 1359 ]]
    -- upvalues: v145 (ref), l_describeError_0 (copy), v159 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v145_3 = v145;
    v145 = bit32.band(v145, 4294967294);
    v145 = bit32.bor(v145, 8);
    local v266 = nil;
    local v267 = nil;
    if not _G.__YOLO__ then
        local v268, v269 = xpcall(v263, l_describeError_0, v264);
        v266 = v268;
        v267 = v269;
    else
        v266 = true;
        v267 = v263(v264);
    end;
    v145 = l_v145_3;
    if v145 == 0 then
        v159 = l_now_0() + 500;
        l_flushSyncCallbackQueue_0();
    end;
    if v266 then
        return v267;
    else
        error(v267);
        return;
    end;
end;
v3.flushSync = function(v270, v271) --[[ Line: 1387 ]]
    -- upvalues: v145 (ref), l_console_0 (copy), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v13 (copy), l_runWithPriority_0 (copy), l_describeError_0 (copy), l_ImmediatePriority_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v145_4 = v145;
    if bit32.band(l_v145_4, 48) ~= 0 then
        if _G.__DEV__ then
            l_console_0.error("flushSync was called from inside a lifecycle method. React cannot " .. "flush when React is already rendering. Consider moving this call to " .. "a scheduler task or micro task.");
        end;
        return v270(v271);
    else
        v145 = bit32.bor(v145, 1);
        if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
            local v273 = l_getCurrentUpdateLanePriority_0();
            l_setCurrentUpdateLanePriority_0(v13.SyncLanePriority);
            local v274 = nil;
            local v275 = nil;
            if not _G.__YOLO__ then
                if v270 then
                    local v276, v277 = xpcall(l_runWithPriority_0, l_describeError_0, l_ImmediatePriority_0, function() --[[ Line: 1413 ]]
                        -- upvalues: v270 (copy), v271 (copy)
                        return v270(v271);
                    end);
                    v274 = v276;
                    v275 = v277;
                else
                    v274 = true;
                    v275 = nil;
                end;
            else
                v274 = true;
                l_setCurrentUpdateLanePriority_0(v13.SyncLanePriority);
                v275 = if v270 then l_runWithPriority_0(l_ImmediatePriority_0, function() --[[ Line: 1426 ]]
                    -- upvalues: v270 (copy), v271 (copy)
                    return v270(v271);
                end) else nil;
            end;
            l_setCurrentUpdateLanePriority_0(v273);
            v145 = l_v145_4;
            l_flushSyncCallbackQueue_0();
            if not v274 then
                error(v275);
            end;
            return v275;
        else
            local v278 = nil;
            local v279 = nil;
            if not _G.__YOLO__ then
                if v270 then
                    local v280, v281 = xpcall(l_runWithPriority_0, l_describeError_0, l_ImmediatePriority_0, function() --[[ Line: 1455 ]]
                        -- upvalues: v270 (copy), v271 (copy)
                        return v270(v271);
                    end);
                    v278 = v280;
                    v279 = v281;
                else
                    v278 = true;
                    v279 = nil;
                end;
            else
                v278 = true;
                v279 = if v270 then l_runWithPriority_0(l_ImmediatePriority_0, function() --[[ Line: 1467 ]]
                    -- upvalues: v270 (copy), v271 (copy)
                    return v270(v271);
                end) else nil;
            end;
            v145 = l_v145_4;
            l_flushSyncCallbackQueue_0();
            if not v278 then
                error(v279);
            end;
            return v279;
        end;
    end;
end;
v3.flushControlled = function(v282) --[[ Line: 1488 ]]
    -- upvalues: v145 (ref), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v13 (copy), l_runWithPriority_0 (copy), l_describeError_0 (copy), l_ImmediatePriority_0 (copy), v159 (ref), l_now_0 (copy), l_flushSyncCallbackQueue_0 (copy)
    local l_v145_5 = v145;
    v145 = bit32.bor(v145, 1);
    if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
        local v284 = l_getCurrentUpdateLanePriority_0();
        l_setCurrentUpdateLanePriority_0(v13.SyncLanePriority);
        local v285, v286 = xpcall(l_runWithPriority_0, l_describeError_0, l_ImmediatePriority_0, v282);
        l_setCurrentUpdateLanePriority_0(v284);
        v145 = l_v145_5;
        if v145 == 0 then
            v159 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if not v285 then
            error(v286);
            return;
        end;
    else
        local v287, v288 = xpcall(l_runWithPriority_0, l_describeError_0, l_ImmediatePriority_0, v282);
        v145 = l_v145_5;
        if v145 == 0 then
            v159 = l_now_0() + 500;
            l_flushSyncCallbackQueue_0();
        end;
        if not v287 then
            error(v288);
        end;
    end;
end;
v3.pushRenderLanes = function(v289, v290) --[[ Line: 1526 ]]
    -- upvalues: l_push_0 (copy), v149 (copy), v3 (copy), l_mergeLanes_0 (copy), l_NoLanes_1 (ref)
    l_push_0(v149, v3.subtreeRenderLanes, v289);
    v3.subtreeRenderLanes = l_mergeLanes_0(v3.subtreeRenderLanes, v290);
    l_NoLanes_1 = l_mergeLanes_0(l_NoLanes_1, v290);
end;
v3.popRenderLanes = function(v291) --[[ Line: 1535 ]]
    -- upvalues: v3 (copy), v149 (copy), l_pop_0 (copy)
    v3.subtreeRenderLanes = v149.current;
    l_pop_0(v149, v291);
end;
v143.prepareFreshStack = function(v292, v293) --[[ Line: 1540 ]]
    -- upvalues: v13 (copy), v43 (copy), v147 (ref), l_unwindInterruptedWork_0 (copy), v146 (ref), v44 (copy), l_NoLanes_0 (ref), v3 (copy), l_NoLanes_1 (ref), l_Incomplete_0 (ref), v144 (copy), v151 (ref), l_workInProgressRootSkippedLanes_0 (copy), l_NoLanes_2 (ref), l_NoLanes_3 (ref), l_ReactFeatureFlags_0 (copy), v173 (ref), v125 (copy)
    v292.finishedWork = nil;
    v292.finishedLanes = v13.NoLanes;
    local l_timeoutHandle_0 = v292.timeoutHandle;
    if l_timeoutHandle_0 ~= v43.noTimeout then
        v292.timeoutHandle = v43.noTimeout;
        v43.cancelTimeout(l_timeoutHandle_0);
    end;
    if v147 ~= nil then
        local l_return__1 = v147.return_;
        while l_return__1 ~= nil do
            l_unwindInterruptedWork_0(l_return__1);
            l_return__1 = l_return__1.return_;
        end;
    end;
    v146 = v292;
    v147 = v44.createWorkInProgress(v292.current, nil);
    l_NoLanes_0 = v293;
    v3.subtreeRenderLanes = v293;
    l_NoLanes_1 = v293;
    l_Incomplete_0 = v144.Incomplete;
    v151 = nil;
    l_workInProgressRootSkippedLanes_0(v13.NoLanes);
    l_NoLanes_2 = v13.NoLanes;
    l_NoLanes_3 = v13.NoLanes;
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        v173 = nil;
    end;
    if _G.__DEV__ then
        v125.discardPendingWarnings();
    end;
end;
v143.handleError = function(v296, v297) --[[ Line: 1580 ]]
    -- upvalues: v147 (ref), l_resetContextDependencies_0 (copy), v105 (copy), v114 (ref), l_resetCurrentFiber_0 (copy), l_ReactCurrentOwner_0 (copy), l_Incomplete_0 (ref), v144 (copy), v151 (ref), l_ReactFeatureFlags_0 (copy), v45 (copy), v123 (copy), l_throwException_0 (copy), l_NoLanes_0 (ref), v3 (copy), v143 (copy)
    while true do
        local l_v147_0 = v147;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 1584 ]]
            -- upvalues: l_resetContextDependencies_0 (ref), v105 (ref), v114 (ref), l_resetCurrentFiber_0 (ref), l_ReactCurrentOwner_0 (ref), l_v147_0 (ref), l_Incomplete_0 (ref), v144 (ref), v151 (ref), v297 (ref), v147 (ref), l_ReactFeatureFlags_0 (ref), v45 (ref), v123 (ref), l_throwException_0 (ref), v296 (copy), l_NoLanes_0 (ref), v3 (ref), v143 (ref)
            l_resetContextDependencies_0();
            if not v105.resetHooksAfterThrowRef then
                v114 = require(script.Parent["ReactFiberHooks.new"]);
                v105.resetHooksAfterThrowRef = v114.resetHooksAfterThrow;
                v105.ContextOnlyDispatcherRef = v114.ContextOnlyDispatcher;
                v105.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v114.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
            end;
            local _ = v105.resetHooksAfterThrowRef();
            l_resetCurrentFiber_0();
            l_ReactCurrentOwner_0.current = nil;
            if l_v147_0 == nil or l_v147_0.return_ == nil then
                l_Incomplete_0 = v144.FatalErrored;
                v151 = v297;
                v147 = nil;
                return;
            else
                if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(l_v147_0.mode, v45.ProfileMode) ~= 0 then
                    v123.stopProfilerTimerIfRunningAndRecordDelta(l_v147_0, true);
                end;
                l_throwException_0(v296, l_v147_0.return_, l_v147_0, v297, l_NoLanes_0, v3.onUncaughtError, v3.renderDidError);
                v143.completeUnitOfWork(l_v147_0);
                return;
            end;
        end);
        if not l_status_0 then
            v297 = l_result_0;
            if v147 == l_v147_0 and l_v147_0 ~= nil then
                l_v147_0 = l_v147_0.return_;
                v147 = l_v147_0;
            else
                l_v147_0 = v147;
            end;
            --[[ close >= 2 ]]
        else
            break;
        end;
    end;
end;
v143.pushDispatcher = function() --[[ Line: 1649 ]]
    -- upvalues: l_ReactCurrentDispatcher_0 (copy), v105 (copy), v114 (ref)
    local l_current_1 = l_ReactCurrentDispatcher_0.current;
    local l_l_ReactCurrentDispatcher_0_0 = l_ReactCurrentDispatcher_0;
    if not v105.ContextOnlyDispatcherRef then
        v114 = require(script.Parent["ReactFiberHooks.new"]);
        v105.resetHooksAfterThrowRef = v114.resetHooksAfterThrow;
        v105.ContextOnlyDispatcherRef = v114.ContextOnlyDispatcher;
        v105.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v114.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
    end;
    l_l_ReactCurrentDispatcher_0_0.current = v105.ContextOnlyDispatcherRef;
    if l_current_1 == nil then
        if not v105.ContextOnlyDispatcherRef then
            v114 = require(script.Parent["ReactFiberHooks.new"]);
            v105.resetHooksAfterThrowRef = v114.resetHooksAfterThrow;
            v105.ContextOnlyDispatcherRef = v114.ContextOnlyDispatcher;
            v105.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v114.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
        end;
        return v105.ContextOnlyDispatcherRef;
    else
        return l_current_1;
    end;
end;
v143.popDispatcher = function(v304) --[[ Line: 1666 ]]
    -- upvalues: l_ReactCurrentDispatcher_0 (copy)
    l_ReactCurrentDispatcher_0.current = v304;
end;
v143.pushInteractions = function(v305) --[[ Line: 1670 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___interactionsRef_0 (copy)
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        local l_current_2 = l___interactionsRef_0.current;
        l___interactionsRef_0.current = v305.memoizedInteractions;
        return l_current_2;
    else
        return nil;
    end;
end;
v143.popInteractions = function(v307) --[[ Line: 1679 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___interactionsRef_0 (copy)
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        l___interactionsRef_0.current = v307;
    end;
end;
v3.markCommitTimeOfFallback = function() --[[ Line: 1685 ]]
    -- upvalues: v158 (ref), l_now_0 (copy)
    v158 = l_now_0();
end;
v3.markSkippedUpdateLanes = function(v308) --[[ Line: 1689 ]]
    -- upvalues: v153 (copy)
    v153.markSkippedUpdateLanes(v308);
end;
v3.renderDidSuspend = function() --[[ Line: 1693 ]]
    -- upvalues: l_Incomplete_0 (ref), v144 (copy)
    if l_Incomplete_0 == v144.Incomplete then
        l_Incomplete_0 = v144.Suspended;
    end;
end;
v3.renderDidSuspendDelayIfPossible = function() --[[ Line: 1699 ]]
    -- upvalues: l_Incomplete_0 (ref), v144 (copy), v146 (ref), l_includesNonIdleWork_0 (copy), l_workInProgressRootSkippedLanes_0 (copy), l_NoLanes_2 (ref), v143 (copy), l_NoLanes_0 (ref)
    if l_Incomplete_0 == v144.Incomplete or l_Incomplete_0 == v144.Suspended then
        l_Incomplete_0 = v144.SuspendedWithDelay;
    end;
    if v146 ~= nil and (l_includesNonIdleWork_0(l_workInProgressRootSkippedLanes_0()) or l_includesNonIdleWork_0(l_NoLanes_2)) then
        v143.markRootSuspended(v146, l_NoLanes_0);
    end;
end;
v3.renderDidError = function() --[[ Line: 1725 ]]
    -- upvalues: l_Incomplete_0 (ref), v144 (copy)
    if l_Incomplete_0 ~= v144.Completed then
        l_Incomplete_0 = v144.Errored;
    end;
end;
v3.renderHasNotSuspendedYet = function() --[[ Line: 1733 ]]
    -- upvalues: l_Incomplete_0 (ref), v144 (copy)
    return l_Incomplete_0 == v144.Incomplete;
end;
v143.renderRootSync = function(v309, v310) --[[ Line: 1739 ]]
    -- upvalues: v145 (ref), v143 (copy), v146 (ref), l_NoLanes_0 (ref), l_ReactFeatureFlags_0 (copy), v38 (copy), v39 (copy), l_describeError_0 (copy), l_resetContextDependencies_0 (copy), v147 (ref), l_invariant_0 (copy), v13 (copy), l_Incomplete_0 (ref)
    local l_v145_6 = v145;
    v145 = bit32.bor(v145, 16);
    local v312 = v143.pushDispatcher();
    if v146 ~= v309 or l_NoLanes_0 ~= v310 then
        v143.prepareFreshStack(v309, v310);
        v143.startWorkOnPendingInteractions(v309, v310);
    end;
    local v313 = v143.pushInteractions(v309);
    if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
        v38.logRenderStarted(v310);
    end;
    if l_ReactFeatureFlags_0.enableSchedulingProfiler then
        v39.markRenderStarted(v310);
    end;
    while true do
        local v314 = nil;
        local v315 = nil;
        if not _G.__YOLO__ then
            local v316, v317 = xpcall(v143.workLoopSync, l_describeError_0);
            v314 = v316;
            v315 = v317;
        else
            v314 = true;
            v143.workLoopSync();
        end;
        if not v314 then
            v143.handleError(v309, v315);
        else
            break;
        end;
    end;
    l_resetContextDependencies_0();
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        v143.popInteractions(v313);
    end;
    v145 = l_v145_6;
    v143.popDispatcher(v312);
    if v147 ~= nil then
        l_invariant_0(false, "Cannot commit an incomplete root. This error is likely caused by a " .. "bug in React. Please file an issue.");
    end;
    if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
        v38.logRenderStopped();
    end;
    if l_ReactFeatureFlags_0.enableSchedulingProfiler then
        v39.markRenderStopped();
    end;
    v146 = nil;
    l_NoLanes_0 = v13.NoLanes;
    return l_Incomplete_0;
end;
v143.workLoopSync = function() --[[ Line: 1815 ]]
    -- upvalues: v147 (ref), v143 (copy)
    while v147 ~= nil do
        v143.performUnitOfWork(v147);
    end;
end;
v143.renderRootConcurrent = function(v318, v319) --[[ Line: 1822 ]]
    -- upvalues: v145 (ref), v143 (copy), v146 (ref), l_NoLanes_0 (ref), v159 (ref), l_now_0 (copy), l_ReactFeatureFlags_0 (copy), v38 (copy), v39 (copy), l_describeError_0 (copy), l_resetContextDependencies_0 (copy), v147 (ref), v144 (copy), v13 (copy), l_Incomplete_0 (ref)
    local l_v145_7 = v145;
    v145 = bit32.bor(v145, 16);
    local v321 = v143.pushDispatcher();
    if v146 ~= v318 or l_NoLanes_0 ~= v319 then
        v159 = l_now_0() + 500;
        v143.prepareFreshStack(v318, v319);
        v143.startWorkOnPendingInteractions(v318, v319);
    end;
    local v322 = v143.pushInteractions(v318);
    if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
        v38.logRenderStarted(v319);
    end;
    if l_ReactFeatureFlags_0.enableSchedulingProfiler then
        v39.markRenderStarted(v319);
    end;
    while true do
        local v323 = nil;
        local v324 = nil;
        if not _G.__YOLO__ then
            local v325, v326 = xpcall(v143.workLoopConcurrent, l_describeError_0);
            v323 = v325;
            v324 = v326;
            if v323 then
                v324 = "break";
            end;
        else
            v323 = true;
            v324 = "break";
            v143.workLoopConcurrent();
        end;
        if v324 ~= "break" then
            if not v323 then
                v143.handleError(v318, v324);
            end;
        else
            break;
        end;
    end;
    l_resetContextDependencies_0();
    if l_ReactFeatureFlags_0.enableSchedulerTracing then
        v143.popInteractions(v322);
    end;
    v143.popDispatcher(v321);
    v145 = l_v145_7;
    if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
        v38.logRenderStopped();
    end;
    if v147 ~= nil then
        if l_ReactFeatureFlags_0.enableSchedulingProfiler then
            v39.markRenderYielded();
        end;
        return v144.Incomplete;
    else
        if l_ReactFeatureFlags_0.enableSchedulingProfiler then
            v39.markRenderStopped();
        end;
        v146 = nil;
        l_NoLanes_0 = v13.NoLanes;
        return l_Incomplete_0;
    end;
end;
v143.workLoopConcurrent = function() --[[ Line: 1906 ]]
    -- upvalues: v147 (ref), l_shouldYield_0 (copy), v143 (copy)
    while v147 ~= nil and not l_shouldYield_0() do
        v143.performUnitOfWork(v147);
    end;
end;
v143.performUnitOfWork = function(v327) --[[ Line: 1913 ]]
    -- upvalues: l_setCurrentFiber_0 (copy), l_ReactFeatureFlags_0 (copy), v45 (copy), v123 (copy), v143 (copy), v3 (copy), l_resetCurrentFiber_0 (copy), v147 (ref), l_ReactCurrentOwner_0 (copy)
    local l_alternate_1 = v327.alternate;
    l_setCurrentFiber_0(v327);
    local v329 = nil;
    if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(v327.mode, v45.ProfileMode) ~= v45.NoMode then
        v123.startProfilerTimer(v327);
        v329 = v143.beginWork(l_alternate_1, v327, v3.subtreeRenderLanes);
        v123.stopProfilerTimerIfRunningAndRecordDelta(v327, true);
    else
        v329 = v143.beginWork(l_alternate_1, v327, v3.subtreeRenderLanes);
    end;
    l_resetCurrentFiber_0();
    v327.memoizedProps = v327.pendingProps;
    if v329 == nil then
        v143.completeUnitOfWork(v327);
    else
        v147 = v329;
    end;
    l_ReactCurrentOwner_0.current = nil;
end;
v143.completeUnitOfWork = function(v330) --[[ Line: 1941 ]]
    -- upvalues: v48 (copy), l_setCurrentFiber_0 (copy), l_ReactFeatureFlags_0 (copy), v45 (copy), v3 (copy), v105 (copy), v123 (copy), l_resetCurrentFiber_0 (copy), v147 (ref), l_unwindWork_0 (copy), l_Incomplete_0 (ref), v144 (copy)
    local l_v330_0 = v330;
    while true do
        local l_alternate_2 = l_v330_0.alternate;
        local l_return__2 = l_v330_0.return_;
        if bit32.band(l_v330_0.flags, v48.Incomplete) == v48.NoFlags then
            l_setCurrentFiber_0(l_v330_0);
            local v334 = nil;
            if not l_ReactFeatureFlags_0.enableProfilerTimer or bit32.band(l_v330_0.mode, v45.ProfileMode) == v45.NoMode then
                local l_l_v330_0_0 = l_v330_0;
                local l_subtreeRenderLanes_0 = v3.subtreeRenderLanes;
                if not v105.completeWorkRef then
                    v105.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
                end;
                v334 = v105.completeWorkRef(l_alternate_2, l_l_v330_0_0, l_subtreeRenderLanes_0);
            else
                v123.startProfilerTimer(l_v330_0);
                local l_l_v330_0_1 = l_v330_0;
                local l_subtreeRenderLanes_1 = v3.subtreeRenderLanes;
                if not v105.completeWorkRef then
                    v105.completeWorkRef = require(script.Parent["ReactFiberCompleteWork.new"]).completeWork;
                end;
                v334 = v105.completeWorkRef(l_alternate_2, l_l_v330_0_1, l_subtreeRenderLanes_1);
                v123.stopProfilerTimerIfRunningAndRecordDelta(l_v330_0, false);
            end;
            l_resetCurrentFiber_0();
            if v334 ~= nil then
                v147 = v334;
                return;
            end;
        else
            local v339 = l_unwindWork_0(l_v330_0, v3.subtreeRenderLanes);
            if v339 ~= nil then
                v339.flags = bit32.band(v339.flags, v48.HostEffectMask);
                v147 = v339;
                return;
            else
                if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(l_v330_0.mode, v45.ProfileMode) ~= v45.NoMode then
                    v123.stopProfilerTimerIfRunningAndRecordDelta(l_v330_0, false);
                    local v340 = l_v330_0.actualDuration or 0;
                    local l_child_0 = l_v330_0.child;
                    while l_child_0 ~= nil do
                        v340 = v340 + (l_child_0.actualDuration or 0);
                        l_child_0 = l_child_0.sibling;
                    end;
                    l_v330_0.actualDuration = v340;
                end;
                if l_return__2 ~= nil then
                    l_return__2.flags = bit32.bor(l_return__2.flags, v48.Incomplete);
                    l_return__2.subtreeFlags = v48.NoFlags;
                    l_return__2.deletions = nil;
                end;
            end;
        end;
        local l_sibling_0 = l_v330_0.sibling;
        if l_sibling_0 ~= nil then
            v147 = l_sibling_0;
            return;
        else
            l_v330_0 = l_return__2;
            v147 = l_v330_0;
            if l_v330_0 == nil then
                if l_Incomplete_0 == v144.Incomplete then
                    l_Incomplete_0 = v144.Completed;
                end;
                return;
            end;
        end;
    end;
end;
v143.commitRoot = function(v343) --[[ Line: 2037 ]]
    -- upvalues: l_getCurrentPriorityLevel_0 (copy), l_runWithPriority_0 (copy), l_ImmediatePriority_0 (copy), v143 (copy)
    local v344 = l_getCurrentPriorityLevel_0();
    l_runWithPriority_0(l_ImmediatePriority_0, function() --[[ Line: 2041 ]]
        -- upvalues: v143 (ref), v343 (copy), v344 (copy)
        return v143.commitRootImpl(v343, v344);
    end);
    return nil;
end;
v143.commitRootImpl = function(v345, v346) --[[ Line: 2049 ]]
    -- upvalues: v3 (copy), v166 (ref), l_invariant_0 (copy), v145 (ref), l_ReactFeatureFlags_0 (copy), v38 (copy), v39 (copy), v13 (copy), l_mergeLanes_0 (copy), l_markRootFinished_0 (copy), v169 (ref), l_hasDiscreteLanes_0 (copy), v146 (ref), v147 (ref), l_NoLanes_0 (ref), v48 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), v143 (copy), l_ReactCurrentOwner_0 (copy), v177 (ref), v43 (copy), v178 (ref), v123 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_recursivelyCommitLayoutEffects_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v141 (ref), l_resetCurrentFiber_0 (copy), l_describeError_0 (copy), v165 (ref), l_scheduleCallback_0 (copy), l_NormalPriority_0 (copy), l_requestPaint_0 (copy), l_NoLanes_4 (ref), l_l_NoPriority_0_0 (ref), v173 (ref), v164 (ref), l_enableDoubleInvokingEffects_0 (copy), l_SyncLane_0 (copy), v171 (ref), v170 (ref), l_onCommitRoot_0 (copy), l_onCommitRoot_1 (copy), v104 (ref), l_now_0 (copy), v162 (ref), v163 (ref), l_flushSyncCallbackQueue_0 (copy)
    repeat
        v3.flushPassiveEffects();
    until v166 == nil;
    flushRenderPhaseStrictModeWarningsInDEV();
    l_invariant_0(bit32.band(v145, 48) == 0, "Should not already be working.");
    local l_finishedWork_0 = v345.finishedWork;
    local l_finishedLanes_0 = v345.finishedLanes;
    if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
        v38.logCommitStarted(l_finishedLanes_0);
    end;
    if l_ReactFeatureFlags_0.enableSchedulingProfiler then
        v39.markCommitStarted(l_finishedLanes_0);
    end;
    if l_finishedWork_0 == nil then
        if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
            v38.logCommitStopped();
        end;
        if l_ReactFeatureFlags_0.enableSchedulingProfiler then
            v39.markCommitStopped();
        end;
        return nil;
    else
        v345.finishedWork = nil;
        v345.finishedLanes = v13.NoLanes;
        l_invariant_0(l_finishedWork_0 ~= v345.current, "Cannot commit the same tree as before. This error is likely caused by " .. "a bug in React. Please file an issue.");
        v345.callbackNode = nil;
        local v349 = l_mergeLanes_0(l_finishedWork_0.lanes, l_finishedWork_0.childLanes);
        l_markRootFinished_0(v345, v349);
        if v169 ~= nil and not l_hasDiscreteLanes_0(v349) and v169[v345] ~= nil then
            v169[v345] = nil;
        end;
        if v345 == v146 then
            v146 = nil;
            v147 = nil;
            l_NoLanes_0 = v13.NoLanes;
        end;
        local v350 = bit32.band(l_finishedWork_0.subtreeFlags, (bit32.bor(v48.BeforeMutationMask, v48.MutationMask, v48.LayoutMask, v48.PassiveMask))) ~= v48.NoFlags;
        local v351 = bit32.band(l_finishedWork_0.flags, (bit32.bor(v48.BeforeMutationMask, v48.MutationMask, v48.LayoutMask, v48.PassiveMask))) ~= v48.NoFlags;
        if v350 or v351 then
            local v352 = nil;
            if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
                v352 = l_getCurrentUpdateLanePriority_0();
                l_setCurrentUpdateLanePriority_0(v13.SyncLanePriority);
            end;
            local l_v145_8 = v145;
            v145 = bit32.bor(v145, 32);
            local v354 = v143.pushInteractions(v345);
            l_ReactCurrentOwner_0.current = nil;
            v177 = v43.prepareForCommit(v345.containerInfo);
            v178 = false;
            v143.commitBeforeMutationEffects(l_finishedWork_0);
            v177 = nil;
            if l_ReactFeatureFlags_0.enableProfilerTimer then
                v123.recordCommitTime();
            end;
            v143.commitMutationEffects(l_finishedWork_0, v345, v346);
            if v178 then
                v43.afterActiveInstanceBlur();
            end;
            v43.resetAfterCommit(v345.containerInfo);
            v345.current = l_finishedWork_0;
            if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
                v38.logLayoutEffectsStarted(l_finishedLanes_0);
            end;
            if l_ReactFeatureFlags_0.enableSchedulingProfiler then
                v39.markLayoutEffectsStarted(l_finishedLanes_0);
            end;
            if _G.__DEV__ then
                l_setCurrentFiber_0(l_finishedWork_0);
                l_invokeGuardedCallback_0(nil, l_recursivelyCommitLayoutEffects_0, nil, l_finishedWork_0, v345, v3.captureCommitPhaseError, v3.schedulePassiveEffectCallback);
                if l_hasCaughtError_0() then
                    local v355 = l_clearCaughtError_0();
                    v141(l_finishedWork_0, l_finishedWork_0, v355);
                end;
                l_resetCurrentFiber_0();
            else
                local v356 = nil;
                local v357 = nil;
                if not _G.__YOLO__ then
                    local v358, v359 = xpcall(l_recursivelyCommitLayoutEffects_0, l_describeError_0, l_finishedWork_0, v345, v3.captureCommitPhaseError, v3.schedulePassiveEffectCallback);
                    v356 = v358;
                    v357 = v359;
                else
                    v356 = true;
                    l_recursivelyCommitLayoutEffects_0(l_finishedWork_0, v345, v3.captureCommitPhaseError, v3.schedulePassiveEffectCallback);
                end;
                if not v356 then
                    v141(l_finishedWork_0, l_finishedWork_0, v357);
                end;
            end;
            if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
                v38.logLayoutEffectsStopped();
            end;
            if l_ReactFeatureFlags_0.enableSchedulingProfiler then
                v39.markLayoutEffectsStopped();
            end;
            if (bit32.band(l_finishedWork_0.subtreeFlags, v48.PassiveMask) ~= v48.NoFlags or bit32.band(l_finishedWork_0.flags, v48.PassiveMask) ~= v48.NoFlags) and not v165 then
                v165 = true;
                l_scheduleCallback_0(l_NormalPriority_0, function() --[[ Line: 2266 ]]
                    -- upvalues: v3 (ref)
                    v3.flushPassiveEffects();
                    return nil;
                end);
            end;
            l_requestPaint_0();
            if l_ReactFeatureFlags_0.enableSchedulerTracing then
                v143.popInteractions(v354);
            end;
            v145 = l_v145_8;
            if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler and v352 ~= nil then
                l_setCurrentUpdateLanePriority_0(v352);
            end;
        else
            v345.current = l_finishedWork_0;
            if l_ReactFeatureFlags_0.enableProfilerTimer then
                v123.recordCommitTime();
            end;
        end;
        local l_v165_0 = v165;
        if v165 then
            v165 = false;
            v166 = v345;
            l_NoLanes_4 = l_finishedLanes_0;
            l_l_NoPriority_0_0 = v346;
        end;
        v349 = v345.pendingLanes;
        if v349 ~= v13.NoLanes then
            if l_ReactFeatureFlags_0.enableSchedulerTracing then
                if v173 ~= nil then
                    local l_v173_0 = v173;
                    v173 = nil;
                    for v362 = 1, #l_v173_0 do
                        scheduleInteractions(v345, l_v173_0[v362], v345.memoizedInteractions);
                    end;
                end;
                v143.schedulePendingInteractions(v345, v349);
            end;
        else
            v164 = nil;
        end;
        if _G.__DEV__ and l_enableDoubleInvokingEffects_0 and not l_v165_0 then
            commitDoubleInvokeEffectsInDEV(v345.current, false);
        end;
        if l_ReactFeatureFlags_0.enableSchedulerTracing and not l_v165_0 then
            v143.finishPendingInteractions(v345, l_finishedLanes_0);
        end;
        if v349 == l_SyncLane_0 then
            if v345 == v171 then
                v170 = v170 + 1;
            else
                v170 = 0;
                v171 = v345;
            end;
        else
            v170 = 0;
        end;
        l_onCommitRoot_0(l_finishedWork_0.stateNode, v346);
        if _G.__DEV__ then
            l_onCommitRoot_1();
        end;
        v104(v345, l_now_0());
        if v162 then
            v162 = false;
            local l_v163_0 = v163;
            v163 = nil;
            error(l_v163_0);
        end;
        if bit32.band(v145, 8) ~= 0 then
            if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
                v38.logCommitStopped();
            end;
            if l_ReactFeatureFlags_0.enableSchedulingProfiler then
                v39.markCommitStopped();
            end;
            return nil;
        else
            l_flushSyncCallbackQueue_0();
            if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
                v38.logCommitStopped();
            end;
            if l_ReactFeatureFlags_0.enableSchedulingProfiler then
                v39.markCommitStopped();
            end;
            return nil;
        end;
    end;
end;
v143.commitBeforeMutationEffects = function(v364) --[[ Line: 2414 ]]
    -- upvalues: v143 (copy), v48 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v3 (copy), l_resetCurrentFiber_0 (copy), l_describeError_0 (copy)
    local l_v364_0 = v364;
    while l_v364_0 ~= nil do
        if l_v364_0.deletions ~= nil then
            v143.commitBeforeMutationEffectsDeletions(l_v364_0.deletions);
        end;
        if l_v364_0.child ~= nil and bit32.band(l_v364_0.subtreeFlags, v48.BeforeMutationMask) ~= v48.NoFlags then
            v143.commitBeforeMutationEffects(l_v364_0.child);
        end;
        if _G.__DEV__ then
            l_setCurrentFiber_0(l_v364_0);
            l_invokeGuardedCallback_0(nil, v143.commitBeforeMutationEffectsImpl, nil, l_v364_0);
            if l_hasCaughtError_0() then
                local v366 = l_clearCaughtError_0();
                v3.captureCommitPhaseError(l_v364_0, l_v364_0.return_, v366);
            end;
            l_resetCurrentFiber_0();
        else
            local v367 = nil;
            local v368 = nil;
            if not _G.__YOLO__ then
                local v369, v370 = xpcall(v143.commitBeforeMutationEffectsImpl, l_describeError_0, l_v364_0);
                v367 = v369;
                v368 = v370;
            else
                v367 = true;
                v143.commitBeforeMutationEffectsImpl(l_v364_0);
            end;
            if not v367 then
                v3.captureCommitPhaseError(l_v364_0, l_v364_0.return_, v368);
            end;
        end;
        l_v364_0 = l_v364_0.sibling;
    end;
end;
v143.commitBeforeMutationEffectsImpl = function(v371) --[[ Line: 2455 ]]
    -- upvalues: v178 (ref), v177 (ref), v46 (copy), v87 (copy), l_doesFiberContain_0 (copy), v43 (copy), v48 (copy), l_setCurrentFiber_0 (copy), l_commitBeforeMutationLifeCycles_0 (copy), l_resetCurrentFiber_0 (copy), v165 (ref), l_scheduleCallback_0 (copy), l_NormalPriority_0 (copy), v3 (copy)
    local l_alternate_3 = v371.alternate;
    local l_flags_0 = v371.flags;
    if not v178 and v177 ~= nil and v371.tag == v46.SuspenseComponent and v87.isSuspenseBoundaryBeingHidden(l_alternate_3, v371) and l_doesFiberContain_0(v371, v177) then
        v178 = true;
        v43.beforeActiveInstanceBlur();
    end;
    if bit32.band(l_flags_0, v48.Snapshot) ~= v48.NoFlags then
        l_setCurrentFiber_0(v371);
        l_commitBeforeMutationLifeCycles_0(l_alternate_3, v371);
        l_resetCurrentFiber_0();
    end;
    if bit32.band(l_flags_0, v48.Passive) ~= v48.NoFlags and not v165 then
        v165 = true;
        l_scheduleCallback_0(l_NormalPriority_0, function() --[[ Line: 2483 ]]
            -- upvalues: v3 (ref)
            v3.flushPassiveEffects();
            return nil;
        end);
    end;
end;
v143.commitBeforeMutationEffectsDeletions = function(v374) --[[ Line: 2491 ]]
    -- upvalues: l_doesFiberContain_0 (copy), v177 (ref), v178 (ref), v43 (copy)
    for v375 = 1, #v374 do
        local v376 = v374[v375];
        if l_doesFiberContain_0(v376, v177) then
            v178 = true;
            v43.beforeActiveInstanceBlur();
        end;
    end;
end;
v143.commitMutationEffects = function(v377, v378, v379) --[[ Line: 2506 ]]
    -- upvalues: l_commitDeletion_0 (copy), l_describeError_0 (copy), v3 (copy), v48 (copy), v143 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), l_resetCurrentFiber_0 (copy)
    local l_v377_0 = v377;
    while l_v377_0 ~= nil do
        local l_deletions_0 = l_v377_0.deletions;
        if l_deletions_0 ~= nil then
            for _, v383 in l_deletions_0 do
                local v384, v385 = xpcall(l_commitDeletion_0, l_describeError_0, v378, v383, l_v377_0, v379);
                if not v384 then
                    v3.captureCommitPhaseError(v383, l_v377_0, v385);
                end;
            end;
        end;
        if l_v377_0.child ~= nil and bit32.band(l_v377_0.subtreeFlags, v48.MutationMask) ~= v48.NoFlags then
            v143.commitMutationEffects(l_v377_0.child, v378, v379);
        end;
        if _G.__DEV__ then
            l_setCurrentFiber_0(l_v377_0);
            l_invokeGuardedCallback_0(nil, v143.commitMutationEffectsImpl, nil, l_v377_0, v378, v379);
            if l_hasCaughtError_0() then
                local v386 = l_clearCaughtError_0();
                v3.captureCommitPhaseError(l_v377_0, l_v377_0.return_, v386);
            end;
            l_resetCurrentFiber_0();
        else
            local v387 = nil;
            local v388 = nil;
            if not _G.__YOLO__ then
                local v389, v390 = xpcall(v143.commitMutationEffectsImpl, l_describeError_0, l_v377_0, v378, v379);
                v387 = v389;
                v388 = v390;
            else
                v387 = true;
                v143.commitMutationEffectsImpl(l_v377_0, v378, v379);
            end;
            if not v387 then
                v3.captureCommitPhaseError(l_v377_0, l_v377_0.return_, v388);
            end;
        end;
        l_v377_0 = l_v377_0.sibling;
    end;
end;
v143.commitMutationEffectsImpl = function(v391, _, _) --[[ Line: 2571 ]]
    -- upvalues: v48 (copy), l_commitDetachRef_0 (copy), l_commitPlacement_0 (copy), l_commitWork_0 (copy)
    local l_flags_1 = v391.flags;
    if bit32.band(l_flags_1, v48.Ref) ~= 0 then
        local l_alternate_4 = v391.alternate;
        if l_alternate_4 ~= nil then
            l_commitDetachRef_0(l_alternate_4);
        end;
    end;
    local v396 = bit32.band(l_flags_1, (bit32.bor(v48.Placement, v48.Update, v48.Hydrating)));
    if v396 == v48.Placement then
        l_commitPlacement_0(v391);
        v391.flags = bit32.band(v391.flags, (bit32.bnot(v48.Placement)));
        return;
    elseif v396 == v48.PlacementAndUpdate then
        l_commitPlacement_0(v391);
        v391.flags = bit32.band(v391.flags, (bit32.bnot(v48.Placement)));
        local l_alternate_5 = v391.alternate;
        l_commitWork_0(l_alternate_5, v391);
        return;
    else
        if v396 == v48.Update then
            local l_alternate_6 = v391.alternate;
            l_commitWork_0(l_alternate_6, v391);
        end;
        return;
    end;
end;
v143.commitMutationEffectsDeletions = function(v399, v400, v401, v402) --[[ Line: 2637 ]]
    -- upvalues: l_commitDeletion_0 (copy), l_describeError_0 (copy), v3 (copy)
    for _, v404 in v399 do
        local v405, v406 = xpcall(l_commitDeletion_0, l_describeError_0, v401, v404, v400, v402);
        if not v405 then
            v3.captureCommitPhaseError(v404, v400, v406);
        end;
    end;
end;
v3.schedulePassiveEffectCallback = function() --[[ Line: 2659 ]]
    -- upvalues: v165 (ref), l_scheduleCallback_0 (copy), l_NormalPriority_0 (copy), v3 (copy)
    if not v165 then
        v165 = true;
        l_scheduleCallback_0(l_NormalPriority_0, function() --[[ Line: 2662 ]]
            -- upvalues: v3 (ref)
            v3.flushPassiveEffects();
            return nil;
        end);
    end;
end;
local v407 = nil;
v3.flushPassiveEffects = function() --[[ Line: 2671 ]]
    -- upvalues: l_l_NoPriority_0_0 (ref), l_NoPriority_0 (copy), l_NormalPriority_0 (copy), l_ReactFeatureFlags_0 (copy), l_getCurrentUpdateLanePriority_0 (copy), l_setCurrentUpdateLanePriority_0 (copy), l_schedulerPriorityToLanePriority_0 (copy), l_runWithPriority_0 (copy), l_describeError_0 (copy), v407 (ref)
    if l_l_NoPriority_0_0 ~= l_NoPriority_0 then
        local v408 = if l_NormalPriority_0 < l_l_NoPriority_0_0 then l_NormalPriority_0 else l_l_NoPriority_0_0;
        l_l_NoPriority_0_0 = l_NoPriority_0;
        if l_ReactFeatureFlags_0.decoupleUpdatePriorityFromScheduler then
            local v409 = l_getCurrentUpdateLanePriority_0();
            l_setCurrentUpdateLanePriority_0(l_schedulerPriorityToLanePriority_0(v408));
            local v410 = nil;
            local v411 = nil;
            if not _G.__YOLO__ then
                local v412, v413 = xpcall(l_runWithPriority_0, l_describeError_0, v408, v407);
                v410 = v412;
                v411 = v413;
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
v142 = function(v414, v415) --[[ Line: 2711 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), v46 (copy), v160 (ref), v48 (copy), v142 (ref), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), l_commitPassiveMount_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v3 (copy), l_resetCurrentFiber_0 (copy), l_describeError_0 (copy)
    local l_v415_0 = v415;
    while l_v415_0 ~= nil do
        local v417 = nil;
        if l_ReactFeatureFlags_0.enableProfilerTimer and l_ReactFeatureFlags_0.enableProfilerCommitHooks and l_v415_0.tag == v46.Profiler then
            v417 = v160;
            v160 = l_v415_0;
        end;
        local v418 = bit32.band(l_v415_0.subtreeFlags, v48.PassiveMask);
        if l_v415_0.child ~= nil and v418 ~= v48.NoFlags then
            v142(v414, l_v415_0.child);
        end;
        if bit32.band(l_v415_0.flags, v48.Passive) ~= v48.NoFlags then
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
                    local v422, v423 = xpcall(l_commitPassiveMount_0, l_describeError_0, v414, l_v415_0);
                    v420 = v422;
                    v421 = v423;
                else
                    v420 = true;
                    l_commitPassiveMount_0(v414, l_v415_0);
                end;
                if not v420 then
                    v3.captureCommitPhaseError(l_v415_0, l_v415_0.return_, v421);
                end;
            end;
        end;
        if l_ReactFeatureFlags_0.enableProfilerTimer and l_ReactFeatureFlags_0.enableProfilerCommitHooks and l_v415_0.tag == v46.Profiler then
            if v417 ~= nil then
                local l_stateNode_0 = v417.stateNode;
                l_stateNode_0.passiveEffectDuration = l_stateNode_0.passiveEffectDuration + l_v415_0.stateNode.passiveEffectDuration;
            end;
            v160 = v417;
        end;
        l_v415_0 = l_v415_0.sibling;
    end;
end;
local function v425(v426) --[[ Line: 2777 ]] --[[ Name: flushPassiveUnmountEffects ]]
    -- upvalues: v143 (copy), v48 (copy), v425 (copy), l_setCurrentFiber_0 (copy), l_commitPassiveUnmount_0 (copy), l_resetCurrentFiber_0 (copy)
    local l_v426_0 = v426;
    while l_v426_0 ~= nil do
        local l_deletions_1 = l_v426_0.deletions;
        if l_deletions_1 ~= nil then
            for v429 = 1, #l_deletions_1 do
                local v430 = l_deletions_1[v429];
                v143.flushPassiveUnmountEffectsInsideOfDeletedTree(v430, l_v426_0);
                v143.detachFiberAfterEffects(v430);
            end;
        end;
        local l_child_1 = l_v426_0.child;
        if l_child_1 ~= nil and bit32.band(l_v426_0.subtreeFlags, v48.PassiveMask) ~= v48.NoFlags then
            v425(l_child_1);
        end;
        if bit32.band(l_v426_0.flags, v48.Passive) ~= v48.NoFlags then
            l_setCurrentFiber_0(l_v426_0);
            l_commitPassiveUnmount_0(l_v426_0);
            l_resetCurrentFiber_0();
        end;
        l_v426_0 = l_v426_0.sibling;
    end;
end;
v143.flushPassiveUnmountEffectsInsideOfDeletedTree = function(v432, v433) --[[ Line: 2815 ]]
    -- upvalues: v48 (copy), v143 (copy), l_setCurrentFiber_0 (copy), l_commitPassiveUnmountInsideDeletedTree_0 (copy), l_resetCurrentFiber_0 (copy)
    if bit32.band(v432.subtreeFlags, v48.PassiveStatic) ~= v48.NoFlags then
        local l_child_2 = v432.child;
        while l_child_2 ~= nil do
            v143.flushPassiveUnmountEffectsInsideOfDeletedTree(l_child_2, v433);
            l_child_2 = l_child_2.sibling;
        end;
    end;
    if bit32.band(v432.flags, v48.PassiveStatic) ~= v48.NoFlags then
        l_setCurrentFiber_0(v432);
        l_commitPassiveUnmountInsideDeletedTree_0(v432, v433);
        l_resetCurrentFiber_0();
    end;
end;
v407 = function() --[[ Line: 2844 ]]
    -- upvalues: v166 (ref), l_NoLanes_4 (ref), v13 (copy), l_invariant_0 (copy), v145 (ref), l_ReactFeatureFlags_0 (copy), v38 (copy), v39 (copy), v143 (copy), v425 (copy), v142 (ref), l_enableDoubleInvokingEffects_0 (copy), l_flushSyncCallbackQueue_0 (copy), v172 (ref)
    if v166 == nil then
        return false;
    else
        local l_v166_0 = v166;
        local l_l_NoLanes_4_0 = l_NoLanes_4;
        v166 = nil;
        l_NoLanes_4 = v13.NoLanes;
        l_invariant_0(bit32.band(v145, 48) == 0, "Cannot flush passive effects while already rendering.");
        if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
            v38.logPassiveEffectsStarted(l_l_NoLanes_4_0);
        end;
        if l_ReactFeatureFlags_0.enableSchedulingProfiler then
            v39.markPassiveEffectsStarted(l_l_NoLanes_4_0);
        end;
        local l_v145_9 = v145;
        v145 = bit32.bor(v145, 32);
        local v438 = v143.pushInteractions(l_v166_0);
        v425(l_v166_0.current);
        v142(l_v166_0, l_v166_0.current);
        if _G.__DEV__ and l_ReactFeatureFlags_0.enableDebugTracing then
            v38.logPassiveEffectsStopped();
        end;
        if l_ReactFeatureFlags_0.enableSchedulingProfiler then
            v39.markPassiveEffectsStopped();
        end;
        if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
            commitDoubleInvokeEffectsInDEV(l_v166_0.current, true);
        end;
        if l_ReactFeatureFlags_0.enableSchedulerTracing then
            v143.popInteractions(v438);
            v143.finishPendingInteractions(l_v166_0, l_l_NoLanes_4_0);
        end;
        v145 = l_v145_9;
        l_flushSyncCallbackQueue_0();
        if v166 == nil then
            v172 = 0;
        else
            v172 = v172 + 1;
        end;
        return true;
    end;
end;
v3.isAlreadyFailedLegacyErrorBoundary = function(v439) --[[ Line: 2917 ]]
    -- upvalues: v164 (ref)
    local v440 = false;
    if v164 ~= nil then
        v440 = v164:has(v439);
    end;
    return v440;
end;
v3.markLegacyErrorBoundaryAsFailed = function(v441) --[[ Line: 2923 ]]
    -- upvalues: v164 (ref), l_Set_0 (copy)
    if v164 == nil then
        v164 = l_Set_0.new({
            v441
        });
        return;
    else
        v164:add(v441);
        return;
    end;
end;
v3.onUncaughtError = function(v442) --[[ Line: 2932 ]] --[[ Name: prepareToThrowUncaughtError ]]
    -- upvalues: v162 (ref), v163 (ref)
    if not v162 then
        v162 = true;
        v163 = v442;
    end;
end;
v141 = function(v443, v444, v445) --[[ Line: 2940 ]]
    -- upvalues: l_createCapturedValue_0 (copy), l_createRootErrorUpdate_0 (copy), l_SyncLane_0 (copy), v3 (copy), l_enqueueUpdate_0 (copy), v143 (copy), l_markRootUpdated_0 (copy), v104 (ref)
    local v446 = l_createCapturedValue_0(v445, v444);
    local v447 = l_createRootErrorUpdate_0(v443, v446, l_SyncLane_0, v3.onUncaughtError);
    l_enqueueUpdate_0(v443, v447);
    local v448 = v3.requestEventTime();
    local v449 = v143.markUpdateLaneFromFiberToRoot(v443, l_SyncLane_0);
    if v449 ~= nil then
        l_markRootUpdated_0(v449, l_SyncLane_0, v448);
        v104(v449, v448);
        v143.schedulePendingInteractions(v449, l_SyncLane_0);
    end;
end;
v3.captureCommitPhaseError = function(v450, v451, v452) --[[ Line: 2963 ]]
    -- upvalues: v46 (copy), v141 (ref), l_skipUnmountedBoundaries_0 (copy), v3 (copy), l_createCapturedValue_0 (copy), l_createClassErrorUpdate_0 (copy), l_SyncLane_0 (copy), l_enqueueUpdate_0 (copy), v143 (copy), l_markRootUpdated_0 (copy), v104 (ref)
    if v450.tag == v46.HostRoot then
        v141(v450, v450, v452);
        return;
    else
        local v453 = nil;
        v453 = if l_skipUnmountedBoundaries_0 then v451 else v450.return_;
        while true do
            if v453 ~= nil then
                if v453.tag == v46.HostRoot then
                    v141(v453, v450, v452);
                    return;
                else
                    if v453.tag == v46.ClassComponent then
                        local l_type_0 = v453.type;
                        local l_stateNode_1 = v453.stateNode;
                        if typeof(l_type_0.getDerivedStateFromError) == "function" or typeof(l_stateNode_1.componentDidCatch) == "function" and not v3.isAlreadyFailedLegacyErrorBoundary(l_stateNode_1) then
                            local v456 = l_createCapturedValue_0(v452, v450);
                            local v457 = l_createClassErrorUpdate_0(v453, v456, l_SyncLane_0);
                            l_enqueueUpdate_0(v453, v457);
                            local v458 = v3.requestEventTime();
                            local v459 = v143.markUpdateLaneFromFiberToRoot(v453, l_SyncLane_0);
                            if v459 ~= nil then
                                l_markRootUpdated_0(v459, l_SyncLane_0, v458);
                                v104(v459, v458);
                                v143.schedulePendingInteractions(v459, l_SyncLane_0);
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
v3.pingSuspendedRoot = function(v460, v461, v462) --[[ Line: 3016 ]]
    -- upvalues: v3 (copy), l_markRootPinged_0 (copy), v146 (ref), l_isSubsetOfLanes_0 (copy), l_NoLanes_0 (ref), l_Incomplete_0 (ref), v144 (copy), l_includesOnlyRetries_0 (copy), l_now_0 (copy), v158 (ref), v143 (copy), v13 (copy), l_NoLanes_3 (ref), l_mergeLanes_0 (copy), v104 (ref)
    local l_pingCache_0 = v460.pingCache;
    if l_pingCache_0 ~= nil then
        l_pingCache_0[v461] = nil;
    end;
    local v464 = v3.requestEventTime();
    l_markRootPinged_0(v460, v462, v464);
    if v146 == v460 and l_isSubsetOfLanes_0(l_NoLanes_0, v462) then
        if l_Incomplete_0 == v144.SuspendedWithDelay or l_Incomplete_0 == v144.Suspended and l_includesOnlyRetries_0(l_NoLanes_0) and l_now_0() - v158 < 500 then
            v143.prepareFreshStack(v460, v13.NoLanes);
        else
            l_NoLanes_3 = l_mergeLanes_0(l_NoLanes_3, v462);
        end;
    end;
    v104(v460, v464);
    v143.schedulePendingInteractions(v460, v462);
end;
retryTimedOutBoundary = function(v465, v466) --[[ Line: 3066 ]] --[[ Name: retryTimedOutBoundary ]]
    -- upvalues: v13 (copy), v3 (copy), v143 (copy), l_markRootUpdated_0 (copy), v104 (ref)
    if v466 == v13.NoLane then
        v466 = requestRetryLane(v465);
    end;
    local v467 = v3.requestEventTime();
    local v468 = v143.markUpdateLaneFromFiberToRoot(v465, v466);
    if v468 ~= nil then
        l_markRootUpdated_0(v468, v466, v467);
        v104(v468, v467);
        v143.schedulePendingInteractions(v468, v466);
    end;
end;
v3.resolveRetryWakeable = function(v469, v470) --[[ Line: 3093 ]]
    -- upvalues: v13 (copy)
    local l_NoLane_0 = v13.NoLane;
    local v472 = nil;
    v472 = v469.stateNode;
    if v472 ~= nil then
        v472:delete(v470);
    end;
    retryTimedOutBoundary(v469, l_NoLane_0);
end;
jnd = function(v473) --[[ Line: 3137 ]] --[[ Name: jnd ]]
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
v143.checkForNestedUpdates = function() --[[ Line: 3155 ]]
    -- upvalues: v170 (ref), v171 (ref), l_invariant_0 (copy), v172 (ref), l_console_0 (copy)
    if v170 > 50 then
        v170 = 0;
        v171 = nil;
        l_invariant_0(false, "Maximum update depth exceeded. This can happen when a component " .. "repeatedly calls setState inside componentWillUpdate or " .. "componentDidUpdate. React limits the number of nested updates to " .. "prevent infinite loops.");
    end;
    if _G.__DEV__ and v172 > 50 then
        v172 = 0;
        l_console_0.error("Maximum update depth exceeded. This can happen when a component " .. "calls setState inside useEffect, but useEffect either doesn't " .. "have a dependency array, or one of the dependencies changes on " .. "every render.");
    end;
end;
flushRenderPhaseStrictModeWarningsInDEV = function() --[[ Line: 3181 ]] --[[ Name: flushRenderPhaseStrictModeWarningsInDEV ]]
    -- upvalues: v125 (copy), l_ReactFeatureFlags_0 (copy)
    if _G.__DEV__ then
        v125.flushLegacyContextWarning();
        if l_ReactFeatureFlags_0.warnAboutDeprecatedLifecycles then
            v125.flushPendingUnsafeLifecycleWarnings();
        end;
    end;
end;
commitDoubleInvokeEffectsInDEV = function(v474, v475) --[[ Line: 3191 ]] --[[ Name: commitDoubleInvokeEffectsInDEV ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), l_setCurrentFiber_0 (copy), v48 (copy), l_invokeLayoutEffectUnmountInDEV_0 (copy), l_invokePassiveEffectUnmountInDEV_0 (copy), l_invokeLayoutEffectMountInDEV_0 (copy), l_invokePassiveEffectMountInDEV_0 (copy), l_resetCurrentFiber_0 (copy)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        l_setCurrentFiber_0(v474);
        invokeEffectsInDev(v474, v48.MountLayoutDev, l_invokeLayoutEffectUnmountInDEV_0);
        if v475 then
            invokeEffectsInDev(v474, v48.MountPassiveDev, l_invokePassiveEffectUnmountInDEV_0);
        end;
        invokeEffectsInDev(v474, v48.MountLayoutDev, l_invokeLayoutEffectMountInDEV_0);
        if v475 then
            invokeEffectsInDev(v474, v48.MountPassiveDev, l_invokePassiveEffectMountInDEV_0);
        end;
        l_resetCurrentFiber_0();
    end;
end;
invokeEffectsInDev = function(v476, v477, v478) --[[ Line: 3214 ]] --[[ Name: invokeEffectsInDev ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), v48 (copy)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        local l_v476_0 = v476;
        while l_v476_0 ~= nil do
            if l_v476_0.child ~= nil and bit32.band(l_v476_0.subtreeFlags, v477) ~= v48.NoFlags then
                invokeEffectsInDev(l_v476_0.child, v477, v478);
            end;
            if bit32.band(l_v476_0.flags, v477) ~= v48.NoFlags then
                v478(l_v476_0);
            end;
            l_v476_0 = l_v476_0.sibling;
        end;
    end;
end;
local v480 = nil;
v143.warnAboutUpdateOnNotYetMountedFiberInDEV = function(v481) --[[ Line: 3240 ]]
    -- upvalues: v145 (ref), v45 (copy), v46 (copy), l_getComponentName_0 (copy), v480 (ref), v126 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_resetCurrentFiber_0 (copy)
    if _G.__DEV__ then
        if bit32.band(v145, 16) ~= 0 then
            return;
        elseif bit32.band(v481.mode, (bit32.bor(v45.BlockingMode, v45.ConcurrentMode))) == 0 then
            return;
        else
            local l_tag_0 = v481.tag;
            if l_tag_0 ~= v46.IndeterminateComponent and l_tag_0 ~= v46.HostRoot and l_tag_0 ~= v46.ClassComponent and l_tag_0 ~= v46.FunctionComponent and l_tag_0 ~= v46.ForwardRef and l_tag_0 ~= v46.MemoComponent and l_tag_0 ~= v46.SimpleMemoComponent and l_tag_0 ~= v46.Block then
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
                local l_current_3 = v126.current;
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 3280 ]]
                    -- upvalues: l_setCurrentFiber_0 (ref), v481 (copy), l_console_0 (ref)
                    l_setCurrentFiber_0(v481);
                    l_console_0.error("Can't perform a React state update on a component that hasn't mounted yet. " .. "This indicates that you have a side-effect in your render function that " .. "asynchronously later calls tries to update the component. Move this work to " .. "useEffect instead.");
                end);
                if l_current_3 then
                    l_setCurrentFiber_0(v481);
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
if _G.__DEV__ and l_ReactFeatureFlags_0.replayFailedUnitOfWorkWithInvokeGuardedCallback then
    v143.beginWork = function(v487, v488, v489) --[[ Line: 3307 ]]
        -- upvalues: v44 (copy), v109 (copy), l_describeError_0 (copy), l_resetContextDependencies_0 (copy), v105 (copy), v114 (ref), l_unwindInterruptedWork_0 (copy), l_ReactFeatureFlags_0 (copy), v45 (copy), v123 (copy), l_invokeGuardedCallback_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy)
        local v490 = v44.assignFiberPropertiesInDEV(nil, v488);
        local v491, v492 = xpcall(v109, l_describeError_0, v487, v488, v489);
        if not v491 then
            if v492 ~= nil and typeof(v492) == "table" and typeof(v492.andThen) == "function" then
                error(v492);
            end;
            l_resetContextDependencies_0();
            if not v105.resetHooksAfterThrowRef then
                v114 = require(script.Parent["ReactFiberHooks.new"]);
                v105.resetHooksAfterThrowRef = v114.resetHooksAfterThrow;
                v105.ContextOnlyDispatcherRef = v114.ContextOnlyDispatcher;
                v105.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v114.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
            end;
            local v493 = v105.resetHooksAfterThrowRef();
            l_unwindInterruptedWork_0(v488);
            v44.assignFiberPropertiesInDEV(v488, v490);
            if l_ReactFeatureFlags_0.enableProfilerTimer and bit32.band(v488.mode, v45.ProfileMode) ~= 0 then
                v123.startProfilerTimer(v488);
            end;
            l_invokeGuardedCallback_0(nil, v109, nil, v487, v488, v489);
            if l_hasCaughtError_0() then
                v493 = l_clearCaughtError_0();
                error(v493);
                return v492;
            else
                error(v492);
            end;
        end;
        return v492;
    end;
else
    v143.beginWork = v109;
end;
local v494 = false;
local v495 = nil;
if _G.__DEV__ then
    v495 = {};
end;
v143.warnAboutRenderPhaseUpdatesInDEV = function(v496) --[[ Line: 3383 ]]
    -- upvalues: v126 (copy), v145 (ref), v105 (copy), v114 (ref), v46 (copy), v147 (ref), l_getComponentName_0 (copy), v495 (ref), l_console_0 (copy), v494 (ref)
    if _G.__DEV__ and v126.isRendering and bit32.band(v145, 16) ~= 0 then
        if not v105.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef then
            v114 = require(script.Parent["ReactFiberHooks.new"]);
            v105.resetHooksAfterThrowRef = v114.resetHooksAfterThrow;
            v105.ContextOnlyDispatcherRef = v114.ContextOnlyDispatcher;
            v105.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef = v114.getIsUpdatingOpaqueValueInRenderPhaseInDEV;
        end;
        if not v105.getIsUpdatingOpaqueValueInRenderPhaseInDEVRef() then
            if v496.tag == v46.FunctionComponent or v496.tag == v46.ForwardRef or v496.tag == v46.SimpleMemoComponent then
                local v497 = if v147 ~= nil then l_getComponentName_0(v147.type) else "Unknown";
                if v495[v497] == nil then
                    v495[v497] = true;
                    local v498 = l_getComponentName_0(v496.type) or "Unknown";
                    l_console_0.error("Cannot update a component (`%s`) while rendering a " .. "different component (`%s`). To locate the bad setState() call inside `%s`, " .. "follow the stack trace as described in https://reactjs.org/link/setstate-in-render", v498, v497, v497);
                    return;
                end;
            elseif v496.tag == v46.ClassComponent and not v494 then
                l_console_0.error("Cannot update during an existing state transition (such as " .. "within `render`). Render methods should be a pure " .. "function of props and state.");
                v494 = true;
            end;
        end;
    end;
end;
v3.IsThisRendererActing = {
    current = false
};
v3.warnIfNotScopedWithMatchingAct = function(v499) --[[ Line: 3433 ]]
    -- upvalues: v43 (copy), l_IsSomeRendererActing_0 (copy), v3 (copy), v126 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_resetCurrentFiber_0 (copy)
    if _G.__DEV__ and v43.warnsIfNotActing == true and l_IsSomeRendererActing_0.current == true and v3.IsThisRendererActing.current ~= true then
        local l_current_4 = v126.current;
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 3441 ]]
            -- upvalues: l_setCurrentFiber_0 (ref), v499 (copy), l_console_0 (ref)
            l_setCurrentFiber_0(v499);
            l_console_0.error("It looks like you're using the wrong act() around your test interactions.\n" .. "Be sure to use the matching version of act() corresponding to your renderer:\n\n" .. "-- for react-roblox:\n" .. "local React = require(Packages.React)\n" .. "-- ...\n" .. "React.TestUtils.act(function() ... end)\n\n" .. "-- for react-test-renderer:\n" .. "local TestRenderer = require(Packages.ReactTestRenderer)\n" .. "-- ...\n" .. "TestRenderer.act(function() ... end)");
        end);
        if l_current_4 then
            l_setCurrentFiber_0(v499);
        else
            l_resetCurrentFiber_0();
        end;
        if not l_status_2 then
            error(l_result_2);
        end;
    end;
end;
v3.warnIfNotCurrentlyActingEffectsInDEV = function(v503) --[[ Line: 3477 ]]
    -- upvalues: v43 (copy), v45 (copy), l_IsSomeRendererActing_0 (copy), v3 (copy), l_console_0 (copy), l_getComponentName_0 (copy)
    if _G.__DEV__ and v43.warnsIfNotActing == true and bit32.band(v503.mode, v45.StrictMode) ~= v45.NoMode and l_IsSomeRendererActing_0.current == false and v3.IsThisRendererActing.current == false then
        l_console_0.error("An update to %s ran an effect, but was not wrapped in act(...).\n\n" .. "When testing, code that causes React state updates should be " .. "wrapped into act(...):\n\n" .. "act(function()\n" .. "  --[[ fire events that update state ]]\n" .. "end)\n" .. "--[[ assert on the output ]]\n\n" .. "This ensures that you're testing the behavior the user would see " .. "in the real client." .. " Learn more at https://reactjs.org/link/wrap-tests-with-act", l_getComponentName_0(v503.type));
    end;
end;
v3.warnIfNotCurrentlyActingUpdatesInDEV = function(v504) --[[ Line: 3503 ]]
    -- upvalues: v43 (copy), v145 (ref), l_IsSomeRendererActing_0 (copy), v3 (copy), l_current_0 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_resetCurrentFiber_0 (copy)
    if _G.__DEV__ and v43.warnsIfNotActing == true and v145 == 0 and l_IsSomeRendererActing_0.current == false and v3.IsThisRendererActing.current == false then
        local l_l_current_0_0 = l_current_0;
        local l_status_3, l_result_3 = pcall(function() --[[ Line: 3512 ]]
            -- upvalues: l_setCurrentFiber_0 (ref), v504 (copy), l_console_0 (ref), l_getComponentName_0 (ref)
            l_setCurrentFiber_0(v504);
            l_console_0.error("An update to %s inside a test was not wrapped in act(...).\n\n" .. "When testing, code that causes React state updates should be " .. "wrapped into act(...):\n\n" .. "act(function()\n" .. "  --[[ fire events that update state ]]\n" .. "end)\n" .. "--[[ assert on the output ]]\n\n" .. "This ensures that you're testing the behavior the user would see " .. "in the client application." .. " Learn more at https://reactjs.org/link/wrap-tests-with-act", l_getComponentName_0(v504.type));
        end);
        if l_l_current_0_0 then
            l_setCurrentFiber_0(v504);
        else
            l_resetCurrentFiber_0();
        end;
        if l_status_3 then
            return l_result_3;
        end;
    end;
end;
local v508 = false;
v3.warnIfUnmockedScheduler = function(v509) --[[ Line: 3553 ]]
    -- upvalues: v508 (ref), v14 (copy), v45 (copy), l_console_0 (copy), l_ReactFeatureFlags_0 (copy)
    if _G.__DEV__ and v508 == false and v14.unstable_flushAllWithoutAsserting == nil then
        if bit32.band(v509.mode, v45.BlockingMode) ~= 0 or bit32.band(v509.mode, v45.ConcurrentMode) ~= 0 then
            v508 = true;
            l_console_0.error("In Concurrent or Sync modes, the 'scheduler' module needs to be mocked " .. "to guarantee consistent behaviour across tests and client application. " .. "For example, with RobloxJest: \n" .. "RobloxJest.mock('scheduler', function() return require(Packages.Scheduler).unstable_mock end)\n\n" .. "For more info, visit https://reactjs.org/link/mock-scheduler");
            return;
        elseif l_ReactFeatureFlags_0.warnAboutUnmockedScheduler == true then
            v508 = true;
            l_console_0.error("Starting from React v18, the 'scheduler' module will need to be mocked " .. "to guarantee consistent behaviour across tests and client applications. " .. "For example, with RobloxJest: \n" .. "RobloxJest.mock('scheduler', function() return require(Packages.Scheduler).unstable_mock end)\n\n" .. "For more info, visit https://reactjs.org/link/mock-scheduler");
        end;
    end;
end;
computeThreadID = function(v510, v511) --[[ Line: 3594 ]] --[[ Name: computeThreadID ]]
    return v511 * 1000 + v510.interactionThreadID;
end;
v3.markSpawnedWork = function(v512) --[[ Line: 3602 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), v173 (ref)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    elseif v173 == nil then
        v173 = {
            v512
        };
        return;
    else
        table.insert(v173, v512);
        return;
    end;
end;
scheduleInteractions = function(v513, v514, v515) --[[ Line: 3614 ]] --[[ Name: scheduleInteractions ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l_Set_0 (copy), l___subscriberRef_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        if next(v515) ~= nil then
            local l_pendingInteractionMap_0 = v513.pendingInteractionMap;
            local v517 = l_pendingInteractionMap_0[v514];
            if v517 ~= nil then
                for _, v519 in v515 do
                    if not v517[v519] then
                        v519.__count = v519.__count + 1;
                    end;
                    v517[v519] = true;
                end;
            else
                local v520 = l_Set_0.new();
                local v521;
                if v515 == nil then
                    v521 = v520;
                else
                    for _, v523 in v515 do
                        v520:add(v523);
                    end;
                    v521 = v520;
                end;
                l_pendingInteractionMap_0[v514] = v521;
                for _, v525 in v515 do
                    v525.__count = v525.__count + 1;
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
v143.schedulePendingInteractions = function(v528, v529) --[[ Line: 3652 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___interactionsRef_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        scheduleInteractions(v528, v529, l___interactionsRef_0.current);
        return;
    end;
end;
v143.startWorkOnPendingInteractions = function(v530, v531) --[[ Line: 3663 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l_Set_0 (copy), l_includesSomeLane_0 (copy), l___subscriberRef_0 (copy), l_describeError_0 (copy), l_scheduleCallback_0 (copy), l_ImmediatePriority_0 (copy)
    if not l_ReactFeatureFlags_0.enableSchedulerTracing then
        return;
    else
        local v532 = l_Set_0.new();
        for v533, v534 in v530.pendingInteractionMap do
            if l_includesSomeLane_0(v531, v533) then
                for _, v536 in v534 do
                    v532:add(v536);
                end;
            end;
        end;
        v530.memoizedInteractions = v532;
        if next(v532) ~= nil then
            local l_current_6 = l___subscriberRef_0.current;
            if l_current_6 ~= nil then
                local v538 = computeThreadID(v530, v531);
                local v539, v540 = xpcall(l_current_6.onWorkStarted, l_describeError_0, v532, v538);
                if not v539 then
                    l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3696 ]]
                        -- upvalues: v540 (copy)
                        error(v540);
                    end);
                end;
            end;
        end;
        return;
    end;
end;
v143.finishPendingInteractions = function(v541, v542) --[[ Line: 3704 ]]
    -- upvalues: l_ReactFeatureFlags_0 (copy), l___subscriberRef_0 (copy), l_describeError_0 (copy), l_includesSomeLane_0 (copy), l_scheduleCallback_0 (copy), l_ImmediatePriority_0 (copy)
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
                l_memoizedInteractions_0, v549 = xpcall(v544.onWorkStopped, l_describeError_0, v541.memoizedInteractions, v548);
                v545 = l_memoizedInteractions_0;
                v546 = v549;
            end;
        end;
        local l_pendingInteractionMap_1 = v541.pendingInteractionMap;
        for v551, v552 in l_pendingInteractionMap_1 do
            if not l_includesSomeLane_0(l_pendingLanes_0, v551) then
                l_pendingInteractionMap_1[v551] = nil;
                if v552.size ~= 0 then
                    if v552.ipairs ~= nil then
                        for _, v554 in v552 do
                            v554.__count = v554.__count - 1;
                            if v544 ~= nil and v554.__count == 0 then
                                local v555, v556 = xpcall(v544.onInteractionScheduledWorkCompleted, l_describeError_0, v554);
                                if not v555 then
                                    l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3749 ]]
                                        -- upvalues: v556 (copy)
                                        error(v556);
                                    end);
                                end;
                            end;
                        end;
                    else
                        for _, v558 in v552 do
                            v558.__count = v558.__count - 1;
                            if v544 ~= nil and v558.__count == 0 then
                                local v559, v560 = xpcall(v544.onInteractionScheduledWorkCompleted, l_describeError_0, v558);
                                if not v559 then
                                    l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3763 ]]
                                        -- upvalues: v560 (copy)
                                        error(v560);
                                    end);
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        if not v545 then
            l_scheduleCallback_0(l_ImmediatePriority_0, function() --[[ Line: 3775 ]]
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
local function v572() --[[ Line: 3794 ]] --[[ Name: flushActWork ]]
    -- upvalues: l_unstable_flushAllWithoutAsserting_0 (copy), v561 (ref), l_describeError_0 (copy), v3 (copy)
    if l_unstable_flushAllWithoutAsserting_0 ~= nil then
        local l_v561_0 = v561;
        v561 = true;
        local v566, v567 = xpcall(l_unstable_flushAllWithoutAsserting_0, l_describeError_0);
        v561 = l_v561_0;
        if not v566 then
            error(v567);
            return;
        else
            return v567;
        end;
    else
        local l_v561_1 = v561;
        v561 = true;
        local v570, v571 = xpcall(function() --[[ Line: 3814 ]]
            -- upvalues: v3 (ref)
            local v569 = false;
            while v3.flushPassiveEffects() do
                v569 = true;
            end;
            return v569;
        end, l_describeError_0);
        v561 = l_v561_1;
        if not v570 then
            error(v571);
            return;
        else
            return v571;
        end;
    end;
end;
local function v573(v574) --[[ Line: 3833 ]] --[[ Name: flushWorkAndMicroTasks ]]
    -- upvalues: v572 (copy), l_describeError_0 (copy), l_enqueueTask_0 (copy), v573 (copy)
    local v575, v576 = xpcall(v572, l_describeError_0);
    if v575 then
        local v577, v578 = xpcall(l_enqueueTask_0, l_describeError_0, function() --[[ Line: 3837 ]]
            -- upvalues: v572 (ref), v573 (ref), v574 (copy)
            if v572() then
                v573(v574);
                return;
            else
                v574();
                return;
            end;
        end);
        v575 = v577;
        v576 = v578;
    end;
    if not v575 then
        v574(v576);
    end;
end;
v3.act = function(v579) --[[ Line: 3851 ]]
    -- upvalues: v211 (ref), l_console_0 (copy), v210 (ref), l_IsSomeRendererActing_0 (copy), v3 (copy), v562 (ref), l_describeError_0 (copy), v101 (copy), v564 (copy), v573 (copy), v572 (copy)
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
    local function _() --[[ Line: 3876 ]] --[[ Name: onDone ]]
        -- upvalues: v210 (ref), l_IsSomeRendererActing_0 (ref), l_current_7 (copy), v3 (ref), l_current_8 (copy), v562 (ref), l_v562_0 (copy), l_v210_0 (copy), l_console_0 (ref)
        v210 = v210 - 1;
        l_IsSomeRendererActing_0.current = l_current_7;
        v3.IsThisRendererActing.current = l_current_8;
        v562 = l_v562_0;
        if _G.__DEV__ and l_v210_0 < v210 then
            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
        end;
    end;
    local v585, v586 = xpcall(v3.batchedUpdates, l_describeError_0, v579);
    if not v585 then
        v210 = v210 - 1;
        l_IsSomeRendererActing_0.current = l_current_7;
        v3.IsThisRendererActing.current = l_current_8;
        v562 = l_v562_0;
        if _G.__DEV__ and l_v210_0 < v210 then
            l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
        end;
        error(v586);
    end;
    if v586 ~= nil and typeof(v586) == "table" and typeof(v586.andThen) == "function" then
        local v587 = false;
        if _G.__DEV__ and typeof(v101) ~= nil then
            v101.resolve():andThen(function() --[[ Line: 3910 ]]

            end):andThen(function() --[[ Line: 3911 ]]
                -- upvalues: v587 (ref), l_console_0 (ref)
                if v587 == false then
                    l_console_0.error("You called act(Promise.new(function() --[[ ... ]] end)) without :await() or :expect(). " .. "This could lead to unexpected testing behaviour, interleaving multiple act " .. "calls and mixing their scopes. You should - act(function() Promise.new(function() --[[ ... ]] end):await() end);");
                end;
            end);
        end;
        return {
            andThen = function(_, v589, v590) --[[ Line: 3930 ]] --[[ Name: andThen ]]
                -- upvalues: v587 (ref), v586 (copy), v210 (ref), v564 (ref), l_current_7 (copy), l_IsSomeRendererActing_0 (ref), v3 (ref), l_current_8 (copy), v562 (ref), l_v562_0 (copy), l_v210_0 (copy), l_console_0 (ref), v573 (ref)
                v587 = true;
                return v586:andThen(function() --[[ Line: 3933 ]]
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
                        v573(function(v591) --[[ Line: 3945 ]]
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
                end, function(v592) --[[ Line: 3954 ]]
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
        if _G.__DEV__ and v586 ~= nil then
            l_console_0.error("The callback passed to act(...) function " .. "must return nil, or a Promise. You returned %s", (tostring(v586)));
        end;
        local v593, v594 = xpcall(function() --[[ Line: 3974 ]]
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
        end, l_describeError_0);
        if not v593 then
            v210 = v210 - 1;
            l_IsSomeRendererActing_0.current = l_current_7;
            v3.IsThisRendererActing.current = l_current_8;
            v562 = l_v562_0;
            if _G.__DEV__ and l_v210_0 < v210 then
                l_console_0.error("You seem to have overlapping act() calls, this is not supported. " .. "Be sure to await previous act() calls before making a new one. ");
            end;
            error(v594);
        end;
        return {
            andThen = function(_, v596, _) --[[ Line: 3994 ]] --[[ Name: andThen ]]
                -- upvalues: l_console_0 (ref)
                if _G.__DEV__ then
                    l_console_0.error("Do not await the result of calling act(...) with sync logic, it is not a Promise.");
                end;
                v596();
            end
        };
    end;
end;
v143.detachFiberAfterEffects = function(v598) --[[ Line: 4006 ]]
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