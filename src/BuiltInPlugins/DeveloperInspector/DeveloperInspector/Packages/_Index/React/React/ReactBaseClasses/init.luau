local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local v4 = require(script.Parent.ReactNoopUpdateQueue);
local v5 = {};
if _G.__DEV__ then
    l_Object_0.freeze(v5);
end;
local l_UninitializedState_0 = require(l_Parent_0.Shared).UninitializedState;
local v7 = {
    isReactComponent = true
};
local function _(v8) --[[ Line: 41 ]] --[[ Name: trimPath ]]
    local v9 = string.match(v8, "%.%u[%.%w]-$");
    if v9 then
        return string.gsub(v9, "^%.", "");
    else
        return v8;
    end;
end;
local function _(v11, v12, v13) --[[ Line: 55 ]] --[[ Name: warnAboutExistingLifecycle ]]
    -- upvalues: l_console_0 (copy)
    l_console_0.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", v11, v13, v12, v11);
end;
local function _(v15, v16, v17) --[[ Line: 61 ]] --[[ Name: warnAboutDeprecatedLifecycleName ]]
    -- upvalues: l_console_0 (copy)
    if _G.__DEV__ and _G.__COMPAT_WARNINGS__ then
        local v18, v19 = debug.info(3, "sln");
        local l_warn_0 = l_console_0.warn;
        local v21 = "%s is using method '%s', which is no longer supported and should be updated to '%s'\nFile: %s:%s";
        local l_v15_0 = v15;
        local l_v16_0 = v16;
        local l_v17_0 = v17;
        local v25 = string.match(v18, "%.%u[%.%w]-$");
        l_warn_0(v21, l_v15_0, l_v16_0, l_v17_0, if v25 then string.gsub(v25, "^%.", "") else v18, (tostring(v19)));
    end;
end;
local v27 = {
    didMount = "componentDidMount", 
    shouldUpdate = "shouldComponentUpdate", 
    willUpdate = "UNSAFE_componentWillUpdate", 
    didUpdate = "componentDidUpdate", 
    willUnmount = "componentWillUnmount"
};
local function v46(v28, v29, v30) --[[ Line: 78 ]] --[[ Name: handleNewLifecycle ]]
    -- upvalues: v27 (copy), l_console_0 (copy)
    if v27[v29] ~= nil then
        if v28[v27[v29]] ~= nil then
            local l___componentName_0 = v28.__componentName;
            local l_v29_0 = v29;
            local v33 = v27[v29];
            l_console_0.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", l___componentName_0, v33, l_v29_0, l___componentName_0);
        elseif v29 == "willUpdate" and v28.componentWillUpdate then
            local l___componentName_1 = v28.__componentName;
            l_console_0.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", l___componentName_1, "UNSAFE_componentWillUpdate", v29, l___componentName_1);
        else
            local l___componentName_2 = v28.__componentName;
            local l_v29_1 = v29;
            local v37 = v27[v29];
            if _G.__DEV__ and _G.__COMPAT_WARNINGS__ then
                local v38, v39 = debug.info(3, "sln");
                local l_warn_1 = l_console_0.warn;
                local v41 = "%s is using method '%s', which is no longer supported and should be updated to '%s'\nFile: %s:%s";
                local l_l___componentName_2_0 = l___componentName_2;
                local l_l_v29_1_0 = l_v29_1;
                local l_v37_0 = v37;
                local v45 = string.match(v38, "%.%u[%.%w]-$");
                l_warn_1(v41, l_l___componentName_2_0, l_l_v29_1_0, l_v37_0, if v45 then string.gsub(v45, "^%.", "") else v38, (tostring(v39)));
            end;
        end;
        v29 = v27[v29];
    end;
    rawset(v28, v29, v30);
end;
local v48 = {
    __newindex = v46, 
    __index = v7, 
    __tostring = function(v47) --[[ Line: 100 ]] --[[ Name: __tostring ]]
        return v47.__componentName;
    end
};
local v49 = {};
setmetatable(v49, v48);
v49.__componentName = "Component";
local v50 = not _G.__TESTEZ_RUNNING_TEST__ and 900 or 0;
local v51 = 1;
local v52 = table.create(v50);
for _ = 1, v50 do
    table.insert(v52, {
        props = nil, 
        context = nil, 
        state = l_UninitializedState_0, 
        __refs = v5, 
        __updater = v4
    });
end;
v49.extend = function(v54, v55) --[[ Line: 132 ]] --[[ Name: extend ]]
    -- upvalues: l_console_0 (copy), v51 (ref), v50 (copy), v52 (copy), l_UninitializedState_0 (copy), v5 (copy), v4 (copy)
    if v55 == nil then
        if _G.__COMPAT_WARNINGS__ then
            l_console_0.warn("Component:extend() accepting no arguments is deprecated, and will " .. "not be supported in a future version of Roact. Please provide an explicit name.");
        end;
        v55 = "";
    end;
    assert(typeof(v55) == "string", "Component class name must be a string");
    local v56 = {
        __componentName = v55, 
        setState = v54.setState, 
        forceUpdate = v54.forceUpdate, 
        init = nil
    };
    v56.__index = v56;
    v56.__ctor = function(v57, v58, v59) --[[ Line: 165 ]] --[[ Name: __ctor ]]
        -- upvalues: v51 (ref), v50 (ref), v52 (ref), l_UninitializedState_0 (ref), v5 (ref), v4 (ref), v56 (copy)
        local v60 = nil;
        if v51 <= v50 then
            v60 = v52[v51];
            v60.props = v57;
            v60.context = v58;
            v52[v51] = nil;
            v51 = v51 + 1;
        else
            v60 = {
                props = v57, 
                context = v58, 
                state = l_UninitializedState_0, 
                __refs = v5, 
                __updater = v59 or v4
            };
        end;
        v60 = setmetatable(v60, v56);
        if v56.init and typeof(v56.init) == "function" then
            v60.setState = function(_, v62) --[[ Line: 214 ]] --[[ Name: setState ]]
                -- upvalues: v60 (ref)
                v60.state = v62;
            end;
            v56.init(v60, v57, v58);
            v60.setState = nil;
        end;
        return v60;
    end;
    setmetatable(v56, (getmetatable(v54)));
    return v56;
end;
v49.setState = function(v63, v64, v65) --[[ Line: 257 ]] --[[ Name: setState ]]
    -- upvalues: l_invariant_0 (copy)
    local l_l_invariant_0_0 = l_invariant_0;
    local v67 = true;
    if typeof(v64) ~= "table" then
        v67 = true;
        if typeof(v64) ~= "function" then
            v67 = v64 == nil;
        end;
    end;
    l_l_invariant_0_0(v67, "setState(...): takes an object of state variables to update or a " .. "function which returns an object of state variables.");
    v63.__updater.enqueueSetState(v63, v64, v65, "setState");
end;
v49.forceUpdate = function(v68, v69) --[[ Line: 281 ]] --[[ Name: forceUpdate ]]
    v68.__updater.enqueueForceUpdate(v68, v69, "forceUpdate");
end;
if _G.__DEV__ then
    local v70 = {
        isMounted = {
            "isMounted", 
            "Instead, make sure to clean up subscriptions and pending requests in " .. "componentWillUnmount to prevent memory leaks."
        }, 
        replaceState = {
            "replaceState", 
            "Refactor your code to use setState instead (see " .. "https://github.com/facebook/react/issues/3236)."
        }
    };
    local function _(v71, v72) --[[ Line: 297 ]]
        -- upvalues: v49 (copy), l_console_0 (copy)
        v49[v71] = function() --[[ Line: 299 ]]
            -- upvalues: l_console_0 (ref), v72 (copy)
            l_console_0.warn("%s(...) is deprecated in plain JavaScript React classes. %s", v72[1], v72[2]);
            return nil;
        end;
    end;
    for v74, _ in pairs(v70) do
        if v70[v74] ~= nil then
            local v76 = v70[v74];
            v49[v74] = function() --[[ Line: 299 ]]
                -- upvalues: l_console_0 (copy), v76 (copy)
                l_console_0.warn("%s(...) is deprecated in plain JavaScript React classes. %s", v76[1], v76[2]);
                return nil;
            end;
        end;
    end;
end;
local v77 = v49:extend("PureComponent");
v77.extend = v49.extend;
local v78 = {
    isReactComponent = true, 
    isPureReactComponent = true
};
setmetatable(v77, {
    __newindex = v46, 
    __index = v78, 
    __tostring = function(v79) --[[ Line: 339 ]] --[[ Name: __tostring ]]
        return v79.__componentName;
    end
});
return {
    Component = v49, 
    PureComponent = v77
};