local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v4 = require(script.Parent.ReactFiberLane);
local _ = require(script.Parent.ReactCapturedValue);
local v6 = require(script.Parent["ReactUpdateQueue.new"]);
local _ = require(l_Parent_0.Shared);
local v8 = require(script.Parent["ReactFiberSuspenseContext.new"]);
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v10 = require(script.Parent.ReactWorkTags);
local l_ClassComponent_0 = v10.ClassComponent;
local l_HostRoot_0 = v10.HostRoot;
local l_SuspenseComponent_0 = v10.SuspenseComponent;
local l_IncompleteClassComponent_0 = v10.IncompleteClassComponent;
local v15 = require(script.Parent.ReactFiberFlags);
local l_DidCapture_0 = v15.DidCapture;
local l_Incomplete_0 = v15.Incomplete;
local l_NoFlags_0 = v15.NoFlags;
local l_ShouldCapture_0 = v15.ShouldCapture;
local l_LifecycleEffectMask_0 = v15.LifecycleEffectMask;
local l_ForceUpdateForLegacySuspense_0 = v15.ForceUpdateForLegacySuspense;
local l_shouldCaptureSuspense_0 = require(script.Parent["ReactFiberSuspenseComponent.new"]).shouldCaptureSuspense;
local v23 = require(script.Parent.ReactTypeOfMode);
local l_NoMode_0 = v23.NoMode;
local l_BlockingMode_0 = v23.BlockingMode;
local l_DebugTracingMode_0 = v23.DebugTracingMode;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableDebugTracing_0 = l_ReactFeatureFlags_0.enableDebugTracing;
local l_enableSchedulingProfiler_0 = l_ReactFeatureFlags_0.enableSchedulingProfiler;
local l_createCapturedValue_0 = require(script.Parent.ReactCapturedValue).createCapturedValue;
local l_enqueueCapturedUpdate_0 = v6.enqueueCapturedUpdate;
local l_createUpdate_0 = v6.createUpdate;
local l_CaptureUpdate_0 = v6.CaptureUpdate;
local l_ForceUpdate_0 = v6.ForceUpdate;
local l_enqueueUpdate_0 = v6.enqueueUpdate;
local l_markFailedErrorBoundaryForHotReloading_0 = require(script.Parent["ReactFiberHotReloading.new"]).markFailedErrorBoundaryForHotReloading;
local l_hasSuspenseContext_0 = v8.hasSuspenseContext;
local l_InvisibleParentSuspenseContext_0 = v8.InvisibleParentSuspenseContext;
local l_suspenseStackCursor_0 = v8.suspenseStackCursor;
local v40 = nil;
local v41 = nil;
local v42 = nil;
local v43 = nil;
local function v44(...) --[[ Line: 88 ]]
    -- upvalues: v41 (ref), v40 (ref)
    if not v41 then
        v40 = require(script.Parent["ReactFiberWorkLoop.new"]);
        v41 = v40.markLegacyErrorBoundaryAsFailed;
    end;
    return v41(...);
end;
local function v45(...) --[[ Line: 103 ]]
    -- upvalues: v40 (ref), v43 (ref)
    if v40 == nil then
        v40 = require(script.Parent["ReactFiberWorkLoop.new"]);
    end;
    v43 = v40.pingSuspendedRoot;
    return v43(...);
end;
local function v46(...) --[[ Line: 110 ]]
    -- upvalues: v40 (ref), v42 (ref)
    if v40 == nil then
        v40 = require(script.Parent["ReactFiberWorkLoop.new"]);
    end;
    v42 = v40.isAlreadyFailedLegacyErrorBoundary;
    return v42(...);
end;
local l_logCapturedError_0 = require(script.Parent.ReactFiberErrorLogger).logCapturedError;
local l_logComponentSuspended_0 = require(script.Parent.DebugTracing).logComponentSuspended;
local l_markComponentSuspended_0 = require(script.Parent.SchedulingProfiler).markComponentSuspended;
local l_SyncLane_0 = v4.SyncLane;
local l_NoTimestamp_0 = v4.NoTimestamp;
local l_includesSomeLane_0 = v4.includesSomeLane;
local l_mergeLanes_0 = v4.mergeLanes;
local l_pickArbitraryLane_0 = v4.pickArbitraryLane;
createRootErrorUpdate = function(v55, v56, v57, v58) --[[ Line: 132 ]] --[[ Name: createRootErrorUpdate ]]
    -- upvalues: l_createUpdate_0 (copy), l_NoTimestamp_0 (copy), l_CaptureUpdate_0 (copy), l_Object_0 (copy), l_logCapturedError_0 (copy)
    local v59 = l_createUpdate_0(l_NoTimestamp_0, v57);
    v59.tag = l_CaptureUpdate_0;
    v59.payload = {
        element = l_Object_0.None
    };
    local l_value_0 = v56.value;
    v59.callback = function() --[[ Line: 146 ]]
        -- upvalues: v58 (copy), l_value_0 (copy), l_logCapturedError_0 (ref), v55 (copy), v56 (copy)
        if v58 ~= nil then
            v58(l_value_0);
        end;
        l_logCapturedError_0(v55, v56);
    end;
    return v59;
end;
createClassErrorUpdate = function(v61, v62, v63) --[[ Line: 155 ]] --[[ Name: createClassErrorUpdate ]]
    -- upvalues: l_createUpdate_0 (copy), l_NoTimestamp_0 (copy), l_CaptureUpdate_0 (copy), l_logCapturedError_0 (copy), l_markFailedErrorBoundaryForHotReloading_0 (copy), v44 (copy), l_includesSomeLane_0 (copy), l_SyncLane_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy)
    local v64 = l_createUpdate_0(l_NoTimestamp_0, v63);
    v64.tag = l_CaptureUpdate_0;
    local l_getDerivedStateFromError_0 = v61.type.getDerivedStateFromError;
    if typeof(l_getDerivedStateFromError_0) == "function" then
        local l_value_1 = v62.value;
        local l_l_value_1_0 = l_value_1 --[[ copy: 5 -> 6 ]];
        v64.payload = function() --[[ Line: 165 ]]
            -- upvalues: l_logCapturedError_0 (ref), v61 (copy), v62 (copy), l_getDerivedStateFromError_0 (copy), l_l_value_1_0 (copy)
            l_logCapturedError_0(v61, v62);
            return l_getDerivedStateFromError_0(l_l_value_1_0);
        end;
    end;
    local l_stateNode_0 = v61.stateNode;
    if l_stateNode_0 ~= nil and typeof(l_stateNode_0.componentDidCatch) == "function" then
        v64.callback = function() --[[ Line: 173 ]]
            -- upvalues: l_markFailedErrorBoundaryForHotReloading_0 (ref), v61 (copy), l_getDerivedStateFromError_0 (copy), v44 (ref), l_stateNode_0 (copy), l_logCapturedError_0 (ref), v62 (copy), l_includesSomeLane_0 (ref), l_SyncLane_0 (ref), l_console_0 (ref), l_getComponentName_0 (ref)
            if _G.__DEV__ then
                l_markFailedErrorBoundaryForHotReloading_0(v61);
            end;
            if typeof(l_getDerivedStateFromError_0) ~= "function" then
                v44(l_stateNode_0);
                l_logCapturedError_0(v61, v62);
            end;
            local l_value_2 = v62.value;
            local l_stack_0 = v62.stack;
            l_stateNode_0:componentDidCatch(l_value_2, {
                componentStack = l_stack_0 or ""
            });
            if _G.__DEV__ and typeof(l_getDerivedStateFromError_0) ~= "function" and not l_includesSomeLane_0(v61.lanes, l_SyncLane_0) then
                l_console_0.error("%s: Error boundaries should implement getDerivedStateFromError(). " .. "In that method, return a state update to display an error message or fallback UI.", l_getComponentName_0(v61.type) or "Unknown");
            end;
        end;
        return v64;
    else
        if _G.__DEV__ then
            v64.callback = function() --[[ Line: 211 ]]
                -- upvalues: l_markFailedErrorBoundaryForHotReloading_0 (ref), v61 (copy)
                l_markFailedErrorBoundaryForHotReloading_0(v61);
            end;
        end;
        return v64;
    end;
end;
local function v77(v71, v72, v73) --[[ Line: 218 ]] --[[ Name: attachPingListener ]]
    -- upvalues: v45 (copy)
    local l_pingCache_0 = v71.pingCache;
    local v75 = nil;
    if l_pingCache_0 == nil then
        v75 = {};
        v71.pingCache = {
            [v72] = v75
        };
        l_pingCache_0 = v71.pingCache;
    else
        v75 = l_pingCache_0[v72];
        if v75 == nil then
            v75 = {};
            l_pingCache_0[v72] = v75;
        end;
    end;
    if not v75[v73] then
        v75[v73] = true;
        local function v76() --[[ Line: 246 ]]
            -- upvalues: v45 (ref), v71 (copy), v72 (copy), v73 (copy)
            return v45(v71, v72, v73);
        end;
        v72:andThen(v76, v76);
    end;
end;
throwException = function(v78, v79, v80, v81, v82, v83, v84) --[[ Line: 253 ]] --[[ Name: throwException ]]
    -- upvalues: l_Incomplete_0 (copy), l_enableDebugTracing_0 (copy), l_DebugTracingMode_0 (copy), l_getComponentName_0 (copy), l_logComponentSuspended_0 (copy), l_enableSchedulingProfiler_0 (copy), l_markComponentSuspended_0 (copy), l_BlockingMode_0 (copy), l_NoMode_0 (copy), l_hasSuspenseContext_0 (copy), l_suspenseStackCursor_0 (copy), l_InvisibleParentSuspenseContext_0 (copy), l_SuspenseComponent_0 (copy), l_shouldCaptureSuspense_0 (copy), l_DidCapture_0 (copy), l_ForceUpdateForLegacySuspense_0 (copy), l_LifecycleEffectMask_0 (copy), l_ClassComponent_0 (copy), l_IncompleteClassComponent_0 (copy), l_createUpdate_0 (copy), l_NoTimestamp_0 (copy), l_SyncLane_0 (copy), l_ForceUpdate_0 (copy), l_enqueueUpdate_0 (copy), l_mergeLanes_0 (copy), v77 (copy), l_ShouldCapture_0 (copy), l_createCapturedValue_0 (copy), l_HostRoot_0 (copy), l_pickArbitraryLane_0 (copy), l_enqueueCapturedUpdate_0 (copy), l_NoFlags_0 (copy), v46 (copy)
    v80.flags = bit32.bor(v80.flags, l_Incomplete_0);
    if v81 ~= nil and typeof(v81) == "table" and typeof(v81.andThen) == "function" then
        local l_v81_0 = v81;
        if _G.__DEV__ and l_enableDebugTracing_0 and bit32.band(v80.mode, l_DebugTracingMode_0) ~= 0 then
            local v86 = l_getComponentName_0(v80.type) or "Unknown";
            l_logComponentSuspended_0(v86, l_v81_0);
        end;
        if l_enableSchedulingProfiler_0 then
            l_markComponentSuspended_0(v80, l_v81_0);
        end;
        if bit32.band(v80.mode, l_BlockingMode_0) == l_NoMode_0 then
            local l_alternate_0 = v80.alternate;
            if l_alternate_0 then
                v80.updateQueue = l_alternate_0.updateQueue;
                v80.memoizedState = l_alternate_0.memoizedState;
                v80.lanes = l_alternate_0.lanes;
            else
                v80.updateQueue = nil;
                v80.memoizedState = nil;
            end;
        end;
        local v88 = l_hasSuspenseContext_0(l_suspenseStackCursor_0.current, l_InvisibleParentSuspenseContext_0);
        local l_v79_0 = v79;
        while true do
            if l_v79_0.tag == l_SuspenseComponent_0 and l_shouldCaptureSuspense_0(l_v79_0, v88) then
                local l_updateQueue_0 = l_v79_0.updateQueue;
                if l_updateQueue_0 == nil then
                    l_v79_0.updateQueue = {
                        [l_v81_0] = true
                    };
                else
                    l_updateQueue_0[l_v81_0] = true;
                end;
                if bit32.band(l_v79_0.mode, l_BlockingMode_0) == l_NoMode_0 then
                    l_v79_0.flags = bit32.bor(l_v79_0.flags, l_DidCapture_0);
                    v80.flags = bit32.bor(v80.flags, l_ForceUpdateForLegacySuspense_0);
                    v80.flags = bit32.band(v80.flags, (bit32.bnot((bit32.bor(l_LifecycleEffectMask_0, l_Incomplete_0)))));
                    if v80.tag == l_ClassComponent_0 then
                        if v80.alternate == nil then
                            v80.tag = l_IncompleteClassComponent_0;
                        else
                            local v91 = l_createUpdate_0(l_NoTimestamp_0, l_SyncLane_0);
                            v91.tag = l_ForceUpdate_0;
                            l_enqueueUpdate_0(v80, v91);
                        end;
                    end;
                    v80.lanes = l_mergeLanes_0(v80.lanes, l_SyncLane_0);
                    return;
                else
                    v77(v78, l_v81_0, v82);
                    l_v79_0.flags = bit32.bor(l_v79_0.flags, l_ShouldCapture_0);
                    l_v79_0.lanes = v82;
                    return;
                end;
            else
                l_v79_0 = l_v79_0.return_;
                if l_v79_0 == nil then
                    v81 = (l_getComponentName_0(v80.type) or "A React component") .. " suspended while rendering, but no fallback UI was specified.\n" .. "\n" .. "Add a <Suspense fallback=...> component higher in the tree to " .. "provide a loading indicator or placeholder to display.";
                    break;
                end;
            end;
        end;
    end;
    v84();
    v81 = l_createCapturedValue_0(v81, v80);
    local l_v79_1 = v79;
    while true do
        if l_v79_1.tag == l_HostRoot_0 then
            local l_v81_1 = v81;
            l_v79_1.flags = bit32.bor(l_v79_1.flags, l_ShouldCapture_0);
            local v94 = l_pickArbitraryLane_0(v82);
            l_v79_1.lanes = l_mergeLanes_0(l_v79_1.lanes, v94);
            local v95 = createRootErrorUpdate(l_v79_1, l_v81_1, v94, v83);
            l_enqueueCapturedUpdate_0(l_v79_1, v95);
            return;
        else
            if l_v79_1.tag == l_ClassComponent_0 then
                local l_v81_2 = v81;
                local l_type_0 = l_v79_1.type;
                local l_stateNode_1 = l_v79_1.stateNode;
                if bit32.band(l_v79_1.flags, l_DidCapture_0) == l_NoFlags_0 and (typeof(l_type_0.getDerivedStateFromError) == "function" or l_stateNode_1 ~= nil and typeof(l_stateNode_1.componentDidCatch) == "function" and not v46(l_stateNode_1)) then
                    l_v79_1.flags = bit32.bor(l_v79_1.flags, l_ShouldCapture_0);
                    local v99 = l_pickArbitraryLane_0(v82);
                    l_v79_1.lanes = l_mergeLanes_0(l_v79_1.lanes, v99);
                    local v100 = createClassErrorUpdate(l_v79_1, l_v81_2, v99);
                    l_enqueueCapturedUpdate_0(l_v79_1, v100);
                    return;
                end;
            end;
            l_v79_1 = l_v79_1.return_;
            if l_v79_1 == nil then
                return;
            end;
        end;
    end;
end;
return {
    throwException = throwException, 
    createRootErrorUpdate = createRootErrorUpdate, 
    createClassErrorUpdate = createClassErrorUpdate
};