local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
if v1.RunTests() or v1.RunRhodiumTests() then
    return;
else
    local l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 = game:GetFastFlag("FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds");
    local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
    local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.SourceStrings;
    local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.LocalizedStrings;
    local v6 = require(l_script_FirstAncestor_0.PluginLoader.PluginLoaderBuilder);
    local v19 = {
        plugin = plugin, 
        pluginName = v3.PLUGIN_NAME, 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        overrideLocaleId = nil, 
        localizationNamespace = nil, 
        getToolbarName = function(v7, v8, v9) --[[ Line: 23 ]] --[[ Name: getToolbarName ]]
            -- upvalues: l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 (copy)
            if l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 then
                return "Animations";
            else
                return v7(v8, v9, "Plugin", "Toolbar");
            end;
        end, 
        buttonInfo = {
            getName = function(v10, v11, v12) --[[ Line: 31 ]] --[[ Name: getName ]]
                -- upvalues: l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 (copy)
                if l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 then
                    return "Animation Editor";
                else
                    return v10(v11, v12, "Plugin", "Button");
                end;
            end, 
            getDescription = function(v13, v14, v15) --[[ Line: 38 ]] --[[ Name: getDescription ]]
                return v13(v14, v15, "Plugin", "Description");
            end, 
            icon = v3.PLUGIN_ICON, 
            text = nil
        }, 
        dockWidgetInfo = {
            id = "AnimationClipEditor", 
            dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Bottom, false, true, v3.MAIN_FLOATING_SIZE.X, v3.MAIN_FLOATING_SIZE.Y, v3.MAIN_MINIMUM_SIZE.X, v3.MAIN_MINIMUM_SIZE.Y), 
            getDockTitle = function(v16, v17, v18) --[[ Line: 55 ]] --[[ Name: getDockTitle ]]
                return v16(v17, v18, "Plugin", "Name");
            end, 
            name = "AnimationClipEditor", 
            zIndexBehavior = Enum.ZIndexBehavior.Sibling
        }
    };
    local v20 = v6.build(v19);
    if not v20.pluginLoader:waitForUserInteraction() then
        return;
    else
        require(script.Parent.main)(plugin, v20);
        return;
    end;
end;