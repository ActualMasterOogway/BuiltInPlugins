local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_inspect_0 = v1.util.inspect;
local _ = require(l_Parent_0.Shared);
local l_isValidElementType_0 = require(l_Parent_0.Shared).isValidElementType;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_getIteratorFn_0 = l_ReactSymbols_0.getIteratorFn;
local _ = l_ReactSymbols_0.REACT_FORWARD_REF_TYPE;
local _ = l_ReactSymbols_0.REACT_MEMO_TYPE;
local l_REACT_FRAGMENT_TYPE_0 = l_ReactSymbols_0.REACT_FRAGMENT_TYPE;
local l_REACT_ELEMENT_TYPE_0 = l_ReactSymbols_0.REACT_ELEMENT_TYPE;
local l_warnAboutSpreadingKeyToJSX_0 = require(l_Parent_0.Shared).ReactFeatureFlags.warnAboutSpreadingKeyToJSX;
local l_checkPropTypes_0 = require(l_Parent_0.Shared).checkPropTypes;
local l_ReactCurrentOwner_0 = require(l_Parent_0.Shared).ReactSharedInternals.ReactCurrentOwner;
local v19 = require(script.Parent.ReactElement);
local l_isValidElement_0 = v19.isValidElement;
local l_createElement_0 = v19.createElement;
local l_cloneElement_0 = v19.cloneElement;
local l_jsxDEV_0 = v19.jsxDEV;
local l_setExtraStackFrame_0 = require(l_Parent_0.Shared).ReactSharedInternals.ReactDebugCurrentFrame.setExtraStackFrame;
local l_describeUnknownElementTypeFrameInDEV_0 = require(l_Parent_0.Shared).ReactComponentStackFrame.describeUnknownElementTypeFrameInDEV;
local v26 = {};
local function _(v27) --[[ Line: 63 ]] --[[ Name: setCurrentlyValidatingElement ]]
    -- upvalues: l_describeUnknownElementTypeFrameInDEV_0 (copy), l_setExtraStackFrame_0 (copy)
    if _G.__DEV__ then
        if v27 then
            local l__owner_0 = v27._owner;
            local v29 = nil;
            if l__owner_0 then
                v29 = l__owner_0.type;
            end;
            local v30 = l_describeUnknownElementTypeFrameInDEV_0(v27.type, v27._source, v29);
            l_setExtraStackFrame_0(v30);
            return;
        else
            l_setExtraStackFrame_0(nil);
        end;
    end;
end;
local v32 = nil;
if _G.__DEV__ then
    v32 = false;
end;
local function _(v33, v34) --[[ Line: 91 ]] --[[ Name: hasOwnProperty ]]
    return v33[v34] ~= nil;
end;
local function _() --[[ Line: 95 ]] --[[ Name: getDeclarationErrorAddendum ]]
    -- upvalues: l_ReactCurrentOwner_0 (copy), l_getComponentName_0 (copy)
    if l_ReactCurrentOwner_0.current then
        local v36 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
        if v36 then
            return "\n\nCheck the render method of `" .. v36 .. "`.";
        end;
    end;
    return "";
end;
local function _(v38) --[[ Line: 106 ]] --[[ Name: getSourceInfoErrorAddendum ]]
    if v38 ~= nil then
        return "\n\nCheck your code at " .. string.gsub(v38.fileName, "^.*[\\/]", "") .. ":" .. v38.lineNumber .. ".";
    else
        return "";
    end;
end;
local function _(v40) --[[ Line: 116 ]] --[[ Name: getSourceInfoErrorAddendumForProps ]]
    if v40 ~= nil then
        local l___source_0 = v40.__source;
        if l___source_0 ~= nil then
            return "\n\nCheck your code at " .. string.gsub(l___source_0.fileName, "^.*[\\/]", "") .. ":" .. l___source_0.lineNumber .. ".";
        else
            return "";
        end;
    else
        return "";
    end;
end;
local v43 = {};
local function v50(v44) --[[ Line: 133 ]] --[[ Name: getCurrentComponentErrorInfo ]]
    -- upvalues: l_ReactCurrentOwner_0 (copy), l_getComponentName_0 (copy), l_Boolean_0 (copy)
    local v45 = false;
    local v46;
    if l_ReactCurrentOwner_0.current then
        local v47 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
        if v47 then
            v46 = "\n\nCheck the render method of `" .. v47 .. "`.";
            v45 = true;
        end;
    end;
    if not v45 then
        v46 = "";
    end;
    v45 = false;
    if not l_Boolean_0.toJSBoolean(v46) then
        local v48 = if typeof(v44) == "string" then v44 else if typeof(v44) == "table" then v44.displayName or v44.name else nil;
        if not v48 and typeof(v44) == "function" then
            local v49 = debug.info(v44, "n");
            v48 = if v49 ~= "" then v49 else nil;
        end;
        if v48 then
            v46 = string.format("\n\nCheck the top-level render call using <%s>.", v48);
        end;
    end;
    return v46;
end;
local function v59(v51, v52, v53) --[[ Line: 175 ]] --[[ Name: validateExplicitKey ]]
    -- upvalues: v50 (copy), v43 (copy), l_ReactCurrentOwner_0 (copy), l_getComponentName_0 (copy), l_describeUnknownElementTypeFrameInDEV_0 (copy), l_setExtraStackFrame_0 (copy), l_console_0 (copy)
    if v51._store == nil or v51._store.validated then
        return;
    else
        v51._store.validated = true;
        if v51.key ~= nil ~= (v53 ~= nil) then
            return;
        else
            local v54 = v50(v52);
            if v43[v54] then
                return;
            else
                v43[v54] = true;
                local v55 = "";
                if v51 and v51._owner and v51._owner ~= l_ReactCurrentOwner_0.current then
                    v55 = string.format(" It was passed a child from %s.", (tostring(l_getComponentName_0(v51._owner.type))));
                end;
                if _G.__DEV__ then
                    if _G.__DEV__ then
                        if v51 then
                            local l__owner_1 = v51._owner;
                            local v57 = nil;
                            if l__owner_1 then
                                v57 = l__owner_1.type;
                            end;
                            local v58 = l_describeUnknownElementTypeFrameInDEV_0(v51.type, v51._source, v57);
                            l_setExtraStackFrame_0(v58);
                        else
                            l_setExtraStackFrame_0(nil);
                        end;
                    end;
                    if v51.key ~= nil and v53 ~= nil then
                        l_console_0.error("Child element received a \"key\" prop (\"%s\") in addition to a key in " .. "the \"children\" table of its parent (\"%s\"). Please provide only " .. "one key definition. When both are present, the \"key\" prop " .. "will take precedence." .. "%s%s See https://reactjs.org/link/warning-keys for more information.", tostring(v51.key), tostring(v53), v54, v55);
                    else
                        l_console_0.error("Each child in a list should have a unique \"key\" prop." .. "%s%s See https://reactjs.org/link/warning-keys for more information.", v54, v55);
                    end;
                    if _G.__DEV__ then
                        l_setExtraStackFrame_0(nil);
                    end;
                end;
                return;
            end;
        end;
    end;
end;
local function v67(v60, v61) --[[ Line: 250 ]] --[[ Name: validateChildKeys ]]
    -- upvalues: l_Array_0 (copy), l_isValidElement_0 (copy), v59 (copy), l_getIteratorFn_0 (copy)
    if typeof(v60) ~= "table" then
        return;
    elseif l_Array_0.isArray(v60) then
        for v62 = 1, #v60 do
            local v63 = v60[v62];
            if l_isValidElement_0(v63) then
                v59(v63, v61);
            end;
        end;
        return;
    else
        if l_isValidElement_0(v60) then
            if v60._store then
                v60._store.validated = true;
                return;
            end;
        elseif v60 then
            local v64 = l_getIteratorFn_0(v60);
            if typeof(v64) == "function" and v64 ~= v60.entries then
                local v65 = v64(v60);
                local v66 = v65.next();
                while not v66.done do
                    if l_isValidElement_0(v66.value) then
                        v59(v66.value, v61, v66.key);
                    end;
                    v66 = v65.next();
                end;
            end;
        end;
        return;
    end;
end;
local function v74(v68) --[[ Line: 293 ]] --[[ Name: validatePropTypes ]]
    -- upvalues: l_getComponentName_0 (copy), l_checkPropTypes_0 (copy), v32 (ref), l_console_0 (copy)
    if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        local l_type_0 = v68.type;
        if l_type_0 == nil or typeof(l_type_0) == "string" then
            return;
        else
            local v70 = nil;
            local v71 = nil;
            if typeof(l_type_0) == "function" then
                return;
            elseif typeof(l_type_0) == "table" then
                v70 = l_type_0.propTypes;
                v71 = l_type_0.validateProps;
                if v70 or v71 then
                    local v72 = l_getComponentName_0(l_type_0);
                    l_checkPropTypes_0(v70, v71, v68.props, "prop", v72, v68);
                elseif l_type_0.PropTypes ~= nil and not v32 then
                    v32 = true;
                    local v73 = l_getComponentName_0(l_type_0);
                    l_console_0.error("Component %s declared `PropTypes` instead of `propTypes`. Did you misspell the property assignment?", v73 or "Unknown");
                end;
                if l_type_0.getDefaultProps ~= nil then
                    l_console_0.error("getDefaultProps is only used on classic React.createClass " .. "definitions. Use a static property named `defaultProps` instead.");
                end;
            else
                return;
            end;
        end;
    end;
end;
local function v85(v75) --[[ Line: 343 ]] --[[ Name: validateFragmentProps ]]
    -- upvalues: l_Object_0 (copy), l_describeUnknownElementTypeFrameInDEV_0 (copy), l_setExtraStackFrame_0 (copy), l_console_0 (copy)
    if _G.__DEV__ then
        local v76 = l_Object_0.keys(v75.props);
        for v77 = 1, #v76 do
            local v78 = v76[v77];
            if v78 ~= "children" and v78 ~= "key" then
                if _G.__DEV__ then
                    if v75 then
                        local l__owner_2 = v75._owner;
                        local v80 = nil;
                        if l__owner_2 then
                            v80 = l__owner_2.type;
                        end;
                        local v81 = l_describeUnknownElementTypeFrameInDEV_0(v75.type, v75._source, v80);
                        l_setExtraStackFrame_0(v81);
                    else
                        l_setExtraStackFrame_0(nil);
                    end;
                end;
                l_console_0.error("Invalid prop `%s` supplied to `React.Fragment`. " .. "React.Fragment can only have `key` and `children` props.", v78);
                if _G.__DEV__ then
                    l_setExtraStackFrame_0(nil);
                    break;
                else
                    break;
                end;
            end;
        end;
        if v75.ref ~= nil then
            if _G.__DEV__ then
                if v75 then
                    local l__owner_3 = v75._owner;
                    local v83 = nil;
                    if l__owner_3 then
                        v83 = l__owner_3.type;
                    end;
                    local v84 = l_describeUnknownElementTypeFrameInDEV_0(v75.type, v75._source, v83);
                    l_setExtraStackFrame_0(v84);
                else
                    l_setExtraStackFrame_0(nil);
                end;
            end;
            l_console_0.error("Invalid attribute `ref` supplied to `React.Fragment`.");
            if _G.__DEV__ then
                l_setExtraStackFrame_0(nil);
            end;
        end;
    end;
end;
local function v103(v86, v87, v88, v89, v90, v91) --[[ Line: 369 ]] --[[ Name: jsxWithValidation ]]
    -- upvalues: l_isValidElementType_0 (copy), l_Object_0 (copy), l_ReactCurrentOwner_0 (copy), l_getComponentName_0 (copy), l_Array_0 (copy), l_REACT_ELEMENT_TYPE_0 (copy), l_inspect_0 (copy), l_console_0 (copy), l_jsxDEV_0 (copy), v67 (copy), l_warnAboutSpreadingKeyToJSX_0 (copy), l_REACT_FRAGMENT_TYPE_0 (copy), v85 (copy), v74 (copy)
    local v92 = false;
    local v93 = l_isValidElementType_0(v86);
    if not v93 then
        local v94 = "";
        if v86 == nil or typeof(v86) == "table" and #l_Object_0.keys(v86) == 0 then
            v94 = v94 .. " You likely forgot to export your component from the file " .. "it's defined in, or you might have mixed up default and named imports.";
        end;
        local v95 = if v90 ~= nil then "\n\nCheck your code at " .. string.gsub(v90.fileName, "^.*[\\/]", "") .. ":" .. v90.lineNumber .. "." else "";
        if v95 then
            v94 = v94 .. v95;
        else
            local l_v94_0 = v94;
            local v97;
            if l_ReactCurrentOwner_0.current then
                local v98 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
                if v98 then
                    v97 = "\n\nCheck the render method of `" .. v98 .. "`.";
                    v92 = true;
                end;
            end;
            if not v92 then
                v97 = "";
            end;
            v92 = false;
            v94 = l_v94_0 .. v97;
        end;
        local v99 = nil;
        if v86 == nil then
            v99 = "nil";
        elseif l_Array_0.isArray(v86) then
            v99 = "array";
        elseif typeof(v86) == "table" and v86["$$typeof"] == l_REACT_ELEMENT_TYPE_0 then
            v99 = string.format("<%s />", l_getComponentName_0(v86.type) or "Unknown");
            v94 = v94 .. " Did you accidentally export a JSX literal or Element instead of a component?";
        else
            v99 = typeof(v86);
            v94 = v94 .. "\n" .. l_inspect_0(v86);
        end;
        if _G.__DEV__ then
            l_console_0.error("React.jsx: type is invalid -- expected a string (for " .. "built-in components) or a class/function (for composite " .. "components) but got: %s.%s", v99, v94);
        end;
    end;
    local v100 = l_jsxDEV_0(v86, v87, v88, v90, v91);
    if v100 == nil then
        return v100;
    else
        if v93 then
            local l_children_0 = v87.children;
            if l_children_0 ~= nil then
                if v89 then
                    if l_Array_0.isArray(l_children_0) then
                        for v102 = 1, #l_children_0 do
                            v67(l_children_0[v102], v86);
                        end;
                        l_Object_0.freeze(l_children_0);
                    elseif _G.__DEV__ then
                        l_console_0.error("React.jsx: Static children should always be an array. " .. "You are likely explicitly calling React.jsxs or React.jsxDEV. " .. "Use the Babel transform instead.");
                    end;
                else
                    v67(l_children_0, v86);
                end;
            end;
        end;
        if _G.__DEV__ and l_warnAboutSpreadingKeyToJSX_0 and v87.key ~= nil then
            l_console_0.error("React.jsx: Spreading a key to JSX is a deprecated pattern. " .. "Explicitly pass a key after spreading props in your JSX call. " .. "E.g. <%s {...props} key={key} />", l_getComponentName_0(v86) or "ComponentName");
        end;
        if v86 == l_REACT_FRAGMENT_TYPE_0 then
            v85(v100);
            return v100;
        else
            v74(v100);
            return v100;
        end;
    end;
end;
v26.jsxWithValidation = v103;
v26.jsxWithValidationStatic = function(v104, v105, v106) --[[ Line: 491 ]]
    -- upvalues: v103 (copy)
    return (v103(v104, v105, v106, true));
end;
v26.jsxWithValidationDynamic = function(v107, v108, v109) --[[ Line: 495 ]]
    -- upvalues: v103 (copy)
    return (v103(v107, v108, v109, false));
end;
v26.createElementWithValidation = function(v110, v111, ...) --[[ Line: 500 ]] --[[ Name: createElementWithValidation ]]
    -- upvalues: l_isValidElementType_0 (copy), l_Object_0 (copy), l_ReactCurrentOwner_0 (copy), l_getComponentName_0 (copy), l_Array_0 (copy), l_REACT_ELEMENT_TYPE_0 (copy), l_inspect_0 (copy), l_console_0 (copy), l_createElement_0 (copy), v67 (copy), l_REACT_FRAGMENT_TYPE_0 (copy), v85 (copy), v74 (copy)
    local v112 = false;
    local v113 = l_isValidElementType_0(v110);
    if not v113 then
        local v114 = "";
        if v110 == nil or typeof(v110) == "table" and #l_Object_0.keys(v110) == 0 then
            v114 = v114 .. " You likely forgot to export your component from the file " .. "it's defined in, or you might have mixed up default and named imports.";
        end;
        local v115;
        if v111 ~= nil then
            local l___source_1 = v111.__source;
            v115 = if l___source_1 ~= nil then "\n\nCheck your code at " .. string.gsub(l___source_1.fileName, "^.*[\\/]", "") .. ":" .. l___source_1.lineNumber .. "." else "";
        else
            v115 = "";
        end;
        if v115 then
            v114 = v114 .. v115;
        else
            local l_v114_0 = v114;
            local v118;
            if l_ReactCurrentOwner_0.current then
                local v119 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
                if v119 then
                    v118 = "\n\nCheck the render method of `" .. v119 .. "`.";
                    v112 = true;
                end;
            end;
            if not v112 then
                v118 = "";
            end;
            v112 = false;
            v114 = l_v114_0 .. v118;
        end;
        local v120 = nil;
        if v110 == nil then
            v120 = "nil";
        elseif l_Array_0.isArray(v110) then
            v120 = "array";
        elseif v110 ~= nil and typeof(v110) == "table" and v110["$$typeof"] == l_REACT_ELEMENT_TYPE_0 then
            v120 = string.format("<%s />", l_getComponentName_0(v110.type) or "Unknown");
            v114 = v114 .. " Did you accidentally export a JSX literal or Element instead of a component?";
        else
            v120 = typeof(v110);
            if v110 ~= nil then
                v114 = v114 .. "\n" .. l_inspect_0(v110);
            end;
        end;
        if _G.__DEV__ then
            l_console_0.error("React.createElement: type is invalid -- expected a string (for " .. "built-in components) or a class/function (for composite " .. "components) but got: %s.%s", v120, v114);
        end;
    end;
    local v121 = l_createElement_0(v110, v111, ...);
    if v121 == nil then
        return v121;
    else
        if v113 then
            for v122 = 1, select("#", ...) do
                v67(select(v122, ...), v110);
            end;
        end;
        if v110 == l_REACT_FRAGMENT_TYPE_0 then
            v85(v121);
            return v121;
        else
            v74(v121);
            return v121;
        end;
    end;
end;
v26.cloneElementWithValidation = function(v123, v124, ...) --[[ Line: 633 ]]
    -- upvalues: l_cloneElement_0 (copy), v67 (copy), v74 (copy)
    local v125 = {
        v123, 
        v124, 
        ...
    };
    local v126 = l_cloneElement_0(v123, v124, ...);
    for v127 = 3, #v125 do
        v67(v125[v127], v126.type);
    end;
    v74(v126);
    return v126;
end;
return v26;