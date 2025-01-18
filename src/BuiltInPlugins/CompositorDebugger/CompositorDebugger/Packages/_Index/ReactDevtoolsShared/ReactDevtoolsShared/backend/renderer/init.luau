local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local v2 = require(l_Parent_0.Shared);
local l_console_0 = v2.console;
local l_Map_0 = v1.Map;
local l_Set_0 = v1.Set;
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local l_Number_0 = v1.Number;
local l_String_0 = v1.String;
local l__G_0 = _G;
local v12 = {};
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local v14 = require(script.Parent.Parent.types);
local l_ComponentFilterDisplayName_0 = v14.ComponentFilterDisplayName;
local l_ComponentFilterElementType_0 = v14.ComponentFilterElementType;
local l_ComponentFilterHOC_0 = v14.ComponentFilterHOC;
local l_ComponentFilterLocation_0 = v14.ComponentFilterLocation;
local l_ElementTypeClass_0 = v14.ElementTypeClass;
local l_ElementTypeContext_0 = v14.ElementTypeContext;
local l_ElementTypeFunction_0 = v14.ElementTypeFunction;
local l_ElementTypeForwardRef_0 = v14.ElementTypeForwardRef;
local l_ElementTypeHostComponent_0 = v14.ElementTypeHostComponent;
local l_ElementTypeMemo_0 = v14.ElementTypeMemo;
local l_ElementTypeOtherOrUnknown_0 = v14.ElementTypeOtherOrUnknown;
local l_ElementTypeProfiler_0 = v14.ElementTypeProfiler;
local l_ElementTypeRoot_0 = v14.ElementTypeRoot;
local l_ElementTypeSuspense_0 = v14.ElementTypeSuspense;
local l_ElementTypeSuspenseList_0 = v14.ElementTypeSuspenseList;
local v30 = require(script.Parent.Parent.utils);
local l_deletePathInObject_0 = v30.deletePathInObject;
local l_getDisplayName_0 = v30.getDisplayName;
local l_getDefaultComponentFilters_0 = v30.getDefaultComponentFilters;
local l_getInObject_0 = v30.getInObject;
local l_getUID_0 = v30.getUID;
local l_renamePathInObject_0 = v30.renamePathInObject;
local l_setInObject_0 = v30.setInObject;
local l_sessionStorageGetItem_0 = require(script.Parent.Parent.storage).sessionStorageGetItem;
local v39 = require(script.Parent.utils);
local l_cleanForBridge_0 = v39.cleanForBridge;
local l_copyToClipboard_0 = v39.copyToClipboard;
local l_copyWithDelete_0 = v39.copyWithDelete;
local l_copyWithRename_0 = v39.copyWithRename;
local l_copyWithSet_0 = v39.copyWithSet;
local v45 = require(script.Parent.Parent.constants);
local l___DEBUG___0 = v45.__DEBUG__;
local l_SESSION_STORAGE_RELOAD_AND_PROFILE_KEY_0 = v45.SESSION_STORAGE_RELOAD_AND_PROFILE_KEY;
local l_SESSION_STORAGE_RECORD_CHANGE_DESCRIPTIONS_KEY_0 = v45.SESSION_STORAGE_RECORD_CHANGE_DESCRIPTIONS_KEY;
local l_TREE_OPERATION_ADD_0 = v45.TREE_OPERATION_ADD;
local l_TREE_OPERATION_REMOVE_0 = v45.TREE_OPERATION_REMOVE;
local l_TREE_OPERATION_REORDER_CHILDREN_0 = v45.TREE_OPERATION_REORDER_CHILDREN;
local l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0 = v45.TREE_OPERATION_UPDATE_TREE_BASE_DURATION;
local l_inspectHooksOfFiber_0 = require(l_Parent_0.ReactDebugTools).inspectHooksOfFiber;
local v54 = require(script.Parent.console);
local l_patch_0 = v54.patch;
local l_registerRenderer_0 = v54.registerRenderer;
local v57 = require(script.Parent.ReactSymbols);
local l_CONCURRENT_MODE_NUMBER_0 = v57.CONCURRENT_MODE_NUMBER;
local l_CONCURRENT_MODE_SYMBOL_STRING_0 = v57.CONCURRENT_MODE_SYMBOL_STRING;
local l_DEPRECATED_ASYNC_MODE_SYMBOL_STRING_0 = v57.DEPRECATED_ASYNC_MODE_SYMBOL_STRING;
local l_PROVIDER_NUMBER_0 = v57.PROVIDER_NUMBER;
local l_PROVIDER_SYMBOL_STRING_0 = v57.PROVIDER_SYMBOL_STRING;
local l_CONTEXT_NUMBER_0 = v57.CONTEXT_NUMBER;
local l_CONTEXT_SYMBOL_STRING_0 = v57.CONTEXT_SYMBOL_STRING;
local l_STRICT_MODE_NUMBER_0 = v57.STRICT_MODE_NUMBER;
local l_STRICT_MODE_SYMBOL_STRING_0 = v57.STRICT_MODE_SYMBOL_STRING;
local l_PROFILER_NUMBER_0 = v57.PROFILER_NUMBER;
local l_PROFILER_SYMBOL_STRING_0 = v57.PROFILER_SYMBOL_STRING;
local l_SCOPE_NUMBER_0 = v57.SCOPE_NUMBER;
local l_SCOPE_SYMBOL_STRING_0 = v57.SCOPE_SYMBOL_STRING;
local l_FORWARD_REF_NUMBER_0 = v57.FORWARD_REF_NUMBER;
local l_FORWARD_REF_SYMBOL_STRING_0 = v57.FORWARD_REF_SYMBOL_STRING;
local l_MEMO_NUMBER_0 = v57.MEMO_NUMBER;
local l_MEMO_SYMBOL_STRING_0 = v57.MEMO_SYMBOL_STRING;
local l_objectIs_0 = v2.objectIs;
local l_getNearestMountedFiber_0 = require(l_Parent_0.ReactReconciler)({}).getNearestMountedFiber;
local _ = require(l_Parent_0.ReactReconciler);
local _ = require(script.Parent.types);
local _ = require(script.Parent.Parent.devtools.views.Profiler.types);
local _ = require(script.Parent.Parent.types);
local function _(v81) --[[ Line: 162 ]] --[[ Name: getFiberFlags ]]
    if v81.flags ~= nil then
        return v81.flags;
    else
        return v81.effectTag;
    end;
end;
local function _() --[[ Line: 171 ]]
    return os.clock();
end;
v12.getInternalReactConstants = function(_) --[[ Line: 176 ]]
    -- upvalues: l_MEMO_NUMBER_0 (copy), l_MEMO_SYMBOL_STRING_0 (copy), l_FORWARD_REF_NUMBER_0 (copy), l_FORWARD_REF_SYMBOL_STRING_0 (copy), l_getDisplayName_0 (copy), l_CONCURRENT_MODE_NUMBER_0 (copy), l_CONCURRENT_MODE_SYMBOL_STRING_0 (copy), l_DEPRECATED_ASYNC_MODE_SYMBOL_STRING_0 (copy), l_PROVIDER_NUMBER_0 (copy), l_PROVIDER_SYMBOL_STRING_0 (copy), l_CONTEXT_NUMBER_0 (copy), l_CONTEXT_SYMBOL_STRING_0 (copy), l_STRICT_MODE_NUMBER_0 (copy), l_STRICT_MODE_SYMBOL_STRING_0 (copy), l_PROFILER_NUMBER_0 (copy), l_PROFILER_SYMBOL_STRING_0 (copy), l_SCOPE_NUMBER_0 (copy), l_SCOPE_SYMBOL_STRING_0 (copy)
    local v85 = {
        NoFlags = 0, 
        PerformedWork = 1, 
        Placement = 2
    };
    local v86 = {
        ImmediatePriority = 99, 
        UserBlockingPriority = 98, 
        NormalPriority = 97, 
        LowPriority = 96, 
        IdlePriority = 95, 
        NoPriority = 90
    };
    local v87 = {
        Block = 22, 
        ClassComponent = 1, 
        ContextConsumer = 9, 
        ContextProvider = 10, 
        CoroutineComponent = -1, 
        CoroutineHandlerPhase = -1, 
        DehydratedSuspenseComponent = 18, 
        ForwardRef = 11, 
        Fragment = 7, 
        FunctionComponent = 0, 
        HostComponent = 5, 
        HostPortal = 4, 
        HostRoot = 3, 
        HostText = 6, 
        IncompleteClassComponent = 17, 
        IndeterminateComponent = 2, 
        LazyComponent = 16, 
        MemoComponent = 14, 
        Mode = 8, 
        OffscreenComponent = 23, 
        Profiler = 12, 
        SimpleMemoComponent = 15, 
        SuspenseComponent = 13, 
        SuspenseListComponent = 19, 
        YieldComponent = -1
    };
    local function v90(v88) --[[ Line: 324 ]] --[[ Name: getTypeSymbol ]]
        local v89 = if typeof(v88) == "table" then v88["$$typeof"] else v88;
        if typeof(v89) == "table" then
            return (tostring(v89));
        else
            return v89;
        end;
    end;
    local l_ClassComponent_0 = v87.ClassComponent;
    local l_IncompleteClassComponent_0 = v87.IncompleteClassComponent;
    local l_FunctionComponent_0 = v87.FunctionComponent;
    local l_IndeterminateComponent_0 = v87.IndeterminateComponent;
    local l_ForwardRef_0 = v87.ForwardRef;
    local l_HostRoot_0 = v87.HostRoot;
    local l_HostComponent_0 = v87.HostComponent;
    local l_HostPortal_0 = v87.HostPortal;
    local l_HostText_0 = v87.HostText;
    local l_Fragment_0 = v87.Fragment;
    local l_MemoComponent_0 = v87.MemoComponent;
    local l_SimpleMemoComponent_0 = v87.SimpleMemoComponent;
    local l_SuspenseComponent_0 = v87.SuspenseComponent;
    local l_SuspenseListComponent_0 = v87.SuspenseListComponent;
    local function v105(v106) --[[ Line: 351 ]] --[[ Name: resolveFiberType ]]
        -- upvalues: l_MEMO_NUMBER_0 (ref), l_MEMO_SYMBOL_STRING_0 (ref), v105 (copy), l_FORWARD_REF_NUMBER_0 (ref), l_FORWARD_REF_SYMBOL_STRING_0 (ref)
        local v107 = if typeof(v106) == "table" then v106["$$typeof"] else v106;
        local v108 = if typeof(v107) == "table" then tostring(v107) else v107;
        if v108 == l_MEMO_NUMBER_0 or v108 == l_MEMO_SYMBOL_STRING_0 then
            return v105(v106.type);
        elseif v108 == l_FORWARD_REF_NUMBER_0 or v108 == l_FORWARD_REF_SYMBOL_STRING_0 then
            return v106.render;
        else
            return v106;
        end;
    end;
    return {
        getDisplayNameForFiber = function(v109) --[[ Line: 367 ]] --[[ Name: getDisplayNameForFiber ]]
            -- upvalues: l_MEMO_NUMBER_0 (ref), l_MEMO_SYMBOL_STRING_0 (ref), v105 (copy), l_FORWARD_REF_NUMBER_0 (ref), l_FORWARD_REF_SYMBOL_STRING_0 (ref), l_ClassComponent_0 (copy), l_IncompleteClassComponent_0 (copy), l_getDisplayName_0 (ref), l_FunctionComponent_0 (copy), l_IndeterminateComponent_0 (copy), l_ForwardRef_0 (copy), l_HostRoot_0 (copy), l_HostComponent_0 (copy), l_HostPortal_0 (copy), l_HostText_0 (copy), l_Fragment_0 (copy), l_MemoComponent_0 (copy), l_SimpleMemoComponent_0 (copy), l_SuspenseComponent_0 (copy), l_SuspenseListComponent_0 (copy), l_CONCURRENT_MODE_NUMBER_0 (ref), l_CONCURRENT_MODE_SYMBOL_STRING_0 (ref), l_DEPRECATED_ASYNC_MODE_SYMBOL_STRING_0 (ref), l_PROVIDER_NUMBER_0 (ref), l_PROVIDER_SYMBOL_STRING_0 (ref), l_CONTEXT_NUMBER_0 (ref), l_CONTEXT_SYMBOL_STRING_0 (ref), l_STRICT_MODE_NUMBER_0 (ref), l_STRICT_MODE_SYMBOL_STRING_0 (ref), l_PROFILER_NUMBER_0 (ref), l_PROFILER_SYMBOL_STRING_0 (ref), l_SCOPE_NUMBER_0 (ref), l_SCOPE_SYMBOL_STRING_0 (ref)
            local l_type_0 = v109.type;
            local l_tag_0 = v109.tag;
            local l_l_type_0_0 = l_type_0;
            if typeof(l_type_0) == "table" and l_type_0 ~= nil then
                local v113 = if typeof(l_type_0) == "table" then l_type_0["$$typeof"] else l_type_0;
                local v114 = if typeof(v113) == "table" then tostring(v113) else v113;
                l_l_type_0_0 = if not (v114 ~= l_MEMO_NUMBER_0) or v114 == l_MEMO_SYMBOL_STRING_0 then v105(l_type_0.type) else if not (v114 ~= l_FORWARD_REF_NUMBER_0) or v114 == l_FORWARD_REF_SYMBOL_STRING_0 then l_type_0.render else l_type_0;
            end;
            local _ = nil;
            if l_tag_0 == l_ClassComponent_0 or l_tag_0 == l_IncompleteClassComponent_0 then
                return l_getDisplayName_0(l_l_type_0_0);
            elseif l_tag_0 == l_FunctionComponent_0 or l_tag_0 == l_IndeterminateComponent_0 then
                return l_getDisplayName_0(l_l_type_0_0);
            elseif l_tag_0 == l_ForwardRef_0 then
                return l_type_0 and l_type_0.displayName or l_getDisplayName_0(l_l_type_0_0, "Anonymous");
            elseif l_tag_0 == l_HostRoot_0 then
                return nil;
            elseif l_tag_0 == l_HostComponent_0 then
                return l_type_0;
            elseif l_tag_0 == l_HostPortal_0 or l_tag_0 == l_HostText_0 or l_tag_0 == l_Fragment_0 then
                return nil;
            elseif l_tag_0 == l_MemoComponent_0 or l_tag_0 == l_SimpleMemoComponent_0 then
                return l_getDisplayName_0(l_l_type_0_0, "Anonymous");
            elseif l_tag_0 == l_SuspenseComponent_0 then
                return "Suspense";
            elseif l_tag_0 == l_SuspenseListComponent_0 then
                return "SuspenseList";
            else
                local v116 = if typeof(l_type_0) == "table" then l_type_0["$$typeof"] else l_type_0;
                local v117 = if typeof(v116) == "table" then tostring(v116) else v116;
                if v117 == l_CONCURRENT_MODE_NUMBER_0 or v117 == l_CONCURRENT_MODE_SYMBOL_STRING_0 or v117 == l_DEPRECATED_ASYNC_MODE_SYMBOL_STRING_0 then
                    return nil;
                elseif v117 == l_PROVIDER_NUMBER_0 or v117 == l_PROVIDER_SYMBOL_STRING_0 then
                    v116 = v109.type._context or v109.type.context;
                    return string.format("%s.Provider", v116.displayName or "Context");
                elseif v117 == l_CONTEXT_NUMBER_0 or v117 == l_CONTEXT_SYMBOL_STRING_0 then
                    v116 = v109.type._context or v109.type;
                    return string.format("%s.Consumer", v116.displayName or "Context");
                elseif v117 == l_STRICT_MODE_NUMBER_0 or v117 == l_STRICT_MODE_SYMBOL_STRING_0 then
                    return nil;
                elseif v117 == l_PROFILER_NUMBER_0 or v117 == l_PROFILER_SYMBOL_STRING_0 then
                    return string.format("Profiler(%s)", v109.memoizedProps.id);
                elseif v117 == l_SCOPE_NUMBER_0 or v117 == l_SCOPE_SYMBOL_STRING_0 then
                    return "Scope";
                else
                    return nil;
                end;
            end;
        end, 
        getTypeSymbol = v90, 
        ReactPriorityLevels = v86, 
        ReactTypeOfWork = v87, 
        ReactTypeOfSideEffect = v85
    };
end;
v12.attach = function(v118, v119, v120, v121) --[[ Line: 457 ]]
    -- upvalues: l_Map_0 (copy), l_Set_0 (copy), l_getUID_0 (copy), v12 (copy), l_registerRenderer_0 (copy), l__G_0 (copy), l_patch_0 (copy), l___DEBUG___0 (copy), l_console_0 (copy), l_ComponentFilterDisplayName_0 (copy), l_ComponentFilterElementType_0 (copy), l_ComponentFilterLocation_0 (copy), l_ComponentFilterHOC_0 (copy), l_getDefaultComponentFilters_0 (copy), l_CONCURRENT_MODE_NUMBER_0 (copy), l_CONCURRENT_MODE_SYMBOL_STRING_0 (copy), l_DEPRECATED_ASYNC_MODE_SYMBOL_STRING_0 (copy), l_STRICT_MODE_NUMBER_0 (copy), l_STRICT_MODE_SYMBOL_STRING_0 (copy), l_ElementTypeClass_0 (copy), l_ElementTypeFunction_0 (copy), l_ElementTypeForwardRef_0 (copy), l_ElementTypeRoot_0 (copy), l_ElementTypeHostComponent_0 (copy), l_ElementTypeOtherOrUnknown_0 (copy), l_ElementTypeMemo_0 (copy), l_ElementTypeSuspense_0 (copy), l_ElementTypeSuspenseList_0 (copy), l_ElementTypeContext_0 (copy), l_PROVIDER_NUMBER_0 (copy), l_PROVIDER_SYMBOL_STRING_0 (copy), l_CONTEXT_NUMBER_0 (copy), l_CONTEXT_SYMBOL_STRING_0 (copy), l_PROFILER_NUMBER_0 (copy), l_PROFILER_SYMBOL_STRING_0 (copy), l_ElementTypeProfiler_0 (copy), l_Object_0 (copy), l_objectIs_0 (copy), l_Array_0 (copy), l_Number_0 (copy), l_TREE_OPERATION_REMOVE_0 (copy), l_TREE_OPERATION_ADD_0 (copy), l_Boolean_0 (copy), l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0 (copy), l_TREE_OPERATION_REORDER_CHILDREN_0 (copy), l_invariant_0 (copy), l_getNearestMountedFiber_0 (copy), l_getInObject_0 (copy), l_inspectHooksOfFiber_0 (copy), l_copyToClipboard_0 (copy), l_cleanForBridge_0 (copy), l_deletePathInObject_0 (copy), l_copyWithDelete_0 (copy), l_renamePathInObject_0 (copy), l_copyWithRename_0 (copy), l_setInObject_0 (copy), l_copyWithSet_0 (copy), l_sessionStorageGetItem_0 (copy), l_SESSION_STORAGE_RELOAD_AND_PROFILE_KEY_0 (copy), l_SESSION_STORAGE_RECORD_CHANGE_DESCRIPTIONS_KEY_0 (copy), l_String_0 (copy)
    local v122 = l_Map_0.new();
    local v123 = l_Map_0.new();
    local v124 = l_Set_0.new();
    local v125 = l_Map_0.new();
    local v126 = l_Map_0.new();
    local v127 = -1;
    local function _(v128) --[[ Line: 481 ]] --[[ Name: getFiberID ]]
        -- upvalues: v122 (copy), l_getUID_0 (ref), v123 (copy)
        if not v122:has(v128) then
            local v129 = l_getUID_0();
            v122:set(v128, v129);
            v123:set(v129, v128);
        end;
        return (v122:get(v128));
    end;
    local v131 = v12.getInternalReactConstants(v120.version);
    local l_getDisplayNameForFiber_0 = v131.getDisplayNameForFiber;
    local l_getTypeSymbol_0 = v131.getTypeSymbol;
    local l_ReactPriorityLevels_0 = v131.ReactPriorityLevels;
    local l_ReactTypeOfWork_0 = v131.ReactTypeOfWork;
    local l_PerformedWork_0 = v131.ReactTypeOfSideEffect.PerformedWork;
    local l_FunctionComponent_1 = l_ReactTypeOfWork_0.FunctionComponent;
    local l_ClassComponent_1 = l_ReactTypeOfWork_0.ClassComponent;
    local l_ContextConsumer_0 = l_ReactTypeOfWork_0.ContextConsumer;
    local l_DehydratedSuspenseComponent_0 = l_ReactTypeOfWork_0.DehydratedSuspenseComponent;
    local l_Fragment_1 = l_ReactTypeOfWork_0.Fragment;
    local l_ForwardRef_1 = l_ReactTypeOfWork_0.ForwardRef;
    local l_HostRoot_1 = l_ReactTypeOfWork_0.HostRoot;
    local l_HostPortal_1 = l_ReactTypeOfWork_0.HostPortal;
    local l_HostComponent_1 = l_ReactTypeOfWork_0.HostComponent;
    local l_HostText_1 = l_ReactTypeOfWork_0.HostText;
    local l_IncompleteClassComponent_1 = l_ReactTypeOfWork_0.IncompleteClassComponent;
    local l_IndeterminateComponent_1 = l_ReactTypeOfWork_0.IndeterminateComponent;
    local l_MemoComponent_1 = l_ReactTypeOfWork_0.MemoComponent;
    local l_OffscreenComponent_0 = l_ReactTypeOfWork_0.OffscreenComponent;
    local l_SimpleMemoComponent_1 = l_ReactTypeOfWork_0.SimpleMemoComponent;
    local l_SuspenseComponent_1 = l_ReactTypeOfWork_0.SuspenseComponent;
    local l_SuspenseListComponent_1 = l_ReactTypeOfWork_0.SuspenseListComponent;
    local l_ImmediatePriority_0 = l_ReactPriorityLevels_0.ImmediatePriority;
    local l_UserBlockingPriority_0 = l_ReactPriorityLevels_0.UserBlockingPriority;
    local l_NormalPriority_0 = l_ReactPriorityLevels_0.NormalPriority;
    local l_LowPriority_0 = l_ReactPriorityLevels_0.LowPriority;
    local l_IdlePriority_0 = l_ReactPriorityLevels_0.IdlePriority;
    local function v159(...) --[[ Line: 525 ]]
        -- upvalues: v120 (copy)
        return v120.overrideHookState(...);
    end;
    local function v160(...) --[[ Line: 528 ]]
        -- upvalues: v120 (copy)
        return v120.overrideHookStateDeletePath(...);
    end;
    local function v161(...) --[[ Line: 531 ]]
        -- upvalues: v120 (copy)
        return v120.overrideHookStateRenamePath(...);
    end;
    local function v162(...) --[[ Line: 534 ]]
        -- upvalues: v120 (copy)
        return v120.overrideProps(...);
    end;
    local function v163(...) --[[ Line: 537 ]]
        -- upvalues: v120 (copy)
        return v120.overridePropsDeletePath(...);
    end;
    local function v164(...) --[[ Line: 540 ]]
        -- upvalues: v120 (copy)
        return v120.overridePropsRenamePath(...);
    end;
    local function v165(...) --[[ Line: 543 ]]
        -- upvalues: v120 (copy)
        return v120.setSuspenseHandler(...);
    end;
    local function v166(...) --[[ Line: 546 ]]
        -- upvalues: v120 (copy)
        return v120.scheduleUpdate(...);
    end;
    local v167 = false;
    if typeof(v165) == "function" then
        v167 = typeof(v166) == "function";
    end;
    if _G.__DEV__ then
        l_registerRenderer_0(v120);
        local v168 = l__G_0.__REACT_DEVTOOLS_APPEND_COMPONENT_STACK__ ~= false;
        local v169 = l__G_0.__REACT_DEVTOOLS_BREAK_ON_CONSOLE_ERRORS__ == true;
        if v168 or v169 then
            l_patch_0({
                appendComponentStack = v168, 
                breakOnConsoleErrors = v169
            });
        end;
    end;
    local function v179(v170, v171, v172) --[[ Line: 579 ]]
        -- upvalues: l___DEBUG___0 (ref), l_getDisplayNameForFiber_0 (copy), v122 (copy), l_getUID_0 (ref), v123 (copy), l_console_0 (ref)
        if l___DEBUG___0 then
            local v173 = l_getDisplayNameForFiber_0(v171) or "nil";
            if not v122:has(v171) then
                local v174 = l_getUID_0();
                v122:set(v171, v174);
                v123:set(v174, v171);
            end;
            local v175 = v122:get(v171);
            local v176 = if v172 ~= nil then l_getDisplayNameForFiber_0(v172) else "nil";
            local v177;
            if v172 then
                if not v122:has(v172) then
                    local v178 = l_getUID_0();
                    v122:set(v172, v178);
                    v123:set(v178, v172);
                end;
                v177 = v122:get(v172);
            else
                v177 = "";
            end;
            l_console_0.log(string.format("[renderer] %s %s (%d) %s", v170, v173, v175, if v172 then string.format("%s (%s)", tostring(v176), (tostring(v177))) else ""));
        end;
    end;
    local v180 = l_Set_0.new();
    local v181 = l_Set_0.new();
    local v182 = l_Set_0.new();
    local v183 = l_Map_0.new();
    local v184 = l_Map_0.new();
    local v185 = nil;
    local v186 = nil;
    local v187 = nil;
    local v188 = nil;
    local v189 = nil;
    local v190 = false;
    local v191 = 0;
    local v192 = false;
    local v193 = nil;
    local v194 = nil;
    local v195 = false;
    local v196 = {};
    local v197 = l_Set_0.new();
    local v198 = false;
    local v199 = l_Set_0.new();
    local v200 = nil;
    local v201 = nil;
    local v202 = -1;
    local v203 = false;
    local v204 = nil;
    local v205 = nil;
    local v206 = nil;
    local v207 = nil;
    local v208 = nil;
    local v209 = nil;
    local v210 = nil;
    local v211 = nil;
    local v212 = nil;
    local v213 = nil;
    local v214 = nil;
    local v215 = nil;
    local v216 = nil;
    local v217 = nil;
    local v218 = nil;
    local v219 = nil;
    local v220 = nil;
    local v221 = nil;
    local v222 = nil;
    local v223 = nil;
    local v224 = nil;
    local v225 = nil;
    local function v229(v226) --[[ Line: 665 ]] --[[ Name: applyComponentFilters ]]
        -- upvalues: v182 (copy), v180 (copy), v181 (copy), l_ComponentFilterDisplayName_0 (ref), l_ComponentFilterElementType_0 (ref), l_ComponentFilterLocation_0 (ref), l_ComponentFilterHOC_0 (ref), l_console_0 (ref)
        v182:clear();
        v180:clear();
        v181:clear();
        for _, v228 in v226 do
            if v228.isEnabled then
                if v228.type == l_ComponentFilterDisplayName_0 then
                    v180:add(v228.value);
                elseif v228.type == l_ComponentFilterElementType_0 then
                    v182:add(v228.value);
                elseif v228.type == l_ComponentFilterLocation_0 then
                    if v228.isValid and v228.value ~= "" then
                        v181:add(v228.value);
                    end;
                elseif v228.type == l_ComponentFilterHOC_0 then
                    v180:add("%(");
                else
                    l_console_0.warn(string.format("Invalid component filter type \"%d\"", v228.type));
                end;
            end;
        end;
    end;
    if l__G_0.__REACT_DEVTOOLS_COMPONENT_FILTERS__ ~= nil then
        v229(l__G_0.__REACT_DEVTOOLS_COMPONENT_FILTERS__);
    else
        v229(l_getDefaultComponentFilters_0());
    end;
    local function v237(v230) --[[ Line: 725 ]] --[[ Name: updateComponentFilters ]]
        -- upvalues: v190 (ref), v118 (copy), v119 (copy), v127 (ref), v208 (ref), v122 (copy), l_getUID_0 (ref), v123 (copy), v209 (ref), v210 (ref), v229 (copy), v184 (copy), v211 (ref), v205 (ref), v213 (ref)
        if v190 then
            error("Cannot modify filter preferences while profiling");
        end;
        v118.getFiberRoots(v119):forEach(function(v231) --[[ Line: 732 ]]
            -- upvalues: v127 (ref), v208 (ref), v122 (ref), l_getUID_0 (ref), v123 (ref), v209 (ref), v210 (ref)
            local v232 = v208(v231.current);
            if not v122:has(v232) then
                local v233 = l_getUID_0();
                v122:set(v232, v233);
                v123:set(v233, v232);
            end;
            v127 = v122:get(v232);
            v209(v231.current);
            v210(v231.current, false);
            v127 = -1;
        end);
        v229(v230);
        v184:clear();
        v118.getFiberRoots(v119):forEach(function(v234) --[[ Line: 745 ]]
            -- upvalues: v127 (ref), v208 (ref), v122 (ref), l_getUID_0 (ref), v123 (ref), v211 (ref), v205 (ref), v213 (ref)
            local v235 = v208(v234.current);
            if not v122:has(v235) then
                local v236 = l_getUID_0();
                v122:set(v235, v236);
                v123:set(v236, v235);
            end;
            v127 = v122:get(v235);
            v211(v127, v234.current);
            v205(v234.current, nil, false, false);
            v213(v234);
            v127 = -1;
        end);
    end;
    local function v249(v238) --[[ Line: 757 ]] --[[ Name: shouldFilterFiber ]]
        -- upvalues: l_DehydratedSuspenseComponent_0 (copy), l_HostPortal_1 (copy), l_HostText_1 (copy), l_Fragment_1 (copy), l_OffscreenComponent_0 (copy), l_HostRoot_1 (copy), l_getTypeSymbol_0 (copy), l_CONCURRENT_MODE_NUMBER_0 (ref), l_CONCURRENT_MODE_SYMBOL_STRING_0 (ref), l_DEPRECATED_ASYNC_MODE_SYMBOL_STRING_0 (ref), l_STRICT_MODE_NUMBER_0 (ref), l_STRICT_MODE_SYMBOL_STRING_0 (ref), v214 (ref), v182 (copy), v180 (copy), l_getDisplayNameForFiber_0 (copy), v181 (copy)
        local l__debugSource_0 = v238._debugSource;
        local l_tag_1 = v238.tag;
        local l_type_1 = v238.type;
        if l_tag_1 == l_DehydratedSuspenseComponent_0 then
            return true;
        elseif l_tag_1 == l_HostPortal_1 or l_tag_1 == l_HostText_1 or l_tag_1 == l_Fragment_1 or l_tag_1 == l_OffscreenComponent_0 then
            return true;
        elseif l_tag_1 == l_HostRoot_1 then
            return false;
        else
            local v242 = l_getTypeSymbol_0(l_type_1);
            if v242 == l_CONCURRENT_MODE_NUMBER_0 or v242 == l_CONCURRENT_MODE_SYMBOL_STRING_0 or v242 == l_DEPRECATED_ASYNC_MODE_SYMBOL_STRING_0 or v242 == l_STRICT_MODE_NUMBER_0 or v242 == l_STRICT_MODE_SYMBOL_STRING_0 then
                return true;
            else
                v242 = v214(v238);
                if v182:has(v242) then
                    return true;
                else
                    if v180.size > 0 then
                        local v243 = l_getDisplayNameForFiber_0(v238);
                        if v243 ~= nil then
                            for _, v245 in v180 do
                                if string.match(v243, v245) then
                                    return true;
                                end;
                            end;
                        end;
                    end;
                    if l__debugSource_0 ~= nil and v181.size > 0 then
                        local l_fileName_0 = l__debugSource_0.fileName;
                        for _, v248 in v181 do
                            if string.match(l_fileName_0, v248) then
                                return true;
                            end;
                        end;
                    end;
                    return false;
                end;
            end;
        end;
    end;
    v214 = function(v250) --[[ Line: 823 ]]
        -- upvalues: l_ClassComponent_1 (copy), l_IncompleteClassComponent_1 (copy), l_ElementTypeClass_0 (ref), l_FunctionComponent_1 (copy), l_IndeterminateComponent_1 (copy), l_ElementTypeFunction_0 (ref), l_ForwardRef_1 (copy), l_ElementTypeForwardRef_0 (ref), l_HostRoot_1 (copy), l_ElementTypeRoot_0 (ref), l_HostComponent_1 (copy), l_ElementTypeHostComponent_0 (ref), l_HostPortal_1 (copy), l_HostText_1 (copy), l_Fragment_1 (copy), l_ElementTypeOtherOrUnknown_0 (ref), l_MemoComponent_1 (copy), l_SimpleMemoComponent_1 (copy), l_ElementTypeMemo_0 (ref), l_SuspenseComponent_1 (copy), l_ElementTypeSuspense_0 (ref), l_SuspenseListComponent_1 (copy), l_ElementTypeSuspenseList_0 (ref), l_getTypeSymbol_0 (copy), l_CONCURRENT_MODE_NUMBER_0 (ref), l_CONCURRENT_MODE_SYMBOL_STRING_0 (ref), l_DEPRECATED_ASYNC_MODE_SYMBOL_STRING_0 (ref), l_ElementTypeContext_0 (ref), l_PROVIDER_NUMBER_0 (ref), l_PROVIDER_SYMBOL_STRING_0 (ref), l_CONTEXT_NUMBER_0 (ref), l_CONTEXT_SYMBOL_STRING_0 (ref), l_STRICT_MODE_NUMBER_0 (ref), l_STRICT_MODE_SYMBOL_STRING_0 (ref), l_PROFILER_NUMBER_0 (ref), l_PROFILER_SYMBOL_STRING_0 (ref), l_ElementTypeProfiler_0 (ref)
        local l_type_2 = v250.type;
        local l_tag_2 = v250.tag;
        if l_tag_2 == l_ClassComponent_1 or l_tag_2 == l_IncompleteClassComponent_1 then
            return l_ElementTypeClass_0;
        elseif l_tag_2 == l_FunctionComponent_1 or l_tag_2 == l_IndeterminateComponent_1 then
            return l_ElementTypeFunction_0;
        elseif l_tag_2 == l_ForwardRef_1 then
            return l_ElementTypeForwardRef_0;
        elseif l_tag_2 == l_HostRoot_1 then
            return l_ElementTypeRoot_0;
        elseif l_tag_2 == l_HostComponent_1 then
            return l_ElementTypeHostComponent_0;
        elseif l_tag_2 == l_HostPortal_1 or l_tag_2 == l_HostText_1 or l_tag_2 == l_Fragment_1 then
            return l_ElementTypeOtherOrUnknown_0;
        elseif l_tag_2 == l_MemoComponent_1 or l_tag_2 == l_SimpleMemoComponent_1 then
            return l_ElementTypeMemo_0;
        elseif l_tag_2 == l_SuspenseComponent_1 then
            return l_ElementTypeSuspense_0;
        elseif l_tag_2 == l_SuspenseListComponent_1 then
            return l_ElementTypeSuspenseList_0;
        else
            local v253 = l_getTypeSymbol_0(l_type_2);
            if v253 == l_CONCURRENT_MODE_NUMBER_0 or v253 == l_CONCURRENT_MODE_SYMBOL_STRING_0 or v253 == l_DEPRECATED_ASYNC_MODE_SYMBOL_STRING_0 then
                return l_ElementTypeContext_0;
            elseif v253 == l_PROVIDER_NUMBER_0 or v253 == l_PROVIDER_SYMBOL_STRING_0 then
                return l_ElementTypeContext_0;
            elseif v253 == l_CONTEXT_NUMBER_0 or v253 == l_CONTEXT_SYMBOL_STRING_0 then
                return l_ElementTypeContext_0;
            elseif v253 == l_STRICT_MODE_NUMBER_0 or v253 == l_STRICT_MODE_SYMBOL_STRING_0 then
                return l_ElementTypeOtherOrUnknown_0;
            elseif v253 == l_PROFILER_NUMBER_0 or v253 == l_PROFILER_SYMBOL_STRING_0 then
                return l_ElementTypeProfiler_0;
            else
                return l_ElementTypeOtherOrUnknown_0;
            end;
        end;
    end;
    v208 = function(v254) --[[ Line: 879 ]]
        -- upvalues: v124 (copy)
        if v124:has(v254) then
            return v254;
        else
            local l_alternate_0 = v254.alternate;
            if l_alternate_0 ~= nil and v124:has(l_alternate_0) then
                return l_alternate_0;
            else
                v124:add(v254);
                return v254;
            end;
        end;
    end;
    local function v259(v256, v257) --[[ Line: 895 ]] --[[ Name: getChangeDescription ]]
        -- upvalues: v214 (ref), l_ElementTypeClass_0 (ref), l_ElementTypeFunction_0 (ref), l_ElementTypeMemo_0 (ref), l_ElementTypeForwardRef_0 (ref), l_ElementTypeHostComponent_0 (ref), v215 (ref), v216 (ref), v204 (ref)
        local v258 = v214(v257);
        if v258 == l_ElementTypeClass_0 or v258 == l_ElementTypeFunction_0 or v258 == l_ElementTypeMemo_0 or v258 == l_ElementTypeForwardRef_0 or v258 == l_ElementTypeHostComponent_0 then
            if v256 == nil then
                return {
                    context = nil, 
                    didHooksChange = false, 
                    isFirstMount = true, 
                    props = nil, 
                    state = nil
                };
            else
                return {
                    context = v215(v257), 
                    didHooksChange = v216(v256.memoizedState, v257.memoizedState), 
                    isFirstMount = false, 
                    props = v204(v256.memoizedProps, v257.memoizedProps), 
                    state = v204(v256.memoizedState, v257.memoizedState)
                };
            end;
        else
            return nil;
        end;
    end;
    local function _(v260) --[[ Line: 939 ]] --[[ Name: updateContextsForFiber ]]
        -- upvalues: v214 (ref), l_ElementTypeClass_0 (ref), v187 (ref), v208 (ref), v122 (copy), l_getUID_0 (ref), v123 (copy), v217 (ref)
        if v214(v260) == l_ElementTypeClass_0 and v187 ~= nil then
            local v261 = v208(v260);
            if not v122:has(v261) then
                local v262 = l_getUID_0();
                v122:set(v261, v262);
                v123:set(v262, v261);
            end;
            local v263 = v122:get(v261);
            v261 = v217(v260);
            if v261 ~= nil then
                v187:set(v263, v261);
            end;
        end;
    end;
    local v265 = {};
    v217 = function(v266) --[[ Line: 955 ]]
        -- upvalues: v214 (ref), l_ElementTypeClass_0 (ref), v265 (copy), l_Object_0 (ref)
        if v214(v266) == l_ElementTypeClass_0 then
            local l_stateNode_0 = v266.stateNode;
            local l_v265_0 = v265;
            local l_v265_1 = v265;
            if l_stateNode_0 ~= nil then
                if l_stateNode_0.constructor and l_stateNode_0.constructor.contextType ~= nil then
                    l_v265_1 = l_stateNode_0.context;
                else
                    l_v265_0 = l_stateNode_0.context;
                    if l_v265_0 and #l_Object_0.keys(l_v265_0) == 0 then
                        l_v265_0 = v265;
                    end;
                end;
            end;
            return {
                l_v265_0, 
                l_v265_1
            };
        else
            return nil;
        end;
    end;
    local function v270(v271) --[[ Line: 978 ]] --[[ Name: crawlToInitializeContextsMap ]]
        -- upvalues: v214 (ref), l_ElementTypeClass_0 (ref), v187 (ref), v208 (ref), v122 (copy), l_getUID_0 (ref), v123 (copy), v217 (ref), v270 (copy)
        if v214(v271) == l_ElementTypeClass_0 and v187 ~= nil then
            local v272 = v208(v271);
            if not v122:has(v272) then
                local v273 = l_getUID_0();
                v122:set(v272, v273);
                v123:set(v273, v272);
            end;
            local v274 = v122:get(v272);
            v272 = v217(v271);
            if v272 ~= nil then
                v187:set(v274, v272);
            end;
        end;
        local l_child_0 = v271.child;
        while l_child_0 ~= nil do
            v270(l_child_0);
            l_child_0 = l_child_0.sibling;
        end;
    end;
    v215 = function(v276) --[[ Line: 987 ]]
        -- upvalues: v214 (ref), l_ElementTypeClass_0 (ref), v187 (ref), v208 (ref), v122 (copy), l_getUID_0 (ref), v123 (copy), v217 (ref), v265 (copy), v204 (ref)
        if v214(v276) == l_ElementTypeClass_0 and v187 ~= nil then
            local v277 = v208(v276);
            if not v122:has(v277) then
                local v278 = l_getUID_0();
                v122:set(v277, v278);
                v123:set(v278, v277);
            end;
            local v279 = v122:get(v277);
            v277 = if v187:has(v279) then v187:get(v279) else nil;
            local v280 = v217(v276);
            if v277 == nil or v280 == nil then
                return nil;
            else
                local v281 = v277[1];
                local v282 = v277[2];
                local v283 = v280[1];
                local v284 = v280[2];
                if v283 ~= v265 then
                    return v204(v281, v283);
                elseif v284 ~= v265 then
                    return v282 ~= v284;
                end;
            end;
        end;
        return nil;
    end;
    local _ = function(v285) --[[ Line: 1015 ]] --[[ Name: getHighestIndex ]]
        local v286 = 0;
        for v287, _ in v285 do
            if v286 < v287 then
                v286 = v287;
            end;
        end;
        return v286;
    end;
    local function v300(v290, v291) --[[ Line: 1022 ]] --[[ Name: areHookInputsEqual ]]
        -- upvalues: l_objectIs_0 (ref)
        if v291 == nil then
            return false;
        else
            local v292 = 0;
            for v293, _ in v291 do
                if v292 < v293 then
                    v292 = v293;
                end;
            end;
            local l_v292_0 = v292;
            local v296 = 0;
            for v297, _ in v290 do
                if v296 < v297 then
                    v296 = v297;
                end;
            end;
            if l_v292_0 ~= v296 then
                return false;
            else
                for v299 = 1, l_v292_0 do
                    if not l_objectIs_0(v290[v299], v291[v299]) then
                        return false;
                    end;
                end;
                return true;
            end;
        end;
    end;
    local function v303(v301) --[[ Line: 1043 ]] --[[ Name: isEffect ]]
        -- upvalues: l_Array_0 (ref)
        local v302 = false;
        if v301 ~= nil then
            v302 = false;
            if typeof(v301) == "table" then
                v302 = false;
                if v301.tag ~= nil then
                    v302 = false;
                    if v301.create ~= nil then
                        v302 = false;
                        if v301.destroy ~= nil then
                            v302 = false;
                            if v301.deps ~= nil then
                                v302 = (not (v301.deps ~= nil) or l_Array_0.isArray(v301.deps)) and v301.next;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return v302;
    end;
    local function _(v304, v305) --[[ Line: 1054 ]] --[[ Name: didHookChange ]]
        -- upvalues: v303 (copy), v300 (copy)
        local l_memoizedState_0 = v304.memoizedState;
        local l_memoizedState_1 = v305.memoizedState;
        if v303(l_memoizedState_0) and v303(l_memoizedState_1) then
            local v308 = false;
            if l_memoizedState_0 ~= l_memoizedState_1 then
                v308 = not v300(l_memoizedState_1.deps, l_memoizedState_0.deps);
            end;
            return v308;
        else
            return l_memoizedState_1 ~= l_memoizedState_0;
        end;
    end;
    v216 = function(v310, v311) --[[ Line: 1064 ]]
        -- upvalues: v303 (copy), v300 (copy)
        if v310 == nil or v311 == nil then
            return false;
        else
            if v311.baseState and v311.memoizedState and v311.next and v311.queue then
                while v311 ~= nil do
                    local l_v310_0 = v310;
                    local l_v311_0 = v311;
                    local l_memoizedState_2 = l_v310_0.memoizedState;
                    local l_memoizedState_3 = l_v311_0.memoizedState;
                    if if v303(l_memoizedState_2) and v303(l_memoizedState_3) then l_memoizedState_2 ~= l_memoizedState_3 and not v300(l_memoizedState_3.deps, l_memoizedState_2.deps) else l_memoizedState_3 ~= l_memoizedState_2 then
                        return true;
                    else
                        v311 = v311.next;
                        v310 = v310.next;
                    end;
                end;
            end;
            return false;
        end;
    end;
    v204 = function(v316, v317) --[[ Line: 1090 ]]
        -- upvalues: l_Set_0 (ref), l_Array_0 (ref), l_Object_0 (ref)
        if v316 == nil or v317 == nil then
            return nil;
        elseif v317.baseState ~= nil and v317.memoizedState ~= nil and v317.next ~= nil and v317.queue ~= nil then
            return nil;
        else
            local v318 = l_Set_0.new(l_Array_0.concat(l_Object_0.keys(v316), l_Object_0.keys(v317)));
            local v319 = {};
            for _, v321 in v318 do
                if v316[v321] ~= v317[v321] then
                    table.insert(v319, v321);
                end;
            end;
            return v319;
        end;
    end;
    local function v326(v322, v323) --[[ Line: 1118 ]] --[[ Name: didFiberRender ]]
        -- upvalues: l_ClassComponent_1 (copy), l_FunctionComponent_1 (copy), l_ContextConsumer_0 (copy), l_MemoComponent_1 (copy), l_SimpleMemoComponent_1 (copy), l_PerformedWork_0 (copy)
        local l_tag_3 = v323.tag;
        if l_tag_3 == l_ClassComponent_1 or l_tag_3 == l_FunctionComponent_1 or l_tag_3 == l_ContextConsumer_0 or l_tag_3 == l_MemoComponent_1 or l_tag_3 == l_SimpleMemoComponent_1 then
            return bit32.band(if v323.flags ~= nil then v323.flags else v323.effectTag, l_PerformedWork_0) == l_PerformedWork_0;
        else
            local v325 = true;
            if v322.memoizedProps == v323.memoizedProps then
                v325 = true;
                if v322.memoizedState == v323.memoizedState then
                    v325 = v322.ref ~= v323.ref;
                end;
            end;
            return v325;
        end;
    end;
    local v327 = {};
    local v328 = {};
    local v329 = {};
    local v330 = {};
    local v331 = l_Map_0.new();
    local v332 = 0;
    local v333 = nil;
    local function _(v334) --[[ Line: 1150 ]] --[[ Name: pushOperation ]]
        -- upvalues: v121 (copy), l_Number_0 (ref), l_console_0 (ref), v327 (ref)
        if v121.__DEV__ and not l_Number_0.isInteger(v334) then
            l_console_0.error("pushOperation() was called but the value is not an integer.", v334);
        end;
        table.insert(v327, v334);
    end;
    v213 = function(_) --[[ Line: 1162 ]]
        -- upvalues: v327 (ref), v328 (ref), v329 (ref), v333 (ref), v190 (ref), v119 (copy), v127 (ref), v332 (ref), v331 (copy), l_TREE_OPERATION_REMOVE_0 (ref), v330 (ref), v118 (copy)
        if #v327 == 0 and #v328 == 0 and #v329 == 0 and v333 == nil and not v190 then
            return;
        else
            local v337 = #v328 + #v329 + (v333 == nil and 0 or 1);
            local v338 = {};
            local v339 = 1;
            local function _() --[[ Line: 1208 ]] --[[ Name: POSTFIX_INCREMENT ]]
                -- upvalues: v339 (ref)
                local l_v339_0 = v339;
                v339 = v339 + 1;
                return l_v339_0;
            end;
            local l_v339_1 = v339;
            v339 = v339 + 1;
            v338[l_v339_1] = v119;
            l_v339_1 = v339;
            v339 = v339 + 1;
            v338[l_v339_1] = v127;
            l_v339_1 = v339;
            v339 = v339 + 1;
            v338[l_v339_1] = v332;
            local v343 = #v338;
            v331:forEach(function(v344, v345) --[[ Line: 1225 ]]
                -- upvalues: v338 (copy), v343 (copy), v339 (ref)
                v338[v343 + v344] = v345;
                local _ = v339;
                v339 = v339 + 1;
            end);
            if v337 > 0 then
                local l_v339_3 = v339;
                v339 = v339 + 1;
                v338[l_v339_3] = l_TREE_OPERATION_REMOVE_0;
                l_v339_3 = v339;
                v339 = v339 + 1;
                v338[l_v339_3] = v337;
                for v348 = #v328, 1, -1 do
                    local l_v339_4 = v339;
                    v339 = v339 + 1;
                    v338[l_v339_4] = v328[v348];
                end;
                for v350 = 1, #v329 do
                    v338[v339 + v350 - 1] = v329[v350];
                end;
                l_v339_1 = #v329;
                v339 = v339 + l_v339_1;
                if v333 ~= nil then
                    v338[v339] = v333;
                    v339 = v339 + 1;
                end;
            end;
            for v351 = 1, #v327 do
                v338[v339 + v351 - 1] = v327[v351];
            end;
            l_v339_1 = #v327;
            v339 = v339 + l_v339_1;
            if v330 ~= nil then
                table.insert(v330, v338);
            else
                v118.emit("operations", v338);
            end;
            v327 = {};
            v328 = {};
            v329 = {};
            v333 = nil;
            v331:clear();
            v332 = 0;
            return;
        end;
    end;
    local function _(v352) --[[ Line: 1300 ]] --[[ Name: getStringID ]]
        -- upvalues: v331 (copy), v332 (ref)
        if v352 == nil or v352 == "" then
            return 0;
        else
            local v353 = v331:get(v352);
            if v353 ~= nil then
                return v353;
            else
                local v354 = v331.size + 1;
                v331:set(v352, v354);
                v332 = v332 + 1;
                return v354;
            end;
        end;
    end;
    local function v382(v356, v357) --[[ Line: 1325 ]] --[[ Name: recordMount ]]
        -- upvalues: v121 (copy), v179 (copy), l_HostRoot_1 (copy), v208 (ref), v122 (copy), l_getUID_0 (ref), v123 (copy), l_TREE_OPERATION_ADD_0 (ref), l_Number_0 (ref), l_console_0 (ref), v327 (ref), l_ElementTypeRoot_0 (ref), v190 (ref), v186 (ref), v218 (ref), l_getDisplayNameForFiber_0 (copy), v214 (ref), l_Boolean_0 (ref), v331 (copy), v332 (ref), v126 (copy), v127 (ref), v219 (ref)
        if v121.__DEBUG__ then
            v179("recordMount()", v356, v357);
        end;
        local v358 = v356.tag == l_HostRoot_1;
        local v359 = v208(v356);
        if not v122:has(v359) then
            local v360 = l_getUID_0();
            v122:set(v359, v360);
            v123:set(v360, v359);
        end;
        local v361 = v122:get(v359);
        v359 = v356._debugOwner ~= nil;
        local v362 = v356.treeBaseDuration ~= nil;
        if v358 then
            local l_l_TREE_OPERATION_ADD_0_0 = l_TREE_OPERATION_ADD_0;
            if v121.__DEV__ and not l_Number_0.isInteger(l_l_TREE_OPERATION_ADD_0_0) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", l_l_TREE_OPERATION_ADD_0_0);
            end;
            table.insert(v327, l_l_TREE_OPERATION_ADD_0_0);
            if v121.__DEV__ and not l_Number_0.isInteger(v361) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", v361);
            end;
            table.insert(v327, v361);
            l_l_TREE_OPERATION_ADD_0_0 = l_ElementTypeRoot_0;
            if v121.__DEV__ and not l_Number_0.isInteger(l_l_TREE_OPERATION_ADD_0_0) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", l_l_TREE_OPERATION_ADD_0_0);
            end;
            table.insert(v327, l_l_TREE_OPERATION_ADD_0_0);
            l_l_TREE_OPERATION_ADD_0_0 = v362 and 1 or 0;
            if v121.__DEV__ and not l_Number_0.isInteger(l_l_TREE_OPERATION_ADD_0_0) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", l_l_TREE_OPERATION_ADD_0_0);
            end;
            table.insert(v327, l_l_TREE_OPERATION_ADD_0_0);
            l_l_TREE_OPERATION_ADD_0_0 = v359 and 1 or 0;
            if v121.__DEV__ and not l_Number_0.isInteger(l_l_TREE_OPERATION_ADD_0_0) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", l_l_TREE_OPERATION_ADD_0_0);
            end;
            table.insert(v327, l_l_TREE_OPERATION_ADD_0_0);
            if v190 and v186 ~= nil then
                v186:set(v361, v218(v356));
            end;
        else
            local l_key_0 = v356.key;
            local v365 = l_getDisplayNameForFiber_0(v356);
            local v366 = v214(v356);
            local l__debugOwner_0 = v356._debugOwner;
            local v368;
            if l__debugOwner_0 ~= nil then
                local v369 = v208(l__debugOwner_0);
                if not v122:has(v369) then
                    local v370 = l_getUID_0();
                    v122:set(v369, v370);
                    v123:set(v370, v369);
                end;
                v368 = v122:get(v369);
            else
                v368 = 0;
            end;
            local v371;
            if l_Boolean_0.toJSBoolean(v357) then
                local v372 = v208(v357);
                if not v122:has(v372) then
                    local v373 = l_getUID_0();
                    v122:set(v372, v373);
                    v123:set(v373, v372);
                end;
                v371 = v122:get(v372);
            else
                v371 = 0;
            end;
            local v374;
            if v365 == nil or v365 == "" then
                v374 = 0;
            else
                local v375 = v331:get(v365);
                if v375 ~= nil then
                    v374 = v375;
                else
                    local v376 = v331.size + 1;
                    v331:set(v365, v376);
                    v332 = v332 + 1;
                    v374 = v376;
                end;
            end;
            local v377 = if l_key_0 == nil then nil else tostring(l_key_0);
            local v378;
            if v377 == nil or v377 == "" then
                v378 = 0;
            else
                local v379 = v331:get(v377);
                if v379 ~= nil then
                    v378 = v379;
                else
                    local v380 = v331.size + 1;
                    v331:set(v377, v380);
                    v332 = v332 + 1;
                    v378 = v380;
                end;
            end;
            local l_l_TREE_OPERATION_ADD_0_1 = l_TREE_OPERATION_ADD_0;
            if v121.__DEV__ and not l_Number_0.isInteger(l_l_TREE_OPERATION_ADD_0_1) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", l_l_TREE_OPERATION_ADD_0_1);
            end;
            table.insert(v327, l_l_TREE_OPERATION_ADD_0_1);
            if v121.__DEV__ and not l_Number_0.isInteger(v361) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", v361);
            end;
            table.insert(v327, v361);
            if v121.__DEV__ and not l_Number_0.isInteger(v366) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", v366);
            end;
            table.insert(v327, v366);
            if v121.__DEV__ and not l_Number_0.isInteger(v371) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", v371);
            end;
            table.insert(v327, v371);
            if v121.__DEV__ and not l_Number_0.isInteger(v368) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", v368);
            end;
            table.insert(v327, v368);
            if v121.__DEV__ and not l_Number_0.isInteger(v374) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", v374);
            end;
            table.insert(v327, v374);
            if v121.__DEV__ and not l_Number_0.isInteger(v378) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", v378);
            end;
            table.insert(v327, v378);
        end;
        if v362 then
            v126:set(v361, v127);
            v219(v356);
        end;
    end;
    v210 = function(v383, v384) --[[ Line: 1383 ]]
        -- upvalues: v121 (copy), v179 (copy), v201 (ref), v207 (ref), l_HostRoot_1 (copy), v208 (ref), v122 (copy), v124 (copy), l_getUID_0 (ref), v123 (copy), v333 (ref), v249 (copy), v329 (ref), v328 (ref), v126 (copy), v125 (copy)
        if v121.__DEBUG__ then
            v179("recordUnmount()", v383);
        end;
        if v201 ~= nil and (v383 == v201 or v383 == v201.alternate) then
            v207(nil);
        end;
        local v385 = v383.tag == l_HostRoot_1;
        local v386 = v208(v383);
        if not v122:has(v386) then
            v124:delete(v386);
            return;
        else
            if not v122:has(v386) then
                local v387 = l_getUID_0();
                v122:set(v386, v387);
                v123:set(v387, v386);
            end;
            local v388 = v122:get(v386);
            if v385 then
                v333 = v388;
            elseif not v249(v383) then
                if v384 then
                    table.insert(v329, v388);
                else
                    table.insert(v328, v388);
                end;
            end;
            v122:delete(v386);
            v123:delete(v388);
            v124:delete(v386);
            if v383.treeBaseDuration ~= nil then
                v126:delete(v388);
                v125:delete(v388);
            end;
            return;
        end;
    end;
    v205 = function(v389, v390, v391, v392) --[[ Line: 1443 ]]
        -- upvalues: l___DEBUG___0 (ref), v179 (copy), v220 (ref), v249 (copy), v382 (copy), v198 (ref), v214 (ref), l_ElementTypeHostComponent_0 (ref), v199 (copy), l_ReactTypeOfWork_0 (copy), v205 (ref), l_OffscreenComponent_0 (copy), v221 (ref)
        if l___DEBUG___0 then
            v179("mountFiberRecursively()", v389, v390);
        end;
        local v393 = v220(v389);
        local v394 = not v249(v389);
        if v394 then
            v382(v389, v390);
        end;
        if v198 and v392 and v214(v389) == l_ElementTypeHostComponent_0 then
            v199:add(v389.stateNode);
            v392 = false;
        end;
        if v389.tag == l_ReactTypeOfWork_0.SuspenseComponent then
            if v389.memoizedState ~= nil then
                local l_child_1 = v389.child;
                local v396 = if l_child_1 then l_child_1.sibling else nil;
                local v397 = if v396 then v396.child else nil;
                if v397 ~= nil then
                    v205(v397, if v394 then v389 else v390, true, v392);
                end;
            else
                local v398 = nil;
                if l_OffscreenComponent_0 == -1 then
                    v398 = v389.child;
                elseif v389.child ~= nil then
                    v398 = v389.child.child;
                end;
                if v398 ~= nil then
                    v205(v398, if v394 then v389 else v390, true, v392);
                end;
            end;
        elseif v389.child ~= nil then
            v205(v389.child, if v394 then v389 else v390, true, v392);
        end;
        v221(v393);
        if v391 and v389.sibling ~= nil then
            v205(v389.sibling, v390, true, v392);
        end;
    end;
    v209 = function(v399) --[[ Line: 1546 ]]
        -- upvalues: v121 (copy), v179 (copy), l_ReactTypeOfWork_0 (copy), v209 (ref), v210 (ref)
        if v121.__DEBUG__ then
            v179("unmountFiberChildrenRecursively()", v399);
        end;
        local v400 = false;
        if v399.tag == l_ReactTypeOfWork_0.SuspenseComponent then
            v400 = v399.memoizedState ~= nil;
        end;
        local l_child_2 = v399.child;
        if v400 then
            local l_child_3 = v399.child;
            local v403 = if l_child_3 then l_child_3.sibling else nil;
            l_child_2 = if v403 then v403.child else nil;
        end;
        while l_child_2 ~= nil do
            if l_child_2.return_ ~= nil then
                v209(l_child_2);
                v210(l_child_2, true);
            end;
            l_child_2 = l_child_2.sibling;
        end;
    end;
    v219 = function(v404) --[[ Line: 1579 ]]
        -- upvalues: v208 (ref), v122 (copy), l_getUID_0 (ref), v123 (copy), v125 (copy), v190 (ref), l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0 (ref), v121 (copy), l_Number_0 (ref), l_console_0 (ref), v327 (ref), v326 (copy), v185 (ref), v192 (ref), v259 (copy), v214 (ref), l_ElementTypeClass_0 (ref), v187 (ref), v217 (ref)
        local v405 = v208(v404);
        if not v122:has(v405) then
            local v406 = l_getUID_0();
            v122:set(v405, v406);
            v123:set(v406, v405);
        end;
        local v407 = v122:get(v405);
        v405 = v404.actualDuration;
        local l_treeBaseDuration_0 = v404.treeBaseDuration;
        v125:set(v407, l_treeBaseDuration_0 or 0);
        if v190 then
            local l_alternate_1 = v404.alternate;
            if l_alternate_1 == nil or l_treeBaseDuration_0 ~= l_alternate_1.treeBaseDuration then
                local v410 = math.floor((l_treeBaseDuration_0 or 0) * 1000);
                local l_l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0_0 = l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0;
                if v121.__DEV__ and not l_Number_0.isInteger(l_l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0_0) then
                    l_console_0.error("pushOperation() was called but the value is not an integer.", l_l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0_0);
                end;
                table.insert(v327, l_l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0_0);
                if v121.__DEV__ and not l_Number_0.isInteger(v407) then
                    l_console_0.error("pushOperation() was called but the value is not an integer.", v407);
                end;
                table.insert(v327, v407);
                if v121.__DEV__ and not l_Number_0.isInteger(v410) then
                    l_console_0.error("pushOperation() was called but the value is not an integer.", v410);
                end;
                table.insert(v327, v410);
            end;
            if (l_alternate_1 == nil or v326(l_alternate_1, v404)) and v405 ~= nil then
                local l_v405_0 = v405;
                local l_child_4 = v404.child;
                while l_child_4 ~= nil do
                    l_v405_0 = l_v405_0 - (l_child_4.actualDuration or 0);
                    l_child_4 = l_child_4.sibling;
                end;
                local l_v185_0 = v185;
                table.insert(l_v185_0.durations, v407);
                table.insert(l_v185_0.durations, v405);
                table.insert(l_v185_0.durations, l_v405_0);
                l_v185_0.maxActualDuration = math.max(l_v185_0.maxActualDuration, v405);
                if v192 then
                    local v415 = v259(l_alternate_1, v404);
                    if v415 ~= nil and l_v185_0.changeDescriptions ~= nil then
                        l_v185_0.changeDescriptions:set(v407, v415);
                    end;
                    if v214(v404) == l_ElementTypeClass_0 and v187 ~= nil then
                        local v416 = v208(v404);
                        if not v122:has(v416) then
                            local v417 = l_getUID_0();
                            v122:set(v416, v417);
                            v123:set(v417, v416);
                        end;
                        local v418 = v122:get(v416);
                        v416 = v217(v404);
                        if v416 ~= nil then
                            v187:set(v418, v416);
                        end;
                    end;
                end;
            end;
        end;
    end;
    local function v429(v419, v420) --[[ Line: 1649 ]] --[[ Name: recordResetChildren ]]
        -- upvalues: v222 (ref), l_TREE_OPERATION_REORDER_CHILDREN_0 (ref), v121 (copy), l_Number_0 (ref), l_console_0 (ref), v327 (ref), v208 (ref), v122 (copy), l_getUID_0 (ref), v123 (copy)
        local v421 = {};
        local l_v420_0 = v420;
        while l_v420_0 ~= nil do
            v222(l_v420_0, v421);
            l_v420_0 = l_v420_0.sibling;
        end;
        local v423 = #v421;
        if v423 < 2 then
            return;
        else
            local l_l_TREE_OPERATION_REORDER_CHILDREN_0_0 = l_TREE_OPERATION_REORDER_CHILDREN_0;
            if v121.__DEV__ and not l_Number_0.isInteger(l_l_TREE_OPERATION_REORDER_CHILDREN_0_0) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", l_l_TREE_OPERATION_REORDER_CHILDREN_0_0);
            end;
            table.insert(v327, l_l_TREE_OPERATION_REORDER_CHILDREN_0_0);
            local v425 = v208(v419);
            if not v122:has(v425) then
                local v426 = l_getUID_0();
                v122:set(v425, v426);
                v123:set(v426, v425);
            end;
            l_l_TREE_OPERATION_REORDER_CHILDREN_0_0 = v122:get(v425);
            if v121.__DEV__ and not l_Number_0.isInteger(l_l_TREE_OPERATION_REORDER_CHILDREN_0_0) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", l_l_TREE_OPERATION_REORDER_CHILDREN_0_0);
            end;
            table.insert(v327, l_l_TREE_OPERATION_REORDER_CHILDREN_0_0);
            if v121.__DEV__ and not l_Number_0.isInteger(v423) then
                l_console_0.error("pushOperation() was called but the value is not an integer.", v423);
            end;
            table.insert(v327, v423);
            for v427 = 1, #v421 do
                local v428 = v421[v427];
                if v121.__DEV__ and not l_Number_0.isInteger(v428) then
                    l_console_0.error("pushOperation() was called but the value is not an integer.", v428);
                end;
                table.insert(v327, v428);
            end;
            return;
        end;
    end;
    v222 = function(v430, v431) --[[ Line: 1681 ]]
        -- upvalues: v249 (copy), v208 (ref), v122 (copy), l_getUID_0 (ref), v123 (copy), v222 (ref)
        if not v249(v430) then
            local v432 = v208(v430);
            if not v122:has(v432) then
                local v433 = l_getUID_0();
                v122:set(v432, v433);
                v123:set(v433, v432);
            end;
            table.insert(v431, (v122:get(v432)));
            return;
        else
            local l_child_5 = v430.child;
            while l_child_5 ~= nil do
                v222(l_child_5, v431);
                l_child_5 = l_child_5.sibling;
            end;
            return;
        end;
    end;
    local function v435(v436, v437, v438, v439) --[[ Line: 1694 ]] --[[ Name: updateFiberRecursively ]]
        -- upvalues: v121 (copy), v179 (copy), v198 (ref), v214 (ref), l_ElementTypeHostComponent_0 (ref), v199 (copy), l_ElementTypeFunction_0 (ref), l_ElementTypeClass_0 (ref), l_ElementTypeContext_0 (ref), v326 (copy), v194 (ref), v208 (ref), v122 (copy), l_getUID_0 (ref), v123 (copy), v195 (ref), v249 (copy), l_SuspenseComponent_1 (copy), v435 (copy), v205 (ref), v209 (ref), v206 (ref), v219 (ref), v429 (copy)
        if v121.__DEBUG__ then
            v179("updateFiberRecursively()", v436, v438);
        end;
        if v198 then
            local v440 = v214(v436);
            if v439 then
                if v440 == l_ElementTypeHostComponent_0 then
                    v199:add(v436.stateNode);
                    v439 = false;
                end;
            elseif v440 == l_ElementTypeFunction_0 or v440 == l_ElementTypeClass_0 or v440 == l_ElementTypeContext_0 then
                v439 = v326(v437, v436);
            end;
        end;
        if v194 ~= nil then
            local l_id_0 = v194.id;
            local v442 = v208(v436);
            if not v122:has(v442) then
                local v443 = l_getUID_0();
                v122:set(v442, v443);
                v123:set(v443, v442);
            end;
            if l_id_0 == v122:get(v442) and v326(v437, v436) then
                v195 = true;
            end;
        end;
        local v444 = not v249(v436);
        local v445 = v436.tag == l_SuspenseComponent_1;
        local v446 = false;
        local v447 = v445 and v437.memoizedState ~= nil;
        local v448 = v445 and v436.memoizedState ~= nil;
        if v447 and v448 then
            local l_child_6 = v436.child;
            local v450 = if l_child_6 then l_child_6.sibling else nil;
            local l_child_7 = v437.child;
            local v452 = if l_child_7 then l_child_7.sibling else nil;
            if v450 ~= nil and v452 ~= nil and v435(v450, v452, v436, v439) then
                v446 = true;
            end;
        elseif v447 and not v448 then
            local l_child_8 = v436.child;
            if l_child_8 ~= nil then
                v205(l_child_8, v436, true, v439);
            end;
            v446 = true;
        elseif not v447 and v448 then
            v209(v437);
            local l_child_9 = v436.child;
            local v455 = if l_child_9 then l_child_9.sibling else nil;
            if v455 ~= nil then
                v205(v455, v436, true, v439);
                v446 = true;
            end;
        elseif v436.child ~= v437.child then
            local l_child_10 = v436.child;
            local l_child_11 = v437.child;
            while l_child_10 do
                if l_child_10.alternate then
                    local l_alternate_2 = l_child_10.alternate;
                    if v435(l_child_10, l_alternate_2, if v444 then v436 else v438, v439) then
                        v446 = true;
                    end;
                    if l_alternate_2 ~= l_child_11 then
                        v446 = true;
                    end;
                else
                    v205(l_child_10, if v444 then v436 else v438, false, v439);
                    v446 = true;
                end;
                l_child_10 = l_child_10.sibling;
                if not v446 and l_child_11 ~= nil then
                    l_child_11 = l_child_11.sibling;
                end;
            end;
            if l_child_11 ~= nil then
                v446 = true;
            end;
        elseif v198 and v439 then
            local l_v206_0 = v206;
            local v460 = v208(v436);
            if not v122:has(v460) then
                local v461 = l_getUID_0();
                v122:set(v460, v461);
                v123:set(v461, v460);
            end;
            for _, v463 in (l_v206_0((v122:get(v460)))) do
                v199:add(v463.stateNode);
            end;
        end;
        if v444 and v436.treeBaseDuration ~= nil then
            v219(v436);
        end;
        if v446 then
            if v444 then
                local l_child_12 = v436.child;
                if v448 then
                    local l_child_13 = v436.child;
                    l_child_12 = if l_child_13 then l_child_13.sibling else nil;
                end;
                if l_child_12 ~= nil then
                    v429(v436, l_child_12);
                end;
                return false;
            else
                return true;
            end;
        else
            return false;
        end;
    end;
    local function v466() --[[ Line: 1934 ]] --[[ Name: cleanup ]]

    end;
    local function v475() --[[ Line: 1938 ]] --[[ Name: flushInitialOperations ]]
        -- upvalues: v330 (ref), v118 (copy), v200 (ref), v203 (ref), v119 (copy), v127 (ref), v208 (ref), v122 (copy), l_getUID_0 (ref), v123 (copy), v211 (ref), v190 (ref), l_Array_0 (ref), v185 (ref), v192 (ref), l_Map_0 (ref), v191 (ref), l_Object_0 (ref), v205 (ref), v213 (ref)
        local l_v330_0 = v330;
        v330 = nil;
        if l_v330_0 ~= nil and #l_v330_0 > 0 then
            for _, v469 in l_v330_0 do
                v118.emit("operations", v469);
            end;
            return;
        else
            if v200 ~= nil then
                v203 = true;
            end;
            v118.getFiberRoots(v119):forEach(function(v470) --[[ Line: 1958 ]]
                -- upvalues: v127 (ref), v208 (ref), v122 (ref), l_getUID_0 (ref), v123 (ref), v211 (ref), v190 (ref), l_Array_0 (ref), v185 (ref), v192 (ref), l_Map_0 (ref), v191 (ref), l_Object_0 (ref), v205 (ref), v213 (ref)
                local v471 = v208(v470.current);
                if not v122:has(v471) then
                    local v472 = l_getUID_0();
                    v122:set(v471, v472);
                    v123:set(v472, v471);
                end;
                v127 = v122:get(v471);
                v211(v127, v470.current);
                if v190 and v470.memoizedInteractions ~= nil then
                    local _ = l_Array_0.from(v470.memoizedInteractions);
                    v185 = {
                        changeDescriptions = if v192 then l_Map_0.new() else nil, 
                        durations = {}, 
                        commitTime = os.clock() - v191, 
                        interactions = l_Array_0.map(l_Array_0.from(v470.memoizedInteractions), function(v474) --[[ Line: 1979 ]]
                            -- upvalues: l_Object_0 (ref), v191 (ref)
                            return (l_Object_0.assign({}, v474, {
                                timestamp = v474.timestamp - v191
                            }));
                        end), 
                        maxActualDuration = 0, 
                        priorityLevel = nil
                    };
                end;
                v205(v470.current, nil, false, false);
                v213(v470);
                v127 = -1;
            end);
            return;
        end;
    end;
    local function v477(v476) --[[ Line: 1999 ]] --[[ Name: handleCommitFiberUnmount ]]
        -- upvalues: v210 (ref)
        v210(v476, false);
    end;
    local function _(v478) --[[ Line: 2006 ]]
        -- upvalues: l_ImmediatePriority_0 (copy), l_UserBlockingPriority_0 (copy), l_NormalPriority_0 (copy), l_LowPriority_0 (copy), l_IdlePriority_0 (copy)
        if v478 == nil then
            return "Unknown";
        elseif v478 == l_ImmediatePriority_0 then
            return "Immediate";
        elseif v478 == l_UserBlockingPriority_0 then
            return "User-Blocking";
        elseif v478 == l_NormalPriority_0 then
            return "Normal";
        elseif v478 == l_LowPriority_0 then
            return "Low";
        elseif v478 == l_IdlePriority_0 then
            return "Idle";
        else
            return "Unknown";
        end;
    end;
    local function v489(v480, v481) --[[ Line: 2026 ]] --[[ Name: handleCommitFiberRoot ]]
        -- upvalues: v127 (ref), v208 (ref), v122 (copy), l_getUID_0 (ref), v123 (copy), v200 (ref), v203 (ref), v198 (ref), v199 (copy), v190 (ref), l_Array_0 (ref), v185 (ref), v192 (ref), l_Map_0 (ref), v191 (ref), l_Object_0 (ref), l_ImmediatePriority_0 (copy), l_UserBlockingPriority_0 (copy), l_NormalPriority_0 (copy), l_LowPriority_0 (copy), l_IdlePriority_0 (copy), v211 (ref), v205 (ref), v435 (copy), v212 (ref), v210 (ref), v193 (ref), v213 (ref), v118 (copy)
        local l_current_0 = v480.current;
        local l_alternate_3 = l_current_0.alternate;
        local v484 = v208(l_current_0);
        if not v122:has(v484) then
            local v485 = l_getUID_0();
            v122:set(v484, v485);
            v123:set(v485, v484);
        end;
        v127 = v122:get(v484);
        if v200 ~= nil then
            v203 = true;
        end;
        if v198 then
            v199:clear();
        end;
        local v486 = v480.memoizedInteractions ~= nil;
        if v190 and v486 then
            v484 = l_Array_0.from(v480.memoizedInteractions);
            v185 = {
                changeDescriptions = if v192 then l_Map_0.new() else nil, 
                durations = {}, 
                commitTime = os.clock() - v191, 
                interactions = l_Array_0.map(l_Array_0.from(v480.memoizedInteractions), function(v487) --[[ Line: 2057 ]]
                    -- upvalues: l_Object_0 (ref), v191 (ref)
                    return (l_Object_0.assign({}, v487, {
                        timestamp = v487.timestamp - v191
                    }));
                end), 
                maxActualDuration = 0, 
                priorityLevel = if v481 == nil then nil else v481 == nil and "Unknown" or v481 == l_ImmediatePriority_0 and "Immediate" or v481 == l_UserBlockingPriority_0 and "User-Blocking" or v481 == l_NormalPriority_0 and "Normal" or v481 == l_LowPriority_0 and "Low" or v481 == l_IdlePriority_0 and "Idle" or "Unknown"
            };
        end;
        if l_alternate_3 then
            v484 = false;
            if l_alternate_3.memoizedState ~= nil then
                v484 = l_alternate_3.memoizedState.element ~= nil;
            end;
            local v488 = false;
            if l_current_0.memoizedState ~= nil then
                v488 = l_current_0.memoizedState.element ~= nil;
            end;
            if not v484 and v488 then
                v211(v127, l_current_0);
                v205(l_current_0, nil, false, false);
            elseif v484 and v488 then
                v435(l_current_0, l_alternate_3, nil, false);
            elseif v484 and not v488 then
                v212(v127);
                v210(l_current_0, false);
            end;
        else
            v211(v127, l_current_0);
            v205(l_current_0, nil, false, false);
        end;
        if v190 and v486 then
            v484 = v193:get(v127);
            if v484 ~= nil then
                table.insert(v484, v185);
            else
                v193:set(v127, {
                    v185
                });
            end;
        end;
        v213(v480);
        if v198 then
            v118.emit("traceUpdates", v199);
        end;
        v127 = -1;
    end;
    v206 = function(v490) --[[ Line: 2123 ]]
        -- upvalues: v223 (ref), l_HostComponent_1 (copy), l_HostText_1 (copy)
        local v491 = {};
        local v492 = v223(v490);
        if not v492 then
            return v491;
        else
            local l_v492_0 = v492;
            while true do
                if l_v492_0.tag == l_HostComponent_1 or l_v492_0.tag == l_HostText_1 then
                    table.insert(v491, l_v492_0);
                elseif l_v492_0.child then
                    l_v492_0.child.return_ = l_v492_0;
                    l_v492_0 = l_v492_0.child;
                end;
                if l_v492_0 == v492 then
                    return v491;
                else
                    while true do
                        if not l_v492_0.sibling then
                            if not l_v492_0.return_ or l_v492_0.return_ == v492 then
                                return v491;
                            else
                                l_v492_0 = l_v492_0.return_;
                            end;
                        else
                            l_v492_0.sibling.return_ = l_v492_0.return_;
                            l_v492_0 = l_v492_0.sibling;
                            break;
                        end;
                    end;
                end;
            end;
        end;
    end;
    local function v502(v494) --[[ Line: 2163 ]] --[[ Name: findNativeNodesForFiberID ]]
        -- upvalues: v223 (ref), l_SuspenseComponent_1 (copy), v206 (ref), l_Array_0 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 2165 ]]
            -- upvalues: v223 (ref), v494 (copy), l_SuspenseComponent_1 (ref), v206 (ref), l_Array_0 (ref)
            local v495 = v223(v494);
            if v495 == nil then
                return nil;
            else
                local v496 = false;
                if v495.tag == l_SuspenseComponent_1 then
                    v496 = v495.memoizedState ~= nil;
                end;
                if v496 then
                    local v497 = v495.child and v495.child.sibling;
                    if v497 ~= nil then
                        v495 = v497;
                    end;
                end;
                local v498 = v206(v494);
                return (l_Array_0.map(v498, function(v499) --[[ Line: 2184 ]]
                    return v499.stateNode;
                end));
            end;
        end);
        if not l_status_0 then
            return nil;
        else
            return l_result_0;
        end;
    end;
    local function v505(v503) --[[ Line: 2197 ]] --[[ Name: getDisplayNameForFiberID ]]
        -- upvalues: v123 (copy), l_getDisplayNameForFiber_0 (copy)
        local v504 = v123:get(v503);
        if v504 ~= nil then
            return (l_getDisplayNameForFiber_0(v504));
        else
            return nil;
        end;
    end;
    local function v511(v506, v507) --[[ Line: 2202 ]] --[[ Name: getFiberIDForNative ]]
        -- upvalues: v120 (copy), v249 (copy), v208 (ref), v122 (copy), l_getUID_0 (ref), v123 (copy)
        v507 = v507 or false;
        local v508 = v120.findFiberByHostInstance(v506);
        if v508 ~= nil then
            if v507 then
                while v508 ~= nil and v249(v508) do
                    v508 = v508.return_;
                end;
            end;
            local v509 = v208(v508);
            if not v122:has(v509) then
                local v510 = l_getUID_0();
                v122:set(v509, v510);
                v123:set(v510, v509);
            end;
            return (v122:get(v509));
        else
            return nil;
        end;
    end;
    local function _(v512) --[[ Line: 2229 ]] --[[ Name: assertIsMounted ]]
        -- upvalues: l_invariant_0 (ref), l_getNearestMountedFiber_0 (ref)
        l_invariant_0(l_getNearestMountedFiber_0(v512) == v512, "Unable to find node on an unmounted component.");
    end;
    v223 = function(v514) --[[ Line: 2236 ]]
        -- upvalues: v123 (copy), l_console_0 (ref), l_getNearestMountedFiber_0 (ref), l_invariant_0 (ref), l_HostRoot_1 (copy)
        local v515 = v123:get(v514);
        if v515 == nil then
            l_console_0.warn(string.format("Could not find Fiber with id \"%s\"", (tostring(v514))));
            return nil;
        else
            local l_alternate_4 = v515.alternate;
            if not l_alternate_4 then
                local v517 = l_getNearestMountedFiber_0(v515);
                l_invariant_0(v517 ~= nil, "Unable to find node on an unmounted component.");
                if v517 ~= v515 then
                    return nil;
                else
                    return v515;
                end;
            else
                local l_v515_0 = v515;
                local l_l_alternate_4_0 = l_alternate_4;
                while true do
                    local l_return__0 = l_v515_0.return_;
                    if l_return__0 ~= nil then
                        local l_alternate_5 = l_return__0.alternate;
                        if l_alternate_5 == nil then
                            local l_return__1 = l_return__0.return_;
                            if l_return__1 ~= nil then
                                l_v515_0 = l_return__1;
                                l_l_alternate_4_0 = l_return__1;
                            else
                                break;
                            end;
                        else
                            if l_return__0.child == l_alternate_5.child then
                                local l_child_14 = l_return__0.child;
                                while true do
                                    if l_child_14 then
                                        if l_child_14 == l_v515_0 then
                                            l_invariant_0(l_getNearestMountedFiber_0(l_return__0) == l_return__0, "Unable to find node on an unmounted component.");
                                            return v515;
                                        elseif l_child_14 == l_l_alternate_4_0 then
                                            l_invariant_0(l_getNearestMountedFiber_0(l_return__0) == l_return__0, "Unable to find node on an unmounted component.");
                                            return l_alternate_4;
                                        else
                                            l_child_14 = l_child_14.sibling;
                                        end;
                                    else
                                        l_invariant_0(false, "Unable to find node on an unmounted component.");
                                        break;
                                    end;
                                end;
                            end;
                            if l_v515_0.return_ ~= l_l_alternate_4_0.return_ then
                                l_v515_0 = l_return__0;
                                l_l_alternate_4_0 = l_alternate_5;
                            else
                                local v524 = false;
                                local l_child_15 = l_return__0.child;
                                while l_child_15 do
                                    if l_child_15 == l_v515_0 then
                                        v524 = true;
                                        l_v515_0 = l_return__0;
                                        l_l_alternate_4_0 = l_alternate_5;
                                        break;
                                    elseif l_child_15 == l_l_alternate_4_0 then
                                        v524 = true;
                                        l_l_alternate_4_0 = l_return__0;
                                        l_v515_0 = l_alternate_5;
                                        break;
                                    else
                                        l_child_15 = l_child_15.sibling;
                                    end;
                                end;
                                if not v524 then
                                    l_child_15 = l_alternate_5.child;
                                    while l_child_15 do
                                        if l_child_15 == l_v515_0 then
                                            v524 = true;
                                            l_v515_0 = l_alternate_5;
                                            l_l_alternate_4_0 = l_return__0;
                                            break;
                                        elseif l_child_15 == l_l_alternate_4_0 then
                                            v524 = true;
                                            l_l_alternate_4_0 = l_alternate_5;
                                            l_v515_0 = l_return__0;
                                            break;
                                        else
                                            l_child_15 = l_child_15.sibling;
                                        end;
                                    end;
                                    l_invariant_0(v524, "Child was not found in either parent set. This indicates a bug " .. "in React related to the return pointer. Please file an issue.");
                                end;
                            end;
                            l_invariant_0(l_v515_0.alternate == l_l_alternate_4_0, "Return fibers should always be each others' alternates. " .. "This error is likely caused by a bug in React. Please file an issue.");
                        end;
                    else
                        break;
                    end;
                end;
                l_invariant_0(l_v515_0.tag == l_HostRoot_1, "Unable to find node on an unmounted component.");
                if l_v515_0.stateNode.current == l_v515_0 then
                    return v515;
                else
                    return l_alternate_4;
                end;
            end;
        end;
    end;
    local function v528(v526, v527) --[[ Line: 2382 ]] --[[ Name: prepareViewAttributeSource ]]
        -- upvalues: v224 (ref), l__G_0 (ref), l_getInObject_0 (ref), v194 (ref)
        if v224(v526) then
            l__G_0["$attribute"] = l_getInObject_0(v194, v527);
        end;
    end;
    local function v534(v529) --[[ Line: 2392 ]] --[[ Name: prepareViewElementSource ]]
        -- upvalues: v123 (copy), l_console_0 (ref), l_ClassComponent_1 (copy), l_FunctionComponent_1 (copy), l_IncompleteClassComponent_1 (copy), l_IndeterminateComponent_1 (copy), v121 (copy), l_ForwardRef_1 (copy), l_MemoComponent_1 (copy), l_SimpleMemoComponent_1 (copy)
        local v530 = v123:get(v529);
        if v530 == nil then
            l_console_0.warn(string.format("Could not find Fiber with id \"%s\"", (tostring(v529))));
            return;
        else
            local l_elementType_0 = v530.elementType;
            local l_tag_4 = v530.tag;
            local l_type_3 = v530.type;
            if l_tag_4 == l_ClassComponent_1 or l_tag_4 == l_FunctionComponent_1 or l_tag_4 == l_IncompleteClassComponent_1 or l_tag_4 == l_IndeterminateComponent_1 then
                v121["$type"] = l_type_3;
                return;
            elseif l_tag_4 == l_ForwardRef_1 then
                v121["$type"] = l_type_3.render;
                return;
            elseif l_tag_4 == l_MemoComponent_1 or l_tag_4 == l_SimpleMemoComponent_1 then
                v121["$type"] = l_elementType_0 ~= nil and l_elementType_0.type ~= nil and l_elementType_0.type or l_type_3;
                return;
            else
                v121["$type"] = nil;
                return;
            end;
        end;
    end;
    local function v545(v535) --[[ Line: 2422 ]] --[[ Name: getOwnersList ]]
        -- upvalues: v223 (ref), l_getDisplayNameForFiber_0 (copy), v214 (ref), l_Array_0 (ref), v208 (ref), v122 (copy), l_getUID_0 (ref), v123 (copy)
        local v536 = v223(v535);
        if v536 == nil then
            return nil;
        else
            local l__debugOwner_1 = v536._debugOwner;
            local v538 = {
                {
                    displayName = l_getDisplayNameForFiber_0(v536) or "Anonymous", 
                    id = v535, 
                    type = v214(v536)
                }
            };
            if l__debugOwner_1 then
                local l_l__debugOwner_1_0 = l__debugOwner_1;
                while l_l__debugOwner_1_0 ~= nil do
                    local l_unshift_0 = l_Array_0.unshift;
                    local l_v538_0 = v538;
                    local v542 = {
                        displayName = l_getDisplayNameForFiber_0(l_l__debugOwner_1_0) or "Anonymous"
                    };
                    local v543 = v208(l_l__debugOwner_1_0);
                    if not v122:has(v543) then
                        local v544 = l_getUID_0();
                        v122:set(v543, v544);
                        v123:set(v544, v543);
                    end;
                    v542.id = v122:get(v543);
                    v542.type = v214(l_l__debugOwner_1_0);
                    l_unshift_0(l_v538_0, v542);
                    l_l__debugOwner_1_0 = l_l__debugOwner_1_0._debugOwner or nil;
                end;
            end;
            return v538;
        end;
    end;
    local function v550(v546) --[[ Line: 2458 ]] --[[ Name: getInstanceAndStyle ]]
        -- upvalues: v223 (ref)
        local v547 = nil;
        local v548 = nil;
        local v549 = v223(v546);
        if v549 ~= nil then
            v547 = v549.stateNode;
            if v549.memoizedProps ~= nil then
                v548 = v549.memoizedProps.style;
            end;
        end;
        return {
            instance = v547, 
            style = v548
        };
    end;
    local function v588(v551) --[[ Line: 2477 ]] --[[ Name: inspectElementRaw ]]
        -- upvalues: v223 (ref), v214 (ref), l_FunctionComponent_1 (copy), l_SimpleMemoComponent_1 (copy), l_ForwardRef_1 (copy), l_getTypeSymbol_0 (copy), l_ClassComponent_1 (copy), l_IncompleteClassComponent_1 (copy), l_IndeterminateComponent_1 (copy), l_MemoComponent_1 (copy), l_ElementTypeClass_0 (ref), l_CONTEXT_NUMBER_0 (ref), l_CONTEXT_SYMBOL_STRING_0 (ref), l_PROVIDER_NUMBER_0 (ref), l_PROVIDER_SYMBOL_STRING_0 (ref), l_getDisplayNameForFiber_0 (copy), v208 (ref), v122 (copy), l_getUID_0 (ref), v123 (copy), l_SuspenseComponent_1 (copy), l_console_0 (ref), l_inspectHooksOfFiber_0 (ref), v120 (copy), v159 (copy), v162 (copy), v160 (copy), v161 (copy), v163 (copy), v164 (copy), v167 (copy), v197 (copy)
        local v552 = v223(v551);
        if v552 == nil then
            return nil;
        else
            local l__debugOwner_2 = v552._debugOwner;
            local l__debugSource_1 = v552._debugSource;
            local l_stateNode_1 = v552.stateNode;
            local l_key_1 = v552.key;
            local l_memoizedProps_0 = v552.memoizedProps;
            local l_memoizedState_4 = v552.memoizedState;
            local l_dependencies_0 = v552.dependencies;
            local l_tag_5 = v552.tag;
            local l_type_4 = v552.type;
            local v562 = v214(v552);
            local v563 = (not (l_tag_5 ~= l_FunctionComponent_1 and l_tag_5 ~= l_SimpleMemoComponent_1) or l_tag_5 == l_ForwardRef_1) and (not not l_memoizedState_4 or not not l_dependencies_0);
            local v564 = l_getTypeSymbol_0(l_type_4);
            local v565 = false;
            local v566 = nil;
            if l_tag_5 == l_ClassComponent_1 or l_tag_5 == l_FunctionComponent_1 or l_tag_5 == l_IncompleteClassComponent_1 or l_tag_5 == l_IndeterminateComponent_1 or l_tag_5 == l_MemoComponent_1 or l_tag_5 == l_ForwardRef_1 or l_tag_5 == l_SimpleMemoComponent_1 then
                v565 = true;
                if l_stateNode_1 and l_stateNode_1.context ~= nil then
                    local v567 = false;
                    if v562 == l_ElementTypeClass_0 then
                        v567 = not (l_type_4.contextTypes or l_type_4.contextType);
                    end;
                    if not v567 then
                        v566 = l_stateNode_1.context;
                    end;
                end;
            elseif v564 == l_CONTEXT_NUMBER_0 or v564 == l_CONTEXT_SYMBOL_STRING_0 then
                local v568 = l_type_4._context or l_type_4;
                v566 = v568._currentValue or nil;
                local l_return__2 = v552.return_;
                while l_return__2 ~= nil do
                    local l_type_5 = l_return__2.type;
                    local v571 = l_getTypeSymbol_0(l_type_5);
                    if (v571 == l_PROVIDER_NUMBER_0 or v571 == l_PROVIDER_SYMBOL_STRING_0) and (l_type_5._context or l_type_5.context) == v568 then
                        v566 = l_return__2.memoizedProps.value;
                        break;
                    else
                        l_return__2 = l_return__2.return_;
                    end;
                end;
            end;
            local v572 = false;
            if v566 ~= nil then
                v572 = not not l_type_4.contextTypes;
                v566 = {
                    value = v566
                };
            end;
            local v573 = nil;
            if l__debugOwner_2 then
                v573 = {};
                local l_l__debugOwner_2_0 = l__debugOwner_2;
                while l_l__debugOwner_2_0 ~= nil do
                    local v575 = {
                        displayName = l_getDisplayNameForFiber_0(l_l__debugOwner_2_0) or "Anonymous"
                    };
                    local v576 = v208(l_l__debugOwner_2_0);
                    if not v122:has(v576) then
                        local v577 = l_getUID_0();
                        v122:set(v576, v577);
                        v123:set(v577, v576);
                    end;
                    v575.id = v122:get(v576);
                    v575.type = v214(l_l__debugOwner_2_0);
                    table.insert(v573, v575);
                    l_l__debugOwner_2_0 = l_l__debugOwner_2_0._debugOwner or nil;
                end;
            end;
            local v578 = false;
            if l_tag_5 == l_SuspenseComponent_1 then
                v578 = l_memoizedState_4 ~= nil;
            end;
            local v579 = nil;
            if v563 then
                local v580 = {};
                for v581, _ in l_console_0 do
                    pcall(function() --[[ Line: 2597 ]]
                        -- upvalues: v580 (copy), v581 (copy), l_console_0 (ref)
                        v580[v581] = l_console_0[v581];
                        l_console_0[v581] = function() --[[ Line: 2599 ]]

                        end;
                    end);
                end;
                pcall(function() --[[ Line: 2603 ]]
                    -- upvalues: v579 (ref), l_inspectHooksOfFiber_0 (ref), v552 (copy), v120 (ref)
                    v579 = l_inspectHooksOfFiber_0(v552, v120.currentDispatcherRef);
                end);
                for v583, _ in l_console_0 do
                    pcall(function() --[[ Line: 2609 ]]
                        -- upvalues: l_console_0 (ref), v583 (copy), v580 (copy)
                        l_console_0[v583] = v580[v583];
                    end);
                end;
            end;
            local v585 = nil;
            local l_v552_0 = v552;
            while l_v552_0.return_ ~= nil do
                l_v552_0 = l_v552_0.return_;
            end;
            local l_stateNode_2 = l_v552_0.stateNode;
            if l_stateNode_2 ~= nil and l_stateNode_2._debugRootType ~= nil then
                v585 = l_stateNode_2._debugRootType;
            end;
            return {
                id = v551, 
                canEditHooks = typeof(v159) == "function", 
                canEditFunctionProps = typeof(v162) == "function", 
                canEditHooksAndDeletePaths = typeof(v160) == "function", 
                canEditHooksAndRenamePaths = typeof(v161) == "function", 
                canEditFunctionPropsDeletePaths = typeof(v163) == "function", 
                canEditFunctionPropsRenamePaths = typeof(v164) == "function", 
                canToggleSuspense = v167 and (not v578 or v197[v551]), 
                canViewSource = v565, 
                hasLegacyContext = v572, 
                key = l_key_1, 
                displayName = l_getDisplayNameForFiber_0(v552), 
                type_ = v562, 
                context = v566, 
                hooks = v579, 
                props = l_memoizedProps_0, 
                state = if v563 then nil else l_memoizedState_4, 
                owners = v573, 
                source = l__debugSource_1 or nil, 
                rootType = v585, 
                rendererPackageName = v120.rendererPackageName, 
                rendererVersion = v120.version
            };
        end;
    end;
    v224 = function(v589) --[[ Line: 2679 ]]
        -- upvalues: v194 (ref), v195 (ref)
        local v590 = false;
        if v194 ~= nil then
            v590 = false;
            if v194.id == v589 then
                v590 = not v195;
            end;
        end;
        return v590;
    end;
    local function v595(v591) --[[ Line: 2687 ]] --[[ Name: mergeInspectedPaths ]]
        -- upvalues: v196 (ref), l_Boolean_0 (ref)
        local l_v196_0 = v196;
        for _, v594 in v591 do
            if not l_Boolean_0.toJSBoolean(l_v196_0[v594]) then
                l_v196_0[v594] = {};
            end;
            l_v196_0 = l_v196_0[v594];
        end;
    end;
    local function _(v596, v597) --[[ Line: 2698 ]] --[[ Name: createIsPathAllowed ]]
        -- upvalues: v196 (ref), l_Boolean_0 (ref)
        return function(v598) --[[ Line: 2704 ]]
            -- upvalues: v597 (copy), v596 (copy), v196 (ref), l_Boolean_0 (ref)
            if v597 == "hooks" then
                if #v598 == 1 then
                    return true;
                elseif v598[#v598] == "subHooks" or v598[#v598 - 1] == "subHooks" then
                    return true;
                end;
            end;
            local v599 = if v596 == nil then v196 else v196[v596];
            if not l_Boolean_0.toJSBoolean(v599) then
                return false;
            else
                for v600 = 1, #v598 do
                    v599 = v599[v598[v600]];
                    if not l_Boolean_0.toJSBoolean(v599) then
                        return false;
                    end;
                end;
                return true;
            end;
        end;
    end;
    local function v611(v602) --[[ Line: 2736 ]] --[[ Name: updateSelectedElement ]]
        -- upvalues: v123 (copy), l_console_0 (ref), l_ClassComponent_1 (copy), l_IncompleteClassComponent_1 (copy), l_IndeterminateComponent_1 (copy), v121 (copy), l_FunctionComponent_1 (copy), l_ForwardRef_1 (copy), l_MemoComponent_1 (copy), l_SimpleMemoComponent_1 (copy)
        local l_hooks_0 = v602.hooks;
        local l_id_1 = v602.id;
        local l_props_0 = v602.props;
        local v606 = v123:get(l_id_1);
        if v606 == nil then
            l_console_0.warn(string.format("Could not find Fiber with id \"%s\"", (tostring(l_id_1))));
            return;
        else
            local l_elementType_1 = v606.elementType;
            local l_stateNode_3 = v606.stateNode;
            local l_tag_6 = v606.tag;
            local l_type_6 = v606.type;
            if l_tag_6 == l_ClassComponent_1 or l_tag_6 == l_IncompleteClassComponent_1 or l_tag_6 == l_IndeterminateComponent_1 then
                v121["$r"] = l_stateNode_3;
                return;
            elseif l_tag_6 == l_FunctionComponent_1 then
                v121["$r"] = {
                    hooks = l_hooks_0, 
                    props = l_props_0, 
                    type = l_type_6
                };
                return;
            elseif l_tag_6 == l_ForwardRef_1 then
                v121["$r"] = {
                    props = l_props_0, 
                    type = l_type_6.render
                };
                return;
            elseif l_tag_6 == l_MemoComponent_1 or l_tag_6 == l_SimpleMemoComponent_1 then
                v121["$r"] = {
                    props = l_props_0, 
                    type = l_elementType_1 ~= nil and l_elementType_1.type ~= nil and l_elementType_1.type or l_type_6
                };
                return;
            else
                v121["$r"] = nil;
                return;
            end;
        end;
    end;
    local function v617(v612, v613, v614) --[[ Line: 2783 ]] --[[ Name: storeAsGlobal ]]
        -- upvalues: v224 (ref), l_getInObject_0 (ref), v194 (ref), l__G_0 (ref), l_console_0 (ref)
        if v224(v612) then
            local v615 = l_getInObject_0(v194, v613);
            local v616 = string.format("$reactTemp%s", (tostring(v614)));
            l__G_0[v616] = v615;
            l_console_0.log(v616);
            l_console_0.log(v615);
        end;
    end;
    local function v620(v618, v619) --[[ Line: 2801 ]] --[[ Name: copyElementPath ]]
        -- upvalues: v224 (ref), l_copyToClipboard_0 (ref), l_getInObject_0 (ref), v194 (ref)
        if v224(v618) then
            l_copyToClipboard_0(l_getInObject_0(v194, v619));
        end;
    end;
    local function v655(v621, v622) --[[ Line: 2809 ]] --[[ Name: inspectElement ]]
        -- upvalues: v224 (ref), v595 (copy), l_cleanForBridge_0 (ref), l_getInObject_0 (ref), v194 (ref), v196 (ref), l_Boolean_0 (ref), v195 (ref), v588 (copy), v611 (copy), l_Object_0 (ref)
        if v224(v621) then
            if v622 ~= nil then
                v595(v622);
                local v623 = nil;
                if v622[1] == "hooks" then
                    v623 = "hooks";
                end;
                local v624 = {
                    id = v621, 
                    type = "hydrated-path", 
                    path = v622
                };
                local l_l_cleanForBridge_0_0 = l_cleanForBridge_0;
                local v626 = l_getInObject_0(v194, v622);
                local l_v623_0 = v623;
                local v628 = nil;
                v624.value = l_l_cleanForBridge_0_0(v626, function(v629) --[[ Line: 2704 ]]
                    -- upvalues: l_v623_0 (copy), v628 (copy), v196 (ref), l_Boolean_0 (ref)
                    if l_v623_0 == "hooks" then
                        if #v629 == 1 then
                            return true;
                        elseif v629[#v629] == "subHooks" or v629[#v629 - 1] == "subHooks" then
                            return true;
                        end;
                    end;
                    local v630 = if v628 == nil then v196 else v196[v628];
                    if not l_Boolean_0.toJSBoolean(v630) then
                        return false;
                    else
                        for v631 = 1, #v629 do
                            v630 = v630[v629[v631]];
                            if not l_Boolean_0.toJSBoolean(v630) then
                                return false;
                            end;
                        end;
                        return true;
                    end;
                end, v622);
                return v624;
            else
                return {
                    id = v621, 
                    type = "no-change"
                };
            end;
        else
            v195 = false;
            if v194 == nil or v194.id ~= v621 then
                v196 = {};
            end;
            v194 = v588(v621);
            if v194 == nil then
                return {
                    id = v621, 
                    type = "not-found"
                };
            else
                if v622 ~= nil then
                    v595(v622);
                end;
                v611(v194);
                local v632 = l_Object_0.assign({}, v194);
                local l_l_cleanForBridge_0_1 = l_cleanForBridge_0;
                local l_context_0 = v632.context;
                local v635 = nil;
                local v636 = "context";
                local l_v635_0 = v635 --[[ copy: 7 -> 10 ]];
                local l_v636_0 = v636 --[[ copy: 8 -> 11 ]];
                v632.context = l_l_cleanForBridge_0_1(l_context_0, function(v639) --[[ Line: 2704 ]]
                    -- upvalues: l_v635_0 (copy), l_v636_0 (copy), v196 (ref), l_Boolean_0 (ref)
                    if l_v635_0 == "hooks" then
                        if #v639 == 1 then
                            return true;
                        elseif v639[#v639] == "subHooks" or v639[#v639 - 1] == "subHooks" then
                            return true;
                        end;
                    end;
                    local v640 = if l_v636_0 == nil then v196 else v196[l_v636_0];
                    if not l_Boolean_0.toJSBoolean(v640) then
                        return false;
                    else
                        for v641 = 1, #v639 do
                            v640 = v640[v639[v641]];
                            if not l_Boolean_0.toJSBoolean(v640) then
                                return false;
                            end;
                        end;
                        return true;
                    end;
                end);
                l_l_cleanForBridge_0_1 = l_cleanForBridge_0;
                l_context_0 = v632.hooks;
                v635 = "hooks";
                v636 = "hooks";
                local l_v635_1 = v635 --[[ copy: 7 -> 12 ]];
                local l_v636_1 = v636 --[[ copy: 8 -> 13 ]];
                v632.hooks = l_l_cleanForBridge_0_1(l_context_0, function(v644) --[[ Line: 2704 ]]
                    -- upvalues: l_v635_1 (copy), l_v636_1 (copy), v196 (ref), l_Boolean_0 (ref)
                    if l_v635_1 == "hooks" then
                        if #v644 == 1 then
                            return true;
                        elseif v644[#v644] == "subHooks" or v644[#v644 - 1] == "subHooks" then
                            return true;
                        end;
                    end;
                    local v645 = if l_v636_1 == nil then v196 else v196[l_v636_1];
                    if not l_Boolean_0.toJSBoolean(v645) then
                        return false;
                    else
                        for v646 = 1, #v644 do
                            v645 = v645[v644[v646]];
                            if not l_Boolean_0.toJSBoolean(v645) then
                                return false;
                            end;
                        end;
                        return true;
                    end;
                end);
                l_l_cleanForBridge_0_1 = l_cleanForBridge_0;
                l_context_0 = v632.props;
                v635 = nil;
                v636 = "props";
                local l_v635_2 = v635 --[[ copy: 7 -> 14 ]];
                local l_v636_2 = v636 --[[ copy: 8 -> 15 ]];
                v632.props = l_l_cleanForBridge_0_1(l_context_0, function(v649) --[[ Line: 2704 ]]
                    -- upvalues: l_v635_2 (copy), l_v636_2 (copy), v196 (ref), l_Boolean_0 (ref)
                    if l_v635_2 == "hooks" then
                        if #v649 == 1 then
                            return true;
                        elseif v649[#v649] == "subHooks" or v649[#v649 - 1] == "subHooks" then
                            return true;
                        end;
                    end;
                    local v650 = if l_v636_2 == nil then v196 else v196[l_v636_2];
                    if not l_Boolean_0.toJSBoolean(v650) then
                        return false;
                    else
                        for v651 = 1, #v649 do
                            v650 = v650[v649[v651]];
                            if not l_Boolean_0.toJSBoolean(v650) then
                                return false;
                            end;
                        end;
                        return true;
                    end;
                end);
                l_l_cleanForBridge_0_1 = l_cleanForBridge_0;
                l_context_0 = v632.state;
                v635 = nil;
                v636 = "state";
                v632.state = l_l_cleanForBridge_0_1(l_context_0, function(v652) --[[ Line: 2704 ]]
                    -- upvalues: v635 (copy), v636 (copy), v196 (ref), l_Boolean_0 (ref)
                    if v635 == "hooks" then
                        if #v652 == 1 then
                            return true;
                        elseif v652[#v652] == "subHooks" or v652[#v652 - 1] == "subHooks" then
                            return true;
                        end;
                    end;
                    local v653 = if v636 == nil then v196 else v196[v636];
                    if not l_Boolean_0.toJSBoolean(v653) then
                        return false;
                    else
                        for v654 = 1, #v652 do
                            v653 = v653[v652[v654]];
                            if not l_Boolean_0.toJSBoolean(v653) then
                                return false;
                            end;
                        end;
                        return true;
                    end;
                end);
                return {
                    id = v621, 
                    type = "full-data", 
                    value = v632
                };
            end;
        end;
    end;
    local function v666(v656) --[[ Line: 2903 ]] --[[ Name: logElementToConsole ]]
        -- upvalues: v224 (ref), v194 (ref), v588 (copy), l_console_0 (ref), v223 (ref), l_SuspenseComponent_1 (copy), v206 (ref), l_Array_0 (ref)
        local v657 = if v224(v656) then v194 else v588(v656);
        if v657 == nil then
            l_console_0.warn(string.format("Could not find Fiber with id \"%s\"", (tostring(v656))));
            return;
        else
            if v657.props ~= nil then
                l_console_0.log("Props:", v657.props);
            end;
            if v657.state ~= nil then
                l_console_0.log("State:", v657.state);
            end;
            if v657.hooks ~= nil then
                l_console_0.log("Hooks:", v657.hooks);
            end;
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 2165 ]]
                -- upvalues: v223 (ref), v656 (copy), l_SuspenseComponent_1 (ref), v206 (ref), l_Array_0 (ref)
                local v658 = v223(v656);
                if v658 == nil then
                    return nil;
                else
                    local v659 = false;
                    if v658.tag == l_SuspenseComponent_1 then
                        v659 = v658.memoizedState ~= nil;
                    end;
                    if v659 then
                        local v660 = v658.child and v658.child.sibling;
                        if v660 ~= nil then
                            v658 = v660;
                        end;
                    end;
                    local v661 = v206(v656);
                    return (l_Array_0.map(v661, function(v662) --[[ Line: 2184 ]]
                        return v662.stateNode;
                    end));
                end;
            end);
            local v665 = if not l_status_1 then nil else l_result_1;
            if v665 ~= nil then
                l_console_0.log("Nodes:", v665);
            end;
            if v657.source ~= nil then
                l_console_0.log("Location:", v657.source);
            end;
            return;
        end;
    end;
    local function v673(v667, v668, v669, v670) --[[ Line: 2950 ]] --[[ Name: deletePath ]]
        -- upvalues: v223 (ref), l_Array_0 (ref), l_ClassComponent_1 (copy), l_deletePathInObject_0 (ref), l_FunctionComponent_1 (copy), v160 (copy), v163 (copy), l_copyWithDelete_0 (ref)
        local v671 = v223(v668);
        if v671 ~= nil then
            local l_stateNode_4 = v671.stateNode;
            if v667 == "context" then
                v670 = l_Array_0.slice(v670, 1);
                if v671.tag == l_ClassComponent_1 then
                    if #v670 ~= 0 then
                        l_deletePathInObject_0(l_stateNode_4.context, v670);
                    end;
                    l_stateNode_4:forceUpdate();
                    return;
                elseif v671.tag == l_FunctionComponent_1 then
                    return;
                end;
            elseif v667 == "hooks" then
                if type(v160) == "function" then
                    v160(v671, v669, v670);
                    return;
                end;
            elseif v667 == "props" then
                if l_stateNode_4 == nil then
                    if type(v163) == "function" then
                        v163(v671, v670);
                        return;
                    end;
                else
                    v671.pendingProps = l_copyWithDelete_0(l_stateNode_4.props, v670);
                    l_stateNode_4:forceUpdate();
                    return;
                end;
            elseif v667 == "state" then
                l_deletePathInObject_0(l_stateNode_4.state, v670);
                l_stateNode_4:forceUpdate();
            end;
        end;
    end;
    local function v681(v674, v675, v676, v677, v678) --[[ Line: 2998 ]] --[[ Name: renamePath ]]
        -- upvalues: v223 (ref), l_Array_0 (ref), l_ClassComponent_1 (copy), l_renamePathInObject_0 (ref), l_FunctionComponent_1 (copy), v161 (copy), v164 (copy), l_copyWithRename_0 (ref)
        local v679 = v223(v675);
        if v679 ~= nil then
            local l_stateNode_5 = v679.stateNode;
            if v674 == "context" then
                v677 = l_Array_0.slice(v677, 1);
                v678 = l_Array_0.slice(v678, 1);
                if v679.tag == l_ClassComponent_1 then
                    if #v677 ~= 0 then
                        l_renamePathInObject_0(l_stateNode_5.context, v677, v678);
                    end;
                    l_stateNode_5:forceUpdate();
                    return;
                elseif v679.tag == l_FunctionComponent_1 then
                    return;
                end;
            elseif v674 == "hooks" then
                if type(v161) == "function" then
                    v161(v679, v676, v677, v678);
                    return;
                end;
            elseif v674 == "props" then
                if l_stateNode_5 == nil then
                    if type(v164) == "function" then
                        v164(v679, v677, v678);
                        return;
                    end;
                else
                    v679.pendingProps = l_copyWithRename_0(l_stateNode_5.props, v677, v678);
                    l_stateNode_5:forceUpdate();
                    return;
                end;
            elseif v674 == "state" then
                l_renamePathInObject_0(l_stateNode_5.state, v677, v678);
                l_stateNode_5:forceUpdate();
            end;
        end;
    end;
    local function v689(v682, v683, v684, v685, v686) --[[ Line: 3049 ]] --[[ Name: overrideValueAtPath ]]
        -- upvalues: v223 (ref), l_Array_0 (ref), l_ClassComponent_1 (copy), l_setInObject_0 (ref), l_FunctionComponent_1 (copy), v159 (copy), v162 (copy), l_copyWithSet_0 (ref)
        local v687 = v223(v683);
        if v687 ~= nil then
            local l_stateNode_6 = v687.stateNode;
            if v682 == "context" then
                v685 = l_Array_0.slice(v685, 1);
                if v687.tag == l_ClassComponent_1 then
                    if #v685 == 0 then
                        l_stateNode_6.context = v686;
                    else
                        l_setInObject_0(l_stateNode_6.context, v685, v686);
                    end;
                    l_stateNode_6:forceUpdate();
                    return;
                elseif v687.tag == l_FunctionComponent_1 then
                    return;
                end;
            elseif v682 == "hooks" then
                if type(v159) == "function" then
                    v159(v687, v684, v685, v686);
                    return;
                end;
            elseif v682 == "props" then
                if l_stateNode_6 == nil then
                    if type(v162) == "function" then
                        v162(v687, v685, v686);
                        return;
                    end;
                else
                    v687.pendingProps = l_copyWithSet_0(l_stateNode_6.props, v685, v686);
                    l_stateNode_6:forceUpdate();
                    return;
                end;
            elseif v682 == "state" then
                l_setInObject_0(l_stateNode_6.state, v685, v686);
                l_stateNode_6:forceUpdate();
            end;
        end;
    end;
    local function v718() --[[ Line: 3112 ]] --[[ Name: getProfilingData ]]
        -- upvalues: v193 (ref), l_Map_0 (ref), v186 (ref), v188 (ref), v189 (ref), l_Array_0 (ref), v119 (copy)
        local v690 = {};
        if v193 == nil then
            error("getProfilingData() called before any profiling data was recorded");
        end;
        v193:forEach(function(v691, v692) --[[ Line: 3121 ]]
            -- upvalues: l_Map_0 (ref), v186 (ref), v188 (ref), v189 (ref), l_Array_0 (ref), v690 (copy)
            local v693 = {};
            local v694 = {};
            local v695 = l_Map_0.new();
            local v696 = l_Map_0.new();
            local v697 = v186 ~= nil and v186:get(v692) or "Unknown";
            if v188 ~= nil then
                v188:forEach(function(v698, v699) --[[ Line: 3131 ]]
                    -- upvalues: v189 (ref), v692 (copy), v694 (copy)
                    if v189 ~= nil and v189:get(v699) == v692 then
                        table.insert(v694, {
                            v699, 
                            v698
                        });
                    end;
                end);
            end;
            for v700, v701 in v691 do
                local l_changeDescriptions_0 = v701.changeDescriptions;
                local l_durations_0 = v701.durations;
                local l_interactions_0 = v701.interactions;
                local l_maxActualDuration_0 = v701.maxActualDuration;
                local l_priorityLevel_0 = v701.priorityLevel;
                local l_commitTime_0 = v701.commitTime;
                local v708 = {};
                for _, v710 in l_interactions_0 do
                    if not v695:has(v710.id) then
                        v695:set(v710.id, v710);
                    end;
                    table.insert(v708, v710.id);
                    local v711 = v696:get(v710.id);
                    if v711 ~= nil then
                        table.insert(v711, v700);
                    else
                        v696:set(v710.id, {
                            v700
                        });
                    end;
                end;
                local v712 = {};
                local v713 = {};
                for v714 = 1, #l_durations_0, 3 do
                    local v715 = l_durations_0[v714];
                    table.insert(v712, {
                        v715, 
                        l_durations_0[v714 + 1]
                    });
                    table.insert(v713, {
                        v715, 
                        l_durations_0[v714 + 2]
                    });
                end;
                table.insert(v693, {
                    changeDescriptions = if l_changeDescriptions_0 ~= nil then l_Array_0.from(l_changeDescriptions_0:entries()) else nil, 
                    duration = l_maxActualDuration_0, 
                    fiberActualDurations = v712, 
                    fiberSelfDurations = v713, 
                    interactionIDs = v708, 
                    priorityLevel = l_priorityLevel_0, 
                    timestamp = l_commitTime_0
                });
            end;
            local _ = l_Array_0.from(v696:entries());
            local _ = l_Array_0.from(v695:entries());
            table.insert(v690, {
                commitData = v693, 
                displayName = v697, 
                initialTreeBaseDurations = v694, 
                interactionCommits = l_Array_0.from(v696:entries()), 
                interactions = l_Array_0.from(v695:entries()), 
                rootID = v692
            });
        end);
        return {
            dataForRoots = v690, 
            rendererID = v119
        };
    end;
    local function v728(v719) --[[ Line: 3215 ]] --[[ Name: startProfiling ]]
        -- upvalues: v190 (ref), v192 (ref), v186 (ref), l_Map_0 (ref), v188 (ref), v125 (copy), v189 (ref), v126 (copy), v187 (ref), v118 (copy), v119 (copy), v208 (ref), v122 (copy), l_getUID_0 (ref), v123 (copy), v218 (ref), v214 (ref), l_ElementTypeClass_0 (ref), v217 (ref), v270 (copy), v191 (ref), v193 (ref)
        if v190 then
            return;
        else
            v192 = v719;
            v186 = l_Map_0.new();
            v188 = l_Map_0.new(v125);
            v189 = l_Map_0.new(v126);
            v187 = l_Map_0.new();
            v118.getFiberRoots(v119):forEach(function(v720) --[[ Line: 3231 ]]
                -- upvalues: v208 (ref), v122 (ref), l_getUID_0 (ref), v123 (ref), v186 (ref), v218 (ref), v719 (copy), v214 (ref), l_ElementTypeClass_0 (ref), v187 (ref), v217 (ref), v270 (ref)
                local v721 = v208(v720.current);
                if not v122:has(v721) then
                    local v722 = l_getUID_0();
                    v122:set(v721, v722);
                    v123:set(v722, v721);
                end;
                local v723 = v122:get(v721);
                v186:set(v723, v218(v720.current));
                if v719 then
                    v721 = v720.current;
                    if v214(v721) == l_ElementTypeClass_0 and v187 ~= nil then
                        local v724 = v208(v721);
                        if not v122:has(v724) then
                            local v725 = l_getUID_0();
                            v122:set(v724, v725);
                            v123:set(v725, v724);
                        end;
                        local v726 = v122:get(v724);
                        v724 = v217(v721);
                        if v724 ~= nil then
                            v187:set(v726, v724);
                        end;
                    end;
                    local l_child_16 = v721.child;
                    while l_child_16 ~= nil do
                        v270(l_child_16);
                        l_child_16 = l_child_16.sibling;
                    end;
                end;
            end);
            v190 = true;
            v191 = os.clock();
            v193 = l_Map_0.new();
            return;
        end;
    end;
    local function v729() --[[ Line: 3251 ]] --[[ Name: stopProfiling ]]
        -- upvalues: v190 (ref), v192 (ref)
        v190 = false;
        v192 = false;
    end;
    if l_sessionStorageGetItem_0(l_SESSION_STORAGE_RELOAD_AND_PROFILE_KEY_0) == "true" then
        v728(l_sessionStorageGetItem_0(l_SESSION_STORAGE_RECORD_CHANGE_DESCRIPTIONS_KEY_0) == "true");
    end;
    local function v730() --[[ Line: 3266 ]] --[[ Name: shouldSuspendFiberAlwaysFalse ]]
        return false;
    end;
    local function v735(v731) --[[ Line: 3270 ]] --[[ Name: shouldSuspendFiberAccordingToSet ]]
        -- upvalues: v208 (ref), v122 (copy), l_getUID_0 (ref), v123 (copy), v197 (copy)
        local v732 = v208(v731);
        if not v122:has(v732) then
            local v733 = l_getUID_0();
            v122:set(v732, v733);
            v123:set(v733, v732);
        end;
        local v734 = v122:get(v732);
        return v197:has(v734);
    end;
    local function v739(v736, v737) --[[ Line: 3275 ]] --[[ Name: overrideSuspense ]]
        -- upvalues: v165 (copy), v166 (copy), v197 (copy), v735 (copy), v730 (copy), v123 (copy)
        if typeof(v165) ~= "function" or typeof(v166) ~= "function" then
            error("Expected overrideSuspense() to not get called for earlier React versions.");
        end;
        if v737 then
            v197:add(v736);
            if v197.size == 1 then
                v165(v735);
            end;
        else
            v197:delete(v736);
            if v197.size == 0 then
                v165(v730);
            end;
        end;
        local v738 = v123:get(v736);
        if v738 ~= nil then
            v166(v738);
        end;
    end;
    v207 = function(v740) --[[ Line: 3307 ]]
        -- upvalues: v201 (ref), v202 (ref), v203 (ref), v200 (ref)
        if v740 == nil then
            v201 = nil;
            v202 = -1;
            v203 = false;
        end;
        v200 = v740;
    end;
    v220 = function(v741) --[[ Line: 3320 ]]
        -- upvalues: v200 (ref), v203 (ref), v201 (ref), v225 (ref), v202 (ref)
        if v200 == nil or not v203 then
            return false;
        else
            local l_return__3 = v741.return_;
            local v743 = if l_return__3 ~= nil then l_return__3.alternate else nil;
            if v201 == l_return__3 or v201 == v743 and v743 ~= nil then
                local v744 = v225(v741);
                local v745 = v200[v202 + 1];
                if v745 == nil then
                    error("Expected to see a frame at the next depth.");
                end;
                if v744.index == v745.index and v744.key == v745.key and v744.displayName == v745.displayName then
                    v201 = v741;
                    v202 = v202 + 1;
                    if v202 == #v200 - 1 then
                        v203 = false;
                    else
                        v203 = true;
                    end;
                    return false;
                end;
            end;
            v203 = false;
            return true;
        end;
    end;
    v221 = function(v746) --[[ Line: 3373 ]]
        -- upvalues: v203 (ref)
        v203 = v746;
    end;
    v211 = function(v747, v748) --[[ Line: 3380 ]]
        -- upvalues: v218 (ref), v184 (copy), v183 (copy)
        local v749 = v218(v748);
        local v750 = v184:get(v749) or 0;
        v184:set(v749, v750 + 1);
        local v751 = string.format("%s:%d", v749, v750);
        v183:set(v747, v751);
    end;
    v212 = function(v752) --[[ Line: 3387 ]]
        -- upvalues: v183 (copy), l_String_0 (ref), v184 (copy)
        local v753 = v183:get(v752);
        if v753 == nil then
            error("Expected root pseudo key to be known.");
        end;
        local v754 = string.sub(v753, 1, l_String_0.lastIndexOf(v753, ":") - 1);
        local v755 = v184:get(v754);
        if v755 == nil then
            error("Expected counter to be known.");
        end;
        if v755 > 1 then
            v184:set(v754, v755 - 1);
        else
            v184:delete(v754);
        end;
        v183:delete(v752);
    end;
    v218 = function(v756) --[[ Line: 3415 ]]
        -- upvalues: l_getDisplayNameForFiber_0 (copy)
        local v757 = nil;
        local v758 = nil;
        local l_child_17 = v756.child;
        for _ = 0, 2 do
            if l_child_17 ~= nil then
                local v761 = l_getDisplayNameForFiber_0(l_child_17);
                if v761 ~= nil then
                    if typeof(l_child_17.type) == "function" then
                        v757 = v761;
                    elseif v758 == nil then
                        v758 = v761;
                    end;
                end;
                if v757 == nil then
                    l_child_17 = l_child_17.child;
                else
                    break;
                end;
            else
                break;
            end;
        end;
        return v757 or v758 or "Anonymous";
    end;
    v225 = function(v762) --[[ Line: 3449 ]]
        -- upvalues: l_getDisplayNameForFiber_0 (copy), l_HostRoot_1 (copy), v208 (ref), v122 (copy), l_getUID_0 (ref), v123 (copy), v183 (copy), l_HostComponent_1 (copy)
        local l_key_2 = v762.key;
        local v764 = l_getDisplayNameForFiber_0(v762);
        local l_index_0 = v762.index;
        if v762.tag == l_HostRoot_1 then
            local v766 = v208(v762);
            if not v122:has(v766) then
                local v767 = l_getUID_0();
                v122:set(v766, v767);
                v123:set(v767, v766);
            end;
            local v768 = v122:get(v766);
            v766 = v183:get(v768);
            if v766 == nil then
                error("Expected mounted root to have known pseudo key.");
            end;
            v764 = v766;
        elseif v762.tag == l_HostComponent_1 then
            v764 = v762.type;
        end;
        return {
            displayName = v764, 
            key = l_key_2, 
            index = l_index_0
        };
    end;
    local function v772(v769) --[[ Line: 3478 ]] --[[ Name: getPathForElement ]]
        -- upvalues: v123 (copy), v225 (ref), l_Array_0 (ref)
        local v770 = v123:get(v769);
        if v770 == nil then
            return nil;
        else
            local v771 = {};
            while v770 ~= nil do
                table.insert(v771, v225(v770));
                v770 = v770.return_;
            end;
            l_Array_0.reverse(v771);
            return v771;
        end;
    end;
    local function v777() --[[ Line: 3494 ]] --[[ Name: getBestMatchForTrackedPath ]]
        -- upvalues: v200 (ref), v201 (ref), v249 (copy), v208 (ref), v122 (copy), l_getUID_0 (ref), v123 (copy), v202 (ref)
        if v200 == nil then
            return nil;
        elseif v201 == nil then
            return nil;
        else
            local l_v201_0 = v201;
            while l_v201_0 ~= nil and v249(l_v201_0) do
                l_v201_0 = l_v201_0.return_;
            end;
            if l_v201_0 == nil then
                return nil;
            else
                local v774 = {};
                local v775 = v208(l_v201_0);
                if not v122:has(v775) then
                    local v776 = l_getUID_0();
                    v122:set(v775, v776);
                    v123:set(v776, v775);
                end;
                v774.id = v122:get(v775);
                v774.isFullMatch = v202 == #v200;
                return v774;
            end;
        end;
    end;
    local function v779(v778) --[[ Line: 3520 ]] --[[ Name: setTraceUpdatesEnabled ]]
        -- upvalues: v198 (ref)
        v198 = v778;
    end;
    return {
        cleanup = v466, 
        copyElementPath = v620, 
        deletePath = v673, 
        findNativeNodesForFiberID = v502, 
        flushInitialOperations = v475, 
        getBestMatchForTrackedPath = v777, 
        getDisplayNameForFiberID = v505, 
        getFiberIDForNative = v511, 
        getInstanceAndStyle = v550, 
        getOwnersList = v545, 
        getPathForElement = v772, 
        getProfilingData = v718, 
        handleCommitFiberRoot = v489, 
        handleCommitFiberUnmount = v477, 
        inspectElement = v655, 
        logElementToConsole = v666, 
        prepareViewAttributeSource = v528, 
        prepareViewElementSource = v534, 
        overrideSuspense = v739, 
        overrideValueAtPath = v689, 
        renamePath = v681, 
        renderer = v120, 
        setTraceUpdatesEnabled = v779, 
        setTrackedPath = v207, 
        startProfiling = v728, 
        stopProfiling = v729, 
        storeAsGlobal = v617, 
        updateComponentFilters = v237, 
        getDisplayNameForRoot = v218
    };
end;
return v12;