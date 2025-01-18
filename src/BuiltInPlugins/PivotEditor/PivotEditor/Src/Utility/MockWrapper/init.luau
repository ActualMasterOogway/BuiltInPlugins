local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v3 = require(l_Parent_0.Src.Reducers.MainReducer);
return function(v4, v5) --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v3 (copy), l_ContextServices_0 (copy)
    local v6 = v4.Plugin or {};
    local v7 = v4.Mouse or {};
    local v8 = v4.Store or v1.Store.new(v3, nil, {
        v1.thunkMiddleware
    });
    return l_ContextServices_0.provide({
        l_ContextServices_0.Plugin.new(v6), 
        l_ContextServices_0.Mouse.new(v7), 
        l_ContextServices_0.Store.new(v8)
    }, v5);
end;