local v0 = require(script.Parent.TestEnum);
local v1 = {};
v1.__index = v1;
v1.new = function() --[[ Line: 6 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v2 = {
        _stack = {}
    };
    setmetatable(v2, v1);
    return v2;
end;
v1.getBeforeEachHooks = function(v3) --[[ Line: 17 ]] --[[ Name: getBeforeEachHooks ]]
    -- upvalues: v0 (copy)
    local l_BeforeEach_0 = v0.NodeType.BeforeEach;
    local v5 = {};
    for _, v7 in ipairs(v3._stack) do
        for _, v9 in ipairs(v7[l_BeforeEach_0]) do
            table.insert(v5, v9);
        end;
    end;
    return v5;
end;
v1.getAfterEachHooks = function(v10) --[[ Line: 33 ]] --[[ Name: getAfterEachHooks ]]
    -- upvalues: v0 (copy)
    local l_AfterEach_0 = v0.NodeType.AfterEach;
    local v12 = {};
    for _, v14 in ipairs(v10._stack) do
        for _, v16 in ipairs(v14[l_AfterEach_0]) do
            table.insert(v12, 1, v16);
        end;
    end;
    return v12;
end;
v1.popHooks = function(v17) --[[ Line: 48 ]] --[[ Name: popHooks ]]
    -- upvalues: v0 (copy)
    local v18 = v17._stack[#v17._stack];
    table.remove(v17._stack, #v17._stack);
    local function _(v19) --[[ Line: 52 ]] --[[ Name: pushHooksUp ]]
        -- upvalues: v17 (copy), v18 (copy)
        local v20 = v17:_getBackOfStack();
        if not v20 then
            return;
        else
            v20[v19] = v18[v19];
            return;
        end;
    end;
    local l_BeforeAll_0 = v0.NodeType.BeforeAll;
    local v23 = v17:_getBackOfStack();
    if v23 then
        v23[l_BeforeAll_0] = v18[l_BeforeAll_0];
    end;
    l_BeforeAll_0 = v0.NodeType.AfterAll;
    v23 = v17:_getBackOfStack();
    if not v23 then
        return;
    else
        v23[l_BeforeAll_0] = v18[l_BeforeAll_0];
        return;
    end;
end;
v1.pushHooksFrom = function(v24, v25) --[[ Line: 67 ]] --[[ Name: pushHooksFrom ]]
    -- upvalues: v0 (copy)
    assert(v25 ~= nil);
    table.insert(v24._stack, {
        [v0.NodeType.BeforeAll] = v24:_getBeforeAllHooksUncalledAtCurrentLevel(v25.children), 
        [v0.NodeType.AfterAll] = v24:_getAfterAllHooksUncalledAtCurrentLevel(v25.children), 
        [v0.NodeType.BeforeEach] = v24:_getHooksOfType(v25.children, v0.NodeType.BeforeEach), 
        [v0.NodeType.AfterEach] = v24:_getHooksOfType(v25.children, v0.NodeType.AfterEach)
    });
end;
v1.getPendingBeforeAllHooks = function(v26) --[[ Line: 78 ]] --[[ Name: getPendingBeforeAllHooks ]]
    -- upvalues: v0 (copy)
    return v26:_getAndClearPendingHooks(v0.NodeType.BeforeAll);
end;
v1.getAfterAllHooks = function(v27) --[[ Line: 82 ]] --[[ Name: getAfterAllHooks ]]
    -- upvalues: v0 (copy)
    if #v27._stack > 0 then
        return v27:_getAndClearPendingHooks(v0.NodeType.AfterAll);
    else
        return {};
    end;
end;
v1._getAndClearPendingHooks = function(v28, v29) --[[ Line: 93 ]] --[[ Name: _getAndClearPendingHooks ]]
    assert(v29 ~= nil);
    if #v28._stack > 0 then
        local v30 = v28._stack[#v28._stack];
        local v31 = v30[v29];
        v30[v29] = {};
        return v31;
    else
        return {};
    end;
end;
v1._getBeforeAllHooksUncalledAtCurrentLevel = function(v32, v33) --[[ Line: 113 ]] --[[ Name: _getBeforeAllHooksUncalledAtCurrentLevel ]]
    -- upvalues: v0 (copy)
    local l_BeforeAll_1 = v0.NodeType.BeforeAll;
    local v35 = v32:_getHooksOfTypeFromBackOfStack(l_BeforeAll_1);
    for _, v37 in pairs(v32:_getHooksOfType(v33, l_BeforeAll_1)) do
        table.insert(v35, v37);
    end;
    return v35;
end;
v1._getAfterAllHooksUncalledAtCurrentLevel = function(v38, v39) --[[ Line: 124 ]] --[[ Name: _getAfterAllHooksUncalledAtCurrentLevel ]]
    -- upvalues: v0 (copy)
    local l_AfterAll_0 = v0.NodeType.AfterAll;
    local v41 = v38:_getHooksOfTypeFromBackOfStack(l_AfterAll_0);
    for _, v43 in pairs(v38:_getHooksOfType(v39, l_AfterAll_0)) do
        table.insert(v41, 1, v43);
    end;
    return v41;
end;
v1._getHooksOfTypeFromBackOfStack = function(v44, v45) --[[ Line: 135 ]] --[[ Name: _getHooksOfTypeFromBackOfStack ]]
    assert(v45, "Expected hookType to be an argument");
    local v46 = v44:_getBackOfStack();
    local v47 = {};
    if v46 then
        for _, v49 in pairs(v46[v45]) do
            table.insert(v47, v49);
        end;
        v46[v45] = {};
    end;
    return v47;
end;
v1._getBackOfStack = function(v50) --[[ Line: 153 ]] --[[ Name: _getBackOfStack ]]
    return v50._stack[#v50._stack] or nil;
end;
v1._getHooksOfType = function(_, v52, v53) --[[ Line: 157 ]] --[[ Name: _getHooksOfType ]]
    local v54 = {};
    for _, v56 in pairs(v52) do
        if v56.type == v53 then
            table.insert(v54, v56.callback);
        end;
    end;
    return v54;
end;
return v1;