local _ = require(script.Parent.ReactInternalTypes);
local v1 = require(script.Parent["ReactFiberStack.new"]);
local v2 = require(script.Parent.ReactFiberHostConfig);
local l_getChildHostContext_0 = v2.getChildHostContext;
local l_getRootHostContext_0 = v2.getRootHostContext;
local l_createCursor_0 = v1.createCursor;
local l_push_0 = v1.push;
local l_pop_0 = v1.pop;
local v8 = {};
local v9 = l_createCursor_0(v8);
local v10 = l_createCursor_0(v8);
local v11 = l_createCursor_0(v8);
requiredContext = function(v12) --[[ Line: 42 ]] --[[ Name: requiredContext ]]
    return v12;
end;
getRootHostContainer = function() --[[ Line: 52 ]] --[[ Name: getRootHostContainer ]]
    -- upvalues: v11 (copy)
    return v11.current;
end;
pushHostContainer = function(v13, v14) --[[ Line: 59 ]] --[[ Name: pushHostContainer ]]
    -- upvalues: l_push_0 (copy), v11 (copy), v10 (copy), v9 (copy), v8 (copy), l_getRootHostContext_0 (copy), l_pop_0 (copy)
    l_push_0(v11, v14, v13);
    l_push_0(v10, v13, v13);
    l_push_0(v9, v8, v13);
    local v15 = l_getRootHostContext_0(v14);
    l_pop_0(v9, v13);
    l_push_0(v9, v15, v13);
end;
popHostContainer = function(v16) --[[ Line: 79 ]] --[[ Name: popHostContainer ]]
    -- upvalues: l_pop_0 (copy), v9 (copy), v10 (copy), v11 (copy)
    l_pop_0(v9, v16);
    l_pop_0(v10, v16);
    l_pop_0(v11, v16);
end;
getHostContext = function() --[[ Line: 85 ]] --[[ Name: getHostContext ]]
    -- upvalues: v9 (copy)
    return v9.current;
end;
pushHostContext = function(v17) --[[ Line: 92 ]] --[[ Name: pushHostContext ]]
    -- upvalues: v11 (copy), v9 (copy), l_getChildHostContext_0 (copy), l_push_0 (copy), v10 (copy)
    local v18 = requiredContext(v11.current);
    local v19 = requiredContext(v9.current);
    local v20 = l_getChildHostContext_0(v19, v17.type, v18);
    if v19 == v20 then
        return;
    else
        l_push_0(v10, v17, v17);
        l_push_0(v9, v20, v17);
        return;
    end;
end;
popHostContext = function(v21) --[[ Line: 108 ]] --[[ Name: popHostContext ]]
    -- upvalues: v10 (copy), l_pop_0 (copy), v9 (copy)
    if v10.current ~= v21 then
        return;
    else
        l_pop_0(v9, v21);
        l_pop_0(v10, v21);
        return;
    end;
end;
return {
    getHostContext = getHostContext, 
    getRootHostContainer = getRootHostContainer, 
    popHostContainer = popHostContainer, 
    popHostContext = popHostContext, 
    pushHostContainer = pushHostContainer, 
    pushHostContext = pushHostContext
};