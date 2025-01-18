local l___DEV___0 = _G.__DEV__;
local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v5 = require(script.Parent.ReactFiberLane);
local v6 = require(script.Parent["ReactUpdateQueue.new"]);
local _ = require(l_Parent_0.Shared);
local v8 = require(l_Parent_0.React);
local v9 = require(script.Parent.ReactFiberFlags);
local l_Update_0 = v9.Update;
local l_Snapshot_0 = v9.Snapshot;
local l_MountLayoutDev_0 = v9.MountLayoutDev;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_debugRenderPhaseSideEffectsForStrictMode_0 = l_ReactFeatureFlags_0.debugRenderPhaseSideEffectsForStrictMode;
local l_disableLegacyContext_0 = l_ReactFeatureFlags_0.disableLegacyContext;
local l_enableDebugTracing_0 = l_ReactFeatureFlags_0.enableDebugTracing;
local l_enableSchedulingProfiler_0 = l_ReactFeatureFlags_0.enableSchedulingProfiler;
local l_warnAboutDeprecatedLifecycles_0 = l_ReactFeatureFlags_0.warnAboutDeprecatedLifecycles;
local l_enableDoubleInvokingEffects_0 = l_ReactFeatureFlags_0.enableDoubleInvokingEffects;
local v20 = require(script.Parent["ReactStrictModeWarnings.new"]);
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
local v33 = require(script.Parent.ReactTypeOfMode);
local l_DebugTracingMode_0 = v33.DebugTracingMode;
local l_StrictMode_0 = v33.StrictMode;
local l_enqueueUpdate_0 = v6.enqueueUpdate;
local l_processUpdateQueue_0 = v6.processUpdateQueue;
local l_checkHasForceUpdateAfterProcessing_0 = v6.checkHasForceUpdateAfterProcessing;
local l_resetHasForceUpdateBeforeProcessing_0 = v6.resetHasForceUpdateBeforeProcessing;
local l_createUpdate_0 = v6.createUpdate;
local l_ReplaceState_0 = v6.ReplaceState;
local l_ForceUpdate_0 = v6.ForceUpdate;
local l_initializeUpdateQueue_0 = v6.initializeUpdateQueue;
local l_cloneUpdateQueue_0 = v6.cloneUpdateQueue;
local l_NoLanes_0 = v5.NoLanes;
local v46 = require(script.Parent["ReactFiberContext.new"]);
local l_cacheContext_0 = v46.cacheContext;
local l_getMaskedContext_0 = v46.getMaskedContext;
local l_getUnmaskedContext_0 = v46.getUnmaskedContext;
local l_hasContextChanged_0 = v46.hasContextChanged;
local l_emptyContextObject_0 = v46.emptyContextObject;
local l_readContext_0 = require(script.Parent["ReactFiberNewContext.new"]).readContext;
local v53 = require(script.Parent.DebugTracing);
local l_logForceUpdateScheduled_0 = v53.logForceUpdateScheduled;
local l_logStateUpdateScheduled_0 = v53.logStateUpdateScheduled;
local l_ConsolePatchingDev_0 = require(l_Parent_0.Shared).ConsolePatchingDev;
local l_disableLogs_0 = l_ConsolePatchingDev_0.disableLogs;
local l_reenableLogs_0 = l_ConsolePatchingDev_0.reenableLogs;
local v59 = require(script.Parent.SchedulingProfiler);
local l_markForceUpdateScheduled_0 = v59.markForceUpdateScheduled;
local l_markStateUpdateScheduled_0 = v59.markStateUpdateScheduled;
local v62 = {};
local l___refs_0 = v8.Component:extend("").__refs;
local v64 = nil;
local v65 = nil;
local v66 = nil;
local v67 = nil;
local v68 = nil;
local v69 = nil;
local v70 = nil;
local v71 = nil;
local v72 = nil;
local v73 = nil;
if l___DEV___0 then
    v64 = {};
    v65 = {};
    v66 = {};
    v67 = {};
    v71 = {};
    v68 = {};
    v72 = {};
    v73 = {};
    local v74 = {};
    local l_v74_0 = v74 --[[ copy: 76 -> 85 ]];
    v70 = function(v76, v77) --[[ Line: 138 ]] --[[ Name: warnOnInvalidCallback ]]
        -- upvalues: l_v74_0 (copy), l_console_0 (copy)
        if v76 == nil or type(v76) == "function" then
            return;
        else
            local v78 = v77 .. "_" .. tostring(v76);
            if not l_v74_0[v78] then
                l_v74_0[v78] = true;
                l_console_0.error("%s(...): Expected the last optional `callback` argument to be a " .. "function. Instead received: %s.", v77, (tostring(v76)));
            end;
            return;
        end;
    end;
    v69 = function(_, _) --[[ Line: 154 ]] --[[ Name: warnOnUndefinedDerivedState ]]

    end;
end;
local function v90(v81, v82, v83, v84) --[[ Line: 197 ]] --[[ Name: applyDerivedStateFromProps ]]
    -- upvalues: l___DEV___0 (copy), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_describeError_0 (copy), l_reenableLogs_0 (copy), v69 (ref), l_Object_0 (copy), l_NoLanes_0 (copy)
    local l_memoizedState_0 = v81.memoizedState;
    if l___DEV___0 and l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v81.mode, l_StrictMode_0) ~= 0 then
        l_disableLogs_0();
        local v86, v87 = xpcall(v83, l_describeError_0, v84, l_memoizedState_0);
        l_reenableLogs_0();
        if not v86 then
            error(v87);
        end;
    end;
    local v88 = v83(v84, l_memoizedState_0);
    if l___DEV___0 then
        v69(v82, v88);
    end;
    local v89 = if v88 == nil then l_memoizedState_0 else l_Object_0.assign({}, l_memoizedState_0, v88);
    v81.memoizedState = v89;
    if v81.lanes == l_NoLanes_0 then
        v81.updateQueue.baseState = v89;
    end;
end;
local v91 = nil;
local function v119() --[[ Line: 245 ]] --[[ Name: initializeClassComponentUpdater ]]
    -- upvalues: v91 (ref), l_isMounted_0 (copy), l_get_0 (copy), l_createUpdate_0 (copy), l___DEV___0 (copy), v70 (ref), l_enqueueUpdate_0 (copy), l_enableDebugTracing_0 (copy), l_DebugTracingMode_0 (copy), l_getComponentName_0 (copy), l_logStateUpdateScheduled_0 (copy), l_enableSchedulingProfiler_0 (copy), l_markStateUpdateScheduled_0 (copy), l_ReplaceState_0 (copy), l_ForceUpdate_0 (copy), l_logForceUpdateScheduled_0 (copy), l_markForceUpdateScheduled_0 (copy)
    local v92 = require(script.Parent["ReactFiberWorkLoop.new"]);
    local l_requestEventTime_0 = v92.requestEventTime;
    local l_requestUpdateLane_0 = v92.requestUpdateLane;
    local l_scheduleUpdateOnFiber_0 = v92.scheduleUpdateOnFiber;
    v91 = {
        isMounted = l_isMounted_0, 
        enqueueSetState = function(v96, v97, v98) --[[ Line: 253 ]] --[[ Name: enqueueSetState ]]
            -- upvalues: l_get_0 (ref), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), l_createUpdate_0 (ref), l___DEV___0 (ref), v70 (ref), l_enqueueUpdate_0 (ref), l_scheduleUpdateOnFiber_0 (copy), l_enableDebugTracing_0 (ref), l_DebugTracingMode_0 (ref), l_getComponentName_0 (ref), l_logStateUpdateScheduled_0 (ref), l_enableSchedulingProfiler_0 (ref), l_markStateUpdateScheduled_0 (ref)
            local v99 = l_get_0(v96);
            local v100 = l_requestEventTime_0();
            local v101 = l_requestUpdateLane_0(v99);
            local v102 = l_createUpdate_0(v100, v101, v97, v98);
            if v98 ~= nil and l___DEV___0 then
                v70(v98, "setState");
            end;
            l_enqueueUpdate_0(v99, v102);
            l_scheduleUpdateOnFiber_0(v99, v101, v100);
            if l___DEV___0 and l_enableDebugTracing_0 and bit32.band(v99.mode, l_DebugTracingMode_0) ~= 0 then
                local v103 = l_getComponentName_0(v99.type) or "Unknown";
                l_logStateUpdateScheduled_0(v103, v101, v97);
            end;
            if l_enableSchedulingProfiler_0 then
                l_markStateUpdateScheduled_0(v99, v101);
            end;
        end, 
        enqueueReplaceState = function(v104, v105, v106) --[[ Line: 283 ]] --[[ Name: enqueueReplaceState ]]
            -- upvalues: l_get_0 (ref), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), l_createUpdate_0 (ref), l_ReplaceState_0 (ref), l___DEV___0 (ref), v70 (ref), l_enqueueUpdate_0 (ref), l_scheduleUpdateOnFiber_0 (copy), l_enableDebugTracing_0 (ref), l_DebugTracingMode_0 (ref), l_getComponentName_0 (ref), l_logStateUpdateScheduled_0 (ref), l_enableSchedulingProfiler_0 (ref), l_markStateUpdateScheduled_0 (ref)
            local v107 = l_get_0(v104);
            local v108 = l_requestEventTime_0();
            local v109 = l_requestUpdateLane_0(v107);
            local v110 = l_createUpdate_0(v108, v109, v105, v106);
            v110.tag = l_ReplaceState_0;
            if v106 ~= nil and l___DEV___0 then
                v70(v106, "replaceState");
            end;
            l_enqueueUpdate_0(v107, v110);
            l_scheduleUpdateOnFiber_0(v107, v109, v108);
            if l___DEV___0 and l_enableDebugTracing_0 and bit32.band(v107.mode, l_DebugTracingMode_0) ~= 0 then
                local v111 = l_getComponentName_0(v107.type) or "Unknown";
                l_logStateUpdateScheduled_0(v111, v109, v105);
            end;
            if l_enableSchedulingProfiler_0 then
                l_markStateUpdateScheduled_0(v107, v109);
            end;
        end, 
        enqueueForceUpdate = function(v112, v113) --[[ Line: 315 ]] --[[ Name: enqueueForceUpdate ]]
            -- upvalues: l_get_0 (ref), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), l_createUpdate_0 (ref), l_ForceUpdate_0 (ref), l___DEV___0 (ref), v70 (ref), l_enqueueUpdate_0 (ref), l_scheduleUpdateOnFiber_0 (copy), l_enableDebugTracing_0 (ref), l_DebugTracingMode_0 (ref), l_getComponentName_0 (ref), l_logForceUpdateScheduled_0 (ref), l_enableSchedulingProfiler_0 (ref), l_markForceUpdateScheduled_0 (ref)
            local v114 = l_get_0(v112);
            local v115 = l_requestEventTime_0();
            local v116 = l_requestUpdateLane_0(v114);
            local v117 = l_createUpdate_0(v115, v116, nil, v113);
            v117.tag = l_ForceUpdate_0;
            if v113 ~= nil and l___DEV___0 then
                v70(v113, "forceUpdate");
            end;
            l_enqueueUpdate_0(v114, v117);
            l_scheduleUpdateOnFiber_0(v114, v116, v115);
            if l___DEV___0 and l_enableDebugTracing_0 and bit32.band(v114.mode, l_DebugTracingMode_0) ~= 0 then
                local v118 = l_getComponentName_0(v114.type) or "Unknown";
                l_logForceUpdateScheduled_0(v118, v116);
            end;
            if l_enableSchedulingProfiler_0 then
                l_markForceUpdateScheduled_0(v114, v116);
            end;
        end
    };
end;
local function _() --[[ Line: 349 ]] --[[ Name: getClassComponentUpdater ]]
    -- upvalues: v91 (ref), v119 (copy)
    if v91 == nil then
        v119();
    end;
    return v91;
end;
checkShouldComponentUpdate = function(v121, v122, v123, v124, v125, v126, v127) --[[ Line: 356 ]] --[[ Name: checkShouldComponentUpdate ]]
    -- upvalues: l___DEV___0 (copy), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_describeError_0 (copy), l_reenableLogs_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_shallowEqual_0 (copy)
    local l_stateNode_0 = v121.stateNode;
    if l_stateNode_0.shouldComponentUpdate ~= nil and type(l_stateNode_0.shouldComponentUpdate) == "function" then
        if l___DEV___0 and l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v121.mode, l_StrictMode_0) ~= 0 then
            l_disableLogs_0();
            local v129, v130 = xpcall(l_stateNode_0.shouldComponentUpdate, l_describeError_0, l_stateNode_0, v124, v126, v127);
            l_reenableLogs_0();
            if not v129 then
                error(v130);
            end;
        end;
        local v131 = l_stateNode_0:shouldComponentUpdate(v124, v126, v127);
        if l___DEV___0 and v131 == nil then
            l_console_0.error("%s.shouldComponentUpdate(): Returned nil instead of a " .. "boolean value. Make sure to return true or false.", l_getComponentName_0(v122) or "Component");
        end;
        return v131;
    elseif type(v122) == "table" and v122.isPureReactComponent then
        return not l_shallowEqual_0(v123, v124) or not l_shallowEqual_0(v125, v126);
    else
        return true;
    end;
end;
local function v139(v132, v133, v134) --[[ Line: 421 ]] --[[ Name: checkClassInstance ]]
    -- upvalues: l___DEV___0 (copy), l_getComponentName_0 (copy), l_console_0 (copy), l_disableLegacyContext_0 (copy), v72 (ref), v66 (ref)
    local l_stateNode_1 = v132.stateNode;
    if l___DEV___0 then
        local v136 = l_getComponentName_0(v133) or "Component";
        if not l_stateNode_1.render then
            if type(v133.render) == "function" then
                l_console_0.error("%s(...): No `render` method found on the returned component " .. "instance: did you accidentally return an object from the constructor?", v136);
            else
                l_console_0.error("%s(...): No `render` method found on the returned component " .. "instance: you may have forgotten to define `render`.", v136);
            end;
        end;
        if l_stateNode_1.getInitialState and not l_stateNode_1.getInitialState.isReactClassApproved and not l_stateNode_1.state then
            l_console_0.error("getInitialState was defined on %s, a plain JavaScript class. " .. "This is only supported for classes created using React.createClass. " .. "Did you mean to define a state property instead?", v136);
        end;
        if l_stateNode_1.getDefaultProps and not l_stateNode_1.getDefaultProps.isReactClassApproved then
            l_console_0.error("getDefaultProps was defined on %s, a plain JavaScript class. " .. "This is only supported for classes created using React.createClass. " .. "Use a static property to define defaultProps instead.", v136);
        end;
        if l_stateNode_1.propTypes and not v133.propTypes then
            l_console_0.error("propTypes was defined as an instance property on %s. Use a static " .. "property to define propTypes instead.", v136);
        end;
        if l_stateNode_1.contextType and not v133.contextType then
            l_console_0.error("contextType was defined as an instance property on %s. Use a static " .. "property to define contextType instead.", v136);
        end;
        if l_disableLegacyContext_0 then
            if v133.childContextTypes then
                l_console_0.error("%s uses the legacy childContextTypes API which is no longer supported. " .. "Use React.createContext() instead.", v136);
            end;
            if v133.contextTypes then
                l_console_0.error("%s uses the legacy contextTypes API which is no longer supported. " .. "Use React.createContext() with static contextType instead.", v136);
            end;
        else
            if l_stateNode_1.contextTypes and not v133.contextTypes then
                l_console_0.error("contextTypes was defined as an instance property on %s. Use a static " .. "property to define contextTypes instead.", v136);
            end;
            if type(v133) == "table" and v133.contextType and v133.contextTypes and not v72[v133] then
                v72[v133] = true;
                l_console_0.error("%s declares both contextTypes and contextType static properties. " .. "The legacy contextTypes property will be ignored.", v136);
            end;
        end;
        if type(l_stateNode_1.componentShouldUpdate) == "function" then
            l_console_0.error("%s has a method called " .. "componentShouldUpdate(). Did you mean shouldComponentUpdate()? " .. "The name is phrased as a question because the function is " .. "expected to return a value.", v136);
        end;
        if type(v133) == "table" and v133.isPureReactComponent and l_stateNode_1.shouldComponentUpdate ~= nil then
            l_console_0.error("%s has a method called shouldComponentUpdate(). " .. "shouldComponentUpdate should not be used when extending React.PureComponent. " .. "Please extend React.Component if shouldComponentUpdate is used.", l_getComponentName_0(v133) or "A pure component");
        end;
        if type(l_stateNode_1.componentDidUnmount) == "function" then
            l_console_0.error("%s has a method called " .. "componentDidUnmount(). But there is no such lifecycle method. " .. "Did you mean componentWillUnmount()?", v136);
        end;
        if type(l_stateNode_1.componentDidReceiveProps) == "function" then
            l_console_0.error("%s has a method called " .. "componentDidReceiveProps(). But there is no such lifecycle method. " .. "If you meant to update the state in response to changing props, " .. "use componentWillReceiveProps(). If you meant to fetch data or " .. "run side-effects or mutations after React has updated the UI, use componentDidUpdate().", v136);
        end;
        if type(l_stateNode_1.componentWillRecieveProps) == "function" then
            l_console_0.error("%s has a method called " .. "componentWillRecieveProps(). Did you mean componentWillReceiveProps()?", v136);
        end;
        if type(l_stateNode_1.UNSAFE_componentWillRecieveProps) == "function" then
            l_console_0.error("%s has a method called " .. "UNSAFE_componentWillRecieveProps(). Did you mean UNSAFE_componentWillReceiveProps()?", v136);
        end;
        local v137 = l_stateNode_1.props ~= v134;
        if l_stateNode_1.props ~= nil and v137 then
            l_console_0.error("%s(...): When calling super() in `%s`, make sure to pass " .. "up the same props that your component's constructor was passed.", v136, v136);
        end;
        if rawget(l_stateNode_1, "defaultProps") then
            l_console_0.error("Setting defaultProps as an instance property on %s is not supported and will be ignored." .. " Instead, define defaultProps as a static property on %s.", v136, v136);
        end;
        if type(l_stateNode_1.getSnapshotBeforeUpdate) == "function" and type(l_stateNode_1.componentDidUpdate) ~= "function" and not v66[v133] then
            v66[v133] = true;
            l_console_0.error("%s: getSnapshotBeforeUpdate() should be used with componentDidUpdate(). " .. "This component defines getSnapshotBeforeUpdate() only.", l_getComponentName_0(v133));
        end;
        local l_state_0 = l_stateNode_1.state;
        if l_state_0 ~= nil and type(l_state_0) ~= "table" then
            l_console_0.error("%s.state: must be set to an object or nil", v136);
        end;
        if type(v133) == "table" and type(l_stateNode_1.getChildContext) == "function" and type(v133.childContextTypes) ~= "table" then
            l_console_0.error("%s.getChildContext(): childContextTypes must be defined in order to " .. "use getChildContext().", v136);
        end;
    end;
end;
local function v142(v140, v141) --[[ Line: 655 ]] --[[ Name: adoptClassInstance ]]
    -- upvalues: v91 (ref), v119 (copy), l_set_0 (copy), l___DEV___0 (copy), v62 (copy)
    if v91 == nil then
        v119();
    end;
    v141.__updater = v91;
    v140.stateNode = v141;
    l_set_0(v141, v140);
    if l___DEV___0 then
        v141._reactInternalInstance = v62;
    end;
end;
local function v167(v143, v144, v145) --[[ Line: 666 ]] --[[ Name: constructClassInstance ]]
    -- upvalues: l_emptyContextObject_0 (copy), l___DEV___0 (copy), l_REACT_CONTEXT_TYPE_0 (copy), v73 (ref), l_REACT_PROVIDER_TYPE_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_readContext_0 (copy), l_disableLegacyContext_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_describeError_0 (copy), l_reenableLogs_0 (copy), v91 (ref), v119 (copy), l_set_0 (copy), v62 (copy), l_UninitializedState_0 (copy), v65 (ref), v67 (ref), l_cacheContext_0 (copy)
    local v146 = false;
    local l_l_emptyContextObject_0_0 = l_emptyContextObject_0;
    local l_l_emptyContextObject_0_1 = l_emptyContextObject_0;
    local l_contextType_0 = v144.contextType;
    if l___DEV___0 and v144.contextType ~= nil then
        local v150 = true;
        if l_contextType_0 ~= nil then
            v150 = false;
            if l_contextType_0["$$typeof"] == l_REACT_CONTEXT_TYPE_0 then
                v150 = l_contextType_0._context == nil;
            end;
        end;
        if not v150 and not v73[v144] then
            v73[v144] = true;
            local v151 = "";
            if l_contextType_0 == nil then
                v151 = " However, it is set to nil. " .. "This can be caused by a typo or by mixing up named and default imports. " .. "This can also happen due to a circular dependency, so " .. "try moving the createContext() call to a separate file.";
            elseif type(l_contextType_0) ~= "table" then
                v151 = " However, it is set to a " .. type(l_contextType_0) .. ".";
            elseif l_contextType_0["$$typeof"] == l_REACT_PROVIDER_TYPE_0 then
                v151 = " Did you accidentally pass the Context.Provider instead?";
            elseif l_contextType_0._context ~= nil then
                v151 = " Did you accidentally pass the Context.Consumer instead?";
            else
                v151 = v151 .. " However, it is set to an object with keys {";
                for v152, _ in l_contextType_0 do
                    v151 = v151 .. v152 .. ", ";
                end;
                v151 = v151 .. "}.";
            end;
            l_console_0.error("%s defines an invalid contextType. " .. "contextType should point to the Context object returned by React.createContext().%s", l_getComponentName_0(v144) or "Component", v151);
        end;
    end;
    if l_contextType_0 ~= nil and type(l_contextType_0) == "table" then
        l_l_emptyContextObject_0_1 = l_readContext_0(l_contextType_0);
    elseif not l_disableLegacyContext_0 then
        l_l_emptyContextObject_0_0 = l_getUnmaskedContext_0(v143, v144, true);
        v146 = v144.contextTypes ~= nil;
        l_l_emptyContextObject_0_1 = v146 and l_getMaskedContext_0(v143, l_l_emptyContextObject_0_0) or l_emptyContextObject_0;
    end;
    if l___DEV___0 and l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v143.mode, l_StrictMode_0) ~= 0 then
        l_disableLogs_0();
        local v154, v155 = xpcall(v144.__ctor, l_describeError_0, v145, l_l_emptyContextObject_0_1);
        l_reenableLogs_0();
        if not v154 then
            error(v155);
        end;
    end;
    local v156 = v144.__ctor(v145, l_l_emptyContextObject_0_1);
    v143.memoizedState = v156.state;
    local l_memoizedState_1 = v143.memoizedState;
    if v91 == nil then
        v119();
    end;
    v156.__updater = v91;
    v143.stateNode = v156;
    l_set_0(v156, v143);
    if l___DEV___0 then
        v156._reactInternalInstance = v62;
    end;
    if l___DEV___0 then
        if type(v144.getDerivedStateFromProps) == "function" and l_memoizedState_1 == l_UninitializedState_0 then
            local v158 = l_getComponentName_0(v144) or "Component";
            if not v65[v158] then
                v65[v158] = true;
                l_console_0.error("`%s` uses `getDerivedStateFromProps` but its initial state has not been initialized. " .. "This is not recommended. Instead, define the initial state by " .. "passing an object to `self:setState` in the `init` method of `%s`. " .. "This ensures that `getDerivedStateFromProps` arguments have a consistent shape.", v158, v158);
            end;
        end;
        if type(v144.getDerivedStateFromProps) == "function" or type(v156.getSnapshotBeforeUpdate) == "function" then
            local v159 = nil;
            local v160 = nil;
            local v161 = nil;
            if type(v156.componentWillMount) == "function" then
                v159 = "componentWillMount";
            elseif type(v156.UNSAFE_componentWillMount) == "function" then
                v159 = "UNSAFE_componentWillMount";
            end;
            if type(v156.componentWillReceiveProps) == "function" then
                v160 = "componentWillReceiveProps";
            elseif type(v156.UNSAFE_componentWillReceiveProps) == "function" then
                v160 = "UNSAFE_componentWillReceiveProps";
            end;
            if type(v156.componentWillUpdate) == "function" then
                v161 = "componentWillUpdate";
            elseif type(v156.UNSAFE_componentWillUpdate) == "function" then
                v161 = "UNSAFE_componentWillUpdate";
            end;
            if v159 ~= nil or v160 ~= nil or v161 ~= nil then
                local v162 = l_getComponentName_0(v144) or "Component";
                local v163 = nil;
                v163 = type(v144.getDerivedStateFromProps) == "function" and "getDerivedStateFromProps()" or "getSnapshotBeforeUpdate()";
                local v164 = nil;
                v164 = if v159 ~= nil then "\n  " .. tostring(v159) else "";
                local v165 = nil;
                v165 = if v160 ~= nil then "\n  " .. tostring(v160) else "";
                local v166 = nil;
                v166 = if v161 ~= nil then "\n  " .. tostring(v161) else "";
                if not v67[v162] then
                    v67[v162] = true;
                    l_console_0.error("Unsafe legacy lifecycles will not be called for components using new component APIs.\n\n" .. "%s uses %s but also contains the following legacy lifecycles:%s%s%s\n\n" .. "The above lifecycles should be removed. Learn more about this warning here:\n" .. "https://reactjs.org/link/unsafe-component-lifecycles", v162, v163, v164, v165, v166);
                end;
            end;
        end;
    end;
    if v146 then
        l_cacheContext_0(v143, l_l_emptyContextObject_0_0, l_l_emptyContextObject_0_1);
    end;
    return v156;
end;
local function v171(v168, v169) --[[ Line: 879 ]] --[[ Name: callComponentWillMount ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), l_getComponentName_0 (copy), v91 (ref), v119 (copy)
    local l_state_1 = v169.state;
    if v169.componentWillMount ~= nil and type(v169.componentWillMount) == "function" then
        v169:componentWillMount();
    end;
    if v169.UNSAFE_componentWillMount ~= nil and type(v169.UNSAFE_componentWillMount) == "function" then
        v169:UNSAFE_componentWillMount();
    end;
    if l_state_1 ~= v169.state then
        if l___DEV___0 then
            l_console_0.error("%s.componentWillMount(): Assigning directly to this.state is " .. "deprecated (except inside a component's " .. "constructor). Use setState instead.", l_getComponentName_0(v168.type) or "Component");
        end;
        if v91 == nil then
            v119();
        end;
        v91.enqueueReplaceState(v169, v169.state);
    end;
end;
callComponentWillReceiveProps = function(v172, v173, v174, v175) --[[ Line: 911 ]] --[[ Name: callComponentWillReceiveProps ]]
    -- upvalues: l___DEV___0 (copy), l_getComponentName_0 (copy), v64 (ref), l_console_0 (copy), v91 (ref), v119 (copy)
    local l_state_2 = v173.state;
    if v173.componentWillReceiveProps ~= nil and type(v173.componentWillReceiveProps) == "function" then
        v173:componentWillReceiveProps(v174, v175);
    end;
    if v173.UNSAFE_componentWillReceiveProps ~= nil and type(v173.UNSAFE_componentWillReceiveProps) == "function" then
        v173:UNSAFE_componentWillReceiveProps(v174, v175);
    end;
    if v173.state ~= l_state_2 then
        if l___DEV___0 then
            local v177 = l_getComponentName_0(v172.type) or "Component";
            if not v64[v177] then
                v64[v177] = true;
                l_console_0.error("%s.componentWillReceiveProps(): Assigning directly to " .. "this.state is deprecated (except inside a component's " .. "constructor). Use setState instead.", v177);
            end;
        end;
        if v91 == nil then
            v119();
        end;
        v91.enqueueReplaceState(v173, v173.state);
    end;
end;
local function v188(v178, v179, v180, v181) --[[ Line: 946 ]] --[[ Name: mountClassInstance ]]
    -- upvalues: l___DEV___0 (copy), v139 (copy), l___refs_0 (copy), l_initializeUpdateQueue_0 (copy), l_readContext_0 (copy), l_disableLegacyContext_0 (copy), l_emptyContextObject_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_getComponentName_0 (copy), v71 (ref), l_console_0 (copy), l_StrictMode_0 (copy), v20 (copy), l_warnAboutDeprecatedLifecycles_0 (copy), l_processUpdateQueue_0 (copy), v90 (copy), v171 (copy), l_enableDoubleInvokingEffects_0 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy)
    if l___DEV___0 then
        v139(v178, v179, v180);
    end;
    local l_stateNode_2 = v178.stateNode;
    l_stateNode_2.props = v180;
    l_stateNode_2.state = v178.memoizedState;
    l_stateNode_2.__refs = l___refs_0;
    l_initializeUpdateQueue_0(v178);
    local v183 = nil;
    if type(v179) == "table" then
        v183 = v179.contextType;
    end;
    if v183 ~= nil and type(v183) == "table" then
        l_stateNode_2.context = l_readContext_0(v183);
    elseif l_disableLegacyContext_0 then
        l_stateNode_2.context = l_emptyContextObject_0;
    else
        local v184 = l_getUnmaskedContext_0(v178, v179, true);
        l_stateNode_2.context = l_getMaskedContext_0(v178, v184);
    end;
    if l___DEV___0 then
        if l_stateNode_2.state == v180 then
            local v185 = l_getComponentName_0(v179) or "Component";
            if not v71[v185] then
                v71[v185] = true;
                l_console_0.error("%s: It is not recommended to assign props directly to state " .. "because updates to props won't be reflected in state. " .. "In most cases, it is better to use props directly.", v185);
            end;
        end;
        if bit32.band(v178.mode, l_StrictMode_0) ~= 0 then
            v20.recordLegacyContextWarning(v178, l_stateNode_2);
        end;
        if l_warnAboutDeprecatedLifecycles_0 then
            v20.recordUnsafeLifecycleWarnings(v178, l_stateNode_2);
        end;
    end;
    l_processUpdateQueue_0(v178, v180, l_stateNode_2, v181);
    l_stateNode_2.state = v178.memoizedState;
    local v186 = type(v179);
    local v187 = nil;
    if type(v179) == "table" then
        v187 = v179.getDerivedStateFromProps;
    end;
    if v187 ~= nil and type(v187) == "function" then
        v90(v178, v179, v187, v180);
        l_stateNode_2.state = v178.memoizedState;
    end;
    if v186 == "table" and type(v179.getDerivedStateFromProps) ~= "function" and type(l_stateNode_2.getSnapshotBeforeUpdate) ~= "function" and (type(l_stateNode_2.UNSAFE_componentWillMount) == "function" or type(l_stateNode_2.componentWillMount) == "function") then
        v171(v178, l_stateNode_2);
        l_processUpdateQueue_0(v178, v180, l_stateNode_2, v181);
        l_stateNode_2.state = v178.memoizedState;
    end;
    if type(l_stateNode_2.componentDidMount) == "function" then
        if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
            v178.flags = bit32.bor(v178.flags, (bit32.bor(l_MountLayoutDev_0, l_Update_0)));
            return;
        else
            v178.flags = bit32.bor(v178.flags, l_Update_0);
        end;
    end;
end;
resumeMountClassInstance = function(v189, v190, v191, v192) --[[ Line: 1057 ]] --[[ Name: resumeMountClassInstance ]]
    -- upvalues: l_emptyContextObject_0 (copy), l_readContext_0 (copy), l_disableLegacyContext_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_resetHasForceUpdateBeforeProcessing_0 (copy), l_processUpdateQueue_0 (copy), l_hasContextChanged_0 (copy), l_checkHasForceUpdateAfterProcessing_0 (copy), l___DEV___0 (copy), l_enableDoubleInvokingEffects_0 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy), v90 (copy)
    local l_stateNode_3 = v189.stateNode;
    local l_memoizedProps_0 = v189.memoizedProps;
    l_stateNode_3.props = l_memoizedProps_0;
    local l_context_0 = l_stateNode_3.context;
    local l_contextType_1 = v190.contextType;
    local l_l_emptyContextObject_0_2 = l_emptyContextObject_0;
    if l_contextType_1 ~= nil and type(l_contextType_1) == "table" then
        l_l_emptyContextObject_0_2 = l_readContext_0(l_contextType_1);
    elseif not l_disableLegacyContext_0 then
        local v198 = l_getUnmaskedContext_0(v189, v190, true);
        l_l_emptyContextObject_0_2 = l_getMaskedContext_0(v189, v198);
    end;
    local l_getDerivedStateFromProps_0 = v190.getDerivedStateFromProps;
    local v200 = true;
    if type(l_getDerivedStateFromProps_0) ~= "function" then
        v200 = type(l_stateNode_3.getSnapshotBeforeUpdate) == "function";
    end;
    if not v200 and (type(l_stateNode_3.UNSAFE_componentWillReceiveProps) == "function" or type(l_stateNode_3.componentWillReceiveProps) == "function") and (l_memoizedProps_0 ~= v191 or l_context_0 ~= l_l_emptyContextObject_0_2) then
        callComponentWillReceiveProps(v189, l_stateNode_3, v191, l_l_emptyContextObject_0_2);
    end;
    l_resetHasForceUpdateBeforeProcessing_0();
    local l_memoizedState_2 = v189.memoizedState;
    l_stateNode_3.state = l_memoizedState_2;
    local l_l_memoizedState_2_0 = l_memoizedState_2;
    l_processUpdateQueue_0(v189, v191, l_stateNode_3, v192);
    l_l_memoizedState_2_0 = v189.memoizedState;
    if l_memoizedProps_0 == v191 and l_memoizedState_2 == l_l_memoizedState_2_0 and not l_hasContextChanged_0() and not l_checkHasForceUpdateAfterProcessing_0() then
        if type(l_stateNode_3.componentDidMount) == "function" then
            if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
                v189.flags = bit32.bor(v189.flags, l_MountLayoutDev_0, l_Update_0);
            else
                v189.flags = bit32.bor(v189.flags, l_Update_0);
            end;
        end;
        return false;
    else
        if l_getDerivedStateFromProps_0 ~= nil and type(l_getDerivedStateFromProps_0) == "function" then
            v90(v189, v190, l_getDerivedStateFromProps_0, v191);
            l_l_memoizedState_2_0 = v189.memoizedState;
        end;
        local v203 = l_checkHasForceUpdateAfterProcessing_0() or checkShouldComponentUpdate(v189, v190, l_memoizedProps_0, v191, l_memoizedState_2, l_l_memoizedState_2_0, l_l_emptyContextObject_0_2);
        if v203 then
            if not v200 and (type(l_stateNode_3.UNSAFE_componentWillMount) == "function" or type(l_stateNode_3.componentWillMount) == "function") then
                if type(l_stateNode_3.componentWillMount) == "function" then
                    l_stateNode_3:componentWillMount();
                end;
                if type(l_stateNode_3.UNSAFE_componentWillMount) == "function" then
                    l_stateNode_3:UNSAFE_componentWillMount();
                end;
            end;
            if type(l_stateNode_3.componentDidMount) == "function" then
                if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
                    v189.flags = bit32.bor(v189.flags, l_MountLayoutDev_0, l_Update_0);
                else
                    v189.flags = bit32.bor(v189.flags, l_Update_0);
                end;
            end;
        else
            if type(l_stateNode_3.componentDidMount) == "function" then
                if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
                    v189.flags = bit32.bor(v189.flags, l_MountLayoutDev_0, l_Update_0);
                else
                    v189.flags = bit32.bor(v189.flags, l_Update_0);
                end;
            end;
            v189.memoizedProps = v191;
            v189.memoizedState = l_l_memoizedState_2_0;
        end;
        l_stateNode_3.props = v191;
        l_stateNode_3.state = l_l_memoizedState_2_0;
        l_stateNode_3.context = l_l_emptyContextObject_0_2;
        return v203;
    end;
end;
return {
    adoptClassInstance = v142, 
    constructClassInstance = v167, 
    mountClassInstance = v188, 
    resumeMountClassInstance = resumeMountClassInstance, 
    updateClassInstance = function(v204, v205, v206, v207, v208) --[[ Line: 1205 ]] --[[ Name: updateClassInstance ]]
        -- upvalues: l_cloneUpdateQueue_0 (copy), l_resolveDefaultProps_0 (copy), l_emptyContextObject_0 (copy), l_readContext_0 (copy), l_disableLegacyContext_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_resetHasForceUpdateBeforeProcessing_0 (copy), l_processUpdateQueue_0 (copy), l_hasContextChanged_0 (copy), l_checkHasForceUpdateAfterProcessing_0 (copy), l_Update_0 (copy), l_Snapshot_0 (copy), v90 (copy)
        local l_stateNode_4 = v205.stateNode;
        l_cloneUpdateQueue_0(v204, v205);
        local l_memoizedProps_1 = v205.memoizedProps;
        local v211 = if v205.type == v205.elementType then l_memoizedProps_1 else l_resolveDefaultProps_0(v205.type, l_memoizedProps_1);
        l_stateNode_4.props = v211;
        local l_pendingProps_0 = v205.pendingProps;
        local l_context_1 = l_stateNode_4.context;
        local v214 = nil;
        local v215 = nil;
        if type(v206) == "table" then
            v214 = v206.contextType;
            v215 = v206.getDerivedStateFromProps;
        end;
        local l_l_emptyContextObject_0_3 = l_emptyContextObject_0;
        if type(v214) == "table" then
            l_l_emptyContextObject_0_3 = l_readContext_0(v214);
        elseif not l_disableLegacyContext_0 then
            local v217 = l_getUnmaskedContext_0(v205, v206, true);
            l_l_emptyContextObject_0_3 = l_getMaskedContext_0(v205, v217);
        end;
        local v218 = v215 ~= nil and type(v215) == "function" or l_stateNode_4.getSnapshotBeforeUpdate ~= nil and type(l_stateNode_4.getSnapshotBeforeUpdate) == "function";
        if not v218 and (l_stateNode_4.UNSAFE_componentWillReceiveProps ~= nil and type(l_stateNode_4.UNSAFE_componentWillReceiveProps) == "function" or l_stateNode_4.componentWillReceiveProps ~= nil and type(l_stateNode_4.componentWillReceiveProps) == "function") and (l_memoizedProps_1 ~= l_pendingProps_0 or l_context_1 ~= l_l_emptyContextObject_0_3) then
            callComponentWillReceiveProps(v205, l_stateNode_4, v207, l_l_emptyContextObject_0_3);
        end;
        l_resetHasForceUpdateBeforeProcessing_0();
        local l_memoizedState_3 = v205.memoizedState;
        l_stateNode_4.state = l_memoizedState_3;
        local l_state_3 = l_stateNode_4.state;
        l_processUpdateQueue_0(v205, v207, l_stateNode_4, v208);
        l_state_3 = v205.memoizedState;
        if l_memoizedProps_1 == l_pendingProps_0 and l_memoizedState_3 == l_state_3 and not l_hasContextChanged_0() and not l_checkHasForceUpdateAfterProcessing_0() then
            if l_stateNode_4.componentDidUpdate ~= nil and type(l_stateNode_4.componentDidUpdate) == "function" and (l_memoizedProps_1 ~= v204.memoizedProps or l_memoizedState_3 ~= v204.memoizedState) then
                v205.flags = bit32.bor(v205.flags, l_Update_0);
            end;
            if l_stateNode_4.getSnapshotBeforeUpdate ~= nil and type(l_stateNode_4.getSnapshotBeforeUpdate) == "function" and (l_memoizedProps_1 ~= v204.memoizedProps or l_memoizedState_3 ~= v204.memoizedState) then
                v205.flags = bit32.bor(v205.flags, l_Snapshot_0);
            end;
            return false;
        else
            if v215 ~= nil and type(v215) == "function" then
                v90(v205, v206, v215, v207);
                l_state_3 = v205.memoizedState;
            end;
            local v221 = l_checkHasForceUpdateAfterProcessing_0() or checkShouldComponentUpdate(v205, v206, v211, v207, l_memoizedState_3, l_state_3, l_l_emptyContextObject_0_3);
            if v221 then
                if not v218 and (l_stateNode_4.UNSAFE_componentWillUpdate ~= nil and type(l_stateNode_4.UNSAFE_componentWillUpdate) == "function" or l_stateNode_4.componentWillUpdate ~= nil and type(l_stateNode_4.componentWillUpdate) == "function") then
                    if l_stateNode_4.componentWillUpdate ~= nil and type(l_stateNode_4.componentWillUpdate) == "function" then
                        l_stateNode_4:componentWillUpdate(v207, l_state_3, l_l_emptyContextObject_0_3);
                    end;
                    if l_stateNode_4.UNSAFE_componentWillUpdate ~= nil and type(l_stateNode_4.UNSAFE_componentWillUpdate) == "function" then
                        l_stateNode_4:UNSAFE_componentWillUpdate(v207, l_state_3, l_l_emptyContextObject_0_3);
                    end;
                end;
                if l_stateNode_4.componentDidUpdate ~= nil and type(l_stateNode_4.componentDidUpdate) == "function" then
                    v205.flags = bit32.bor(v205.flags, l_Update_0);
                end;
                if l_stateNode_4.getSnapshotBeforeUpdate ~= nil and type(l_stateNode_4.getSnapshotBeforeUpdate) == "function" then
                    v205.flags = bit32.bor(v205.flags, l_Snapshot_0);
                end;
            else
                if l_stateNode_4.componentDidUpdate ~= nil and type(l_stateNode_4.componentDidUpdate) == "function" and (l_memoizedProps_1 ~= v204.memoizedProps or l_memoizedState_3 ~= v204.memoizedState) then
                    v205.flags = bit32.bor(v205.flags, l_Update_0);
                end;
                if l_stateNode_4.getSnapshotBeforeUpdate ~= nil and type(l_stateNode_4.getSnapshotBeforeUpdate) == "function" and (l_memoizedProps_1 ~= v204.memoizedProps or l_memoizedState_3 ~= v204.memoizedState) then
                    v205.flags = bit32.bor(v205.flags, l_Snapshot_0);
                end;
                v205.memoizedProps = v207;
                v205.memoizedState = l_state_3;
            end;
            l_stateNode_4.props = v207;
            l_stateNode_4.state = l_state_3;
            l_stateNode_4.context = l_l_emptyContextObject_0_3;
            return v221;
        end;
    end, 
    applyDerivedStateFromProps = v90, 
    emptyRefsObject = l___refs_0
};