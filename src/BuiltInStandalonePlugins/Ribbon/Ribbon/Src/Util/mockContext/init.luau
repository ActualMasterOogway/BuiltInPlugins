local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_TestHelpers_0 = v1.TestHelpers;
local l_ContextServices_0 = v1.ContextServices;
local l_StudioTheme_0 = v1.Style.Themes.StudioTheme;
local v5 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock(), 
    l_StudioTheme_0.mock()
};
return function(v6) --[[ Line: 23 ]]
    -- upvalues: l_TestHelpers_0 (copy), v5 (copy)
    assert(type(v6) == "table", "Expected story to be a table");
    return l_TestHelpers_0.provideMockContext(v5, v6);
end;