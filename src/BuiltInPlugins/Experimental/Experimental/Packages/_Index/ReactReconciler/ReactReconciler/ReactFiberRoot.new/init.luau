local l_Parent_0 = script.Parent.Parent;
local l_Set_0 = require(l_Parent_0.LuauPolyfill).Set;
local _ = require(script.Parent.ReactInternalTypes);
local v3 = require(script.Parent.ReactRootTags);
local v4 = require(script.Parent.ReactFiberHostConfig);
local l_noTimeout_0 = v4.noTimeout;
local l_supportsHydration_0 = v4.supportsHydration;
local l_createHostRootFiber_0 = require(script.Parent["ReactFiber.new"]).createHostRootFiber;
local v8 = require(script.Parent.ReactFiberLane);
local l_NoLanes_0 = v8.NoLanes;
local l_NoLanePriority_0 = v8.NoLanePriority;
local l_NoTimestamp_0 = v8.NoTimestamp;
local l_createLaneMap_0 = v8.createLaneMap;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableSchedulerTracing_0 = l_ReactFeatureFlags_0.enableSchedulerTracing;
local l_enableSuspenseCallback_0 = l_ReactFeatureFlags_0.enableSuspenseCallback;
local l_unstable_getThreadID_0 = require(l_Parent_0.Scheduler).tracing.unstable_getThreadID;
local l_initializeUpdateQueue_0 = require(script.Parent["ReactUpdateQueue.new"]).initializeUpdateQueue;
local l_LegacyRoot_0 = v3.LegacyRoot;
local l_BlockingRoot_0 = v3.BlockingRoot;
local l_ConcurrentRoot_0 = v3.ConcurrentRoot;
local v21 = {};
local function v26(v22, v23, v24) --[[ Line: 45 ]] --[[ Name: FiberRootNode ]]
    -- upvalues: l_noTimeout_0 (copy), l_NoLanePriority_0 (copy), l_createLaneMap_0 (copy), l_NoLanes_0 (copy), l_NoTimestamp_0 (copy), l_supportsHydration_0 (copy), l_enableSchedulerTracing_0 (copy), l_unstable_getThreadID_0 (copy), l_Set_0 (copy), l_enableSuspenseCallback_0 (copy), l_BlockingRoot_0 (copy), l_ConcurrentRoot_0 (copy), l_LegacyRoot_0 (copy)
    local v25 = {
        tag = v23, 
        containerInfo = v22, 
        pendingChildren = nil, 
        current = nil, 
        pingCache = nil, 
        finishedWork = nil, 
        timeoutHandle = l_noTimeout_0, 
        context = nil, 
        pendingContext = nil, 
        hydrate = v24, 
        callbackNode = nil, 
        callbackPriority = l_NoLanePriority_0, 
        eventTimes = l_createLaneMap_0(l_NoLanes_0), 
        expirationTimes = l_createLaneMap_0(l_NoTimestamp_0), 
        pendingLanes = l_NoLanes_0, 
        suspendedLanes = l_NoLanes_0, 
        pingedLanes = l_NoLanes_0, 
        expiredLanes = l_NoLanes_0, 
        mutableReadLanes = l_NoLanes_0, 
        finishedLanes = l_NoLanes_0, 
        entangledLanes = l_NoLanes_0, 
        entanglements = l_createLaneMap_0(l_NoLanes_0)
    };
    if l_supportsHydration_0 then
        v25.mutableSourceEagerHydrationData = nil;
    end;
    if l_enableSchedulerTracing_0 then
        v25.interactionThreadID = l_unstable_getThreadID_0();
        v25.memoizedInteractions = l_Set_0.new();
        v25.pendingInteractionMap = {};
    end;
    if l_enableSuspenseCallback_0 then
        v25.hydrationCallbacks = nil;
    end;
    if _G.__DEV__ then
        if v23 == l_BlockingRoot_0 then
            v25._debugRootType = "createBlockingRoot()";
            return v25;
        elseif v23 == l_ConcurrentRoot_0 then
            v25._debugRootType = "createRoot()";
            return v25;
        elseif v23 == l_LegacyRoot_0 then
            v25._debugRootType = "createLegacyRoot()";
        end;
    end;
    return v25;
end;
v21.createFiberRoot = function(v27, v28, v29, v30) --[[ Line: 100 ]]
    -- upvalues: v26 (copy), l_enableSuspenseCallback_0 (copy), l_createHostRootFiber_0 (copy), l_initializeUpdateQueue_0 (copy)
    local v31 = v26(v27, v28, v29);
    if l_enableSuspenseCallback_0 then
        v31.hydrationCallbacks = v30;
    end;
    local v32 = l_createHostRootFiber_0(v28);
    v31.current = v32;
    v32.stateNode = v31;
    l_initializeUpdateQueue_0(v32);
    return v31;
end;
return v21;