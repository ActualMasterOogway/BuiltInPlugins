require(script.Parent.defineLuaFlags);
local l_Parent_0 = script.Parent.Parent;
if not require(l_Parent_0.Src.Flags.getFFlagImprovePluginSpeedPivotEditor)() then
    return;
elseif require(l_Parent_0.Src.Utility.DebugFlags).RunningUnderCLI() then
    return;
else
    local v1 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
    local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
    local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
    local v13 = {
        plugin = plugin, 
        pluginName = "EditPivotPlugin", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        overrideLocaleId = nil, 
        localizationNamespace = nil, 
        getToolbarName = function(_, _, _) --[[ Line: 27 ]] --[[ Name: getToolbarName ]]
            return "Pivot";
        end, 
        buttonInfo = {
            getName = function(_, _, _) --[[ Line: 31 ]] --[[ Name: getName ]]
                return "EditPivot";
            end, 
            getDescription = function(_, _, _) --[[ Line: 34 ]] --[[ Name: getDescription ]]
                return "";
            end, 
            icon = "", 
            text = nil
        }
    };
    local v14 = v1.build(v13);
    if not v14.pluginLoader:waitForUserInteraction() then
        return;
    else
        require(script.Parent.main)(plugin, v14);
        return;
    end;
end;