require(script.Parent.defineLuaFlags);
local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local v7 = {
    plugin = plugin, 
    pluginName = "AlignmentTool", 
    translationResourceTable = l_LocalizedStrings_0, 
    fallbackResourceTable = l_SourceStrings_0, 
    overrideLocaleId = nil, 
    localizationNamespace = nil, 
    getToolbarName = function() --[[ Line: 16 ]] --[[ Name: getToolbarName ]]
        return "Alignment";
    end, 
    buttonInfo = {
        getName = function() --[[ Line: 20 ]] --[[ Name: getName ]]
            return "AlignTool";
        end, 
        getDescription = function() --[[ Line: 23 ]] --[[ Name: getDescription ]]
            return "";
        end, 
        icon = "", 
        text = nil, 
        clickableWhenViewportHidden = true
    }, 
    dockWidgetInfo = {
        id = "AlignmentTool", 
        dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, false, false, 300, 250, 175, 250), 
        getDockTitle = function(v4, v5, v6) --[[ Line: 41 ]] --[[ Name: getDockTitle ]]
            return v4(v5, v6, "Plugin", "WindowTitle");
        end, 
        zIndexBehavior = Enum.ZIndexBehavior.Sibling
    }
};
local v8 = v1.build(v7);
if not v8.pluginLoader:waitForUserInteraction() then
    return;
else
    require(script.Parent.main)(plugin, v8);
    return;
end;