local l_Parent_0 = script.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Rodux);
local v4 = require(l_Packages_0.Framework);
local l_Networking_0 = v4.Http.Networking;
local l_ContextServices_0 = v4.ContextServices;
local l_ThemeSwitcher_0 = v4.Style.ThemeSwitcher;
local l_Signal_0 = v4.Util.Signal;
local v9 = require(l_Parent_0.Core.Util.Settings);
local v10 = require(l_Parent_0.Core.Util.ToolboxTheme);
local v11 = require(l_Parent_0.Core.Reducers.ToolboxReducer);
local v12 = require(l_Parent_0.Core.Networking.NetworkInterfaceMock);
local v13 = require(l_Parent_0.Core.Util.Analytics.AssetAnalyticsContextItem);
local v14 = require(l_Parent_0.Core.Util.Analytics.AssetAnalytics);
local v15 = require(l_Parent_0.Core.Components.ExternalServicesWrapper);
local v16 = require(l_Parent_0.Core.ContextServices.Settings);
local v17 = require(l_Parent_0.Core.Util.makeTheme);
local v18 = require(l_Parent_0.Core.Themes.getAssetConfigTheme);
local v19 = require(l_Parent_0.TestUtils.CoreTestUtils);
return function(v20) --[[ Line: 28 ]] --[[ Name: ToolboxStoryWrapper ]]
    -- upvalues: v19 (copy), v3 (copy), v11 (copy), v9 (copy), v12 (copy), v16 (copy), l_ContextServices_0 (copy), l_Networking_0 (copy), v17 (copy), v18 (copy), l_ThemeSwitcher_0 (copy), v13 (copy), v14 (copy), v10 (copy), l_Parent_0 (copy), v4 (copy), l_Signal_0 (copy), v2 (copy), v15 (copy)
    local v21 = v19.createThunkMiddleware();
    local v22 = v20.store or v3.Store.new(v11, nil, v21);
    if v20.storeSetup then
        v20.storeSetup(v22);
    end;
    local v23 = v20.pluginGui or nil;
    local v24 = v20.settings or v9.new(plugin);
    local v25 = v20.networkInterface or v12.new();
    local v26 = v16.new(v24);
    local v27 = l_ContextServices_0.Store.new(v22);
    local v28 = l_ContextServices_0.API.new({
        networking = l_Networking_0.mock()
    });
    local v29 = v17(v18(), l_ThemeSwitcher_0);
    local v30 = v13.new(v20.assetAnalytics or v14.mock());
    local v31 = v20.legacyTheme or v10.createDummyThemeManager();
    local l_SourceStrings_0 = l_Parent_0.LocalizationSource.SourceStrings;
    local l_LocalizedStrings_0 = l_Parent_0.LocalizationSource.LocalizedStrings;
    local v34 = {
        v27, 
        v26, 
        v28, 
        v30, 
        v29, 
        (l_ContextServices_0.Localization.new({
            stringResourceTable = l_SourceStrings_0, 
            translationResourceTable = l_LocalizedStrings_0, 
            pluginName = "Toolbox", 
            libraries = {
                [v4.Resources.LOCALIZATION_PROJECT_NAME] = {
                    stringResourceTable = v4.Resources.SourceStrings, 
                    translationResourceTable = v4.Resources.LocalizedStrings
                }
            }, 
            overrideGetLocale = function() --[[ Line: 61 ]] --[[ Name: overrideGetLocale ]]
                return "en-us";
            end, 
            overrideLocaleId = "en-us", 
            overrideLocaleChangedSignal = l_Signal_0.new()
        }))
    };
    return v2.createElement(v15, {
        store = v22, 
        plugin = plugin, 
        pluginGui = v23, 
        settings = v24, 
        theme = v31, 
        networkInterface = v25
    }, {
        l_ContextServices_0.provide(v34, v20[v2.Children])
    });
end;