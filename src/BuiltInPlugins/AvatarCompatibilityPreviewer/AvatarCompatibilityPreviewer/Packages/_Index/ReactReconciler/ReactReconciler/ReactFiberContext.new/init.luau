local l___DEV___0 = _G.__DEV__;
local l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 = _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v3.Object;
local l_Error_0 = v3.Error;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v8 = require(script.Parent["ReactFiberStack.new"]);
local l_isFiberMounted_0 = require(script.Parent.ReactFiberTreeReflection).isFiberMounted;
local l_disableLegacyContext_0 = require(l_Parent_0.Shared).ReactFeatureFlags.disableLegacyContext;
local v11 = require(script.Parent.ReactWorkTags);
local l_ClassComponent_0 = v11.ClassComponent;
local l_HostRoot_0 = v11.HostRoot;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_checkPropTypes_0 = require(l_Parent_0.Shared).checkPropTypes;
local l_createCursor_0 = v8.createCursor;
local l_push_0 = v8.push;
local l_pop_0 = v8.pop;
local v19 = nil;
if l___DEV___0 then
    v19 = {};
end;
local v20 = {};
if l___DEV___0 then
    l_Object_0.freeze(v20);
end;
local v21 = l_createCursor_0(v20);
local v22 = l_createCursor_0(false);
local l_v20_0 = v20;
local v24 = nil;
local function v28(_, v26, v27) --[[ Line: 68 ]] --[[ Name: getUnmaskedContext ]]
    -- upvalues: v24 (ref), l_v20_0 (ref), v21 (copy)
    if v27 and v24(v26) then
        return l_v20_0;
    else
        return v21.current;
    end;
end;
local function v33(v29, v30, v31) --[[ Line: 88 ]] --[[ Name: cacheContext ]]
    local l_stateNode_0 = v29.stateNode;
    l_stateNode_0.__reactInternalMemoizedUnmaskedChildContext = v30;
    l_stateNode_0.__reactInternalMemoizedMaskedChildContext = v31;
end;
local function v44(v34, v35) --[[ Line: 103 ]] --[[ Name: getMaskedContext ]]
    -- upvalues: v20 (copy), l___DEV___0 (copy), l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 (copy), l_getComponentName_0 (copy), l_checkPropTypes_0 (copy)
    local l_type_0 = v34.type;
    if type(l_type_0) == "function" then
        return v35;
    else
        local l_contextTypes_0 = l_type_0.contextTypes;
        if not l_contextTypes_0 then
            return v20;
        else
            local l_stateNode_1 = v34.stateNode;
            if l_stateNode_1 and l_stateNode_1.__reactInternalMemoizedUnmaskedChildContext == v35 then
                return l_stateNode_1.__reactInternalMemoizedMaskedChildContext;
            else
                local v39 = {};
                for v40, _ in l_contextTypes_0 do
                    v39[v40] = v35[v40];
                end;
                if l___DEV___0 or l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 then
                    local v42 = l_getComponentName_0(l_type_0) or "Unknown";
                    l_checkPropTypes_0(l_contextTypes_0, nil, v39, "context", v42);
                end;
                if l_stateNode_1 then
                    local l_stateNode_2 = v34.stateNode;
                    l_stateNode_2.__reactInternalMemoizedUnmaskedChildContext = v35;
                    l_stateNode_2.__reactInternalMemoizedMaskedChildContext = v39;
                end;
                return v39;
            end;
        end;
    end;
end;
local function v45() --[[ Line: 152 ]] --[[ Name: hasContextChanged ]]
    -- upvalues: l_disableLegacyContext_0 (copy), v22 (copy)
    if l_disableLegacyContext_0 then
        return false;
    else
        return v22.current;
    end;
end;
v24 = function(v46) --[[ Line: 161 ]] --[[ Name: isContextProvider ]]
    if type(v46) == "function" then
        return false;
    else
        return v46.childContextTypes ~= nil;
    end;
end;
local function v48(v47) --[[ Line: 176 ]] --[[ Name: popContext ]]
    -- upvalues: l_pop_0 (copy), v22 (copy), v21 (copy)
    l_pop_0(v22, v47);
    l_pop_0(v21, v47);
end;
local function v50(v49) --[[ Line: 186 ]] --[[ Name: popTopLevelContextObject ]]
    -- upvalues: l_pop_0 (copy), v22 (copy), v21 (copy)
    l_pop_0(v22, v49);
    l_pop_0(v21, v49);
end;
local function v54(v51, v52, v53) --[[ Line: 196 ]] --[[ Name: pushTopLevelContextObject ]]
    -- upvalues: v21 (copy), v20 (copy), l_Error_0 (copy), l_push_0 (copy), v22 (copy)
    if v21.current ~= v20 then
        error(l_Error_0.new("Unexpected context found on stack. " .. "This error is likely caused by a bug in React. Please file an issue."));
    end;
    l_push_0(v21, v52, v51);
    l_push_0(v22, v53, v51);
end;
local function v66(v55, v56, v57) --[[ Line: 219 ]] --[[ Name: processChildContext ]]
    -- upvalues: l___DEV___0 (copy), l_getComponentName_0 (copy), v19 (ref), l_console_0 (copy), l_Error_0 (copy), l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 (copy), l_checkPropTypes_0 (copy), l_Object_0 (copy)
    local l_stateNode_3 = v55.stateNode;
    local l_childContextTypes_0 = v56.childContextTypes;
    if l_stateNode_3.getChildContext == nil or type(l_stateNode_3.getChildContext) ~= "function" then
        if l___DEV___0 then
            local v60 = l_getComponentName_0(v56) or "Unknown";
            if not v19[v60] then
                v19[v60] = true;
                l_console_0.error("%s.childContextTypes is specified but there is no getChildContext() method " .. "on the instance. You can either define getChildContext() on %s or remove " .. "childContextTypes from it.", v60, v60);
            end;
        end;
        return v57;
    else
        local v61 = l_stateNode_3:getChildContext();
        for v62, _ in v61 do
            if l_childContextTypes_0[v62] == nil then
                local v64 = l_getComponentName_0(v56) or "Unknown";
                error(l_Error_0.new(string.format("%s.getChildContext(): key \"%s\" is not defined in childContextTypes.", v64, v62)));
            end;
        end;
        if l___DEV___0 or l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 then
            local v65 = l_getComponentName_0(v56) or "Unknown";
            l_checkPropTypes_0(l_childContextTypes_0, nil, v61, "child context", v65);
        end;
        return l_Object_0.assign({}, v57, v61);
    end;
end;
local function v70(v67) --[[ Line: 279 ]] --[[ Name: pushContextProvider ]]
    -- upvalues: v20 (copy), l_v20_0 (ref), v21 (copy), l_push_0 (copy), v22 (copy)
    local l_stateNode_4 = v67.stateNode;
    local v69 = l_stateNode_4 and l_stateNode_4.__reactInternalMemoizedMergedChildContext or v20;
    l_v20_0 = v21.current;
    l_push_0(v21, v69, v67);
    l_push_0(v22, v22.current, v67);
    return true;
end;
local function v76(v71, v72, v73) --[[ Line: 302 ]] --[[ Name: invalidateContextProvider ]]
    -- upvalues: l_Error_0 (copy), v66 (copy), l_v20_0 (ref), l_pop_0 (copy), v22 (copy), v21 (copy), l_push_0 (copy)
    local l_stateNode_5 = v71.stateNode;
    if not l_stateNode_5 then
        error(l_Error_0.new("Expected to have an instance by this point. " .. "This error is likely caused by a bug in React. Please file an issue."));
    end;
    if v73 then
        local v75 = v66(v71, v72, l_v20_0);
        l_stateNode_5.__reactInternalMemoizedMergedChildContext = v75;
        l_pop_0(v22, v71);
        l_pop_0(v21, v71);
        l_push_0(v21, v75, v71);
        l_push_0(v22, v73, v71);
        return;
    else
        l_pop_0(v22, v71);
        l_push_0(v22, v73, v71);
        return;
    end;
end;
return {
    emptyContextObject = v20, 
    getUnmaskedContext = v28, 
    cacheContext = v33, 
    getMaskedContext = v44, 
    hasContextChanged = v45, 
    popContext = v48, 
    popTopLevelContextObject = v50, 
    pushTopLevelContextObject = v54, 
    processChildContext = v66, 
    isContextProvider = v24, 
    pushContextProvider = v70, 
    invalidateContextProvider = v76, 
    findCurrentUnmaskedContext = function(v77) --[[ Line: 343 ]] --[[ Name: findCurrentUnmaskedContext ]]
        -- upvalues: l_ClassComponent_0 (copy), l_isFiberMounted_0 (copy), l_Error_0 (copy), l_HostRoot_0 (copy)
        if v77.tag ~= l_ClassComponent_0 or not l_isFiberMounted_0(v77) then
            error(l_Error_0.new("Expected subtree parent to be a mounted class component. " .. "This error is likely caused by a bug in React. Please file an issue."));
        end;
        local l_v77_0 = v77;
        while true do
            if l_v77_0.tag == l_HostRoot_0 then
                return l_v77_0.stateNode.context;
            elseif l_v77_0.tag == l_ClassComponent_0 and l_v77_0.type.childContextTypes ~= nil then
                return l_v77_0.stateNode.__reactInternalMemoizedMergedChildContext;
            else
                l_v77_0 = l_v77_0.return_;
                if l_v77_0 == nil then
                    error(l_Error_0.new("Found unexpected detached subtree parent. " .. "This error is likely caused by a bug in React. Please file an issue."));
                    return;
                end;
            end;
        end;
    end
};