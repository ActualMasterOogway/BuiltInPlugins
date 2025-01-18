local l_Parent_0 = script.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_isValidElementType_0 = require(l_Parent_0.Shared).isValidElementType;
local v8 = {
    typeOf = function(v4) --[[ Line: 20 ]]
        -- upvalues: l_ReactSymbols_0 (copy)
        if typeof(v4) == "table" and v4 ~= nil then
            local v5 = v4["$$typeof"];
            if v5 == l_ReactSymbols_0.REACT_ELEMENT_TYPE then
                local l_type_0 = v4.type;
                if l_type_0 == l_ReactSymbols_0.REACT_FRAGMENT_TYPE or l_type_0 == l_ReactSymbols_0.REACT_PROFILER_TYPE or l_type_0 == l_ReactSymbols_0.REACT_STRICT_MODE_TYPE or l_type_0 == l_ReactSymbols_0.REACT_SUSPENSE_TYPE or l_type_0 == l_ReactSymbols_0.REACT_SUSPENSE_LIST_TYPE then
                    return l_type_0;
                else
                    local v7 = l_type_0 and typeof(l_type_0) == "table" and l_type_0["$$typeof"];
                    if v7 == l_ReactSymbols_0.REACT_CONTEXT_TYPE or v7 == l_ReactSymbols_0.REACT_FORWARD_REF_TYPE or v7 == l_ReactSymbols_0.REACT_LAZY_TYPE or v7 == l_ReactSymbols_0.REACT_MEMO_TYPE or v7 == l_ReactSymbols_0.REACT_PROVIDER_TYPE then
                        return v7;
                    else
                        return v5;
                    end;
                end;
            elseif v5 == l_ReactSymbols_0.REACT_PORTAL_TYPE or v5 == l_ReactSymbols_0.REACT_BINDING_TYPE then
                return v5;
            end;
        end;
        return nil;
    end, 
    ContextConsumer = l_ReactSymbols_0.REACT_CONTEXT_TYPE, 
    ContextProvider = l_ReactSymbols_0.REACT_PROVIDER_TYPE, 
    Element = l_ReactSymbols_0.REACT_ELEMENT_TYPE, 
    ForwardRef = l_ReactSymbols_0.REACT_FORWARD_REF_TYPE, 
    Fragment = l_ReactSymbols_0.REACT_FRAGMENT_TYPE, 
    Lazy = l_ReactSymbols_0.REACT_LAZY_TYPE, 
    Memo = l_ReactSymbols_0.REACT_MEMO_TYPE, 
    Portal = l_ReactSymbols_0.REACT_PORTAL_TYPE, 
    Profiler = l_ReactSymbols_0.REACT_PROFILER_TYPE, 
    StrictMode = l_ReactSymbols_0.REACT_STRICT_MODE_TYPE, 
    Suspense = l_ReactSymbols_0.REACT_SUSPENSE_TYPE, 
    Binding = l_ReactSymbols_0.REACT_BINDING_TYPE, 
    isValidElementType = l_isValidElementType_0
};
local v9 = false;
local v10 = false;
v8.isAsyncMode = function(_) --[[ Line: 81 ]]
    -- upvalues: v9 (ref), l_console_0 (copy)
    if _G.__DEV__ and not v9 then
        v9 = true;
        l_console_0.warn("The ReactIs.isAsyncMode() alias has been deprecated, " .. "and will be removed in React 18+.");
    end;
    return false;
end;
v8.isConcurrentMode = function(_) --[[ Line: 97 ]]
    -- upvalues: v10 (ref), l_console_0 (copy)
    if _G.__DEV__ and not v10 then
        v10 = true;
        l_console_0.warn("The ReactIs.isConcurrentMode() alias has been deprecated, " .. "and will be removed in React 18+.");
    end;
    return false;
end;
v8.isContextConsumer = function(v13) --[[ Line: 113 ]]
    -- upvalues: v8 (copy), l_ReactSymbols_0 (copy)
    return v8.typeOf(v13) == l_ReactSymbols_0.REACT_CONTEXT_TYPE;
end;
v8.isContextProvider = function(v14) --[[ Line: 116 ]]
    -- upvalues: v8 (copy), l_ReactSymbols_0 (copy)
    return v8.typeOf(v14) == l_ReactSymbols_0.REACT_PROVIDER_TYPE;
end;
v8.isElement = function(v15) --[[ Line: 119 ]]
    -- upvalues: l_ReactSymbols_0 (copy)
    local v16 = false;
    if typeof(v15) == "table" then
        v16 = false;
        if v15 ~= nil then
            v16 = v15["$$typeof"] == l_ReactSymbols_0.REACT_ELEMENT_TYPE;
        end;
    end;
    return v16;
end;
v8.isForwardRef = function(v17) --[[ Line: 125 ]]
    -- upvalues: v8 (copy), l_ReactSymbols_0 (copy)
    return v8.typeOf(v17) == l_ReactSymbols_0.REACT_FORWARD_REF_TYPE;
end;
v8.isFragment = function(v18) --[[ Line: 128 ]]
    -- upvalues: v8 (copy), l_ReactSymbols_0 (copy)
    return v8.typeOf(v18) == l_ReactSymbols_0.REACT_FRAGMENT_TYPE;
end;
v8.isLazy = function(v19) --[[ Line: 131 ]]
    -- upvalues: v8 (copy), l_ReactSymbols_0 (copy)
    return v8.typeOf(v19) == l_ReactSymbols_0.REACT_LAZY_TYPE;
end;
v8.isMemo = function(v20) --[[ Line: 134 ]]
    -- upvalues: v8 (copy), l_ReactSymbols_0 (copy)
    return v8.typeOf(v20) == l_ReactSymbols_0.REACT_MEMO_TYPE;
end;
v8.isPortal = function(v21) --[[ Line: 137 ]]
    -- upvalues: v8 (copy), l_ReactSymbols_0 (copy)
    return v8.typeOf(v21) == l_ReactSymbols_0.REACT_PORTAL_TYPE;
end;
v8.isProfiler = function(v22) --[[ Line: 140 ]]
    -- upvalues: v8 (copy), l_ReactSymbols_0 (copy)
    return v8.typeOf(v22) == l_ReactSymbols_0.REACT_PROFILER_TYPE;
end;
v8.isStrictMode = function(v23) --[[ Line: 143 ]]
    -- upvalues: v8 (copy), l_ReactSymbols_0 (copy)
    return v8.typeOf(v23) == l_ReactSymbols_0.REACT_STRICT_MODE_TYPE;
end;
v8.isSuspense = function(v24) --[[ Line: 146 ]]
    -- upvalues: v8 (copy), l_ReactSymbols_0 (copy)
    return v8.typeOf(v24) == l_ReactSymbols_0.REACT_SUSPENSE_TYPE;
end;
v8.isBinding = function(v25) --[[ Line: 150 ]]
    -- upvalues: v8 (copy), l_ReactSymbols_0 (copy)
    return v8.typeOf(v25) == l_ReactSymbols_0.REACT_BINDING_TYPE;
end;
return v8;