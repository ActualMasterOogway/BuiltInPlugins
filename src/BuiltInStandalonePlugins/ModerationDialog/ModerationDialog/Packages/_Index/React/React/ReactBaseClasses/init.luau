local l___DEV___0 = _G.__DEV__;
local l___COMPAT_WARNINGS___0 = _G.__COMPAT_WARNINGS__;
local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.Shared);
local v6 = require(script.Parent.ReactNoopUpdateQueue);
local v7 = {};
if l___DEV___0 then
    l_Object_0.freeze(v7);
end;
local l_UninitializedState_0 = require(l_Parent_0.Shared).UninitializedState;
local v9 = {
    isReactComponent = true
};
local function _(v10) --[[ Line: 49 ]] --[[ Name: trimPath ]]
    local v11 = string.match(v10, "%.%u[%.%w]-$");
    if v11 then
        return string.gsub(v11, "^%.", "");
    else
        return v10;
    end;
end;
local function _(v13, v14, v15) --[[ Line: 63 ]] --[[ Name: warnAboutExistingLifecycle ]]
    -- upvalues: l_console_0 (copy)
    l_console_0.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", v13, v15, v14, v13);
end;
local function _(v17, v18, v19) --[[ Line: 73 ]] --[[ Name: warnAboutDeprecatedLifecycleName ]]
    -- upvalues: l___DEV___0 (copy), l___COMPAT_WARNINGS___0 (copy), l_console_0 (copy)
    if l___DEV___0 and l___COMPAT_WARNINGS___0 then
        local v20, v21 = debug.info(3, "sln");
        local l_warn_0 = l_console_0.warn;
        local v23 = "%s is using method '%s', which is no longer supported and should be updated to '%s'\nFile: %s:%s";
        local l_v17_0 = v17;
        local l_v18_0 = v18;
        local l_v19_0 = v19;
        local v27 = string.match(v20, "%.%u[%.%w]-$");
        l_warn_0(v23, l_v17_0, l_v18_0, l_v19_0, if v27 then string.gsub(v27, "^%.", "") else v20, (tostring(v21)));
    end;
end;
local v29 = {
    didMount = "componentDidMount", 
    shouldUpdate = "shouldComponentUpdate", 
    willUpdate = "UNSAFE_componentWillUpdate", 
    didUpdate = "componentDidUpdate", 
    willUnmount = "componentWillUnmount"
};
local function v48(v30, v31, v32) --[[ Line: 95 ]] --[[ Name: handleNewLifecycle ]]
    -- upvalues: v29 (copy), l_console_0 (copy), l___DEV___0 (copy), l___COMPAT_WARNINGS___0 (copy)
    if v29[v31] ~= nil then
        if v30[v29[v31]] ~= nil then
            local l___componentName_0 = v30.__componentName;
            local l_v31_0 = v31;
            local v35 = v29[v31];
            l_console_0.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", l___componentName_0, v35, l_v31_0, l___componentName_0);
        elseif v31 == "willUpdate" and v30.componentWillUpdate then
            local l___componentName_1 = v30.__componentName;
            l_console_0.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", l___componentName_1, "UNSAFE_componentWillUpdate", v31, l___componentName_1);
        else
            local l___componentName_2 = v30.__componentName;
            local l_v31_1 = v31;
            local v39 = v29[v31];
            if l___DEV___0 and l___COMPAT_WARNINGS___0 then
                local v40, v41 = debug.info(3, "sln");
                local l_warn_1 = l_console_0.warn;
                local v43 = "%s is using method '%s', which is no longer supported and should be updated to '%s'\nFile: %s:%s";
                local l_l___componentName_2_0 = l___componentName_2;
                local l_l_v31_1_0 = l_v31_1;
                local l_v39_0 = v39;
                local v47 = string.match(v40, "%.%u[%.%w]-$");
                l_warn_1(v43, l_l___componentName_2_0, l_l_v31_1_0, l_v39_0, if v47 then string.gsub(v47, "^%.", "") else v40, (tostring(v41)));
            end;
        end;
        v31 = v29[v31];
    end;
    rawset(v30, v31, v32);
end;
local v50 = {
    __newindex = v48, 
    __index = v9, 
    __tostring = function(v49) --[[ Line: 125 ]] --[[ Name: __tostring ]]
        return v49.__componentName;
    end
};
local v51 = setmetatable({
    __componentName = "Component"
}, v50);
local v52 = not _G.__TESTEZ_RUNNING_TEST__ and 900 or 0;
local v53 = 1;
local v54 = table.create(v52);
for _ = 1, v52 do
    table.insert(v54, {
        props = nil, 
        context = nil, 
        state = l_UninitializedState_0, 
        __refs = v7, 
        __updater = v6
    });
end;
local function v62(v56, v57, v58) --[[ Line: 161 ]] --[[ Name: setStateInInit ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), l_Object_0 (copy)
    if l___DEV___0 and v58 ~= nil then
        l_console_0.warn("Received a `callback` argument to `setState` during initialization of " .. "\"%s\". The callback behavior is not supported when using `setState` " .. "in `init`.\n\nConsider defining similar behavior in a " .. "`compontentDidMount` method instead.", v56.__componentName);
    end;
    local v59 = v57 and type(v57);
    if v57 == nil or v59 ~= "table" and v59 ~= "function" then
        error("setState(...): takes an object of state variables to update or a " .. "function which returns an object of state variables.");
    end;
    local l_state_0 = v56.state;
    local v61 = nil;
    v61 = if v59 == "function" then v57(l_state_0, v56.props) else v57;
    v56.state = l_Object_0.assign({}, l_state_0, v61);
end;
v51.extend = function(v63, v64) --[[ Line: 201 ]] --[[ Name: extend ]]
    -- upvalues: l___COMPAT_WARNINGS___0 (copy), l_console_0 (copy), v53 (ref), v52 (copy), v54 (copy), l_UninitializedState_0 (copy), v7 (copy), v6 (copy), v62 (copy)
    if v64 == nil then
        if l___COMPAT_WARNINGS___0 then
            l_console_0.warn("Component:extend() accepting no arguments is deprecated, and will " .. "not be supported in a future version of Roact. Please provide an explicit name.");
        end;
        v64 = "";
    elseif type(v64) ~= "string" then
        error("Component class name must be a string");
    end;
    local v65 = {
        __componentName = v64, 
        setState = v63.setState, 
        forceUpdate = v63.forceUpdate, 
        init = nil
    };
    v65.__index = v65;
    v65.__ctor = function(v66, v67, v68) --[[ Line: 235 ]] --[[ Name: __ctor ]]
        -- upvalues: v53 (ref), v52 (ref), v54 (ref), l_UninitializedState_0 (ref), v7 (ref), v6 (ref), v65 (copy), v62 (ref)
        local v69 = nil;
        if v53 <= v52 then
            v69 = v54[v53];
            v69.props = v66;
            v69.context = v67;
            v54[v53] = nil;
            v53 = v53 + 1;
        else
            v69 = {
                props = v66, 
                context = v67, 
                state = l_UninitializedState_0, 
                __refs = v7, 
                __updater = v68 or v6
            };
        end;
        v69 = setmetatable(v69, v65);
        if v65.init and type(v65.init) == "function" then
            v69.setState = v62;
            v65.init(v69, v66, v67);
            v69.setState = nil;
        end;
        return v69;
    end;
    setmetatable(v65, (getmetatable(v63)));
    return v65;
end;
v51.setState = function(v70, v71, v72) --[[ Line: 327 ]] --[[ Name: setState ]]
    if v71 ~= nil and type(v71) ~= "table" and type(v71) ~= "function" then
        error("setState(...): takes an object of state variables to update or a " .. "function which returns an object of state variables.");
    end;
    v70.__updater.enqueueSetState(v70, v71, v72, "setState");
end;
v51.forceUpdate = function(v73, v74) --[[ Line: 356 ]] --[[ Name: forceUpdate ]]
    v73.__updater.enqueueForceUpdate(v73, v74, "forceUpdate");
end;
if l___DEV___0 then
    local v75 = {
        isMounted = {
            "isMounted", 
            "Instead, make sure to clean up subscriptions and pending requests in " .. "componentWillUnmount to prevent memory leaks."
        }, 
        replaceState = {
            "replaceState", 
            "Refactor your code to use setState instead (see " .. "https://github.com/facebook/react/issues/3236)."
        }
    };
    local function _(v76, v77) --[[ Line: 380 ]]
        -- upvalues: v51 (copy), l_console_0 (copy)
        v51[v76] = function() --[[ Line: 381 ]]
            -- upvalues: l_console_0 (ref), v77 (copy)
            l_console_0.warn("%s(...) is deprecated in plain JavaScript React classes. %s", v77[1], v77[2]);
            return nil;
        end;
    end;
    for v79, _ in v75 do
        if v75[v79] ~= nil then
            local v81 = v75[v79];
            v51[v79] = function() --[[ Line: 381 ]]
                -- upvalues: l_console_0 (copy), v81 (copy)
                l_console_0.warn("%s(...) is deprecated in plain JavaScript React classes. %s", v81[1], v81[2]);
                return nil;
            end;
        end;
    end;
end;
local v82 = v51:extend("PureComponent");
v82.extend = v51.extend;
local v83 = {
    isReactComponent = true, 
    isPureReactComponent = true
};
setmetatable(v82, {
    __newindex = v48, 
    __index = v83, 
    __tostring = function(v84) --[[ Line: 428 ]] --[[ Name: __tostring ]]
        return v84.__componentName;
    end
});
return {
    Component = v51, 
    PureComponent = v82
};