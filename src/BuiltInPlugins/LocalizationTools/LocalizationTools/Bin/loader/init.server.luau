local l_Parent_0 = script.Parent.Parent;
require(script.Parent.defineLuaFlags);
if require(l_Parent_0.Src.Util.DebugFlags).RunningUnderCLI() then
    return;
else
    local l_RunService_0 = game:GetService("RunService");
    local v2 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
    local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
    local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
    local v17 = {
        plugin = plugin, 
        pluginName = "LocalizationTools", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        overrideLocaleId = nil, 
        localizationNamespace = nil, 
        getToolbarName = function(v5, v6, v7) --[[ Line: 25 ]] --[[ Name: getToolbarName ]]
            return v5(v6, v7, "Plugin", "ToolbarLabel");
        end, 
        buttonInfo = {
            getName = function(v8, v9, v10) --[[ Line: 29 ]] --[[ Name: getName ]]
                return v8(v9, v10, "Plugin", "RibbonBarButton");
            end, 
            getDescription = function(v11, v12, v13) --[[ Line: 32 ]] --[[ Name: getDescription ]]
                return v11(v12, v13, "Plugin", "ToolTipMessage");
            end, 
            icon = "rbxlocaltheme://LocalizationTools", 
            text = nil, 
            enabled = l_RunService_0:IsEdit()
        }, 
        dockWidgetInfo = {
            id = "LocalizationTools", 
            dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, false, false, 300, 250, 0, 0), 
            getDockTitle = function(v14, v15, v16) --[[ Line: 50 ]] --[[ Name: getDockTitle ]]
                return v14(v15, v16, "Plugin", "WindowTitle");
            end, 
            zIndexBehavior = Enum.ZIndexBehavior.Sibling
        }
    };
    local v18 = v2.build(v17);
    if not v18.pluginLoader:waitForUserInteraction() then
        return;
    else
        require(script.Parent.main)(plugin, v18);
        return;
    end;
end;