if not game:GetFastFlag("ImprovePluginSpeed_RigGenerator") then
    return;
else
    local l_Parent_0 = script.Parent.Parent;
    local v1 = require(l_Parent_0.Packages.TestLoader);
    v1.launch("RigGenerator", l_Parent_0.Src);
    if v1.isCli() then
        return;
    else
        local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
        local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
        local v4 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
        local v14 = {
            plugin = plugin, 
            pluginName = "RigGenerator", 
            translationResourceTable = l_LocalizedStrings_0, 
            fallbackResourceTable = l_SourceStrings_0, 
            overrideLocaleId = nil, 
            localizationNamespace = nil, 
            getToolbarName = function(_, _, _) --[[ Line: 25 ]] --[[ Name: getToolbarName ]]
                return "Rig Generator";
            end, 
            buttonInfo = {
                getName = function(_, _, _) --[[ Line: 29 ]] --[[ Name: getName ]]
                    return "Generate Rig";
                end, 
                getDescription = function(v11, v12, v13) --[[ Line: 32 ]] --[[ Name: getDescription ]]
                    return v11(v12, v13, "Plugin", "Description");
                end, 
                icon = "rbxlocaltheme://BuildRig", 
                text = nil
            }
        };
        local v15 = v4.build(v14);
        if not v15.pluginLoader:waitForUserInteraction() then
            return;
        else
            require(script.Parent.main)(plugin, v15);
            return;
        end;
    end;
end;