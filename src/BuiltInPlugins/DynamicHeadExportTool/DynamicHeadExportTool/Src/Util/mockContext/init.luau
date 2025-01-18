local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_TestHelpers_0 = v2.TestHelpers;
local l_ContextServices_0 = v2.ContextServices;
local v5 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local v6 = require(l_script_FirstAncestor_0.Src.Resources.MakeTheme);
local v7 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock(), 
    l_ContextServices_0.Store.new(v1.Store.new(v5, nil, nil, nil)), 
    v6(true)
};
return function(v8) --[[ Line: 27 ]]
    -- upvalues: l_TestHelpers_0 (copy), v7 (copy)
    assert(type(v8) == "table", "Expected story to be a table");
    return l_TestHelpers_0.provideMockContext(v7, v8);
end;