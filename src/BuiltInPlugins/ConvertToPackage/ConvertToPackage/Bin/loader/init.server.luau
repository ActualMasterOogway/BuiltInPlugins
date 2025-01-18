require(script.Parent.defineLuaFlags);
local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
local v4 = game:GetService("PackageUIService") or nil;
local v5 = {
    plugin = plugin, 
    pluginName = "ConvertToPackage", 
    translationResourceTable = l_LocalizedStrings_0, 
    fallbackResourceTable = l_SourceStrings_0, 
    overrideLocaleId = nil, 
    localizationNamespace = nil, 
    noToolbar = true, 
    extraTriggers = {
        ["PackageUIService.OnOpenConvertToPackagePlugin"] = function() --[[ Line: 20 ]]
            -- upvalues: v4 (copy)
            return v4.OnOpenConvertToPackagePlugin;
        end or nil
    }
};
local v6 = v1.build(v5);
if not v6.pluginLoader:waitForUserInteraction() then
    return;
else
    require(script.Parent.main)(plugin, v6);
    return;
end;