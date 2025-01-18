local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v1.Object;
local l_Error_0 = v1.Error;
local v4 = require(l_Parent_0.Cryo);
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v7 = require(script.Parent["ReactFiberStack.new"]);
local l_isFiberMounted_0 = require(script.Parent.ReactFiberTreeReflection).isFiberMounted;
local l_disableLegacyContext_0 = require(l_Parent_0.Shared).ReactFeatureFlags.disableLegacyContext;
local v10 = require(script.Parent.ReactWorkTags);
local l_ClassComponent_0 = v10.ClassComponent;
local l_HostRoot_0 = v10.HostRoot;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_checkPropTypes_0 = require(l_Parent_0.Shared).checkPropTypes;
local l_createCursor_0 = v7.createCursor;
local l_push_0 = v7.push;
local l_pop_0 = v7.pop;
local v18 = nil;
if _G.__DEV__ then
    v18 = {};
end;
local v19 = {};
if _G.__DEV__ then
    l_Object_0.freeze(v19);
end;
local v20 = l_createCursor_0(v19);
local v21 = l_createCursor_0(false);
local l_v19_0 = v19;
local v23 = nil;
local function v27(_, v25, v26) --[[ Line: 68 ]] --[[ Name: getUnmaskedContext ]]
    -- upvalues: v23 (ref), l_v19_0 (ref), v20 (copy)
    if v26 and v23(v25) then
        return l_v19_0;
    else
        return v20.current;
    end;
end;
local function v32(v28, v29, v30) --[[ Line: 88 ]] --[[ Name: cacheContext ]]
    local l_stateNode_0 = v28.stateNode;
    l_stateNode_0.__reactInternalMemoizedUnmaskedChildContext = v29;
    l_stateNode_0.__reactInternalMemoizedMaskedChildContext = v30;
end;
local function v43(v33, v34) --[[ Line: 103 ]] --[[ Name: getMaskedContext ]]
    -- upvalues: v19 (copy), l_getComponentName_0 (copy), l_checkPropTypes_0 (copy)
    local l_type_0 = v33.type;
    if typeof(l_type_0) == "function" then
        return v34;
    else
        local l_contextTypes_0 = l_type_0.contextTypes;
        if not l_contextTypes_0 then
            return v19;
        else
            local l_stateNode_1 = v33.stateNode;
            if l_stateNode_1 and l_stateNode_1.__reactInternalMemoizedUnmaskedChildContext == v34 then
                return l_stateNode_1.__reactInternalMemoizedMaskedChildContext;
            else
                local v38 = {};
                for v39, _ in l_contextTypes_0 do
                    v38[v39] = v34[v39];
                end;
                if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
                    local v41 = l_getComponentName_0(l_type_0) or "Unknown";
                    l_checkPropTypes_0(l_contextTypes_0, nil, v38, "context", v41);
                end;
                if l_stateNode_1 then
                    local l_stateNode_2 = v33.stateNode;
                    l_stateNode_2.__reactInternalMemoizedUnmaskedChildContext = v34;
                    l_stateNode_2.__reactInternalMemoizedMaskedChildContext = v38;
                end;
                return v38;
            end;
        end;
    end;
end;
local function v44() --[[ Line: 155 ]] --[[ Name: hasContextChanged ]]
    -- upvalues: l_disableLegacyContext_0 (copy), v21 (copy)
    if l_disableLegacyContext_0 then
        return false;
    else
        return v21.current;
    end;
end;
v23 = function(v45) --[[ Line: 164 ]] --[[ Name: isContextProvider ]]
    if typeof(v45) == "function" then
        return false;
    else
        return v45.childContextTypes ~= nil;
    end;
end;
local function v47(v46) --[[ Line: 179 ]] --[[ Name: popContext ]]
    -- upvalues: l_pop_0 (copy), v21 (copy), v20 (copy)
    l_pop_0(v21, v46);
    l_pop_0(v20, v46);
end;
local function v49(v48) --[[ Line: 189 ]] --[[ Name: popTopLevelContextObject ]]
    -- upvalues: l_pop_0 (copy), v21 (copy), v20 (copy)
    l_pop_0(v21, v48);
    l_pop_0(v20, v48);
end;
local function v53(v50, v51, v52) --[[ Line: 199 ]] --[[ Name: pushTopLevelContextObject ]]
    -- upvalues: v20 (copy), v19 (copy), l_Error_0 (copy), l_push_0 (copy), v21 (copy)
    if v20.current ~= v19 then
        error(l_Error_0.new("Unexpected context found on stack. " .. "This error is likely caused by a bug in React. Please file an issue."));
    end;
    l_push_0(v20, v51, v50);
    l_push_0(v21, v52, v50);
end;
local function v65(v54, v55, v56) --[[ Line: 220 ]] --[[ Name: processChildContext ]]
    -- upvalues: l_getComponentName_0 (copy), v18 (ref), l_console_0 (copy), l_Error_0 (copy), l_checkPropTypes_0 (copy), v4 (copy)
    local l_stateNode_3 = v54.stateNode;
    local l_childContextTypes_0 = v55.childContextTypes;
    if typeof(l_stateNode_3.getChildContext) ~= "function" then
        if _G.__DEV__ then
            local v59 = l_getComponentName_0(v55) or "Unknown";
            if not v18[v59] then
                v18[v59] = true;
                l_console_0.error("%s.childContextTypes is specified but there is no getChildContext() method " .. "on the instance. You can either define getChildContext() on %s or remove " .. "childContextTypes from it.", v59, v59);
            end;
        end;
        return v56;
    else
        local v60 = l_stateNode_3:getChildContext();
        for v61, _ in v60 do
            if l_childContextTypes_0[v61] == nil then
                local v63 = l_getComponentName_0(v55) or "Unknown";
                error(l_Error_0.new(string.format("%s.getChildContext(): key \"%s\" is not defined in childContextTypes.", v63, v61)));
            end;
        end;
        if _G.__DEV__ or _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
            local v64 = l_getComponentName_0(v55) or "Unknown";
            l_checkPropTypes_0(l_childContextTypes_0, nil, v60, "child context", v64);
        end;
        return v4.Dictionary.join(v56, v60);
    end;
end;
local function v69(v66) --[[ Line: 273 ]] --[[ Name: pushContextProvider ]]
    -- upvalues: v19 (copy), l_v19_0 (ref), v20 (copy), l_push_0 (copy), v21 (copy)
    local l_stateNode_4 = v66.stateNode;
    local v68 = l_stateNode_4 and l_stateNode_4.__reactInternalMemoizedMergedChildContext or v19;
    l_v19_0 = v20.current;
    l_push_0(v20, v68, v66);
    l_push_0(v21, v21.current, v66);
    return true;
end;
local function v75(v70, v71, v72) --[[ Line: 300 ]] --[[ Name: invalidateContextProvider ]]
    -- upvalues: l_Error_0 (copy), v65 (copy), l_v19_0 (ref), l_pop_0 (copy), v21 (copy), v20 (copy), l_push_0 (copy)
    local l_stateNode_5 = v70.stateNode;
    if not l_stateNode_5 then
        error(l_Error_0.new("Expected to have an instance by this point. " .. "This error is likely caused by a bug in React. Please file an issue."));
    end;
    if v72 then
        local v74 = v65(v70, v71, l_v19_0);
        l_stateNode_5.__reactInternalMemoizedMergedChildContext = v74;
        l_pop_0(v21, v70);
        l_pop_0(v20, v70);
        l_push_0(v20, v74, v70);
        l_push_0(v21, v72, v70);
        return;
    else
        l_pop_0(v21, v70);
        l_push_0(v21, v72, v70);
        return;
    end;
end;
return {
    emptyContextObject = v19, 
    getUnmaskedContext = v27, 
    cacheContext = v32, 
    getMaskedContext = v43, 
    hasContextChanged = v44, 
    popContext = v47, 
    popTopLevelContextObject = v49, 
    pushTopLevelContextObject = v53, 
    processChildContext = v65, 
    isContextProvider = v23, 
    pushContextProvider = v69, 
    invalidateContextProvider = v75, 
    findCurrentUnmaskedContext = function(v76) --[[ Line: 343 ]] --[[ Name: findCurrentUnmaskedContext ]]
        -- upvalues: l_ClassComponent_0 (copy), l_isFiberMounted_0 (copy), l_Error_0 (copy), l_HostRoot_0 (copy)
        if v76.tag ~= l_ClassComponent_0 or not l_isFiberMounted_0(v76) then
            error(l_Error_0.new("Expected subtree parent to be a mounted class component. " .. "This error is likely caused by a bug in React. Please file an issue."));
        end;
        local l_v76_0 = v76;
        while true do
            if l_v76_0.tag == l_HostRoot_0 then
                return l_v76_0.stateNode.context;
            elseif l_v76_0.tag == l_ClassComponent_0 and l_v76_0.type.childContextTypes ~= nil then
                return l_v76_0.stateNode.__reactInternalMemoizedMergedChildContext;
            else
                l_v76_0 = l_v76_0.return_;
                if l_v76_0 == nil then
                    error(l_Error_0.new("Found unexpected detached subtree parent. " .. "This error is likely caused by a bug in React. Please file an issue."));
                    return;
                end;
            end;
        end;
    end
};