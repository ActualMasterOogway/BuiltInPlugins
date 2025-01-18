require(script.Parent.Parent.TestRunner.defineLuaFlags);
local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local v5 = {
    plugin = plugin, 
    pluginName = "PublishPlaceAs", 
    translationResourceTable = l_LocalizedStrings_0, 
    fallbackResourceTable = l_SourceStrings_0, 
    overrideLocaleId = nil, 
    localizationNamespace = nil, 
    noToolbar = true, 
    extraTriggers = {
        ["StudioPublishService.GamePublishFinished"] = function() --[[ Line: 20 ]]
            -- upvalues: l_StudioPublishService_0 (copy)
            return l_StudioPublishService_0.GamePublishFinished;
        end, 
        ["StudioPublishService.GamePublishCancelled"] = function() --[[ Line: 23 ]]
            -- upvalues: l_StudioPublishService_0 (copy)
            return l_StudioPublishService_0.GamePublishCancelled;
        end, 
        ["StudioPublishService.OnSaveOrPublishPlaceToRoblox"] = function() --[[ Line: 26 ]]
            -- upvalues: l_StudioPublishService_0 (copy)
            return l_StudioPublishService_0.OnSaveOrPublishPlaceToRoblox;
        end
    }
};
local v6 = v1.build(v5);
if not v6.pluginLoader:waitForUserInteraction() then
    return;
else
    require(script.Parent.Parent.Src.main)(plugin, v6);
    return;
end;