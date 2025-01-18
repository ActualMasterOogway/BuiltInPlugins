local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_WeakMap_0 = v1.WeakMap;
local l_Number_0 = v1.Number;
local l_Object_0 = v1.Object;
local l_HttpService_0 = game:GetService("HttpService");
local v7 = {};
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v9 = require(l_Parent_0.ReactIs);
local l_isElement_0 = v9.isElement;
local l_typeOf_0 = v9.typeOf;
local l_ContextConsumer_0 = v9.ContextConsumer;
local l_ContextProvider_0 = v9.ContextProvider;
local l_ForwardRef_0 = v9.ForwardRef;
local l_Fragment_0 = v9.Fragment;
local l_Lazy_0 = v9.Lazy;
local l_Memo_0 = v9.Memo;
local l_Portal_0 = v9.Portal;
local l_Profiler_0 = v9.Profiler;
local l_StrictMode_0 = v9.StrictMode;
local l_Suspense_0 = v9.Suspense;
local l_REACT_SUSPENSE_LIST_TYPE_0 = require(l_Parent_0.Shared).ReactSymbols.REACT_SUSPENSE_LIST_TYPE;
local v23 = require(script.Parent.constants);
local l_TREE_OPERATION_ADD_0 = v23.TREE_OPERATION_ADD;
local l_TREE_OPERATION_REMOVE_0 = v23.TREE_OPERATION_REMOVE;
local l_TREE_OPERATION_REORDER_CHILDREN_0 = v23.TREE_OPERATION_REORDER_CHILDREN;
local l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0 = v23.TREE_OPERATION_UPDATE_TREE_BASE_DURATION;
local v28 = require(script.Parent.types);
local l_ElementTypeRoot_0 = v28.ElementTypeRoot;
local l_LOCAL_STORAGE_FILTER_PREFERENCES_KEY_0 = v23.LOCAL_STORAGE_FILTER_PREFERENCES_KEY;
local l_LOCAL_STORAGE_SHOULD_BREAK_ON_CONSOLE_ERRORS_0 = v23.LOCAL_STORAGE_SHOULD_BREAK_ON_CONSOLE_ERRORS;
local l_LOCAL_STORAGE_SHOULD_PATCH_CONSOLE_KEY_0 = v23.LOCAL_STORAGE_SHOULD_PATCH_CONSOLE_KEY;
local l_ComponentFilterElementType_0 = v28.ComponentFilterElementType;
local l_ElementTypeHostComponent_0 = v28.ElementTypeHostComponent;
local l_ElementTypeClass_0 = v28.ElementTypeClass;
local l_ElementTypeForwardRef_0 = v28.ElementTypeForwardRef;
local l_ElementTypeFunction_0 = v28.ElementTypeFunction;
local l_ElementTypeMemo_0 = v28.ElementTypeMemo;
local v39 = require(script.Parent.storage);
local l_localStorageGetItem_0 = v39.localStorageGetItem;
local l_localStorageSetItem_0 = v39.localStorageSetItem;
local l_meta_0 = require(script.Parent.hydration).meta;
local v43 = l_WeakMap_0.new();
v7.alphaSortKeys = function(v44, v45) --[[ Line: 81 ]]
    return tostring(v44) > tostring(v45);
end;
v7.getAllEnumerableKeys = function(v46) --[[ Line: 89 ]]
    -- upvalues: l_Object_0 (copy)
    return l_Object_0.keys(v46);
end;
v7.getDisplayName = function(v47, v48) --[[ Line: 94 ]]
    -- upvalues: v43 (copy), l_getComponentName_0 (copy)
    v48 = v48 or "Anonymous";
    local v49 = v43:get(v47);
    if v49 ~= nil then
        return v49;
    else
        local l_v48_0 = v48;
        if typeof(v47) == "table" and typeof(v47.__componentName) == "string" then
            l_v48_0 = v47.__componentName;
        elseif typeof(v47) == "table" and typeof(v47.name) == "string" and v47.name ~= "" then
            l_v48_0 = v47.name;
        elseif typeof(v47) == "function" then
            l_v48_0 = l_getComponentName_0(v47) or l_v48_0;
        end;
        v43:set(v47, l_v48_0);
        return l_v48_0;
    end;
end;
local v51 = 0;
v7.getUID = function() --[[ Line: 130 ]]
    -- upvalues: v51 (ref)
    v51 = v51 + 1;
    return v51;
end;
v7.printOperationsArray = function(v52) --[[ Line: 142 ]]
    -- upvalues: l_TREE_OPERATION_ADD_0 (copy), l_ElementTypeRoot_0 (copy), l_TREE_OPERATION_REMOVE_0 (copy), l_TREE_OPERATION_REORDER_CHILDREN_0 (copy), l_Array_0 (copy), l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0 (copy)
    local v53 = v52[1];
    local v54 = v52[2];
    local v55 = {
        string.format("operations for renderer:%s and root:%s", tostring(v53), (tostring(v54)))
    };
    local v56 = 3;
    local function _() --[[ Line: 158 ]] --[[ Name: POSTFIX_INCREMENT ]]
        -- upvalues: v56 (ref)
        local l_v56_0 = v56;
        v56 = v56 + 1;
        return l_v56_0;
    end;
    local v59 = {
        ""
    };
    local l_v56_1 = v56;
    v56 = v56 + 1;
    local v61 = v56 + v52[l_v56_1];
    while v56 < v61 do
        local l_v56_2 = v56;
        v56 = v56 + 1;
        table.insert(v59, v52[l_v56_2]);
    end;
    while #v52 > v56 do
        l_v56_1 = v52[v56];
        if l_v56_1 == l_TREE_OPERATION_ADD_0 then
            local v63 = v52[v56 + 1];
            local v64 = v52[v56 + 2];
            v56 = v56 + 3;
            if v64 == l_ElementTypeRoot_0 then
                table.insert(v55, string.format("Add new root node %d", v63));
                v56 = v56 + 1;
                v56 = v56 + 1;
            else
                local v65 = v52[v56];
                v56 = v56 + 1;
                v56 = v56 + 1;
                local v66 = v59[v52[v56] + 1];
                v56 = v56 + 1;
                v56 = v56 + 1;
                table.insert(v55, string.format("Add node %d (%s) as child of %d", v63, v66 or "null", v65));
            end;
        elseif l_v56_1 == l_TREE_OPERATION_REMOVE_0 then
            local v67 = v52[v56 + 1];
            v56 = v56 + 2;
            for _ = 1, v67 do
                local v69 = v52[v56];
                v56 = v56 + 1;
                table.insert(v55, string.format("Remove node %d", v69));
            end;
        elseif l_v56_1 == l_TREE_OPERATION_REORDER_CHILDREN_0 then
            local v70 = v52[v56 + 1];
            local v71 = v52[v56 + 2];
            v56 = v56 + 3;
            local v72 = l_Array_0.slice(v52, v56, v56 + v71);
            v56 = v56 + v71;
            table.insert(v55, string.format("Re-order node %d children %s", v70, l_Array_0.join(v72, ",")));
        elseif l_v56_1 == l_TREE_OPERATION_UPDATE_TREE_BASE_DURATION_0 then
            v56 = v56 + 3;
        else
            error(string.format("Unsupported Bridge operation %d", l_v56_1));
        end;
    end;
    print(table.concat(v55, "\n  "));
end;
v7.getDefaultComponentFilters = function() --[[ Line: 255 ]]
    -- upvalues: l_ComponentFilterElementType_0 (copy), l_ElementTypeHostComponent_0 (copy)
    return {
        {
            type = l_ComponentFilterElementType_0, 
            value = l_ElementTypeHostComponent_0, 
            isEnabled = true
        }
    };
end;
v7.getSavedComponentFilters = function() --[[ Line: 264 ]]
    -- upvalues: l_localStorageGetItem_0 (copy), l_LOCAL_STORAGE_FILTER_PREFERENCES_KEY_0 (copy), l_HttpService_0 (copy), v7 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 265 ]]
        -- upvalues: l_localStorageGetItem_0 (ref), l_LOCAL_STORAGE_FILTER_PREFERENCES_KEY_0 (ref), l_HttpService_0 (ref)
        local v73 = l_localStorageGetItem_0(l_LOCAL_STORAGE_FILTER_PREFERENCES_KEY_0);
        if v73 ~= nil then
            return l_HttpService_0:JSONDecode(v73);
        else
            return nil;
        end;
    end);
    if not l_status_0 then
        return v7.getDefaultComponentFilters();
    else
        return l_result_0;
    end;
end;
v7.saveComponentFilters = function(v76) --[[ Line: 278 ]]
    -- upvalues: l_localStorageSetItem_0 (copy), l_LOCAL_STORAGE_FILTER_PREFERENCES_KEY_0 (copy), l_HttpService_0 (copy)
    l_localStorageSetItem_0(l_LOCAL_STORAGE_FILTER_PREFERENCES_KEY_0, l_HttpService_0:JSONEncode(v76));
end;
v7.getAppendComponentStack = function() --[[ Line: 284 ]]
    -- upvalues: l_localStorageGetItem_0 (copy), l_LOCAL_STORAGE_SHOULD_PATCH_CONSOLE_KEY_0 (copy), l_HttpService_0 (copy)
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 285 ]]
        -- upvalues: l_localStorageGetItem_0 (ref), l_LOCAL_STORAGE_SHOULD_PATCH_CONSOLE_KEY_0 (ref), l_HttpService_0 (ref)
        local v77 = l_localStorageGetItem_0(l_LOCAL_STORAGE_SHOULD_PATCH_CONSOLE_KEY_0);
        if v77 ~= nil then
            return l_HttpService_0:JSONDecode(v77);
        else
            return nil;
        end;
    end);
    if not l_status_1 then
        return true;
    else
        return l_result_1;
    end;
end;
v7.setAppendComponentStack = function(v80) --[[ Line: 298 ]]
    -- upvalues: l_localStorageSetItem_0 (copy), l_LOCAL_STORAGE_SHOULD_PATCH_CONSOLE_KEY_0 (copy), l_HttpService_0 (copy)
    l_localStorageSetItem_0(l_LOCAL_STORAGE_SHOULD_PATCH_CONSOLE_KEY_0, l_HttpService_0:JSONEncode(v80));
end;
v7.getBreakOnConsoleErrors = function() --[[ Line: 301 ]]
    -- upvalues: l_localStorageGetItem_0 (copy), l_LOCAL_STORAGE_SHOULD_BREAK_ON_CONSOLE_ERRORS_0 (copy), l_HttpService_0 (copy)
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 302 ]]
        -- upvalues: l_localStorageGetItem_0 (ref), l_LOCAL_STORAGE_SHOULD_BREAK_ON_CONSOLE_ERRORS_0 (ref), l_HttpService_0 (ref)
        local v81 = l_localStorageGetItem_0(l_LOCAL_STORAGE_SHOULD_BREAK_ON_CONSOLE_ERRORS_0);
        if v81 ~= nil then
            return l_HttpService_0:JSONDecode(v81);
        else
            return nil;
        end;
    end);
    if l_status_2 then
        return l_result_2;
    else
        return false;
    end;
end;
v7.setBreakOnConsoleErrors = function(v84) --[[ Line: 315 ]]
    -- upvalues: l_localStorageSetItem_0 (copy), l_LOCAL_STORAGE_SHOULD_BREAK_ON_CONSOLE_ERRORS_0 (copy), l_HttpService_0 (copy)
    l_localStorageSetItem_0(l_LOCAL_STORAGE_SHOULD_BREAK_ON_CONSOLE_ERRORS_0, l_HttpService_0:JSONEncode(v84));
end;
v7.separateDisplayNameAndHOCs = function(v85, v86) --[[ Line: 321 ]]
    -- upvalues: l_ElementTypeClass_0 (copy), l_ElementTypeForwardRef_0 (copy), l_ElementTypeFunction_0 (copy), l_ElementTypeMemo_0 (copy), l_Array_0 (copy)
    if v85 == nil then
        return nil, nil;
    else
        local v87 = nil;
        if (v86 == l_ElementTypeClass_0 or v86 == l_ElementTypeForwardRef_0 or v86 == l_ElementTypeFunction_0 or v86 == l_ElementTypeMemo_0) and string.find(v85, "(", 1, true) then
            local v88 = {};
            for v89 in string.gmatch(v85, "[^()]+") do
                table.insert(v88, v89);
            end;
            local v90 = #v88;
            local v91 = v88[v90];
            v88[v90] = nil;
            v85 = v91;
            v87 = v88;
        end;
        if v86 == l_ElementTypeMemo_0 then
            if v87 == nil then
                v87 = {
                    "Memo"
                };
            else
                l_Array_0.unshift(v87, "Memo");
            end;
        elseif v86 == l_ElementTypeForwardRef_0 then
            if v87 == nil then
                v87 = {
                    "ForwardRef"
                };
            else
                l_Array_0.unshift(v87, "ForwardRef");
            end;
        end;
        return v85, v87;
    end;
end;
v7.shallowDiffers = function(v92, v93) --[[ Line: 373 ]]
    for v94, v95 in v92 do
        if v93[v94] ~= v95 then
            return true;
        end;
    end;
    return false;
end;
v7.getInObject = function(v96, v97) --[[ Line: 382 ]]
    -- upvalues: l_Array_0 (copy)
    return l_Array_0.reduce(v97, function(v98, v99) --[[ Line: 383 ]]
        if v98 and v98[v99] ~= nil then
            return v98[v99];
        else
            return nil;
        end;
    end, v96);
end;
v7.deletePathInObject = function(v100, v101) --[[ Line: 397 ]]
    -- upvalues: v7 (copy), l_Array_0 (copy)
    local v102 = #v101;
    local v103 = v101[v102];
    if v100 ~= nil then
        local v104 = v7.getInObject(v100, l_Array_0.slice(v101, 0, v102));
        if v104 then
            if l_Array_0.isArray(v104) then
                l_Array_0.splice(v104, v103, 1);
                return;
            else
                v104[v103] = nil;
            end;
        end;
    end;
end;
v7.renamePathInObject = function(v105, v106, v107) --[[ Line: 413 ]]
    -- upvalues: v7 (copy), l_Array_0 (copy)
    local v108 = #v106;
    if v105 ~= nil then
        local v109 = v7.getInObject(v105, l_Array_0.slice(v106, 1, v108));
        if v109 then
            local v110 = v106[v108];
            v109[v107[v108]] = v109[v110];
            if l_Array_0.isArray(v109) then
                l_Array_0.splice(v109, v110, 1);
                return;
            else
                v109[v110] = nil;
            end;
        end;
    end;
end;
v7.setInObject = function(v111, v112, v113) --[[ Line: 438 ]]
    -- upvalues: v7 (copy), l_Array_0 (copy)
    local v114 = #v112;
    local v115 = v112[v114];
    if v111 ~= nil then
        local v116 = v7.getInObject(v111, l_Array_0.slice(v112, 1, v114));
        if v116 then
            v116[v115] = v113;
        end;
    end;
end;
v7.getDataType = function(v117) --[[ Line: 481 ]]
    -- upvalues: l_isElement_0 (copy), l_Number_0 (copy), l_Array_0 (copy)
    if v117 == nil then
        return "null";
    elseif l_isElement_0(v117) then
        return "react_element";
    else
        local v118 = typeof(v117);
        if v118 == "bigint" then
            return "bigint";
        elseif v118 == "boolean" then
            return "boolean";
        elseif v118 == "function" then
            return "function";
        elseif v118 == "number" then
            if l_Number_0.isNaN(v117) then
                return "nan";
            elseif not l_Number_0.isFinite(v117) then
                return "infinity";
            else
                return "number";
            end;
        elseif v118 == "object" then
            if l_Array_0.isArray(v117) then
                return "array";
            else
                return "object";
            end;
        elseif v118 == "string" then
            return "string";
        elseif v118 == "nil" then
            return "nil";
        else
            return "unknown";
        end;
    end;
end;
v7.getDisplayNameForReactElement = function(v119) --[[ Line: 563 ]]
    -- upvalues: l_typeOf_0 (copy), l_ContextConsumer_0 (copy), l_ContextProvider_0 (copy), l_ForwardRef_0 (copy), l_Fragment_0 (copy), l_Lazy_0 (copy), l_Memo_0 (copy), l_Portal_0 (copy), l_Profiler_0 (copy), l_StrictMode_0 (copy), l_Suspense_0 (copy), l_REACT_SUSPENSE_LIST_TYPE_0 (copy), v7 (copy)
    local v120 = l_typeOf_0(v119);
    if v120 == l_ContextConsumer_0 then
        return "ContextConsumer";
    elseif v120 == l_ContextProvider_0 then
        return "ContextProvider";
    elseif v120 == l_ForwardRef_0 then
        return "ForwardRef";
    elseif v120 == l_Fragment_0 then
        return "Fragment";
    elseif v120 == l_Lazy_0 then
        return "Lazy";
    elseif v120 == l_Memo_0 then
        return "Memo";
    elseif v120 == l_Portal_0 then
        return "Portal";
    elseif v120 == l_Profiler_0 then
        return "Profiler";
    elseif v120 == l_StrictMode_0 then
        return "StrictMode";
    elseif v120 == l_Suspense_0 then
        return "Suspense";
    elseif v120 == l_REACT_SUSPENSE_LIST_TYPE_0 then
        return "SuspenseList";
    else
        local v121 = if v119 then v119.type else nil;
        if typeof(v121) == "string" then
            return v121;
        elseif typeof(v121) == "function" then
            return v7.getDisplayName(v121, "Anonymous");
        elseif v121 ~= nil then
            return "NotImplementedInDevtools";
        else
            return "Element";
        end;
    end;
end;
local function v124(v122, v123) --[[ Line: 603 ]] --[[ Name: truncateForDisplay ]]
    v123 = v123 or 50;
    if v123 < string.len(v122) then
        return string.sub(v122, 1, v123 + 1) .. "\226\128\166";
    else
        return v122;
    end;
end;
v7.formatDataForPreview = function(v125, v126) --[[ Line: 636 ]] --[[ Name: formatDataForPreview ]]
    -- upvalues: l_meta_0 (copy), v7 (copy), v124 (copy)
    if v125[l_meta_0.type] ~= nil then
        if v126 then
            return v125[l_meta_0.preview_long];
        else
            return v125[l_meta_0.preview_short];
        end;
    else
        local v127 = v7.getDataType(v125);
        if v127 == "html_element" then
            local l_format_0 = string.format;
            local v129 = "<%s />";
            local v130, v131 = string.lower(v125.tagName);
            v131 = v131 or 50;
            return l_format_0(v129, if v131 < string.len(v130) then string.sub(v130, 1, v131 + 1) .. "\226\128\166" else v130);
        elseif v127 == "function" then
            local v132, v133 = string.format("\198\146 %s() {}", typeof(v125.name) == "function" and "" or v125.name);
            v133 = v133 or 50;
            if v133 < string.len(v132) then
                return string.sub(v132, 1, v133 + 1) .. "\226\128\166";
            else
                return v132;
            end;
        elseif v127 == "string" then
            return string.format("\"%s\"", (tostring(v125)));
        elseif v127 == "react_element" then
            local l_format_1 = string.format;
            local v135 = "<%s />";
            local v136 = v7.getDisplayNameForReactElement(v125) or "Unknown";
            local v137 = nil or 50;
            return l_format_1(v135, if v137 < string.len(v136) then string.sub(v136, 1, v137 + 1) .. "\226\128\166" else v136);
        elseif v127 == "array" then
            if v126 then
                local v138 = "";
                for v139 = 1, #v125 do
                    if v139 > 1 then
                        v138 = v138 .. ", ";
                    end;
                    v138 = v138 .. v7.formatDataForPreview(v125[v139], false);
                    if string.len(v138) > 50 then
                        break;
                    end;
                end;
                local l_format_2 = string.format;
                local v141 = "[%s]";
                local l_v138_0 = v138;
                local v143 = nil or 50;
                return l_format_2(v141, if v143 < string.len(l_v138_0) then string.sub(l_v138_0, 1, v143 + 1) .. "\226\128\166" else l_v138_0);
            else
                local v144 = if v125[#l_meta_0] ~= nil then v125[#l_meta_0] else #v125;
                return string.format("Array(%s)", v144);
            end;
        elseif v127 == "object" then
            if v126 then
                local v145 = v7.getAllEnumerableKeys(v125);
                table.sort(v145, v7.alphaSortKeys);
                local v146 = "";
                for v147 = 1, #v145 do
                    local v148 = v145[v147];
                    if v147 > 1 then
                        v146 = v146 .. ", ";
                    end;
                    v146 = v146 .. string.format("%s: %s", tostring(v148), v7.formatDataForPreview(v125[v148], false));
                    if string.len(v146) > 50 then
                        break;
                    end;
                end;
                local l_format_3 = string.format;
                local v150 = "{%s}";
                local l_v146_0 = v146;
                local v152 = nil or 50;
                return l_format_3(v150, if v152 < string.len(l_v146_0) then string.sub(l_v146_0, 1, v152 + 1) .. "\226\128\166" else l_v146_0);
            else
                return "{\226\128\166}";
            end;
        elseif v127 == "boolean" or v127 == "number" or v127 == "infinity" or v127 == "nan" or v127 == "null" or v127 == "undefined" then
            return (tostring(v125));
        else
            local l_status_3, l_result_3 = pcall(v124, "" .. tostring(v125));
            if l_status_3 then
                return l_result_3;
            else
                return "unserializable";
            end;
        end;
    end;
end;
return v7;