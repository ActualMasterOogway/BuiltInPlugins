local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v1.Object;
local l_Array_0 = v1.Array;
local l_inspect_0 = v1.util.inspect;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactInternalTypes);
local v8 = require(script.Parent.ReactRootTags);
local v9 = require(script.Parent.ReactWorkTags);
local v10 = require(script.Parent.ReactTypeOfMode);
local v11 = require(script.Parent.ReactFiberLane);
local _ = require(script.Parent.ReactFiberHostConfig);
local _ = require(script.Parent.ReactFiberOffscreenComponent);
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_enableProfilerTimer_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableProfilerTimer;
local v16 = require(script.Parent.ReactFiberFlags);
local l_NoFlags_0 = v16.NoFlags;
local l_Placement_0 = v16.Placement;
local l_StaticMask_0 = v16.StaticMask;
local l_ConcurrentRoot_0 = v8.ConcurrentRoot;
local l_BlockingRoot_0 = v8.BlockingRoot;
local l_IndeterminateComponent_0 = v9.IndeterminateComponent;
local l_ClassComponent_0 = v9.ClassComponent;
local l_HostRoot_0 = v9.HostRoot;
local l_HostComponent_0 = v9.HostComponent;
local l_HostText_0 = v9.HostText;
local l_HostPortal_0 = v9.HostPortal;
local l_ForwardRef_0 = v9.ForwardRef;
local l_Fragment_0 = v9.Fragment;
local l_Mode_0 = v9.Mode;
local l_ContextProvider_0 = v9.ContextProvider;
local l_ContextConsumer_0 = v9.ContextConsumer;
local l_Profiler_0 = v9.Profiler;
local l_SuspenseComponent_0 = v9.SuspenseComponent;
local l_SuspenseListComponent_0 = v9.SuspenseListComponent;
local l_DehydratedFragment_0 = v9.DehydratedFragment;
local l_FunctionComponent_0 = v9.FunctionComponent;
local l_MemoComponent_0 = v9.MemoComponent;
local l_SimpleMemoComponent_0 = v9.SimpleMemoComponent;
local l_LazyComponent_0 = v9.LazyComponent;
local l_FundamentalComponent_0 = v9.FundamentalComponent;
local l_ScopeComponent_0 = v9.ScopeComponent;
local l_OffscreenComponent_0 = v9.OffscreenComponent;
local l_LegacyHiddenComponent_0 = v9.LegacyHiddenComponent;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_isDevToolsPresent_0 = require(script.Parent["ReactFiberDevToolsHook.new"]).isDevToolsPresent;
local v47 = require(script.Parent["ReactFiberHotReloading.new"]);
local l_resolveClassForHotReloading_0 = v47.resolveClassForHotReloading;
local l_resolveFunctionForHotReloading_0 = v47.resolveFunctionForHotReloading;
local l_resolveForwardRefForHotReloading_0 = v47.resolveForwardRefForHotReloading;
local l_NoLanes_0 = v11.NoLanes;
local l_NoMode_0 = v10.NoMode;
local l_ConcurrentMode_0 = v10.ConcurrentMode;
local l_DebugTracingMode_0 = v10.DebugTracingMode;
local l_ProfileMode_0 = v10.ProfileMode;
local l_StrictMode_0 = v10.StrictMode;
local l_BlockingMode_0 = v10.BlockingMode;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_REACT_FORWARD_REF_TYPE_0 = l_ReactSymbols_0.REACT_FORWARD_REF_TYPE;
local l_REACT_FRAGMENT_TYPE_0 = l_ReactSymbols_0.REACT_FRAGMENT_TYPE;
local l_REACT_ELEMENT_TYPE_0 = l_ReactSymbols_0.REACT_ELEMENT_TYPE;
local l_REACT_DEBUG_TRACING_MODE_TYPE_0 = l_ReactSymbols_0.REACT_DEBUG_TRACING_MODE_TYPE;
local l_REACT_STRICT_MODE_TYPE_0 = l_ReactSymbols_0.REACT_STRICT_MODE_TYPE;
local l_REACT_PROFILER_TYPE_0 = l_ReactSymbols_0.REACT_PROFILER_TYPE;
local l_REACT_PROVIDER_TYPE_0 = l_ReactSymbols_0.REACT_PROVIDER_TYPE;
local l_REACT_CONTEXT_TYPE_0 = l_ReactSymbols_0.REACT_CONTEXT_TYPE;
local l_REACT_SUSPENSE_TYPE_0 = l_ReactSymbols_0.REACT_SUSPENSE_TYPE;
local l_REACT_SUSPENSE_LIST_TYPE_0 = l_ReactSymbols_0.REACT_SUSPENSE_LIST_TYPE;
local l_REACT_MEMO_TYPE_0 = l_ReactSymbols_0.REACT_MEMO_TYPE;
local l_REACT_LAZY_TYPE_0 = l_ReactSymbols_0.REACT_LAZY_TYPE;
local l_REACT_OFFSCREEN_TYPE_0 = l_ReactSymbols_0.REACT_OFFSCREEN_TYPE;
local l_REACT_LEGACY_HIDDEN_TYPE_0 = l_ReactSymbols_0.REACT_LEGACY_HIDDEN_TYPE;
local v73 = nil;
local v74 = nil;
local v75 = nil;
local v76 = nil;
local v77 = nil;
local v78 = nil;
local v79 = nil;
local v80 = nil;
local v81 = 1;
FiberNode = function(v82, v83, v84, v85) --[[ Line: 139 ]] --[[ Name: FiberNode ]]
    -- upvalues: l_NoFlags_0 (copy), l_NoLanes_0 (copy), l_enableProfilerTimer_0 (copy), v81 (ref)
    local v86 = {
        tag = v82, 
        key = v84, 
        elementType = nil, 
        type = nil, 
        stateNode = nil, 
        return_ = nil, 
        child = nil, 
        sibling = nil, 
        index = 1, 
        ref = nil, 
        pendingProps = v83, 
        memoizedProps = nil, 
        updateQueue = nil, 
        memoizedState = nil, 
        dependencies = nil, 
        mode = v85, 
        flags = l_NoFlags_0, 
        subtreeFlags = l_NoFlags_0, 
        deletions = nil, 
        lanes = l_NoLanes_0, 
        childLanes = l_NoLanes_0, 
        alternate = nil
    };
    if l_enableProfilerTimer_0 then
        v86.actualDuration = 0;
        v86.actualStartTime = -1;
        v86.selfBaseDuration = 0;
        v86.treeBaseDuration = 0;
    end;
    if _G.__DEV__ then
        v86._debugID = v81;
        v81 = v81 + 1;
        v86._debugSource = nil;
        v86._debugOwner = nil;
        v86._debugNeedsRemount = false;
        v86._debugHookTypes = nil;
    end;
    return v86;
end;
local function v91(v87, v88, v89, v90) --[[ Line: 246 ]] --[[ Name: createFiber ]]
    return FiberNode(v87, v88, v89, v90);
end;
shouldConstruct = function(v92) --[[ Line: 257 ]] --[[ Name: shouldConstruct ]]
    local v93 = false;
    if typeof(v92) ~= "function" then
        v93 = not not v92.isReactComponent;
    end;
    return v93;
end;
local function v96(v94) --[[ Line: 263 ]] --[[ Name: isSimpleFunctionComponent ]]
    local v95 = false;
    if typeof(v94) == "function" then
        v95 = not shouldConstruct(v94);
    end;
    return v95;
end;
local function v99(v97) --[[ Line: 271 ]] --[[ Name: resolveLazyComponentTag ]]
    -- upvalues: l_ClassComponent_0 (copy), l_FunctionComponent_0 (copy), l_REACT_FORWARD_REF_TYPE_0 (copy), l_ForwardRef_0 (copy), l_REACT_MEMO_TYPE_0 (copy), l_MemoComponent_0 (copy), l_IndeterminateComponent_0 (copy)
    if typeof(v97) == "function" or typeof(v97) == "table" and v97.isReactComponent then
        if shouldConstruct(v97) then
            return l_ClassComponent_0;
        else
            return l_FunctionComponent_0;
        end;
    else
        if v97 ~= nil and typeof(v97) == "table" then
            local v98 = v97["$$typeof"];
            if v98 == l_REACT_FORWARD_REF_TYPE_0 then
                return l_ForwardRef_0;
            elseif v98 == l_REACT_MEMO_TYPE_0 then
                return l_MemoComponent_0;
            end;
        end;
        return l_IndeterminateComponent_0;
    end;
end;
local function v107(v100, v101) --[[ Line: 294 ]] --[[ Name: createWorkInProgress ]]
    -- upvalues: l_NoFlags_0 (copy), l_enableProfilerTimer_0 (copy), l_StaticMask_0 (copy), l_IndeterminateComponent_0 (copy), l_FunctionComponent_0 (copy), l_SimpleMemoComponent_0 (copy), l_resolveFunctionForHotReloading_0 (copy), l_ClassComponent_0 (copy), l_resolveClassForHotReloading_0 (copy), l_ForwardRef_0 (copy), l_resolveForwardRefForHotReloading_0 (copy)
    local l_alternate_0 = v100.alternate;
    if l_alternate_0 == nil then
        local l_tag_0 = v100.tag;
        local l_key_0 = v100.key;
        local l_mode_0 = v100.mode;
        l_alternate_0 = FiberNode(l_tag_0, v101, l_key_0, l_mode_0);
        l_alternate_0.elementType = v100.elementType;
        l_alternate_0.type = v100.type;
        l_alternate_0.stateNode = v100.stateNode;
        if _G.__DEV__ then
            l_alternate_0._debugID = v100._debugID;
            l_alternate_0._debugSource = v100._debugSource;
            l_alternate_0._debugOwner = v100._debugOwner;
            l_alternate_0._debugHookTypes = v100._debugHookTypes;
        end;
        l_alternate_0.alternate = v100;
        v100.alternate = l_alternate_0;
    else
        l_alternate_0.pendingProps = v101;
        l_alternate_0.type = v100.type;
        l_alternate_0.flags = l_NoFlags_0;
        l_alternate_0.subtreeFlags = l_NoFlags_0;
        l_alternate_0.deletions = nil;
        if l_enableProfilerTimer_0 then
            l_alternate_0.actualDuration = 0;
            l_alternate_0.actualStartTime = -1;
        end;
    end;
    l_alternate_0.flags = bit32.band(v100.flags, l_StaticMask_0);
    l_alternate_0.childLanes = v100.childLanes;
    l_alternate_0.lanes = v100.lanes;
    l_alternate_0.child = v100.child;
    l_alternate_0.memoizedProps = v100.memoizedProps;
    l_alternate_0.memoizedState = v100.memoizedState;
    l_alternate_0.updateQueue = v100.updateQueue;
    local l_dependencies_0 = v100.dependencies;
    if l_dependencies_0 == nil then
        l_alternate_0.dependencies = nil;
    else
        l_alternate_0.dependencies = {
            lanes = l_dependencies_0.lanes, 
            firstContext = l_dependencies_0.firstContext
        };
    end;
    l_alternate_0.sibling = v100.sibling;
    l_alternate_0.index = v100.index;
    l_alternate_0.ref = v100.ref;
    if l_enableProfilerTimer_0 then
        l_alternate_0.selfBaseDuration = v100.selfBaseDuration;
        l_alternate_0.treeBaseDuration = v100.treeBaseDuration;
    end;
    if _G.__DEV__ then
        l_alternate_0._debugNeedsRemount = v100._debugNeedsRemount;
        if l_alternate_0.tag == l_IndeterminateComponent_0 or l_alternate_0.tag == l_FunctionComponent_0 or l_alternate_0.tag == l_SimpleMemoComponent_0 then
            l_alternate_0.type = l_resolveFunctionForHotReloading_0(v100.type);
            return l_alternate_0;
        elseif l_alternate_0.tag == l_ClassComponent_0 then
            l_alternate_0.type = l_resolveClassForHotReloading_0(v100.type);
            return l_alternate_0;
        elseif l_alternate_0.tag == l_ForwardRef_0 then
            l_alternate_0.type = l_resolveForwardRefForHotReloading_0(v100.type);
        end;
    end;
    return l_alternate_0;
end;
local function v112(v108, v109) --[[ Line: 398 ]] --[[ Name: resetWorkInProgress ]]
    -- upvalues: l_StaticMask_0 (copy), l_Placement_0 (copy), l_NoLanes_0 (copy), l_NoFlags_0 (copy), l_enableProfilerTimer_0 (copy)
    v108.flags = bit32.band(v108.flags, (bit32.bor(l_StaticMask_0, l_Placement_0)));
    local l_alternate_1 = v108.alternate;
    if l_alternate_1 == nil then
        v108.childLanes = l_NoLanes_0;
        v108.lanes = v109;
        v108.child = nil;
        v108.subtreeFlags = l_NoFlags_0;
        v108.memoizedProps = nil;
        v108.memoizedState = nil;
        v108.updateQueue = nil;
        v108.dependencies = nil;
        v108.stateNode = nil;
        if l_enableProfilerTimer_0 then
            v108.selfBaseDuration = 0;
            v108.treeBaseDuration = 0;
            return v108;
        end;
    else
        v108.childLanes = l_alternate_1.childLanes;
        v108.lanes = l_alternate_1.lanes;
        v108.child = l_alternate_1.child;
        v108.subtreeFlags = l_alternate_1.subtreeFlags;
        v108.deletions = nil;
        v108.memoizedProps = l_alternate_1.memoizedProps;
        v108.memoizedState = l_alternate_1.memoizedState;
        v108.updateQueue = l_alternate_1.updateQueue;
        v108.type = l_alternate_1.type;
        local l_dependencies_1 = l_alternate_1.dependencies;
        if l_dependencies_1 == nil then
            v108.dependencies = nil;
        else
            v108.dependencies = {
                lanes = l_dependencies_1.lanes, 
                firstContext = l_dependencies_1.firstContext
            };
        end;
        if l_enableProfilerTimer_0 then
            v108.selfBaseDuration = l_alternate_1.selfBaseDuration;
            v108.treeBaseDuration = l_alternate_1.treeBaseDuration;
        end;
    end;
    return v108;
end;
local function v115(v113) --[[ Line: 472 ]] --[[ Name: createHostRootFiber ]]
    -- upvalues: l_ConcurrentRoot_0 (copy), l_ConcurrentMode_0 (copy), l_BlockingMode_0 (copy), l_StrictMode_0 (copy), l_BlockingRoot_0 (copy), l_NoMode_0 (copy), l_enableProfilerTimer_0 (copy), l_isDevToolsPresent_0 (copy), l_ProfileMode_0 (copy), v91 (copy), l_HostRoot_0 (copy)
    local v114 = nil;
    v114 = if v113 == l_ConcurrentRoot_0 then bit32.bor(l_ConcurrentMode_0, l_BlockingMode_0, l_StrictMode_0) else if v113 == l_BlockingRoot_0 then bit32.bor(l_BlockingMode_0, l_StrictMode_0) else l_NoMode_0;
    if l_enableProfilerTimer_0 and l_isDevToolsPresent_0 then
        v114 = bit32.bor(v114, l_ProfileMode_0);
    end;
    return v91(l_HostRoot_0, nil, nil, v114);
end;
local function v129(v116, v117, v118, v119, v120, v121) --[[ Line: 492 ]] --[[ Name: createFiberFromTypeAndProps ]]
    -- upvalues: l_IndeterminateComponent_0 (copy), l_resolveFunctionForHotReloading_0 (copy), l_ClassComponent_0 (copy), l_resolveClassForHotReloading_0 (copy), l_HostComponent_0 (copy), l_REACT_FRAGMENT_TYPE_0 (copy), v75 (ref), l_REACT_DEBUG_TRACING_MODE_TYPE_0 (copy), l_Mode_0 (copy), l_DebugTracingMode_0 (copy), l_REACT_STRICT_MODE_TYPE_0 (copy), l_StrictMode_0 (copy), l_REACT_PROFILER_TYPE_0 (copy), v74 (ref), l_REACT_SUSPENSE_TYPE_0 (copy), v77 (ref), l_REACT_OFFSCREEN_TYPE_0 (copy), v78 (ref), l_REACT_LEGACY_HIDDEN_TYPE_0 (copy), v79 (ref), l_REACT_PROVIDER_TYPE_0 (copy), l_ContextProvider_0 (copy), l_REACT_CONTEXT_TYPE_0 (copy), l_ContextConsumer_0 (copy), l_REACT_FORWARD_REF_TYPE_0 (copy), l_ForwardRef_0 (copy), l_resolveForwardRefForHotReloading_0 (copy), l_REACT_MEMO_TYPE_0 (copy), l_MemoComponent_0 (copy), l_REACT_LAZY_TYPE_0 (copy), l_LazyComponent_0 (copy), l_Object_0 (copy), l_inspect_0 (copy), l_getComponentName_0 (copy), l_Array_0 (copy), l_REACT_ELEMENT_TYPE_0 (copy), l_invariant_0 (copy)
    local l_l_IndeterminateComponent_0_0 = l_IndeterminateComponent_0;
    local l_v116_0 = v116;
    if typeof(v116) == "function" then
        if _G.__DEV__ then
            l_v116_0 = l_resolveFunctionForHotReloading_0(l_v116_0);
        end;
    elseif typeof(v116) == "table" and v116.isReactComponent then
        l_l_IndeterminateComponent_0_0 = l_ClassComponent_0;
        if _G.__DEV__ then
            l_v116_0 = l_resolveClassForHotReloading_0(l_v116_0);
        end;
    elseif typeof(v116) == "string" then
        l_l_IndeterminateComponent_0_0 = l_HostComponent_0;
    elseif v116 == l_REACT_FRAGMENT_TYPE_0 then
        return v75(v118.children, v120, v121, v117);
    elseif v116 == l_REACT_DEBUG_TRACING_MODE_TYPE_0 then
        l_l_IndeterminateComponent_0_0 = l_Mode_0;
        v120 = bit32.bor(v120, l_DebugTracingMode_0);
    elseif v116 == l_REACT_STRICT_MODE_TYPE_0 then
        l_l_IndeterminateComponent_0_0 = l_Mode_0;
        v120 = bit32.bor(v120, l_StrictMode_0);
    elseif v116 == l_REACT_PROFILER_TYPE_0 then
        return v74(v118, v120, v121, v117);
    elseif v116 == l_REACT_SUSPENSE_TYPE_0 then
        return v77(v118, v120, v121, v117);
    elseif v116 == l_REACT_OFFSCREEN_TYPE_0 then
        return v78(v118, v120, v121, v117);
    elseif v116 == l_REACT_LEGACY_HIDDEN_TYPE_0 then
        return v79(v118, v120, v121, v117);
    else
        local v124 = false;
        if typeof(v116) == "table" then
            if v116["$$typeof"] == l_REACT_PROVIDER_TYPE_0 then
                l_l_IndeterminateComponent_0_0 = l_ContextProvider_0;
                v124 = true;
            elseif v116["$$typeof"] == l_REACT_CONTEXT_TYPE_0 then
                l_l_IndeterminateComponent_0_0 = l_ContextConsumer_0;
                v124 = true;
            elseif v116["$$typeof"] == l_REACT_FORWARD_REF_TYPE_0 then
                l_l_IndeterminateComponent_0_0 = l_ForwardRef_0;
                if _G.__DEV__ then
                    l_v116_0 = l_resolveForwardRefForHotReloading_0(l_v116_0);
                end;
                v124 = true;
            elseif v116["$$typeof"] == l_REACT_MEMO_TYPE_0 then
                l_l_IndeterminateComponent_0_0 = l_MemoComponent_0;
                v124 = true;
            elseif v116["$$typeof"] == l_REACT_LAZY_TYPE_0 then
                l_l_IndeterminateComponent_0_0 = l_LazyComponent_0;
                l_v116_0 = nil;
                v124 = true;
            end;
        end;
        if not v124 then
            local v125 = "";
            if _G.__DEV__ then
                if v116 == nil or typeof(v116) == "table" and #l_Object_0.keys(v116) == 0 then
                    v125 = v125 .. " You likely forgot to export your component from the file " .. "it's defined in, or you might have mixed up default and " .. "named imports.";
                elseif v116 ~= nil and typeof(v116) == "table" then
                    v125 = v125 .. "\n" .. l_inspect_0(v116);
                end;
                local v126 = nil;
                if v119 then
                    v126 = l_getComponentName_0(v119.type);
                end;
                if v126 ~= nil and v126 ~= "" then
                    v125 = v125 .. "\n\nCheck the render method of `" .. v126 .. "`.";
                elseif v119 then
                    v125 = v125 .. "\n" .. l_inspect_0(v119);
                end;
            end;
            local v127 = nil;
            if v116 == nil then
                v127 = "nil";
            elseif l_Array_0.isArray(v116) then
                v127 = "array";
            elseif typeof(v116) == "table" and v116["$$typeof"] == l_REACT_ELEMENT_TYPE_0 then
                v127 = string.format("<%s />", l_getComponentName_0(v116.type) or "Unknown");
                v125 = " Did you accidentally export a JSX literal or Element instead of a component?";
            else
                v127 = typeof(v116);
            end;
            l_invariant_0(false, "Element type is invalid: expected a string (for built-in " .. "components) or a class/function (for composite components) " .. "but got: %s.%s", v127, v125);
        end;
    end;
    local v128 = FiberNode(l_l_IndeterminateComponent_0_0, v118, v117, v120);
    v128.elementType = v116;
    v128.type = l_v116_0;
    v128.lanes = v121;
    if _G.__DEV__ then
        v128._debugOwner = v119;
    end;
    return v128;
end;
local function v138(v130, v131, v132) --[[ Line: 641 ]] --[[ Name: createFiberFromElement ]]
    -- upvalues: v129 (copy)
    local v133 = nil;
    if _G.__DEV__ then
        v133 = v130._owner;
    end;
    local l_type_0 = v130.type;
    local l_key_1 = v130.key;
    local l_props_0 = v130.props;
    local v137 = v129(l_type_0, l_key_1, l_props_0, v133, v131, v132);
    if _G.__DEV__ then
        v137._debugSource = v130._source;
        v137._debugOwner = v130._owner;
    end;
    return v137;
end;
v75 = function(v139, v140, v141, v142) --[[ Line: 669 ]] --[[ Name: createFiberFromFragment ]]
    -- upvalues: l_Fragment_0 (copy)
    local v143 = FiberNode(l_Fragment_0, v139, v142, v140);
    v143.lanes = v141;
    return v143;
end;
v76 = function(v144, v145, v146, v147, v148) --[[ Line: 680 ]] --[[ Name: createFiberFromFundamental ]]
    -- upvalues: l_FundamentalComponent_0 (copy)
    local v149 = FiberNode(l_FundamentalComponent_0, v145, v148, v146);
    v149.elementType = v144;
    v149.type = v144;
    v149.lanes = v147;
    return v149;
end;
v73 = function(v150, v151, v152, v153, v154) --[[ Line: 694 ]] --[[ Name: createFiberFromScope ]]
    -- upvalues: l_ScopeComponent_0 (copy)
    local v155 = FiberNode(l_ScopeComponent_0, v151, v154, v152);
    v155.type = v150;
    v155.elementType = v150;
    v155.lanes = v153;
    return v155;
end;
v74 = function(v156, v157, v158, v159) --[[ Line: 708 ]] --[[ Name: createFiberFromProfiler ]]
    -- upvalues: l_console_0 (copy), l_Profiler_0 (copy), l_ProfileMode_0 (copy), l_REACT_PROFILER_TYPE_0 (copy), l_enableProfilerTimer_0 (copy)
    if _G.__DEV__ and typeof(v156.id) ~= "string" then
        l_console_0.error("Profiler must specify an \"id\" as a prop");
    end;
    local l_l_Profiler_0_0 = l_Profiler_0;
    local v161 = bit32.bor(v157, l_ProfileMode_0);
    local v162 = FiberNode(l_l_Profiler_0_0, v156, v159, v161);
    v162.elementType = l_REACT_PROFILER_TYPE_0;
    v162.type = l_REACT_PROFILER_TYPE_0;
    v162.lanes = v158;
    if l_enableProfilerTimer_0 then
        v162.stateNode = {
            effectDuration = 0, 
            passiveEffectDuration = 0
        };
    end;
    return v162;
end;
v77 = function(v163, v164, v165, v166) --[[ Line: 736 ]] --[[ Name: createFiberFromSuspense ]]
    -- upvalues: l_SuspenseComponent_0 (copy), l_REACT_SUSPENSE_TYPE_0 (copy)
    local v167 = FiberNode(l_SuspenseComponent_0, v163, v166, v164);
    v167.type = l_REACT_SUSPENSE_TYPE_0;
    v167.elementType = l_REACT_SUSPENSE_TYPE_0;
    v167.lanes = v165;
    return v167;
end;
v80 = function(v168, v169, v170, v171) --[[ Line: 754 ]] --[[ Name: createFiberFromSuspenseList ]]
    -- upvalues: l_SuspenseListComponent_0 (copy), l_REACT_SUSPENSE_LIST_TYPE_0 (copy)
    local v172 = FiberNode(l_SuspenseListComponent_0, v168, v171, v169);
    if _G.__DEV__ then
        v172.type = l_REACT_SUSPENSE_LIST_TYPE_0;
    end;
    v172.elementType = l_REACT_SUSPENSE_LIST_TYPE_0;
    v172.lanes = v170;
    return v172;
end;
v78 = function(v173, v174, v175, v176) --[[ Line: 772 ]] --[[ Name: createFiberFromOffscreen ]]
    -- upvalues: l_OffscreenComponent_0 (copy), l_REACT_OFFSCREEN_TYPE_0 (copy)
    local v177 = FiberNode(l_OffscreenComponent_0, v173, v176, v174);
    if _G.__DEV__ then
        v177.type = l_REACT_OFFSCREEN_TYPE_0;
    end;
    v177.elementType = l_REACT_OFFSCREEN_TYPE_0;
    v177.lanes = v175;
    return v177;
end;
v79 = function(v178, v179, v180, v181) --[[ Line: 790 ]] --[[ Name: createFiberFromLegacyHidden ]]
    -- upvalues: l_LegacyHiddenComponent_0 (copy), l_REACT_LEGACY_HIDDEN_TYPE_0 (copy)
    local v182 = FiberNode(l_LegacyHiddenComponent_0, v178, v181, v179);
    if _G.__DEV__ then
        v182.type = l_REACT_LEGACY_HIDDEN_TYPE_0;
    end;
    v182.elementType = l_REACT_LEGACY_HIDDEN_TYPE_0;
    v182.lanes = v180;
    return v182;
end;
return {
    isSimpleFunctionComponent = v96, 
    resolveLazyComponentTag = v99, 
    createWorkInProgress = v107, 
    resetWorkInProgress = v112, 
    createHostRootFiber = v115, 
    createFiberFromTypeAndProps = v129, 
    createFiberFromElement = v138, 
    createFiberFromFragment = v75, 
    createFiberFromFundamental = v76, 
    createFiberFromSuspense = v77, 
    createFiberFromSuspenseList = v80, 
    createFiberFromOffscreen = v78, 
    createFiberFromLegacyHidden = v79, 
    createFiberFromText = function(v183, v184, v185) --[[ Line: 808 ]] --[[ Name: createFiberFromText ]]
        -- upvalues: l_HostText_0 (copy)
        local v186 = FiberNode(l_HostText_0, v183, nil, v184);
        v186.lanes = v185;
        return v186;
    end, 
    createFiberFromHostInstanceForDeletion = function() --[[ Line: 818 ]] --[[ Name: createFiberFromHostInstanceForDeletion ]]
        -- upvalues: l_HostComponent_0 (copy), l_NoMode_0 (copy)
        local v187 = FiberNode(l_HostComponent_0, nil, nil, l_NoMode_0);
        v187.elementType = "DELETED";
        v187.type = "DELETED";
        return v187;
    end, 
    createFiberFromDehydratedFragment = function(v188) --[[ Line: 826 ]] --[[ Name: createFiberFromDehydratedFragment ]]
        -- upvalues: l_DehydratedFragment_0 (copy), l_NoMode_0 (copy)
        local v189 = FiberNode(l_DehydratedFragment_0, nil, nil, l_NoMode_0);
        v189.stateNode = v188;
        return v189;
    end, 
    createFiberFromPortal = function(v190, v191, v192) --[[ Line: 834 ]] --[[ Name: createFiberFromPortal ]]
        -- upvalues: l_HostPortal_0 (copy)
        local v193 = nil;
        v193 = if v190.children ~= nil then v190.children else {};
        local l_l_HostPortal_0_0 = l_HostPortal_0;
        local l_v193_0 = v193;
        local l_key_2 = v190.key;
        local v197 = FiberNode(l_l_HostPortal_0_0, l_v193_0, l_key_2, v191);
        v197.lanes = v192;
        v197.stateNode = {
            containerInfo = v190.containerInfo, 
            pendingChildren = nil, 
            implementation = v190.implementation
        };
        return v197;
    end, 
    assignFiberPropertiesInDEV = function(v198, v199) --[[ Line: 857 ]] --[[ Name: assignFiberPropertiesInDEV ]]
        -- upvalues: l_IndeterminateComponent_0 (copy), l_NoMode_0 (copy), l_enableProfilerTimer_0 (copy)
        if v198 == nil then
            v198 = FiberNode(l_IndeterminateComponent_0, nil, nil, l_NoMode_0);
        end;
        v198.tag = v199.tag;
        v198.key = v199.key;
        v198.elementType = v199.elementType;
        v198.type = v199.type;
        v198.stateNode = v199.stateNode;
        v198.return_ = v199.return_;
        v198.child = v199.child;
        v198.sibling = v199.sibling;
        v198.index = v199.index;
        v198.ref = v199.ref;
        v198.pendingProps = v199.pendingProps;
        v198.memoizedProps = v199.memoizedProps;
        v198.updateQueue = v199.updateQueue;
        v198.memoizedState = v199.memoizedState;
        v198.dependencies = v199.dependencies;
        v198.mode = v199.mode;
        v198.flags = v199.flags;
        v198.subtreeFlags = v199.subtreeFlags;
        v198.deletions = v199.deletions;
        v198.lanes = v199.lanes;
        v198.childLanes = v199.childLanes;
        v198.alternate = v199.alternate;
        if l_enableProfilerTimer_0 then
            v198.actualDuration = v199.actualDuration;
            v198.actualStartTime = v199.actualStartTime;
            v198.selfBaseDuration = v199.selfBaseDuration;
            v198.treeBaseDuration = v199.treeBaseDuration;
        end;
        v198._debugID = v199._debugID;
        v198._debugSource = v199._debugSource;
        v198._debugOwner = v199._debugOwner;
        v198._debugNeedsRemount = v199._debugNeedsRemount;
        v198._debugHookTypes = v199._debugHookTypes;
        return v198;
    end
};