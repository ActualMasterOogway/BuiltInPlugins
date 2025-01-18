local v0 = require(script.Parent.main);
if game:GetService("RunService"):IsEdit() then
    v0(plugin);
    return;
else
    local l_Parent_0 = script.Parent.Parent;
    local v2 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
    local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
    local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
    local v8 = {
        plugin = plugin, 
        pluginName = "Drafts", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        overrideLocaleId = nil, 
        localizationNamespace = nil, 
        getToolbarName = function() --[[ Line: 21 ]] --[[ Name: getToolbarName ]]
            return "draftsToolbar";
        end, 
        buttonInfo = {
            getName = function() --[[ Line: 25 ]] --[[ Name: getName ]]
                return "draftsButton";
            end, 
            getDescription = function(v5, v6, v7) --[[ Line: 28 ]] --[[ Name: getDescription ]]
                return v5(v6, v7, "Meta", "PluginButtonTooltip");
            end, 
            icon = "", 
            text = nil, 
            enabled = false
        }, 
        dockWidgetInfo = nil
    };
    v2.build(v8);
    return;
end;