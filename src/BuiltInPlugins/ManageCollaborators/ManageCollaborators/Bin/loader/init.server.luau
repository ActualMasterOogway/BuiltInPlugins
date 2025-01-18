if not game:GetFastFlag("ImprovePluginSpeed_ManageCollaborators") then
    return;
else
    require(script.Parent.defineLuaFlags);
    local l_Parent_0 = script.Parent.Parent;
    if require(l_Parent_0.Src.Util.DebugFlags).RunningUnderCLI() then
        return;
    else
        local v1 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
        local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
        local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
        local v4 = {
            plugin = plugin, 
            pluginName = "ManageCollaborators", 
            translationResourceTable = l_LocalizedStrings_0, 
            fallbackResourceTable = l_SourceStrings_0, 
            overrideLocaleId = nil, 
            localizationNamespace = nil, 
            noToolbar = true, 
            getToolbarName = nil, 
            buttonInfo = nil, 
            dockWidgetInfo = nil
        };
        local v5 = v1.build(v4);
        v5.pluginLoader:waitForUserInteraction();
        require(script.Parent.main)(plugin, v5);
        return;
    end;
end;