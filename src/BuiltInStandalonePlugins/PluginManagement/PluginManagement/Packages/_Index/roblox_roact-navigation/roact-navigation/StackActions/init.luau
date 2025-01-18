local v0 = require(script.Parent.NavigationSymbol);
local v1 = v0("POP");
local v2 = v0("POP_TO_TOP");
local v3 = v0("PUSH");
local v4 = v0("RESET");
local v5 = v0("REPLACE");
local v6 = {
    Pop = v1, 
    PopToTop = v2, 
    Push = v3, 
    Reset = v4, 
    Replace = v5
};
v6.__index = v6;
v6.pop = function(v7) --[[ Line: 26 ]] --[[ Name: pop ]]
    -- upvalues: v1 (copy)
    local v8 = v7 or {};
    return {
        type = v1, 
        n = v8.n
    };
end;
v6.popToTop = function(v9) --[[ Line: 35 ]] --[[ Name: popToTop ]]
    -- upvalues: v2 (copy)
    local v10 = v9 or {};
    return {
        type = v2, 
        key = v10.key
    };
end;
v6.push = function(v11) --[[ Line: 44 ]] --[[ Name: push ]]
    -- upvalues: v3 (copy)
    local v12 = v11 or {};
    return {
        type = v3, 
        routeName = v12.routeName, 
        params = v12.params, 
        action = v12.action
    };
end;
v6.reset = function(v13) --[[ Line: 56 ]] --[[ Name: reset ]]
    -- upvalues: v4 (copy)
    local v14 = v13 or {};
    return {
        type = v4, 
        index = v14.index, 
        actions = v14.actions, 
        key = v14.key
    };
end;
v6.replace = function(v15) --[[ Line: 67 ]] --[[ Name: replace ]]
    -- upvalues: v5 (copy)
    local v16 = v15 or {};
    return {
        type = v5, 
        key = v16.key, 
        newKey = v16.newKey, 
        routeName = v16.routeName, 
        params = v16.params, 
        action = v16.action, 
        immediate = v16.immediate
    };
end;
return v6;