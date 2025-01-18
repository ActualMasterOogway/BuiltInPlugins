local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Rodux);
local l_provideMockContext_0 = require(l_Packages_0.Framework).TestHelpers.provideMockContext;
local v5 = require(l_Parent_0.Core.Util.Settings);
local v6 = require(l_Parent_0.Core.Util.ToolboxTheme);
local v7 = require(l_Parent_0.Core.Reducers.ToolboxReducer);
local v8 = require(l_Parent_0.Core.Networking.NetworkInterfaceMock);
local v9 = require(l_Parent_0.Core.Util.Analytics.AssetAnalyticsContextItem);
local v10 = require(l_Parent_0.Core.Util.Analytics.AssetAnalytics);
local v11 = require(l_Parent_0.Core.Components.ExternalServicesWrapper);
local v12 = require(l_Parent_0.Core.Util.makeTheme);
local v13 = require(l_Packages_0.Framework);
local l_Networking_0 = v13.Http.Networking;
local l_ContextServices_0 = v13.ContextServices;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Signal_0 = v13.Util.Signal;
local v18 = require(l_Parent_0.Core.ContextServices.Settings);
local v19 = require(l_Parent_0.Core.ContextServices.IXPContext);
local v20 = require(l_Parent_0.Core.ContextServices.NavigationContext);
local v21 = require(l_Parent_0.Core.Themes.getAssetConfigTheme);
local v22 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v23 = require(l_Parent_0.TestUtils.CoreTestUtils);
local l_MockPlugin_0 = v13.TestHelpers.Instances.MockPlugin;
local v25 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddRecentSearchesToAutoComplete);
return function(v26) --[[ Line: 38 ]] --[[ Name: MockWrapper ]]
    -- upvalues: v23 (copy), v3 (copy), v7 (copy), v25 (copy), l_MockPlugin_0 (copy), v5 (copy), v6 (copy), v8 (copy), v19 (copy), l_Mouse_0 (copy), l_ContextServices_0 (copy), v18 (copy), v12 (copy), v21 (copy), l_Networking_0 (copy), v22 (copy), v9 (copy), v10 (copy), l_Parent_0 (copy), v13 (copy), l_Signal_0 (copy), v20 (copy), v2 (copy), v11 (copy), l_provideMockContext_0 (copy)
    local v27 = v23.createThunkMiddleware();
    local v28 = v26.store or v3.Store.new(v7, nil, v27);
    if v26.storeSetup then
        v26.storeSetup(v28);
    end;
    local v29 = if v25() then v26.plugin or l_MockPlugin_0.new() else v26.plugin or nil;
    local v30 = v26.pluginGui or nil;
    local v31 = v26.settings or v5.new(v29);
    local v32 = v26.theme or v6.createDummyThemeManager();
    local v33 = v26.networkInterface or v8.new();
    local v34 = v26.ixpContext or v19.createMock();
    local v35 = l_Mouse_0.new({
        Icon = "rbxasset://SystemCursors/Arrow"
    });
    local v36 = l_ContextServices_0.Focus.new(v26.focus or Instance.new("ScreenGui"));
    local v37 = l_ContextServices_0.Plugin.new(v29);
    local v38 = v18.new(v31);
    local v39 = v12(v21());
    local v40 = l_ContextServices_0.Store.new(v28);
    local v41 = l_ContextServices_0.API.new({
        networking = l_Networking_0.mock()
    });
    local v42 = l_ContextServices_0.Analytics.mock();
    local v43 = v22.new(v33);
    local v44 = v9.new(v26.assetAnalytics or v10.mock());
    local l_SourceStrings_0 = l_Parent_0.LocalizationSource.SourceStrings;
    local l_LocalizedStrings_0 = l_Parent_0.LocalizationSource.LocalizedStrings;
    local v47 = {
        v40, 
        v36, 
        v35, 
        v37, 
        v38, 
        v39, 
        v41, 
        v44, 
        v42, 
        l_ContextServices_0.Localization.new({
            stringResourceTable = l_SourceStrings_0, 
            translationResourceTable = l_LocalizedStrings_0, 
            pluginName = "Toolbox", 
            libraries = {
                [v13.Resources.LOCALIZATION_PROJECT_NAME] = {
                    stringResourceTable = v13.Resources.SourceStrings, 
                    translationResourceTable = v13.Resources.LocalizedStrings
                }
            }, 
            overrideGetLocale = function() --[[ Line: 83 ]] --[[ Name: overrideGetLocale ]]
                return "en-us";
            end, 
            overrideLocaleId = "en-us", 
            overrideLocaleChangedSignal = l_Signal_0.new()
        }), 
        v34, 
        v20.new(), 
        v43
    };
    return v2.createElement(v11, {
        store = v28, 
        plugin = v29, 
        pluginGui = v30, 
        settings = v31, 
        theme = v32, 
        networkInterface = v33
    }, {
        MockContextProvider = l_provideMockContext_0(v47, v26[v2.Children])
    });
end;