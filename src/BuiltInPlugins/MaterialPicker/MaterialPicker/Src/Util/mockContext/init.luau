local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.MaterialFramework);
local l_ContextServices_0 = v1.ContextServices;
local l_TestHelpers_0 = v1.TestHelpers;
local l_Resources_0 = v2.Resources;
local l_StudioServices_0 = v2.Context.StudioServices;
local v7 = require(l_Parent_0.Src.Resources.createThemeTable);
local v8 = require(l_Parent_0.Src.TestHelpers.createEmptyStore);
local v9 = v7(true);
local v10 = {
    l_ContextServices_0.Analytics.mock(), 
    l_ContextServices_0.Localization.mock({
        libraries = {
            [l_Resources_0.LOCALIZATION_PROJECT_NAME] = {
                stringResourceTable = l_Resources_0.SourceStrings, 
                translationResourceTable = l_Resources_0.LocalizedStrings
            }
        }
    }), 
    l_ContextServices_0.Store.new(v8()), 
    v9.createTheme(), 
    l_StudioServices_0.mock()
};
return function(v11) --[[ Line: 39 ]]
    -- upvalues: l_TestHelpers_0 (copy), v10 (copy)
    assert(type(v11) == "table", "Expected story to be a table");
    return l_TestHelpers_0.provideMockContext(v10, v11);
end;