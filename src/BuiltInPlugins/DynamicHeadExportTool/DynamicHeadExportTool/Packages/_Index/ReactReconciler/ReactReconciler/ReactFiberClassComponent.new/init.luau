local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v4 = require(script.Parent.ReactFiberLane);
local v5 = require(script.Parent["ReactUpdateQueue.new"]);
local _ = require(l_Parent_0.Shared);
local v7 = require(l_Parent_0.React);
local v8 = require(script.Parent.ReactFiberFlags);
local l_Update_0 = v8.Update;
local l_Snapshot_0 = v8.Snapshot;
local l_MountLayoutDev_0 = v8.MountLayoutDev;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_debugRenderPhaseSideEffectsForStrictMode_0 = l_ReactFeatureFlags_0.debugRenderPhaseSideEffectsForStrictMode;
local l_disableLegacyContext_0 = l_ReactFeatureFlags_0.disableLegacyContext;
local l_enableDebugTracing_0 = l_ReactFeatureFlags_0.enableDebugTracing;
local l_enableSchedulingProfiler_0 = l_ReactFeatureFlags_0.enableSchedulingProfiler;
local l_warnAboutDeprecatedLifecycles_0 = l_ReactFeatureFlags_0.warnAboutDeprecatedLifecycles;
local l_enableDoubleInvokingEffects_0 = l_ReactFeatureFlags_0.enableDoubleInvokingEffects;
local v19 = require(script.Parent["ReactStrictModeWarnings.new"]);
local l_isMounted_0 = require(script.Parent.ReactFiberTreeReflection).isMounted;
local l_ReactInstanceMap_0 = require(l_Parent_0.Shared).ReactInstanceMap;
local l_get_0 = l_ReactInstanceMap_0.get;
local l_set_0 = l_ReactInstanceMap_0.set;
local l_shallowEqual_0 = require(l_Parent_0.Shared).shallowEqual;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_UninitializedState_0 = require(l_Parent_0.Shared).UninitializedState;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_REACT_CONTEXT_TYPE_0 = l_ReactSymbols_0.REACT_CONTEXT_TYPE;
local l_REACT_PROVIDER_TYPE_0 = l_ReactSymbols_0.REACT_PROVIDER_TYPE;
local l_resolveDefaultProps_0 = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps;
local v32 = require(script.Parent.ReactTypeOfMode);
local l_DebugTracingMode_0 = v32.DebugTracingMode;
local l_StrictMode_0 = v32.StrictMode;
local l_enqueueUpdate_0 = v5.enqueueUpdate;
local l_processUpdateQueue_0 = v5.processUpdateQueue;
local l_checkHasForceUpdateAfterProcessing_0 = v5.checkHasForceUpdateAfterProcessing;
local l_resetHasForceUpdateBeforeProcessing_0 = v5.resetHasForceUpdateBeforeProcessing;
local l_createUpdate_0 = v5.createUpdate;
local l_ReplaceState_0 = v5.ReplaceState;
local l_ForceUpdate_0 = v5.ForceUpdate;
local l_initializeUpdateQueue_0 = v5.initializeUpdateQueue;
local l_cloneUpdateQueue_0 = v5.cloneUpdateQueue;
local l_NoLanes_0 = v4.NoLanes;
local v45 = require(script.Parent["ReactFiberContext.new"]);
local l_cacheContext_0 = v45.cacheContext;
local l_getMaskedContext_0 = v45.getMaskedContext;
local l_getUnmaskedContext_0 = v45.getUnmaskedContext;
local l_hasContextChanged_0 = v45.hasContextChanged;
local l_emptyContextObject_0 = v45.emptyContextObject;
local l_readContext_0 = require(script.Parent["ReactFiberNewContext.new"]).readContext;
local v52 = require(script.Parent.DebugTracing);
local l_logForceUpdateScheduled_0 = v52.logForceUpdateScheduled;
local l_logStateUpdateScheduled_0 = v52.logStateUpdateScheduled;
local l_ConsolePatchingDev_0 = require(l_Parent_0.Shared).ConsolePatchingDev;
local l_disableLogs_0 = l_ConsolePatchingDev_0.disableLogs;
local l_reenableLogs_0 = l_ConsolePatchingDev_0.reenableLogs;
local v58 = require(script.Parent.SchedulingProfiler);
local l_markForceUpdateScheduled_0 = v58.markForceUpdateScheduled;
local l_markStateUpdateScheduled_0 = v58.markStateUpdateScheduled;
local v61 = {};
local l___refs_0 = v7.Component:extend("").__refs;
local v63 = nil;
local v64 = nil;
local v65 = nil;
local v66 = nil;
local v67 = nil;
local v68 = nil;
local v69 = nil;
local v70 = nil;
local v71 = nil;
local v72 = nil;
if _G.__DEV__ then
    v63 = {};
    v64 = {};
    v65 = {};
    v66 = {};
    v70 = {};
    v67 = {};
    v71 = {};
    v72 = {};
    local v73 = {};
    local l_v73_0 = v73 --[[ copy: 75 -> 84 ]];
    v69 = function(v75, v76) --[[ Line: 133 ]] --[[ Name: warnOnInvalidCallback ]]
        -- upvalues: l_v73_0 (copy), l_console_0 (copy)
        if v75 == nil or typeof(v75) == "function" then
            return;
        else
            local v77 = v76 .. "_" .. tostring(v75);
            if not l_v73_0[v77] then
                l_v73_0[v77] = true;
                l_console_0.error("%s(...): Expected the last optional `callback` argument to be a " .. "function. Instead received: %s.", v76, (tostring(v75)));
            end;
            return;
        end;
    end;
    v68 = function(_, _) --[[ Line: 149 ]] --[[ Name: warnOnUndefinedDerivedState ]]

    end;
end;
local function v89(v80, v81, v82, v83) --[[ Line: 192 ]] --[[ Name: applyDerivedStateFromProps ]]
    -- upvalues: l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_describeError_0 (copy), l_reenableLogs_0 (copy), v68 (ref), l_Object_0 (copy), l_NoLanes_0 (copy)
    local l_memoizedState_0 = v80.memoizedState;
    if _G.__DEV__ and l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v80.mode, l_StrictMode_0) ~= 0 then
        l_disableLogs_0();
        local v85, v86 = xpcall(v82, l_describeError_0, v83, l_memoizedState_0);
        l_reenableLogs_0();
        if not v85 then
            error(v86);
        end;
    end;
    local v87 = v82(v83, l_memoizedState_0);
    if _G.__DEV__ then
        v68(v81, v87);
    end;
    local v88 = v87 == nil and l_memoizedState_0 or l_Object_0.assign({}, l_memoizedState_0, v87);
    v80.memoizedState = v88;
    if v80.lanes == l_NoLanes_0 then
        v80.updateQueue.baseState = v88;
    end;
end;
local v90 = nil;
local function v118() --[[ Line: 239 ]] --[[ Name: initializeClassComponentUpdater ]]
    -- upvalues: v90 (ref), l_isMounted_0 (copy), l_get_0 (copy), l_createUpdate_0 (copy), v69 (ref), l_enqueueUpdate_0 (copy), l_enableDebugTracing_0 (copy), l_DebugTracingMode_0 (copy), l_getComponentName_0 (copy), l_logStateUpdateScheduled_0 (copy), l_enableSchedulingProfiler_0 (copy), l_markStateUpdateScheduled_0 (copy), l_ReplaceState_0 (copy), l_ForceUpdate_0 (copy), l_logForceUpdateScheduled_0 (copy), l_markForceUpdateScheduled_0 (copy)
    local v91 = require(script.Parent["ReactFiberWorkLoop.new"]);
    local l_requestEventTime_0 = v91.requestEventTime;
    local l_requestUpdateLane_0 = v91.requestUpdateLane;
    local l_scheduleUpdateOnFiber_0 = v91.scheduleUpdateOnFiber;
    v90 = {
        isMounted = l_isMounted_0, 
        enqueueSetState = function(v95, v96, v97) --[[ Line: 247 ]] --[[ Name: enqueueSetState ]]
            -- upvalues: l_get_0 (ref), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), l_createUpdate_0 (ref), v69 (ref), l_enqueueUpdate_0 (ref), l_scheduleUpdateOnFiber_0 (copy), l_enableDebugTracing_0 (ref), l_DebugTracingMode_0 (ref), l_getComponentName_0 (ref), l_logStateUpdateScheduled_0 (ref), l_enableSchedulingProfiler_0 (ref), l_markStateUpdateScheduled_0 (ref)
            local v98 = l_get_0(v95);
            local v99 = l_requestEventTime_0();
            local v100 = l_requestUpdateLane_0(v98);
            local v101 = l_createUpdate_0(v99, v100);
            v101.payload = v96;
            if v97 ~= nil then
                if _G.__DEV__ then
                    v69(v97, "setState");
                end;
                v101.callback = v97;
            end;
            l_enqueueUpdate_0(v98, v101);
            l_scheduleUpdateOnFiber_0(v98, v100, v99);
            if _G.__DEV__ and l_enableDebugTracing_0 and bit32.band(v98.mode, l_DebugTracingMode_0) ~= 0 then
                local v102 = l_getComponentName_0(v98.type) or "Unknown";
                l_logStateUpdateScheduled_0(v102, v100, v96);
            end;
            if l_enableSchedulingProfiler_0 then
                l_markStateUpdateScheduled_0(v98, v100);
            end;
        end, 
        enqueueReplaceState = function(v103, v104, v105) --[[ Line: 277 ]] --[[ Name: enqueueReplaceState ]]
            -- upvalues: l_get_0 (ref), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), l_createUpdate_0 (ref), l_ReplaceState_0 (ref), v69 (ref), l_enqueueUpdate_0 (ref), l_scheduleUpdateOnFiber_0 (copy), l_enableDebugTracing_0 (ref), l_DebugTracingMode_0 (ref), l_getComponentName_0 (ref), l_logStateUpdateScheduled_0 (ref), l_enableSchedulingProfiler_0 (ref), l_markStateUpdateScheduled_0 (ref)
            local v106 = l_get_0(v103);
            local v107 = l_requestEventTime_0();
            local v108 = l_requestUpdateLane_0(v106);
            local v109 = l_createUpdate_0(v107, v108);
            v109.tag = l_ReplaceState_0;
            v109.payload = v104;
            if v105 ~= nil then
                if _G.__DEV__ then
                    v69(v105, "replaceState");
                end;
                v109.callback = v105;
            end;
            l_enqueueUpdate_0(v106, v109);
            l_scheduleUpdateOnFiber_0(v106, v108, v107);
            if _G.__DEV__ and l_enableDebugTracing_0 and bit32.band(v106.mode, l_DebugTracingMode_0) ~= 0 then
                local v110 = l_getComponentName_0(v106.type) or "Unknown";
                l_logStateUpdateScheduled_0(v110, v108, v104);
            end;
            if l_enableSchedulingProfiler_0 then
                l_markStateUpdateScheduled_0(v106, v108);
            end;
        end, 
        enqueueForceUpdate = function(v111, v112) --[[ Line: 309 ]] --[[ Name: enqueueForceUpdate ]]
            -- upvalues: l_get_0 (ref), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), l_createUpdate_0 (ref), l_ForceUpdate_0 (ref), v69 (ref), l_enqueueUpdate_0 (ref), l_scheduleUpdateOnFiber_0 (copy), l_enableDebugTracing_0 (ref), l_DebugTracingMode_0 (ref), l_getComponentName_0 (ref), l_logForceUpdateScheduled_0 (ref), l_enableSchedulingProfiler_0 (ref), l_markForceUpdateScheduled_0 (ref)
            local v113 = l_get_0(v111);
            local v114 = l_requestEventTime_0();
            local v115 = l_requestUpdateLane_0(v113);
            local v116 = l_createUpdate_0(v114, v115);
            v116.tag = l_ForceUpdate_0;
            if v112 ~= nil then
                if _G.__DEV__ then
                    v69(v112, "forceUpdate");
                end;
                v116.callback = v112;
            end;
            l_enqueueUpdate_0(v113, v116);
            l_scheduleUpdateOnFiber_0(v113, v115, v114);
            if _G.__DEV__ and l_enableDebugTracing_0 and bit32.band(v113.mode, l_DebugTracingMode_0) ~= 0 then
                local v117 = l_getComponentName_0(v113.type) or "Unknown";
                l_logForceUpdateScheduled_0(v117, v115);
            end;
            if l_enableSchedulingProfiler_0 then
                l_markForceUpdateScheduled_0(v113, v115);
            end;
        end
    };
end;
local function _() --[[ Line: 343 ]] --[[ Name: getClassComponentUpdater ]]
    -- upvalues: v90 (ref), v118 (copy)
    if v90 == nil then
        v118();
    end;
    return v90;
end;
checkShouldComponentUpdate = function(v120, v121, v122, v123, v124, v125, v126) --[[ Line: 350 ]] --[[ Name: checkShouldComponentUpdate ]]
    -- upvalues: l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_describeError_0 (copy), l_reenableLogs_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_shallowEqual_0 (copy)
    local l_stateNode_0 = v120.stateNode;
    if typeof(l_stateNode_0.shouldComponentUpdate) == "function" then
        if _G.__DEV__ and l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v120.mode, l_StrictMode_0) ~= 0 then
            l_disableLogs_0();
            local v128, v129 = xpcall(l_stateNode_0.shouldComponentUpdate, l_describeError_0, l_stateNode_0, v123, v125, v126);
            l_reenableLogs_0();
            if not v128 then
                error(v129);
            end;
        end;
        local v130 = l_stateNode_0:shouldComponentUpdate(v123, v125, v126);
        if _G.__DEV__ and v130 == nil then
            l_console_0.error("%s.shouldComponentUpdate(): Returned nil instead of a " .. "boolean value. Make sure to return true or false.", l_getComponentName_0(v121) or "Component");
        end;
        return v130;
    elseif typeof(v121) == "table" and v121.isPureReactComponent then
        return not l_shallowEqual_0(v122, v123) or not l_shallowEqual_0(v124, v125);
    else
        return true;
    end;
end;
local function v138(v131, v132, v133) --[[ Line: 408 ]] --[[ Name: checkClassInstance ]]
    -- upvalues: l_getComponentName_0 (copy), l_console_0 (copy), l_disableLegacyContext_0 (copy), v71 (ref), v65 (ref)
    local l_stateNode_1 = v131.stateNode;
    if _G.__DEV__ then
        local v135 = l_getComponentName_0(v132) or "Component";
        if not l_stateNode_1.render then
            if typeof(v132.render) == "function" then
                l_console_0.error("%s(...): No `render` method found on the returned component " .. "instance: did you accidentally return an object from the constructor?", v135);
            else
                l_console_0.error("%s(...): No `render` method found on the returned component " .. "instance: you may have forgotten to define `render`.", v135);
            end;
        end;
        if l_stateNode_1.getInitialState and not l_stateNode_1.getInitialState.isReactClassApproved and not l_stateNode_1.state then
            l_console_0.error("getInitialState was defined on %s, a plain JavaScript class. " .. "This is only supported for classes created using React.createClass. " .. "Did you mean to define a state property instead?", v135);
        end;
        if l_stateNode_1.getDefaultProps and not l_stateNode_1.getDefaultProps.isReactClassApproved then
            l_console_0.error("getDefaultProps was defined on %s, a plain JavaScript class. " .. "This is only supported for classes created using React.createClass. " .. "Use a static property to define defaultProps instead.", v135);
        end;
        if l_stateNode_1.propTypes and not v132.propTypes then
            l_console_0.error("propTypes was defined as an instance property on %s. Use a static " .. "property to define propTypes instead.", v135);
        end;
        if l_stateNode_1.contextType and not v132.contextType then
            l_console_0.error("contextType was defined as an instance property on %s. Use a static " .. "property to define contextType instead.", v135);
        end;
        if l_disableLegacyContext_0 then
            if v132.childContextTypes then
                l_console_0.error("%s uses the legacy childContextTypes API which is no longer supported. " .. "Use React.createContext() instead.", v135);
            end;
            if v132.contextTypes then
                l_console_0.error("%s uses the legacy contextTypes API which is no longer supported. " .. "Use React.createContext() with static contextType instead.", v135);
            end;
        else
            if l_stateNode_1.contextTypes and not v132.contextTypes then
                l_console_0.error("contextTypes was defined as an instance property on %s. Use a static " .. "property to define contextTypes instead.", v135);
            end;
            if typeof(v132) == "table" and v132.contextType and v132.contextTypes and not v71[v132] then
                v71[v132] = true;
                l_console_0.error("%s declares both contextTypes and contextType static properties. " .. "The legacy contextTypes property will be ignored.", v135);
            end;
        end;
        if typeof(l_stateNode_1.componentShouldUpdate) == "function" then
            l_console_0.error("%s has a method called " .. "componentShouldUpdate(). Did you mean shouldComponentUpdate()? " .. "The name is phrased as a question because the function is " .. "expected to return a value.", v135);
        end;
        if typeof(v132) == "table" and v132.isPureReactComponent and l_stateNode_1.shouldComponentUpdate ~= nil then
            l_console_0.error("%s has a method called shouldComponentUpdate(). " .. "shouldComponentUpdate should not be used when extending React.PureComponent. " .. "Please extend React.Component if shouldComponentUpdate is used.", l_getComponentName_0(v132) or "A pure component");
        end;
        if typeof(l_stateNode_1.componentDidUnmount) == "function" then
            l_console_0.error("%s has a method called " .. "componentDidUnmount(). But there is no such lifecycle method. " .. "Did you mean componentWillUnmount()?", v135);
        end;
        if typeof(l_stateNode_1.componentDidReceiveProps) == "function" then
            l_console_0.error("%s has a method called " .. "componentDidReceiveProps(). But there is no such lifecycle method. " .. "If you meant to update the state in response to changing props, " .. "use componentWillReceiveProps(). If you meant to fetch data or " .. "run side-effects or mutations after React has updated the UI, use componentDidUpdate().", v135);
        end;
        if typeof(l_stateNode_1.componentWillRecieveProps) == "function" then
            l_console_0.error("%s has a method called " .. "componentWillRecieveProps(). Did you mean componentWillReceiveProps()?", v135);
        end;
        if typeof(l_stateNode_1.UNSAFE_componentWillRecieveProps) == "function" then
            l_console_0.error("%s has a method called " .. "UNSAFE_componentWillRecieveProps(). Did you mean UNSAFE_componentWillReceiveProps()?", v135);
        end;
        local v136 = l_stateNode_1.props ~= v133;
        if l_stateNode_1.props ~= nil and v136 then
            l_console_0.error("%s(...): When calling super() in `%s`, make sure to pass " .. "up the same props that your component's constructor was passed.", v135, v135);
        end;
        if rawget(l_stateNode_1, "defaultProps") then
            l_console_0.error("Setting defaultProps as an instance property on %s is not supported and will be ignored." .. " Instead, define defaultProps as a static property on %s.", v135, v135);
        end;
        if typeof(l_stateNode_1.getSnapshotBeforeUpdate) == "function" and typeof(l_stateNode_1.componentDidUpdate) ~= "function" and not v65[v132] then
            v65[v132] = true;
            l_console_0.error("%s: getSnapshotBeforeUpdate() should be used with componentDidUpdate(). " .. "This component defines getSnapshotBeforeUpdate() only.", l_getComponentName_0(v132));
        end;
        local l_state_0 = l_stateNode_1.state;
        if l_state_0 ~= nil and typeof(l_state_0) ~= "table" then
            l_console_0.error("%s.state: must be set to an object or nil", v135);
        end;
        if typeof(v132) == "table" and typeof(l_stateNode_1.getChildContext) == "function" and typeof(v132.childContextTypes) ~= "table" then
            l_console_0.error("%s.getChildContext(): childContextTypes must be defined in order to " .. "use getChildContext().", v135);
        end;
    end;
end;
local function v141(v139, v140) --[[ Line: 642 ]] --[[ Name: adoptClassInstance ]]
    -- upvalues: v90 (ref), v118 (copy), l_set_0 (copy), v61 (copy)
    if v90 == nil then
        v118();
    end;
    v140.__updater = v90;
    v139.stateNode = v140;
    l_set_0(v140, v139);
    if _G.__DEV__ then
        v140._reactInternalInstance = v61;
    end;
end;
local function v166(v142, v143, v144) --[[ Line: 653 ]] --[[ Name: constructClassInstance ]]
    -- upvalues: l_emptyContextObject_0 (copy), l_REACT_CONTEXT_TYPE_0 (copy), v72 (ref), l_REACT_PROVIDER_TYPE_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_readContext_0 (copy), l_disableLegacyContext_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_describeError_0 (copy), l_reenableLogs_0 (copy), v90 (ref), v118 (copy), l_set_0 (copy), v61 (copy), l_UninitializedState_0 (copy), v64 (ref), v66 (ref), l_cacheContext_0 (copy)
    local v145 = false;
    local l_l_emptyContextObject_0_0 = l_emptyContextObject_0;
    local l_l_emptyContextObject_0_1 = l_emptyContextObject_0;
    local l_contextType_0 = v143.contextType;
    if _G.__DEV__ and v143.contextType ~= nil then
        local v149 = true;
        if l_contextType_0 ~= nil then
            v149 = false;
            if l_contextType_0["$$typeof"] == l_REACT_CONTEXT_TYPE_0 then
                v149 = l_contextType_0._context == nil;
            end;
        end;
        if not v149 and not v72[v143] then
            v72[v143] = true;
            local v150 = "";
            if l_contextType_0 == nil then
                v150 = " However, it is set to nil. " .. "This can be caused by a typo or by mixing up named and default imports. " .. "This can also happen due to a circular dependency, so " .. "try moving the createContext() call to a separate file.";
            elseif typeof(l_contextType_0) ~= "table" then
                v150 = " However, it is set to a " .. typeof(l_contextType_0) .. ".";
            elseif l_contextType_0["$$typeof"] == l_REACT_PROVIDER_TYPE_0 then
                v150 = " Did you accidentally pass the Context.Provider instead?";
            elseif l_contextType_0._context ~= nil then
                v150 = " Did you accidentally pass the Context.Consumer instead?";
            else
                v150 = v150 .. " However, it is set to an object with keys {";
                for v151, _ in l_contextType_0 do
                    v150 = v150 .. v151 .. ", ";
                end;
                v150 = v150 .. "}.";
            end;
            l_console_0.error("%s defines an invalid contextType. " .. "contextType should point to the Context object returned by React.createContext().%s", l_getComponentName_0(v143) or "Component", v150);
        end;
    end;
    if l_contextType_0 ~= nil and typeof(l_contextType_0) == "table" then
        l_l_emptyContextObject_0_1 = l_readContext_0(l_contextType_0);
    elseif not l_disableLegacyContext_0 then
        l_l_emptyContextObject_0_0 = l_getUnmaskedContext_0(v142, v143, true);
        v145 = v143.contextTypes ~= nil;
        l_l_emptyContextObject_0_1 = v145 and l_getMaskedContext_0(v142, l_l_emptyContextObject_0_0) or l_emptyContextObject_0;
    end;
    if _G.__DEV__ and l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v142.mode, l_StrictMode_0) ~= 0 then
        l_disableLogs_0();
        local v153, v154 = xpcall(v143.__ctor, l_describeError_0, v144, l_l_emptyContextObject_0_1);
        l_reenableLogs_0();
        if not v153 then
            error(v154);
        end;
    end;
    local v155 = v143.__ctor(v144, l_l_emptyContextObject_0_1);
    v142.memoizedState = v155.state;
    local l_memoizedState_1 = v142.memoizedState;
    if v90 == nil then
        v118();
    end;
    v155.__updater = v90;
    v142.stateNode = v155;
    l_set_0(v155, v142);
    if _G.__DEV__ then
        v155._reactInternalInstance = v61;
    end;
    if _G.__DEV__ then
        if typeof(v143.getDerivedStateFromProps) == "function" and l_memoizedState_1 == l_UninitializedState_0 then
            local v157 = l_getComponentName_0(v143) or "Component";
            if not v64[v157] then
                v64[v157] = true;
                l_console_0.error("`%s` uses `getDerivedStateFromProps` but its initial state has not been initialized. " .. "This is not recommended. Instead, define the initial state by " .. "passing an object to `self:setState` in the `init` method of `%s`. " .. "This ensures that `getDerivedStateFromProps` arguments have a consistent shape.", v157, v157);
            end;
        end;
        if typeof(v143.getDerivedStateFromProps) == "function" or typeof(v155.getSnapshotBeforeUpdate) == "function" then
            local v158 = nil;
            local v159 = nil;
            local v160 = nil;
            if typeof(v155.componentWillMount) == "function" then
                v158 = "componentWillMount";
            elseif typeof(v155.UNSAFE_componentWillMount) == "function" then
                v158 = "UNSAFE_componentWillMount";
            end;
            if typeof(v155.componentWillReceiveProps) == "function" then
                v159 = "componentWillReceiveProps";
            elseif typeof(v155.UNSAFE_componentWillReceiveProps) == "function" then
                v159 = "UNSAFE_componentWillReceiveProps";
            end;
            if typeof(v155.componentWillUpdate) == "function" then
                v160 = "componentWillUpdate";
            elseif typeof(v155.UNSAFE_componentWillUpdate) == "function" then
                v160 = "UNSAFE_componentWillUpdate";
            end;
            if v158 ~= nil or v159 ~= nil or v160 ~= nil then
                local v161 = l_getComponentName_0(v143) or "Component";
                local v162 = nil;
                v162 = typeof(v143.getDerivedStateFromProps) == "function" and "getDerivedStateFromProps()" or "getSnapshotBeforeUpdate()";
                local v163 = nil;
                v163 = if v158 ~= nil then "\n  " .. tostring(v158) else "";
                local v164 = nil;
                v164 = if v159 ~= nil then "\n  " .. tostring(v159) else "";
                local v165 = nil;
                v165 = if v160 ~= nil then "\n  " .. tostring(v160) else "";
                if not v66[v161] then
                    v66[v161] = true;
                    l_console_0.error("Unsafe legacy lifecycles will not be called for components using new component APIs.\n\n" .. "%s uses %s but also contains the following legacy lifecycles:%s%s%s\n\n" .. "The above lifecycles should be removed. Learn more about this warning here:\n" .. "https://reactjs.org/link/unsafe-component-lifecycles", v161, v162, v163, v164, v165);
                end;
            end;
        end;
    end;
    if v145 then
        l_cacheContext_0(v142, l_l_emptyContextObject_0_0, l_l_emptyContextObject_0_1);
    end;
    return v155;
end;
local function v170(v167, v168) --[[ Line: 872 ]] --[[ Name: callComponentWillMount ]]
    -- upvalues: l_console_0 (copy), l_getComponentName_0 (copy), v90 (ref), v118 (copy)
    local l_state_1 = v168.state;
    if typeof(v168.componentWillMount) == "function" then
        v168:componentWillMount();
    end;
    if typeof(v168.UNSAFE_componentWillMount) == "function" then
        v168:UNSAFE_componentWillMount();
    end;
    if l_state_1 ~= v168.state then
        if _G.__DEV__ then
            l_console_0.error("%s.componentWillMount(): Assigning directly to this.state is " .. "deprecated (except inside a component's " .. "constructor). Use setState instead.", l_getComponentName_0(v167.type) or "Component");
        end;
        if v90 == nil then
            v118();
        end;
        v90.enqueueReplaceState(v168, v168.state);
    end;
end;
callComponentWillReceiveProps = function(v171, v172, v173, v174) --[[ Line: 898 ]] --[[ Name: callComponentWillReceiveProps ]]
    -- upvalues: l_getComponentName_0 (copy), v63 (ref), l_console_0 (copy), v90 (ref), v118 (copy)
    local l_state_2 = v172.state;
    if typeof(v172.componentWillReceiveProps) == "function" then
        v172:componentWillReceiveProps(v173, v174);
    end;
    if typeof(v172.UNSAFE_componentWillReceiveProps) == "function" then
        v172:UNSAFE_componentWillReceiveProps(v173, v174);
    end;
    if v172.state ~= l_state_2 then
        if _G.__DEV__ then
            local v176 = l_getComponentName_0(v171.type) or "Component";
            if not v63[v176] then
                v63[v176] = true;
                l_console_0.error("%s.componentWillReceiveProps(): Assigning directly to " .. "this.state is deprecated (except inside a component's " .. "constructor). Use setState instead.", v176);
            end;
        end;
        if v90 == nil then
            v118();
        end;
        v90.enqueueReplaceState(v172, v172.state);
    end;
end;
local function v186(v177, v178, v179, v180) --[[ Line: 933 ]] --[[ Name: mountClassInstance ]]
    -- upvalues: v138 (copy), l___refs_0 (copy), l_initializeUpdateQueue_0 (copy), l_readContext_0 (copy), l_disableLegacyContext_0 (copy), l_emptyContextObject_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_getComponentName_0 (copy), v70 (ref), l_console_0 (copy), l_StrictMode_0 (copy), v19 (copy), l_warnAboutDeprecatedLifecycles_0 (copy), l_processUpdateQueue_0 (copy), v89 (copy), v170 (copy), l_enableDoubleInvokingEffects_0 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy)
    if _G.__DEV__ then
        v138(v177, v178, v179);
    end;
    local l_stateNode_2 = v177.stateNode;
    l_stateNode_2.props = v179;
    l_stateNode_2.state = v177.memoizedState;
    l_stateNode_2.__refs = l___refs_0;
    l_initializeUpdateQueue_0(v177);
    local v182 = nil;
    if typeof(v178) == "table" then
        v182 = v178.contextType;
    end;
    if v182 ~= nil and typeof(v182) == "table" then
        l_stateNode_2.context = l_readContext_0(v182);
    elseif l_disableLegacyContext_0 then
        l_stateNode_2.context = l_emptyContextObject_0;
    else
        local v183 = l_getUnmaskedContext_0(v177, v178, true);
        l_stateNode_2.context = l_getMaskedContext_0(v177, v183);
    end;
    if _G.__DEV__ then
        if l_stateNode_2.state == v179 then
            local v184 = l_getComponentName_0(v178) or "Component";
            if not v70[v184] then
                v70[v184] = true;
                l_console_0.error("%s: It is not recommended to assign props directly to state " .. "because updates to props won't be reflected in state. " .. "In most cases, it is better to use props directly.", v184);
            end;
        end;
        if bit32.band(v177.mode, l_StrictMode_0) ~= 0 then
            v19.recordLegacyContextWarning(v177, l_stateNode_2);
        end;
        if l_warnAboutDeprecatedLifecycles_0 then
            v19.recordUnsafeLifecycleWarnings(v177, l_stateNode_2);
        end;
    end;
    l_processUpdateQueue_0(v177, v179, l_stateNode_2, v180);
    l_stateNode_2.state = v177.memoizedState;
    local v185 = nil;
    if typeof(v178) == "table" then
        v185 = v178.getDerivedStateFromProps;
    end;
    if typeof(v185) == "function" then
        v89(v177, v178, v185, v179);
        l_stateNode_2.state = v177.memoizedState;
    end;
    if typeof(v178) == "table" and typeof(v178.getDerivedStateFromProps) ~= "function" and typeof(l_stateNode_2.getSnapshotBeforeUpdate) ~= "function" and (typeof(l_stateNode_2.UNSAFE_componentWillMount) == "function" or typeof(l_stateNode_2.componentWillMount) == "function") then
        v170(v177, l_stateNode_2);
        l_processUpdateQueue_0(v177, v179, l_stateNode_2, v180);
        l_stateNode_2.state = v177.memoizedState;
    end;
    if typeof(l_stateNode_2.componentDidMount) == "function" then
        if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
            v177.flags = bit32.bor(v177.flags, (bit32.bor(l_MountLayoutDev_0, l_Update_0)));
            return;
        else
            v177.flags = bit32.bor(v177.flags, l_Update_0);
        end;
    end;
end;
resumeMountClassInstance = function(v187, v188, v189, v190) --[[ Line: 1040 ]] --[[ Name: resumeMountClassInstance ]]
    -- upvalues: l_emptyContextObject_0 (copy), l_readContext_0 (copy), l_disableLegacyContext_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_resetHasForceUpdateBeforeProcessing_0 (copy), l_processUpdateQueue_0 (copy), l_hasContextChanged_0 (copy), l_checkHasForceUpdateAfterProcessing_0 (copy), l_enableDoubleInvokingEffects_0 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy), v89 (copy)
    local l_stateNode_3 = v187.stateNode;
    local l_memoizedProps_0 = v187.memoizedProps;
    l_stateNode_3.props = l_memoizedProps_0;
    local l_context_0 = l_stateNode_3.context;
    local l_contextType_1 = v188.contextType;
    local l_l_emptyContextObject_0_2 = l_emptyContextObject_0;
    if l_contextType_1 ~= nil and typeof(l_contextType_1) == "table" then
        l_l_emptyContextObject_0_2 = l_readContext_0(l_contextType_1);
    elseif not l_disableLegacyContext_0 then
        local v196 = l_getUnmaskedContext_0(v187, v188, true);
        l_l_emptyContextObject_0_2 = l_getMaskedContext_0(v187, v196);
    end;
    local l_getDerivedStateFromProps_0 = v188.getDerivedStateFromProps;
    local v198 = true;
    if typeof(l_getDerivedStateFromProps_0) ~= "function" then
        v198 = typeof(l_stateNode_3.getSnapshotBeforeUpdate) == "function";
    end;
    if not v198 and (typeof(l_stateNode_3.UNSAFE_componentWillReceiveProps) == "function" or typeof(l_stateNode_3.componentWillReceiveProps) == "function") and (l_memoizedProps_0 ~= v189 or l_context_0 ~= l_l_emptyContextObject_0_2) then
        callComponentWillReceiveProps(v187, l_stateNode_3, v189, l_l_emptyContextObject_0_2);
    end;
    l_resetHasForceUpdateBeforeProcessing_0();
    local l_memoizedState_2 = v187.memoizedState;
    l_stateNode_3.state = l_memoizedState_2;
    local l_l_memoizedState_2_0 = l_memoizedState_2;
    l_processUpdateQueue_0(v187, v189, l_stateNode_3, v190);
    l_l_memoizedState_2_0 = v187.memoizedState;
    if l_memoizedProps_0 == v189 and l_memoizedState_2 == l_l_memoizedState_2_0 and not l_hasContextChanged_0() and not l_checkHasForceUpdateAfterProcessing_0() then
        if typeof(l_stateNode_3.componentDidMount) == "function" then
            if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
                v187.flags = bit32.bor(v187.flags, l_MountLayoutDev_0, l_Update_0);
            else
                v187.flags = bit32.bor(v187.flags, l_Update_0);
            end;
        end;
        return false;
    else
        if typeof(l_getDerivedStateFromProps_0) == "function" then
            v89(v187, v188, l_getDerivedStateFromProps_0, v189);
            l_l_memoizedState_2_0 = v187.memoizedState;
        end;
        local v201 = l_checkHasForceUpdateAfterProcessing_0() or checkShouldComponentUpdate(v187, v188, l_memoizedProps_0, v189, l_memoizedState_2, l_l_memoizedState_2_0, l_l_emptyContextObject_0_2);
        if v201 then
            if not v198 and (typeof(l_stateNode_3.UNSAFE_componentWillMount) == "function" or typeof(l_stateNode_3.componentWillMount) == "function") then
                if typeof(l_stateNode_3.componentWillMount) == "function" then
                    l_stateNode_3:componentWillMount();
                end;
                if typeof(l_stateNode_3.UNSAFE_componentWillMount) == "function" then
                    l_stateNode_3:UNSAFE_componentWillMount();
                end;
            end;
            if typeof(l_stateNode_3.componentDidMount) == "function" then
                if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
                    v187.flags = bit32.bor(v187.flags, l_MountLayoutDev_0, l_Update_0);
                else
                    v187.flags = bit32.bor(v187.flags, l_Update_0);
                end;
            end;
        else
            if typeof(l_stateNode_3.componentDidMount) == "function" then
                if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
                    v187.flags = bit32.bor(v187.flags, l_MountLayoutDev_0, l_Update_0);
                else
                    v187.flags = bit32.bor(v187.flags, l_Update_0);
                end;
            end;
            v187.memoizedProps = v189;
            v187.memoizedState = l_l_memoizedState_2_0;
        end;
        l_stateNode_3.props = v189;
        l_stateNode_3.state = l_l_memoizedState_2_0;
        l_stateNode_3.context = l_l_emptyContextObject_0_2;
        return v201;
    end;
end;
return {
    adoptClassInstance = v141, 
    constructClassInstance = v166, 
    mountClassInstance = v186, 
    resumeMountClassInstance = resumeMountClassInstance, 
    updateClassInstance = function(v202, v203, v204, v205, v206) --[[ Line: 1188 ]] --[[ Name: updateClassInstance ]]
        -- upvalues: l_cloneUpdateQueue_0 (copy), l_resolveDefaultProps_0 (copy), l_emptyContextObject_0 (copy), l_readContext_0 (copy), l_disableLegacyContext_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_resetHasForceUpdateBeforeProcessing_0 (copy), l_processUpdateQueue_0 (copy), l_hasContextChanged_0 (copy), l_checkHasForceUpdateAfterProcessing_0 (copy), l_Update_0 (copy), l_Snapshot_0 (copy), v89 (copy)
        local l_stateNode_4 = v203.stateNode;
        l_cloneUpdateQueue_0(v202, v203);
        local l_memoizedProps_1 = v203.memoizedProps;
        local v209 = v203.type == v203.elementType and l_memoizedProps_1 or l_resolveDefaultProps_0(v203.type, l_memoizedProps_1);
        l_stateNode_4.props = v209;
        local l_pendingProps_0 = v203.pendingProps;
        local l_context_1 = l_stateNode_4.context;
        local v212 = nil;
        local v213 = nil;
        if typeof(v204) == "table" then
            v212 = v204.contextType;
            v213 = v204.getDerivedStateFromProps;
        end;
        local l_l_emptyContextObject_0_3 = l_emptyContextObject_0;
        if typeof(v212) == "table" then
            l_l_emptyContextObject_0_3 = l_readContext_0(v212);
        elseif not l_disableLegacyContext_0 then
            local v215 = l_getUnmaskedContext_0(v203, v204, true);
            l_l_emptyContextObject_0_3 = l_getMaskedContext_0(v203, v215);
        end;
        local v216 = true;
        if typeof(v213) ~= "function" then
            v216 = typeof(l_stateNode_4.getSnapshotBeforeUpdate) == "function";
        end;
        if not v216 and (typeof(l_stateNode_4.UNSAFE_componentWillReceiveProps) == "function" or typeof(l_stateNode_4.componentWillReceiveProps) == "function") and (l_memoizedProps_1 ~= l_pendingProps_0 or l_context_1 ~= l_l_emptyContextObject_0_3) then
            callComponentWillReceiveProps(v203, l_stateNode_4, v205, l_l_emptyContextObject_0_3);
        end;
        l_resetHasForceUpdateBeforeProcessing_0();
        local l_memoizedState_3 = v203.memoizedState;
        l_stateNode_4.state = l_memoizedState_3;
        local l_state_3 = l_stateNode_4.state;
        l_processUpdateQueue_0(v203, v205, l_stateNode_4, v206);
        l_state_3 = v203.memoizedState;
        if l_memoizedProps_1 == l_pendingProps_0 and l_memoizedState_3 == l_state_3 and not l_hasContextChanged_0() and not l_checkHasForceUpdateAfterProcessing_0() then
            if typeof(l_stateNode_4.componentDidUpdate) == "function" and (l_memoizedProps_1 ~= v202.memoizedProps or l_memoizedState_3 ~= v202.memoizedState) then
                v203.flags = bit32.bor(v203.flags, l_Update_0);
            end;
            if typeof(l_stateNode_4.getSnapshotBeforeUpdate) == "function" and (l_memoizedProps_1 ~= v202.memoizedProps or l_memoizedState_3 ~= v202.memoizedState) then
                v203.flags = bit32.bor(v203.flags, l_Snapshot_0);
            end;
            return false;
        else
            if typeof(v213) == "function" then
                v89(v203, v204, v213, v205);
                l_state_3 = v203.memoizedState;
            end;
            local v219 = l_checkHasForceUpdateAfterProcessing_0() or checkShouldComponentUpdate(v203, v204, v209, v205, l_memoizedState_3, l_state_3, l_l_emptyContextObject_0_3);
            if v219 then
                if not v216 and (typeof(l_stateNode_4.UNSAFE_componentWillUpdate) == "function" or typeof(l_stateNode_4.componentWillUpdate) == "function") then
                    if typeof(l_stateNode_4.componentWillUpdate) == "function" then
                        l_stateNode_4:componentWillUpdate(v205, l_state_3, l_l_emptyContextObject_0_3);
                    end;
                    if typeof(l_stateNode_4.UNSAFE_componentWillUpdate) == "function" then
                        l_stateNode_4:UNSAFE_componentWillUpdate(v205, l_state_3, l_l_emptyContextObject_0_3);
                    end;
                end;
                if typeof(l_stateNode_4.componentDidUpdate) == "function" then
                    v203.flags = bit32.bor(v203.flags, l_Update_0);
                end;
                if typeof(l_stateNode_4.getSnapshotBeforeUpdate) == "function" then
                    v203.flags = bit32.bor(v203.flags, l_Snapshot_0);
                end;
            else
                if typeof(l_stateNode_4.componentDidUpdate) == "function" and (l_memoizedProps_1 ~= v202.memoizedProps or l_memoizedState_3 ~= v202.memoizedState) then
                    v203.flags = bit32.bor(v203.flags, l_Update_0);
                end;
                if typeof(l_stateNode_4.getSnapshotBeforeUpdate) == "function" and (l_memoizedProps_1 ~= v202.memoizedProps or l_memoizedState_3 ~= v202.memoizedState) then
                    v203.flags = bit32.bor(v203.flags, l_Snapshot_0);
                end;
                v203.memoizedProps = v205;
                v203.memoizedState = l_state_3;
            end;
            l_stateNode_4.props = v205;
            l_stateNode_4.state = l_state_3;
            l_stateNode_4.context = l_l_emptyContextObject_0_3;
            return v219;
        end;
    end, 
    applyDerivedStateFromProps = v89, 
    emptyRefsObject = l___refs_0
};