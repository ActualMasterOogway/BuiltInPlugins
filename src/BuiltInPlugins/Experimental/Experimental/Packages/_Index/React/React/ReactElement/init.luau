local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_REACT_ELEMENT_TYPE_0 = require(l_Parent_0.Shared).ReactSymbols.REACT_ELEMENT_TYPE;
local l_ReactCurrentOwner_0 = require(l_Parent_0.Shared).ReactSharedInternals.ReactCurrentOwner;
local v7 = {
    key = true, 
    ref = true, 
    __self = true, 
    __source = true
};
local v8 = nil;
local v9 = nil;
local v10 = nil;
if _G.__DEV__ then
    v10 = {};
end;
local v11 = {};
local function _(v12) --[[ Line: 35 ]] --[[ Name: hasValidRef ]]
    if _G.__DEV__ and v12 and v12.ref and typeof(v12.ref) == "table" then
        local l_get_0 = v12.ref.get;
        if l_get_0 and l_get_0.isReactWarning then
            return false;
        end;
    end;
    return v12.ref ~= nil;
end;
local function _(v15) --[[ Line: 49 ]] --[[ Name: hasValidKey ]]
    if _G.__DEV__ and v15.key and typeof(v15.key) == "table" then
        local l_get_1 = v15.key.get;
        if l_get_1 and l_get_1.isReactWarning then
            return false;
        end;
    end;
    return v15.key ~= nil;
end;
local v18 = {
    isReactWarning = true
};
local function v24(v19, v20) --[[ Line: 66 ]] --[[ Name: defineKeyPropWarningGetter ]]
    -- upvalues: v8 (ref), l_console_0 (copy), v18 (copy)
    local function _() --[[ Line: 67 ]]
        -- upvalues: v8 (ref), l_console_0 (ref), v20 (copy)
        if _G.__DEV__ and not v8 then
            v8 = true;
            l_console_0.error("%s: `key` is not a prop. Trying to access it will result " .. "in `nil` being returned. If you need to access the same " .. "value within the child component, you should pass it as a different " .. "prop. (https://reactjs.org/link/special-props)", v20);
        end;
    end;
    v19.key = nil;
    setmetatable(v19, {
        __index = function(_, v23) --[[ Line: 86 ]] --[[ Name: __index ]]
            -- upvalues: v8 (ref), l_console_0 (ref), v20 (copy), v18 (ref)
            if v23 == "key" then
                if _G.__DEV__ and not v8 then
                    v8 = true;
                    l_console_0.error("%s: `key` is not a prop. Trying to access it will result " .. "in `nil` being returned. If you need to access the same " .. "value within the child component, you should pass it as a different " .. "prop. (https://reactjs.org/link/special-props)", v20);
                end;
                return v18;
            else
                return nil;
            end;
        end
    });
end;
local function v30(v25, v26) --[[ Line: 97 ]] --[[ Name: defineRefPropWarningGetter ]]
    -- upvalues: v9 (ref), l_console_0 (copy), v18 (copy)
    local function _() --[[ Line: 100 ]]
        -- upvalues: v9 (ref), l_console_0 (ref), v26 (copy)
        if _G.__DEV__ and not v9 then
            v9 = true;
            l_console_0.error("%s: `ref` is not a prop. Trying to access it will result " .. "in `nil` being returned. If you need to access the same " .. "value within the child component, you should pass it as a different " .. "prop. (https://reactjs.org/link/special-props)", v26);
        end;
    end;
    v25.ref = nil;
    setmetatable(v25, {
        __index = function(_, v29) --[[ Line: 119 ]] --[[ Name: __index ]]
            -- upvalues: v9 (ref), l_console_0 (ref), v26 (copy), v18 (ref)
            if v29 == "ref" then
                if _G.__DEV__ and not v9 then
                    v9 = true;
                    l_console_0.error("%s: `ref` is not a prop. Trying to access it will result " .. "in `nil` being returned. If you need to access the same " .. "value within the child component, you should pass it as a different " .. "prop. (https://reactjs.org/link/special-props)", v26);
                end;
                return v18;
            else
                return nil;
            end;
        end
    });
end;
local function v33(v31) --[[ Line: 130 ]] --[[ Name: warnIfStringRefCannotBeAutoConverted ]]
    -- upvalues: l_ReactCurrentOwner_0 (copy), l_getComponentName_0 (copy), v10 (ref)
    if _G.__DEV__ and typeof(v31.ref) == "string" and l_ReactCurrentOwner_0.current then
        local v32 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
        if not v10[v32] then
            error(string.format("Component \"%s\" contains the string ref \"%s\". " .. "Support for string refs has been removed. " .. "We recommend using useRef() or createRef() instead. " .. "Learn more about using refs safely here: " .. "https://reactjs.org/link/strict-mode-string-ref", v32 or "Unknown", v31.ref));
        end;
    end;
end;
local function v42(v34, v35, v36, v37, v38, v39, v40) --[[ Line: 179 ]] --[[ Name: ReactElement ]]
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
        v41._store = setmetatable({}, {
            __index = {
                validated = false
            }
        });
        v41._self = v37;
        v41._source = v38;
    end;
    return v41;
end;
v11.jsx = function(_, _, _) --[[ Line: 226 ]]
    error("JSX is currently unsupported");
end;
v11.jsxDEV = function(_, _, _, _, _) --[[ Line: 278 ]]
    error("JSX is currently unsupported");
end;
v11.createElement = function(v51, v52, ...) --[[ Line: 347 ]] --[[ Name: createElement ]]
    -- upvalues: v33 (copy), v7 (copy), l_Object_0 (copy), v24 (copy), v30 (copy), v42 (copy), l_ReactCurrentOwner_0 (copy)
    local v53 = false;
    local v54 = false;
    local v55 = {};
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local v59 = nil;
    if v52 ~= nil then
        local v60;
        if _G.__DEV__ and v52 and v52.ref and typeof(v52.ref) == "table" then
            local l_get_2 = v52.ref.get;
            if l_get_2 and l_get_2.isReactWarning then
                v60 = false;
                v53 = true;
            end;
        end;
        if not v53 then
            v60 = v52.ref ~= nil;
        end;
        v53 = false;
        if v60 then
            v57 = v52.ref;
            if _G.__DEV__ then
                v33(v52);
            end;
        end;
        if _G.__DEV__ and v52.key and typeof(v52.key) == "table" then
            local l_get_3 = v52.key.get;
            if l_get_3 and l_get_3.isReactWarning then
                v60 = false;
                v54 = true;
            end;
        end;
        if not v54 then
            v60 = v52.key ~= nil;
        end;
        v54 = false;
        if v60 then
            v56 = if typeof(v52.key) == "number" then v52.key else tostring(v52.key);
        end;
        v58 = if v52.__self == nil then nil else v52.__self;
        v59 = if v52.__source == nil then nil else v52.__source;
        for v63, _ in pairs(v52) do
            if v52[v63] ~= nil and not v7[v63] then
                v55[v63] = v52[v63];
            end;
        end;
    end;
    local v65 = select("#", ...);
    if v65 == 1 then
        v55.children = select(1, ...);
    elseif v65 > 1 then
        local v66 = table.create(v65);
        for v67 = 1, v65 do
            table.insert(v66, (select(v67, ...)));
        end;
        if _G.__DEV__ and l_Object_0.freeze then
            l_Object_0.freeze(v66);
        end;
        v55.children = v66;
    end;
    if typeof(v51) == "table" and v51.defaultProps then
        local l_defaultProps_0 = v51.defaultProps;
        for v69, _ in pairs(l_defaultProps_0) do
            if v55[v69] == nil then
                v55[v69] = l_defaultProps_0[v69];
            end;
        end;
    end;
    if _G.__DEV__ and (v56 or v57) then
        local v71 = nil;
        v71 = if typeof(v51) == "function" then debug.info(v51, "n") or "<function>" else if typeof(v51) == "table" then v51.displayName or v51.name or "Unknown" else v51;
        if v56 then
            v24(v55, v71);
        end;
        if v57 then
            v30(v55, v71);
        end;
    end;
    return (v42(v51, v56, v57, v58, v59, l_ReactCurrentOwner_0.current, v55));
end;
v11.cloneElement = function(v72, v73, ...) --[[ Line: 483 ]]
    -- upvalues: l_invariant_0 (copy), l_Object_0 (copy), l_ReactCurrentOwner_0 (copy), v7 (copy), v42 (copy)
    local v74 = false;
    local v75 = false;
    l_invariant_0(not (v72 == nil), "React.cloneElement(...): The argument must be a React element, but you passed " .. tostring(v72));
    local v76 = l_Object_0.assign({}, v72.props);
    local l_key_0 = v72.key;
    local l_ref_0 = v72.ref;
    local l__self_0 = v72._self;
    local l__source_0 = v72._source;
    local l__owner_0 = v72._owner;
    if v73 ~= nil then
        local v82;
        if _G.__DEV__ and v73 and v73.ref and typeof(v73.ref) == "table" then
            local l_get_4 = v73.ref.get;
            if l_get_4 and l_get_4.isReactWarning then
                v82 = false;
                v74 = true;
            end;
        end;
        if not v74 then
            v82 = v73.ref ~= nil;
        end;
        v74 = false;
        if v82 then
            l_ref_0 = v73.ref;
            l__owner_0 = l_ReactCurrentOwner_0.current;
        end;
        if _G.__DEV__ and v73.key and typeof(v73.key) == "table" then
            local l_get_5 = v73.key.get;
            if l_get_5 and l_get_5.isReactWarning then
                v82 = false;
                v75 = true;
            end;
        end;
        if not v75 then
            v82 = v73.key ~= nil;
        end;
        v75 = false;
        if v82 then
            l_key_0 = "" .. v73.key;
        end;
    end;
    local v85 = nil;
    if typeof(v72.type) == "table" and v72.type.defaultProps then
        v85 = v72.type.defaultProps;
    end;
    if v73 ~= nil then
        for v86, _ in pairs(v73) do
            if v73[v86] and not v7[v86] then
                if v73[v86] == nil and v85 ~= nil then
                    v76[v86] = v85[v86];
                else
                    v76[v86] = v73[v86];
                end;
            end;
        end;
    end;
    local v88 = select("#", ...);
    if v88 == 1 then
        v76.children = select(1, ...);
    elseif v88 > 1 then
        v76.children = {
            ...
        };
    end;
    return (v42(v72.type, l_key_0, l_ref_0, l__self_0, l__source_0, l__owner_0, v76));
end;
v11.isValidElement = function(v89) --[[ Line: 566 ]]
    -- upvalues: l_REACT_ELEMENT_TYPE_0 (copy)
    local v90 = false;
    if typeof(v89) == "table" then
        v90 = v89["$$typeof"] == l_REACT_ELEMENT_TYPE_0;
    end;
    return v90;
end;
return v11;