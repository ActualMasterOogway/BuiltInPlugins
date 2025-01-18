local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_TestHelpers_0 = v1.TestHelpers;
local l_ContextServices_0 = v1.ContextServices;
local l_MockPlugin_0 = l_TestHelpers_0.Instances.MockPlugin;
local l_StudioTheme_0 = v1.Style.Themes.StudioTheme;
local v6 = require(l_script_FirstAncestor_0.Src.Controllers.ExplorerController);
local v7 = require(l_script_FirstAncestor_0.Src.Controllers.ItemsController);
local v8 = require(l_script_FirstAncestor_0.Src.Controllers.PluginController);
local v9 = require(l_script_FirstAncestor_0.Src.Controllers.SearchController);
local v10 = require(l_script_FirstAncestor_0.Src.Networking);
local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
local v13 = {
    stringResourceTable = l_SourceStrings_0, 
    translationResourceTable = l_LocalizedStrings_0, 
    pluginName = "AssetManager", 
    libraries = {
        [v1.Resources.LOCALIZATION_PROJECT_NAME] = {
            stringResourceTable = v1.Resources.SourceStrings, 
            translationResourceTable = v1.Resources.LocalizedStrings
        }
    }
};
return function() --[[ Line: 38 ]] --[[ Name: getMockContextMap ]]
    -- upvalues: l_MockPlugin_0 (copy), l_ContextServices_0 (copy), v13 (copy), v10 (copy), v8 (copy), v6 (copy), v9 (copy), v7 (copy), l_StudioTheme_0 (copy)
    local v14 = l_MockPlugin_0.new("AssetManager");
    local v15 = l_ContextServices_0.Localization.mock(v13);
    local v16 = v10.mock();
    local v17 = v8.mock(v14, v16, v15);
    local v18 = v6.mock(v17, v16);
    local v19 = v9.mock(v17, v18, v16);
    local v20 = v7.mock(v17, v19, v16);
    return {
        Analytics = l_ContextServices_0.Analytics.mock(), 
        Localization = v15, 
        Theme = l_StudioTheme_0.mock(), 
        PluginController = v17, 
        ExplorerController = v18, 
        SearchController = v19, 
        ItemsController = v20, 
        Networking = v16
    };
end;