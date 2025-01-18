local l_Parent_0 = script.Parent.Parent;
if not plugin then
    return;
else
    local v1 = require(l_Parent_0.Packages.TestLoader);
    if v1.isCli() then
        if v1.isFTF() then
            v1.launch("AssetImporter", l_Parent_0.Src);
            return;
        else
            print("roblox-cli is no longer supported as a test runner for this plugin.");
            print("Please use FeatureTest instead! (go/ftf)");
            return;
        end;
    else
        local v2 = require(l_Parent_0.Packages.PluginLoader.PluginLoaderBuilder);
        local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
        local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
        local l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 = game:GetFastFlag("FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds");
        local v18 = {
            plugin = plugin, 
            pluginName = "AssetImporter", 
            translationResourceTable = l_LocalizedStrings_0, 
            fallbackResourceTable = l_SourceStrings_0, 
            overrideLocaleId = nil, 
            localizationNamespace = nil, 
            getToolbarName = function(v6, v7, v8) --[[ Line: 34 ]] --[[ Name: getToolbarName ]]
                -- upvalues: l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 (copy)
                if l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 then
                    return "Mesh Importer";
                else
                    return v6(v7, v8, "Plugin", "Toolbar");
                end;
            end, 
            buttonInfo = {
                getName = function(v9, v10, v11) --[[ Line: 42 ]] --[[ Name: getName ]]
                    -- upvalues: l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 (copy)
                    if l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 then
                        return "Import";
                    else
                        return v9(v10, v11, "Plugin", "Button");
                    end;
                end, 
                getDescription = function(v12, v13, v14) --[[ Line: 49 ]] --[[ Name: getDescription ]]
                    return v12(v13, v14, "Plugin", "Description");
                end, 
                icon = "rbxlocaltheme://MeshImporter", 
                text = function(v15, v16, v17) --[[ Line: 53 ]] --[[ Name: text ]]
                    return v15(v16, v17, "Plugin", "Button");
                end, 
                clickableWhenViewportHidden = true
            }, 
            dockWidgetInfo = nil
        };
        local v19 = v2.build(v18);
        if not v19.pluginLoader:waitForUserInteraction() then
            return;
        else
            local l_Parent_1 = script.Parent.Parent;
            local v21 = nil;
            init = function() --[[ Line: 72 ]] --[[ Name: init ]]
                -- upvalues: l_Parent_1 (copy), v21 (ref), v19 (copy)
                plugin.Name = l_Parent_1.Name;
                v21 = require(l_Parent_1.Src.Controllers.Initialization).new(plugin, v19);
            end;
            plugin.Unloading:Connect(function() --[[ Line: 79 ]]
                -- upvalues: v21 (ref)
                if v21 then
                    v21:destroy();
                end;
            end);
            init();
            return;
        end;
    end;
end;