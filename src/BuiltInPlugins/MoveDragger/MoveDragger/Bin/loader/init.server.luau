local l_Parent_0 = script.Parent.Parent;
local l_DraggerFramework_0 = l_Parent_0.Packages.DraggerFramework;
local v2 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
local l_SourceStrings_0 = l_DraggerFramework_0.Resources.SourceStrings;
local l_LocalizedStrings_0 = l_DraggerFramework_0.Resources.LocalizedStrings;
local v14 = {
    plugin = plugin, 
    pluginName = "MoveDragger", 
    translationResourceTable = l_LocalizedStrings_0, 
    fallbackResourceTable = l_SourceStrings_0, 
    overrideLocaleId = nil, 
    localizationNamespace = nil, 
    getToolbarName = function(_, _, _) --[[ Line: 15 ]] --[[ Name: getToolbarName ]]
        return "Home";
    end, 
    buttonInfo = {
        getName = function(_, _, _) --[[ Line: 19 ]] --[[ Name: getName ]]
            return "Move";
        end, 
        getDescription = function(_, _, _) --[[ Line: 22 ]] --[[ Name: getDescription ]]
            return "Move an Object";
        end, 
        icon = "", 
        text = nil
    }
};
local v15 = v2.build(v14);
if not v15.pluginLoader:waitForUserInteraction() then
    return;
else
    require(script.Parent.main)(plugin, v15);
    return;
end;