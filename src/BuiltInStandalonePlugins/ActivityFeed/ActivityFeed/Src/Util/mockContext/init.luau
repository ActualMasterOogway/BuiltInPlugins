local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Src.Resources.MakeTheme);
local v4 = require(l_Parent_0.Src.Clients.MockActivityHistoryClient);
local v5 = require(l_Parent_0.Src.Contexts.ActivityHistoryProvider);
local l_TestHelpers_0 = v2.TestHelpers;
local l_ContextServices_0 = v2.ContextServices;
local v8 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock(), 
    v3(true)
};
return function(v9) --[[ Line: 17 ]]
    -- upvalues: v4 (copy), v1 (copy), v5 (copy), l_TestHelpers_0 (copy), v8 (copy)
    assert(type(v9) == "table", "Expected story to be a table");
    local v10 = {
        activityHistoryClient = v4, 
        contextType = "mock context"
    };
    local v11 = {
        ActivityHistoryProvider = v1.createElement(v5, v10, v9)
    };
    return l_TestHelpers_0.provideMockContext(v8, v11);
end;