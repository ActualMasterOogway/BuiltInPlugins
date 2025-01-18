local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Object_0 = v1.Object;
local v6 = require(script.Parent["config-default-ignore"]);
local v7 = {};
local _ = require(script.Parent.types.config);
local l_prettyDOM_0 = require(script.Parent["pretty-dom"]).prettyDOM;
local v17 = {
    testIdAttribute = "data-testid", 
    asyncUtilTimeout = 1000, 
    asyncWrapper = function(v10) --[[ Line: 43 ]] --[[ Name: asyncWrapper ]]
        return v10();
    end, 
    unstable_advanceTimersWrapper = function(v11) --[[ Line: 46 ]] --[[ Name: unstable_advanceTimersWrapper ]]
        return v11();
    end, 
    eventWrapper = function(v12) --[[ Line: 49 ]] --[[ Name: eventWrapper ]]
        return v12();
    end, 
    defaultHidden = false, 
    defaultIgnore = v6.getIgnore(), 
    showOriginalStackTrace = false, 
    throwSuggestions = false, 
    getElementError = function(v13, v14) --[[ Line: 63 ]] --[[ Name: getElementError ]]
        -- upvalues: l_prettyDOM_0 (copy), l_Error_0 (copy), l_Array_0 (copy), l_Boolean_0 (copy)
        local v15 = l_prettyDOM_0(v14);
        local v16 = l_Error_0.new(l_Array_0.join(l_Array_0.filter({
            v13, 
            v15
        }, l_Boolean_0.toJSBoolean), "\n\n"));
        v16.name = "TestingLibraryElementError";
        return v16;
    end, 
    _disableExpensiveErrorDiagnostics = false, 
    computedStyleSupportsPseudoElements = false
};
v7.runWithExpensiveErrorDiagnosticsDisabled = function(v18) --[[ Line: 82 ]] --[[ Name: runWithExpensiveErrorDiagnosticsDisabled ]]
    -- upvalues: v17 (ref)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 83 ]]
        -- upvalues: v17 (ref), v18 (copy)
        v17._disableExpensiveErrorDiagnostics = true;
        return v18();
    end);
    v17._disableExpensiveErrorDiagnostics = false;
    if not l_status_0 then
        error(l_result_0);
    end;
    return l_result_0;
end;
v7.configure = function(v21) --[[ Line: 98 ]] --[[ Name: configure ]]
    -- upvalues: v17 (ref), v6 (copy), l_Object_0 (copy)
    if typeof(v21) == "function" then
        v21 = v21(v17);
    end;
    if v21.defaultIgnore then
        v6.setIgnore(v21.defaultIgnore);
    end;
    v17 = l_Object_0.assign({}, l_Object_0.assign(v17, {
        defaultIgnore = l_Object_0.None
    }), v21);
end;
v7.getConfig = function() --[[ Line: 114 ]] --[[ Name: getConfig ]]
    -- upvalues: v6 (copy), l_Object_0 (copy), v17 (ref)
    local v22 = v6.getIgnore();
    return l_Object_0.assign({}, v17, {
        defaultIgnore = v22
    });
end;
return v7;