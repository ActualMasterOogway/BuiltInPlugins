local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Framework);
local l_TestHelpers_0 = v2.TestHelpers;
local l_ContextServices_0 = v2.ContextServices;
local v5 = require(l_Parent_0.Src.Reducers.MainReducer);
local v6 = require(l_Parent_0.Src.Middleware.MainMiddleware);
local v7 = require(l_Parent_0.Src.Resources.MakeTheme);
local v8 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock(), 
    v7(true)
};
return function(v9, v10) --[[ Line: 26 ]]
    -- upvalues: v1 (copy), v5 (copy), v6 (copy), v8 (copy), l_ContextServices_0 (copy), l_TestHelpers_0 (copy)
    assert(type(v9) == "table", "Expected initialStore to be a table");
    assert(type(v10) == "table", "Expected children to be a table");
    local v11 = v1.Store.new(v5, v9, v6);
    table.insert(v8, l_ContextServices_0.Store.new(v11));
    return {
        getStore = function() --[[ Line: 34 ]] --[[ Name: getStore ]]
            -- upvalues: v11 (copy)
            return v11;
        end, 
        getChildrenWithMockContext = function() --[[ Line: 37 ]] --[[ Name: getChildrenWithMockContext ]]
            -- upvalues: l_TestHelpers_0 (ref), v8 (ref), v10 (copy)
            return l_TestHelpers_0.provideMockContext(v8, v10);
        end
    };
end;