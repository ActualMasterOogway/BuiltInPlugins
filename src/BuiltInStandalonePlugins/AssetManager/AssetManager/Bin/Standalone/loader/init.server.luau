local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
if game:GetFastFlag("DebugAssetMgInAssetDm") then
    return;
elseif not game:GetFastFlag("EnableAssetManager") then
    return;
else
    local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v1.launch("AssetManager", l_script_FirstAncestor_0.Src);
    if v1.isCli() then
        return;
    else
        plugin.Name = l_script_FirstAncestor_0.Name;
        local v2 = require(l_script_FirstAncestor_0.Packages.PluginLoader.PluginLoaderBuilder);
        local v9 = {
            getName = function(v3, v4, v5) --[[ Line: 25 ]] --[[ Name: getName ]]
                return v3(v4, v5, "Plugin", "Button");
            end, 
            getDescription = function(v6, v7, v8) --[[ Line: 32 ]] --[[ Name: getDescription ]]
                return v6(v7, v8, "Plugin", "Description");
            end, 
            icon = "rbxlocaltheme://AssetManager", 
            enabled = true
        };
        local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
        local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
        local v18 = {
            plugin = plugin, 
            pluginName = "AssetManager", 
            getToolbarName = function(v12, v13, v14) --[[ Line: 49 ]] --[[ Name: getToolbarName ]]
                return v12(v13, v14, "Plugin", "Toolbar");
            end, 
            translationResourceTable = l_LocalizedStrings_0, 
            fallbackResourceTable = l_SourceStrings_0, 
            buttonInfo = v9, 
            dockWidgetInfo = {
                id = "AssetManager", 
                dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Bottom, false, false, 640, 480, 250, 200), 
                getDockTitle = function(v15, v16, v17) --[[ Line: 69 ]] --[[ Name: getDockTitle ]]
                    return v15(v16, v17, "Plugin", "Name");
                end, 
                zIndexBehavior = Enum.ZIndexBehavior.Sibling
            }
        };
        local v19 = v2.build(v18);
        if not v19.pluginLoader:waitForUserInteraction() then
            return;
        else
            require(l_script_FirstAncestor_0.Bin.Common.main)(plugin, v19);
            return;
        end;
    end;
end;