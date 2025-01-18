local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
if not require(l_script_FirstAncestor_0.Src.Util.shouldPluginRun)() then
    return;
elseif v1.RunTests() or v1.RunningUnderCLI() then
    return;
else
    local v2 = require(l_script_FirstAncestor_0.PluginLoader.PluginLoaderBuilder);
    local l_SourceStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.SourceStrings;
    local l_LocalizedStrings_0 = l_script_FirstAncestor_0.Src.Resources.Localization.LocalizedStrings;
    local l_StudioPublishService_0 = game:GetService("StudioPublishService");
    local v6 = {
        plugin = plugin, 
        pluginName = "PublishBlocked", 
        translationResourceTable = l_LocalizedStrings_0, 
        fallbackResourceTable = l_SourceStrings_0, 
        overrideLocaleId = nil, 
        localizationNamespace = nil, 
        noToolbar = true, 
        extraTriggers = {
            ["StudioPublishService.OnPublishAttempt"] = function() --[[ Line: 28 ]]
                -- upvalues: l_StudioPublishService_0 (copy)
                return l_StudioPublishService_0.OnPublishAttempt;
            end
        }
    };
    local v7 = v2.build(v6);
    if not v7.pluginLoader:waitForUserInteraction() then
        return;
    else
        require(script.Parent.publishMain)(plugin, v7);
        return;
    end;
end;