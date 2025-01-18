local l_Parent_0 = script.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local function v4(v2) --[[ Line: 24 ]] --[[ Name: getPromiseErrorStack ]]
    -- upvalues: l_Boolean_0 (copy)
    local l_v2_0 = v2;
    while not l_Boolean_0.toJSBoolean(l_v2_0.trace) and l_v2_0.parent do
        l_v2_0 = l_v2_0.parent;
    end;
    return l_v2_0.trace or "";
end;
local function v8(v5) --[[ Line: 32 ]] --[[ Name: getPromiseErrorMessage ]]
    -- upvalues: l_Boolean_0 (copy)
    local l_v5_0 = v5;
    local l_error_0 = v5.error;
    while not l_Boolean_0.toJSBoolean(l_v5_0.trace) and l_v5_0.parent do
        l_v5_0 = l_v5_0.parent;
        l_error_0 = l_v5_0.error or l_error_0;
    end;
    return l_v5_0.message or l_error_0;
end;
return function(v9) --[[ Line: 42 ]]
    -- upvalues: v8 (copy), v4 (copy)
    v9.message = v8(v9);
    v9.stack = v4(v9);
    return v9;
end;