local function _(v0) --[[ Line: 13 ]] --[[ Name: unimplemented ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring(v0));
    error("FIXME (roblox): " .. v0 .. " is unimplemented", 2);
end;
local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local v4 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v4.Array;
local l_Object_0 = v4.Object;
local l_inspect_0 = v4.util.inspect;
local _ = require(l_Parent_0.Shared);
local _ = require(l_Parent_0.React);
local _ = require(script.Parent.ReactInternalTypes);
local v11 = require(script.Parent.ReactFiberLane);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v13 = require(script.Parent["ReactFiberSuspenseContext.new"]);
local _ = require(script.Parent.ReactFiberOffscreenComponent);
local l_checkPropTypes_0 = require(l_Parent_0.Shared).checkPropTypes;
local v16 = require(script.Parent.ReactWorkTags);
local l_FunctionComponent_0 = v16.FunctionComponent;
local l_ClassComponent_0 = v16.ClassComponent;
local l_HostRoot_0 = v16.HostRoot;
local l_HostComponent_0 = v16.HostComponent;
local l_HostText_0 = v16.HostText;
local l_HostPortal_0 = v16.HostPortal;
local l_ForwardRef_0 = v16.ForwardRef;
local l_Fragment_0 = v16.Fragment;
local l_Mode_0 = v16.Mode;
local l_ContextProvider_0 = v16.ContextProvider;
local l_ContextConsumer_0 = v16.ContextConsumer;
local l_Profiler_0 = v16.Profiler;
local l_SuspenseComponent_0 = v16.SuspenseComponent;
local l_SuspenseListComponent_0 = v16.SuspenseListComponent;
local l_MemoComponent_0 = v16.MemoComponent;
local l_SimpleMemoComponent_0 = v16.SimpleMemoComponent;
local l_LazyComponent_0 = v16.LazyComponent;
local l_IncompleteClassComponent_0 = v16.IncompleteClassComponent;
local l_OffscreenComponent_0 = v16.OffscreenComponent;
local l_LegacyHiddenComponent_0 = v16.LegacyHiddenComponent;
local v37 = require(script.Parent.ReactFiberFlags);
local l_NoFlags_0 = v37.NoFlags;
local l_StaticMask_0 = v37.StaticMask;
local l_PerformedWork_0 = v37.PerformedWork;
local l_Placement_0 = v37.Placement;
local l_Hydrating_0 = v37.Hydrating;
local l_ContentReset_0 = v37.ContentReset;
local l_DidCapture_0 = v37.DidCapture;
local l_Ref_0 = v37.Ref;
local l_Deletion_0 = v37.Deletion;
local l_ForceUpdateForLegacySuspense_0 = v37.ForceUpdateForLegacySuspense;
local l_ReactSharedInternals_0 = require(l_Parent_0.Shared).ReactSharedInternals;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_debugRenderPhaseSideEffectsForStrictMode_0 = l_ReactFeatureFlags_0.debugRenderPhaseSideEffectsForStrictMode;
local l_disableLegacyContext_0 = l_ReactFeatureFlags_0.disableLegacyContext;
local l_disableModulePatternComponents_0 = l_ReactFeatureFlags_0.disableModulePatternComponents;
local l_enableProfilerTimer_0 = l_ReactFeatureFlags_0.enableProfilerTimer;
local l_enableSchedulerTracing_0 = l_ReactFeatureFlags_0.enableSchedulerTracing;
local l_enableSuspenseServerRenderer_0 = l_ReactFeatureFlags_0.enableSuspenseServerRenderer;
local l_warnAboutDefaultPropsOnFunctionComponents_0 = l_ReactFeatureFlags_0.warnAboutDefaultPropsOnFunctionComponents;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_shallowEqual_0 = require(l_Parent_0.Shared).shallowEqual;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_REACT_LAZY_TYPE_0 = l_ReactSymbols_0.REACT_LAZY_TYPE;
local _ = l_ReactSymbols_0.getIteratorFn;
local v63 = require(script.Parent["ReactStrictModeWarnings.new"]);
local v64 = require(script.Parent.ReactCurrentFiber);
local l_getCurrentFiberOwnerNameInDevOrNull_0 = v64.getCurrentFiberOwnerNameInDevOrNull;
local l_setIsRendering_0 = v64.setIsRendering;
local v67 = require(script.Parent["ReactFiberHotReloading.new"]);
local l_resolveFunctionForHotReloading_0 = v67.resolveFunctionForHotReloading;
local l_resolveForwardRefForHotReloading_0 = v67.resolveForwardRefForHotReloading;
local l_resolveClassForHotReloading_0 = v67.resolveClassForHotReloading;
local v71 = require(script.Parent["ReactChildFiber.new"]);
local l_mountChildFibers_0 = v71.mountChildFibers;
local l_reconcileChildFibers_0 = v71.reconcileChildFibers;
local l_cloneChildFibers_0 = v71.cloneChildFibers;
local v75 = require(script.Parent["ReactUpdateQueue.new"]);
local l_processUpdateQueue_0 = v75.processUpdateQueue;
local l_cloneUpdateQueue_0 = v75.cloneUpdateQueue;
local l_initializeUpdateQueue_0 = v75.initializeUpdateQueue;
local v79 = require(script.Parent.ReactTypeOfMode);
local l_ConcurrentMode_0 = v79.ConcurrentMode;
local l_NoMode_0 = v79.NoMode;
local l_ProfileMode_0 = v79.ProfileMode;
local l_StrictMode_0 = v79.StrictMode;
local l_BlockingMode_0 = v79.BlockingMode;
local v85 = require(script.Parent.ReactFiberHostConfig);
local l_shouldSetTextContent_0 = v85.shouldSetTextContent;
local l_isSuspenseInstancePending_0 = v85.isSuspenseInstancePending;
local l_isSuspenseInstanceFallback_0 = v85.isSuspenseInstanceFallback;
local l_registerSuspenseInstanceRetry_0 = v85.registerSuspenseInstanceRetry;
local l_supportsHydration_0 = v85.supportsHydration;
local v91 = require(script.Parent["ReactFiberHostContext.new"]);
local l_pushHostContext_0 = v91.pushHostContext;
local l_pushHostContainer_0 = v91.pushHostContainer;
local l_suspenseStackCursor_0 = v13.suspenseStackCursor;
local l_hasSuspenseContext_0 = v13.hasSuspenseContext;
local l_ForceSuspenseFallback_0 = v13.ForceSuspenseFallback;
local l_addSubtreeSuspenseContext_0 = v13.addSubtreeSuspenseContext;
local l_InvisibleParentSuspenseContext_0 = v13.InvisibleParentSuspenseContext;
local l_pushSuspenseContext_0 = v13.pushSuspenseContext;
local l_setDefaultShallowSuspenseContext_0 = v13.setDefaultShallowSuspenseContext;
local v101 = require(script.Parent["ReactFiberNewContext.new"]);
local l_propagateContextChange_0 = v101.propagateContextChange;
local l_readContext_0 = v101.readContext;
local l_calculateChangedBits_0 = v101.calculateChangedBits;
local l_prepareToReadContext_0 = v101.prepareToReadContext;
local l_pushProvider_0 = v101.pushProvider;
local v107 = {
    renderWithHooksRef = nil, 
    bailoutHooksRef = nil, 
    shouldSuspendRef = nil
};
local function _(v108) --[[ Line: 170 ]] --[[ Name: shouldSuspend ]]
    -- upvalues: v107 (copy)
    if not v107.shouldSuspendRef then
        v107.shouldSuspendRef = require(script.Parent.ReactFiberReconciler).shouldSuspend;
    end;
    return v107.shouldSuspendRef(v108);
end;
local function _() --[[ Line: 178 ]] --[[ Name: initReactFiberHooks ]]
    -- upvalues: v107 (copy)
    local v110 = require(script.Parent["ReactFiberHooks.new"]);
    v107.renderWithHooksRef = v110.renderWithHooks;
    v107.bailoutHooksRef = v110.bailoutHooks;
end;
local function v113(...) --[[ Line: 185 ]] --[[ Name: renderWithHooks ]]
    -- upvalues: v107 (copy)
    if not v107.renderWithHooksRef then
        local v112 = require(script.Parent["ReactFiberHooks.new"]);
        v107.renderWithHooksRef = v112.renderWithHooks;
        v107.bailoutHooksRef = v112.bailoutHooks;
    end;
    return v107.renderWithHooksRef(...);
end;
local function v115(...) --[[ Line: 193 ]] --[[ Name: bailoutHooks ]]
    -- upvalues: v107 (copy)
    if not v107.bailoutHooksRef then
        local v114 = require(script.Parent["ReactFiberHooks.new"]);
        v107.renderWithHooksRef = v114.renderWithHooks;
        v107.bailoutHooksRef = v114.bailoutHooks;
    end;
    return v107.bailoutHooksRef(...);
end;
local l_stopProfilerTimerIfRunning_0 = require(script.Parent["ReactProfilerTimer.new"]).stopProfilerTimerIfRunning;
local v117 = require(script.Parent["ReactFiberContext.new"]);
local l_getMaskedContext_0 = v117.getMaskedContext;
local l_getUnmaskedContext_0 = v117.getUnmaskedContext;
local l_hasContextChanged_0 = v117.hasContextChanged;
local l_pushContextProvider_0 = v117.pushContextProvider;
local l_isContextProvider_0 = v117.isContextProvider;
local l_pushTopLevelContextObject_0 = v117.pushTopLevelContextObject;
local l_invalidateContextProvider_0 = v117.invalidateContextProvider;
local v125 = require(script.Parent["ReactFiberHydrationContext.new"]);
local l_resetHydrationState_0 = v125.resetHydrationState;
local l_enterHydrationState_0 = v125.enterHydrationState;
local l_reenterHydrationStateFromDehydratedSuspenseInstance_0 = v125.reenterHydrationStateFromDehydratedSuspenseInstance;
local l_tryToClaimNextHydratableInstance_0 = v125.tryToClaimNextHydratableInstance;
local l_warnIfHydrating_0 = v125.warnIfHydrating;
local v131 = require(script.Parent["ReactFiberClassComponent.new"]);
local l_adoptClassInstance_0 = v131.adoptClassInstance;
local l_applyDerivedStateFromProps_0 = v131.applyDerivedStateFromProps;
local l_constructClassInstance_0 = v131.constructClassInstance;
local l_mountClassInstance_0 = v131.mountClassInstance;
local l_resumeMountClassInstance_0 = v131.resumeMountClassInstance;
local l_updateClassInstance_0 = v131.updateClassInstance;
local l_resolveDefaultProps_0 = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps;
local v139 = require(script.Parent["ReactFiber.new"]);
local l_resolveLazyComponentTag_0 = v139.resolveLazyComponentTag;
local l_createFiberFromFragment_0 = v139.createFiberFromFragment;
local l_createFiberFromOffscreen_0 = v139.createFiberFromOffscreen;
local l_createFiberFromTypeAndProps_0 = v139.createFiberFromTypeAndProps;
local l_isSimpleFunctionComponent_0 = v139.isSimpleFunctionComponent;
local l_createWorkInProgress_0 = v139.createWorkInProgress;
local v146 = require(script.Parent["ReactFiberWorkLoop.new"]);
local l_pushRenderLanes_0 = v146.pushRenderLanes;
local l_markSpawnedWork_0 = v146.markSpawnedWork;
local l_retryDehydratedSuspenseBoundary_0 = v146.retryDehydratedSuspenseBoundary;
local l_scheduleUpdateOnFiber_0 = v146.scheduleUpdateOnFiber;
local l_renderDidSuspendDelayIfPossible_0 = v146.renderDidSuspendDelayIfPossible;
local l_getWorkInProgressRoot_0 = v146.getWorkInProgressRoot;
local l_getExecutionContext_0 = v146.getExecutionContext;
local l_RetryAfterError_0 = v146.RetryAfterError;
local l_NoContext_0 = v146.NoContext;
local v156 = nil;
local l_setWorkInProgressVersion_0 = require(script.Parent["ReactMutableSource.new"]).setWorkInProgressVersion;
local l_markSkippedUpdateLanes_0 = require(script.Parent.ReactFiberWorkInProgress).markSkippedUpdateLanes;
local l_ConsolePatchingDev_0 = require(l_Parent_0.Shared).ConsolePatchingDev;
local l_disableLogs_0 = l_ConsolePatchingDev_0.disableLogs;
local l_reenableLogs_0 = l_ConsolePatchingDev_0.reenableLogs;
local l_ReactCurrentOwner_0 = l_ReactSharedInternals_0.ReactCurrentOwner;
local v163 = {};
local v164 = nil;
local v165 = nil;
local v166 = false;
local v167 = {
    didWarnAboutBadClass = nil, 
    didWarnAboutModulePatternComponent = nil, 
    didWarnAboutContextTypeOnFunctionComponent = nil, 
    didWarnAboutGetDerivedStateOnFunctionComponent = nil, 
    didWarnAboutFunctionRefs = nil, 
    didWarnAboutDefaultPropsOnFunctionComponent = nil
};
local v168 = nil;
if _G.__DEV__ then
    v167.didWarnAboutBadClass = {};
    v167.didWarnAboutModulePatternComponent = {};
    v167.didWarnAboutContextTypeOnFunctionComponent = {};
    v167.didWarnAboutGetDerivedStateOnFunctionComponent = {};
    v167.didWarnAboutFunctionRefs = {};
    v163.didWarnAboutReassigningProps = false;
    v167.didWarnAboutDefaultPropsOnFunctionComponent = {};
end;
local function _(v169, v170, v171, v172) --[[ Line: 287 ]] --[[ Name: reconcileChildren ]]
    -- upvalues: l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    if v169 == nil then
        v170.child = l_mountChildFibers_0(v170, nil, v171, v172);
        return;
    else
        v170.child = l_reconcileChildFibers_0(v170, v169.child, v171, v172);
        return;
    end;
end;
local function _(v174, v175, v176, v177) --[[ Line: 320 ]] --[[ Name: forceUnmountCurrentAndReconcile ]]
    -- upvalues: l_reconcileChildFibers_0 (copy)
    v175.child = l_reconcileChildFibers_0(v175, v174.child, nil, v177);
    v175.child = l_reconcileChildFibers_0(v175, nil, v176, v177);
end;
local function v192(v179, v180, v181, v182, v183) --[[ Line: 352 ]] --[[ Name: updateForwardRef ]]
    -- upvalues: l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), l_prepareToReadContext_0 (copy), v163 (copy), l_ReactCurrentOwner_0 (copy), l_setIsRendering_0 (copy), v113 (copy), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_reenableLogs_0 (copy), v166 (ref), v115 (copy), v164 (ref), l_PerformedWork_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    if (_G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__) and v180.type ~= v180.elementType then
        local l_propTypes_0 = v181.propTypes;
        local l_validateProps_0 = v181.validateProps;
        if l_propTypes_0 or l_validateProps_0 then
            l_checkPropTypes_0(l_propTypes_0, l_validateProps_0, v182, "prop", l_getComponentName_0(v181));
        end;
    end;
    local l_render_0 = v181.render;
    local l_ref_0 = v180.ref;
    local v188 = nil;
    l_prepareToReadContext_0(v180, v183, v163.markWorkInProgressReceivedUpdate);
    if _G.__DEV__ then
        l_ReactCurrentOwner_0.current = v180;
        l_setIsRendering_0(true);
        v188 = v113(v179, v180, l_render_0, v182, l_ref_0, v183);
        if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v180.mode, l_StrictMode_0) ~= 0 then
            l_disableLogs_0();
            local l_status_0, l_result_0 = pcall(v113, v179, v180, l_render_0, v182, l_ref_0, v183);
            if l_status_0 then
                v188 = l_result_0;
            end;
            l_reenableLogs_0();
            if not l_status_0 then
                error(l_result_0);
            end;
        end;
        l_setIsRendering_0(false);
    else
        v188 = v113(v179, v180, l_render_0, v182, l_ref_0, v183);
    end;
    if v179 ~= nil and not v166 then
        v115(v179, v180, v183);
        return v164(v179, v180, v183);
    else
        v180.flags = bit32.bor(v180.flags, l_PerformedWork_0);
        local l_v188_0 = v188;
        if v179 == nil then
            v180.child = l_mountChildFibers_0(v180, nil, l_v188_0, v183);
        else
            v180.child = l_reconcileChildFibers_0(v180, v179.child, l_v188_0, v183);
        end;
        return v180.child;
    end;
end;
local function v211(v193, v194, v195, v196, v197, v198) --[[ Line: 446 ]] --[[ Name: updateMemoComponent ]]
    -- upvalues: l_isSimpleFunctionComponent_0 (copy), l_resolveFunctionForHotReloading_0 (copy), l_SimpleMemoComponent_0 (copy), v168 (ref), l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), l_createFiberFromTypeAndProps_0 (copy), v11 (copy), l_shallowEqual_0 (copy), v164 (ref), l_PerformedWork_0 (copy), l_createWorkInProgress_0 (copy)
    if v193 == nil then
        local l_type_0 = v195.type;
        if l_isSimpleFunctionComponent_0(l_type_0) and v195.compare == nil and v195.defaultProps == nil then
            local l_l_type_0_0 = l_type_0;
            if _G.__DEV__ then
                l_l_type_0_0 = l_resolveFunctionForHotReloading_0(l_type_0);
            end;
            v194.tag = l_SimpleMemoComponent_0;
            v194.type = l_l_type_0_0;
            if _G.__DEV__ then
                validateFunctionComponentInDev(v194, l_type_0);
            end;
            return v168(v193, v194, l_l_type_0_0, v196, v197, v198);
        else
            if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
                local v201 = nil;
                local v202 = nil;
                if typeof(l_type_0) == "table" then
                    v201 = l_type_0.propTypes;
                    v202 = l_type_0.validateProps;
                end;
                if v201 or v202 then
                    l_checkPropTypes_0(v201, v202, v196, "prop", l_getComponentName_0(l_type_0));
                end;
            end;
            local v203 = l_createFiberFromTypeAndProps_0(v195.type, nil, v196, v194, v194.mode, v198);
            v203.ref = v194.ref;
            v203.return_ = v194;
            v194.child = v203;
            return v203;
        end;
    else
        if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
            local l_type_1 = v195.type;
            local v205 = nil;
            local v206 = nil;
            if typeof(l_type_1) == "table" then
                v205 = l_type_1.propTypes;
                v206 = l_type_1.validateProps;
            end;
            if v205 or v206 then
                l_checkPropTypes_0(v205, v206, v196, "prop", l_getComponentName_0(l_type_1));
            end;
        end;
        local l_child_0 = v193.child;
        if not v11.includesSomeLane(v197, v198) then
            local l_memoizedProps_0 = l_child_0.memoizedProps;
            local l_compare_0 = v195.compare;
            if l_compare_0 == nil then
                l_compare_0 = l_shallowEqual_0;
            end;
            if l_compare_0(l_memoizedProps_0, v196) and v193.ref == v194.ref then
                return v164(v193, v194, v198);
            end;
        end;
        v194.flags = bit32.bor(v194.flags, l_PerformedWork_0);
        local v210 = l_createWorkInProgress_0(l_child_0, v196);
        v210.ref = v194.ref;
        v210.return_ = v194;
        v194.child = v210;
        return v210;
    end;
end;
v168 = function(v212, v213, v214, v215, v216, v217) --[[ Line: 567 ]] --[[ Name: updateSimpleMemoComponent ]]
    -- upvalues: l_REACT_LAZY_TYPE_0 (copy), l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), l_shallowEqual_0 (copy), v166 (ref), v11 (copy), v164 (ref), l_ForceUpdateForLegacySuspense_0 (copy), l_NoFlags_0 (copy), v165 (ref)
    if (_G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__) and v213.type ~= v213.elementType then
        local l_elementType_0 = v213.elementType;
        if l_elementType_0["$$typeof"] == l_REACT_LAZY_TYPE_0 then
            local l_l_elementType_0_0 = l_elementType_0;
            local l__payload_0 = l_l_elementType_0_0._payload;
            local l__init_0 = l_l_elementType_0_0._init;
            local l_status_1, l_result_1 = pcall(l__init_0, l__payload_0);
            l_elementType_0 = if l_status_1 then l_result_1 else nil;
            local v224 = nil;
            local v225 = nil;
            if typeof(l_elementType_0) == "table" then
                v224 = l_elementType_0.propTypes;
                v225 = l_elementType_0.validateProps;
            end;
            if v224 or v225 then
                l_checkPropTypes_0(v224, v225, v215, "prop", l_getComponentName_0(l_elementType_0));
            end;
        end;
    end;
    if v212 ~= nil then
        local l_memoizedProps_1 = v212.memoizedProps;
        local v227 = true;
        if _G.__DEV__ then
            v227 = v213.type == v212.type;
        end;
        if l_shallowEqual_0(l_memoizedProps_1, v215) and v212.ref == v213.ref and v227 then
            v166 = false;
            if not v11.includesSomeLane(v217, v216) then
                v213.lanes = v212.lanes;
                return v164(v212, v213, v217);
            elseif bit32.band(v212.flags, l_ForceUpdateForLegacySuspense_0) ~= l_NoFlags_0 then
                v166 = true;
            end;
        end;
    end;
    return v165(v212, v213, v214, v215, v217);
end;
local function v238(v228, v229, v230) --[[ Line: 673 ]] --[[ Name: updateOffscreenComponent ]]
    -- upvalues: l_ConcurrentMode_0 (copy), l_NoMode_0 (copy), v11 (copy), l_pushRenderLanes_0 (copy), l_enableSchedulerTracing_0 (copy), l_markSpawnedWork_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    local l_pendingProps_0 = v229.pendingProps;
    local l_children_0 = l_pendingProps_0.children;
    local v233 = nil;
    if v228 ~= nil then
        v233 = v228.memoizedState;
    end;
    if l_pendingProps_0.mode == "hidden" or l_pendingProps_0.mode == "unstable-defer-without-hiding" then
        if bit32.band(v229.mode, l_ConcurrentMode_0) == l_NoMode_0 then
            v229.memoizedState = {
                baseLanes = v11.NoLanes
            };
            l_pushRenderLanes_0(v229, v230);
        elseif not v11.includesSomeLane(v230, v11.OffscreenLane) then
            local v234 = nil;
            if v233 ~= nil then
                local l_baseLanes_0 = v233.baseLanes;
                v234 = v11.mergeLanes(l_baseLanes_0, v230);
            else
                v234 = v230;
            end;
            if l_enableSchedulerTracing_0 then
                l_markSpawnedWork_0(v11.OffscreenLane);
            end;
            v229.childLanes = v11.laneToLanes(v11.OffscreenLane);
            v229.lanes = v229.childLanes;
            v229.memoizedState = {
                baseLanes = v234
            };
            l_pushRenderLanes_0(v229, v234);
            return nil;
        else
            v229.memoizedState = {
                baseLanes = v11.NoLanes
            };
            local l_v230_0 = v230;
            if v233 ~= nil then
                l_v230_0 = v233.baseLanes;
            end;
            l_pushRenderLanes_0(v229, l_v230_0);
        end;
    else
        local v237 = nil;
        if v233 ~= nil then
            v237 = v11.mergeLanes(v233.baseLanes, v230);
            v229.memoizedState = nil;
        else
            v237 = v230;
        end;
        l_pushRenderLanes_0(v229, v237);
    end;
    if v228 == nil then
        v229.child = l_mountChildFibers_0(v229, nil, l_children_0, v230);
    else
        v229.child = l_reconcileChildFibers_0(v229, v228.child, l_children_0, v230);
    end;
    return v229.child;
end;
updateFragment = function(v239, v240, v241) --[[ Line: 770 ]] --[[ Name: updateFragment ]]
    -- upvalues: l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    local l_pendingProps_1 = v240.pendingProps;
    if v239 == nil then
        v240.child = l_mountChildFibers_0(v240, nil, l_pendingProps_1, v241);
    else
        v240.child = l_reconcileChildFibers_0(v240, v239.child, l_pendingProps_1, v241);
    end;
    return v240.child;
end;
updateMode = function(v243, v244, v245) --[[ Line: 780 ]] --[[ Name: updateMode ]]
    -- upvalues: l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    local l_children_1 = v244.pendingProps.children;
    if v243 == nil then
        v244.child = l_mountChildFibers_0(v244, nil, l_children_1, v245);
    else
        v244.child = l_reconcileChildFibers_0(v244, v243.child, l_children_1, v245);
    end;
    return v244.child;
end;
updateProfiler = function(v247, v248, v249) --[[ Line: 790 ]] --[[ Name: updateProfiler ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    if l_enableProfilerTimer_0 then
        local l_stateNode_0 = v248.stateNode;
        l_stateNode_0.effectDuration = 0;
        l_stateNode_0.passiveEffectDuration = 0;
    end;
    local l_children_2 = v248.pendingProps.children;
    if v247 == nil then
        v248.child = l_mountChildFibers_0(v248, nil, l_children_2, v249);
    else
        v248.child = l_reconcileChildFibers_0(v248, v247.child, l_children_2, v249);
    end;
    return v248.child;
end;
local function _(v252, v253) --[[ Line: 808 ]] --[[ Name: markRef ]]
    -- upvalues: l_Ref_0 (copy)
    local l_ref_1 = v253.ref;
    if v252 == nil and l_ref_1 ~= nil or v252 ~= nil and v252.ref ~= l_ref_1 then
        v253.flags = bit32.bor(v253.flags, l_Ref_0);
    end;
end;
v165 = function(v256, v257, v258, v259, v260) --[[ Line: 819 ]] --[[ Name: updateFunctionComponent ]]
    -- upvalues: l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), l_disableLegacyContext_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_prepareToReadContext_0 (copy), v163 (copy), l_ReactCurrentOwner_0 (copy), l_setIsRendering_0 (copy), v113 (copy), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_reenableLogs_0 (copy), v166 (ref), v115 (copy), v164 (ref), l_PerformedWork_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    if (_G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__) and typeof(v258) ~= "function" and v257.type ~= v257.elementType then
        local v261 = nil;
        local v262 = nil;
        if typeof(v258) == "table" then
            v261 = v258.propTypes;
            v262 = v258.validateProps;
        end;
        if v261 or v262 then
            l_checkPropTypes_0(v261, v262, v259, "prop", l_getComponentName_0(v258));
        end;
    end;
    local v263 = nil;
    if not l_disableLegacyContext_0 then
        local v264 = l_getUnmaskedContext_0(v257, v258, true);
        v263 = l_getMaskedContext_0(v257, v264);
    end;
    local v265 = nil;
    l_prepareToReadContext_0(v257, v260, v163.markWorkInProgressReceivedUpdate);
    if _G.__DEV__ then
        l_ReactCurrentOwner_0.current = v257;
        l_setIsRendering_0(true);
        v265 = v113(v256, v257, v258, v259, v263, v260);
        if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v257.mode, l_StrictMode_0) ~= 0 then
            l_disableLogs_0();
            local l_status_2, l_result_2 = pcall(v113, v256, v257, v258, v259, v263, v260);
            l_reenableLogs_0();
            if l_status_2 then
                v265 = l_result_2;
            else
                error(l_result_2);
            end;
        end;
        l_setIsRendering_0(false);
    else
        v265 = v113(v256, v257, v258, v259, v263, v260);
    end;
    if v256 ~= nil and not v166 then
        v115(v256, v257, v260);
        return v164(v256, v257, v260);
    else
        v257.flags = bit32.bor(v257.flags, l_PerformedWork_0);
        local l_v265_0 = v265;
        if v256 == nil then
            v257.child = l_mountChildFibers_0(v257, nil, l_v265_0, v260);
        else
            v257.child = l_reconcileChildFibers_0(v257, v256.child, l_v265_0, v260);
        end;
        return v257.child;
    end;
end;
local function v281(v269, v270, v271, v272, v273) --[[ Line: 989 ]] --[[ Name: updateClassComponent ]]
    -- upvalues: l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), l_isContextProvider_0 (copy), l_pushContextProvider_0 (copy), l_prepareToReadContext_0 (copy), v163 (copy), l_Placement_0 (copy), l_constructClassInstance_0 (copy), l_mountClassInstance_0 (copy), l_resumeMountClassInstance_0 (copy), l_updateClassInstance_0 (copy), l_console_0 (copy)
    if (_G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__) and v270.type ~= v270.elementType then
        local l_propTypes_1 = v271.propTypes;
        local l_validateProps_1 = v271.validateProps;
        if l_propTypes_1 or l_validateProps_1 then
            l_checkPropTypes_0(l_propTypes_1, l_validateProps_1, v272, "prop", l_getComponentName_0(v271));
        end;
    end;
    local v276 = nil;
    if l_isContextProvider_0(v271) then
        v276 = true;
        l_pushContextProvider_0(v270);
    else
        v276 = false;
    end;
    l_prepareToReadContext_0(v270, v273, v163.markWorkInProgressReceivedUpdate);
    local l_stateNode_1 = v270.stateNode;
    local v278 = nil;
    if l_stateNode_1 == nil then
        if v269 ~= nil then
            v269.alternate = nil;
            v270.alternate = nil;
            v270.flags = bit32.bor(v270.flags, l_Placement_0);
        end;
        l_constructClassInstance_0(v270, v271, v272);
        l_mountClassInstance_0(v270, v271, v272, v273);
        v278 = true;
    else
        v278 = if v269 == nil then l_resumeMountClassInstance_0(v270, v271, v272, v273) else l_updateClassInstance_0(v269, v270, v271, v272, v273);
    end;
    local v279 = finishClassComponent(v269, v270, v271, v278, v276, v273);
    if _G.__DEV__ then
        local l_stateNode_2 = v270.stateNode;
        if v278 and l_stateNode_2.props ~= v272 then
            if not v163.didWarnAboutReassigningProps then
                l_console_0.error("It looks like %s is reassigning its own `this.props` while rendering. " .. "This is not supported and can lead to confusing bugs.", l_getComponentName_0(v270.type) or "a component");
            end;
            v163.didWarnAboutReassigningProps = true;
        end;
    end;
    return v279;
end;
finishClassComponent = function(v282, v283, v284, v285, v286, v287) --[[ Line: 1086 ]] --[[ Name: finishClassComponent ]]
    -- upvalues: l_Ref_0 (copy), l_DidCapture_0 (copy), l_NoFlags_0 (copy), l_invalidateContextProvider_0 (copy), v164 (ref), l_ReactCurrentOwner_0 (copy), l_enableProfilerTimer_0 (copy), l_stopProfilerTimerIfRunning_0 (copy), l_setIsRendering_0 (copy), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_reenableLogs_0 (copy), l_PerformedWork_0 (copy), l_reconcileChildFibers_0 (copy), l_mountChildFibers_0 (copy)
    local l_ref_2 = v283.ref;
    if v282 == nil and l_ref_2 ~= nil or v282 ~= nil and v282.ref ~= l_ref_2 then
        v283.flags = bit32.bor(v283.flags, l_Ref_0);
    end;
    l_ref_2 = bit32.band(v283.flags, l_DidCapture_0) ~= l_NoFlags_0;
    if not v285 and not l_ref_2 then
        if v286 then
            l_invalidateContextProvider_0(v283, v284, false);
        end;
        return v164(v282, v283, v287);
    else
        local l_stateNode_3 = v283.stateNode;
        l_ReactCurrentOwner_0.current = v283;
        local v290 = nil;
        if l_ref_2 and typeof(v284.getDerivedStateFromError) ~= "function" then
            v290 = nil;
            if l_enableProfilerTimer_0 then
                l_stopProfilerTimerIfRunning_0(v283);
            end;
        elseif _G.__DEV__ then
            l_setIsRendering_0(true);
            v290 = l_stateNode_3:render();
            if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v283.mode, l_StrictMode_0) ~= 0 then
                l_disableLogs_0();
                local l_status_3, l_result_3 = pcall(l_stateNode_3.render, l_stateNode_3);
                l_reenableLogs_0();
                if not l_status_3 then
                    error(l_result_3);
                end;
            end;
            l_setIsRendering_0(false);
        else
            v290 = l_stateNode_3:render();
        end;
        v283.flags = bit32.bor(v283.flags, l_PerformedWork_0);
        if v282 ~= nil and l_ref_2 then
            local l_v290_0 = v290;
            v283.child = l_reconcileChildFibers_0(v283, v282.child, nil, v287);
            v283.child = l_reconcileChildFibers_0(v283, nil, l_v290_0, v287);
        else
            local l_v290_1 = v290;
            if v282 == nil then
                v283.child = l_mountChildFibers_0(v283, nil, l_v290_1, v287);
            else
                v283.child = l_reconcileChildFibers_0(v283, v282.child, l_v290_1, v287);
            end;
        end;
        v283.memoizedState = l_stateNode_3.state;
        if v286 then
            l_invalidateContextProvider_0(v283, v284, true);
        end;
        return v283.child;
    end;
end;
local function _(v295) --[[ Line: 1181 ]] --[[ Name: pushHostRootContext ]]
    -- upvalues: l_pushTopLevelContextObject_0 (copy), l_pushHostContainer_0 (copy)
    local l_stateNode_4 = v295.stateNode;
    if l_stateNode_4.pendingContext then
        l_pushTopLevelContextObject_0(v295, l_stateNode_4.pendingContext, l_stateNode_4.pendingContext ~= l_stateNode_4.context);
    elseif l_stateNode_4.context then
        l_pushTopLevelContextObject_0(v295, l_stateNode_4.context, false);
    end;
    l_pushHostContainer_0(v295, l_stateNode_4.containerInfo);
end;
local function v313(v298, v299, v300) --[[ Line: 1197 ]] --[[ Name: updateHostRoot ]]
    -- upvalues: l_pushTopLevelContextObject_0 (copy), l_pushHostContainer_0 (copy), l_invariant_0 (copy), l_cloneUpdateQueue_0 (copy), l_processUpdateQueue_0 (copy), l_resetHydrationState_0 (copy), v164 (ref), l_enterHydrationState_0 (copy), l_supportsHydration_0 (copy), l_setWorkInProgressVersion_0 (copy), l_mountChildFibers_0 (copy), l_Placement_0 (copy), l_Hydrating_0 (copy), l_reconcileChildFibers_0 (copy)
    local l_stateNode_5 = v299.stateNode;
    if l_stateNode_5.pendingContext then
        l_pushTopLevelContextObject_0(v299, l_stateNode_5.pendingContext, l_stateNode_5.pendingContext ~= l_stateNode_5.context);
    elseif l_stateNode_5.context then
        l_pushTopLevelContextObject_0(v299, l_stateNode_5.context, false);
    end;
    l_pushHostContainer_0(v299, l_stateNode_5.containerInfo);
    l_stateNode_5 = v299.updateQueue;
    local l_l_invariant_0_0 = l_invariant_0;
    local v303 = false;
    if v298 ~= nil then
        v303 = l_stateNode_5 ~= nil;
    end;
    l_l_invariant_0_0(v303, "If the root does not have an updateQueue, we should have already " .. "bailed out. This error is likely caused by a bug in React. Please " .. "file an issue.");
    l_l_invariant_0_0 = v299.pendingProps;
    v303 = v299.memoizedState;
    local v304 = nil;
    if v303 ~= nil then
        v304 = v303.element;
    end;
    l_cloneUpdateQueue_0(v298, v299);
    l_processUpdateQueue_0(v299, l_l_invariant_0_0, nil, v300);
    local l_element_0 = v299.memoizedState.element;
    if l_element_0 == v304 then
        l_resetHydrationState_0();
        return v164(v298, v299, v300);
    else
        local l_stateNode_6 = v299.stateNode;
        if l_stateNode_6.hydrate and l_enterHydrationState_0(v299) then
            if l_supportsHydration_0 then
                local l_mutableSourceEagerHydrationData_0 = l_stateNode_6.mutableSourceEagerHydrationData;
                if l_mutableSourceEagerHydrationData_0 ~= nil then
                    for v308 = 1, #l_mutableSourceEagerHydrationData_0, 2 do
                        local v309 = l_mutableSourceEagerHydrationData_0[v308];
                        local v310 = l_mutableSourceEagerHydrationData_0[v308 + 1];
                        l_setWorkInProgressVersion_0(v309, v310);
                    end;
                end;
            end;
            local v311 = l_mountChildFibers_0(v299, nil, l_element_0, v300);
            v299.child = v311;
            local l_v311_0 = v311;
            while l_v311_0 do
                l_v311_0.flags = bit32.bor(bit32.band(l_v311_0.flags, (bit32.bnot(l_Placement_0))), l_Hydrating_0);
                l_v311_0 = l_v311_0.sibling;
            end;
        else
            if v298 == nil then
                v299.child = l_mountChildFibers_0(v299, nil, l_element_0, v300);
            else
                v299.child = l_reconcileChildFibers_0(v299, v298.child, l_element_0, v300);
            end;
            l_resetHydrationState_0();
        end;
        return v299.child;
    end;
end;
local function v322(v314, v315, v316) --[[ Line: 1279 ]] --[[ Name: updateHostComponent ]]
    -- upvalues: l_pushHostContext_0 (copy), l_tryToClaimNextHydratableInstance_0 (copy), l_shouldSetTextContent_0 (copy), l_ContentReset_0 (copy), l_PerformedWork_0 (copy), l_Ref_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    l_pushHostContext_0(v315);
    if v314 == nil then
        l_tryToClaimNextHydratableInstance_0(v315);
    end;
    local l_type_2 = v315.type;
    local l_pendingProps_2 = v315.pendingProps;
    local v319 = nil;
    if v314 ~= nil then
        v319 = v314.memoizedProps;
    end;
    local l_children_3 = l_pendingProps_2.children;
    if l_shouldSetTextContent_0(l_type_2, l_pendingProps_2) then
        l_children_3 = nil;
    elseif v319 ~= nil and l_shouldSetTextContent_0(l_type_2, v319) then
        v315.flags = bit32.bor(v315.flags, l_ContentReset_0);
    end;
    v315.flags = bit32.bor(v315.flags, l_PerformedWork_0);
    local l_ref_3 = v315.ref;
    if v314 == nil and l_ref_3 ~= nil or v314 ~= nil and v314.ref ~= l_ref_3 then
        v315.flags = bit32.bor(v315.flags, l_Ref_0);
    end;
    l_ref_3 = l_children_3;
    if v314 == nil then
        v315.child = l_mountChildFibers_0(v315, nil, l_ref_3, v316);
    else
        v315.child = l_reconcileChildFibers_0(v315, v314.child, l_ref_3, v316);
    end;
    return v315.child;
end;
local function _(v323, v324) --[[ Line: 1320 ]] --[[ Name: updateHostText ]]
    -- upvalues: l_tryToClaimNextHydratableInstance_0 (copy)
    if v323 == nil then
        l_tryToClaimNextHydratableInstance_0(v324);
    end;
    return nil;
end;
local function v340(v326, v327, v328, v329, v330) --[[ Line: 1329 ]] --[[ Name: mountLazyComponent ]]
    -- upvalues: l_Placement_0 (copy), l_resolveLazyComponentTag_0 (copy), l_resolveDefaultProps_0 (copy), l_FunctionComponent_0 (copy), l_resolveFunctionForHotReloading_0 (copy), v165 (ref), l_ClassComponent_0 (copy), l_resolveClassForHotReloading_0 (copy), v281 (copy), l_ForwardRef_0 (copy), l_resolveForwardRefForHotReloading_0 (copy), v192 (copy), l_MemoComponent_0 (copy), l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), v211 (copy), l_REACT_LAZY_TYPE_0 (copy), l_inspect_0 (copy), l_invariant_0 (copy)
    if v326 ~= nil then
        v326.alternate = nil;
        v327.alternate = nil;
        v327.flags = bit32.bor(v327.flags, l_Placement_0);
    end;
    local l_pendingProps_3 = v327.pendingProps;
    local l__payload_1 = v328._payload;
    local v333 = v328._init(l__payload_1);
    v327.type = v333;
    v327.tag = l_resolveLazyComponentTag_0(v333);
    local l_tag_0 = v327.tag;
    local v335 = l_resolveDefaultProps_0(v333, l_pendingProps_3);
    local _ = nil;
    if l_tag_0 == l_FunctionComponent_0 then
        if _G.__DEV__ then
            validateFunctionComponentInDev(v327, v333);
            v333 = l_resolveFunctionForHotReloading_0(v333);
            v327.type = v333;
        end;
        return (v165(nil, v327, v333, v335, v330));
    elseif l_tag_0 == l_ClassComponent_0 then
        if _G.__DEV__ then
            v333 = l_resolveClassForHotReloading_0(v333);
            v327.type = v333;
        end;
        return (v281(nil, v327, v333, v335, v330));
    elseif l_tag_0 == l_ForwardRef_0 then
        if _G.__DEV__ then
            v333 = l_resolveForwardRefForHotReloading_0(v333);
            v327.type = v333;
        end;
        return (v192(nil, v327, v333, v335, v330));
    elseif l_tag_0 == l_MemoComponent_0 then
        if (_G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__) and v327.type ~= v327.elementType then
            local l_propTypes_2 = v333.propTypes;
            local l_validateProps_2 = v333.validateProps;
            if l_propTypes_2 or l_validateProps_2 then
                l_checkPropTypes_0(l_propTypes_2, l_validateProps_2, v335, "prop", l_getComponentName_0(v333));
            end;
        end;
        return (v211(nil, v327, v333, l_resolveDefaultProps_0(v333.type, v335), v329, v330));
    else
        local v339 = "";
        if _G.__DEV__ then
            if v333 ~= nil and typeof(v333) == "table" and v333["$$typeof"] == l_REACT_LAZY_TYPE_0 then
                v339 = " Did you wrap a component in React.lazy() more than once?";
            elseif typeof(v333) == "table" and v333["$$typeof"] == nil then
                v339 = "\n" .. l_inspect_0(v333);
            end;
        end;
        l_invariant_0(false, "Element type is invalid. Received a promise that resolves to: %s. " .. "Lazy element type must resolve to a class or function.%s", tostring(v333), v339);
        return nil;
    end;
end;
mountIncompleteClassComponent = function(v341, v342, v343, v344, v345) --[[ Line: 1473 ]] --[[ Name: mountIncompleteClassComponent ]]
    -- upvalues: l_Placement_0 (copy), l_ClassComponent_0 (copy), l_isContextProvider_0 (copy), l_pushContextProvider_0 (copy), l_prepareToReadContext_0 (copy), v163 (copy), l_constructClassInstance_0 (copy), l_mountClassInstance_0 (copy)
    if v341 ~= nil then
        v341.alternate = nil;
        v342.alternate = nil;
        v342.flags = bit32.bor(v342.flags, l_Placement_0);
    end;
    v342.tag = l_ClassComponent_0;
    local v346 = nil;
    if l_isContextProvider_0(v343) then
        v346 = true;
        l_pushContextProvider_0(v342);
    else
        v346 = false;
    end;
    l_prepareToReadContext_0(v342, v345, v163.markWorkInProgressReceivedUpdate);
    l_constructClassInstance_0(v342, v343, v344);
    l_mountClassInstance_0(v342, v343, v344, v345);
    return finishClassComponent(nil, v342, v343, true, v346, v345);
end;
local function v362(v347, v348, v349, v350) --[[ Line: 1521 ]] --[[ Name: mountIndeterminateComponent ]]
    -- upvalues: l_Placement_0 (copy), l_disableLegacyContext_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_prepareToReadContext_0 (copy), v163 (copy), l_getComponentName_0 (copy), v167 (copy), l_console_0 (copy), l_StrictMode_0 (copy), v63 (copy), l_setIsRendering_0 (copy), l_ReactCurrentOwner_0 (copy), v113 (copy), l_PerformedWork_0 (copy), l_disableModulePatternComponents_0 (copy), l_ClassComponent_0 (copy), l_isContextProvider_0 (copy), l_pushContextProvider_0 (copy), l_initializeUpdateQueue_0 (copy), l_applyDerivedStateFromProps_0 (copy), l_adoptClassInstance_0 (copy), l_mountClassInstance_0 (copy), l_FunctionComponent_0 (copy), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_disableLogs_0 (copy), l_reenableLogs_0 (copy), l_mountChildFibers_0 (copy)
    if v347 ~= nil then
        v347.alternate = nil;
        v348.alternate = nil;
        v348.flags = bit32.bor(v348.flags, l_Placement_0);
    end;
    local l_pendingProps_4 = v348.pendingProps;
    local v352 = nil;
    if not l_disableLegacyContext_0 then
        local v353 = l_getUnmaskedContext_0(v348, v349, false);
        v352 = l_getMaskedContext_0(v348, v353);
    end;
    l_prepareToReadContext_0(v348, v350, v163.markWorkInProgressReceivedUpdate);
    local v354 = nil;
    if _G.__DEV__ then
        if typeof(v349) == "table" and typeof(v349.render) == "function" then
            local v355 = l_getComponentName_0(v349) or "Unknown";
            if not v167.didWarnAboutBadClass[v355] then
                l_console_0.error("The <%s /> component appears to have a render method, but doesn't extend React.Component. " .. "This is likely to cause errors. Change %s to extend React.Component instead.", v355, v355);
                v167.didWarnAboutBadClass[v355] = true;
            end;
        end;
        if bit32.band(v348.mode, l_StrictMode_0) ~= 0 then
            v63.recordLegacyContextWarning(v348, nil);
        end;
        l_setIsRendering_0(true);
        l_ReactCurrentOwner_0.current = v348;
        v354 = v113(nil, v348, v349, l_pendingProps_4, v352, v350);
        l_setIsRendering_0(false);
    else
        v354 = v113(nil, v348, v349, l_pendingProps_4, v352, v350);
    end;
    v348.flags = bit32.bor(v348.flags, l_PerformedWork_0);
    if _G.__DEV__ and typeof(v354) == "table" and v354 ~= nil and typeof(v354.render) == "function" and v354["$$typeof"] == nil then
        local v356 = l_getComponentName_0(v349) or "Unknown";
        if not v167.didWarnAboutModulePatternComponent[v356] then
            l_console_0.error("The <%s /> component appears to be a function component that returns a class instance. " .. "Change %s to a class that extends React.Component instead. ", v356, v356);
            v167.didWarnAboutModulePatternComponent[v356] = true;
        end;
    end;
    if not l_disableModulePatternComponents_0 and typeof(v354) == "table" and typeof(v354.render) == "function" and v354["$$typeof"] == nil then
        if _G.__DEV__ then
            local v357 = l_getComponentName_0(v349) or "Unknown";
            if not v167.didWarnAboutModulePatternComponent[v357] then
                l_console_0.error("The <%s /> component appears to be a function component that returns a class instance. " .. "Change %s to a class that extends React.Component instead. " .. v357, v357);
                v167.didWarnAboutModulePatternComponent[v357] = true;
            end;
        end;
        v348.tag = l_ClassComponent_0;
        v348.memoizedState = nil;
        v348.updateQueue = nil;
        local v358 = false;
        if l_isContextProvider_0(v349) then
            v358 = true;
            l_pushContextProvider_0(v348);
        else
            v358 = false;
        end;
        v348.memoizedState = v354.state;
        l_initializeUpdateQueue_0(v348);
        local v359 = nil;
        if typeof(v349) ~= "function" then
            v359 = v349.getDerivedStateFromProps;
        end;
        if typeof(v359) == "function" then
            l_applyDerivedStateFromProps_0(v348, v349, v359, l_pendingProps_4);
        end;
        l_adoptClassInstance_0(v348, v354);
        l_mountClassInstance_0(v348, v349, l_pendingProps_4, v350);
        return finishClassComponent(nil, v348, v349, true, v358, v350);
    else
        v348.tag = l_FunctionComponent_0;
        if _G.__DEV__ then
            if l_disableLegacyContext_0 and v349.contextTypes then
                l_console_0.error("%s uses the legacy contextTypes API which is no longer supported. " .. "Use React.createContext() with React.useContext() instead.", l_getComponentName_0(v349) or "Unknown");
            end;
            if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v348.mode, l_StrictMode_0) ~= 0 then
                l_disableLogs_0();
                local l_status_4, l_result_4 = pcall(v113, nil, v348, v349, l_pendingProps_4, v352, v350);
                l_reenableLogs_0();
                if l_status_4 then
                    v354 = l_result_4;
                else
                    error(l_result_4);
                end;
            end;
        end;
        v348.child = l_mountChildFibers_0(v348, nil, v354, v350);
        if _G.__DEV__ then
            validateFunctionComponentInDev(v348, v349);
        end;
        return v348.child;
    end;
end;
validateFunctionComponentInDev = function(v363, v364) --[[ Line: 1742 ]] --[[ Name: validateFunctionComponentInDev ]]
    -- upvalues: l_getCurrentFiberOwnerNameInDevOrNull_0 (copy), v167 (copy), l_console_0 (copy), l_warnAboutDefaultPropsOnFunctionComponents_0 (copy), l_getComponentName_0 (copy)
    if _G.__DEV__ then
        if v363.ref ~= nil then
            local v365 = "";
            local v366 = l_getCurrentFiberOwnerNameInDevOrNull_0();
            if v366 then
                v365 = v365 .. "\n\nCheck the render method of `" .. v366 .. "`.";
            end;
            local v367 = v366 or v363._debugID or "";
            local l__debugSource_0 = v363._debugSource;
            if l__debugSource_0 then
                v367 = l__debugSource_0.fileName .. ":" .. l__debugSource_0.lineNumber;
            end;
            if not v167.didWarnAboutFunctionRefs[v367] then
                v167.didWarnAboutFunctionRefs[v367] = true;
                l_console_0.error("Function components cannot be given refs. " .. "Attempts to access this ref will fail. " .. "Did you mean to use React.forwardRef()?%s", v365);
            end;
        end;
        if l_warnAboutDefaultPropsOnFunctionComponents_0 and typeof(v364) ~= "function" and v364.defaultProps ~= nil then
            local v369 = l_getComponentName_0(v364) or "Unknown";
            if not v167.didWarnAboutDefaultPropsOnFunctionComponent[v369] then
                l_console_0.error("%s: Support for defaultProps will be removed from function components " .. "in a future major release.", v369);
                v167.didWarnAboutDefaultPropsOnFunctionComponent[v369] = true;
            end;
        end;
        if typeof(v364) ~= "function" and typeof(v364.getDerivedStateFromProps) == "function" then
            local v370 = l_getComponentName_0(v364) or "Unknown";
            if not v167.didWarnAboutGetDerivedStateOnFunctionComponent[v370] then
                l_console_0.error("%s: Function components do not support getDerivedStateFromProps.", v370);
                v167.didWarnAboutGetDerivedStateOnFunctionComponent[v370] = true;
            end;
        end;
        if typeof(v364) ~= "function" and typeof(v364.contextType) == "table" and v364.contextType ~= nil then
            local v371 = l_getComponentName_0(v364) or "Unknown";
            if not v167.didWarnAboutContextTypeOnFunctionComponent[v371] then
                l_console_0.error("%s: Function components do not support contextType.", v371);
                v167.didWarnAboutContextTypeOnFunctionComponent[v371] = true;
            end;
        end;
    end;
end;
local v372 = {
    dehydrated = nil, 
    retryLane = v11.NoLane
};
local function _(v373) --[[ Line: 1831 ]] --[[ Name: mountSuspenseOffscreenState ]]
    return {
        baseLanes = v373
    };
end;
local function _(v375, v376) --[[ Line: 1837 ]] --[[ Name: updateSuspenseOffscreenState ]]
    -- upvalues: v11 (copy)
    return {
        baseLanes = v11.mergeLanes(v375.baseLanes, v376)
    };
end;
local _ = function(v378, v379, _, _) --[[ Line: 1847 ]] --[[ Name: shouldRemainOnFallback ]]
    -- upvalues: l_hasSuspenseContext_0 (copy), l_ForceSuspenseFallback_0 (copy)
    if v379 ~= nil and v379.memoizedState == nil then
        return false;
    else
        return l_hasSuspenseContext_0(v378, l_ForceSuspenseFallback_0);
    end;
end;
local function _(v383, v384) --[[ Line: 1874 ]] --[[ Name: getRemainingWorkInPrimaryTree ]]
    -- upvalues: v11 (copy)
    return v11.removeLanes(v383.childLanes, v384);
end;
local v386 = nil;
local v387 = nil;
local v388 = nil;
local v389 = nil;
local v390 = nil;
local function v425(v391, v392, v393) --[[ Line: 1886 ]] --[[ Name: updateSuspenseComponent ]]
    -- upvalues: v107 (copy), l_DidCapture_0 (copy), l_suspenseStackCursor_0 (copy), l_NoFlags_0 (copy), l_hasSuspenseContext_0 (copy), l_ForceSuspenseFallback_0 (copy), l_addSubtreeSuspenseContext_0 (copy), l_InvisibleParentSuspenseContext_0 (copy), l_setDefaultShallowSuspenseContext_0 (copy), l_pushSuspenseContext_0 (copy), l_tryToClaimNextHydratableInstance_0 (copy), l_enableSuspenseServerRenderer_0 (copy), v387 (ref), v372 (copy), v11 (copy), l_enableSchedulerTracing_0 (copy), l_markSpawnedWork_0 (copy), v388 (ref), v390 (ref), v389 (ref), v386 (ref)
    local v394 = false;
    local l_pendingProps_5 = v392.pendingProps;
    if _G.__DEV__ then
        if not v107.shouldSuspendRef then
            v107.shouldSuspendRef = require(script.Parent.ReactFiberReconciler).shouldSuspend;
        end;
        if v107.shouldSuspendRef(v392) then
            v392.flags = bit32.bor(v392.flags, l_DidCapture_0);
        end;
    end;
    local l_current_0 = l_suspenseStackCursor_0.current;
    local v397 = false;
    local v398 = bit32.band(v392.flags, l_DidCapture_0) ~= l_NoFlags_0;
    if not v398 then
        local l_l_current_0_0 = l_current_0;
        if v391 ~= nil and v391.memoizedState == nil or not l_hasSuspenseContext_0(l_l_current_0_0, l_ForceSuspenseFallback_0) then
            if (v391 == nil or v391.memoizedState ~= nil) and l_pendingProps_5.fallback ~= nil and l_pendingProps_5.unstable_avoidThisFallback ~= true then
                l_current_0 = l_addSubtreeSuspenseContext_0(l_current_0, l_InvisibleParentSuspenseContext_0);
                v394 = true;
            else
                v394 = true;
            end;
        end;
    end;
    if not v394 then
        if not v394 then
            v397 = true;
            v392.flags = bit32.band(v392.flags, (bit32.bnot(l_DidCapture_0)));
        end;
    end;
    v394 = false;
    l_current_0 = l_setDefaultShallowSuspenseContext_0(l_current_0);
    l_pushSuspenseContext_0(v392, l_current_0);
    if v391 == nil then
        if l_pendingProps_5.fallback ~= nil then
            l_tryToClaimNextHydratableInstance_0(v392);
            if l_enableSuspenseServerRenderer_0 then
                local l_memoizedState_0 = v392.memoizedState;
                if l_memoizedState_0 ~= nil then
                    local l_dehydrated_0 = l_memoizedState_0.dehydrated;
                    if l_dehydrated_0 ~= nil then
                        return v387(v392, l_dehydrated_0, v393);
                    end;
                end;
            end;
        end;
        local l_children_4 = l_pendingProps_5.children;
        local l_fallback_0 = l_pendingProps_5.fallback;
        if v397 then
            local v404 = mountSuspenseFallbackChildren(v392, l_children_4, l_fallback_0, v393);
            v392.child.memoizedState = {
                baseLanes = v393
            };
            v392.memoizedState = v372;
            return v404;
        elseif typeof(l_pendingProps_5.unstable_expectedLoadTime) == "number" then
            local v405 = mountSuspenseFallbackChildren(v392, l_children_4, l_fallback_0, v393);
            v392.child.memoizedState = {
                baseLanes = v393
            };
            v392.memoizedState = v372;
            v392.lanes = v11.SomeRetryLane;
            if l_enableSchedulerTracing_0 then
                l_markSpawnedWork_0(v11.SomeRetryLane);
            end;
            return v405;
        else
            return v388(v392, l_children_4, v393);
        end;
    else
        local l_memoizedState_1 = v391.memoizedState;
        if l_memoizedState_1 ~= nil then
            if l_enableSuspenseServerRenderer_0 then
                local l_dehydrated_1 = l_memoizedState_1.dehydrated;
                if l_dehydrated_1 ~= nil then
                    if not v398 then
                        return v390(v391, v392, l_dehydrated_1, l_memoizedState_1, v393);
                    elseif v392.memoizedState ~= nil then
                        v392.child = v391.child;
                        v392.flags = bit32.bor(v392, l_DidCapture_0);
                        return nil;
                    else
                        local l_children_5 = l_pendingProps_5.children;
                        local l_fallback_1 = l_pendingProps_5.fallback;
                        local v410 = mountSuspenseFallbackAfterRetryWithoutHydrating(v391, v392, l_children_5, l_fallback_1, v393);
                        v392.child.memoizedState = {
                            baseLanes = v393
                        };
                        v392.memoizedState = v372;
                        return v410;
                    end;
                end;
            end;
            if v397 then
                local l_fallback_2 = l_pendingProps_5.fallback;
                local l_children_6 = l_pendingProps_5.children;
                local v413 = v389(v391, v392, l_children_6, l_fallback_2, v393);
                local l_child_1 = v392.child;
                local l_memoizedState_2 = v391.child.memoizedState;
                if l_memoizedState_2 == nil then
                    l_child_1.memoizedState = {
                        baseLanes = v393
                    };
                else
                    l_child_1.memoizedState = {
                        baseLanes = v11.mergeLanes(l_memoizedState_2.baseLanes, v393)
                    };
                end;
                l_child_1.childLanes = v11.removeLanes(v391.childLanes, v393);
                v392.memoizedState = v372;
                return v413;
            else
                local l_children_7 = l_pendingProps_5.children;
                local v417 = v386(v391, v392, l_children_7, v393);
                v392.memoizedState = nil;
                return v417;
            end;
        elseif v397 then
            local l_fallback_3 = l_pendingProps_5.fallback;
            local l_children_8 = l_pendingProps_5.children;
            local v420 = v389(v391, v392, l_children_8, l_fallback_3, v393);
            local l_child_2 = v392.child;
            local l_memoizedState_3 = v391.child.memoizedState;
            if l_memoizedState_3 == nil then
                l_child_2.memoizedState = {
                    baseLanes = v393
                };
            else
                l_child_2.memoizedState = {
                    baseLanes = v11.mergeLanes(l_memoizedState_3.baseLanes, v393)
                };
            end;
            l_child_2.childLanes = v11.removeLanes(v391.childLanes, v393);
            v392.memoizedState = v372;
            return v420;
        else
            local l_children_9 = l_pendingProps_5.children;
            local v424 = v386(v391, v392, l_children_9, v393);
            v392.memoizedState = nil;
            return v424;
        end;
    end;
end;
v388 = function(v426, v427, v428) --[[ Line: 2181 ]] --[[ Name: mountSuspensePrimaryChildren ]]
    -- upvalues: l_createFiberFromOffscreen_0 (copy)
    local l_mode_0 = v426.mode;
    local v430 = {
        mode = "visible", 
        children = v427
    };
    local v431 = l_createFiberFromOffscreen_0(v430, l_mode_0, v428, nil);
    v431.return_ = v426;
    v426.child = v431;
    return v431;
end;
mountSuspenseFallbackChildren = function(v432, v433, v434, v435) --[[ Line: 2202 ]] --[[ Name: mountSuspenseFallbackChildren ]]
    -- upvalues: l_BlockingMode_0 (copy), l_NoMode_0 (copy), v11 (copy), l_enableProfilerTimer_0 (copy), l_ProfileMode_0 (copy), l_createFiberFromFragment_0 (copy), l_createFiberFromOffscreen_0 (copy)
    local l_mode_1 = v432.mode;
    local l_child_3 = v432.child;
    local v438 = {
        mode = "hidden", 
        children = v433
    };
    local v439 = nil;
    local v440 = nil;
    if bit32.band(l_mode_1, l_BlockingMode_0) == l_NoMode_0 and l_child_3 ~= nil then
        v439 = l_child_3;
        v439.childLanes = v11.NoLanes;
        v439.pendingProps = v438;
        if l_enableProfilerTimer_0 and bit32.band(v432.mode, l_ProfileMode_0) ~= 0 then
            v439.actualDuration = 0;
            v439.actualStartTime = -1;
            v439.selfBaseDuration = 0;
            v439.treeBaseDuration = 0;
        end;
        v440 = l_createFiberFromFragment_0(v434, l_mode_1, v435, nil);
    else
        v439 = l_createFiberFromOffscreen_0(v438, l_mode_1, v11.NoLanes, nil);
        v440 = l_createFiberFromFragment_0(v434, l_mode_1, v435, nil);
    end;
    v439.return_ = v432;
    v440.return_ = v432;
    v439.sibling = v440;
    v432.child = v439;
    return v440;
end;
local function _(v441, v442) --[[ Line: 2264 ]] --[[ Name: createWorkInProgressOffscreenFiber ]]
    -- upvalues: l_createWorkInProgress_0 (copy)
    return l_createWorkInProgress_0(v441, v442);
end;
v386 = function(v444, v445, v446, v447) --[[ Line: 2273 ]] --[[ Name: updateSuspensePrimaryChildren ]]
    -- upvalues: l_createWorkInProgress_0 (copy), l_BlockingMode_0 (copy), l_NoMode_0 (copy), l_Deletion_0 (copy)
    local l_child_4 = v444.child;
    local l_sibling_0 = l_child_4.sibling;
    local v450 = {
        mode = "visible", 
        children = v446
    };
    local v451 = l_createWorkInProgress_0(l_child_4, v450);
    if bit32.band(v445.mode, l_BlockingMode_0) == l_NoMode_0 then
        v451.lanes = v447;
    end;
    v451.return_ = v445;
    v451.sibling = nil;
    if l_sibling_0 ~= nil then
        v450 = v445.deletions;
        if v450 == nil then
            v445.deletions = {
                l_sibling_0
            };
            v445.flags = bit32.bor(v445.flags, l_Deletion_0);
        else
            table.insert(v450, l_sibling_0);
        end;
    end;
    v445.child = v451;
    return v451;
end;
v389 = function(v452, v453, v454, v455, v456) --[[ Line: 2311 ]] --[[ Name: updateSuspenseFallbackChildren ]]
    -- upvalues: l_BlockingMode_0 (copy), l_NoMode_0 (copy), v11 (copy), l_enableProfilerTimer_0 (copy), l_ProfileMode_0 (copy), l_createWorkInProgress_0 (copy), l_StaticMask_0 (copy), l_createFiberFromFragment_0 (copy), l_Placement_0 (copy)
    local l_mode_2 = v453.mode;
    local l_child_5 = v452.child;
    local l_sibling_1 = l_child_5.sibling;
    local v460 = {
        mode = "hidden", 
        children = v454
    };
    local v461 = nil;
    if bit32.band(l_mode_2, l_BlockingMode_0) == l_NoMode_0 and v453.child ~= l_child_5 then
        v461 = v453.child;
        v461.childLanes = v11.NoLanes;
        v461.pendingProps = v460;
        if l_enableProfilerTimer_0 and bit32.band(v453.mode, l_ProfileMode_0) ~= 0 then
            v461.actualDuration = 0;
            v461.actualStartTime = -1;
            v461.selfBaseDuration = l_child_5.selfBaseDuration;
            v461.treeBaseDuration = l_child_5.treeBaseDuration;
        end;
        v453.deletions = nil;
    else
        v461 = l_createWorkInProgress_0(l_child_5, v460);
        v461.subtreeFlags = bit32.band(l_child_5.subtreeFlags, l_StaticMask_0);
    end;
    local v462 = nil;
    if l_sibling_1 ~= nil then
        v462 = l_createWorkInProgress_0(l_sibling_1, v455);
    else
        v462 = l_createFiberFromFragment_0(v455, l_mode_2, v456, nil);
        v462.flags = bit32.bor(v462.flags, l_Placement_0);
    end;
    v462.return_ = v453;
    v461.return_ = v453;
    v461.sibling = v462;
    v453.child = v461;
    return v462;
end;
local function _(v463, v464, v465) --[[ Line: 2400 ]] --[[ Name: retrySuspenseComponentWithoutHydrating ]]
    -- upvalues: l_reconcileChildFibers_0 (copy), v388 (ref), l_Placement_0 (copy)
    l_reconcileChildFibers_0(v464, v463.child, nil, v465);
    local l_children_10 = v464.pendingProps.children;
    local v467 = v388(v464, l_children_10, v465);
    v467.flags = bit32.bor(v467.flags, l_Placement_0);
    v464.memoizedState = nil;
    return v467;
end;
mountSuspenseFallbackAfterRetryWithoutHydrating = function(v469, v470, v471, v472, v473) --[[ Line: 2424 ]] --[[ Name: mountSuspenseFallbackAfterRetryWithoutHydrating ]]
    -- upvalues: l_createFiberFromOffscreen_0 (copy), v11 (copy), l_createFiberFromFragment_0 (copy), l_Placement_0 (copy), l_BlockingMode_0 (copy), l_NoMode_0 (copy), l_reconcileChildFibers_0 (copy)
    local l_mode_3 = v470.mode;
    local v475 = l_createFiberFromOffscreen_0(v471, l_mode_3, v11.NoLanes, nil);
    local v476 = l_createFiberFromFragment_0(v472, l_mode_3, v473, nil);
    v476.flags = bit32.bor(v476.flags, l_Placement_0);
    v475.return_ = v470;
    v476.return_ = v470;
    v475.sibling = v476;
    v470.child = v475;
    if bit32.band(v470.mode, l_BlockingMode_0) ~= l_NoMode_0 then
        l_reconcileChildFibers_0(v470, v469.child, nil, v473);
    end;
    return v476;
end;
v387 = function(v477, v478, _) --[[ Line: 2462 ]] --[[ Name: mountDehydratedSuspenseComponent ]]
    -- upvalues: l_BlockingMode_0 (copy), l_NoMode_0 (copy), l_console_0 (copy), v11 (copy), l_isSuspenseInstanceFallback_0 (copy), l_enableSchedulerTracing_0 (copy), l_markSpawnedWork_0 (copy)
    if bit32.band(v477.mode, l_BlockingMode_0) == l_NoMode_0 then
        if _G.__DEV__ then
            l_console_0.error("Cannot hydrate Suspense in legacy mode. Switch from" .. "ReactDOM.hydrate(element, container) to " .. "ReactDOM.createBlockingRoot(container, { hydrate: true })" .. ".render(element) or remove the Suspense components" .. "the server rendered components.");
        end;
        v477.lanes = v11.laneToLanes(v11.SyncLane);
    elseif l_isSuspenseInstanceFallback_0(v478) then
        if l_enableSchedulerTracing_0 then
            l_markSpawnedWork_0(v11.DefaultHydrationLane);
        end;
        v477.lanes = v11.laneToLanes(v11.DefaultHydrationLane);
    else
        v477.lanes = v11.laneToLanes(v11.OffscreenLane);
        if l_enableSchedulerTracing_0 then
            l_markSpawnedWork_0(v11.OffscreenLane);
        end;
    end;
    return nil;
end;
v390 = function(v480, v481, v482, v483, v484) --[[ Line: 2508 ]] --[[ Name: updateDehydratedSuspenseComponent ]]
    -- upvalues: l_warnIfHydrating_0 (copy), l_getExecutionContext_0 (copy), l_RetryAfterError_0 (copy), l_NoContext_0 (copy), l_reconcileChildFibers_0 (copy), v388 (ref), l_Placement_0 (copy), l_BlockingMode_0 (copy), l_NoMode_0 (copy), l_isSuspenseInstanceFallback_0 (copy), v11 (copy), v166 (ref), l_getWorkInProgressRoot_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_renderDidSuspendDelayIfPossible_0 (copy), l_isSuspenseInstancePending_0 (copy), l_DidCapture_0 (copy), l_retryDehydratedSuspenseBoundary_0 (copy), l_enableSchedulerTracing_0 (copy), v156 (ref), l_Parent_0 (copy), l_registerSuspenseInstanceRetry_0 (copy), l_reenterHydrationStateFromDehydratedSuspenseInstance_0 (copy), l_Hydrating_0 (copy)
    l_warnIfHydrating_0();
    if bit32.band(l_getExecutionContext_0(), l_RetryAfterError_0) ~= l_NoContext_0 then
        l_reconcileChildFibers_0(v481, v480.child, nil, v484);
        local l_children_11 = v481.pendingProps.children;
        local v486 = v388(v481, l_children_11, v484);
        v486.flags = bit32.bor(v486.flags, l_Placement_0);
        v481.memoizedState = nil;
        return v486;
    elseif bit32.band(v481.mode, l_BlockingMode_0) == l_NoMode_0 then
        l_reconcileChildFibers_0(v481, v480.child, nil, v484);
        local l_children_12 = v481.pendingProps.children;
        local v488 = v388(v481, l_children_12, v484);
        v488.flags = bit32.bor(v488.flags, l_Placement_0);
        v481.memoizedState = nil;
        return v488;
    elseif l_isSuspenseInstanceFallback_0(v482) then
        l_reconcileChildFibers_0(v481, v480.child, nil, v484);
        local l_children_13 = v481.pendingProps.children;
        local v490 = v388(v481, l_children_13, v484);
        v490.flags = bit32.bor(v490.flags, l_Placement_0);
        v481.memoizedState = nil;
        return v490;
    else
        local v491 = v11.includesSomeLane(v484, v480.childLanes);
        if v166 or v491 then
            local v492 = l_getWorkInProgressRoot_0();
            if v492 ~= nil then
                local v493 = v11.getBumpedLaneForHydration(v492, v484);
                if v493 ~= v11.NoLane and v493 ~= v483.retryLane then
                    v483.retryLane = v493;
                    local l_NoTimestamp_0 = v11.NoTimestamp;
                    l_scheduleUpdateOnFiber_0(v480, v493, l_NoTimestamp_0);
                end;
            end;
            l_renderDidSuspendDelayIfPossible_0();
            l_reconcileChildFibers_0(v481, v480.child, nil, v484);
            local l_children_14 = v481.pendingProps.children;
            local v496 = v388(v481, l_children_14, v484);
            v496.flags = bit32.bor(v496.flags, l_Placement_0);
            v481.memoizedState = nil;
            return v496;
        elseif l_isSuspenseInstancePending_0(v482) then
            v481.flags = bit32.bor(v481.flags, l_DidCapture_0);
            v481.child = v480.child;
            local function v497() --[[ Line: 2605 ]]
                -- upvalues: l_retryDehydratedSuspenseBoundary_0 (ref), v480 (copy)
                return l_retryDehydratedSuspenseBoundary_0(v480);
            end;
            if l_enableSchedulerTracing_0 then
                if v156 == nil then
                    v156 = require(l_Parent_0.Scheduler).tracing.unstable_wrap;
                end;
                v497 = v156(v497);
            end;
            l_registerSuspenseInstanceRetry_0(v482, v497);
            return nil;
        else
            l_reenterHydrationStateFromDehydratedSuspenseInstance_0(v481, v482);
            local l_children_15 = v481.pendingProps.children;
            local v499 = v388(v481, l_children_15, v484);
            v499.flags = bit32.bor(v499.flags, l_Hydrating_0);
            return v499;
        end;
    end;
end;
updatePortalComponent = function(v500, v501, v502) --[[ Line: 3021 ]] --[[ Name: updatePortalComponent ]]
    -- upvalues: l_pushHostContainer_0 (copy), l_reconcileChildFibers_0 (copy), l_mountChildFibers_0 (copy)
    l_pushHostContainer_0(v501, v501.stateNode.containerInfo);
    local l_pendingProps_6 = v501.pendingProps;
    if v500 == nil then
        v501.child = l_reconcileChildFibers_0(v501, nil, l_pendingProps_6, v502);
    elseif v500 == nil then
        v501.child = l_mountChildFibers_0(v501, nil, l_pendingProps_6, v502);
    else
        v501.child = l_reconcileChildFibers_0(v501, v500.child, l_pendingProps_6, v502);
    end;
    return v501.child;
end;
local v504 = false;
local function v517(v505, v506, v507) --[[ Line: 3048 ]] --[[ Name: updateContextProvider ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v504 (ref), l_console_0 (copy), l_checkPropTypes_0 (copy), l_pushProvider_0 (copy), l_calculateChangedBits_0 (copy), l_hasContextChanged_0 (copy), v164 (ref), l_propagateContextChange_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    local l__context_0 = v506.type._context;
    local l_pendingProps_7 = v506.pendingProps;
    local l_memoizedProps_2 = v506.memoizedProps;
    local l_value_0 = l_pendingProps_7.value;
    if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        if l_Array_0.indexOf(l_Object_0.keys(l_pendingProps_7), "value") < 1 and not v504 then
            v504 = true;
            l_console_0.error("The `value` prop is required for the `<Context.Provider>`. Did you misspell it or forget to pass it?");
        end;
        local l_propTypes_3 = v506.type.propTypes;
        local l_validateProps_3 = v506.type.validateProps;
        if l_propTypes_3 or l_validateProps_3 then
            l_checkPropTypes_0(l_propTypes_3, l_validateProps_3, l_pendingProps_7, "prop", "Context.Provider");
        end;
    end;
    l_pushProvider_0(v506, l_value_0);
    if l_memoizedProps_2 ~= nil then
        local l_value_1 = l_memoizedProps_2.value;
        local v515 = l_calculateChangedBits_0(l__context_0, l_value_0, l_value_1);
        if v515 == 0 then
            if l_memoizedProps_2.children == l_pendingProps_7.children and not l_hasContextChanged_0() then
                return v164(v505, v506, v507);
            end;
        else
            l_propagateContextChange_0(v506, l__context_0, v515, v507);
        end;
    end;
    local l_children_16 = l_pendingProps_7.children;
    if v505 == nil then
        v506.child = l_mountChildFibers_0(v506, nil, l_children_16, v507);
    else
        v506.child = l_reconcileChildFibers_0(v506, v505.child, l_children_16, v507);
    end;
    return v506.child;
end;
local v518 = {
    usingContextAsConsumer = false, 
    usingLegacyConsumer = false
};
updateContextConsumer = function(v519, v520, v521) --[[ Line: 3114 ]] --[[ Name: updateContextConsumer ]]
    -- upvalues: v518 (copy), l_console_0 (copy), l_prepareToReadContext_0 (copy), v163 (copy), l_readContext_0 (copy), l_ReactCurrentOwner_0 (copy), l_setIsRendering_0 (copy), l_PerformedWork_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    local l_type_3 = v520.type;
    if _G.__DEV__ then
        if l_type_3._context == nil then
            if l_type_3 ~= l_type_3.Consumer and not v518.usingContextAsConsumer then
                v518.usingContextAsConsumer = true;
                l_console_0.error("Rendering <Context> directly is not supported and will be removed in " .. "a future major release. Did you mean to render <Context.Consumer> instead?");
            end;
        else
            l_type_3 = l_type_3._context;
        end;
    end;
    local l_pendingProps_8 = v520.pendingProps;
    local v524 = nil;
    if l_pendingProps_8.render then
        if _G.__DEV__ and _G.__COMPAT_WARNINGS__ and not v518.usingLegacyConsumer then
            v518.usingLegacyConsumer = true;
            l_console_0.warn("Your Context.Consumer component is using legacy Roact syntax, which won't be supported in future versions of Roact. \n" .. "Please provide no props and supply the 'render' function as a child (the 3rd argument of createElement). For example: \n" .. "       createElement(ContextConsumer, {render = function(...) end})\n" .. "becomes:\n" .. "       createElement(ContextConsumer, nil, function(...) end)\n" .. "For more info, reference the React documentation here: \n" .. "https://reactjs.org/docs/context.html#contextconsumer");
        end;
        v524 = l_pendingProps_8.render;
    else
        v524 = l_pendingProps_8.children;
    end;
    if _G.__DEV__ and typeof(v524) ~= "function" then
        l_console_0.error("A context consumer was rendered with multiple children, or a child " .. "that isn't a function. A context consumer expects a single child " .. "that is a function. If you did pass a function, make sure there " .. "is no trailing or leading whitespace around it.");
    end;
    l_prepareToReadContext_0(v520, v521, v163.markWorkInProgressReceivedUpdate);
    local v525 = l_readContext_0(l_type_3, l_pendingProps_8.unstable_observedBits);
    local v526 = nil;
    if _G.__DEV__ then
        l_ReactCurrentOwner_0.current = v520;
        l_setIsRendering_0(true);
        v526 = v524(v525);
        l_setIsRendering_0(false);
    else
        v526 = v524(v525);
    end;
    v520.flags = bit32.bor(v520.flags, l_PerformedWork_0);
    local l_v526_0 = v526;
    if v519 == nil then
        v520.child = l_mountChildFibers_0(v520, nil, l_v526_0, v521);
    else
        v520.child = l_reconcileChildFibers_0(v520, v519.child, l_v526_0, v521);
    end;
    return v520.child;
end;
v163.markWorkInProgressReceivedUpdate = function() --[[ Line: 3218 ]]
    -- upvalues: v166 (ref)
    v166 = true;
end;
v164 = function(v528, v529, v530) --[[ Line: 3222 ]] --[[ Name: bailoutOnAlreadyFinishedWork ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_stopProfilerTimerIfRunning_0 (copy), l_markSkippedUpdateLanes_0 (copy), v11 (copy), l_cloneChildFibers_0 (copy)
    if v528 then
        v529.dependencies = v528.dependencies;
    end;
    if l_enableProfilerTimer_0 then
        l_stopProfilerTimerIfRunning_0(v529);
    end;
    l_markSkippedUpdateLanes_0(v529.lanes);
    if not v11.includesSomeLane(v530, v529.childLanes) then
        return nil;
    else
        l_cloneChildFibers_0(v528, v529);
        return v529.child;
    end;
end;
remountFiber = function(v531, v532, v533) --[[ Line: 3253 ]] --[[ Name: remountFiber ]]
    -- upvalues: l_Deletion_0 (copy), l_Placement_0 (copy)
    if _G.__DEV__ then
        local l_return__0 = v532.return_;
        if l_return__0 == nil then
            error("Cannot swap the root fiber.");
        end;
        v531.alternate = nil;
        v532.alternate = nil;
        v533.index = v532.index;
        v533.sibling = v532.sibling;
        v533.return_ = v532.return_;
        v533.ref = v532.ref;
        if v532 == l_return__0.child then
            l_return__0.child = v533;
        else
            local l_child_6 = l_return__0.child;
            if l_child_6 == nil then
                error("Expected parent to have a child.");
            end;
            while l_child_6.sibling ~= v532 do
                l_child_6 = l_child_6.sibling;
                if l_child_6 == nil then
                    error("Expected to find the previous sibling.");
                end;
            end;
            l_child_6.sibling = v533;
        end;
        local l_deletions_0 = l_return__0.deletions;
        if l_deletions_0 == nil then
            l_return__0.deletions = {
                v531
            };
            l_return__0.flags = bit32.bor(l_return__0.flags, l_Deletion_0);
        else
            table.insert(l_deletions_0, v531);
        end;
        v533.flags = bit32.bor(v533.flags, l_Placement_0);
        return v533;
    else
        error("Did not expect this call in production. " .. "This is a bug in React. Please file an issue.");
        return;
    end;
end;
v163.beginWork = function(v537, v538, v539) --[[ Line: 3317 ]] --[[ Name: beginWork ]]
    -- upvalues: l_createFiberFromTypeAndProps_0 (copy), l_hasContextChanged_0 (copy), v166 (ref), v11 (copy), l_HostRoot_0 (copy), l_pushTopLevelContextObject_0 (copy), l_pushHostContainer_0 (copy), l_resetHydrationState_0 (copy), l_HostComponent_0 (copy), l_pushHostContext_0 (copy), l_ClassComponent_0 (copy), l_isContextProvider_0 (copy), l_pushContextProvider_0 (copy), l_HostPortal_0 (copy), l_ContextProvider_0 (copy), l_pushProvider_0 (copy), l_Profiler_0 (copy), l_enableProfilerTimer_0 (copy), l_SuspenseComponent_0 (copy), l_enableSuspenseServerRenderer_0 (copy), l_pushSuspenseContext_0 (copy), l_setDefaultShallowSuspenseContext_0 (copy), l_suspenseStackCursor_0 (copy), l_DidCapture_0 (copy), v425 (copy), v164 (ref), l_SuspenseListComponent_0 (copy), l_OffscreenComponent_0 (copy), l_LegacyHiddenComponent_0 (copy), v238 (copy), l_ForceUpdateForLegacySuspense_0 (copy), l_NoFlags_0 (copy), v16 (copy), v362 (copy), l_LazyComponent_0 (copy), v340 (copy), l_FunctionComponent_0 (copy), l_resolveDefaultProps_0 (copy), v165 (ref), v281 (copy), v313 (copy), v322 (copy), l_HostText_0 (copy), l_tryToClaimNextHydratableInstance_0 (copy), l_ForwardRef_0 (copy), v192 (copy), l_Fragment_0 (copy), l_Mode_0 (copy), v517 (copy), l_ContextConsumer_0 (copy), l_MemoComponent_0 (copy), l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), v211 (copy), l_SimpleMemoComponent_0 (copy), v168 (ref), l_IncompleteClassComponent_0 (copy), v238 (copy), l_invariant_0 (copy)
    local l_lanes_0 = v538.lanes;
    if _G.__DEV__ and v538._debugNeedsRemount and v537 ~= nil then
        return remountFiber(v537, v538, l_createFiberFromTypeAndProps_0(v538.type, v538.key, v538.pendingProps, v538._debugOwner or nil, v538.mode, v538.lanes));
    else
        if v537 ~= nil then
            local l_memoizedProps_3 = v537.memoizedProps;
            local l_pendingProps_9 = v538.pendingProps;
            local v543 = nil;
            v543 = if _G.__DEV__ then v538.type ~= v537.type else false;
            if l_memoizedProps_3 ~= l_pendingProps_9 or l_hasContextChanged_0() or v543 then
                v166 = true;
            elseif not v11.includesSomeLane(v539, l_lanes_0) then
                v166 = false;
                if v538.tag == l_HostRoot_0 then
                    local l_stateNode_7 = v538.stateNode;
                    if l_stateNode_7.pendingContext then
                        l_pushTopLevelContextObject_0(v538, l_stateNode_7.pendingContext, l_stateNode_7.pendingContext ~= l_stateNode_7.context);
                    elseif l_stateNode_7.context then
                        l_pushTopLevelContextObject_0(v538, l_stateNode_7.context, false);
                    end;
                    l_pushHostContainer_0(v538, l_stateNode_7.containerInfo);
                    l_resetHydrationState_0();
                elseif v538.tag == l_HostComponent_0 then
                    l_pushHostContext_0(v538);
                elseif v538.tag == l_ClassComponent_0 then
                    local l_type_4 = v538.type;
                    if l_isContextProvider_0(l_type_4) then
                        l_pushContextProvider_0(v538);
                    end;
                elseif v538.tag == l_HostPortal_0 then
                    l_pushHostContainer_0(v538, v538.stateNode.containerInfo);
                elseif v538.tag == l_ContextProvider_0 then
                    local l_value_2 = v538.memoizedProps.value;
                    l_pushProvider_0(v538, l_value_2);
                elseif v538.tag == l_Profiler_0 then
                    if l_enableProfilerTimer_0 then
                        local l_stateNode_8 = v538.stateNode;
                        l_stateNode_8.effectDuration = 0;
                        l_stateNode_8.passiveEffectDuration = 0;
                    end;
                elseif v538.tag == l_SuspenseComponent_0 then
                    local l_memoizedState_4 = v538.memoizedState;
                    if l_memoizedState_4 ~= nil then
                        if l_enableSuspenseServerRenderer_0 and l_memoizedState_4.dehydrated ~= nil then
                            l_pushSuspenseContext_0(v538, l_setDefaultShallowSuspenseContext_0(l_suspenseStackCursor_0.current));
                            v538.flags = bit32.bor(v538.flags, l_DidCapture_0);
                            return nil;
                        else
                            local l_childLanes_0 = v538.child.childLanes;
                            if v11.includesSomeLane(v539, l_childLanes_0) then
                                return v425(v537, v538, v539);
                            else
                                l_pushSuspenseContext_0(v538, l_setDefaultShallowSuspenseContext_0(l_suspenseStackCursor_0.current));
                                local v550 = v164(v537, v538, v539);
                                if v550 ~= nil then
                                    return v550.sibling;
                                else
                                    return nil;
                                end;
                            end;
                        end;
                    else
                        l_pushSuspenseContext_0(v538, l_setDefaultShallowSuspenseContext_0(l_suspenseStackCursor_0.current));
                    end;
                elseif v538.tag == l_SuspenseListComponent_0 then
                    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                    print("UNIMPLEMENTED ERROR: " .. tostring("beginWork: SuspenseListComponent"));
                    error("FIXME (roblox): " .. "beginWork: SuspenseListComponent" .. " is unimplemented", 2);
                elseif v538.tag == l_OffscreenComponent_0 or v538.tag == l_LegacyHiddenComponent_0 then
                    v538.lanes = v11.NoLanes;
                    return (v238(v537, v538, v539));
                end;
                return v164(v537, v538, v539);
            elseif bit32.band(v537.flags, l_ForceUpdateForLegacySuspense_0) ~= l_NoFlags_0 then
                v166 = true;
            else
                v166 = false;
            end;
        else
            v166 = false;
        end;
        v538.lanes = v11.NoLanes;
        if v538.tag == v16.IndeterminateComponent then
            return v362(v537, v538, v538.type, v539);
        elseif v538.tag == l_LazyComponent_0 then
            local l_elementType_1 = v538.elementType;
            return (v340(v537, v538, l_elementType_1, l_lanes_0, v539));
        elseif v538.tag == l_FunctionComponent_0 then
            local l_type_5 = v538.type;
            local l_pendingProps_10 = v538.pendingProps;
            local v554 = nil;
            v554 = if v538.elementType == l_type_5 then l_pendingProps_10 else l_resolveDefaultProps_0(l_type_5, l_pendingProps_10);
            return v165(v537, v538, l_type_5, v554, v539);
        elseif v538.tag == l_ClassComponent_0 then
            local l_type_6 = v538.type;
            local l_pendingProps_11 = v538.pendingProps;
            local v557 = v538.elementType == l_type_6 and l_pendingProps_11 or l_resolveDefaultProps_0(l_type_6, l_pendingProps_11);
            return (v281(v537, v538, l_type_6, v557, v539));
        elseif v538.tag == l_HostRoot_0 then
            return v313(v537, v538, v539);
        elseif v538.tag == l_HostComponent_0 then
            return (v322(v537, v538, v539));
        elseif v538.tag == l_HostText_0 then
            if v537 == nil then
                l_tryToClaimNextHydratableInstance_0(v538);
            end;
            return nil;
        elseif v538.tag == l_SuspenseComponent_0 then
            return v425(v537, v538, v539);
        elseif v538.tag == l_HostPortal_0 then
            return updatePortalComponent(v537, v538, v539);
        elseif v538.tag == l_ForwardRef_0 then
            local l_type_7 = v538.type;
            local l_pendingProps_12 = v538.pendingProps;
            local l_l_pendingProps_12_0 = l_pendingProps_12;
            if v538.elementType ~= l_type_7 then
                l_l_pendingProps_12_0 = l_resolveDefaultProps_0(l_type_7, l_pendingProps_12);
            end;
            return v192(v537, v538, l_type_7, l_l_pendingProps_12_0, v539);
        elseif v538.tag == l_Fragment_0 then
            return updateFragment(v537, v538, v539);
        elseif v538.tag == l_Mode_0 then
            return updateMode(v537, v538, v539);
        elseif v538.tag == l_Profiler_0 then
            return updateProfiler(v537, v538, v539);
        elseif v538.tag == l_ContextProvider_0 then
            return v517(v537, v538, v539);
        elseif v538.tag == l_ContextConsumer_0 then
            return updateContextConsumer(v537, v538, v539);
        elseif v538.tag == l_MemoComponent_0 then
            local l_type_8 = v538.type;
            local l_pendingProps_13 = v538.pendingProps;
            local v563 = l_resolveDefaultProps_0(l_type_8, l_pendingProps_13);
            if (_G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__) and v538.type ~= v538.elementType then
                local v564 = nil;
                local v565 = nil;
                if typeof(l_type_8) == "table" then
                    v564 = l_type_8.propTypes;
                    v565 = l_type_8.validateProps;
                end;
                if v564 or v565 then
                    l_checkPropTypes_0(v564, v565, v563, "prop", l_getComponentName_0(l_type_8));
                end;
            end;
            v563 = l_resolveDefaultProps_0(l_type_8.type, v563);
            return v211(v537, v538, l_type_8, v563, l_lanes_0, v539);
        elseif v538.tag == l_SimpleMemoComponent_0 then
            return v168(v537, v538, v538.type, v538.pendingProps, l_lanes_0, v539);
        elseif v538.tag == l_IncompleteClassComponent_0 then
            local l_type_9 = v538.type;
            local l_pendingProps_14 = v538.pendingProps;
            local v568 = v538.elementType == l_type_9 and l_pendingProps_14 or l_resolveDefaultProps_0(l_type_9, l_pendingProps_14);
            return mountIncompleteClassComponent(v537, v538, l_type_9, v568, v539);
        elseif v538.tag == l_OffscreenComponent_0 then
            return (v238(v537, v538, v539));
        elseif v538.tag == l_LegacyHiddenComponent_0 then
            return (v238(v537, v538, v539));
        else
            l_invariant_0(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in " .. "React. Please file an issue.", (tostring(v538.tag)));
            return nil;
        end;
    end;
end;
return v163;