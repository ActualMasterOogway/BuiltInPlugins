require(script.Parent.defineLuaFlags);
local l_Parent_0 = script.Parent.Parent;
if require(l_Parent_0.Src.Util.DebugFlags).RunningUnderCLI() then
    return;
else
    local l_RunService_0 = game:GetService("RunService");
    local v2 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
    local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
    local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
    local l_StudioService_0 = game:GetService("StudioService");
    local v9 = {
        plugin = plugin, 
        pluginName = "GameSettings", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        overrideLocaleId = nil, 
        localizationNamespace = nil, 
        getToolbarName = function() --[[ Line: 25 ]] --[[ Name: getToolbarName ]]
            return "gameSettingsToolbar";
        end, 
        buttonInfo = {
            getName = function() --[[ Line: 29 ]] --[[ Name: getName ]]
                return "gameSettingsButton";
            end, 
            getDescription = function(v6, v7, v8) --[[ Line: 32 ]] --[[ Name: getDescription ]]
                return v6(v7, v8, "General", "PluginDescription");
            end, 
            icon = "rbxlocaltheme://GameSettings", 
            text = nil, 
            clickableWhenViewportHidden = true, 
            enabled = l_RunService_0:IsEdit()
        }, 
        dockWidgetInfo = nil, 
        extraTriggers = {
            ["StudioService.OnOpenGameSettings"] = function() --[[ Line: 43 ]]
                -- upvalues: l_StudioService_0 (copy)
                return l_StudioService_0.OnOpenGameSettings;
            end
        }
    };
    local v10 = v2.build(v9);
    if not v10.pluginLoader:waitForUserInteraction() then
        return;
    else
        require(script.Parent.main)(plugin, v10);
        return;
    end;
end;