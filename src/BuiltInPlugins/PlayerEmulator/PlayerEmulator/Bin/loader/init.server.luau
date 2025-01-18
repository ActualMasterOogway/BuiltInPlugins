local l_Parent_0 = script.Parent.Parent;
if require(l_Parent_0.Src.Util.DebugFlags).RunningUnderCLI() then
    return;
else
    local l_RunService_0 = game:GetService("RunService");
    require(script.Parent.defineLuaFlags);
    local v2 = require(l_Parent_0.Src.Util.Constants);
    local v3 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
    local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
    local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
    local v6 = {
        plugin = plugin, 
        pluginName = "PlayerEmulator", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        overrideLocaleId = nil, 
        localizationNamespace = nil, 
        getToolbarName = function() --[[ Line: 25 ]] --[[ Name: getToolbarName ]]
            return "luaPlayerEmulatorToolbar";
        end, 
        buttonInfo = {
            getName = function() --[[ Line: 29 ]] --[[ Name: getName ]]
                return "luaPlayerEmulatorButton";
            end, 
            getDescription = function() --[[ Line: 32 ]] --[[ Name: getDescription ]]
                return "";
            end, 
            icon = "rbxlocaltheme://Player", 
            text = nil, 
            enabled = l_RunService_0:IsEdit()
        }, 
        dockWidgetInfo = nil, 
        shouldImmediatelyOpen = function() --[[ Line: 43 ]] --[[ Name: shouldImmediatelyOpen ]]
            -- upvalues: v2 (copy)
            return plugin:GetSetting(v2.PLUGIN_WIDGET_STATE);
        end
    };
    local v7 = v3.build(v6);
    if not v7.pluginLoader:waitForUserInteraction() then
        return;
    else
        require(script.Parent.main)(plugin, v7);
        return;
    end;
end;