if not game:GetService("StudioService"):HasInternalPermission() then
    return;
else
    require(script.Parent.defineLuaFlags);
    local l_Parent_0 = script.Parent.Parent;
    local v1 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
    local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
    local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
    local v16 = {
        plugin = plugin, 
        pluginName = "EventEmulator", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        overrideLocaleId = nil, 
        localizationNamespace = nil, 
        getToolbarName = function(v4, v5, v6) --[[ Line: 20 ]] --[[ Name: getToolbarName ]]
            return v4(v5, v6, "Plugin", "Toolbar");
        end, 
        buttonInfo = {
            getName = function(v7, v8, v9) --[[ Line: 24 ]] --[[ Name: getName ]]
                return v7(v8, v9, "Plugin", "Button");
            end, 
            getDescription = function(v10, v11, v12) --[[ Line: 27 ]] --[[ Name: getDescription ]]
                return v10(v11, v12, "Plugin", "Description");
            end, 
            icon = "rbxasset://textures/GameSettings/ToolbarIcon.png", 
            text = nil, 
            clickableWhenViewportHidden = true
        }, 
        dockWidgetInfo = {
            id = "EventEmulator", 
            dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, false, false, 310, 225, 310, 225), 
            getDockTitle = function(v13, v14, v15) --[[ Line: 45 ]] --[[ Name: getDockTitle ]]
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