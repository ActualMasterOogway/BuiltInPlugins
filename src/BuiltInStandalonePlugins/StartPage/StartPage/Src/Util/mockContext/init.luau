local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_TestHelpers_0 = v1.TestHelpers;
local l_ContextServices_0 = v1.ContextServices;
local l_StudioTheme_0 = v1.Style.Themes.StudioTheme;
local v5 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryContext);
local v6 = {
    l_ContextServices_0.Analytics.mock(), 
    v5.mock(), 
    l_ContextServices_0.Localization.mock(), 
    l_StudioTheme_0.mock()
};
return function(v7) --[[ Line: 26 ]]
    -- upvalues: l_TestHelpers_0 (copy), v6 (copy)
    assert(type(v7) == "table", "Expected story to be a table");
    return l_TestHelpers_0.provideMockContext(v6, v7);
end;