require(script.Parent.defineLuaFlags);
if not game:GetFastFlag("AudioDiscoveryLoader") then
    return;
elseif game:GetFastFlag("RetireAudioDiscoveryPlugin") then
    return;
else
    local l_Parent_0 = script.Parent.Parent;
    if require(l_Parent_0.Src.Util.DebugFlags).RunningUnderCLI() then
        return;
    else
        local v1 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
        local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
        local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
        local v10 = {
            getName = function(v4, v5, v6) --[[ Line: 25 ]] --[[ Name: getName ]]
                return v4(v5, v6, "Plugin", "Button");
            end, 
            getDescription = function(v7, v8, v9) --[[ Line: 28 ]] --[[ Name: getDescription ]]
                return v7(v8, v9, "Plugin", "Description");
            end, 
            icon = "rbxlocaltheme://ViewSounds", 
            enabled = false
        };
        local v14 = {
            plugin = plugin, 
            pluginName = "AudioDiscovery", 
            translationResourceTable = l_LocalizedStrings_0, 
            fallbackResourceTable = l_SourceStrings_0, 
            getToolbarName = function(v11, v12, v13) --[[ Line: 40 ]] --[[ Name: getToolbarName ]]
                return v11(v12, v13, "Plugin", "Toolbar");
            end, 
            buttonInfo = v10
        };
        if game:GetService("RunService"):IsEdit() then
            v10.enabled = true;
            v14.dockWidgetInfo = {
                id = "AudioDiscovery", 
                dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Bottom, false, false, 640, 480, 250, 200), 
                getDockTitle = function(v15, v16, v17) --[[ Line: 60 ]] --[[ Name: getDockTitle ]]
                    return v15(v16, v17, "Plugin", "Name");
                end, 
                zIndexBehavior = Enum.ZIndexBehavior.Sibling
            };
            local v18 = v1.build(v14);
            if not v18.pluginLoader:waitForUserInteraction() then
                return;
            else
                require(script.Parent.main)(plugin, v18);
                return;
            end;
        else
            v1.build(v14);
            return;
        end;
    end;
end;