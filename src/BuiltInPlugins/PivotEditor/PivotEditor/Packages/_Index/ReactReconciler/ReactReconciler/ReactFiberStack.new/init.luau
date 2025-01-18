local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v3 = {};
local v4 = {};
local v5 = nil;
if _G.__DEV__ then
    v5 = {};
end;
local v6 = 0;
local function v8(v7) --[[ Line: 35 ]] --[[ Name: createCursor ]]
    return {
        current = v7
    };
end;
local function v9() --[[ Line: 41 ]] --[[ Name: isEmpty ]]
    -- upvalues: v6 (ref)
    return v6 == 0;
end;
local function v13(v10, v11) --[[ Line: 45 ]] --[[ Name: pop ]]
    -- upvalues: v6 (ref), l_console_0 (copy), v5 (ref), v4 (copy), v3 (copy)
    if v6 < 1 then
        if _G.__DEV__ then
            l_console_0.error("Unexpected pop.");
        end;
        return;
    else
        if _G.__DEV__ and v11 ~= v5[v6] then
            l_console_0.error("Unexpected Fiber popped.");
        end;
        local v12 = v4[v6];
        if v12 == v3 then
            v10.current = nil;
        else
            v10.current = v12;
        end;
        v4[v6] = nil;
        if _G.__DEV__ then
            v5[v6] = nil;
        end;
        v6 = v6 - 1;
        return;
    end;
end;
local function v18(v14, v15, v16) --[[ Line: 77 ]] --[[ Name: push ]]
    -- upvalues: v6 (ref), v4 (copy), v3 (copy), v5 (ref)
    v6 = v6 + 1;
    local l_current_0 = v14.current;
    if l_current_0 == nil then
        v4[v6] = v3;
    else
        v4[v6] = l_current_0;
    end;
    if _G.__DEV__ then
        v5[v6] = v16;
    end;
    v14.current = v15;
end;
local function v19() --[[ Line: 94 ]] --[[ Name: checkThatStackIsEmpty ]]
    -- upvalues: v6 (ref), l_console_0 (copy)
    if _G.__DEV__ and v6 ~= 0 then
        l_console_0.error("Expected an empty stack. Something was not reset properly.");
    end;
end;
local function v20() --[[ Line: 102 ]] --[[ Name: resetStackAfterFatalErrorInDev ]]
    -- upvalues: v6 (ref), v4 (copy), v5 (ref)
    if _G.__DEV__ then
        v6 = 0;
        table.clear(v4);
        table.clear(v5);
    end;
end;
return {
    createCursor = v8, 
    isEmpty = v9, 
    pop = v13, 
    push = v18, 
    checkThatStackIsEmpty = v19, 
    resetStackAfterFatalErrorInDev = v20
};