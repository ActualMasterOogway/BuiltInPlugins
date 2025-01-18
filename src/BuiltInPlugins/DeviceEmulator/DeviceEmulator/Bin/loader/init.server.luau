require(script.Parent.defineLuaFlags);
if not game:GetFastFlag("DeviceEmulatorPluginBasedUi") then
    return;
else
    local l_Parent_0 = script.Parent.Parent;
    if require(l_Parent_0.Src.Util.DebugFlags).RunningUnderCLI() then
        return;
    else
        local v1 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
        local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
        local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
        local v16 = {
            plugin = plugin, 
            pluginName = "DeviceEmulator", 
            translationResourceTable = l_LocalizedStrings_0, 
            fallbackResourceTable = l_SourceStrings_0, 
            overrideLocaleId = nil, 
            localizationNamespace = nil, 
            getToolbarName = function(v4, v5, v6) --[[ Line: 25 ]] --[[ Name: getToolbarName ]]
                return v4(v5, v6, "Plugin", "Toolbar");
            end, 
            buttonInfo = {
                getName = function(v7, v8, v9) --[[ Line: 29 ]] --[[ Name: getName ]]
                    return v7(v8, v9, "Plugin", "Button");
                end, 
                getDescription = function(v10, v11, v12) --[[ Line: 32 ]] --[[ Name: getDescription ]]
                    return v10(v11, v12, "Plugin", "Description");
                end, 
                icon = "rbxasset://textures/DeviceEmulator/emulator.png", 
                text = nil, 
                clickableWhenViewportHidden = true
            }, 
            dockWidgetInfo = {
                id = "DeviceEmulator", 
                dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Bottom, false, false, 360, 420, 300, 200), 
                getDockTitle = function(v13, v14, v15) --[[ Line: 50 ]] --[[ Name: getDockTitle ]]
                    return v13(v14, v15, "Plugin", "Name");
                end, 
                zIndexBehavior = Enum.ZIndexBehavior.Sibling
            }
        };
        local v17 = v1.build(v16);
        if not v17.pluginLoader:waitForUserInteraction() then
            return;
        else
            require(script.Parent.main)(plugin, v17);
            return;
        end;
    end;
end;