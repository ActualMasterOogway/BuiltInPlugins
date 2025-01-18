local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Framework);
local l_TestHelpers_0 = v2.TestHelpers;
local l_ContextServices_0 = v2.ContextServices;
local v5 = require(l_Parent_0.Src.Resources.MakeTheme);
local v6 = require(l_Parent_0.Src.Reducers);
local v7 = require(l_Parent_0.Src.InitialStoreState);
local v8 = l_ContextServices_0.Store.new(v1.Store.new(v6, v7, {
    v1.thunkMiddleware
}, nil));
local v9 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock(), 
    v5(true), 
    v8
};
return function(v10) --[[ Line: 30 ]]
    -- upvalues: l_TestHelpers_0 (copy), v9 (copy)
    assert(type(v10) == "table", "Expected story to be a table");
    return l_TestHelpers_0.provideMockContext(v9, v10);
end;