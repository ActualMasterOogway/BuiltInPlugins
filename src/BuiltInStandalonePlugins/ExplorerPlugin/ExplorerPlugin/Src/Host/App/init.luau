local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v1 = require(l_script_FirstAncestor_0.Packages.Explorer);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Host.Contexts.StudioActiveViewContextProvider);
local v5 = require(l_script_FirstAncestor_0.Src.SharedFeatures.ContextMenu.StudioContextMenuContextProvider);
local v6 = require(l_script_FirstAncestor_0.Src.Host.Contexts.StudioDragDropContextProvider);
local v7 = require(l_script_FirstAncestor_0.Src.Host.Contexts.StudioMouseContextProvider);
local v8 = require(l_script_FirstAncestor_0.Src.Host.Contexts.StudioNetworkContextProvider);
local v9 = require(l_script_FirstAncestor_0.Src.SharedFeatures.StudioSelectAll);
local v10 = require(l_script_FirstAncestor_0.Src.Host.Contexts.StudioSettingsContextProvider);
local v11 = require(l_script_FirstAncestor_0.Src.Host.Contexts.StudioThemeContextProvider);
local v12 = require(l_script_FirstAncestor_0.Src.SharedFeatures.StudioWindowInput);
local v13 = require(l_script_FirstAncestor_0.Src.Host.WidgetRegister);
local l_createElement_0 = v2.createElement;
return function(v15) --[[ Line: 19 ]] --[[ Name: App ]]
    -- upvalues: l_createElement_0 (copy), v3 (copy), v1 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy)
    return l_createElement_0(v3.ContextStack, {
        providers = {
            l_createElement_0(v1.Components.Contexts.AnalyticsTelemetryServiceProvider), 
            l_createElement_0(v4), 
            l_createElement_0(v5), 
            l_createElement_0(v6, {
                dockWidget = v15.dockWidget
            }), 
            l_createElement_0(v7, {
                dockWidget = v15.dockWidget
            }), 
            l_createElement_0(v8), 
            l_createElement_0(v9.Provider, {
                dockWidget = v15.dockWidget
            }), 
            l_createElement_0(v10), 
            l_createElement_0(v11), 
            l_createElement_0(v12.Provider, {
                dockWidget = v15.dockWidget
            })
        }
    }, {
        MainView = l_createElement_0(v1.Components.MainView), 
        WidgetRegister = l_createElement_0(v13)
    });
end;