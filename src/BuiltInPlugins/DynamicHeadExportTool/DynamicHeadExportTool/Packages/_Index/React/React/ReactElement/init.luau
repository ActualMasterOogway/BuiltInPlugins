local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactLazy);
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_REACT_ELEMENT_TYPE_0 = require(l_Parent_0.Shared).ReactSymbols.REACT_ELEMENT_TYPE;
local l_ReactCurrentOwner_0 = require(l_Parent_0.Shared).ReactSharedInternals.ReactCurrentOwner;
local v9 = {
    key = true, 
    ref = true, 
    __self = true, 
    __source = true
};
local v10 = nil;
local v11 = nil;
local v12 = nil;
if _G.__DEV__ then
    v12 = {};
end;
local v13 = {};
local function _(v14) --[[ Line: 49 ]] --[[ Name: hasValidRef ]]
    if _G.__DEV__ and v14 and v14.ref and typeof(v14.ref) == "table" and v14.ref.isReactWarning then
        return false;
    else
        return v14.ref ~= nil;
    end;
end;
local function _(v16) --[[ Line: 63 ]] --[[ Name: hasValidKey ]]
    if _G.__DEV__ and v16.key and typeof(v16.key) == "table" and v16.key.isReactWarning then
        return false;
    else
        return v16.key ~= nil;
    end;
end;
local v18 = {
    isReactWarning = true
};
local function v24(v19, v20) --[[ Line: 82 ]] --[[ Name: defineKeyPropWarningGetter ]]
    -- upvalues: v10 (ref), l_console_0 (copy), v18 (copy)
    local function _() --[[ Line: 83 ]]
        -- upvalues: v10 (ref), l_console_0 (ref), v20 (copy)
        if _G.__DEV__ and not v10 then
            v10 = true;
            l_console_0.error("%s: `key` is not a prop. Trying to access it will result " .. "in `nil` being returned. If you need to access the same " .. "value within the child component, you should pass it as a different " .. "prop. (https://reactjs.org/link/special-props)", v20);
        end;
    end;
    v19.key = nil;
    setmetatable(v19, {
        __index = function(_, v23) --[[ Line: 104 ]] --[[ Name: __index ]]
            -- upvalues: v10 (ref), l_console_0 (ref), v20 (copy), v18 (ref)
            if v23 == "key" then
                if _G.__DEV__ and not v10 then
                    v10 = true;
                    l_console_0.error("%s: `key` is not a prop. Trying to access it will result " .. "in `nil` being returned. If you need to access the same " .. "value within the child component, you should pass it as a different " .. "prop. (https://reactjs.org/link/special-props)", v20);
                end;
                return v18;
            else
                return nil;
            end;
        end
    });
end;
local function v30(v25, v26) --[[ Line: 116 ]] --[[ Name: defineRefPropWarningGetter ]]
    -- upvalues: v11 (ref), l_console_0 (copy), v18 (copy)
    local function _() --[[ Line: 119 ]]
        -- upvalues: v11 (ref), l_console_0 (ref), v26 (copy)
        if _G.__DEV__ and not v11 then
            v11 = true;
            l_console_0.error("%s: `ref` is not a prop. Trying to access it will result " .. "in `nil` being returned. If you need to access the same " .. "value within the child component, you should pass it as a different " .. "prop. (https://reactjs.org/link/special-props)", v26);
        end;
    end;
    v25.ref = nil;
    setmetatable(v25, {
        __index = function(_, v29) --[[ Line: 140 ]] --[[ Name: __index ]]
            -- upvalues: v11 (ref), l_console_0 (ref), v26 (copy), v18 (ref)
            if v29 == "ref" then
                if _G.__DEV__ and not v11 then
                    v11 = true;
                    l_console_0.error("%s: `ref` is not a prop. Trying to access it will result " .. "in `nil` being returned. If you need to access the same " .. "value within the child component, you should pass it as a different " .. "prop. (https://reactjs.org/link/special-props)", v26);
                end;
                return v18;
            else
                return nil;
            end;
        end
    });
end;
local function v33(v31) --[[ Line: 152 ]] --[[ Name: warnIfStringRefCannotBeAutoConverted ]]
    -- upvalues: l_ReactCurrentOwner_0 (copy), l_getComponentName_0 (copy), v12 (ref)
    if _G.__DEV__ and typeof(v31.ref) == "string" and l_ReactCurrentOwner_0.current then
        local v32 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
        if not v12[v32] then
            error(string.format("Component \"%s\" contains the string ref \"%s\". " .. "Support for string refs has been removed. " .. "We recommend using useRef() or createRef() instead. " .. "Learn more about using refs safely here: " .. "https://reactjs.org/link/strict-mode-string-ref", v32 or "Unknown", v31.ref));
        end;
    end;
end;
local function v46(v34, v35, v36, v37, v38, v39, v40) --[[ Line: 202 ]] --[[ Name: ReactElement ]]
    -- upvalues: l_REACT_ELEMENT_TYPE_0 (copy)
    local v41 = {
        type = v34, 
        key = v35, 
        ref = v36, 
        props = v40, 
        _owner = v39, 
        ["$$typeof"] = l_REACT_ELEMENT_TYPE_0
    };
    if _G.__DEV__ then
        local v42 = {
            validated = false
        };
        v41._store = setmetatable({}, {
            __index = v42, 
            __newindex = function(v43, v44, v45) --[[ Line: 231 ]] --[[ Name: __newindex ]]
                -- upvalues: v42 (copy)
                if v44 == "validated" then
                    v42.validated = v45;
                    return;
                else
                    rawset(v43, v44, v45);
                    return;
                end;
            end
        });
        setmetatable(v41, {
            __index = {
                _self = v37, 
                _source = v38
            }
        });
    end;
    return v41;
end;
v13.jsx = function(_, _, _) --[[ Line: 262 ]]
    error("JSX is currently unsupported");
end;
v13.jsxDEV = function(_, _, _, _, _) --[[ Line: 317 ]]
    error("JSX is currently unsupported");
    return nil;
end;
v13.createElement = function(v55, v56, ...) --[[ Line: 393 ]] --[[ Name: createElement ]]
    -- upvalues: v33 (copy), v9 (copy), l_Object_0 (copy), v24 (copy), v30 (copy), v46 (copy), l_ReactCurrentOwner_0 (copy)
    local v57 = {};
    local v58 = nil;
    local v59 = nil;
    local v60 = nil;
    if v56 ~= nil then
        if (not (_G.__DEV__ and v56 and v56.ref and typeof(v56.ref) == "table") or not v56.ref.isReactWarning) and v56.ref ~= nil then
            v59 = v56.ref;
            if _G.__DEV__ then
                v33(v56);
            end;
        end;
        if (not (_G.__DEV__ and v56.key and typeof(v56.key) == "table") or not v56.key.isReactWarning) and v56.key ~= nil then
            v58 = if typeof(v56.key) == "number" then v56.key else tostring(v56.key);
        end;
        v60 = if v56.__source == nil then nil else v56.__source;
        for v61, _ in v56 do
            if v56[v61] ~= nil and not v9[v61] then
                v57[v61] = v56[v61];
            end;
        end;
    end;
    local v63 = select("#", ...);
    if v63 == 1 then
        v57.children = select(1, ...);
    elseif v63 > 1 then
        local v64 = table.create(v63);
        for v65 = 1, v63 do
            table.insert(v64, (select(v65, ...)));
        end;
        if _G.__DEV__ and l_Object_0.freeze then
            l_Object_0.freeze(v64);
        end;
        v57.children = v64;
    end;
    if typeof(v55) == "table" and v55.defaultProps then
        local l_defaultProps_0 = v55.defaultProps;
        for v67, _ in l_defaultProps_0 do
            if v57[v67] == nil then
                v57[v67] = l_defaultProps_0[v67];
            end;
        end;
    end;
    if _G.__DEV__ then
        if v58 or v59 then
            local v69 = nil;
            v69 = if typeof(v55) == "function" then debug.info(v55, "n") or "<function>" else if typeof(v55) == "table" then v55.displayName or v55.name or "Unknown" else v55;
            if v58 then
                v24(v57, v69);
            end;
            if v59 then
                v30(v57, v69);
            end;
        end;
        if v60 == nil then
            v60 = {
                fileName = debug.info(3, "s"), 
                lineNumber = debug.info(3, "l")
            };
        end;
    end;
    return (v46(v55, v58, v59, nil, v60, l_ReactCurrentOwner_0.current, v57));
end;
v13.cloneAndReplaceKey = function(v70, v71) --[[ Line: 546 ]]
    -- upvalues: v46 (copy)
    return (v46(v70.type, v71, v70.ref, v70._self, v70._source, v70._owner, v70.props));
end;
v13.cloneElement = function(v72, v73, ...) --[[ Line: 556 ]]
    -- upvalues: l_invariant_0 (copy), l_Object_0 (copy), l_ReactCurrentOwner_0 (copy), v9 (copy), v46 (copy)
    l_invariant_0(not (v72 == nil), "React.cloneElement(...): The argument must be a React element, but you passed " .. tostring(v72));
    local v74 = l_Object_0.assign({}, v72.props);
    local l_key_0 = v72.key;
    local l_ref_0 = v72.ref;
    local l__source_0 = v72._source;
    local l__owner_0 = v72._owner;
    if v73 ~= nil then
        if (not (_G.__DEV__ and v73 and v73.ref and typeof(v73.ref) == "table") or not v73.ref.isReactWarning) and v73.ref ~= nil then
            l_ref_0 = v73.ref;
            l__owner_0 = l_ReactCurrentOwner_0.current;
        end;
        if (not (_G.__DEV__ and v73.key and typeof(v73.key) == "table") or not v73.key.isReactWarning) and v73.key ~= nil then
            l_key_0 = "" .. v73.key;
        end;
    end;
    local v79 = nil;
    if typeof(v72.type) == "table" and v72.type.defaultProps then
        v79 = v72.type.defaultProps;
    end;
    if v73 ~= nil then
        for v80, _ in v73 do
            if v73[v80] ~= nil and not v9[v80] then
                if v73[v80] == nil and v79 ~= nil then
                    v74[v80] = v79[v80];
                else
                    v74[v80] = v73[v80];
                end;
            end;
        end;
    end;
    local v82 = select("#", ...);
    if v82 == 1 then
        v74.children = select(1, ...);
    elseif v82 > 1 then
        v74.children = {
            ...
        };
    end;
    return (v46(v72.type, l_key_0, l_ref_0, nil, l__source_0, l__owner_0, v74));
end;
v13.isValidElement = function(v83) --[[ Line: 651 ]]
    -- upvalues: l_REACT_ELEMENT_TYPE_0 (copy)
    local v84 = false;
    if typeof(v83) == "table" then
        v84 = v83["$$typeof"] == l_REACT_ELEMENT_TYPE_0;
    end;
    return v84;
end;
return v13;