local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v4 = require(script.Parent.ReactFiberLane);
local v5 = require(script.Parent["ReactUpdateQueue.new"]);
local v6 = require(l_Parent_0.React);
local v7 = require(script.Parent.ReactFiberFlags);
local l_Update_0 = v7.Update;
local l_Snapshot_0 = v7.Snapshot;
local l_MountLayoutDev_0 = v7.MountLayoutDev;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_debugRenderPhaseSideEffectsForStrictMode_0 = l_ReactFeatureFlags_0.debugRenderPhaseSideEffectsForStrictMode;
local l_disableLegacyContext_0 = l_ReactFeatureFlags_0.disableLegacyContext;
local l_enableDebugTracing_0 = l_ReactFeatureFlags_0.enableDebugTracing;
local l_enableSchedulingProfiler_0 = l_ReactFeatureFlags_0.enableSchedulingProfiler;
local l_warnAboutDeprecatedLifecycles_0 = l_ReactFeatureFlags_0.warnAboutDeprecatedLifecycles;
local l_enableDoubleInvokingEffects_0 = l_ReactFeatureFlags_0.enableDoubleInvokingEffects;
local v18 = require(script.Parent["ReactStrictModeWarnings.new"]);
local l_isMounted_0 = require(script.Parent.ReactFiberTreeReflection).isMounted;
local l_ReactInstanceMap_0 = require(l_Parent_0.Shared).ReactInstanceMap;
local l_get_0 = l_ReactInstanceMap_0.get;
local l_set_0 = l_ReactInstanceMap_0.set;
local l_shallowEqual_0 = require(l_Parent_0.Shared).shallowEqual;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_UninitializedState_0 = require(l_Parent_0.Shared).UninitializedState;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_REACT_CONTEXT_TYPE_0 = l_ReactSymbols_0.REACT_CONTEXT_TYPE;
local l_REACT_PROVIDER_TYPE_0 = l_ReactSymbols_0.REACT_PROVIDER_TYPE;
local l_resolveDefaultProps_0 = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps;
local v30 = require(script.Parent.ReactTypeOfMode);
local l_DebugTracingMode_0 = v30.DebugTracingMode;
local l_StrictMode_0 = v30.StrictMode;
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
local v43 = require(script.Parent["ReactFiberContext.new"]);
local l_cacheContext_0 = v43.cacheContext;
local l_getMaskedContext_0 = v43.getMaskedContext;
local l_getUnmaskedContext_0 = v43.getUnmaskedContext;
local l_hasContextChanged_0 = v43.hasContextChanged;
local l_emptyContextObject_0 = v43.emptyContextObject;
local l_readContext_0 = require(script.Parent["ReactFiberNewContext.new"]).readContext;
local v50 = require(script.Parent.DebugTracing);
local l_logForceUpdateScheduled_0 = v50.logForceUpdateScheduled;
local l_logStateUpdateScheduled_0 = v50.logStateUpdateScheduled;
local l_ConsolePatchingDev_0 = require(l_Parent_0.Shared).ConsolePatchingDev;
local l_disableLogs_0 = l_ConsolePatchingDev_0.disableLogs;
local l_reenableLogs_0 = l_ConsolePatchingDev_0.reenableLogs;
local v56 = require(script.Parent.SchedulingProfiler);
local l_markForceUpdateScheduled_0 = v56.markForceUpdateScheduled;
local l_markStateUpdateScheduled_0 = v56.markStateUpdateScheduled;
local v59 = {};
local l___refs_0 = v6.Component:extend("").__refs;
local v61 = nil;
local v62 = nil;
local v63 = nil;
local v64 = nil;
local v65 = nil;
local v66 = nil;
local v67 = nil;
local v68 = nil;
local v69 = nil;
local v70 = nil;
if _G.__DEV__ then
    v61 = {};
    v62 = {};
    v63 = {};
    v64 = {};
    v68 = {};
    v65 = {};
    v69 = {};
    v70 = {};
    local v71 = {};
    local l_v71_0 = v71 --[[ copy: 73 -> 82 ]];
    v67 = function(v73, v74) --[[ Line: 128 ]] --[[ Name: warnOnInvalidCallback ]]
        -- upvalues: l_v71_0 (copy), l_console_0 (copy)
        if v73 == nil or typeof(v73) == "function" then
            return;
        else
            local v75 = v74 .. "_" .. tostring(v73);
            if not l_v71_0[v75] then
                l_v71_0[v75] = true;
                l_console_0.error("%s(...): Expected the last optional `callback` argument to be a " .. "function. Instead received: %s.", v74, (tostring(v73)));
            end;
            return;
        end;
    end;
    v66 = function(_, _) --[[ Line: 144 ]] --[[ Name: warnOnUndefinedDerivedState ]]

    end;
end;
local function v87(v78, v79, v80, v81) --[[ Line: 187 ]] --[[ Name: applyDerivedStateFromProps ]]
    -- upvalues: l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_reenableLogs_0 (copy), v66 (ref), l_Object_0 (copy), l_NoLanes_0 (copy)
    local l_memoizedState_0 = v78.memoizedState;
    if _G.__DEV__ and l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v78.mode, l_StrictMode_0) ~= 0 then
        l_disableLogs_0();
        local l_status_0, l_result_0 = pcall(v80, v81, l_memoizedState_0);
        l_reenableLogs_0();
        if not l_status_0 then
            error(l_result_0);
        end;
    end;
    local v85 = v80(v81, l_memoizedState_0);
    if _G.__DEV__ then
        v66(v79, v85);
    end;
    local v86 = v85 == nil and l_memoizedState_0 or l_Object_0.assign({}, l_memoizedState_0, v85);
    v78.memoizedState = v86;
    if v78.lanes == l_NoLanes_0 then
        v78.updateQueue.baseState = v86;
    end;
end;
local v88 = nil;
local function v116() --[[ Line: 234 ]] --[[ Name: initializeClassComponentUpdater ]]
    -- upvalues: v88 (ref), l_isMounted_0 (copy), l_get_0 (copy), l_createUpdate_0 (copy), v67 (ref), l_enqueueUpdate_0 (copy), l_enableDebugTracing_0 (copy), l_DebugTracingMode_0 (copy), l_getComponentName_0 (copy), l_logStateUpdateScheduled_0 (copy), l_enableSchedulingProfiler_0 (copy), l_markStateUpdateScheduled_0 (copy), l_ReplaceState_0 (copy), l_ForceUpdate_0 (copy), l_logForceUpdateScheduled_0 (copy), l_markForceUpdateScheduled_0 (copy)
    local v89 = require(script.Parent["ReactFiberWorkLoop.new"]);
    local l_requestEventTime_0 = v89.requestEventTime;
    local l_requestUpdateLane_0 = v89.requestUpdateLane;
    local l_scheduleUpdateOnFiber_0 = v89.scheduleUpdateOnFiber;
    v88 = {
        isMounted = l_isMounted_0, 
        enqueueSetState = function(v93, v94, v95) --[[ Line: 242 ]] --[[ Name: enqueueSetState ]]
            -- upvalues: l_get_0 (ref), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), l_createUpdate_0 (ref), v67 (ref), l_enqueueUpdate_0 (ref), l_scheduleUpdateOnFiber_0 (copy), l_enableDebugTracing_0 (ref), l_DebugTracingMode_0 (ref), l_getComponentName_0 (ref), l_logStateUpdateScheduled_0 (ref), l_enableSchedulingProfiler_0 (ref), l_markStateUpdateScheduled_0 (ref)
            local v96 = l_get_0(v93);
            local v97 = l_requestEventTime_0();
            local v98 = l_requestUpdateLane_0(v96);
            local v99 = l_createUpdate_0(v97, v98);
            v99.payload = v94;
            if v95 ~= nil then
                if _G.__DEV__ then
                    v67(v95, "setState");
                end;
                v99.callback = v95;
            end;
            l_enqueueUpdate_0(v96, v99);
            l_scheduleUpdateOnFiber_0(v96, v98, v97);
            if _G.__DEV__ and l_enableDebugTracing_0 and bit32.band(v96.mode, l_DebugTracingMode_0) ~= 0 then
                local v100 = l_getComponentName_0(v96.type) or "Unknown";
                l_logStateUpdateScheduled_0(v100, v98, v94);
            end;
            if l_enableSchedulingProfiler_0 then
                l_markStateUpdateScheduled_0(v96, v98);
            end;
        end, 
        enqueueReplaceState = function(v101, v102, v103) --[[ Line: 272 ]] --[[ Name: enqueueReplaceState ]]
            -- upvalues: l_get_0 (ref), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), l_createUpdate_0 (ref), l_ReplaceState_0 (ref), v67 (ref), l_enqueueUpdate_0 (ref), l_scheduleUpdateOnFiber_0 (copy), l_enableDebugTracing_0 (ref), l_DebugTracingMode_0 (ref), l_getComponentName_0 (ref), l_logStateUpdateScheduled_0 (ref), l_enableSchedulingProfiler_0 (ref), l_markStateUpdateScheduled_0 (ref)
            local v104 = l_get_0(v101);
            local v105 = l_requestEventTime_0();
            local v106 = l_requestUpdateLane_0(v104);
            local v107 = l_createUpdate_0(v105, v106);
            v107.tag = l_ReplaceState_0;
            v107.payload = v102;
            if v103 ~= nil then
                if _G.__DEV__ then
                    v67(v103, "replaceState");
                end;
                v107.callback = v103;
            end;
            l_enqueueUpdate_0(v104, v107);
            l_scheduleUpdateOnFiber_0(v104, v106, v105);
            if _G.__DEV__ and l_enableDebugTracing_0 and bit32.band(v104.mode, l_DebugTracingMode_0) ~= 0 then
                local v108 = l_getComponentName_0(v104.type) or "Unknown";
                l_logStateUpdateScheduled_0(v108, v106, v102);
            end;
            if l_enableSchedulingProfiler_0 then
                l_markStateUpdateScheduled_0(v104, v106);
            end;
        end, 
        enqueueForceUpdate = function(v109, v110) --[[ Line: 304 ]] --[[ Name: enqueueForceUpdate ]]
            -- upvalues: l_get_0 (ref), l_requestEventTime_0 (copy), l_requestUpdateLane_0 (copy), l_createUpdate_0 (ref), l_ForceUpdate_0 (ref), v67 (ref), l_enqueueUpdate_0 (ref), l_scheduleUpdateOnFiber_0 (copy), l_enableDebugTracing_0 (ref), l_DebugTracingMode_0 (ref), l_getComponentName_0 (ref), l_logForceUpdateScheduled_0 (ref), l_enableSchedulingProfiler_0 (ref), l_markForceUpdateScheduled_0 (ref)
            local v111 = l_get_0(v109);
            local v112 = l_requestEventTime_0();
            local v113 = l_requestUpdateLane_0(v111);
            local v114 = l_createUpdate_0(v112, v113);
            v114.tag = l_ForceUpdate_0;
            if v110 ~= nil then
                if _G.__DEV__ then
                    v67(v110, "forceUpdate");
                end;
                v114.callback = v110;
            end;
            l_enqueueUpdate_0(v111, v114);
            l_scheduleUpdateOnFiber_0(v111, v113, v112);
            if _G.__DEV__ and l_enableDebugTracing_0 and bit32.band(v111.mode, l_DebugTracingMode_0) ~= 0 then
                local v115 = l_getComponentName_0(v111.type) or "Unknown";
                l_logForceUpdateScheduled_0(v115, v113);
            end;
            if l_enableSchedulingProfiler_0 then
                l_markForceUpdateScheduled_0(v111, v113);
            end;
        end
    };
end;
local function _() --[[ Line: 338 ]] --[[ Name: getClassComponentUpdater ]]
    -- upvalues: v88 (ref), v116 (copy)
    if v88 == nil then
        v116();
    end;
    return v88;
end;
checkShouldComponentUpdate = function(v118, v119, v120, v121, v122, v123, v124) --[[ Line: 345 ]] --[[ Name: checkShouldComponentUpdate ]]
    -- upvalues: l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_reenableLogs_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_shallowEqual_0 (copy)
    local l_stateNode_0 = v118.stateNode;
    if typeof(l_stateNode_0.shouldComponentUpdate) == "function" then
        if _G.__DEV__ and l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v118.mode, l_StrictMode_0) ~= 0 then
            l_disableLogs_0();
            local l_status_1, l_result_1 = pcall(l_stateNode_0.shouldComponentUpdate, l_stateNode_0, v121, v123, v124);
            l_reenableLogs_0();
            if not l_status_1 then
                error(l_result_1);
            end;
        end;
        local v128 = l_stateNode_0:shouldComponentUpdate(v121, v123, v124);
        if _G.__DEV__ and v128 == nil then
            l_console_0.error("%s.shouldComponentUpdate(): Returned nil instead of a " .. "boolean value. Make sure to return true or false.", l_getComponentName_0(v119) or "Component");
        end;
        return v128;
    elseif typeof(v119) == "table" and v119.isPureReactComponent then
        return not l_shallowEqual_0(v120, v121) or not l_shallowEqual_0(v122, v123);
    else
        return true;
    end;
end;
local function v136(v129, v130, v131) --[[ Line: 403 ]] --[[ Name: checkClassInstance ]]
    -- upvalues: l_getComponentName_0 (copy), l_console_0 (copy), l_disableLegacyContext_0 (copy), v69 (ref), v63 (ref)
    local l_stateNode_1 = v129.stateNode;
    if _G.__DEV__ then
        local v133 = l_getComponentName_0(v130) or "Component";
        if not l_stateNode_1.render then
            if typeof(v130.render) == "function" then
                l_console_0.error("%s(...): No `render` method found on the returned component " .. "instance: did you accidentally return an object from the constructor?", v133);
            else
                l_console_0.error("%s(...): No `render` method found on the returned component " .. "instance: you may have forgotten to define `render`.", v133);
            end;
        end;
        if l_stateNode_1.getInitialState and not l_stateNode_1.getInitialState.isReactClassApproved and not l_stateNode_1.state then
            l_console_0.error("getInitialState was defined on %s, a plain JavaScript class. " .. "This is only supported for classes created using React.createClass. " .. "Did you mean to define a state property instead?", v133);
        end;
        if l_stateNode_1.getDefaultProps and not l_stateNode_1.getDefaultProps.isReactClassApproved then
            l_console_0.error("getDefaultProps was defined on %s, a plain JavaScript class. " .. "This is only supported for classes created using React.createClass. " .. "Use a static property to define defaultProps instead.", v133);
        end;
        if l_stateNode_1.propTypes and not v130.propTypes then
            l_console_0.error("propTypes was defined as an instance property on %s. Use a static " .. "property to define propTypes instead.", v133);
        end;
        if l_stateNode_1.contextType and not v130.contextType then
            l_console_0.error("contextType was defined as an instance property on %s. Use a static " .. "property to define contextType instead.", v133);
        end;
        if l_disableLegacyContext_0 then
            if v130.childContextTypes then
                l_console_0.error("%s uses the legacy childContextTypes API which is no longer supported. " .. "Use React.createContext() instead.", v133);
            end;
            if v130.contextTypes then
                l_console_0.error("%s uses the legacy contextTypes API which is no longer supported. " .. "Use React.createContext() with static contextType instead.", v133);
            end;
        else
            if l_stateNode_1.contextTypes and not v130.contextTypes then
                l_console_0.error("contextTypes was defined as an instance property on %s. Use a static " .. "property to define contextTypes instead.", v133);
            end;
            if typeof(v130) == "table" and v130.contextType and v130.contextTypes and not v69[v130] then
                v69[v130] = true;
                l_console_0.error("%s declares both contextTypes and contextType static properties. " .. "The legacy contextTypes property will be ignored.", v133);
            end;
        end;
        if typeof(l_stateNode_1.componentShouldUpdate) == "function" then
            l_console_0.error("%s has a method called " .. "componentShouldUpdate(). Did you mean shouldComponentUpdate()? " .. "The name is phrased as a question because the function is " .. "expected to return a value.", v133);
        end;
        if typeof(v130) == "table" and v130.isPureReactComponent and l_stateNode_1.shouldComponentUpdate ~= nil then
            l_console_0.error("%s has a method called shouldComponentUpdate(). " .. "shouldComponentUpdate should not be used when extending React.PureComponent. " .. "Please extend React.Component if shouldComponentUpdate is used.", l_getComponentName_0(v130) or "A pure component");
        end;
        if typeof(l_stateNode_1.componentDidUnmount) == "function" then
            l_console_0.error("%s has a method called " .. "componentDidUnmount(). But there is no such lifecycle method. " .. "Did you mean componentWillUnmount()?", v133);
        end;
        if typeof(l_stateNode_1.componentDidReceiveProps) == "function" then
            l_console_0.error("%s has a method called " .. "componentDidReceiveProps(). But there is no such lifecycle method. " .. "If you meant to update the state in response to changing props, " .. "use componentWillReceiveProps(). If you meant to fetch data or " .. "run side-effects or mutations after React has updated the UI, use componentDidUpdate().", v133);
        end;
        if typeof(l_stateNode_1.componentWillRecieveProps) == "function" then
            l_console_0.error("%s has a method called " .. "componentWillRecieveProps(). Did you mean componentWillReceiveProps()?", v133);
        end;
        if typeof(l_stateNode_1.UNSAFE_componentWillRecieveProps) == "function" then
            l_console_0.error("%s has a method called " .. "UNSAFE_componentWillRecieveProps(). Did you mean UNSAFE_componentWillReceiveProps()?", v133);
        end;
        local v134 = l_stateNode_1.props ~= v131;
        if l_stateNode_1.props ~= nil and v134 then
            l_console_0.error("%s(...): When calling super() in `%s`, make sure to pass " .. "up the same props that your component's constructor was passed.", v133, v133);
        end;
        if rawget(l_stateNode_1, "defaultProps") then
            l_console_0.error("Setting defaultProps as an instance property on %s is not supported and will be ignored." .. " Instead, define defaultProps as a static property on %s.", v133, v133);
        end;
        if typeof(l_stateNode_1.getSnapshotBeforeUpdate) == "function" and typeof(l_stateNode_1.componentDidUpdate) ~= "function" and not v63[v130] then
            v63[v130] = true;
            l_console_0.error("%s: getSnapshotBeforeUpdate() should be used with componentDidUpdate(). " .. "This component defines getSnapshotBeforeUpdate() only.", l_getComponentName_0(v130));
        end;
        local l_state_0 = l_stateNode_1.state;
        if l_state_0 ~= nil and typeof(l_state_0) ~= "table" then
            l_console_0.error("%s.state: must be set to an object or nil", v133);
        end;
        if typeof(v130) == "table" and typeof(l_stateNode_1.getChildContext) == "function" and typeof(v130.childContextTypes) ~= "table" then
            l_console_0.error("%s.getChildContext(): childContextTypes must be defined in order to " .. "use getChildContext().", v133);
        end;
    end;
end;
local function v139(v137, v138) --[[ Line: 637 ]] --[[ Name: adoptClassInstance ]]
    -- upvalues: v88 (ref), v116 (copy), l_set_0 (copy), v59 (copy)
    if v88 == nil then
        v116();
    end;
    v138.__updater = v88;
    v137.stateNode = v138;
    l_set_0(v138, v137);
    if _G.__DEV__ then
        v138._reactInternalInstance = v59;
    end;
end;
local function v164(v140, v141, v142) --[[ Line: 648 ]] --[[ Name: constructClassInstance ]]
    -- upvalues: l_emptyContextObject_0 (copy), l_REACT_CONTEXT_TYPE_0 (copy), v70 (ref), l_REACT_PROVIDER_TYPE_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_readContext_0 (copy), l_disableLegacyContext_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_reenableLogs_0 (copy), v88 (ref), v116 (copy), l_set_0 (copy), v59 (copy), l_UninitializedState_0 (copy), v62 (ref), v64 (ref), l_cacheContext_0 (copy)
    local v143 = false;
    local l_l_emptyContextObject_0_0 = l_emptyContextObject_0;
    local l_l_emptyContextObject_0_1 = l_emptyContextObject_0;
    local l_contextType_0 = v141.contextType;
    if _G.__DEV__ and v141.contextType ~= nil then
        local v147 = true;
        if l_contextType_0 ~= nil then
            v147 = false;
            if l_contextType_0["$$typeof"] == l_REACT_CONTEXT_TYPE_0 then
                v147 = l_contextType_0._context == nil;
            end;
        end;
        if not v147 and not v70[v141] then
            v70[v141] = true;
            local v148 = "";
            if l_contextType_0 == nil then
                v148 = " However, it is set to nil. " .. "This can be caused by a typo or by mixing up named and default imports. " .. "This can also happen due to a circular dependency, so " .. "try moving the createContext() call to a separate file.";
            elseif typeof(l_contextType_0) ~= "table" then
                v148 = " However, it is set to a " .. typeof(l_contextType_0) .. ".";
            elseif l_contextType_0["$$typeof"] == l_REACT_PROVIDER_TYPE_0 then
                v148 = " Did you accidentally pass the Context.Provider instead?";
            elseif l_contextType_0._context ~= nil then
                v148 = " Did you accidentally pass the Context.Consumer instead?";
            else
                v148 = v148 .. " However, it is set to an object with keys {";
                for v149, _ in pairs(l_contextType_0) do
                    v148 = v148 .. v149 .. ", ";
                end;
                v148 = v148 .. "}.";
            end;
            l_console_0.error("%s defines an invalid contextType. " .. "contextType should point to the Context object returned by React.createContext().%s", l_getComponentName_0(v141) or "Component", v148);
        end;
    end;
    if l_contextType_0 ~= nil and typeof(l_contextType_0) == "table" then
        l_l_emptyContextObject_0_1 = l_readContext_0(l_contextType_0);
    elseif not l_disableLegacyContext_0 then
        l_l_emptyContextObject_0_0 = l_getUnmaskedContext_0(v140, v141, true);
        v143 = v141.contextTypes ~= nil;
        l_l_emptyContextObject_0_1 = v143 and l_getMaskedContext_0(v140, l_l_emptyContextObject_0_0) or l_emptyContextObject_0;
    end;
    if _G.__DEV__ and l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v140.mode, l_StrictMode_0) ~= 0 then
        l_disableLogs_0();
        local l_status_2, l_result_2 = pcall(v141.__ctor, v142, l_l_emptyContextObject_0_1);
        l_reenableLogs_0();
        if not l_status_2 then
            error(l_result_2);
        end;
    end;
    local v153 = v141.__ctor(v142, l_l_emptyContextObject_0_1);
    v140.memoizedState = v153.state;
    local l_memoizedState_1 = v140.memoizedState;
    if v88 == nil then
        v116();
    end;
    v153.__updater = v88;
    v140.stateNode = v153;
    l_set_0(v153, v140);
    if _G.__DEV__ then
        v153._reactInternalInstance = v59;
    end;
    if _G.__DEV__ then
        if typeof(v141.getDerivedStateFromProps) == "function" and l_memoizedState_1 == l_UninitializedState_0 then
            local v155 = l_getComponentName_0(v141) or "Component";
            if not v62[v155] then
                v62[v155] = true;
                l_console_0.error("`%s` uses `getDerivedStateFromProps` but its initial state has not been initialized. " .. "This is not recommended. Instead, define the initial state by " .. "passing an object to `self:setState` in the `init` method of `%s`. " .. "This ensures that `getDerivedStateFromProps` arguments have a consistent shape.", v155, v155);
            end;
        end;
        if typeof(v141.getDerivedStateFromProps) == "function" or typeof(v153.getSnapshotBeforeUpdate) == "function" then
            local v156 = nil;
            local v157 = nil;
            local v158 = nil;
            if typeof(v153.componentWillMount) == "function" then
                v156 = "componentWillMount";
            elseif typeof(v153.UNSAFE_componentWillMount) == "function" then
                v156 = "UNSAFE_componentWillMount";
            end;
            if typeof(v153.componentWillReceiveProps) == "function" then
                v157 = "componentWillReceiveProps";
            elseif typeof(v153.UNSAFE_componentWillReceiveProps) == "function" then
                v157 = "UNSAFE_componentWillReceiveProps";
            end;
            if typeof(v153.componentWillUpdate) == "function" then
                v158 = "componentWillUpdate";
            elseif typeof(v153.UNSAFE_componentWillUpdate) == "function" then
                v158 = "UNSAFE_componentWillUpdate";
            end;
            if v156 ~= nil or v157 ~= nil or v158 ~= nil then
                local v159 = l_getComponentName_0(v141) or "Component";
                local v160 = nil;
                v160 = typeof(v141.getDerivedStateFromProps) == "function" and "getDerivedStateFromProps()" or "getSnapshotBeforeUpdate()";
                local v161 = nil;
                v161 = if v156 ~= nil then "\n  " .. tostring(v156) else "";
                local v162 = nil;
                v162 = if v157 ~= nil then "\n  " .. tostring(v157) else "";
                local v163 = nil;
                v163 = if v158 ~= nil then "\n  " .. tostring(v158) else "";
                if not v64[v159] then
                    v64[v159] = true;
                    l_console_0.error("Unsafe legacy lifecycles will not be called for components using new component APIs.\n\n" .. "%s uses %s but also contains the following legacy lifecycles:%s%s%s\n\n" .. "The above lifecycles should be removed. Learn more about this warning here:\n" .. "https://reactjs.org/link/unsafe-component-lifecycles", v159, v160, v161, v162, v163);
                end;
            end;
        end;
    end;
    if v143 then
        l_cacheContext_0(v140, l_l_emptyContextObject_0_0, l_l_emptyContextObject_0_1);
    end;
    return v153;
end;
local function v168(v165, v166) --[[ Line: 867 ]] --[[ Name: callComponentWillMount ]]
    -- upvalues: l_console_0 (copy), l_getComponentName_0 (copy), v88 (ref), v116 (copy)
    local l_state_1 = v166.state;
    if typeof(v166.componentWillMount) == "function" then
        v166:componentWillMount();
    end;
    if typeof(v166.UNSAFE_componentWillMount) == "function" then
        v166:UNSAFE_componentWillMount();
    end;
    if l_state_1 ~= v166.state then
        if _G.__DEV__ then
            l_console_0.error("%s.componentWillMount(): Assigning directly to this.state is " .. "deprecated (except inside a component's " .. "constructor). Use setState instead.", l_getComponentName_0(v165.type) or "Component");
        end;
        if v88 == nil then
            v116();
        end;
        v88.enqueueReplaceState(v166, v166.state, nil);
    end;
end;
callComponentWillReceiveProps = function(v169, v170, v171, v172) --[[ Line: 893 ]] --[[ Name: callComponentWillReceiveProps ]]
    -- upvalues: l_getComponentName_0 (copy), v61 (ref), l_console_0 (copy), v88 (ref), v116 (copy)
    local l_state_2 = v170.state;
    if typeof(v170.componentWillReceiveProps) == "function" then
        v170:componentWillReceiveProps(v171, v172);
    end;
    if typeof(v170.UNSAFE_componentWillReceiveProps) == "function" then
        v170:UNSAFE_componentWillReceiveProps(v171, v172);
    end;
    if v170.state ~= l_state_2 then
        if _G.__DEV__ then
            local v174 = l_getComponentName_0(v169.type) or "Component";
            if not v61[v174] then
                v61[v174] = true;
                l_console_0.error("%s.componentWillReceiveProps(): Assigning directly to " .. "this.state is deprecated (except inside a component's " .. "constructor). Use setState instead.", v174);
            end;
        end;
        if v88 == nil then
            v116();
        end;
        v88.enqueueReplaceState(v170, v170.state, nil);
    end;
end;
local function v184(v175, v176, v177, v178) --[[ Line: 928 ]] --[[ Name: mountClassInstance ]]
    -- upvalues: v136 (copy), l___refs_0 (copy), l_initializeUpdateQueue_0 (copy), l_readContext_0 (copy), l_disableLegacyContext_0 (copy), l_emptyContextObject_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_getComponentName_0 (copy), v68 (ref), l_console_0 (copy), l_StrictMode_0 (copy), v18 (copy), l_warnAboutDeprecatedLifecycles_0 (copy), l_processUpdateQueue_0 (copy), v87 (copy), v168 (copy), l_enableDoubleInvokingEffects_0 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy)
    if _G.__DEV__ then
        v136(v175, v176, v177);
    end;
    local l_stateNode_2 = v175.stateNode;
    l_stateNode_2.props = v177;
    l_stateNode_2.state = v175.memoizedState;
    l_stateNode_2.__refs = l___refs_0;
    l_initializeUpdateQueue_0(v175);
    local v180 = nil;
    if typeof(v176) == "table" then
        v180 = v176.contextType;
    end;
    if v180 ~= nil and typeof(v180) == "table" then
        l_stateNode_2.context = l_readContext_0(v180);
    elseif l_disableLegacyContext_0 then
        l_stateNode_2.context = l_emptyContextObject_0;
    else
        local v181 = l_getUnmaskedContext_0(v175, v176, true);
        l_stateNode_2.context = l_getMaskedContext_0(v175, v181);
    end;
    if _G.__DEV__ then
        if l_stateNode_2.state == v177 then
            local v182 = l_getComponentName_0(v176) or "Component";
            if not v68[v182] then
                v68[v182] = true;
                l_console_0.error("%s: It is not recommended to assign props directly to state " .. "because updates to props won't be reflected in state. " .. "In most cases, it is better to use props directly.", v182);
            end;
        end;
        if bit32.band(v175.mode, l_StrictMode_0) ~= 0 then
            v18.recordLegacyContextWarning(v175, l_stateNode_2);
        end;
        if l_warnAboutDeprecatedLifecycles_0 then
            v18.recordUnsafeLifecycleWarnings(v175, l_stateNode_2);
        end;
    end;
    l_processUpdateQueue_0(v175, v177, l_stateNode_2, v178);
    l_stateNode_2.state = v175.memoizedState;
    local v183 = nil;
    if typeof(v176) == "table" then
        v183 = v176.getDerivedStateFromProps;
    end;
    if typeof(v183) == "function" then
        v87(v175, v176, v183, v177);
        l_stateNode_2.state = v175.memoizedState;
    end;
    if typeof(v176) == "table" and typeof(v176.getDerivedStateFromProps) ~= "function" and typeof(l_stateNode_2.getSnapshotBeforeUpdate) ~= "function" and (typeof(l_stateNode_2.UNSAFE_componentWillMount) == "function" or typeof(l_stateNode_2.componentWillMount) == "function") then
        v168(v175, l_stateNode_2);
        l_processUpdateQueue_0(v175, v177, l_stateNode_2, v178);
        l_stateNode_2.state = v175.memoizedState;
    end;
    if typeof(l_stateNode_2.componentDidMount) == "function" then
        if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
            v175.flags = bit32.bor(v175.flags, (bit32.bor(l_MountLayoutDev_0, l_Update_0)));
            return;
        else
            v175.flags = bit32.bor(v175.flags, l_Update_0);
        end;
    end;
end;
resumeMountClassInstance = function(v185, v186, v187, v188) --[[ Line: 1035 ]] --[[ Name: resumeMountClassInstance ]]
    -- upvalues: l_emptyContextObject_0 (copy), l_readContext_0 (copy), l_disableLegacyContext_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_resetHasForceUpdateBeforeProcessing_0 (copy), l_processUpdateQueue_0 (copy), l_hasContextChanged_0 (copy), l_checkHasForceUpdateAfterProcessing_0 (copy), l_enableDoubleInvokingEffects_0 (copy), l_MountLayoutDev_0 (copy), l_Update_0 (copy), v87 (copy)
    local l_stateNode_3 = v185.stateNode;
    local l_memoizedProps_0 = v185.memoizedProps;
    l_stateNode_3.props = l_memoizedProps_0;
    local l_context_0 = l_stateNode_3.context;
    local l_contextType_1 = v186.contextType;
    local l_l_emptyContextObject_0_2 = l_emptyContextObject_0;
    if l_contextType_1 ~= nil and typeof(l_contextType_1) == "table" then
        l_l_emptyContextObject_0_2 = l_readContext_0(l_contextType_1);
    elseif not l_disableLegacyContext_0 then
        local v194 = l_getUnmaskedContext_0(v185, v186, true);
        l_l_emptyContextObject_0_2 = l_getMaskedContext_0(v185, v194);
    end;
    local l_getDerivedStateFromProps_0 = v186.getDerivedStateFromProps;
    local v196 = true;
    if typeof(l_getDerivedStateFromProps_0) ~= "function" then
        v196 = typeof(l_stateNode_3.getSnapshotBeforeUpdate) == "function";
    end;
    if not v196 and (typeof(l_stateNode_3.UNSAFE_componentWillReceiveProps) == "function" or typeof(l_stateNode_3.componentWillReceiveProps) == "function") and (l_memoizedProps_0 ~= v187 or l_context_0 ~= l_l_emptyContextObject_0_2) then
        callComponentWillReceiveProps(v185, l_stateNode_3, v187, l_l_emptyContextObject_0_2);
    end;
    l_resetHasForceUpdateBeforeProcessing_0();
    local l_memoizedState_2 = v185.memoizedState;
    l_stateNode_3.state = l_memoizedState_2;
    local l_l_memoizedState_2_0 = l_memoizedState_2;
    l_processUpdateQueue_0(v185, v187, l_stateNode_3, v188);
    l_l_memoizedState_2_0 = v185.memoizedState;
    if l_memoizedProps_0 == v187 and l_memoizedState_2 == l_l_memoizedState_2_0 and not l_hasContextChanged_0() and not l_checkHasForceUpdateAfterProcessing_0() then
        if typeof(l_stateNode_3.componentDidMount) == "function" then
            if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
                v185.flags = bit32.bor(v185.flags, l_MountLayoutDev_0, l_Update_0);
            else
                v185.flags = bit32.bor(v185.flags, l_Update_0);
            end;
        end;
        return false;
    else
        if typeof(l_getDerivedStateFromProps_0) == "function" then
            v87(v185, v186, l_getDerivedStateFromProps_0, v187);
            l_l_memoizedState_2_0 = v185.memoizedState;
        end;
        local v199 = l_checkHasForceUpdateAfterProcessing_0() or checkShouldComponentUpdate(v185, v186, l_memoizedProps_0, v187, l_memoizedState_2, l_l_memoizedState_2_0, l_l_emptyContextObject_0_2);
        if v199 then
            if not v196 and (typeof(l_stateNode_3.UNSAFE_componentWillMount) == "function" or typeof(l_stateNode_3.componentWillMount) == "function") then
                if typeof(l_stateNode_3.componentWillMount) == "function" then
                    l_stateNode_3:componentWillMount();
                end;
                if typeof(l_stateNode_3.UNSAFE_componentWillMount) == "function" then
                    l_stateNode_3:UNSAFE_componentWillMount();
                end;
            end;
            if typeof(l_stateNode_3.componentDidMount) == "function" then
                if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
                    v185.flags = bit32.bor(v185.flags, l_MountLayoutDev_0, l_Update_0);
                else
                    v185.flags = bit32.bor(v185.flags, l_Update_0);
                end;
            end;
        else
            if typeof(l_stateNode_3.componentDidMount) == "function" then
                if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
                    v185.flags = bit32.bor(v185.flags, l_MountLayoutDev_0, l_Update_0);
                else
                    v185.flags = bit32.bor(v185.flags, l_Update_0);
                end;
            end;
            v185.memoizedProps = v187;
            v185.memoizedState = l_l_memoizedState_2_0;
        end;
        l_stateNode_3.props = v187;
        l_stateNode_3.state = l_l_memoizedState_2_0;
        l_stateNode_3.context = l_l_emptyContextObject_0_2;
        return v199;
    end;
end;
return {
    adoptClassInstance = v139, 
    constructClassInstance = v164, 
    mountClassInstance = v184, 
    resumeMountClassInstance = resumeMountClassInstance, 
    updateClassInstance = function(v200, v201, v202, v203, v204) --[[ Line: 1183 ]] --[[ Name: updateClassInstance ]]
        -- upvalues: l_cloneUpdateQueue_0 (copy), l_resolveDefaultProps_0 (copy), l_emptyContextObject_0 (copy), l_readContext_0 (copy), l_disableLegacyContext_0 (copy), l_getUnmaskedContext_0 (copy), l_getMaskedContext_0 (copy), l_resetHasForceUpdateBeforeProcessing_0 (copy), l_processUpdateQueue_0 (copy), l_hasContextChanged_0 (copy), l_checkHasForceUpdateAfterProcessing_0 (copy), l_Update_0 (copy), l_Snapshot_0 (copy), v87 (copy)
        local l_stateNode_4 = v201.stateNode;
        l_cloneUpdateQueue_0(v200, v201);
        local l_memoizedProps_1 = v201.memoizedProps;
        local v207 = v201.type == v201.elementType and l_memoizedProps_1 or l_resolveDefaultProps_0(v201.type, l_memoizedProps_1);
        l_stateNode_4.props = v207;
        local l_pendingProps_0 = v201.pendingProps;
        local l_context_1 = l_stateNode_4.context;
        local v210 = nil;
        local v211 = nil;
        if typeof(v202) == "table" then
            v210 = v202.contextType;
            v211 = v202.getDerivedStateFromProps;
        end;
        local l_l_emptyContextObject_0_3 = l_emptyContextObject_0;
        if typeof(v210) == "table" then
            l_l_emptyContextObject_0_3 = l_readContext_0(v210);
        elseif not l_disableLegacyContext_0 then
            local v213 = l_getUnmaskedContext_0(v201, v202, true);
            l_l_emptyContextObject_0_3 = l_getMaskedContext_0(v201, v213);
        end;
        local v214 = true;
        if typeof(v211) ~= "function" then
            v214 = typeof(l_stateNode_4.getSnapshotBeforeUpdate) == "function";
        end;
        if not v214 and (typeof(l_stateNode_4.UNSAFE_componentWillReceiveProps) == "function" or typeof(l_stateNode_4.componentWillReceiveProps) == "function") and (l_memoizedProps_1 ~= l_pendingProps_0 or l_context_1 ~= l_l_emptyContextObject_0_3) then
            callComponentWillReceiveProps(v201, l_stateNode_4, v203, l_l_emptyContextObject_0_3);
        end;
        l_resetHasForceUpdateBeforeProcessing_0();
        local l_memoizedState_3 = v201.memoizedState;
        l_stateNode_4.state = l_memoizedState_3;
        local l_state_3 = l_stateNode_4.state;
        l_processUpdateQueue_0(v201, v203, l_stateNode_4, v204);
        l_state_3 = v201.memoizedState;
        if l_memoizedProps_1 == l_pendingProps_0 and l_memoizedState_3 == l_state_3 and not l_hasContextChanged_0() and not l_checkHasForceUpdateAfterProcessing_0() then
            if typeof(l_stateNode_4.componentDidUpdate) == "function" and (l_memoizedProps_1 ~= v200.memoizedProps or l_memoizedState_3 ~= v200.memoizedState) then
                v201.flags = bit32.bor(v201.flags, l_Update_0);
            end;
            if typeof(l_stateNode_4.getSnapshotBeforeUpdate) == "function" and (l_memoizedProps_1 ~= v200.memoizedProps or l_memoizedState_3 ~= v200.memoizedState) then
                v201.flags = bit32.bor(v201.flags, l_Snapshot_0);
            end;
            return false;
        else
            if typeof(v211) == "function" then
                v87(v201, v202, v211, v203);
                l_state_3 = v201.memoizedState;
            end;
            local v217 = l_checkHasForceUpdateAfterProcessing_0() or checkShouldComponentUpdate(v201, v202, v207, v203, l_memoizedState_3, l_state_3, l_l_emptyContextObject_0_3);
            if v217 then
                if not v214 and (typeof(l_stateNode_4.UNSAFE_componentWillUpdate) == "function" or typeof(l_stateNode_4.componentWillUpdate) == "function") then
                    if typeof(l_stateNode_4.componentWillUpdate) == "function" then
                        l_stateNode_4:componentWillUpdate(v203, l_state_3, l_l_emptyContextObject_0_3);
                    end;
                    if typeof(l_stateNode_4.UNSAFE_componentWillUpdate) == "function" then
                        l_stateNode_4:UNSAFE_componentWillUpdate(v203, l_state_3, l_l_emptyContextObject_0_3);
                    end;
                end;
                if typeof(l_stateNode_4.componentDidUpdate) == "function" then
                    v201.flags = bit32.bor(v201.flags, l_Update_0);
                end;
                if typeof(l_stateNode_4.getSnapshotBeforeUpdate) == "function" then
                    v201.flags = bit32.bor(v201.flags, l_Snapshot_0);
                end;
            else
                if typeof(l_stateNode_4.componentDidUpdate) == "function" and (l_memoizedProps_1 ~= v200.memoizedProps or l_memoizedState_3 ~= v200.memoizedState) then
                    v201.flags = bit32.bor(v201.flags, l_Update_0);
                end;
                if typeof(l_stateNode_4.getSnapshotBeforeUpdate) == "function" and (l_memoizedProps_1 ~= v200.memoizedProps or l_memoizedState_3 ~= v200.memoizedState) then
                    v201.flags = bit32.bor(v201.flags, l_Snapshot_0);
                end;
                v201.memoizedProps = v203;
                v201.memoizedState = l_state_3;
            end;
            l_stateNode_4.props = v203;
            l_stateNode_4.state = l_state_3;
            l_stateNode_4.context = l_l_emptyContextObject_0_3;
            return v217;
        end;
    end, 
    applyDerivedStateFromProps = v87, 
    emptyRefsObject = l___refs_0
};