local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
if not game:GetFastFlag("DebugAssetMgInAssetDm") then
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
        local l_AssetManagerRibbonBar_0 = game:GetFastFlag("AssetManagerRibbonBar");
        local v10 = {
            getName = function(v4, v5, v6) --[[ Line: 32 ]] --[[ Name: getName ]]
                -- upvalues: l_AssetManagerRibbonBar_0 (copy)
                if l_AssetManagerRibbonBar_0 then
                    return "assetManagerToolButton";
                else
                    return v4(v5, v6, "Plugin", "Button");
                end;
            end, 
            getDescription = function(v7, v8, v9) --[[ Line: 44 ]] --[[ Name: getDescription ]]
                return v7(v8, v9, "Plugin", "Description");
            end, 
            icon = l_AssetManagerRibbonBar_0 and "rbxlocaltheme://AssetManager" or "rbxlocaltheme://GameSettings", 
            enabled = true
        };
        local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
        local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
        local v19 = {
            plugin = plugin, 
            pluginName = "AssetManager", 
            getToolbarName = function(v13, v14, v15) --[[ Line: 61 ]] --[[ Name: getToolbarName ]]
                -- upvalues: l_AssetManagerRibbonBar_0 (copy)
                if l_AssetManagerRibbonBar_0 then
                    return "assetManagerToolbar";
                else
                    return v13(v14, v15, "Plugin", "Toolbar");
                end;
            end, 
            translationResourceTable = l_LocalizedStrings_0, 
            fallbackResourceTable = l_SourceStrings_0, 
            buttonInfo = v10, 
            dockWidgetInfo = {
                id = "AssetManager", 
                dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Bottom, false, false, 640, 480, 250, 200), 
                getDockTitle = function(v16, v17, v18) --[[ Line: 85 ]] --[[ Name: getDockTitle ]]
                    return v16(v17, v18, "Plugin", "Name");
                end, 
                zIndexBehavior = Enum.ZIndexBehavior.Sibling
            }
        };
        local v20 = v2.build(v19);
        if not v20.pluginLoader:waitForUserInteraction() then
            return;
        else
            require(l_script_FirstAncestor_0.Src.Asset.setupAssetsDm)(plugin);
            require(l_script_FirstAncestor_0.Bin.Common.main)(plugin, v20);
            return;
        end;
    end;
end;