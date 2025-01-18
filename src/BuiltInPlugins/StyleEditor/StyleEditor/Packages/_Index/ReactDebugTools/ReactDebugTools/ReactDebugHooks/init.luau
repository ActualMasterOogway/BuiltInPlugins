local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_Object_0 = v1.Object;
local l_String_0 = v1.String;
local v7 = {};
local _ = require(l_Parent_0.Shared);
local _ = require(l_Parent_0.ReactReconciler);
local _ = require(l_Parent_0.Shared);
local v11 = require(l_Parent_0.ReactReconciler)({});
local l_NoMode_0 = v11.ReactTypeOfMode.NoMode;
local v18 = {
    parse = function(v13) --[[ Line: 81 ]] --[[ Name: parse ]]
        -- upvalues: l_Array_0 (copy)
        if v13.stack == nil then
            return {};
        else
            local v15 = l_Array_0.filter(string.split(v13.stack, "\n"), function(v14) --[[ Line: 87 ]]
                return string.find(v14, "^LoadedCode") ~= nil;
            end);
            return l_Array_0.map(v15, function(v16) --[[ Line: 91 ]]
                local v17 = string.match(v16, "function (%w+)$");
                return {
                    source = v16, 
                    functionName = v17
                };
            end);
        end;
    end
};
local v19 = require(l_Parent_0.Shared);
local l_ReactSharedInternals_0 = v19.ReactSharedInternals;
local l_REACT_OPAQUE_ID_TYPE_0 = v19.ReactSymbols.REACT_OPAQUE_ID_TYPE;
local l_ReactWorkTags_0 = v11.ReactWorkTags;
local l_FunctionComponent_0 = l_ReactWorkTags_0.FunctionComponent;
local l_SimpleMemoComponent_0 = l_ReactWorkTags_0.SimpleMemoComponent;
local l_ContextProvider_0 = l_ReactWorkTags_0.ContextProvider;
local l_ForwardRef_0 = l_ReactWorkTags_0.ForwardRef;
local l_Block_0 = l_ReactWorkTags_0.Block;
local v28 = {};
local v29 = nil;
local v30 = nil;
local v31 = nil;
local function v40() --[[ Line: 136 ]] --[[ Name: getPrimitiveStackCache ]]
    -- upvalues: v29 (ref), l_Map_0 (copy), v31 (ref), v28 (ref), v18 (copy)
    if v29 == nil then
        local v32 = l_Map_0.new();
        local v33 = nil;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 145 ]]
            -- upvalues: v31 (ref)
            v31.useContext({
                _currentValue = nil
            });
            v31.useState(nil);
            v31.useReducer(function(v34, _) --[[ Line: 154 ]]
                return v34;
            end, nil);
            v31.useRef(nil);
            v31.useLayoutEffect(function() --[[ Line: 164 ]]

            end);
            v31.useEffect(function() --[[ Line: 165 ]]

            end);
            v31.useImperativeHandle(nil, function() --[[ Line: 166 ]]
                return nil;
            end);
            v31.useDebugValue(nil);
            v31.useCallback(function() --[[ Line: 175 ]]

            end);
            v31.useMemo(function() --[[ Line: 176 ]]
                return nil;
            end);
        end);
        v33 = v28;
        v28 = {};
        if not l_status_0 then
            error(l_result_0);
        end;
        for v38 = 1, #v33 do
            local v39 = v33[v38];
            v32:set(v39.primitive, v18.parse(v39.stackError));
        end;
        v29 = v32;
    end;
    return v29;
end;
local v41 = nil;
local function _() --[[ Line: 220 ]] --[[ Name: nextHook ]]
    -- upvalues: v41 (ref)
    local l_v41_0 = v41;
    if l_v41_0 ~= nil then
        v41 = l_v41_0.next;
    end;
    return l_v41_0;
end;
local function v46(v44, _) --[[ Line: 228 ]] --[[ Name: readContext ]]
    return v44._currentValue;
end;
local function v49(v47, _) --[[ Line: 235 ]] --[[ Name: useContext ]]
    -- upvalues: v28 (ref), l_Error_0 (copy)
    table.insert(v28, {
        primitive = "Context", 
        stackError = l_Error_0.new(), 
        value = v47._currentValue
    });
    return v47._currentValue;
end;
local function v54(v50) --[[ Line: 249 ]] --[[ Name: useState ]]
    -- upvalues: v41 (ref), v28 (ref), l_Error_0 (copy)
    local l_v41_1 = v41;
    if l_v41_1 ~= nil then
        v41 = l_v41_1.next;
    end;
    local l_l_v41_1_0 = l_v41_1;
    l_v41_1 = if l_l_v41_1_0 ~= nil then l_l_v41_1_0.memoizedState else if typeof(v50) == "function" then v50() else v50;
    table.insert(v28, {
        primitive = "State", 
        stackError = l_Error_0.new(), 
        value = l_v41_1
    });
    return l_v41_1, function(_) --[[ Line: 264 ]]

    end;
end;
local function v61(_, v56, v57) --[[ Line: 273 ]] --[[ Name: useReducer ]]
    -- upvalues: v41 (ref), v28 (ref), l_Error_0 (copy)
    local l_v41_2 = v41;
    if l_v41_2 ~= nil then
        v41 = l_v41_2.next;
    end;
    local l_l_v41_2_0 = l_v41_2;
    l_v41_2 = nil;
    l_v41_2 = if l_l_v41_2_0 ~= nil then l_l_v41_2_0.memoizedState else if v57 ~= nil then v57(v56) else v56;
    table.insert(v28, {
        primitive = "Reducer", 
        stackError = l_Error_0.new(), 
        value = l_v41_2
    });
    return l_v41_2, function(_) --[[ Line: 292 ]]

    end;
end;
local function v65(v62) --[[ Line: 295 ]] --[[ Name: useRef ]]
    -- upvalues: v41 (ref), v28 (ref), l_Error_0 (copy)
    local l_v41_3 = v41;
    if l_v41_3 ~= nil then
        v41 = l_v41_3.next;
    end;
    local l_l_v41_3_0 = l_v41_3;
    l_v41_3 = if l_l_v41_3_0 ~= nil then l_l_v41_3_0.memoizedState else {
        current = v62
    };
    table.insert(v28, {
        primitive = "Ref", 
        stackError = l_Error_0.new(), 
        value = l_v41_3.current
    });
    return l_v41_3;
end;
local function v71(v66) --[[ Line: 306 ]] --[[ Name: useBinding ]]
    -- upvalues: v41 (ref), v28 (ref), l_Error_0 (copy)
    local l_v41_4 = v41;
    if l_v41_4 ~= nil then
        v41 = l_v41_4.next;
    end;
    local l_l_v41_4_0 = l_v41_4;
    l_v41_4 = if l_l_v41_4_0 ~= nil then l_l_v41_4_0.memoizedState else {
        getValue = function(_) --[[ Line: 311 ]] --[[ Name: getValue ]]
            -- upvalues: v66 (copy)
            return v66;
        end
    };
    table.insert(v28, {
        primitive = "Binding", 
        stackError = l_Error_0.new(), 
        value = l_v41_4:getValue()
    });
    return l_v41_4, function(_) --[[ Line: 322 ]]

    end;
end;
local function v75(v72, _) --[[ Line: 325 ]] --[[ Name: useLayoutEffect ]]
    -- upvalues: v41 (ref), v28 (ref), l_Error_0 (copy)
    local l_v41_5 = v41;
    if l_v41_5 ~= nil then
        v41 = l_v41_5.next;
    end;
    table.insert(v28, {
        primitive = "LayoutEffect", 
        stackError = l_Error_0.new(), 
        value = v72
    });
end;
local function v79(v76, _) --[[ Line: 338 ]] --[[ Name: useEffect ]]
    -- upvalues: v41 (ref), v28 (ref), l_Error_0 (copy)
    local l_v41_6 = v41;
    if l_v41_6 ~= nil then
        v41 = l_v41_6.next;
    end;
    table.insert(v28, {
        primitive = "Effect", 
        stackError = l_Error_0.new(), 
        value = v76
    });
end;
local function v84(v80, _, _) --[[ Line: 351 ]] --[[ Name: useImperativeHandle ]]
    -- upvalues: v41 (ref), v28 (ref), l_Error_0 (copy)
    local l_v41_7 = v41;
    if l_v41_7 ~= nil then
        v41 = l_v41_7.next;
    end;
    l_v41_7 = nil;
    if v80 ~= nil and typeof(v80) == "table" then
        l_v41_7 = v80.current;
    end;
    table.insert(v28, {
        primitive = "ImperativeHandle", 
        stackError = l_Error_0.new(), 
        value = l_v41_7
    });
end;
local function v87(v85, v86) --[[ Line: 375 ]] --[[ Name: useDebugValue ]]
    -- upvalues: v28 (ref), l_Error_0 (copy)
    table.insert(v28, {
        primitive = "DebugValue", 
        stackError = l_Error_0.new(), 
        value = if typeof(v86) == "function" then v86(v85) else v85
    });
end;
local function v92(v88, _) --[[ Line: 383 ]] --[[ Name: useCallback ]]
    -- upvalues: v41 (ref), v28 (ref), l_Error_0 (copy)
    local l_v41_8 = v41;
    if l_v41_8 ~= nil then
        v41 = l_v41_8.next;
    end;
    local l_l_v41_8_0 = l_v41_8;
    table.insert(v28, {
        primitive = "Callback", 
        stackError = l_Error_0.new(), 
        value = if l_l_v41_8_0 ~= nil then l_l_v41_8_0.memoizedState[1] else v88
    });
    return v88;
end;
local function v97(v93, _) --[[ Line: 404 ]] --[[ Name: useMemo ]]
    -- upvalues: v41 (ref), v28 (ref), l_Error_0 (copy)
    local l_v41_9 = v41;
    if l_v41_9 ~= nil then
        v41 = l_v41_9.next;
    end;
    local l_l_v41_9_0 = l_v41_9;
    l_v41_9 = if l_l_v41_9_0 ~= nil then l_l_v41_9_0.memoizedState[1] else {
        v93()
    };
    table.insert(v28, {
        primitive = "Memo", 
        stackError = l_Error_0.new(), 
        value = l_v41_9
    });
    return table.unpack(l_v41_9);
end;
local function v102(v98, v99, _) --[[ Line: 422 ]] --[[ Name: useMutableSource ]]
    -- upvalues: v41 (ref), v28 (ref), l_Error_0 (copy)
    local l_v41_10 = v41;
    if l_v41_10 ~= nil then
        v41 = l_v41_10.next;
    end;
    l_v41_10 = v41;
    if l_v41_10 ~= nil then
        v41 = l_v41_10.next;
    end;
    l_v41_10 = v41;
    if l_v41_10 ~= nil then
        v41 = l_v41_10.next;
    end;
    l_v41_10 = v41;
    if l_v41_10 ~= nil then
        v41 = l_v41_10.next;
    end;
    l_v41_10 = v99(v98._source);
    table.insert(v28, {
        primitive = "MutableSource", 
        stackError = l_Error_0.new(), 
        value = l_v41_10
    });
    return l_v41_10;
end;
local function v105() --[[ Line: 474 ]] --[[ Name: useOpaqueIdentifier ]]
    -- upvalues: v41 (ref), v30 (ref), l_NoMode_0 (copy), l_REACT_OPAQUE_ID_TYPE_0 (copy), v28 (ref), l_Error_0 (copy)
    local l_v41_11 = v41;
    if l_v41_11 ~= nil then
        v41 = l_v41_11.next;
    end;
    local l_l_v41_11_0 = l_v41_11;
    if v30 and v30.mode == l_NoMode_0 then
        l_v41_11 = v41;
        if l_v41_11 ~= nil then
            v41 = l_v41_11.next;
        end;
    end;
    l_v41_11 = if l_l_v41_11_0 == nil then nil else l_l_v41_11_0.memoizedState;
    if l_v41_11 and l_v41_11["$$typeof"] == l_REACT_OPAQUE_ID_TYPE_0 then
        l_v41_11 = nil;
    end;
    table.insert(v28, {
        primitive = "OpaqueIdentifier", 
        stackError = l_Error_0.new(), 
        value = l_v41_11
    });
    return l_v41_11;
end;
v31 = {
    readContext = v46, 
    useCallback = v92, 
    useContext = v49, 
    useEffect = v79, 
    useImperativeHandle = v84, 
    useDebugValue = v87, 
    useLayoutEffect = v75, 
    useMemo = v97, 
    useReducer = v61, 
    useRef = v65, 
    useBinding = v71, 
    useState = v54, 
    useMutableSource = v102, 
    useOpaqueIdentifier = v105
};
local v106 = 1;
local function v115(v107, v108, v109) --[[ Line: 569 ]] --[[ Name: findSharedIndex ]]
    local l_source_0 = v108[v109].source;
    for v111 = 1, #v107 do
        if v107[v111].source == l_source_0 then
            local v112 = v109 + 1;
            local v113 = v111 + 1;
            local v114 = false;
            while v112 <= #v108 and v113 <= #v107 do
                if v107[v113].source ~= v108[v112].source then
                    v114 = true;
                    break;
                else
                    v112 = v112 + 1;
                    v113 = v113 + 1;
                end;
            end;
            if not v114 then
                return v111;
            end;
        end;
    end;
    return -1;
end;
local function v120(v116, v117) --[[ Line: 613 ]] --[[ Name: findCommonAncestorIndex ]]
    -- upvalues: v115 (copy), v106 (ref)
    local v118 = v115(v117, v116, v106);
    if v118 ~= -1 then
        return v118;
    else
        for v119 = 1, math.min(#v116, 5) do
            v118 = v115(v117, v116, v119);
            if v118 ~= -1 then
                v106 = v119;
                return v118;
            end;
        end;
        return -1;
    end;
end;
local function _(v121, v122) --[[ Line: 644 ]] --[[ Name: isReactWrapper ]]
    -- upvalues: l_String_0 (copy)
    if not v121 or v121 == "" then
        return false;
    else
        local v123 = "use" .. tostring(v122);
        if string.len(v121) < string.len(v123) then
            return false;
        else
            return l_String_0.lastIndexOf(v121, v123) == string.len(v121) - string.len(v123) + 1;
        end;
    end;
end;
local function v138(v125, v126) --[[ Line: 668 ]] --[[ Name: findPrimitiveIndex ]]
    -- upvalues: v40 (copy), l_String_0 (copy)
    local v127 = v40():get(v126.primitive);
    if v127 == nil then
        return -1;
    else
        for v128 = 1, math.min(#v127, #v125) do
            local l_v128_0 = v128;
            if v127[l_v128_0].source ~= v125[l_v128_0].source then
                if l_v128_0 < #v125 then
                    local l_functionName_0 = v125[l_v128_0].functionName;
                    local l_primitive_0 = v126.primitive;
                    local v132;
                    if not l_functionName_0 or l_functionName_0 == "" then
                        v132 = false;
                    else
                        local v133 = "use" .. tostring(l_primitive_0);
                        v132 = string.len(l_functionName_0) >= string.len(v133) and l_String_0.lastIndexOf(l_functionName_0, v133) == string.len(l_functionName_0) - string.len(v133) + 1;
                    end;
                    if v132 then
                        l_v128_0 = l_v128_0 + 1;
                    end;
                end;
                if l_v128_0 < #v125 then
                    local l_functionName_1 = v125[l_v128_0].functionName;
                    local l_primitive_1 = v126.primitive;
                    local v136;
                    if not l_functionName_1 or l_functionName_1 == "" then
                        v136 = false;
                    else
                        local v137 = "use" .. tostring(l_primitive_1);
                        v136 = string.len(l_functionName_1) >= string.len(v137) and l_String_0.lastIndexOf(l_functionName_1, v137) == string.len(l_functionName_1) - string.len(v137) + 1;
                    end;
                    if v136 then
                        l_v128_0 = l_v128_0 + 1;
                    end;
                end;
                return l_v128_0;
            end;
        end;
        return -1;
    end;
end;
local function v144(v139, v140) --[[ Line: 737 ]] --[[ Name: parseTrimmedStack ]]
    -- upvalues: v18 (copy), v120 (copy), v138 (copy), l_Array_0 (copy)
    local v141 = v18.parse(v140.stackError);
    local v142 = v120(v139, v141);
    local v143 = v138(v141, v140);
    if v142 == -1 or v143 == -1 or v142 - v143 < 2 then
        return nil;
    else
        return l_Array_0.slice(v141, v143, v142 - 1);
    end;
end;
local function _(v145) --[[ Line: 757 ]] --[[ Name: parseCustomHookName ]]
    -- upvalues: l_String_0 (copy)
    if not v145 then
        return "";
    else
        local v146 = l_String_0.lastIndexOf(v145, ".");
        if v146 == -1 then
            v146 = 1;
        end;
        if l_String_0.substr(v145, v146, 3) == "use" then
            v146 = v146 + 3;
        end;
        return l_String_0.substr(v145, v146);
    end;
end;
local v148 = nil;
local function v173(v149, v150) --[[ Line: 790 ]] --[[ Name: buildTree ]]
    -- upvalues: v144 (copy), l_String_0 (copy), v148 (ref)
    local v151 = {};
    local v152 = nil;
    local l_v151_0 = v151;
    local v154 = 1;
    local v155 = {};
    for v156 = 1, #v150 do
        local v157 = v150[v156];
        local v158 = v144(v149, v157);
        if v158 ~= nil then
            local v159 = 0;
            if v152 ~= nil then
                while v159 < #v158 and v159 < #v152 and v158[#v158 - v159].source == v152[#v152 - v159].source do
                    v159 = v159 + 1;
                end;
                for _ = #v152 - 1, v159 + 1, -1 do
                    l_v151_0 = table.remove(v155);
                end;
            end;
            for v161 = #v158 - v159, 2, -1 do
                local v162 = {};
                local v163 = {
                    id = nil, 
                    isStateEditable = false
                };
                local l_functionName_2 = v158[v161 - 1].functionName;
                local v165;
                if not l_functionName_2 then
                    v165 = "";
                else
                    local v166 = l_String_0.lastIndexOf(l_functionName_2, ".");
                    if v166 == -1 then
                        v166 = 1;
                    end;
                    if l_String_0.substr(l_functionName_2, v166, 3) == "use" then
                        v166 = v166 + 3;
                    end;
                    v165 = l_String_0.substr(l_functionName_2, v166);
                end;
                v163.name = v165;
                v163.value = nil;
                v163.subHooks = v162;
                table.insert(l_v151_0, v163);
                table.insert(v155, l_v151_0);
                l_v151_0 = v162;
            end;
            v152 = v158;
        end;
        local function _() --[[ Line: 933 ]] --[[ Name: POSTFIX_INCREMENT ]]
            -- upvalues: v154 (ref)
            local l_v154_0 = v154;
            v154 = v154 + 1;
            return l_v154_0;
        end;
        local l_primitive_2 = v157.primitive;
        local v170;
        if l_primitive_2 == "Context" or l_primitive_2 == "DebugValue" then
            v170 = nil;
        else
            local l_v154_1 = v154;
            v154 = v154 + 1;
            v170 = l_v154_1;
        end;
        local v172 = true;
        if l_primitive_2 ~= "Reducer" then
            v172 = l_primitive_2 == "State";
        end;
        table.insert(l_v151_0, {
            id = v170, 
            isStateEditable = v172, 
            name = l_primitive_2, 
            value = v157.value, 
            subHooks = {}
        });
    end;
    v148(v151, nil);
    return v151;
end;
v148 = function(v174, v175) --[[ Line: 968 ]] --[[ Name: processDebugValues ]]
    -- upvalues: l_Array_0 (copy), v148 (ref)
    local v176 = {};
    local v177 = 1;
    while v177 <= #v174 do
        local v178 = v174[v177];
        if v178.name == "DebugValue" and #v178.subHooks == 0 then
            l_Array_0.splice(v174, v177, 1);
            v177 = v177 - 1;
            table.insert(v176, v178);
        else
            v148(v178.subHooks, v178);
        end;
        v177 = v177 + 1;
    end;
    if v175 ~= nil then
        if #v176 == 1 then
            v175.value = v176[1].value;
            return;
        elseif #v176 > 1 then
            v175.value = l_Array_0.map(v176, function(v179) --[[ Line: 1020 ]]
                return v179.value;
            end);
        end;
    end;
end;
local function v188(v180, v181, v182) --[[ Line: 1027 ]] --[[ Name: inspectHooks ]]
    -- upvalues: l_ReactSharedInternals_0 (copy), v31 (ref), l_Error_0 (copy), v28 (ref), v18 (copy), v173 (copy)
    if v182 == nil then
        v182 = l_ReactSharedInternals_0.ReactCurrentDispatcher;
    end;
    local l_current_0 = v182.current;
    local v184 = nil;
    v182.current = v31;
    local v185 = nil;
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 1052 ]]
        -- upvalues: v185 (ref), l_Error_0 (ref), v180 (copy), v181 (copy)
        v185 = l_Error_0.new();
        v180(v181);
    end);
    v184 = v28;
    v28 = {};
    v182.current = l_current_0;
    if not l_status_1 then
        error(l_result_1);
    end;
    l_status_1 = v18.parse(v185);
    return (v173(l_status_1, v184));
end;
v7.inspectHooks = v188;
local function v193(v189, v190) --[[ Line: 1081 ]] --[[ Name: setupContexts ]]
    -- upvalues: l_ContextProvider_0 (copy)
    local l_v190_0 = v190;
    while l_v190_0 do
        if l_v190_0.tag == l_ContextProvider_0 then
            local l__context_0 = l_v190_0.type._context;
            if not v189:has(l__context_0) then
                v189:set(l__context_0, l__context_0._currentValue);
                l__context_0._currentValue = l_v190_0.memoizedProps.value;
            end;
        end;
        l_v190_0 = l_v190_0.return_;
    end;
end;
local _ = function(v194) --[[ Line: 1105 ]] --[[ Name: restoreContexts ]]
    for _, v196 in v194 do
        v196[1]._currentValue = v196[2];
    end;
end;
local function v207(v198, v199, v200, v201) --[[ Line: 1117 ]] --[[ Name: inspectHooksOfForwardRef ]]
    -- upvalues: v31 (ref), l_Error_0 (copy), v28 (ref), v18 (copy), v173 (copy)
    local l_current_1 = v201.current;
    local v203 = nil;
    v201.current = v31;
    local v204 = nil;
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 1130 ]]
        -- upvalues: v204 (ref), l_Error_0 (ref), v198 (copy), v199 (copy), v200 (copy)
        v204 = l_Error_0.new();
        v198(v199, v200);
    end);
    v203 = v28;
    v28 = {};
    v201.current = l_current_1;
    if not l_status_2 then
        error(l_result_2);
    end;
    l_status_2 = v18.parse(v204);
    return (v173(l_status_2, v203));
end;
local function v213(v208, v209) --[[ Line: 1157 ]] --[[ Name: resolveDefaultProps ]]
    -- upvalues: l_Object_0 (copy)
    if typeof(v208) == "table" and v208.defaultProps then
        local v210 = l_Object_0.assign({}, v209);
        local l_defaultProps_0 = v208.defaultProps;
        for v212 in l_defaultProps_0 do
            if v210[v212] == nil then
                v210[v212] = l_defaultProps_0[v212];
            end;
        end;
        return v210;
    else
        return v209;
    end;
end;
v7.inspectHooksOfFiber = function(v214, v215) --[[ Line: 1183 ]] --[[ Name: inspectHooksOfFiber ]]
    -- upvalues: l_ReactSharedInternals_0 (copy), v30 (ref), l_FunctionComponent_0 (copy), l_SimpleMemoComponent_0 (copy), l_ForwardRef_0 (copy), l_Block_0 (copy), l_Error_0 (copy), v40 (copy), v213 (copy), v41 (ref), l_Map_0 (copy), v193 (copy), v207 (copy), v188 (copy)
    if v215 == nil then
        v215 = l_ReactSharedInternals_0.ReactCurrentDispatcher;
    end;
    v30 = v214;
    if v214.tag ~= l_FunctionComponent_0 and v214.tag ~= l_SimpleMemoComponent_0 and v214.tag ~= l_ForwardRef_0 and v214.tag ~= l_Block_0 then
        error(l_Error_0.new("Unknown Fiber. Needs to be a function component to inspect hooks."));
    end;
    v40();
    local l_type_0 = v214.type;
    local l_memoizedProps_0 = v214.memoizedProps;
    if l_type_0 ~= v214.elementType then
        l_memoizedProps_0 = v213(l_type_0, l_memoizedProps_0);
    end;
    v41 = v214.memoizedState;
    local v218 = l_Map_0.new();
    local l_status_3, l_result_3 = pcall(function() --[[ Line: 1214 ]]
        -- upvalues: v193 (ref), v218 (copy), v214 (copy), l_ForwardRef_0 (ref), v207 (ref), l_type_0 (copy), l_memoizedProps_0 (ref), v215 (ref), v188 (ref)
        v193(v218, v214);
        if v214.tag == l_ForwardRef_0 then
            return (v207(l_type_0.render, l_memoizedProps_0, v214.ref, v215));
        else
            return (v188(l_type_0, l_memoizedProps_0, v215));
        end;
    end);
    v41 = nil;
    for _, v222 in v218 do
        v222[1]._currentValue = v222[2];
    end;
    if not l_status_3 then
        error(l_result_3);
    end;
    return l_result_3;
end;
return v7;