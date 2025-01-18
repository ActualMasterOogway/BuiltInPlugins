local v0 = require(script.Parent.NavigationSymbol);
local v1 = v0("BACK");
local v2 = v0("INIT");
local v3 = v0("NAVIGATE");
local v4 = v0("SET_PARAMS");
local v5 = v0("COMPLETE_TRANSITION");
local v6 = {
    Back = v1, 
    Init = v2, 
    Navigate = v3, 
    SetParams = v4, 
    CompleteTransition = v5
};
v6.__index = v6;
v6.back = function(v7) --[[ Line: 24 ]] --[[ Name: back ]]
    -- upvalues: v1 (copy)
    local v8 = v7 or {};
    return {
        type = v1, 
        key = v8.key, 
        immediate = v8.immediate
    };
end;
v6.init = function(v9) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    local v10 = v9 or {};
    return {
        type = v2, 
        params = v10.params
    };
end;
v6.navigate = function(v11) --[[ Line: 43 ]] --[[ Name: navigate ]]
    -- upvalues: v3 (copy)
    local v12 = v11 or {};
    return {
        type = v3, 
        routeName = v12.routeName, 
        params = v12.params, 
        action = v12.action, 
        key = v12.key
    };
end;
v6.setParams = function(v13) --[[ Line: 55 ]] --[[ Name: setParams ]]
    -- upvalues: v4 (copy)
    local v14 = v13 or {};
    return {
        type = v4, 
        key = v14.key, 
        params = v14.params
    };
end;
v6.completeTransition = function(v15) --[[ Line: 67 ]] --[[ Name: completeTransition ]]
    -- upvalues: v5 (copy)
    local v16 = v15 or {};
    return {
        type = v5, 
        key = v16.key, 
        toChildKey = v16.toChildKey
    };
end;
return v6;