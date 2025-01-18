local function _(v0) --[[ Line: 14 ]] --[[ Name: unimplemented ]]
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
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local l_shallowEqual_0 = require(l_Parent_0.Shared).shallowEqual;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_REACT_LAZY_TYPE_0 = l_ReactSymbols_0.REACT_LAZY_TYPE;
local _ = l_ReactSymbols_0.getIteratorFn;
local v64 = require(script.Parent["ReactStrictModeWarnings.new"]);
local v65 = require(script.Parent.ReactCurrentFiber);
local l_getCurrentFiberOwnerNameInDevOrNull_0 = v65.getCurrentFiberOwnerNameInDevOrNull;
local l_setIsRendering_0 = v65.setIsRendering;
local v68 = require(script.Parent["ReactFiberHotReloading.new"]);
local l_resolveFunctionForHotReloading_0 = v68.resolveFunctionForHotReloading;
local l_resolveForwardRefForHotReloading_0 = v68.resolveForwardRefForHotReloading;
local l_resolveClassForHotReloading_0 = v68.resolveClassForHotReloading;
local v72 = require(script.Parent["ReactChildFiber.new"]);
local l_mountChildFibers_0 = v72.mountChildFibers;
local l_reconcileChildFibers_0 = v72.reconcileChildFibers;
local l_cloneChildFibers_0 = v72.cloneChildFibers;
local v76 = require(script.Parent["ReactUpdateQueue.new"]);
local l_processUpdateQueue_0 = v76.processUpdateQueue;
local l_cloneUpdateQueue_0 = v76.cloneUpdateQueue;
local l_initializeUpdateQueue_0 = v76.initializeUpdateQueue;
local v80 = require(script.Parent.ReactTypeOfMode);
local l_ConcurrentMode_0 = v80.ConcurrentMode;
local l_NoMode_0 = v80.NoMode;
local l_ProfileMode_0 = v80.ProfileMode;
local l_StrictMode_0 = v80.StrictMode;
local l_BlockingMode_0 = v80.BlockingMode;
local v86 = require(script.Parent.ReactFiberHostConfig);
local l_shouldSetTextContent_0 = v86.shouldSetTextContent;
local l_isSuspenseInstancePending_0 = v86.isSuspenseInstancePending;
local l_isSuspenseInstanceFallback_0 = v86.isSuspenseInstanceFallback;
local l_registerSuspenseInstanceRetry_0 = v86.registerSuspenseInstanceRetry;
local l_supportsHydration_0 = v86.supportsHydration;
local v92 = require(script.Parent["ReactFiberHostContext.new"]);
local l_pushHostContext_0 = v92.pushHostContext;
local l_pushHostContainer_0 = v92.pushHostContainer;
local l_suspenseStackCursor_0 = v13.suspenseStackCursor;
local l_hasSuspenseContext_0 = v13.hasSuspenseContext;
local l_ForceSuspenseFallback_0 = v13.ForceSuspenseFallback;
local l_addSubtreeSuspenseContext_0 = v13.addSubtreeSuspenseContext;
local l_InvisibleParentSuspenseContext_0 = v13.InvisibleParentSuspenseContext;
local l_pushSuspenseContext_0 = v13.pushSuspenseContext;
local l_setDefaultShallowSuspenseContext_0 = v13.setDefaultShallowSuspenseContext;
local v102 = require(script.Parent["ReactFiberNewContext.new"]);
local l_propagateContextChange_0 = v102.propagateContextChange;
local l_readContext_0 = v102.readContext;
local l_calculateChangedBits_0 = v102.calculateChangedBits;
local l_prepareToReadContext_0 = v102.prepareToReadContext;
local l_pushProvider_0 = v102.pushProvider;
local v108 = {
    renderWithHooksRef = nil, 
    bailoutHooksRef = nil, 
    shouldSuspendRef = nil
};
local function _(v109) --[[ Line: 173 ]] --[[ Name: shouldSuspend ]]
    -- upvalues: v108 (copy)
    if not v108.shouldSuspendRef then
        v108.shouldSuspendRef = require(script.Parent.ReactFiberReconciler).shouldSuspend;
    end;
    return v108.shouldSuspendRef(v109);
end;
local function _() --[[ Line: 181 ]] --[[ Name: initReactFiberHooks ]]
    -- upvalues: v108 (copy)
    local v111 = require(script.Parent["ReactFiberHooks.new"]);
    v108.renderWithHooksRef = v111.renderWithHooks;
    v108.bailoutHooksRef = v111.bailoutHooks;
end;
local function v114(...) --[[ Line: 188 ]] --[[ Name: renderWithHooks ]]
    -- upvalues: v108 (copy)
    if not v108.renderWithHooksRef then
        local v113 = require(script.Parent["ReactFiberHooks.new"]);
        v108.renderWithHooksRef = v113.renderWithHooks;
        v108.bailoutHooksRef = v113.bailoutHooks;
    end;
    return v108.renderWithHooksRef(...);
end;
local function v116(...) --[[ Line: 196 ]] --[[ Name: bailoutHooks ]]
    -- upvalues: v108 (copy)
    if not v108.bailoutHooksRef then
        local v115 = require(script.Parent["ReactFiberHooks.new"]);
        v108.renderWithHooksRef = v115.renderWithHooks;
        v108.bailoutHooksRef = v115.bailoutHooks;
    end;
    return v108.bailoutHooksRef(...);
end;
local l_stopProfilerTimerIfRunning_0 = require(script.Parent["ReactProfilerTimer.new"]).stopProfilerTimerIfRunning;
local v118 = require(script.Parent["ReactFiberContext.new"]);
local l_getMaskedContext_0 = v118.getMaskedContext;
local l_getUnmaskedContext_0 = v118.getUnmaskedContext;
local l_hasContextChanged_0 = v118.hasContextChanged;
local l_pushContextProvider_0 = v118.pushContextProvider;
local l_isContextProvider_0 = v118.isContextProvider;
local l_pushTopLevelContextObject_0 = v118.pushTopLevelContextObject;
local l_invalidateContextProvider_0 = v118.invalidateContextProvider;
local v126 = require(script.Parent["ReactFiberHydrationContext.new"]);
local l_resetHydrationState_0 = v126.resetHydrationState;
local l_enterHydrationState_0 = v126.enterHydrationState;
local l_reenterHydrationStateFromDehydratedSuspenseInstance_0 = v126.reenterHydrationStateFromDehydratedSuspenseInstance;
local l_tryToClaimNextHydratableInstance_0 = v126.tryToClaimNextHydratableInstance;
local l_warnIfHydrating_0 = v126.warnIfHydrating;
local v132 = require(script.Parent["ReactFiberClassComponent.new"]);
local l_adoptClassInstance_0 = v132.adoptClassInstance;
local l_applyDerivedStateFromProps_0 = v132.applyDerivedStateFromProps;
local l_constructClassInstance_0 = v132.constructClassInstance;
local l_mountClassInstance_0 = v132.mountClassInstance;
local l_resumeMountClassInstance_0 = v132.resumeMountClassInstance;
local l_updateClassInstance_0 = v132.updateClassInstance;
local l_resolveDefaultProps_0 = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps;
local v140 = require(script.Parent["ReactFiber.new"]);
local l_resolveLazyComponentTag_0 = v140.resolveLazyComponentTag;
local l_createFiberFromFragment_0 = v140.createFiberFromFragment;
local l_createFiberFromOffscreen_0 = v140.createFiberFromOffscreen;
local l_createFiberFromTypeAndProps_0 = v140.createFiberFromTypeAndProps;
local l_isSimpleFunctionComponent_0 = v140.isSimpleFunctionComponent;
local l_createWorkInProgress_0 = v140.createWorkInProgress;
local v147 = require(script.Parent["ReactFiberWorkLoop.new"]);
local l_pushRenderLanes_0 = v147.pushRenderLanes;
local l_markSpawnedWork_0 = v147.markSpawnedWork;
local l_retryDehydratedSuspenseBoundary_0 = v147.retryDehydratedSuspenseBoundary;
local l_scheduleUpdateOnFiber_0 = v147.scheduleUpdateOnFiber;
local l_renderDidSuspendDelayIfPossible_0 = v147.renderDidSuspendDelayIfPossible;
local l_getWorkInProgressRoot_0 = v147.getWorkInProgressRoot;
local l_getExecutionContext_0 = v147.getExecutionContext;
local l_RetryAfterError_0 = v147.RetryAfterError;
local l_NoContext_0 = v147.NoContext;
local v157 = nil;
local l_setWorkInProgressVersion_0 = require(script.Parent["ReactMutableSource.new"]).setWorkInProgressVersion;
local l_markSkippedUpdateLanes_0 = require(script.Parent.ReactFiberWorkInProgress).markSkippedUpdateLanes;
local l_ConsolePatchingDev_0 = require(l_Parent_0.Shared).ConsolePatchingDev;
local l_disableLogs_0 = l_ConsolePatchingDev_0.disableLogs;
local l_reenableLogs_0 = l_ConsolePatchingDev_0.reenableLogs;
local l_ReactCurrentOwner_0 = l_ReactSharedInternals_0.ReactCurrentOwner;
local v164 = {};
local v165 = nil;
local v166 = nil;
local v167 = false;
local v168 = {
    didWarnAboutBadClass = {}, 
    didWarnAboutModulePatternComponent = {}, 
    didWarnAboutContextTypeOnFunctionComponent = {}, 
    didWarnAboutGetDerivedStateOnFunctionComponent = {}, 
    didWarnAboutFunctionRefs = {}, 
    didWarnAboutDefaultPropsOnFunctionComponent = {}
};
local v169 = nil;
if _G.__DEV__ then
    v168.didWarnAboutBadClass = {};
    v168.didWarnAboutModulePatternComponent = {};
    v168.didWarnAboutContextTypeOnFunctionComponent = {};
    v168.didWarnAboutGetDerivedStateOnFunctionComponent = {};
    v168.didWarnAboutFunctionRefs = {};
    v164.didWarnAboutReassigningProps = false;
    v168.didWarnAboutDefaultPropsOnFunctionComponent = {};
end;
local function _(v170, v171, v172, v173) --[[ Line: 290 ]] --[[ Name: reconcileChildren ]]
    -- upvalues: l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    if v170 == nil then
        v171.child = l_mountChildFibers_0(v171, nil, v172, v173);
        return;
    else
        v171.child = l_reconcileChildFibers_0(v171, v170.child, v172, v173);
        return;
    end;
end;
local function _(v175, v176, v177, v178) --[[ Line: 323 ]] --[[ Name: forceUnmountCurrentAndReconcile ]]
    -- upvalues: l_reconcileChildFibers_0 (copy)
    v176.child = l_reconcileChildFibers_0(v176, v175.child, nil, v178);
    v176.child = l_reconcileChildFibers_0(v176, nil, v177, v178);
end;
local function v193(v180, v181, v182, v183, v184) --[[ Line: 355 ]] --[[ Name: updateForwardRef ]]
    -- upvalues: l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), l_prepareToReadContext_0 (copy), v164 (copy), l_ReactCurrentOwner_0 (copy), l_setIsRendering_0 (copy), v114 (copy), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_describeError_0 (copy), l_reenableLogs_0 (copy), v167 (ref), v116 (copy), v165 (ref), l_PerformedWork_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    if (_G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__) and v181.type ~= v181.elementType then
        local l_propTypes_0 = v182.propTypes;
        local l_validateProps_0 = v182.validateProps;
        if l_propTypes_0 or l_validateProps_0 then
            l_checkPropTypes_0(l_propTypes_0, l_validateProps_0, v183, "prop", l_getComponentName_0(v182));
        end;
    end;
    local l_render_0 = v182.render;
    local l_ref_0 = v181.ref;
    local v189 = nil;
    l_prepareToReadContext_0(v181, v184, v164.markWorkInProgressReceivedUpdate);
    if _G.__DEV__ then
        l_ReactCurrentOwner_0.current = v181;
        l_setIsRendering_0(true);
        v189 = v114(v180, v181, l_render_0, v183, l_ref_0, v184);
        if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v181.mode, l_StrictMode_0) ~= 0 then
            l_disableLogs_0();
            local v190, v191 = xpcall(v114, l_describeError_0, v180, v181, l_render_0, v183, l_ref_0, v184);
            if v190 then
                v189 = v191;
            end;
            l_reenableLogs_0();
            if not v190 then
                error(v191);
            end;
        end;
        l_setIsRendering_0(false);
    else
        v189 = v114(v180, v181, l_render_0, v183, l_ref_0, v184);
    end;
    if v180 ~= nil and not v167 then
        v116(v180, v181, v184);
        return v165(v180, v181, v184);
    else
        v181.flags = bit32.bor(v181.flags, l_PerformedWork_0);
        local l_v189_0 = v189;
        if v180 == nil then
            v181.child = l_mountChildFibers_0(v181, nil, l_v189_0, v184);
        else
            v181.child = l_reconcileChildFibers_0(v181, v180.child, l_v189_0, v184);
        end;
        return v181.child;
    end;
end;
local function v212(v194, v195, v196, v197, v198, v199) --[[ Line: 450 ]] --[[ Name: updateMemoComponent ]]
    -- upvalues: l_isSimpleFunctionComponent_0 (copy), l_resolveFunctionForHotReloading_0 (copy), l_SimpleMemoComponent_0 (copy), v169 (ref), l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), l_createFiberFromTypeAndProps_0 (copy), v11 (copy), l_shallowEqual_0 (copy), v165 (ref), l_PerformedWork_0 (copy), l_createWorkInProgress_0 (copy)
    if v194 == nil then
        local l_type_0 = v196.type;
        if l_isSimpleFunctionComponent_0(l_type_0) and v196.compare == nil and v196.defaultProps == nil then
            local l_l_type_0_0 = l_type_0;
            if _G.__DEV__ then
                l_l_type_0_0 = l_resolveFunctionForHotReloading_0(l_type_0);
            end;
            v195.tag = l_SimpleMemoComponent_0;
            v195.type = l_l_type_0_0;
            if _G.__DEV__ then
                validateFunctionComponentInDev(v195, l_type_0);
            end;
            return v169(v194, v195, l_l_type_0_0, v197, v198, v199);
        else
            if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
                local v202 = nil;
                local v203 = nil;
                if typeof(l_type_0) == "table" then
                    v202 = l_type_0.propTypes;
                    v203 = l_type_0.validateProps;
                end;
                if v202 or v203 then
                    l_checkPropTypes_0(v202, v203, v197, "prop", l_getComponentName_0(l_type_0));
                end;
            end;
            local v204 = l_createFiberFromTypeAndProps_0(v196.type, nil, v197, v195, v195.mode, v199);
            v204.ref = v195.ref;
            v204.return_ = v195;
            v195.child = v204;
            return v204;
        end;
    else
        if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
            local l_type_1 = v196.type;
            local v206 = nil;
            local v207 = nil;
            if typeof(l_type_1) == "table" then
                v206 = l_type_1.propTypes;
                v207 = l_type_1.validateProps;
            end;
            if v206 or v207 then
                l_checkPropTypes_0(v206, v207, v197, "prop", l_getComponentName_0(l_type_1));
            end;
        end;
        local l_child_0 = v194.child;
        if not v11.includesSomeLane(v198, v199) then
            local l_memoizedProps_0 = l_child_0.memoizedProps;
            local l_compare_0 = v196.compare;
            if l_compare_0 == nil then
                l_compare_0 = l_shallowEqual_0;
            end;
            if l_compare_0(l_memoizedProps_0, v197) and v194.ref == v195.ref then
                return v165(v194, v195, v199);
            end;
        end;
        v195.flags = bit32.bor(v195.flags, l_PerformedWork_0);
        local v211 = l_createWorkInProgress_0(l_child_0, v197);
        v211.ref = v195.ref;
        v211.return_ = v195;
        v195.child = v211;
        return v211;
    end;
end;
v169 = function(v213, v214, v215, v216, v217, v218) --[[ Line: 571 ]] --[[ Name: updateSimpleMemoComponent ]]
    -- upvalues: l_REACT_LAZY_TYPE_0 (copy), l_describeError_0 (copy), l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), l_shallowEqual_0 (copy), v167 (ref), v11 (copy), v165 (ref), l_ForceUpdateForLegacySuspense_0 (copy), l_NoFlags_0 (copy), v166 (ref)
    if (_G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__) and v214.type ~= v214.elementType then
        local l_elementType_0 = v214.elementType;
        if l_elementType_0["$$typeof"] == l_REACT_LAZY_TYPE_0 then
            local l_l_elementType_0_0 = l_elementType_0;
            local l__payload_0 = l_l_elementType_0_0._payload;
            local l__init_0 = l_l_elementType_0_0._init;
            local v223, v224 = xpcall(l__init_0, l_describeError_0, l__payload_0);
            l_elementType_0 = if v223 then v224 else nil;
            local v225 = nil;
            local v226 = nil;
            if typeof(l_elementType_0) == "table" then
                v225 = l_elementType_0.propTypes;
                v226 = l_elementType_0.validateProps;
            end;
            if v225 or v226 then
                l_checkPropTypes_0(v225, v226, v216, "prop", l_getComponentName_0(l_elementType_0));
            end;
        end;
    end;
    if v213 ~= nil then
        local l_memoizedProps_1 = v213.memoizedProps;
        local v228 = true;
        if _G.__DEV__ then
            v228 = v214.type == v213.type;
        end;
        if l_shallowEqual_0(l_memoizedProps_1, v216) and v213.ref == v214.ref and v228 then
            v167 = false;
            if not v11.includesSomeLane(v218, v217) then
                v214.lanes = v213.lanes;
                return v165(v213, v214, v218);
            elseif bit32.band(v213.flags, l_ForceUpdateForLegacySuspense_0) ~= l_NoFlags_0 then
                v167 = true;
            end;
        end;
    end;
    return v166(v213, v214, v215, v216, v218);
end;
local function v239(v229, v230, v231) --[[ Line: 677 ]] --[[ Name: updateOffscreenComponent ]]
    -- upvalues: l_ConcurrentMode_0 (copy), l_NoMode_0 (copy), v11 (copy), l_pushRenderLanes_0 (copy), l_enableSchedulerTracing_0 (copy), l_markSpawnedWork_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    local l_pendingProps_0 = v230.pendingProps;
    local l_children_0 = l_pendingProps_0.children;
    local v234 = nil;
    if v229 ~= nil then
        v234 = v229.memoizedState;
    end;
    if l_pendingProps_0.mode == "hidden" or l_pendingProps_0.mode == "unstable-defer-without-hiding" then
        if bit32.band(v230.mode, l_ConcurrentMode_0) == l_NoMode_0 then
            v230.memoizedState = {
                baseLanes = v11.NoLanes
            };
            l_pushRenderLanes_0(v230, v231);
        elseif not v11.includesSomeLane(v231, v11.OffscreenLane) then
            local v235 = nil;
            if v234 ~= nil then
                local l_baseLanes_0 = v234.baseLanes;
                v235 = v11.mergeLanes(l_baseLanes_0, v231);
            else
                v235 = v231;
            end;
            if l_enableSchedulerTracing_0 then
                l_markSpawnedWork_0(v11.OffscreenLane);
            end;
            v230.childLanes = v11.laneToLanes(v11.OffscreenLane);
            v230.lanes = v230.childLanes;
            v230.memoizedState = {
                baseLanes = v235
            };
            l_pushRenderLanes_0(v230, v235);
            return nil;
        else
            v230.memoizedState = {
                baseLanes = v11.NoLanes
            };
            local l_v231_0 = v231;
            if v234 ~= nil then
                l_v231_0 = v234.baseLanes;
            end;
            l_pushRenderLanes_0(v230, l_v231_0);
        end;
    else
        local v238 = nil;
        if v234 ~= nil then
            v238 = v11.mergeLanes(v234.baseLanes, v231);
            v230.memoizedState = nil;
        else
            v238 = v231;
        end;
        l_pushRenderLanes_0(v230, v238);
    end;
    if v229 == nil then
        v230.child = l_mountChildFibers_0(v230, nil, l_children_0, v231);
    else
        v230.child = l_reconcileChildFibers_0(v230, v229.child, l_children_0, v231);
    end;
    return v230.child;
end;
updateFragment = function(v240, v241, v242) --[[ Line: 774 ]] --[[ Name: updateFragment ]]
    -- upvalues: l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    local l_pendingProps_1 = v241.pendingProps;
    if v240 == nil then
        v241.child = l_mountChildFibers_0(v241, nil, l_pendingProps_1, v242);
    else
        v241.child = l_reconcileChildFibers_0(v241, v240.child, l_pendingProps_1, v242);
    end;
    return v241.child;
end;
updateMode = function(v244, v245, v246) --[[ Line: 784 ]] --[[ Name: updateMode ]]
    -- upvalues: l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    local l_children_1 = v245.pendingProps.children;
    if v244 == nil then
        v245.child = l_mountChildFibers_0(v245, nil, l_children_1, v246);
    else
        v245.child = l_reconcileChildFibers_0(v245, v244.child, l_children_1, v246);
    end;
    return v245.child;
end;
updateProfiler = function(v248, v249, v250) --[[ Line: 794 ]] --[[ Name: updateProfiler ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    if l_enableProfilerTimer_0 then
        local l_stateNode_0 = v249.stateNode;
        l_stateNode_0.effectDuration = 0;
        l_stateNode_0.passiveEffectDuration = 0;
    end;
    local l_children_2 = v249.pendingProps.children;
    if v248 == nil then
        v249.child = l_mountChildFibers_0(v249, nil, l_children_2, v250);
    else
        v249.child = l_reconcileChildFibers_0(v249, v248.child, l_children_2, v250);
    end;
    return v249.child;
end;
local function _(v253, v254) --[[ Line: 812 ]] --[[ Name: markRef ]]
    -- upvalues: l_Ref_0 (copy)
    local l_ref_1 = v254.ref;
    if v253 == nil and l_ref_1 ~= nil or v253 ~= nil and v253.ref ~= l_ref_1 then
        v254.flags = bit32.bor(v254.flags, l_Ref_0);
    end;
end;
v166 = function(v257, v258, v259, v260, v261) --[[ Line: 823 ]] --[[ Name: updateFunctionComponent ]]
    -- upvalues: l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), l_disableLegacyContext_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_prepareToReadContext_0 (copy), v164 (copy), l_ReactCurrentOwner_0 (copy), l_setIsRendering_0 (copy), v114 (copy), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_describeError_0 (copy), l_reenableLogs_0 (copy), v167 (ref), v116 (copy), v165 (ref), l_PerformedWork_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    if (_G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__) and typeof(v259) ~= "function" and v258.type ~= v258.elementType then
        local v262 = nil;
        local v263 = nil;
        if typeof(v259) == "table" then
            v262 = v259.propTypes;
            v263 = v259.validateProps;
        end;
        if v262 or v263 then
            l_checkPropTypes_0(v262, v263, v260, "prop", l_getComponentName_0(v259));
        end;
    end;
    local v264 = nil;
    if not l_disableLegacyContext_0 then
        local v265 = l_getUnmaskedContext_0(v258, v259, true);
        v264 = l_getMaskedContext_0(v258, v265);
    end;
    local v266 = nil;
    l_prepareToReadContext_0(v258, v261, v164.markWorkInProgressReceivedUpdate);
    if _G.__DEV__ then
        l_ReactCurrentOwner_0.current = v258;
        l_setIsRendering_0(true);
        v266 = v114(v257, v258, v259, v260, v264, v261);
        if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v258.mode, l_StrictMode_0) ~= 0 then
            l_disableLogs_0();
            local v267, v268 = xpcall(v114, l_describeError_0, v257, v258, v259, v260, v264, v261);
            l_reenableLogs_0();
            if v267 then
                v266 = v268;
            else
                error(v268);
            end;
        end;
        l_setIsRendering_0(false);
    else
        v266 = v114(v257, v258, v259, v260, v264, v261);
    end;
    if v257 ~= nil and not v167 then
        v116(v257, v258, v261);
        return v165(v257, v258, v261);
    else
        v258.flags = bit32.bor(v258.flags, l_PerformedWork_0);
        local l_v266_0 = v266;
        if v257 == nil then
            v258.child = l_mountChildFibers_0(v258, nil, l_v266_0, v261);
        else
            v258.child = l_reconcileChildFibers_0(v258, v257.child, l_v266_0, v261);
        end;
        return v258.child;
    end;
end;
local function v282(v270, v271, v272, v273, v274) --[[ Line: 994 ]] --[[ Name: updateClassComponent ]]
    -- upvalues: l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), l_isContextProvider_0 (copy), l_pushContextProvider_0 (copy), l_prepareToReadContext_0 (copy), v164 (copy), l_Placement_0 (copy), l_constructClassInstance_0 (copy), l_mountClassInstance_0 (copy), l_resumeMountClassInstance_0 (copy), l_updateClassInstance_0 (copy), l_console_0 (copy)
    if (_G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__) and v271.type ~= v271.elementType then
        local l_propTypes_1 = v272.propTypes;
        local l_validateProps_1 = v272.validateProps;
        if l_propTypes_1 or l_validateProps_1 then
            l_checkPropTypes_0(l_propTypes_1, l_validateProps_1, v273, "prop", l_getComponentName_0(v272));
        end;
    end;
    local v277 = nil;
    if l_isContextProvider_0(v272) then
        v277 = true;
        l_pushContextProvider_0(v271);
    else
        v277 = false;
    end;
    l_prepareToReadContext_0(v271, v274, v164.markWorkInProgressReceivedUpdate);
    local l_stateNode_1 = v271.stateNode;
    local v279 = nil;
    if l_stateNode_1 == nil then
        if v270 ~= nil then
            v270.alternate = nil;
            v271.alternate = nil;
            v271.flags = bit32.bor(v271.flags, l_Placement_0);
        end;
        l_constructClassInstance_0(v271, v272, v273);
        l_mountClassInstance_0(v271, v272, v273, v274);
        v279 = true;
    else
        v279 = if v270 == nil then l_resumeMountClassInstance_0(v271, v272, v273, v274) else l_updateClassInstance_0(v270, v271, v272, v273, v274);
    end;
    local v280 = finishClassComponent(v270, v271, v272, v279, v277, v274);
    if _G.__DEV__ then
        local l_stateNode_2 = v271.stateNode;
        if v279 and l_stateNode_2.props ~= v273 then
            if not v164.didWarnAboutReassigningProps then
                l_console_0.error("It looks like %s is reassigning its own `this.props` while rendering. " .. "This is not supported and can lead to confusing bugs.", l_getComponentName_0(v271.type) or "a component");
            end;
            v164.didWarnAboutReassigningProps = true;
        end;
    end;
    return v280;
end;
finishClassComponent = function(v283, v284, v285, v286, v287, v288) --[[ Line: 1091 ]] --[[ Name: finishClassComponent ]]
    -- upvalues: l_Ref_0 (copy), l_DidCapture_0 (copy), l_NoFlags_0 (copy), l_invalidateContextProvider_0 (copy), v165 (ref), l_ReactCurrentOwner_0 (copy), l_enableProfilerTimer_0 (copy), l_stopProfilerTimerIfRunning_0 (copy), l_setIsRendering_0 (copy), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_describeError_0 (copy), l_reenableLogs_0 (copy), l_PerformedWork_0 (copy), l_reconcileChildFibers_0 (copy), l_mountChildFibers_0 (copy)
    local l_ref_2 = v284.ref;
    if v283 == nil and l_ref_2 ~= nil or v283 ~= nil and v283.ref ~= l_ref_2 then
        v284.flags = bit32.bor(v284.flags, l_Ref_0);
    end;
    l_ref_2 = bit32.band(v284.flags, l_DidCapture_0) ~= l_NoFlags_0;
    if not v286 and not l_ref_2 then
        if v287 then
            l_invalidateContextProvider_0(v284, v285, false);
        end;
        return v165(v283, v284, v288);
    else
        local l_stateNode_3 = v284.stateNode;
        l_ReactCurrentOwner_0.current = v284;
        local v291 = nil;
        if l_ref_2 and typeof(v285.getDerivedStateFromError) ~= "function" then
            v291 = nil;
            if l_enableProfilerTimer_0 then
                l_stopProfilerTimerIfRunning_0(v284);
            end;
        elseif _G.__DEV__ then
            l_setIsRendering_0(true);
            v291 = l_stateNode_3:render();
            if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v284.mode, l_StrictMode_0) ~= 0 then
                l_disableLogs_0();
                local v292, v293 = xpcall(l_stateNode_3.render, l_describeError_0, l_stateNode_3);
                l_reenableLogs_0();
                if not v292 then
                    error(v293);
                end;
            end;
            l_setIsRendering_0(false);
        else
            v291 = l_stateNode_3:render();
        end;
        v284.flags = bit32.bor(v284.flags, l_PerformedWork_0);
        if v283 ~= nil and l_ref_2 then
            local l_v291_0 = v291;
            v284.child = l_reconcileChildFibers_0(v284, v283.child, nil, v288);
            v284.child = l_reconcileChildFibers_0(v284, nil, l_v291_0, v288);
        else
            local l_v291_1 = v291;
            if v283 == nil then
                v284.child = l_mountChildFibers_0(v284, nil, l_v291_1, v288);
            else
                v284.child = l_reconcileChildFibers_0(v284, v283.child, l_v291_1, v288);
            end;
        end;
        v284.memoizedState = l_stateNode_3.state;
        if v287 then
            l_invalidateContextProvider_0(v284, v285, true);
        end;
        return v284.child;
    end;
end;
local function _(v296) --[[ Line: 1186 ]] --[[ Name: pushHostRootContext ]]
    -- upvalues: l_pushTopLevelContextObject_0 (copy), l_pushHostContainer_0 (copy)
    local l_stateNode_4 = v296.stateNode;
    if l_stateNode_4.pendingContext then
        l_pushTopLevelContextObject_0(v296, l_stateNode_4.pendingContext, l_stateNode_4.pendingContext ~= l_stateNode_4.context);
    elseif l_stateNode_4.context then
        l_pushTopLevelContextObject_0(v296, l_stateNode_4.context, false);
    end;
    l_pushHostContainer_0(v296, l_stateNode_4.containerInfo);
end;
local function v314(v299, v300, v301) --[[ Line: 1202 ]] --[[ Name: updateHostRoot ]]
    -- upvalues: l_pushTopLevelContextObject_0 (copy), l_pushHostContainer_0 (copy), l_invariant_0 (copy), l_cloneUpdateQueue_0 (copy), l_processUpdateQueue_0 (copy), l_resetHydrationState_0 (copy), v165 (ref), l_enterHydrationState_0 (copy), l_supportsHydration_0 (copy), l_setWorkInProgressVersion_0 (copy), l_mountChildFibers_0 (copy), l_Placement_0 (copy), l_Hydrating_0 (copy), l_reconcileChildFibers_0 (copy)
    local l_stateNode_5 = v300.stateNode;
    if l_stateNode_5.pendingContext then
        l_pushTopLevelContextObject_0(v300, l_stateNode_5.pendingContext, l_stateNode_5.pendingContext ~= l_stateNode_5.context);
    elseif l_stateNode_5.context then
        l_pushTopLevelContextObject_0(v300, l_stateNode_5.context, false);
    end;
    l_pushHostContainer_0(v300, l_stateNode_5.containerInfo);
    l_stateNode_5 = v300.updateQueue;
    local l_l_invariant_0_0 = l_invariant_0;
    local v304 = false;
    if v299 ~= nil then
        v304 = l_stateNode_5 ~= nil;
    end;
    l_l_invariant_0_0(v304, "If the root does not have an updateQueue, we should have already " .. "bailed out. This error is likely caused by a bug in React. Please " .. "file an issue.");
    l_l_invariant_0_0 = v300.pendingProps;
    v304 = v300.memoizedState;
    local v305 = nil;
    if v304 ~= nil then
        v305 = v304.element;
    end;
    l_cloneUpdateQueue_0(v299, v300);
    l_processUpdateQueue_0(v300, l_l_invariant_0_0, nil, v301);
    local l_element_0 = v300.memoizedState.element;
    if l_element_0 == v305 then
        l_resetHydrationState_0();
        return v165(v299, v300, v301);
    else
        local l_stateNode_6 = v300.stateNode;
        if l_stateNode_6.hydrate and l_enterHydrationState_0(v300) then
            if l_supportsHydration_0 then
                local l_mutableSourceEagerHydrationData_0 = l_stateNode_6.mutableSourceEagerHydrationData;
                if l_mutableSourceEagerHydrationData_0 ~= nil then
                    for v309 = 1, #l_mutableSourceEagerHydrationData_0, 2 do
                        local v310 = l_mutableSourceEagerHydrationData_0[v309];
                        local v311 = l_mutableSourceEagerHydrationData_0[v309 + 1];
                        l_setWorkInProgressVersion_0(v310, v311);
                    end;
                end;
            end;
            local v312 = l_mountChildFibers_0(v300, nil, l_element_0, v301);
            v300.child = v312;
            local l_v312_0 = v312;
            while l_v312_0 do
                l_v312_0.flags = bit32.bor(bit32.band(l_v312_0.flags, (bit32.bnot(l_Placement_0))), l_Hydrating_0);
                l_v312_0 = l_v312_0.sibling;
            end;
        else
            if v299 == nil then
                v300.child = l_mountChildFibers_0(v300, nil, l_element_0, v301);
            else
                v300.child = l_reconcileChildFibers_0(v300, v299.child, l_element_0, v301);
            end;
            l_resetHydrationState_0();
        end;
        return v300.child;
    end;
end;
local function v323(v315, v316, v317) --[[ Line: 1284 ]] --[[ Name: updateHostComponent ]]
    -- upvalues: l_pushHostContext_0 (copy), l_tryToClaimNextHydratableInstance_0 (copy), l_shouldSetTextContent_0 (copy), l_ContentReset_0 (copy), l_PerformedWork_0 (copy), l_Ref_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    l_pushHostContext_0(v316);
    if v315 == nil then
        l_tryToClaimNextHydratableInstance_0(v316);
    end;
    local l_type_2 = v316.type;
    local l_pendingProps_2 = v316.pendingProps;
    local v320 = nil;
    if v315 ~= nil then
        v320 = v315.memoizedProps;
    end;
    local l_children_3 = l_pendingProps_2.children;
    if l_shouldSetTextContent_0(l_type_2, l_pendingProps_2) then
        l_children_3 = nil;
    elseif v320 ~= nil and l_shouldSetTextContent_0(l_type_2, v320) then
        v316.flags = bit32.bor(v316.flags, l_ContentReset_0);
    end;
    v316.flags = bit32.bor(v316.flags, l_PerformedWork_0);
    local l_ref_3 = v316.ref;
    if v315 == nil and l_ref_3 ~= nil or v315 ~= nil and v315.ref ~= l_ref_3 then
        v316.flags = bit32.bor(v316.flags, l_Ref_0);
    end;
    l_ref_3 = l_children_3;
    if v315 == nil then
        v316.child = l_mountChildFibers_0(v316, nil, l_ref_3, v317);
    else
        v316.child = l_reconcileChildFibers_0(v316, v315.child, l_ref_3, v317);
    end;
    return v316.child;
end;
local function _(v324, v325) --[[ Line: 1325 ]] --[[ Name: updateHostText ]]
    -- upvalues: l_tryToClaimNextHydratableInstance_0 (copy)
    if v324 == nil then
        l_tryToClaimNextHydratableInstance_0(v325);
    end;
    return nil;
end;
local function v341(v327, v328, v329, v330, v331) --[[ Line: 1334 ]] --[[ Name: mountLazyComponent ]]
    -- upvalues: l_Placement_0 (copy), l_resolveLazyComponentTag_0 (copy), l_resolveDefaultProps_0 (copy), l_FunctionComponent_0 (copy), l_resolveFunctionForHotReloading_0 (copy), v166 (ref), l_ClassComponent_0 (copy), l_resolveClassForHotReloading_0 (copy), v282 (copy), l_ForwardRef_0 (copy), l_resolveForwardRefForHotReloading_0 (copy), v193 (copy), l_MemoComponent_0 (copy), l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), v212 (copy), l_REACT_LAZY_TYPE_0 (copy), l_inspect_0 (copy), l_invariant_0 (copy)
    if v327 ~= nil then
        v327.alternate = nil;
        v328.alternate = nil;
        v328.flags = bit32.bor(v328.flags, l_Placement_0);
    end;
    local l_pendingProps_3 = v328.pendingProps;
    local l__payload_1 = v329._payload;
    local v334 = v329._init(l__payload_1);
    v328.type = v334;
    v328.tag = l_resolveLazyComponentTag_0(v334);
    local l_tag_0 = v328.tag;
    local v336 = l_resolveDefaultProps_0(v334, l_pendingProps_3);
    local _ = nil;
    if l_tag_0 == l_FunctionComponent_0 then
        if _G.__DEV__ then
            validateFunctionComponentInDev(v328, v334);
            v334 = l_resolveFunctionForHotReloading_0(v334);
            v328.type = v334;
        end;
        return (v166(nil, v328, v334, v336, v331));
    elseif l_tag_0 == l_ClassComponent_0 then
        if _G.__DEV__ then
            v334 = l_resolveClassForHotReloading_0(v334);
            v328.type = v334;
        end;
        return (v282(nil, v328, v334, v336, v331));
    elseif l_tag_0 == l_ForwardRef_0 then
        if _G.__DEV__ then
            v334 = l_resolveForwardRefForHotReloading_0(v334);
            v328.type = v334;
        end;
        return (v193(nil, v328, v334, v336, v331));
    elseif l_tag_0 == l_MemoComponent_0 then
        if (_G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__) and v328.type ~= v328.elementType then
            local l_propTypes_2 = v334.propTypes;
            local l_validateProps_2 = v334.validateProps;
            if l_propTypes_2 or l_validateProps_2 then
                l_checkPropTypes_0(l_propTypes_2, l_validateProps_2, v336, "prop", l_getComponentName_0(v334));
            end;
        end;
        return (v212(nil, v328, v334, l_resolveDefaultProps_0(v334.type, v336), v330, v331));
    else
        local v340 = "";
        if _G.__DEV__ then
            if v334 ~= nil and typeof(v334) == "table" and v334["$$typeof"] == l_REACT_LAZY_TYPE_0 then
                v340 = " Did you wrap a component in React.lazy() more than once?";
            elseif typeof(v334) == "table" and v334["$$typeof"] == nil then
                v340 = "\n" .. l_inspect_0(v334);
            end;
        end;
        l_invariant_0(false, "Element type is invalid. Received a promise that resolves to: %s. " .. "Lazy element type must resolve to a class or function.%s", tostring(v334), v340);
        return nil;
    end;
end;
mountIncompleteClassComponent = function(v342, v343, v344, v345, v346) --[[ Line: 1478 ]] --[[ Name: mountIncompleteClassComponent ]]
    -- upvalues: l_Placement_0 (copy), l_ClassComponent_0 (copy), l_isContextProvider_0 (copy), l_pushContextProvider_0 (copy), l_prepareToReadContext_0 (copy), v164 (copy), l_constructClassInstance_0 (copy), l_mountClassInstance_0 (copy)
    if v342 ~= nil then
        v342.alternate = nil;
        v343.alternate = nil;
        v343.flags = bit32.bor(v343.flags, l_Placement_0);
    end;
    v343.tag = l_ClassComponent_0;
    local v347 = nil;
    if l_isContextProvider_0(v344) then
        v347 = true;
        l_pushContextProvider_0(v343);
    else
        v347 = false;
    end;
    l_prepareToReadContext_0(v343, v346, v164.markWorkInProgressReceivedUpdate);
    l_constructClassInstance_0(v343, v344, v345);
    l_mountClassInstance_0(v343, v344, v345, v346);
    return finishClassComponent(nil, v343, v344, true, v347, v346);
end;
local function v363(v348, v349, v350, v351) --[[ Line: 1526 ]] --[[ Name: mountIndeterminateComponent ]]
    -- upvalues: l_Placement_0 (copy), l_disableLegacyContext_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_prepareToReadContext_0 (copy), v164 (copy), l_getComponentName_0 (copy), v168 (copy), l_console_0 (copy), l_StrictMode_0 (copy), v64 (copy), l_setIsRendering_0 (copy), l_ReactCurrentOwner_0 (copy), v114 (copy), l_PerformedWork_0 (copy), l_disableModulePatternComponents_0 (copy), l_ClassComponent_0 (copy), l_isContextProvider_0 (copy), l_pushContextProvider_0 (copy), l_initializeUpdateQueue_0 (copy), l_applyDerivedStateFromProps_0 (copy), l_adoptClassInstance_0 (copy), l_mountClassInstance_0 (copy), l_FunctionComponent_0 (copy), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_disableLogs_0 (copy), l_describeError_0 (copy), l_reenableLogs_0 (copy), l_mountChildFibers_0 (copy)
    if v348 ~= nil then
        v348.alternate = nil;
        v349.alternate = nil;
        v349.flags = bit32.bor(v349.flags, l_Placement_0);
    end;
    local l_pendingProps_4 = v349.pendingProps;
    local v353 = nil;
    if not l_disableLegacyContext_0 then
        local v354 = l_getUnmaskedContext_0(v349, v350, false);
        v353 = l_getMaskedContext_0(v349, v354);
    end;
    l_prepareToReadContext_0(v349, v351, v164.markWorkInProgressReceivedUpdate);
    local v355 = nil;
    if _G.__DEV__ then
        if typeof(v350) == "table" and typeof(v350.render) == "function" then
            local v356 = l_getComponentName_0(v350) or "Unknown";
            if not v168.didWarnAboutBadClass[v356] then
                l_console_0.error("The <%s /> component appears to have a render method, but doesn't extend React.Component. " .. "This is likely to cause errors. Change %s to extend React.Component instead.", v356, v356);
                v168.didWarnAboutBadClass[v356] = true;
            end;
        end;
        if bit32.band(v349.mode, l_StrictMode_0) ~= 0 then
            v64.recordLegacyContextWarning(v349);
        end;
        l_setIsRendering_0(true);
        l_ReactCurrentOwner_0.current = v349;
        v355 = v114(nil, v349, v350, l_pendingProps_4, v353, v351);
        l_setIsRendering_0(false);
    else
        v355 = v114(nil, v349, v350, l_pendingProps_4, v353, v351);
    end;
    v349.flags = bit32.bor(v349.flags, l_PerformedWork_0);
    if _G.__DEV__ and typeof(v355) == "table" and v355 ~= nil and typeof(v355.render) == "function" and v355["$$typeof"] == nil then
        local v357 = l_getComponentName_0(v350) or "Unknown";
        if not v168.didWarnAboutModulePatternComponent[v357] then
            l_console_0.error("The <%s /> component appears to be a function component that returns a class instance. " .. "Change %s to a class that extends React.Component instead. ", v357, v357);
            v168.didWarnAboutModulePatternComponent[v357] = true;
        end;
    end;
    if not l_disableModulePatternComponents_0 and typeof(v355) == "table" and typeof(v355.render) == "function" and v355["$$typeof"] == nil then
        if _G.__DEV__ then
            local v358 = l_getComponentName_0(v350) or "Unknown";
            if not v168.didWarnAboutModulePatternComponent[v358] then
                l_console_0.error("The <%s /> component appears to be a function component that returns a class instance. " .. "Change %s to a class that extends React.Component instead. " .. v358, v358);
                v168.didWarnAboutModulePatternComponent[v358] = true;
            end;
        end;
        v349.tag = l_ClassComponent_0;
        v349.memoizedState = nil;
        v349.updateQueue = nil;
        local v359 = false;
        if l_isContextProvider_0(v350) then
            v359 = true;
            l_pushContextProvider_0(v349);
        else
            v359 = false;
        end;
        v349.memoizedState = v355.state;
        l_initializeUpdateQueue_0(v349);
        local v360 = nil;
        if typeof(v350) ~= "function" then
            v360 = v350.getDerivedStateFromProps;
        end;
        if typeof(v360) == "function" then
            l_applyDerivedStateFromProps_0(v349, v350, v360, l_pendingProps_4);
        end;
        l_adoptClassInstance_0(v349, v355);
        l_mountClassInstance_0(v349, v350, l_pendingProps_4, v351);
        return finishClassComponent(nil, v349, v350, true, v359, v351);
    else
        v349.tag = l_FunctionComponent_0;
        if _G.__DEV__ then
            if l_disableLegacyContext_0 and v350.contextTypes then
                l_console_0.error("%s uses the legacy contextTypes API which is no longer supported. " .. "Use React.createContext() with React.useContext() instead.", l_getComponentName_0(v350) or "Unknown");
            end;
            if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v349.mode, l_StrictMode_0) ~= 0 then
                l_disableLogs_0();
                local v361, v362 = xpcall(v114, l_describeError_0, nil, v349, v350, l_pendingProps_4, v353, v351);
                l_reenableLogs_0();
                if v361 then
                    v355 = v362;
                else
                    error(v362);
                end;
            end;
        end;
        v349.child = l_mountChildFibers_0(v349, nil, v355, v351);
        if _G.__DEV__ then
            validateFunctionComponentInDev(v349, v350);
        end;
        return v349.child;
    end;
end;
validateFunctionComponentInDev = function(v364, v365) --[[ Line: 1748 ]] --[[ Name: validateFunctionComponentInDev ]]
    -- upvalues: l_getCurrentFiberOwnerNameInDevOrNull_0 (copy), v168 (copy), l_console_0 (copy), l_warnAboutDefaultPropsOnFunctionComponents_0 (copy), l_getComponentName_0 (copy)
    if _G.__DEV__ then
        if v364.ref ~= nil then
            local v366 = "";
            local v367 = l_getCurrentFiberOwnerNameInDevOrNull_0();
            if v367 then
                v366 = v366 .. "\n\nCheck the render method of `" .. v367 .. "`.";
            end;
            local v368 = v367 or v364._debugID or "";
            local l__debugSource_0 = v364._debugSource;
            if l__debugSource_0 then
                v368 = l__debugSource_0.fileName .. ":" .. l__debugSource_0.lineNumber;
            end;
            if not v168.didWarnAboutFunctionRefs[v368] then
                v168.didWarnAboutFunctionRefs[v368] = true;
                l_console_0.error("Function components cannot be given refs. " .. "Attempts to access this ref will fail. " .. "Did you mean to use React.forwardRef()?%s", v366);
            end;
        end;
        if l_warnAboutDefaultPropsOnFunctionComponents_0 and typeof(v365) ~= "function" and v365.defaultProps ~= nil then
            local v370 = l_getComponentName_0(v365) or "Unknown";
            if not v168.didWarnAboutDefaultPropsOnFunctionComponent[v370] then
                l_console_0.error("%s: Support for defaultProps will be removed from function components " .. "in a future major release.", v370);
                v168.didWarnAboutDefaultPropsOnFunctionComponent[v370] = true;
            end;
        end;
        if typeof(v365) ~= "function" and typeof(v365.getDerivedStateFromProps) == "function" then
            local v371 = l_getComponentName_0(v365) or "Unknown";
            if not v168.didWarnAboutGetDerivedStateOnFunctionComponent[v371] then
                l_console_0.error("%s: Function components do not support getDerivedStateFromProps.", v371);
                v168.didWarnAboutGetDerivedStateOnFunctionComponent[v371] = true;
            end;
        end;
        if typeof(v365) ~= "function" and typeof(v365.contextType) == "table" and v365.contextType ~= nil then
            local v372 = l_getComponentName_0(v365) or "Unknown";
            if not v168.didWarnAboutContextTypeOnFunctionComponent[v372] then
                l_console_0.error("%s: Function components do not support contextType.", v372);
                v168.didWarnAboutContextTypeOnFunctionComponent[v372] = true;
            end;
        end;
    end;
end;
local v373 = {
    dehydrated = nil, 
    retryLane = v11.NoLane
};
local function _(v374) --[[ Line: 1837 ]] --[[ Name: mountSuspenseOffscreenState ]]
    return {
        baseLanes = v374
    };
end;
local function _(v376, v377) --[[ Line: 1843 ]] --[[ Name: updateSuspenseOffscreenState ]]
    -- upvalues: v11 (copy)
    return {
        baseLanes = v11.mergeLanes(v376.baseLanes, v377)
    };
end;
local _ = function(v379, v380, _, _) --[[ Line: 1853 ]] --[[ Name: shouldRemainOnFallback ]]
    -- upvalues: l_hasSuspenseContext_0 (copy), l_ForceSuspenseFallback_0 (copy)
    if v380 ~= nil and v380.memoizedState == nil then
        return false;
    else
        return l_hasSuspenseContext_0(v379, l_ForceSuspenseFallback_0);
    end;
end;
local function _(v384, v385) --[[ Line: 1880 ]] --[[ Name: getRemainingWorkInPrimaryTree ]]
    -- upvalues: v11 (copy)
    return v11.removeLanes(v384.childLanes, v385);
end;
local v387 = nil;
local v388 = nil;
local v389 = nil;
local v390 = nil;
local v391 = nil;
local function v426(v392, v393, v394) --[[ Line: 1892 ]] --[[ Name: updateSuspenseComponent ]]
    -- upvalues: v108 (copy), l_DidCapture_0 (copy), l_suspenseStackCursor_0 (copy), l_NoFlags_0 (copy), l_hasSuspenseContext_0 (copy), l_ForceSuspenseFallback_0 (copy), l_addSubtreeSuspenseContext_0 (copy), l_InvisibleParentSuspenseContext_0 (copy), l_setDefaultShallowSuspenseContext_0 (copy), l_pushSuspenseContext_0 (copy), l_tryToClaimNextHydratableInstance_0 (copy), l_enableSuspenseServerRenderer_0 (copy), v388 (ref), v373 (copy), v11 (copy), l_enableSchedulerTracing_0 (copy), l_markSpawnedWork_0 (copy), v389 (ref), v391 (ref), v390 (ref), v387 (ref)
    local v395 = false;
    local l_pendingProps_5 = v393.pendingProps;
    if _G.__DEV__ then
        if not v108.shouldSuspendRef then
            v108.shouldSuspendRef = require(script.Parent.ReactFiberReconciler).shouldSuspend;
        end;
        if v108.shouldSuspendRef(v393) then
            v393.flags = bit32.bor(v393.flags, l_DidCapture_0);
        end;
    end;
    local l_current_0 = l_suspenseStackCursor_0.current;
    local v398 = false;
    local v399 = bit32.band(v393.flags, l_DidCapture_0) ~= l_NoFlags_0;
    if not v399 then
        local l_l_current_0_0 = l_current_0;
        if v392 ~= nil and v392.memoizedState == nil or not l_hasSuspenseContext_0(l_l_current_0_0, l_ForceSuspenseFallback_0) then
            if (v392 == nil or v392.memoizedState ~= nil) and l_pendingProps_5.fallback ~= nil and l_pendingProps_5.unstable_avoidThisFallback ~= true then
                l_current_0 = l_addSubtreeSuspenseContext_0(l_current_0, l_InvisibleParentSuspenseContext_0);
                v395 = true;
            else
                v395 = true;
            end;
        end;
    end;
    if not v395 then
        if not v395 then
            v398 = true;
            v393.flags = bit32.band(v393.flags, (bit32.bnot(l_DidCapture_0)));
        end;
    end;
    v395 = false;
    l_current_0 = l_setDefaultShallowSuspenseContext_0(l_current_0);
    l_pushSuspenseContext_0(v393, l_current_0);
    if v392 == nil then
        if l_pendingProps_5.fallback ~= nil then
            l_tryToClaimNextHydratableInstance_0(v393);
            if l_enableSuspenseServerRenderer_0 then
                local l_memoizedState_0 = v393.memoizedState;
                if l_memoizedState_0 ~= nil then
                    local l_dehydrated_0 = l_memoizedState_0.dehydrated;
                    if l_dehydrated_0 ~= nil then
                        return v388(v393, l_dehydrated_0, v394);
                    end;
                end;
            end;
        end;
        local l_children_4 = l_pendingProps_5.children;
        local l_fallback_0 = l_pendingProps_5.fallback;
        if v398 then
            local v405 = mountSuspenseFallbackChildren(v393, l_children_4, l_fallback_0, v394);
            v393.child.memoizedState = {
                baseLanes = v394
            };
            v393.memoizedState = v373;
            return v405;
        elseif typeof(l_pendingProps_5.unstable_expectedLoadTime) == "number" then
            local v406 = mountSuspenseFallbackChildren(v393, l_children_4, l_fallback_0, v394);
            v393.child.memoizedState = {
                baseLanes = v394
            };
            v393.memoizedState = v373;
            v393.lanes = v11.SomeRetryLane;
            if l_enableSchedulerTracing_0 then
                l_markSpawnedWork_0(v11.SomeRetryLane);
            end;
            return v406;
        else
            return v389(v393, l_children_4, v394);
        end;
    else
        local l_memoizedState_1 = v392.memoizedState;
        if l_memoizedState_1 ~= nil then
            if l_enableSuspenseServerRenderer_0 then
                local l_dehydrated_1 = l_memoizedState_1.dehydrated;
                if l_dehydrated_1 ~= nil then
                    if not v399 then
                        return v391(v392, v393, l_dehydrated_1, l_memoizedState_1, v394);
                    elseif v393.memoizedState ~= nil then
                        v393.child = v392.child;
                        v393.flags = bit32.bor(v393.flags, l_DidCapture_0);
                        return nil;
                    else
                        local l_children_5 = l_pendingProps_5.children;
                        local l_fallback_1 = l_pendingProps_5.fallback;
                        local v411 = mountSuspenseFallbackAfterRetryWithoutHydrating(v392, v393, l_children_5, l_fallback_1, v394);
                        v393.child.memoizedState = {
                            baseLanes = v394
                        };
                        v393.memoizedState = v373;
                        return v411;
                    end;
                end;
            end;
            if v398 then
                local l_fallback_2 = l_pendingProps_5.fallback;
                local l_children_6 = l_pendingProps_5.children;
                local v414 = v390(v392, v393, l_children_6, l_fallback_2, v394);
                local l_child_1 = v393.child;
                local l_memoizedState_2 = v392.child.memoizedState;
                if l_memoizedState_2 == nil then
                    l_child_1.memoizedState = {
                        baseLanes = v394
                    };
                else
                    l_child_1.memoizedState = {
                        baseLanes = v11.mergeLanes(l_memoizedState_2.baseLanes, v394)
                    };
                end;
                l_child_1.childLanes = v11.removeLanes(v392.childLanes, v394);
                v393.memoizedState = v373;
                return v414;
            else
                local l_children_7 = l_pendingProps_5.children;
                local v418 = v387(v392, v393, l_children_7, v394);
                v393.memoizedState = nil;
                return v418;
            end;
        elseif v398 then
            local l_fallback_3 = l_pendingProps_5.fallback;
            local l_children_8 = l_pendingProps_5.children;
            local v421 = v390(v392, v393, l_children_8, l_fallback_3, v394);
            local l_child_2 = v393.child;
            local l_memoizedState_3 = v392.child.memoizedState;
            if l_memoizedState_3 == nil then
                l_child_2.memoizedState = {
                    baseLanes = v394
                };
            else
                l_child_2.memoizedState = {
                    baseLanes = v11.mergeLanes(l_memoizedState_3.baseLanes, v394)
                };
            end;
            l_child_2.childLanes = v11.removeLanes(v392.childLanes, v394);
            v393.memoizedState = v373;
            return v421;
        else
            local l_children_9 = l_pendingProps_5.children;
            local v425 = v387(v392, v393, l_children_9, v394);
            v393.memoizedState = nil;
            return v425;
        end;
    end;
end;
v389 = function(v427, v428, v429) --[[ Line: 2187 ]] --[[ Name: mountSuspensePrimaryChildren ]]
    -- upvalues: l_createFiberFromOffscreen_0 (copy)
    local l_mode_0 = v427.mode;
    local v431 = {
        mode = "visible", 
        children = v428
    };
    local v432 = l_createFiberFromOffscreen_0(v431, l_mode_0, v429, nil);
    v432.return_ = v427;
    v427.child = v432;
    return v432;
end;
mountSuspenseFallbackChildren = function(v433, v434, v435, v436) --[[ Line: 2208 ]] --[[ Name: mountSuspenseFallbackChildren ]]
    -- upvalues: l_BlockingMode_0 (copy), l_NoMode_0 (copy), v11 (copy), l_enableProfilerTimer_0 (copy), l_ProfileMode_0 (copy), l_createFiberFromFragment_0 (copy), l_createFiberFromOffscreen_0 (copy)
    local l_mode_1 = v433.mode;
    local l_child_3 = v433.child;
    local v439 = {
        mode = "hidden", 
        children = v434
    };
    local v440 = nil;
    local v441 = nil;
    if bit32.band(l_mode_1, l_BlockingMode_0) == l_NoMode_0 and l_child_3 ~= nil then
        v440 = l_child_3;
        v440.childLanes = v11.NoLanes;
        v440.pendingProps = v439;
        if l_enableProfilerTimer_0 and bit32.band(v433.mode, l_ProfileMode_0) ~= 0 then
            v440.actualDuration = 0;
            v440.actualStartTime = -1;
            v440.selfBaseDuration = 0;
            v440.treeBaseDuration = 0;
        end;
        v441 = l_createFiberFromFragment_0(v435, l_mode_1, v436, nil);
    else
        v440 = l_createFiberFromOffscreen_0(v439, l_mode_1, v11.NoLanes, nil);
        v441 = l_createFiberFromFragment_0(v435, l_mode_1, v436, nil);
    end;
    v440.return_ = v433;
    v441.return_ = v433;
    v440.sibling = v441;
    v433.child = v440;
    return v441;
end;
local function _(v442, v443) --[[ Line: 2270 ]] --[[ Name: createWorkInProgressOffscreenFiber ]]
    -- upvalues: l_createWorkInProgress_0 (copy)
    return l_createWorkInProgress_0(v442, v443);
end;
v387 = function(v445, v446, v447, v448) --[[ Line: 2279 ]] --[[ Name: updateSuspensePrimaryChildren ]]
    -- upvalues: l_createWorkInProgress_0 (copy), l_BlockingMode_0 (copy), l_NoMode_0 (copy), l_Deletion_0 (copy)
    local l_child_4 = v445.child;
    local l_sibling_0 = l_child_4.sibling;
    local v451 = {
        mode = "visible", 
        children = v447
    };
    local v452 = l_createWorkInProgress_0(l_child_4, v451);
    if bit32.band(v446.mode, l_BlockingMode_0) == l_NoMode_0 then
        v452.lanes = v448;
    end;
    v452.return_ = v446;
    v452.sibling = nil;
    if l_sibling_0 ~= nil then
        v451 = v446.deletions;
        if v451 == nil then
            v446.deletions = {
                l_sibling_0
            };
            v446.flags = bit32.bor(v446.flags, l_Deletion_0);
        else
            table.insert(v451, l_sibling_0);
        end;
    end;
    v446.child = v452;
    return v452;
end;
v390 = function(v453, v454, v455, v456, v457) --[[ Line: 2317 ]] --[[ Name: updateSuspenseFallbackChildren ]]
    -- upvalues: l_BlockingMode_0 (copy), l_NoMode_0 (copy), v11 (copy), l_enableProfilerTimer_0 (copy), l_ProfileMode_0 (copy), l_createWorkInProgress_0 (copy), l_StaticMask_0 (copy), l_createFiberFromFragment_0 (copy), l_Placement_0 (copy)
    local l_mode_2 = v454.mode;
    local l_child_5 = v453.child;
    local l_sibling_1 = l_child_5.sibling;
    local v461 = {
        mode = "hidden", 
        children = v455
    };
    local v462 = nil;
    if bit32.band(l_mode_2, l_BlockingMode_0) == l_NoMode_0 and v454.child ~= l_child_5 then
        v462 = v454.child;
        v462.childLanes = v11.NoLanes;
        v462.pendingProps = v461;
        if l_enableProfilerTimer_0 and bit32.band(v454.mode, l_ProfileMode_0) ~= 0 then
            v462.actualDuration = 0;
            v462.actualStartTime = -1;
            v462.selfBaseDuration = l_child_5.selfBaseDuration;
            v462.treeBaseDuration = l_child_5.treeBaseDuration;
        end;
        v454.deletions = nil;
    else
        v462 = l_createWorkInProgress_0(l_child_5, v461);
        v462.subtreeFlags = bit32.band(l_child_5.subtreeFlags, l_StaticMask_0);
    end;
    local v463 = nil;
    if l_sibling_1 ~= nil then
        v463 = l_createWorkInProgress_0(l_sibling_1, v456);
    else
        v463 = l_createFiberFromFragment_0(v456, l_mode_2, v457, nil);
        v463.flags = bit32.bor(v463.flags, l_Placement_0);
    end;
    v463.return_ = v454;
    v462.return_ = v454;
    v462.sibling = v463;
    v454.child = v462;
    return v463;
end;
local function _(v464, v465, v466) --[[ Line: 2406 ]] --[[ Name: retrySuspenseComponentWithoutHydrating ]]
    -- upvalues: l_reconcileChildFibers_0 (copy), v389 (ref), l_Placement_0 (copy)
    l_reconcileChildFibers_0(v465, v464.child, nil, v466);
    local l_children_10 = v465.pendingProps.children;
    local v468 = v389(v465, l_children_10, v466);
    v468.flags = bit32.bor(v468.flags, l_Placement_0);
    v465.memoizedState = nil;
    return v468;
end;
mountSuspenseFallbackAfterRetryWithoutHydrating = function(v470, v471, v472, v473, v474) --[[ Line: 2430 ]] --[[ Name: mountSuspenseFallbackAfterRetryWithoutHydrating ]]
    -- upvalues: l_createFiberFromOffscreen_0 (copy), v11 (copy), l_createFiberFromFragment_0 (copy), l_Placement_0 (copy), l_BlockingMode_0 (copy), l_NoMode_0 (copy), l_reconcileChildFibers_0 (copy)
    local l_mode_3 = v471.mode;
    local v476 = l_createFiberFromOffscreen_0(v472, l_mode_3, v11.NoLanes, nil);
    local v477 = l_createFiberFromFragment_0(v473, l_mode_3, v474, nil);
    v477.flags = bit32.bor(v477.flags, l_Placement_0);
    v476.return_ = v471;
    v477.return_ = v471;
    v476.sibling = v477;
    v471.child = v476;
    if bit32.band(v471.mode, l_BlockingMode_0) ~= l_NoMode_0 then
        l_reconcileChildFibers_0(v471, v470.child, nil, v474);
    end;
    return v477;
end;
v388 = function(v478, v479, _) --[[ Line: 2468 ]] --[[ Name: mountDehydratedSuspenseComponent ]]
    -- upvalues: l_BlockingMode_0 (copy), l_NoMode_0 (copy), l_console_0 (copy), v11 (copy), l_isSuspenseInstanceFallback_0 (copy), l_enableSchedulerTracing_0 (copy), l_markSpawnedWork_0 (copy)
    if bit32.band(v478.mode, l_BlockingMode_0) == l_NoMode_0 then
        if _G.__DEV__ then
            l_console_0.error("Cannot hydrate Suspense in legacy mode. Switch from" .. "ReactDOM.hydrate(element, container) to " .. "ReactDOM.createBlockingRoot(container, { hydrate: true })" .. ".render(element) or remove the Suspense components" .. "the server rendered components.");
        end;
        v478.lanes = v11.laneToLanes(v11.SyncLane);
    elseif l_isSuspenseInstanceFallback_0(v479) then
        if l_enableSchedulerTracing_0 then
            l_markSpawnedWork_0(v11.DefaultHydrationLane);
        end;
        v478.lanes = v11.laneToLanes(v11.DefaultHydrationLane);
    else
        v478.lanes = v11.laneToLanes(v11.OffscreenLane);
        if l_enableSchedulerTracing_0 then
            l_markSpawnedWork_0(v11.OffscreenLane);
        end;
    end;
    return nil;
end;
v391 = function(v481, v482, v483, v484, v485) --[[ Line: 2514 ]] --[[ Name: updateDehydratedSuspenseComponent ]]
    -- upvalues: l_warnIfHydrating_0 (copy), l_getExecutionContext_0 (copy), l_RetryAfterError_0 (copy), l_NoContext_0 (copy), l_reconcileChildFibers_0 (copy), v389 (ref), l_Placement_0 (copy), l_BlockingMode_0 (copy), l_NoMode_0 (copy), l_isSuspenseInstanceFallback_0 (copy), v11 (copy), v167 (ref), l_getWorkInProgressRoot_0 (copy), l_scheduleUpdateOnFiber_0 (copy), l_renderDidSuspendDelayIfPossible_0 (copy), l_isSuspenseInstancePending_0 (copy), l_DidCapture_0 (copy), l_retryDehydratedSuspenseBoundary_0 (copy), l_enableSchedulerTracing_0 (copy), v157 (ref), l_Parent_0 (copy), l_registerSuspenseInstanceRetry_0 (copy), l_reenterHydrationStateFromDehydratedSuspenseInstance_0 (copy), l_Hydrating_0 (copy)
    l_warnIfHydrating_0();
    if bit32.band(l_getExecutionContext_0(), l_RetryAfterError_0) ~= l_NoContext_0 then
        l_reconcileChildFibers_0(v482, v481.child, nil, v485);
        local l_children_11 = v482.pendingProps.children;
        local v487 = v389(v482, l_children_11, v485);
        v487.flags = bit32.bor(v487.flags, l_Placement_0);
        v482.memoizedState = nil;
        return v487;
    elseif bit32.band(v482.mode, l_BlockingMode_0) == l_NoMode_0 then
        l_reconcileChildFibers_0(v482, v481.child, nil, v485);
        local l_children_12 = v482.pendingProps.children;
        local v489 = v389(v482, l_children_12, v485);
        v489.flags = bit32.bor(v489.flags, l_Placement_0);
        v482.memoizedState = nil;
        return v489;
    elseif l_isSuspenseInstanceFallback_0(v483) then
        l_reconcileChildFibers_0(v482, v481.child, nil, v485);
        local l_children_13 = v482.pendingProps.children;
        local v491 = v389(v482, l_children_13, v485);
        v491.flags = bit32.bor(v491.flags, l_Placement_0);
        v482.memoizedState = nil;
        return v491;
    else
        local v492 = v11.includesSomeLane(v485, v481.childLanes);
        if v167 or v492 then
            local v493 = l_getWorkInProgressRoot_0();
            if v493 ~= nil then
                local v494 = v11.getBumpedLaneForHydration(v493, v485);
                if v494 ~= v11.NoLane and v494 ~= v484.retryLane then
                    v484.retryLane = v494;
                    local l_NoTimestamp_0 = v11.NoTimestamp;
                    l_scheduleUpdateOnFiber_0(v481, v494, l_NoTimestamp_0);
                end;
            end;
            l_renderDidSuspendDelayIfPossible_0();
            l_reconcileChildFibers_0(v482, v481.child, nil, v485);
            local l_children_14 = v482.pendingProps.children;
            local v497 = v389(v482, l_children_14, v485);
            v497.flags = bit32.bor(v497.flags, l_Placement_0);
            v482.memoizedState = nil;
            return v497;
        elseif l_isSuspenseInstancePending_0(v483) then
            v482.flags = bit32.bor(v482.flags, l_DidCapture_0);
            v482.child = v481.child;
            local function v498() --[[ Line: 2611 ]]
                -- upvalues: l_retryDehydratedSuspenseBoundary_0 (ref), v481 (copy)
                return l_retryDehydratedSuspenseBoundary_0(v481);
            end;
            if l_enableSchedulerTracing_0 then
                if v157 == nil then
                    v157 = require(l_Parent_0.Scheduler).tracing.unstable_wrap;
                end;
                v498 = v157(v498);
            end;
            l_registerSuspenseInstanceRetry_0(v483, v498);
            return nil;
        else
            l_reenterHydrationStateFromDehydratedSuspenseInstance_0(v482, v483);
            local l_children_15 = v482.pendingProps.children;
            local v500 = v389(v482, l_children_15, v485);
            v500.flags = bit32.bor(v500.flags, l_Hydrating_0);
            return v500;
        end;
    end;
end;
updatePortalComponent = function(v501, v502, v503) --[[ Line: 3027 ]] --[[ Name: updatePortalComponent ]]
    -- upvalues: l_pushHostContainer_0 (copy), l_reconcileChildFibers_0 (copy), l_mountChildFibers_0 (copy)
    l_pushHostContainer_0(v502, v502.stateNode.containerInfo);
    local l_pendingProps_6 = v502.pendingProps;
    if v501 == nil then
        v502.child = l_reconcileChildFibers_0(v502, nil, l_pendingProps_6, v503);
    elseif v501 == nil then
        v502.child = l_mountChildFibers_0(v502, nil, l_pendingProps_6, v503);
    else
        v502.child = l_reconcileChildFibers_0(v502, v501.child, l_pendingProps_6, v503);
    end;
    return v502.child;
end;
local v505 = false;
local function v518(v506, v507, v508) --[[ Line: 3054 ]] --[[ Name: updateContextProvider ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v505 (ref), l_console_0 (copy), l_checkPropTypes_0 (copy), l_pushProvider_0 (copy), l_calculateChangedBits_0 (copy), l_hasContextChanged_0 (copy), v165 (ref), l_propagateContextChange_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    local l__context_0 = v507.type._context;
    local l_pendingProps_7 = v507.pendingProps;
    local l_memoizedProps_2 = v507.memoizedProps;
    local l_value_0 = l_pendingProps_7.value;
    if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        if l_Array_0.indexOf(l_Object_0.keys(l_pendingProps_7), "value") < 1 and not v505 then
            v505 = true;
            l_console_0.error("The `value` prop is required for the `<Context.Provider>`. Did you misspell it or forget to pass it?");
        end;
        local l_propTypes_3 = v507.type.propTypes;
        local l_validateProps_3 = v507.type.validateProps;
        if l_propTypes_3 or l_validateProps_3 then
            l_checkPropTypes_0(l_propTypes_3, l_validateProps_3, l_pendingProps_7, "prop", "Context.Provider");
        end;
    end;
    l_pushProvider_0(v507, l_value_0);
    if l_memoizedProps_2 ~= nil then
        local l_value_1 = l_memoizedProps_2.value;
        local v516 = l_calculateChangedBits_0(l__context_0, l_value_0, l_value_1);
        if v516 == 0 then
            if l_memoizedProps_2.children == l_pendingProps_7.children and not l_hasContextChanged_0() then
                return v165(v506, v507, v508);
            end;
        else
            l_propagateContextChange_0(v507, l__context_0, v516, v508);
        end;
    end;
    local l_children_16 = l_pendingProps_7.children;
    if v506 == nil then
        v507.child = l_mountChildFibers_0(v507, nil, l_children_16, v508);
    else
        v507.child = l_reconcileChildFibers_0(v507, v506.child, l_children_16, v508);
    end;
    return v507.child;
end;
local v519 = {
    usingContextAsConsumer = false, 
    usingLegacyConsumer = false
};
updateContextConsumer = function(v520, v521, v522) --[[ Line: 3120 ]] --[[ Name: updateContextConsumer ]]
    -- upvalues: v519 (copy), l_console_0 (copy), l_prepareToReadContext_0 (copy), v164 (copy), l_readContext_0 (copy), l_ReactCurrentOwner_0 (copy), l_setIsRendering_0 (copy), l_PerformedWork_0 (copy), l_mountChildFibers_0 (copy), l_reconcileChildFibers_0 (copy)
    local l_type_3 = v521.type;
    if _G.__DEV__ then
        if l_type_3._context == nil then
            if l_type_3 ~= l_type_3.Consumer and not v519.usingContextAsConsumer then
                v519.usingContextAsConsumer = true;
                l_console_0.error("Rendering <Context> directly is not supported and will be removed in " .. "a future major release. Did you mean to render <Context.Consumer> instead?");
            end;
        else
            l_type_3 = l_type_3._context;
        end;
    end;
    local l_pendingProps_8 = v521.pendingProps;
    local v525 = nil;
    if l_pendingProps_8.render then
        if _G.__DEV__ and _G.__COMPAT_WARNINGS__ and not v519.usingLegacyConsumer then
            v519.usingLegacyConsumer = true;
            l_console_0.warn("Your Context.Consumer component is using legacy Roact syntax, which won't be supported in future versions of Roact. \n" .. "Please provide no props and supply the 'render' function as a child (the 3rd argument of createElement). For example: \n" .. "       createElement(ContextConsumer, {render = function(...) end})\n" .. "becomes:\n" .. "       createElement(ContextConsumer, nil, function(...) end)\n" .. "For more info, reference the React documentation here: \n" .. "https://reactjs.org/docs/context.html#contextconsumer");
        end;
        v525 = l_pendingProps_8.render;
    else
        v525 = l_pendingProps_8.children;
    end;
    if _G.__DEV__ and typeof(v525) ~= "function" then
        l_console_0.error("A context consumer was rendered with multiple children, or a child " .. "that isn't a function. A context consumer expects a single child " .. "that is a function. If you did pass a function, make sure there " .. "is no trailing or leading whitespace around it.");
    end;
    l_prepareToReadContext_0(v521, v522, v164.markWorkInProgressReceivedUpdate);
    local v526 = l_readContext_0(l_type_3, l_pendingProps_8.unstable_observedBits);
    local v527 = nil;
    if _G.__DEV__ then
        l_ReactCurrentOwner_0.current = v521;
        l_setIsRendering_0(true);
        v527 = v525(v526);
        l_setIsRendering_0(false);
    else
        v527 = v525(v526);
    end;
    v521.flags = bit32.bor(v521.flags, l_PerformedWork_0);
    local l_v527_0 = v527;
    if v520 == nil then
        v521.child = l_mountChildFibers_0(v521, nil, l_v527_0, v522);
    else
        v521.child = l_reconcileChildFibers_0(v521, v520.child, l_v527_0, v522);
    end;
    return v521.child;
end;
v164.markWorkInProgressReceivedUpdate = function() --[[ Line: 3224 ]]
    -- upvalues: v167 (ref)
    v167 = true;
end;
v165 = function(v529, v530, v531) --[[ Line: 3228 ]] --[[ Name: bailoutOnAlreadyFinishedWork ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_stopProfilerTimerIfRunning_0 (copy), l_markSkippedUpdateLanes_0 (copy), v11 (copy), l_cloneChildFibers_0 (copy)
    if v529 then
        v530.dependencies = v529.dependencies;
    end;
    if l_enableProfilerTimer_0 then
        l_stopProfilerTimerIfRunning_0(v530);
    end;
    l_markSkippedUpdateLanes_0(v530.lanes);
    if not v11.includesSomeLane(v531, v530.childLanes) then
        return nil;
    else
        l_cloneChildFibers_0(v529, v530);
        return v530.child;
    end;
end;
remountFiber = function(v532, v533, v534) --[[ Line: 3259 ]] --[[ Name: remountFiber ]]
    -- upvalues: l_Deletion_0 (copy), l_Placement_0 (copy)
    if _G.__DEV__ then
        local l_return__0 = v533.return_;
        if l_return__0 == nil then
            error("Cannot swap the root fiber.");
        end;
        assert(l_return__0 ~= nil, "returnFiber was nil in remountFiber");
        v532.alternate = nil;
        v533.alternate = nil;
        v534.index = v533.index;
        v534.sibling = v533.sibling;
        v534.return_ = v533.return_;
        v534.ref = v533.ref;
        if v533 == l_return__0.child then
            l_return__0.child = v534;
        else
            local l_child_6 = l_return__0.child;
            if l_child_6 == nil then
                error("Expected parent to have a child.");
            end;
            assert(l_child_6 ~= nil, "prevSibling was nil in remountFiber");
            while l_child_6.sibling ~= v533 do
                l_child_6 = l_child_6.sibling;
                if l_child_6 == nil then
                    error("Expected to find the previous sibling.");
                end;
            end;
            l_child_6.sibling = v534;
        end;
        local l_deletions_0 = l_return__0.deletions;
        if l_deletions_0 == nil then
            l_return__0.deletions = {
                v532
            };
            l_return__0.flags = bit32.bor(l_return__0.flags, l_Deletion_0);
        else
            table.insert(l_deletions_0, v532);
        end;
        v534.flags = bit32.bor(v534.flags, l_Placement_0);
        return v534;
    else
        error("Did not expect this call in production. " .. "This is a bug in React. Please file an issue.");
        return;
    end;
end;
v164.beginWork = function(v538, v539, v540) --[[ Line: 3328 ]] --[[ Name: beginWork ]]
    -- upvalues: l_createFiberFromTypeAndProps_0 (copy), l_hasContextChanged_0 (copy), v167 (ref), v11 (copy), l_HostRoot_0 (copy), l_pushTopLevelContextObject_0 (copy), l_pushHostContainer_0 (copy), l_resetHydrationState_0 (copy), l_HostComponent_0 (copy), l_pushHostContext_0 (copy), l_ClassComponent_0 (copy), l_isContextProvider_0 (copy), l_pushContextProvider_0 (copy), l_HostPortal_0 (copy), l_ContextProvider_0 (copy), l_pushProvider_0 (copy), l_Profiler_0 (copy), l_enableProfilerTimer_0 (copy), l_SuspenseComponent_0 (copy), l_enableSuspenseServerRenderer_0 (copy), l_pushSuspenseContext_0 (copy), l_setDefaultShallowSuspenseContext_0 (copy), l_suspenseStackCursor_0 (copy), l_DidCapture_0 (copy), v426 (copy), v165 (ref), l_SuspenseListComponent_0 (copy), l_OffscreenComponent_0 (copy), l_LegacyHiddenComponent_0 (copy), v239 (copy), l_ForceUpdateForLegacySuspense_0 (copy), l_NoFlags_0 (copy), v16 (copy), v363 (copy), l_LazyComponent_0 (copy), v341 (copy), l_FunctionComponent_0 (copy), l_resolveDefaultProps_0 (copy), v166 (ref), v282 (copy), v314 (copy), v323 (copy), l_HostText_0 (copy), l_tryToClaimNextHydratableInstance_0 (copy), l_ForwardRef_0 (copy), v193 (copy), l_Fragment_0 (copy), l_Mode_0 (copy), v518 (copy), l_ContextConsumer_0 (copy), l_MemoComponent_0 (copy), l_checkPropTypes_0 (copy), l_getComponentName_0 (copy), v212 (copy), l_SimpleMemoComponent_0 (copy), v169 (ref), l_IncompleteClassComponent_0 (copy), v239 (copy), l_invariant_0 (copy)
    local l_lanes_0 = v539.lanes;
    if _G.__DEV__ and v539._debugNeedsRemount and v538 ~= nil then
        return remountFiber(v538, v539, l_createFiberFromTypeAndProps_0(v539.type, v539.key, v539.pendingProps, v539._debugOwner or nil, v539.mode, v539.lanes));
    else
        if v538 ~= nil then
            if v538.memoizedProps ~= v539.pendingProps or l_hasContextChanged_0() or if _G.__DEV__ then v539.type ~= v538.type else false then
                v167 = true;
            elseif not v11.includesSomeLane(v540, l_lanes_0) then
                v167 = false;
                if v539.tag == l_HostRoot_0 then
                    local l_stateNode_7 = v539.stateNode;
                    if l_stateNode_7.pendingContext then
                        l_pushTopLevelContextObject_0(v539, l_stateNode_7.pendingContext, l_stateNode_7.pendingContext ~= l_stateNode_7.context);
                    elseif l_stateNode_7.context then
                        l_pushTopLevelContextObject_0(v539, l_stateNode_7.context, false);
                    end;
                    l_pushHostContainer_0(v539, l_stateNode_7.containerInfo);
                    l_resetHydrationState_0();
                elseif v539.tag == l_HostComponent_0 then
                    l_pushHostContext_0(v539);
                elseif v539.tag == l_ClassComponent_0 then
                    local l_type_4 = v539.type;
                    if l_isContextProvider_0(l_type_4) then
                        l_pushContextProvider_0(v539);
                    end;
                elseif v539.tag == l_HostPortal_0 then
                    l_pushHostContainer_0(v539, v539.stateNode.containerInfo);
                elseif v539.tag == l_ContextProvider_0 then
                    local l_value_2 = v539.memoizedProps.value;
                    l_pushProvider_0(v539, l_value_2);
                elseif v539.tag == l_Profiler_0 then
                    if l_enableProfilerTimer_0 then
                        local l_stateNode_8 = v539.stateNode;
                        l_stateNode_8.effectDuration = 0;
                        l_stateNode_8.passiveEffectDuration = 0;
                    end;
                elseif v539.tag == l_SuspenseComponent_0 then
                    local l_memoizedState_4 = v539.memoizedState;
                    if l_memoizedState_4 ~= nil then
                        if l_enableSuspenseServerRenderer_0 and l_memoizedState_4.dehydrated ~= nil then
                            l_pushSuspenseContext_0(v539, l_setDefaultShallowSuspenseContext_0(l_suspenseStackCursor_0.current));
                            v539.flags = bit32.bor(v539.flags, l_DidCapture_0);
                            return nil;
                        else
                            local l_childLanes_0 = v539.child.childLanes;
                            if v11.includesSomeLane(v540, l_childLanes_0) then
                                return v426(v538, v539, v540);
                            else
                                l_pushSuspenseContext_0(v539, l_setDefaultShallowSuspenseContext_0(l_suspenseStackCursor_0.current));
                                local v548 = v165(v538, v539, v540);
                                if v548 ~= nil then
                                    return v548.sibling;
                                else
                                    return nil;
                                end;
                            end;
                        end;
                    else
                        l_pushSuspenseContext_0(v539, l_setDefaultShallowSuspenseContext_0(l_suspenseStackCursor_0.current));
                    end;
                elseif v539.tag == l_SuspenseListComponent_0 then
                    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                    print("UNIMPLEMENTED ERROR: " .. tostring("beginWork: SuspenseListComponent"));
                    error("FIXME (roblox): " .. "beginWork: SuspenseListComponent" .. " is unimplemented", 2);
                elseif v539.tag == l_OffscreenComponent_0 or v539.tag == l_LegacyHiddenComponent_0 then
                    v539.lanes = v11.NoLanes;
                    return (v239(v538, v539, v540));
                end;
                return v165(v538, v539, v540);
            elseif bit32.band(v538.flags, l_ForceUpdateForLegacySuspense_0) ~= l_NoFlags_0 then
                v167 = true;
            else
                v167 = false;
            end;
        else
            v167 = false;
        end;
        v539.lanes = v11.NoLanes;
        if v539.tag == v16.IndeterminateComponent then
            return v363(v538, v539, v539.type, v540);
        elseif v539.tag == l_LazyComponent_0 then
            local l_elementType_1 = v539.elementType;
            return (v341(v538, v539, l_elementType_1, l_lanes_0, v540));
        elseif v539.tag == l_FunctionComponent_0 then
            local l_type_5 = v539.type;
            local l_pendingProps_9 = v539.pendingProps;
            local v552 = nil;
            v552 = if v539.elementType == l_type_5 then l_pendingProps_9 else l_resolveDefaultProps_0(l_type_5, l_pendingProps_9);
            return v166(v538, v539, l_type_5, v552, v540);
        elseif v539.tag == l_ClassComponent_0 then
            local l_type_6 = v539.type;
            local l_pendingProps_10 = v539.pendingProps;
            local v555 = v539.elementType == l_type_6 and l_pendingProps_10 or l_resolveDefaultProps_0(l_type_6, l_pendingProps_10);
            return (v282(v538, v539, l_type_6, v555, v540));
        elseif v539.tag == l_HostRoot_0 then
            return v314(v538, v539, v540);
        elseif v539.tag == l_HostComponent_0 then
            return (v323(v538, v539, v540));
        elseif v539.tag == l_HostText_0 then
            if v538 == nil then
                l_tryToClaimNextHydratableInstance_0(v539);
            end;
            return nil;
        elseif v539.tag == l_SuspenseComponent_0 then
            return v426(v538, v539, v540);
        elseif v539.tag == l_HostPortal_0 then
            return updatePortalComponent(v538, v539, v540);
        elseif v539.tag == l_ForwardRef_0 then
            local l_type_7 = v539.type;
            local l_pendingProps_11 = v539.pendingProps;
            local l_l_pendingProps_11_0 = l_pendingProps_11;
            if v539.elementType ~= l_type_7 then
                l_l_pendingProps_11_0 = l_resolveDefaultProps_0(l_type_7, l_pendingProps_11);
            end;
            return v193(v538, v539, l_type_7, l_l_pendingProps_11_0, v540);
        elseif v539.tag == l_Fragment_0 then
            return updateFragment(v538, v539, v540);
        elseif v539.tag == l_Mode_0 then
            return updateMode(v538, v539, v540);
        elseif v539.tag == l_Profiler_0 then
            return updateProfiler(v538, v539, v540);
        elseif v539.tag == l_ContextProvider_0 then
            return v518(v538, v539, v540);
        elseif v539.tag == l_ContextConsumer_0 then
            return updateContextConsumer(v538, v539, v540);
        elseif v539.tag == l_MemoComponent_0 then
            local l_type_8 = v539.type;
            local l_pendingProps_12 = v539.pendingProps;
            local v561 = l_resolveDefaultProps_0(l_type_8, l_pendingProps_12);
            if (_G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__) and v539.type ~= v539.elementType then
                local v562 = nil;
                local v563 = nil;
                if typeof(l_type_8) == "table" then
                    v562 = l_type_8.propTypes;
                    v563 = l_type_8.validateProps;
                end;
                if v562 or v563 then
                    l_checkPropTypes_0(v562, v563, v561, "prop", l_getComponentName_0(l_type_8));
                end;
            end;
            v561 = l_resolveDefaultProps_0(l_type_8.type, v561);
            return v212(v538, v539, l_type_8, v561, l_lanes_0, v540);
        elseif v539.tag == l_SimpleMemoComponent_0 then
            return v169(v538, v539, v539.type, v539.pendingProps, l_lanes_0, v540);
        elseif v539.tag == l_IncompleteClassComponent_0 then
            local l_type_9 = v539.type;
            local l_pendingProps_13 = v539.pendingProps;
            local v566 = v539.elementType == l_type_9 and l_pendingProps_13 or l_resolveDefaultProps_0(l_type_9, l_pendingProps_13);
            return mountIncompleteClassComponent(v538, v539, l_type_9, v566, v540);
        elseif v539.tag == l_OffscreenComponent_0 then
            return (v239(v538, v539, v540));
        elseif v539.tag == l_LegacyHiddenComponent_0 then
            return (v239(v538, v539, v540));
        else
            l_invariant_0(false, "Unknown unit of work tag (%s). This error is likely caused by a bug in " .. "React. Please file an issue.", (tostring(v539.tag)));
            return nil;
        end;
    end;
end;
return v164;